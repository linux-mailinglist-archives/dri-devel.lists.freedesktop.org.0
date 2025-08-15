Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CBD5FB28838
	for <lists+dri-devel@lfdr.de>; Sat, 16 Aug 2025 00:15:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4FD0B10E29C;
	Fri, 15 Aug 2025 22:15:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZYORBlw2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7182F10E29C
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Aug 2025 22:15:28 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57FEJmEW031320
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Aug 2025 22:15:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 vLwoZ01402e5OUdx+YObu7+diNTS+/oRxZLwC4jp6ok=; b=ZYORBlw2Y0wJA99p
 ZFQw/o9vfPMrDngZv/ZJrpowjeNtqjCvXoPnz8dwFhXQMh0hnRNlXrMyZ7OxaWQU
 2GrkL9yVwR22+jBq1SA2HN9k3vcRN8Zg9hY4rWLL4sO/VFkEjHZ0J6IjbOBKYhUZ
 2BIGXaeqjD7iN7mbiwO0wrvNv/6SBiXzY8GJ18sMTQbLE34ub381+H0PWg1/1ZKD
 Bd/ciQtTPW4pNNf+09k3IZ6mIb5jjk6Aro/Yv0ShHBGdpLSZGpCC9pHFKZ6UzQz/
 zURKTzyASfE5/CQ+uIqc7BzDHtNVJX5GGmcdh4QZYCxu1ykctE+D6vSycS+7MENN
 Z7trfw==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48fm3vy68p-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Aug 2025 22:15:27 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id
 6a1803df08f44-70a88de16c0so49510176d6.0
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Aug 2025 15:15:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755296126; x=1755900926;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=vLwoZ01402e5OUdx+YObu7+diNTS+/oRxZLwC4jp6ok=;
 b=aAmydUexCG8oZh7zyXerHpPwM5VtqC2fhzyMkHjmC3O1oOk9eH3JdtPOz1FrHyt9Vf
 QXR3UxwzKfjgsZSGnAT3umjwwXeqxs4beVqngfVr2JCmATujUOzHFlhEGkm0SPOwbSRY
 8fRWxLw+j4Bv+KZ4QSgw4hKO6fNdtg8HXhGR+Tw6ZTXerOBgEISa2zk6qtbta/8asuCC
 vzj4SuvE88BMmwEcuocAeTCx2qHfrnyiLWZG79odXROC3p5zkioyHlK9R/0nvtPjpm37
 iqjGgaAcr5bC+o9GIXMAzkb7qGtJ7aAcB33m8ZZ7az5YX+xRr89E/okuRq6N6hhFsZGx
 ftfw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXzCc7UO4J6BQKcHy2nqFITvXHpKnStBt7gEAF/n8TXvnCd8keGWIUdf4XApQ9nTP+vAaAHmkuASw0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YykL169KuQ89OK8Q0etz5Ujb66CLVlvQzktByLbw8YjrS974Csm
 R0pFCPosz9Csns7OnWQ639hVYkqYgEtQxDvvUwoDprdplFnzKRjnz4MZlIcbkemTmKgSi9q/pq9
 7wMMQvmxC9cZXw7FIwhWhUIR6WgQ2nkMK7pEoDnauxh3jtFDfCliyOT6NNOH+LJAmW2t6mIo=
X-Gm-Gg: ASbGncsv8GjjN9gqbay+nZkwES7MpS/gCxgVzFcNuchz96iPn2nXkfnVVI/uXK5FzOk
 DEKSeH3ffuOmO3+koBBzbkHiVvt+QlluuF1cSDnEOWIHsWgd88dR9p7FsVV6QWuF86JzVnzxMGD
 jC++KVRQhWlLgjia1QPbKZ80dLRwyxHbVV3S1hqCViX/BUjyg+wqAVoVGswqFB0Q5sofhEECIKv
 YEvcXnvPmncjmrsqE9n0zzcfaiJY+CWH1x9+AMR4JMUldSL3Dkcr5ZvPLHslj+Nur5Do775xaee
 Eho/TmJ360ocEKBXM+U2/zKMBwZKvN7mLF93tHym0J4lmZy3HUH/Kovd+LPCg4nc2ECxvkDRZiV
 Z5wVJE0tmjydcxY3GmcgiUsj1feeNrcPHAhasoAPtjJYdx2W1Qmws
X-Received: by 2002:a05:6214:1c47:b0:709:b94b:a6ad with SMTP id
 6a1803df08f44-70bb060c40bmr6445246d6.29.1755296126528; 
 Fri, 15 Aug 2025 15:15:26 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHetHJNt5dVNj424oIDhrEYTzfBXQUTAzwS+BLLxQUPTiMlfCIGu7YxB8m6v/QsySngCnMZ7A==
X-Received: by 2002:a05:6214:1c47:b0:709:b94b:a6ad with SMTP id
 6a1803df08f44-70bb060c40bmr6444836d6.29.1755296125981; 
 Fri, 15 Aug 2025 15:15:25 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-3340a41d5a0sm5871491fa.2.2025.08.15.15.15.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Aug 2025 15:15:25 -0700 (PDT)
Date: Sat, 16 Aug 2025 01:15:21 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] drm/msm: adreno: a6xx: enable GMU bandwidth voting
 for x1e80100 GPU
