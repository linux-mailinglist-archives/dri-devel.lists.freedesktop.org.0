Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CC3CA182D9
	for <lists+dri-devel@lfdr.de>; Tue, 21 Jan 2025 18:26:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A2BBA10E616;
	Tue, 21 Jan 2025 17:26:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="bxxK3te7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E39E810E616
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Jan 2025 17:26:25 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50LERgCD010199;
 Tue, 21 Jan 2025 17:26:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 NH5vFqueXGx+u5FUmRbpqL7fuKOgWinlCETXY4uHbs8=; b=bxxK3te7Kgw8jGKF
 c2AOL2pDnl6O5oQA7qgO/DVK/+2JJigcJ9LRzh5/A6TUxnY5v8H6JEwRAj6o3wB3
 VWBt2eBzJOoLVd4r7PULWQP6+l/+UswtCBTBCjwfZlyzOF/2JTLjcn7FB4QYz9Jk
 HFytsg7plOhcMEjyScUd5QydOkU614Mv6CNJS7iGPLcVMTiUySTX1AgUX2rdB4Qa
 Bhaz2CNHAQgVsFu2tflchuAiUmsOxJD6xo+QdSiVkMW7N8vZf/msCSb4r6whIqON
 aC72t/hza0RIW/VXsUHeX2/TrIkBb4RIuEpu0bX0RjQD57O82IXOGZKu/QEtnjDh
 aYS+BQ==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44adc48evm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 21 Jan 2025 17:26:20 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 50LHQ5DI028250
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 21 Jan 2025 17:26:05 GMT
Received: from [10.226.59.182] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 21 Jan
 2025 09:26:04 -0800
Message-ID: <516ec099-b382-44d2-dcd3-68f495a09aca@quicinc.com>
Date: Tue, 21 Jan 2025 10:26:03 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [PATCH v2 7/7] accel/qaic: Add AIC200 support
Content-Language: en-US
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
CC: <quic_carlv@quicinc.com>, <quic_yabdulra@quicinc.com>,
 <quic_mattleun@quicinc.com>, <quic_thanson@quicinc.com>,
 <ogabbay@kernel.org>, <lizhi.hou@amd.com>,
 <jacek.lawrynowicz@linux.intel.com>, <linux-arm-msm@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <mhi@lists.linux.dev>
References: <20250117170943.2643280-1-quic_jhugo@quicinc.com>
 <20250117170943.2643280-8-quic_jhugo@quicinc.com>
 <20250121051624.nhest7s6iyh2ll4m@thinkpad>
 <dbf3e688-d7fc-06ab-aee6-3ed1095148c8@quicinc.com>
 <20250121170606.ribist6ayw75bzlv@thinkpad>
From: Jeffrey Hugo <quic_jhugo@quicinc.com>
In-Reply-To: <20250121170606.ribist6ayw75bzlv@thinkpad>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: s66M2IW14-YkxwG0nHq74yirpDKUfmPE
X-Proofpoint-ORIG-GUID: s66M2IW14-YkxwG0nHq74yirpDKUfmPE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-21_07,2025-01-21_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0
 priorityscore=1501 lowpriorityscore=0 spamscore=0 impostorscore=0
 suspectscore=0 adultscore=0 mlxscore=0 phishscore=0 malwarescore=0
 clxscore=1015 mlxlogscore=929 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2411120000 definitions=main-2501210140
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

On 1/21/2025 10:06 AM, Manivannan Sadhasivam wrote:
> On Tue, Jan 21, 2025 at 08:29:32AM -0700, Jeffrey Hugo wrote:
>> On 1/20/2025 10:16 PM, Manivannan Sadhasivam wrote:
>>> On Fri, Jan 17, 2025 at 10:09:43AM -0700, Jeffrey Hugo wrote:
>>>> Add basic support for the new AIC200 product. The PCIe Device ID is
>>>> 0xa110. With this, we can turn on the lights for AIC200 by leveraging
>>>> much of the existing driver.
>>>>
>>>> Co-developed-by: Youssef Samir <quic_yabdulra@quicinc.com>
>>>> Signed-off-by: Youssef Samir <quic_yabdulra@quicinc.com>
>>>> Signed-off-by: Jeffrey Hugo <quic_jhugo@quicinc.com>
>>>
>>> Acked-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
>>
>> Thanks for the reviews/ack.
>>
>> Do you have thoughts on merging the series? I think I could take everything
>> through drm-misc, you could take everything through the MHI tree, or we
>> could split the series by tree with a phased approach.
>>
> 
> You can take the entire series through drm-misc. I don't forsee any core changes
> to the MHI host stack next cycle, so it should be fine. If something pops up in
> the middle, we can do an immutable branch.

Will do.  Thanks!

-Jeff
