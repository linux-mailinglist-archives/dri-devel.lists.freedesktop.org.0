Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CF64B180B1
	for <lists+dri-devel@lfdr.de>; Fri,  1 Aug 2025 13:06:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7BD7510E838;
	Fri,  1 Aug 2025 11:06:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="dohDivY4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 147D510E837
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Aug 2025 11:06:37 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5719HGWs018768
 for <dri-devel@lists.freedesktop.org>; Fri, 1 Aug 2025 11:06:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 ohWu67k8HbB1UHHgamfp/0d6mH0sfNTpA38ZH8ZkldA=; b=dohDivY4oMDnATkk
 9f3S5ewE+CnZH6drV6sJiaPFu79g8KwUmK1qSZotlj7Jz6PpXUERiuce7hPYY/0E
 sS4oMIM43AuHQUY9wkgmjUFAoNrxyNQ001t0hhrEvuRTou7AD0uGLLPw5T47nty5
 ZAs1EaEOE50dT7TkJTx5AFYM3nB7RD8CzIZZtoSF2v9GjawdM5N1pNDQ/9BuClr2
 JwzP/xWTJ6v5xrOv3yz7BKLY6SUlrEERx2JD5DXT4Z0AI8oerg7FLDeGpQCUSDjo
 VZIjgx3ye3rXw9eLv+wa/tWoomrd2QkFh1e1zDK3cXC3ji/11SjfaC1Q60mwXjE2
 2Ysz+A==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com
 [209.85.217.72])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 487jwgg53c-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 01 Aug 2025 11:06:36 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id
 ada2fe7eead31-4fbffa43e85so298613137.0
 for <dri-devel@lists.freedesktop.org>; Fri, 01 Aug 2025 04:06:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754046395; x=1754651195;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ohWu67k8HbB1UHHgamfp/0d6mH0sfNTpA38ZH8ZkldA=;
 b=Wendcp8e+wQ7CKrmZtit1HNE4fuYRNWMwQn7Ct73+uiwyGUvQV1Zg51DAJCd6NPFQW
 /1bFW+oJjjlKa44tPRUOsNr5GL693hUsJplFk/itBD2702AKZSDhsJCsbAQFgIfM5s82
 bkx1yATV9RkpEmz8DsHfM+Elq96eL7kCW4gvCEObUatMXdk23OekW1JgCxQ702aIlN3J
 uCqSC77xdcYD/m0IlpLsb/e7EMeBriLd3uvhY1Ca9vhykliwizDHIbWqaPTQ/ms0VPYn
 rYaYJQVu1a8SxaaS6vwBn2yGSCvMJn+cssbaflcfEagAydv2JCmfPj2dtMWu2cbuK90v
 +LgA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXIYrtOaaXroAUP1CamXhEFgj6cBN9BzovLc03fvcfE+hE5tfFVzw/uITL7IDkN1EZk9KLDmXXDOcQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxWtncubvZFsD4hUHBpMqUxnvhyVxoo3N7WDyD1+Qja+79/lu+j
 +2ih0SvJXyQTgw2u6LcsyeukOO/xPPjVE/7U0B+DuFJ1lb8Bl20gcMdxltKpfy3GR16KpNa67AE
 WQtiYc4gz+rs3RkUT1BzWeQHaRZarXcP0IjAw2pTgA9Qbw7G/Mb9UfFe0DUFZK+J5Ffj89yE=
X-Gm-Gg: ASbGncvqB6tO4PcMqdClC4m7wDK5gcMcvElgoeN+bCEi2rs7got5U8eJQIBLgkYubTY
 Q2qauf15g/vMvdCNZL47lUQZPlfKt1hENkykfpyxIRpIsCNSksrfheR6OAvBsb363G7+7LEKIRp
 b5aobnHhMcytudt2dNC0n2XONiBCkR7ZujV1AN7/BVYZGVkt795Fq9v8C08uRiI6uIchKjjtCEt
 nNaJ7wEge6pFX0qIyI9jwFfXPf3iw20EWfglCr0ldqxY790H946hZIuIBFJtV+81iz4pt3r3dGx
 i3iXYe8Er0SZE4OOdBR7D1aDwcHzTE7wLM4qOSb5VwZZr0F0lSZJcuuVpG8UHU/unT8P/5qDAl6
 luGLm/tr2E8Qwd29XnCu2BTqn9CZCp2JelA9q/EMuUCVEc1HK9uGh
