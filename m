Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 810C09FB60B
	for <lists+dri-devel@lfdr.de>; Mon, 23 Dec 2024 22:22:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1215510E041;
	Mon, 23 Dec 2024 21:22:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="LMYnSVOz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 39EE010E041;
 Mon, 23 Dec 2024 21:22:53 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BNHTi6i018497;
 Mon, 23 Dec 2024 21:22:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 hS/Y6yW1s5W3mihcvs63v+xACZBKR+LeKoO5/HhiemY=; b=LMYnSVOz4RnYrJ2P
 3qmHhh/lKumW1F96KRugLHOeNDCVx0XCOYRbrW9EJLGlKK7vSPWXddp/UR0LhN96
 LNwc5ranpiQOie+IiHZiXa8rmQ85R3I/bs9ejvT9CJEAs750VlPZ2wuphGcgiRsU
 ZMcZwgFhVskxTlFvVjMKJrdCZzTm+l4cZaHJZPezpqrqqfi5dZoRH9nsKM5UOMpF
 JHkgOgBa6v+iQYntgnJSykOX3gyZw5ZorVMXRnsmlAAI/3e2HKhoLrGutJEI/cEP
 DqU4eJAo9ONklkHs5YtbFsYPwc6LI8uOowYJPeXe8P+C8QrcMfXt/LXz9xf9B/Cn
 L97mOg==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43qca18ftj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 23 Dec 2024 21:22:47 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BNLMk2R007617
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 23 Dec 2024 21:22:46 GMT
Received: from [10.216.35.172] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 23 Dec
 2024 13:22:42 -0800
Message-ID: <7f5144e2-1c28-4e12-a9eb-1e8c8220bbcf@quicinc.com>
Date: Tue, 24 Dec 2024 02:52:39 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] drm/msm/a6xx: Add support for Adreno 612
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Konrad Dybcio
 <konrad.dybcio@oss.qualcomm.com>
CC: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, "Konrad
 Dybcio" <konradybcio@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <freedreno@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 Jie Zhang <quic_jiezh@quicinc.com>
References: <20241213-a612-gpu-support-v3-1-0e9b25570a69@quicinc.com>
 <df25ffe5-b20c-41a7-b178-b191d332cb19@oss.qualcomm.com>
 <jsuzytkpcs7xmsaaedypz6w5d4ia6rckxjqg2x7mp4sidxxtqk@t5ukbn3sv6oa>
Content-Language: en-US
From: Akhil P Oommen <quic_akhilpo@quicinc.com>
In-Reply-To: <jsuzytkpcs7xmsaaedypz6w5d4ia6rckxjqg2x7mp4sidxxtqk@t5ukbn3sv6oa>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: gItu9bQFWmhLTxfGFLF4gP4wsBU5_xJl
X-Proofpoint-GUID: gItu9bQFWmhLTxfGFLF4gP4wsBU5_xJl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0
 impostorscore=0 lowpriorityscore=0 spamscore=0 bulkscore=0 phishscore=0
 mlxscore=0 suspectscore=0 mlxlogscore=999 clxscore=1015 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2411120000
 definitions=main-2412230189
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

On 12/21/2024 2:28 AM, Dmitry Baryshkov wrote:
> On Fri, Dec 20, 2024 at 08:56:31PM +0100, Konrad Dybcio wrote:
>> On 13.12.2024 12:46 PM, Akhil P Oommen wrote:
>>> From: Jie Zhang <quic_jiezh@quicinc.com>
>>>
>>> Add support for Adreno 612 GPU found in SM6150/QCS615 chipsets.
>>> A612 falls under ADRENO_6XX_GEN1 family and is a cut down version
>>> of A615 GPU.
>>>
>>> A612 has a new IP called Reduced Graphics Management Unit or RGMU
>>> which is a small state machine which helps to toggle GX GDSC
>>> (connected to CX rail) to implement IFPC feature. It doesn't support
>>> any other features of a full fledged GMU like clock control, resource
>>> voting to rpmh etc. So we need linux clock driver support like other
>>> gmu-wrapper implementations to control gpu core clock and gpu GX gdsc.
>>> Since there is no benefit with enabling RGMU at the moment, RGMU is
>>> entirely skipped in this patch.
>>>
>>> Signed-off-by: Jie Zhang <quic_jiezh@quicinc.com>
>>> Signed-off-by: Akhil P Oommen <quic_akhilpo@quicinc.com>
>>> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>>> ---
>>
>> So we talked offline a bit, and the RGMU requires a piece of firmware.
>>
>> We concluded it's best to describe that from the get-go, so that the
>> user doesn't get surprised when a new kernel update brings new firmware
>> requirements for previously-working hardware.
> 
> I'd say, please make sure that the RGMU firmware is also a part of the
> linux-firmware from the beginning.

Yes, I am working on that part. I will send another revision of this patch.

-Akhil

> 
>>
>> Please wait for the new revision.
>>
>> Konrad
> 

