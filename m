Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 866CA97CB40
	for <lists+dri-devel@lfdr.de>; Thu, 19 Sep 2024 17:01:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D98CC10E2B9;
	Thu, 19 Sep 2024 15:01:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="EluOQG+e";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6EC5B10E2B9
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Sep 2024 15:01:05 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48JAS75E027505;
 Thu, 19 Sep 2024 15:00:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 vLw9cYn82I5U6HjJdEtejWm+SXNTfIGz8BTQuDN+ooI=; b=EluOQG+e9zif3WkS
 NmvO8xIDMNOlOHSXTb1pzhUe8x7wc3K/SlIkbWDbr743jD+/L43bepRmk4ipeJ+b
 wSMSWiDAKNMjVspqEcWrqpcmM8oQL2aF/3Ad4vF4wH9tRL03CghfadLSUtvHFHQp
 N+grGzFCMuEn6E5wwTmZ86xwtuDG2rmO/XStHCT77H7UEggmmI1jX+OqiZwroljz
 rTXxSJiM7f0pVuWxnNtw+omR0N5/G6CvMjbUA/yzZkUli9cHWdFKPlCSHa06yTLf
 qcb9cPqAqzO1RORj31zPanKGGzs5jwLDoO/Ijl9opWBh3+HBubHU1hhqKg0ycbX0
 Qolpxg==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41n4gnwr87-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 19 Sep 2024 15:00:55 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 48JF0sbX025300
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 19 Sep 2024 15:00:54 GMT
Received: from [10.226.59.182] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 19 Sep
 2024 08:00:54 -0700
Message-ID: <5e173c63-ff79-d61c-3c85-887dc08a3fff@quicinc.com>
Date: Thu, 19 Sep 2024 09:00:29 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [PATCH] accel/qaic: Add crashdump to Sahara
Content-Language: en-US
To: Konrad Dybcio <konradybcio@kernel.org>, <andersson@kernel.org>,
 <jacek.lawrynowicz@linux.intel.com>, <quic_carlv@quicinc.com>
CC: <ogabbay@kernel.org>, <linux-arm-msm@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>
References: <20240918155254.3186031-1-quic_jhugo@quicinc.com>
 <630b2044-eaec-4a8a-bd29-d20751d33e2f@kernel.org>
From: Jeffrey Hugo <quic_jhugo@quicinc.com>
In-Reply-To: <630b2044-eaec-4a8a-bd29-d20751d33e2f@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: Vuu4e4NILdQYs1MvxImeLQO7LzAwCNcv
X-Proofpoint-ORIG-GUID: Vuu4e4NILdQYs1MvxImeLQO7LzAwCNcv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 adultscore=0
 mlxlogscore=999 malwarescore=0 suspectscore=0 clxscore=1011 phishscore=0
 lowpriorityscore=0 bulkscore=0 impostorscore=0 priorityscore=1501
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2408220000 definitions=main-2409190099
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 9/18/2024 5:41 PM, Konrad Dybcio wrote:
> On 18.09.2024 5:52 PM, Jeffrey Hugo wrote:
>> The Sahara protocol has a crashdump functionality. In the hello
>> exchange, the device can advertise it has a memory dump available for
>> the host to collect. Instead of the device making requests of the host,
>> the host requests data from the device which can be later analyzed.
>>
>> Implement this functionality and utilize the devcoredump framework for
>> handing the dump over to userspace.
>>
>> Similar to how firmware loading in Sahara involves multiple files,
>> crashdump can consist of multiple files for different parts of the dump.
>> Structure these into a single buffer that userspace can parse and
>> extract the original files from.
>>
>> Reviewed-by: Carl Vanderlip <quic_carlv@quicinc.com>
>> Signed-off-by: Jeffrey Hugo <quic_jhugo@quicinc.com>
>> ---
> 
> I gave this a brief read, but.. aren't you dumping however much DRAM the
> AIC100 has (and then some SRAM) onto the host machine without the user
> asking for it (i.e. immediately after the AIC crashes)?

I'm not entirely clear what the concern is.  Too much host RAM usage maybe?

In short, I think the direct answer is yes and no.

We put the dump content in the host RAM and allow the user to decide if 
they want to save it.  The user has 5 minutes to do something with the 
dump, then the devcoredump framework automatically frees the content in 
RAM.  Typically the user would access the sysfs file provided by 
devcoredump, and save the contents to the file system for offline 
processing.

There are a few other GPUs and several other devices that do the same. 
Panfrost appears to save every BO the user allocated into the dump, 
which would suggest that the user could create an arbitrarily large dump.

In the case of AIC100, it is technically possible for the entire device 
DRAM and SRAM to be offloaded.  That is up to the FW to decide if all of 
that is relevant.  Current implementation of the FW is heavily 
aggressive on what it selects for the dump, and current dumps are in the 
100-200MB range.

It feels like you are implying the user should somehow request the dump 
by having devcoredump publish something, and then hook into the user's 
reads of the sysfs to go collect the dump.  I worry that means the 
driver would then need to determine when there is no user interested in 
collecting the dump, in order to continue the reboot process.  I expect 
that would be a 5 minute delay (devcoredump deciding there is no user 
interest after 5 minutes).  I worry that users would object to such a 
delay given customer feedback we've had on getting the devices into 
service quickly.

-Jeff