X-Received: by 2002:a05:6102:d8d:b0:4e5:9426:f9e6 with SMTP id
 ada2fe7eead31-4fbe88fea36mr6776838137.23.1754046395043; 
 Fri, 01 Aug 2025 04:06:35 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IELXu+i98JlBWaD9NFVhCHmgXrDjDlJp2pJeGlNotCFdOuNkns+rDbVOGaCSxMcLE/OBy1MTg==
X-Received: by 2002:a05:6102:d8d:b0:4e5:9426:f9e6 with SMTP id
 ada2fe7eead31-4fbe88fea36mr6776774137.23.1754046394479; 
 Fri, 01 Aug 2025 04:06:34 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-55b889ac767sm537574e87.68.2025.08.01.04.06.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Aug 2025 04:06:33 -0700 (PDT)
Date: Fri, 1 Aug 2025 14:06:31 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Jun Nie <jun.nie@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v13 10/12] drm/msm/dpu: support SSPP assignment for
 quad-pipe case
Message-ID: <akxp2lpikvslacz72gvp3ctzdgsrbfnth4ugqfhbxvflmr6ssu@f4ebi3tyz3am>
References: <20250728-v6-16-rc2-quad-pipe-upstream-v13-0-954e4917fe4f@linaro.org>
 <20250728-v6-16-rc2-quad-pipe-upstream-v13-10-954e4917fe4f@linaro.org>
 <4dpeif7wynynbsccbhc253wkshuylnsjslsosmrnyld3bmot5l@yqrmpln44qe2>
 <CABymUCMa06E0zavQsKeDw_rjTW5F9o4ancxWuQynMO3wsHKFwA@mail.gmail.com>
 <4c492060-cdde-43c6-8351-d969b0f9322b@oss.qualcomm.com>
 <CABymUCO63-V7MoWpgCTEV_8R_4rVHM-1=eyRP34=OdKGpYSLDQ@mail.gmail.com>
 <c7346b52-c5a0-4aa2-a8d4-92761e33b011@oss.qualcomm.com>
 <CABymUCPgXAaJCLTiN1XxK1JEjxnr9qPye_E6gMLSMvEhgXJk6w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CABymUCPgXAaJCLTiN1XxK1JEjxnr9qPye_E6gMLSMvEhgXJk6w@mail.gmail.com>
X-Authority-Analysis: v=2.4 cv=WvgrMcfv c=1 sm=1 tr=0 ts=688c9fbc cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=2OwXVqhp2XgA:10 a=sWKEhP36mHoA:10 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8
 a=K2Uce_oDiRnA2C7xoV4A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=-aSRE8QhW-JAV6biHavz:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: FSfVqyqIfryKzitSmhbN1SLPeNqPORGZ
X-Proofpoint-GUID: FSfVqyqIfryKzitSmhbN1SLPeNqPORGZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODAxMDA3OSBTYWx0ZWRfX+cX0Jvn2HV+H
 hApylsAAeUwzuAiVUwDzuHOfZeY516AkyztU0GFgNI1XR0WVQJrVROdSnRDkkgo/QZ2niZ2xr59
 D3mOixDTJ7E3iiCNWTIlLa+3C0kRVaWfHv7dyeavaatFxEUt4gN5Hu5paK5WrNfF67Rfe9kZEBf
 NYofXN5COUFOgA3N2TcLUxoGe1fvlIkrvkahlUqy3ohI++UxdQaDXmse6h007/wBYCwwcr3s9LU
 x9XIWRkuN7ZaLMPGgRt4treDOkbM4CopS5Rpd1Y0Mfw6lr+xGMCCuDIp6hwuQslYYB3b4Idkz4A
 vi/Np2nKVfztEjVr2Ge25D2+FIGXHEexSw8WknAH47kyZcAMMmj/DA3VPK2nF08u9Tj9SJkU+4m
 iVNxpZO+K2ajnGKQ3UlWFkvYKHaqoJ7E8p1tvDfkuvsGM+ADrWwSxRZrAZHUSMsbZmqoosqy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-01_03,2025-07-31_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 clxscore=1015 suspectscore=0 lowpriorityscore=0
 spamscore=0 mlxscore=0 impostorscore=0 adultscore=0 malwarescore=0
 priorityscore=1501 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2508010079
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