Message-ID: <ihpfgzrl4xizlhpm2w53oesmdhc63cwbjwq43ano7avbrd6emb@qjdgnzxsoo35>
References: <20250725-topic-x1e80100-gpu-bwvote-v2-1-58d2fbb6a127@linaro.org>
 <e7ddfe18-d2c7-4201-a271-81be7c814011@oss.qualcomm.com>
 <33442cc4-a205-46a8-a2b8-5c85c236c8d4@oss.qualcomm.com>
 <b4f283ce-5be1-4d2f-82e2-e9c3be22a37f@oss.qualcomm.com>
 <269506b6-f51b-45cc-b7cc-7ad0e5ceea47@linaro.org>
 <1727374d-0461-4442-ab35-9acb8ef7f666@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1727374d-0461-4442-ab35-9acb8ef7f666@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODExMDEwNyBTYWx0ZWRfXxP6kZ6JXu7qw
 D46sPqq6ugXK9nuXWji6QAFhKuMN0yp+SY6IpB9Z3DJT5BOxmDIPfYBrvf3VhKKvL1Jbd1CAxYh
 Ho2sYA8SOmzAW9Dh6pjUel9bPRQBtxPyiLHPwrpanJcxCRFPrpin7oLv7BhW1onbmCBd54tLRxc
 ze5llS+QAKRs668tp922FZvpLh74Yr5GkXjGX4i9Vbuq3nt/S2Hb0Q/PDM+IwWHs10uJD601AhR
 ZDxL7Ia1HhuRixLk0teHiLfNDvcjQ61o39VXjaF7xj7CUCn7Z/6D8RTLVAe82Mu6Cy/ZOmVChVJ
 aymfad4m0Hbmq20iWtTJjNkDdXBAujDK/kAWJwC0kTbcfnbvKLE/tPiiME+yoy4FkIkZc4baHXU
 UoYM0IJl
X-Proofpoint-GUID: pT7Nt2nID5KFq3VhacimB4n_DIbHXUR7
X-Authority-Analysis: v=2.4 cv=A+1sP7WG c=1 sm=1 tr=0 ts=689fb17f cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=2OwXVqhp2XgA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8
 a=2EPmbxBH5dp_UOPDRz4A:9 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: pT7Nt2nID5KFq3VhacimB4n_DIbHXUR7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-15_08,2025-08-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 priorityscore=1501 malwarescore=0 spamscore=0
 phishscore=0 clxscore=1015 adultscore=0 bulkscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508110107
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

On Thu, Aug 14, 2025 at 10:08:26PM +0530, Akhil P Oommen wrote:
> On 8/14/2025 7:56 PM, Neil Armstrong wrote:
> > Hi,
> > 
> > On 14/08/2025 13:22, Konrad Dybcio wrote:
> >> On 8/14/25 1:21 PM, Konrad Dybcio wrote:
> >>> On 7/31/25 12:19 PM, Konrad Dybcio wrote:
> >>>> On 7/25/25 10:35 AM, Neil Armstrong wrote:
> >>>>> The Adreno GPU Management Unit (GMU) can also scale DDR Bandwidth
> >>>>> along
> >>>>> the Frequency and Power Domain level, but by default we leave the
> >>>>> OPP core scale the interconnect ddr path.
> >>>>>
> >>>>> Declare the Bus Control Modules (BCMs) and the corresponding
> >>>>> parameters
> >>>>> in the GPU info struct to allow the GMU to vote for the bandwidth.
> >>>>>
> >>>>> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> >>>>> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> >>>>> ---
> >>>>> Changes in v2:
> >>>>> - Used proper ACV perfmode bit/freq
> >>>>> - Link to v1: https://lore.kernel.org/r/20250721-topic-x1e80100-
> >>>>> gpu-bwvote-v1-1-946619b0f73a@linaro.org
> >>>>> ---
> >>>>>   drivers/gpu/drm/msm/adreno/a6xx_catalog.c | 11 +++++++++++
> >>>>>   1 file changed, 11 insertions(+)
> >>>>>
> >>>>> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c b/drivers/
> >>>>> gpu/drm/msm/adreno/a6xx_catalog.c
> >>>>> index
> >>>>> 00e1afd46b81546eec03e22cda9e9a604f6f3b60..892f98b1f2ae582268adebd758437ff60456cdd5 100644
> >>>>> --- a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
> >>>>> +++ b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
> >>>>> @@ -1440,6 +1440,17 @@ static const struct adreno_info a7xx_gpus[] = {
> >>>>>               .pwrup_reglist = &a7xx_pwrup_reglist,
> >>>>>               .gmu_chipid = 0x7050001,
> >>>>>               .gmu_cgc_mode = 0x00020202,
> >>>>> +            .bcms = (const struct a6xx_bcm[]) {
> >>>>> +                { .name = "SH0", .buswidth = 16 },
> >>>>> +                { .name = "MC0", .buswidth = 4 },
> >>>>> +                {
> >>>>> +                    .name = "ACV",
> >>>>> +                    .fixed = true,
> >>>>> +                    .perfmode = BIT(3),
> >>>>> +                    .perfmode_bw = 16500000,
> >>>>
> >>>> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> >>>
> >>> Actually no, BIT(3) is for the CPU (OS), GPU should use BIT(2)
> 
> You are right that BIT(2) is GPU specific, but that support was
> commercialized from A7XX_GEN3. Anyway, the Win KMD uses BIT(2), so lets
> use that in Linux too.
> 
> I know some docs show BIT(2) support, but lets not bring in untested
> configurations.
> 

I'd say, I can't parse the comment. Should we use BIT(2) or BIT(3) here?

> -Akhil.
> 
> >>
> >> This is *very* platform-dependent, goes without saying..
> >>
> >> I see BIT(2) is also valid for X1P4
> > 
> > 
> > I'm confused, Akhil can you confirm ?
> > 
> > Neil>
> >>
> >> Konrad
> > 
> 

-- 
With best wishes
Dmitry
