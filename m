Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2991F9E447E
	for <lists+dri-devel@lfdr.de>; Wed,  4 Dec 2024 20:21:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 134BC10E563;
	Wed,  4 Dec 2024 19:21:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="ajNLWKeG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 800B610E563;
 Wed,  4 Dec 2024 19:21:37 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B4GXaCD023317;
 Wed, 4 Dec 2024 19:21:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 4U2a+iogl9VHRsnyNgkVeDFo4vdPT+GZFNYfMDV4B8Q=; b=ajNLWKeG8XnRXwzR
 sE/RYcmfZN88Yo0v/2Tsa/B6Yli6kX0pz2ugKKgtTR8XLRZaBiQKW5tnCFzyDUjG
 hah7gkMHf3/ny2P0+5hTfTmzFSpelJGn2vvpNcM6xky+llTrOhmkuUxx6icNuhE3
 Dw15nTS7TExFUFgBMKzUhjR/LrcY79Wwo+WC3JpR4KuQkVvO8Et1HvJks5EXKxWu
 xBPp+vfIhHJrYCL55dzy/iwpbQacAfrcmQ63ZEFzrhjvG8RPCh3LOeqI5rBLdQSg
 DME20U/hFTlJzfEYu/uYx7VNF2C/U8/pFwKL1gqXx6quBWwfBUXN8tfHdteIFtqA
 0uANpQ==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43aj429ymc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 04 Dec 2024 19:21:29 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4B4JLS6K018655
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 4 Dec 2024 19:21:28 GMT
Received: from [10.71.110.107] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 4 Dec 2024
 11:21:27 -0800
Message-ID: <20a3955e-3d10-47c5-8e68-d70342805010@quicinc.com>
Date: Wed, 4 Dec 2024 11:21:26 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/ci: add kms_cursor_legacy@torture-bo to apq8016 flakes
To: Helen Mae Koike Fornazier <helen.koike@collabora.com>
CC: Rob Clark <robdclark@gmail.com>, Dmitry Baryshkov
 <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, Marijn Suijten
 <marijn.suijten@somainline.org>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>, dri-devel
 <dri-devel@lists.freedesktop.org>, freedreno
 <freedreno@lists.freedesktop.org>
References: <20241204-cursor_tor_skip-v1-1-f5f0bba5df7b@quicinc.com>
 <193931869a5.f923adf2270026.8321075661083367617@collabora.com>
Content-Language: en-US
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <193931869a5.f923adf2270026.8321075661083367617@collabora.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: -yi9Rln1Vs3X-sbEcRIRKWHjdiusp5_y
X-Proofpoint-ORIG-GUID: -yi9Rln1Vs3X-sbEcRIRKWHjdiusp5_y
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0
 mlxscore=0 mlxlogscore=999 lowpriorityscore=0 clxscore=1015 malwarescore=0
 priorityscore=1501 spamscore=0 adultscore=0 suspectscore=0 impostorscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2411120000
 definitions=main-2412040148
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

Hi Helen

On 12/4/2024 11:14 AM, Helen Mae Koike Fornazier wrote:
> Hi Abhinav,
> 
> Thanks for your patch.
> 
> 
> 
> ---- On Wed, 04 Dec 2024 15:55:17 -0300 Abhinav Kumar  wrote ---
> 
>   > From the jobs [1] and [2] of pipeline [3], its clear that
>   > kms_cursor_legacy@torture-bo is most certainly a flake and
>   > not a fail for apq8016. Mark the test accordingly to match the results.
>   >
>   > [1] : https://gitlab.freedesktop.org/drm/msm/-/jobs/67676481
>   > [2] : https://gitlab.freedesktop.org/drm/msm/-/jobs/67677430
>   > [3]: https://gitlab.freedesktop.org/drm/msm/-/pipelines/1322770
>   >
>   > Signed-off-by: Abhinav Kumar quic_abhinavk@quicinc.com>
>   > ---
>   >  drivers/gpu/drm/ci/xfails/msm-apq8016-flakes.txt | 5 +++++
>   >  1 file changed, 5 insertions(+)
>   >
>   > diff --git a/drivers/gpu/drm/ci/xfails/msm-apq8016-flakes.txt b/drivers/gpu/drm/ci/xfails/msm-apq8016-flakes.txt
>   > new file mode 100644
>   > index 000000000000..18639853f18f
>   > --- /dev/null
>   > +++ b/drivers/gpu/drm/ci/xfails/msm-apq8016-flakes.txt
>   > @@ -0,0 +1,5 @@
>   > +# Board Name: msm-apq8016-db410c
>   > +# Failure Rate: 100
> 
> Is failure rate is 100%, isn't it a fail than?
> (I know we have other cases with Failure Rate: 100, maybe we should fix them as well)
> 

Maybe I misunderstood the meaning of "Failure rate" for a flake.

I interpreted this as this test being flaky 100% of the time :)

Out of the 3 runs of the test, it passed 2/3 times and failed 1/3.

So its fail % actually is 33.33% in that case.

I think I saw a Failure rate of 100% on msm-sm8350-hdk-flakes.txt and 
mistook that as the rate at which flakes are seen.

Let me fix this up as 33%

> Regards,
> Helen
> 
>   > +# IGT Version: 1.28-ga73311079
>   > +# Linux Version: 6.12.0-rc2
>   > +kms_cursor_legacy@torture-bo
>   >
>   > ---
>   > base-commit: 798bb342e0416d846cf67f4725a3428f39bfb96b
>   > change-id: 20241204-cursor_tor_skip-9d128dd62c4f
>   >
>   > Best regards,
>   > --
>   > Abhinav Kumar quic_abhinavk@quicinc.com>
>   >
>   >
> 
