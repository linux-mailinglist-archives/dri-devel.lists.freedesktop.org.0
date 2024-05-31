Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E55C8D6A0E
	for <lists+dri-devel@lfdr.de>; Fri, 31 May 2024 21:45:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 26DC810E0A4;
	Fri, 31 May 2024 19:45:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="tttrdNkL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com
 [209.85.167.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 47B4710E1A7
 for <dri-devel@lists.freedesktop.org>; Fri, 31 May 2024 19:45:12 +0000 (UTC)
Received: by mail-lf1-f43.google.com with SMTP id
 2adb3069b0e04-52b82d57963so2025967e87.2
 for <dri-devel@lists.freedesktop.org>; Fri, 31 May 2024 12:45:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1717184710; x=1717789510; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=A11vsUli/DmN5lqzHDZQ4RXR2rDo8e190xdHexvyrmc=;
 b=tttrdNkLwvobiZqAsuvdlQLUIaoq019jS/flFJyIN9rYY5/8vT+d7jpBrFhT2O40cX
 wnoxemUkcVBaipGpioGUVqtd+XFj/xjUulEUGT+XQcSCYKVD79paTiDiz4Avcl4jG2Cl
 eVhDApzDXpRdPG4gAwXz1RXIt9u8WRxMD0LVkwbRtjGb5w8ZMBil4D4vmjogTqh+6bri
 hAi629CVml96XQj/EEKFmJqCBf6ZbTMQgZAp86QoT2cqAeqO8j6MvRG+wsHXhSwZWNxO
 G82rINPWSeR7AZjD1L2oPvpAyHKm66873vOIUA/J8VLCD3AA/cC5Z4pEYejMqxkqiyqc
 dFYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717184710; x=1717789510;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=A11vsUli/DmN5lqzHDZQ4RXR2rDo8e190xdHexvyrmc=;
 b=VLIPsyip9KOGkAstzPRDiSwKeQHXUs2vvXjV77yEPTpzKrQNv9RR4S9jiPF4wYdH40
 BtlILIhe4ET/4GFcn/4YcC3bJBTgcnD4wqzetb6OK1T5kV3jE2ggeYxiF2ISWVW+Lfj3
 yMhobFq0Ep/6ch39ZhAFgEzdeBX4uJj+NwxUEHKNHvcFZJJkaDNn8J3s04ASO0Tp17un
 RKRHKli9Cizo/AOP4AVyGV5iOeQa39PiodZP5695DqAGWn73bYqvUgSahGIeK8YIjpan
 HWpcSYdMlZGik4DgvG0HnfUaUHLYJ6x/H4WhFftRgQlkQW0JC2j+qL8fX3vN8Ua1p8JF
 V+0g==
X-Forwarded-Encrypted: i=1;
 AJvYcCWslMdXqHVpaia1NmkUmN/9Vg1wS4iMjEEZj0phzQ5q/DYQ2BXIOXQC+CqgG9MFL5hE4JGFtuK8Cuz75LvbezXfdSSuPZ/XDp+igsIq6CXq
X-Gm-Message-State: AOJu0YwN/OHMxrdPUoT+pC79tEIMskF9k2RyECJsQ1QlTYZkBWBtOYqv
 KcyicsxALoLC7lZnQ1Ubr/2PIT9GKxo6nVJWLwwq7Eu876N0wWgYtq8T/lMKlTg=
X-Google-Smtp-Source: AGHT+IEheBo27F4lk78f4S625ji98poF0LnY6huzs/8CXZpOwabBlWL1BBh+G2Q+E6Acl3rELSR6nQ==
X-Received: by 2002:a05:6512:3b25:b0:52a:d87f:60e3 with SMTP id
 2adb3069b0e04-52b896f7eebmr2327096e87.57.1717184710290; 
 Fri, 31 May 2024 12:45:10 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (dzdbxzyyyyyyyyyyyykxt-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::227])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-52b84d760e1sm416833e87.153.2024.05.31.12.45.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 31 May 2024 12:45:09 -0700 (PDT)
Date: Fri, 31 May 2024 22:45:07 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 Stephen Boyd <swboyd@chromium.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Bjorn Andersson <andersson@kernel.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Subject: Re: [PATCH v4 05/13] drm/msm/dpu: move scaling limitations out of
 the hw_catalog
Message-ID: <fvvqa2ltfv5gnkvsfsionfphzlki43ayzahegwsudq7v7isfx6@iuok6zbwptxj>
References: <20240314000216.392549-1-dmitry.baryshkov@linaro.org>
 <20240314000216.392549-6-dmitry.baryshkov@linaro.org>
 <6a335026-77c1-a112-69af-a8d9d86d5528@quicinc.com>
 <CAA8EJpqKkTOkhrgJexw-D5TbgGYjBoUup3FHC80boR_cAUb2dA@mail.gmail.com>
 <9e0e22b0-965b-00b2-c837-904dd342e87f@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9e0e22b0-965b-00b2-c837-904dd342e87f@quicinc.com>
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

