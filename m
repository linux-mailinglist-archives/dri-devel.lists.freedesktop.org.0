Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A7D517DBBDC
	for <lists+dri-devel@lfdr.de>; Mon, 30 Oct 2023 15:34:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 315F910E2DD;
	Mon, 30 Oct 2023 14:34:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DBFDC10E0E1
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Oct 2023 14:34:27 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 39UE7tjP002007; Mon, 30 Oct 2023 14:34:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=MtbJrt2MqjihxZ7Yt0ASqk7WtxETTJCJTe4q3VhGZH8=;
 b=HrrTXZJB6QrjtS2SF6s+t0VNt5BTmnUcpOcYK6XrH8JKWDjNZnt+gmfaF2afgny0WXRK
 izs51/S9L/AGQNrp/mdRsvd15KS6BjfUTe3iYqL/0SX2/JFk5i992GBvq+xvxcVAoWNY
 4dfgRNRcLLN1a8hORp7ffXVWO2A724viWd8REZDODPohx4gDdRRi55IBfjtsWGwB1Mpx
 QV8KnYddUbvdxYrxqK7yoOrHmcJft6nTpW49w/O0A0fuJS8nvhdX0HZIyjnRevkZKXO+
 zk2K4B8sklX38C0RUQl9PrA/onG+Trdm3bJk86aO/+d78Nyn/9lGNd1uhUoApFv2IypA LA== 
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3u0sw7v20u-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 30 Oct 2023 14:34:22 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 39UEYLm4018289
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 30 Oct 2023 14:34:21 GMT
Received: from [10.226.59.182] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.39; Mon, 30 Oct
 2023 07:34:20 -0700
Message-ID: <0242537a-26f9-76a7-7328-5db4d1aaeacc@quicinc.com>
Date: Mon, 30 Oct 2023 08:34:20 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [PATCH 01/11] accel/ivpu: Update FW API
Content-Language: en-US
To: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
References: <20231025094323.989987-1-stanislaw.gruszka@linux.intel.com>
 <20231025094323.989987-2-stanislaw.gruszka@linux.intel.com>
 <c83b4b50-fb25-6888-deb3-0a1e6a27165d@quicinc.com>
 <ZTy/RbjBxVgELWTk@linux.intel.com>
From: Jeffrey Hugo <quic_jhugo@quicinc.com>
In-Reply-To: <ZTy/RbjBxVgELWTk@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: Z64FG-7LM9V9JkTBWUHOeGMu5jUnG99l
X-Proofpoint-GUID: Z64FG-7LM9V9JkTBWUHOeGMu5jUnG99l
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-30_10,2023-10-27_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=933 clxscore=1015
 phishscore=0 lowpriorityscore=0 spamscore=0 malwarescore=0
 priorityscore=1501 adultscore=0 bulkscore=0 impostorscore=0 suspectscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2310240000 definitions=main-2310300111
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
Cc: Oded Gabbay <ogabbay@kernel.org>,
 Krystian Pradzynski <krystian.pradzynski@linux.intel.com>,
 Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 10/28/2023 1:59 AM, Stanislaw Gruszka wrote:
> Hi
> 
> On Fri, Oct 27, 2023 at 08:37:39AM -0600, Jeffrey Hugo wrote:
>> On 10/25/2023 3:43 AM, Stanislaw Gruszka wrote:
>>> From: Krystian Pradzynski <krystian.pradzynski@linux.intel.com>
>>>
>>> Bump boot API to 4.20
>>> Bump JSM API to 3.15
>>>
>>> Signed-off-by: Krystian Pradzynski <krystian.pradzynski@linux.intel.com>
>>> Reviewed-by: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
>>> Signed-off-by: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
>>> ---
> <snip>
>>>    /*
>>> @@ -89,6 +98,14 @@ enum VPU_BOOT_L2_CACHE_CFG_TYPE {
>>>    	VPU_BOOT_L2_CACHE_CFG_NUM = 2
>>>    };
>>> +/** VPU MCA ECC signalling mode. By default, no signalling is used */
>>
>> This does not look like valid kernel-doc.  Maybe you wanted "/*" instead?
>>
>>> +enum VPU_BOOT_MCA_ECC_SIGNAL_TYPE {
>>> +	VPU_BOOT_MCA_ECC_NONE = 0,
>>> +	VPU_BOOT_MCA_ECC_CORR = 1,
>>> +	VPU_BOOT_MCA_ECC_FATAL = 2,
>>> +	VPU_BOOT_MCA_ECC_BOTH = 3
>>
>> Personal preference, but having the "=" and the interget values all line up
>> vetrically would make this a bit more plesant to look at.
> 
> This file came from FW and I'm reluctant to make any changes here, even
> formatting. I'll ask if in the future we can get some improvements of
> formatting done by scripts or if FW can change their files.

Fair enough.  I do remember you mentioning some of the headers coming 
from FW.

-Jeff
