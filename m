Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D9867AD125F
	for <lists+dri-devel@lfdr.de>; Sun,  8 Jun 2025 15:01:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E1D8E10E1EE;
	Sun,  8 Jun 2025 13:01:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="hM2APRJy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0286410E008
 for <dri-devel@lists.freedesktop.org>; Sun,  8 Jun 2025 13:01:33 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 558BV1UB017702
 for <dri-devel@lists.freedesktop.org>; Sun, 8 Jun 2025 13:01:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 83rMQCVF+5IDe8SlFKw1Sm6kmNfLPYOW0teW2Gpgxag=; b=hM2APRJyBxpJMy0Y
 PqJXpzXxSdzlhpS26nv9g3B0UY/AwolF7gfmLl371fX2IZ5cgo0TCLwT5isxuE4Q
 PLhTFZEFnVeszPzZ+Q1s5AXB0DIY9xTM52Kj2XyrQ7xoIhQjLTzAvkTXZ34IV3Ju
 4m3Y3dVg2ShXE7lGl7BMz4SYmL1dd+h4jOI47sJLNl2mxnQaJ9Vw0lXqnYCelt3R
 5cuixI44UclEKNBRlQ19lX7bD85m31xEh/05cO7Bqy4u1xv0YWyk/WspNE68vuI4
 kWqyJktwB3cQLWXg6LnSuOdDTQWsHV9wP8yaJ2IE+SHJ4Fe8ex9QEJYs9SLFQqUc
 5XJHVw==
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com
 [209.85.222.70])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 474dgxjxhy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Sun, 08 Jun 2025 13:01:33 +0000 (GMT)
Received: by mail-ua1-f70.google.com with SMTP id
 a1e0cc1a2514c-87ea5aa15bbso2872492241.0
 for <dri-devel@lists.freedesktop.org>; Sun, 08 Jun 2025 06:01:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749387692; x=1749992492;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=83rMQCVF+5IDe8SlFKw1Sm6kmNfLPYOW0teW2Gpgxag=;
 b=rhGOUa1+2GZONtPgpMmujTsOfobPv39DumyjUVoiuIRK9OPyammryuxxY4+EfJua/Z
 /d8cuoJVL3Ibsy/c/YOk34XPUmu+lf1DSpNdOse3FPaUr5M8YExNwmGrSsecdKVwbwbq
 QolB0+D9jRX6w/bmHNrW4KdFIdq57rC3YZPPsciJs1357TAoJypQQWyBA4cczMwC0tSF
 DXilIoSkm0q5o1+Z37AlhhAElUFynFi/Q02ZXdNPm1ugzuLgiXLFUB74tCHluKNuKXud
 w6ws2WnHObZ9FeaBbODk7FxeT7xuucA0gu6LOLqxRQEVTsWOfM92K9KJr0uEjwiD68M4
 XP0g==
X-Forwarded-Encrypted: i=1;
 AJvYcCUH0qcaoU85lyXE3gtNM45IW89cXzlnYI4xg5py9onTmnzwV8CTxcqSlihzsANOr2sico9NGiHTiig=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywsg6S4qLCZgjnMlmWIOpp+S+OwqO/JJxZjpt2nKt5vOZI3qDGf
 GJxx29DHuk7cU85Q+KFb40e2F9BPfYqjxDicHCIuF12J5F4ZTCqCLklQLiaD53TYLOdcJrMwLMj
 IXEzSLZYgfVm7TEuAuwLAIC8SdcXypCWQZWp6fnVoKd8c6JxXb4d7NaEuGHn7NkG+0sJjuoc=