On Fri, May 31, 2024 at 12:20:24PM -0700, Abhinav Kumar wrote:
> 
> 
> On 5/31/2024 1:16 AM, Dmitry Baryshkov wrote:
> > On Fri, 31 May 2024 at 04:02, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
> > > 
> > > 
> > > 
> > > On 3/13/2024 5:02 PM, Dmitry Baryshkov wrote:
> > > > Max upscale / downscale factors are constant between platforms. In
> > > > preparation to adding support for virtual planes and allocating SSPP
> > > > blocks on demand move max scaling factors out of the HW catalog and
> > > > handle them in the dpu_plane directly. If any of the scaling blocks gets
> > > > different limitations, this will have to be handled separately, after
> > > > the plane refactoring.
> > > > 
> > > > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > > > ---
> > > >    drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c | 12 ------------
> > > >    drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h |  4 ----
> > > >    drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c      | 16 +++++++++++++---
> > > >    3 files changed, 13 insertions(+), 19 deletions(-)
> > > > 
> > > 
> > > <Snip>
> > > 
> > > > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> > > > index 70d6a8989e1a..6360052523b5 100644
> > > > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> > > > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> > > > @@ -785,12 +785,15 @@ static int dpu_plane_atomic_check_pipe(struct dpu_plane *pdpu,
> > > >        return 0;
> > > >    }
> > > > 
> > > > +#define MAX_UPSCALE_RATIO    20
> > > > +#define MAX_DOWNSCALE_RATIO  4
> > > > +
> > > >    static int dpu_plane_atomic_check(struct drm_plane *plane,
> > > >                                  struct drm_atomic_state *state)
> > > >    {
> > > >        struct drm_plane_state *new_plane_state = drm_atomic_get_new_plane_state(state,
> > > >                                                                                 plane);
> > > > -     int ret = 0, min_scale;
> > > > +     int ret = 0, min_scale, max_scale;
> > > >        struct dpu_plane *pdpu = to_dpu_plane(plane);
> > > >        struct dpu_kms *kms = _dpu_plane_get_kms(&pdpu->base);
> > > >        u64 max_mdp_clk_rate = kms->perf.max_core_clk_rate;
> > > > @@ -822,10 +825,17 @@ static int dpu_plane_atomic_check(struct drm_plane *plane,
> > > >        pipe_hw_caps = pipe->sspp->cap;
> > > >        sblk = pipe->sspp->cap->sblk;
> > > > 
> > > > -     min_scale = FRAC_16_16(1, sblk->maxupscale);
> > > > +     if (sblk->scaler_blk.len) {
> > > > +             min_scale = FRAC_16_16(1, MAX_UPSCALE_RATIO);
> > > > +             max_scale = MAX_DOWNSCALE_RATIO << 16;
> > > > +     } else {
> > > > +             min_scale = 1 << 16;
> > > > +             max_scale = 1 << 16;
> > > 
> > > You can use DRM_PLANE_NO_SCALING instead.
> > 
> > Ack
> > 
> > > 
> > > > +     }
> > > > +
> > > >        ret = drm_atomic_helper_check_plane_state(new_plane_state, crtc_state,
> > > >                                                  min_scale,
> > > > -                                               sblk->maxdwnscale << 16,
> > > > +                                               max_scale,
> > > >                                                  true, true);
> > > 
> > > I am missing something here.
> > > 
> > > As per the documentation of this API, min and max are the scaling limits
> > > of both directions and not max_upscale and max_downscale.
> > > 
> > > **
> > > 837  * drm_atomic_helper_check_plane_state() - Check plane state for
> > > validity
> > > 838  * @plane_state: plane state to check
> > > 839  * @crtc_state: CRTC state to check
> > > 840  * @min_scale: minimum @src:@dest scaling factor in 16.16 fixed point
> > > 841  * @max_scale: maximum @src:@dest scaling factor in 16.16 fixed point
> > > 842  * @can_position: is it legal to position the plane such that it
> > > 
> > > 
> > > But this change is passing max_upscale and max_downscale as the min and
> > > max resp. Isnt that wrong?
> > 
> > First of all, please notice that I'm not changing the values that are
> > passed to the function. What was being passed beforehand gets passed
> > after this commit. I just moved it out of the catalog.
> > 
> 
> Ack.
> 
> > Second, if we take a look at drm_calc_scale(), we can see that it
> > calculates src / dst and checks that it is within the min_scale and
> > max_scale boundaries, just like documented.
> > In our case, the boundaries are (I'm omitting 16.16 math):
> > - upscale 20 times. dst = 20 * src, scale = src/dst = 1/20
> > - downscale 4 times. dst = 1/4 * src, scale = src/dst = 4
> > 
> > So, from the point of view of drm_calc_scale(), the min_scale is
> > 1/MAX_UPSCALE, max_scale = MAX_DOWNSCALE and the values the code is
> > passing are correct.
> > 
> 
> That part is fine. Agreed.
> 
> But I do think, that API is not correct if the scaling limits are different
> in the Horizontal Vs Vertical direction as today it assumes the limits are
> same in both.

Agree. But if we ever need to support different scaling limits, it would
be easy to extend the API.

> Anyway, thats outside the scope of this patch. So I am good
> for now.
> 
> > > 
> > > 
> > > >        if (ret) {
> > > >                DPU_DEBUG_PLANE(pdpu, "Check plane state failed (%d)\n", ret);
> > 
> > 
> > 

-- 
With best wishes
Dmitry