On Fri, Aug 01, 2025 at 09:19:41AM +0800, Jun Nie wrote:
> Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com> 于2025年8月1日周五 01:08写道：
> >
> > On 31/07/2025 18:37, Jun Nie wrote:
> > > Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com> 于2025年7月31日周四 22:22写道：
> > >>
> > >> On 31/07/2025 13:52, Jun Nie wrote:
> > >>> Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com> 于2025年7月31日周四 02:52写道：
> > >>>>
> > >>>> On Mon, Jul 28, 2025 at 09:14:34PM +0800, Jun Nie wrote:
> > >>>>> Currently, SSPPs are assigned to a maximum of two pipes. However,
> > >>>>> quad-pipe usage scenarios require four pipes and involve configuring
> > >>>>> two stages. In quad-pipe case, the first two pipes share a set of
> > >>>>> mixer configurations and enable multi-rect mode when certain
> > >>>>> conditions are met. The same applies to the subsequent two pipes.
> > >>>>>
> > >>>>> Assign SSPPs to the pipes in each stage using a unified method and
> > >>>>> to loop the stages accordingly.
> > >>>>>
> > >>>>> Signed-off-by: Jun Nie <jun.nie@linaro.org>
> > >>>>> ---
> > >>>>>    drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 160 ++++++++++++++++++------------
> > >>>>>    1 file changed, 99 insertions(+), 61 deletions(-)
> > >>>>>
> > >>>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> > >>>>> index 55429f29a4b95594771d930efe42aaa4126f6f07..e1e16a8d5ac55ba52a0f460d62901dced65e3a9e 100644
> > >>>>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> > >>>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> > >>>>> @@ -959,6 +959,30 @@ static int dpu_plane_is_multirect_parallel_capable(struct dpu_hw_sspp *sspp,
> > >>>>>    }
> > >>>>>
> > >>>>>
> > >>>>> +static bool dpu_plane_get_single_pipe_in_stage(struct dpu_plane_state *pstate,
> > >>>>> +                                            struct dpu_sw_pipe **single_pipe,
> > >>>>> +                                            struct dpu_sw_pipe_cfg **single_pipe_cfg,
> > >>>>> +                                            int stage_index)
> > >>>>> +{
> > >>>>> +     int pipe_idx, i, valid_pipe = 0;
> > >>>>> +
> > >>>>> +     for (i = 0; i < PIPES_PER_STAGE; i++) {
> > >>>>
> > >>>> Why do you need to loop here? Is there a case when pipe 0 is not
> > >>>> assigned, but pipe 1 is?
> > >>>
> > >>> Loop the pipe in a stage to count the valid pipes. If there are 2 valid
> > >>> pipes in stage of the current plane, this function will return false.
> > >>> Or you prefer the below coding?
> > >>>
> > >>> 1029         pipe_idx = stage_index * PIPES_PER_STAGE;
> > >>> 1030         if (drm_rect_width(&pstate->pipe_cfg[pipe_idx].src_rect) != 0 &&
> > >>> 1031             drm_rect_width(&pstate->pipe_cfg[pipe_idx +
> > >>> 1].src_rect) == 0) {
> > >>
> > >> Yes, this is better from my POV. But the bigger question is why do you
> > >> need it at all? What is wrong with the existing check? Can it be that
> > >> pipe0 is not used, but pipe1 is used?
> > >
> > > There is no case that pipe0 is not used, but pipe1 is used. Existing check
> > > does not filter the plane which contains single pipe in a stage, which can
> > > be a candidate for SSPP sharing. If the stage contains 2 valid pipes or
> > > no valid pipes, it is skipped in dpu_plane_try_multirect_shared(), or it is
> > > skipped to be stored in prev_adjacent_plane_state[].
> >
> > Oh, I see, you need to check both pipes because you might need to skip
> > it completely. I'd really prefer to have more explicit code:
> >
> > - check for pipe0, skip this part of the plane if there is none
> > - check for pipe1, if there is none, it's a candidate for sharing.
> 
> Yeah, this is the logic of the current implementation. So the your only
> concern is the loop. Will remove the loop as above code.

Ok.


-- 
With best wishes
Dmitry