X-Gm-Gg: ASbGncvjL+cV00CwKy9Nu3FLkg4/ctAnwYr6oU8ulujMcAX/7VdB524oK5PaZXvMqcW
 YLEUmLxjEm81M/DFhGcNz4nh0Vv+ACfMZO49QCbDjU/Ex2hLVQZIBYy2lRVd5oJZbQkgokY8bn2
 FPXbdeYSRH6mOklApCivHF32MdYr20DYYwScVVwtA4ylLQw/Kl2OfRuVwnEjV6xQAARPpsZRO+R
 jg2zsnWyCn7ZJyUMUv7Rp27SiSP1Pi6Yt/sDsWi6qQeC7oaHq7F5CoTh8Bfk5HIn1DF64GsO6re
 WIzDPgkUHqqB4aKtv4wJ/duqpvNuAWT9aqkrssz7Q20y32kozKAhdmsr6L0LLpwHDehOyOGhBas
 =
X-Received: by 2002:a05:6102:2429:b0:4e5:8cf0:8881 with SMTP id
 ada2fe7eead31-4e7841501d9mr2280636137.9.1749387692214; 
 Sun, 08 Jun 2025 06:01:32 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGAG6HcPqe+MgCFYZJUxIPkKKrruQbJNIh+aB/CzHW4ZawMXDG40gTMBIHM+z8HcVgbbJF5/Q==
X-Received: by 2002:a05:6102:2429:b0:4e5:8cf0:8881 with SMTP id
 ada2fe7eead31-4e7841501d9mr2280546137.9.1749387691820; 
 Sun, 08 Jun 2025 06:01:31 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-553676d00e2sm774355e87.42.2025.06.08.06.01.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 08 Jun 2025 06:01:30 -0700 (PDT)
Date: Sun, 8 Jun 2025 16:01:29 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Jun Nie <jun.nie@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v11 10/12] drm/msm/dpu: support SSPP assignment for
 quad-pipe case
Message-ID: <eavjcf6vkks2e674xhcyqpdp4yhztcbw2ofrbze3ksxsrazhyh@nvu6ifpaj3hx>
References: <20250603-v6-15-quad-pipe-upstream-v11-0-c3af7190613d@linaro.org>
 <20250603-v6-15-quad-pipe-upstream-v11-10-c3af7190613d@linaro.org>
 <dsgnmzswhpht4bewf5wld774riqxffojboujxdf4smutuzmuye@ugyhzv6m7mve>
 <CABymUCPqypTPh=Ao9PN44eq2_TXODhHd3EtSDeG+J0DcXQN6Eg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CABymUCPqypTPh=Ao9PN44eq2_TXODhHd3EtSDeG+J0DcXQN6Eg@mail.gmail.com>
X-Proofpoint-GUID: 6tSynvSBpi-pp3o_p8eBX3oqGsDRTgvM
X-Authority-Analysis: v=2.4 cv=HMbDFptv c=1 sm=1 tr=0 ts=684589ad cx=c_pps
 a=R6oCqFB+Yf/t2GF8e0/dFg==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=6IFa9wvqVegA:10 a=sWKEhP36mHoA:10 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8
 a=CD96AAi2pJaqMmpRfg0A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=TD8TdBvy0hsOASGTdmB-:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: 6tSynvSBpi-pp3o_p8eBX3oqGsDRTgvM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA4MDEwMiBTYWx0ZWRfX1fOY7rxtWyg0
 srweRIt01CEPazC9dzheyCn+Aba8uufSHkNyjfC7AupBGoqkjqGhHZ6o877a++qxtpyv9KiqfpT
 tGVKNsLMS10iDKfXKb9I+ep7RUgsH6FkmdQILdUbTlYopFaVmCuqoi6pCwnT9e2wBZkOSIjEI/m
 ftA40UiSQLb5konhOkOAd7cVn+sc4gJ7zLo2mUoGL28AZVnklYUUNKm0xomT/MlloDAheoGl51O
 LDfzgfTinHyTHS1JEVMTxJFGuzkhziQdVYwweTuwAG8zVAgzP+2k+xLEt4vhPyXnp5KD39pWfow
 r0xj/VJKouUJ3lCNwgaIujkACAXVmok77Aa7AvbAu0TvPMncJbkh4Jmic3OdfJn8GTmWLuPlWnP
 F6xmQfsCswjZzy/LCuoUhRfTU0NMUQNKDV/Ee65TyzCoes4ybWNDdxszAgnjGDl7wMcCuE2A
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-08_01,2025-06-05_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 mlxlogscore=999 priorityscore=1501 impostorscore=0
 suspectscore=0 malwarescore=0 phishscore=0 spamscore=0 lowpriorityscore=0
 adultscore=0 mlxscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506080102
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

