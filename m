Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F41D9B7ECB
	for <lists+dri-devel@lfdr.de>; Thu, 31 Oct 2024 16:44:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 89E3B10E8D7;
	Thu, 31 Oct 2024 15:44:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="Tjnvvbal";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com
 [209.85.128.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8872C10E413
 for <dri-devel@lists.freedesktop.org>; Thu, 31 Oct 2024 15:44:18 +0000 (UTC)
Received: by mail-yw1-f176.google.com with SMTP id
 00721157ae682-6e38ebcc0abso12330197b3.2
 for <dri-devel@lists.freedesktop.org>; Thu, 31 Oct 2024 08:44:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1730389457; x=1730994257; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=WkbJktFWhQ17ZPncxvn3FN6iDF+dModwKTnXQceOjrk=;
 b=TjnvvballbNu5v6nbk+ZLCiiewbvWoLaYxcFWLGgMv0Hy06XngoI7DMZpARe42bNln
 m+hHg07JVVoPo57LwGtmsGLuR4JBE1bZHA8GMFSklnKRzSrExCBJ3o9eNhIc6s2/qoj8
 +F/J2JfXg8Eseu2eg1/+1hn28WTQOh2E46Fb+oZCuES6FVegPJOotyLZuyVyfuT89auj
 qFeUTOvUGddhoXkBZM2vJiTGdnUm/DDcQE6UUBstB5l/mMbQOB2iKgo2nyBqk4VpVOO3
 OHz6zFjb+kJY59BDdUuvskv+qJy28cbX1b1CDMpd3RnxcOgUDc86vf2ux4dO02V95Hgr
 w8dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730389457; x=1730994257;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=WkbJktFWhQ17ZPncxvn3FN6iDF+dModwKTnXQceOjrk=;
 b=dpggiYSvwP3ZYT9U6WjWDOYUGcYdQZS3k1Mhv8vMtY8tfl0ZeQojCZi9shuMQkF0XJ
 R/AjNGWb4R5v+12DY1NUSsu9Q4NqUCL+4AJyaVIN/ZUe3OW9IuChoNCefnyFHjWrHajl
 UwHi7SV5XUZ8gx/XewZJLNag5B77s65MK3lUAq3Q+QWKb24/S0gvG3rPd4s9m5sUNVyW
 gbrrrd7Akm/tUhsYEkqUbeBdEDoMmxbBWosvgwuhhu+EK1iaKkLZnuZcTlwftfVhkKQK
 S+D62ne7F2M+qZcwJN8bLvwNKWpvjXbscZya8mH9z3W1tOBjMWSOg6Xhf4tFXyswxNsI
 5jNQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVpvbvhpWMQDc1CR3j3qCMPe/UMdkk73vN3kc10NG3N2Dliy78AIUuddYTYFTns2epotXH4/u5sliM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywsh7fmdPs6ZZYuxx9rezK9Lws5ZBccxLgjNjkRLgrDo7vxFmwz
 7b+k0okEmRKNSE4GPBw4GmaGz+U2ORtoIXc1qRySlxPz9/cObkS3gKaQnKnjD3LqDbM7/smluVP
 fe4OaG95H1NDJ2//G+m+RoomKyzVPJZjfdI1EVA==
X-Google-Smtp-Source: AGHT+IGjmqvpPX1+bGFGcSxEoEH+wnbP2rdjGZXV5omtO6akLQEwaojlUw/funiMKKjk1H8UlB7i4QA7KdZjNAhvlgE=
X-Received: by 2002:a05:690c:d81:b0:6e3:430c:b120 with SMTP id
 00721157ae682-6e9d88cecf3mr189401227b3.5.1730389457603; Thu, 31 Oct 2024
 08:44:17 -0700 (PDT)
MIME-Version: 1.0
References: <20241025-dpu-virtual-wide-v6-0-0310fd519765@linaro.org>
 <20241025-dpu-virtual-wide-v6-7-0310fd519765@linaro.org>
 <e0f84f35-6d98-45c3-857c-c273820fab69@quicinc.com>
 <xxxedwb2t6xhfzmhpom6dirs2ur2qvmruimdxgvdkh7gmey5tr@qotm7xvbsg5a>
 <14531af0-29c3-40eb-bf52-8202ba155d0b@quicinc.com>
 <CAA8EJppCppQ_jJu4o62prW-Yp2E3WBfqdYgdJs-KB8kgghj0fg@mail.gmail.com>
In-Reply-To: <CAA8EJppCppQ_jJu4o62prW-Yp2E3WBfqdYgdJs-KB8kgghj0fg@mail.gmail.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 31 Oct 2024 17:17:33 +0200
Message-ID: <CAA8EJpr_8LkP8wnR8n0wSeFHOWdG9osg+XZu_vCDkv5Y6y0gXA@mail.gmail.com>
Subject: Re: [PATCH v6 7/9] drm/msm/dpu: add support for virtual planes
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
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

On Thu, 31 Oct 2024 at 17:11, Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> Hi Abhinav,
>
> On Wed, 30 Oct 2024 at 21:26, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
> > On 10/30/2024 3:48 AM, Dmitry Baryshkov wrote:
> > > On Tue, Oct 29, 2024 at 02:30:12PM -0700, Abhinav Kumar wrote:
> > >> On 10/24/2024 5:20 PM, Dmitry Baryshkov wrote:
> > >>> +           if (reqs->yuv && !hw_sspp->cap->sblk->csc_blk.len)
> > >>> +                   continue;
> > >>
> > >> same here
> > >>> +
> > >>> +           if (reqs->rot90 && !(hw_sspp->cap->features & DPU_SSPP_INLINE_ROTATION))
> > >>> +                   continue;
> > >>> +
> > >>> +           global_state->sspp_to_crtc_id[i] = crtc_id;
> > >>> +
> > >>> +           return rm->hw_sspp[i];
> > >>> +   }
> > >>> +
> > >>> +   return NULL;
> > >>> +}
> > >>> +struct dpu_hw_sspp *dpu_rm_reserve_sspp(struct dpu_rm *rm,
> > >>> +                                   struct dpu_global_state *global_state,
> > >>> +                                   struct drm_crtc *crtc,
> > >>> +                                   struct dpu_rm_sspp_requirements *reqs)
> > >>> +{
> > >>> +   struct dpu_hw_sspp *hw_sspp = NULL;
> > >>> +
> > >>> +   if (!reqs->scale && !reqs->yuv)
> > >>> +           hw_sspp = dpu_rm_try_sspp(rm, global_state, crtc, reqs, SSPP_TYPE_DMA);
> > >>> +   if (!hw_sspp && reqs->scale)
> > >>> +           hw_sspp = dpu_rm_try_sspp(rm, global_state, crtc, reqs, SSPP_TYPE_RGB);
> > >>
> > >> I dont recollect whether RGB SSPPs supported scaling, if you have any source
> > >> or link for this, that would help me for sure.
> > >
> > > I have to dig further into the old fbdev driver. It looks like
> > > mdss_mdp_qseed2_setup() is getting called for all plane types on the
> > > corresponding hardware, but then it rejects scaling only for DMA and
> > > CURSOR planes, which means that RGB planes should get the scaler setup.
> > >
> > > For now this is from the SDE driver from 4.4:
> > >
> > >   * @SDE_SSPP_SCALER_RGB,     RGB Scaler, supported by RGB pipes
> > >
> > >> But even otherwise, I dont see any chipset in the catalog setting this SSPP
> > >> type, so do we need to add this case?
> > >
> > > Yes, we do. MSM8996 / MSM8937 / MSM8917 / MSM8953 use RGB planes.
> > >
> >
> > Yes those chipsets do have RGB SSPP. My question was whether they have
> > migrated to dpu and thats why I wanted to know whether we want to
> > include RGB SSPP handling.
> >
> > I do not even see them in msm_mdp5_dpu_migration.
>
> Ugh, it's a bug then, I'll push a fix.

Ok, this is very surprising:

static const char *const msm_mdp5_dpu_migration[] = {
        "qcom,msm8917-mdp5",
        "qcom,msm8937-mdp5",
        "qcom,msm8953-mdp5",
        "qcom,msm8996-mdp5",
        "qcom,sdm630-mdp5",
        "qcom,sdm660-mdp5",
        NULL,
};



-- 
With best wishes
Dmitry