On Tue, Jun 03, 2025 at 10:37:37PM +0800, Jun Nie wrote:
> Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com> 于2025年6月3日周二 18:21写道：
> >
> > On Tue, Jun 03, 2025 at 03:10:09PM +0800, Jun Nie wrote:
> > > Currently, SSPPs are assigned to a maximum of two pipes. However,
> > > quad-pipe usage scenarios require four pipes and involve configuring
> > > two stages. In quad-pipe case, the first two pipes share a set of
> > > mixer configurations and enable multi-rect mode when certain
> > > conditions are met. The same applies to the subsequent two pipes.
> > >
> > > Assign SSPPs to the pipes in each stage using a unified method and
> > > to loop the stages accordingly.
> > >
> > > Signed-off-by: Jun Nie <jun.nie@linaro.org>
> > > ---
> > >  drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 148 +++++++++++++++++++-----------
> > >  1 file changed, 94 insertions(+), 54 deletions(-)
> > >
> > > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> > > index 0bb153a71353ca9eaca138ebbee4cd699414771d..501b6a1bad4a1fee832f15efa7caec136a669da5 100644
> > > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> > > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> > > @@ -961,6 +961,33 @@ static int dpu_plane_is_multirect_parallel_capable(struct dpu_hw_sspp *sspp,
> > >               dpu_plane_is_parallel_capable(pipe_cfg, fmt, max_linewidth);
> > >  }
> > >
> > > +static bool dpu_plane_get_single_pipe(struct dpu_plane_state *pstate,
> > > +                                   struct dpu_sw_pipe **single_pipe,
> > > +                                   struct dpu_sw_pipe_cfg **single_pipe_cfg,
> > > +                                   bool config_pipe)
> >
> > Could you please describe, what does this function do? Why is it
> > returning the pipe or configuring a pipe?
> 
> It search all pipes. If there is only one valid pipe, return it via
> pointer and function returns true.
> If the config_pipe flag is set, multirect_index and multirect_mode are
> also initialized. See below.

This doesn't look like a description of a single action. Please don't
try to mix different actions into a single function.

> >
> > > +{
> > > +     int i, valid_pipe = 0;
> > > +     struct dpu_sw_pipe *pipe;
> > > +
> > > +     for (i = 0; i < PIPES_PER_PLANE; i++) {
> > > +             if (drm_rect_width(&pstate->pipe_cfg[i].src_rect) != 0) {
> > > +                     valid_pipe++;
> > > +                     if (valid_pipe > 1)
> > > +                             return false;
> > > +                     *single_pipe = &pstate->pipe[i];
> > > +                     *single_pipe_cfg = &pstate->pipe_cfg[i];
> > > +             } else {
> > > +                     if (!config_pipe)
> > > +                             continue;
> > > +                     pipe = &pstate->pipe[i];
> > > +                     pipe->multirect_index = DPU_SSPP_RECT_SOLO;
> > > +                     pipe->multirect_mode = DPU_SSPP_MULTIRECT_NONE;
> > > +                     pipe->sspp = NULL;
> > > +             }
> > > +     }
> > > +
> > > +     return true;
> > > +}
> > >
> > >  static int dpu_plane_atomic_check_sspp(struct drm_plane *plane,
> > >                                      struct drm_atomic_state *state,

-- 
With best wishes
Dmitry
