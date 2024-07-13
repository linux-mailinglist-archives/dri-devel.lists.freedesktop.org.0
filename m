Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FF919304C4
	for <lists+dri-devel@lfdr.de>; Sat, 13 Jul 2024 11:49:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C3E910E051;
	Sat, 13 Jul 2024 09:49:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="lzQNFs+M";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com
 [209.85.128.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B73610E1E7
 for <dri-devel@lists.freedesktop.org>; Sat, 13 Jul 2024 09:49:22 +0000 (UTC)
Received: by mail-yw1-f180.google.com with SMTP id
 00721157ae682-65f880c56b1so4031607b3.3
 for <dri-devel@lists.freedesktop.org>; Sat, 13 Jul 2024 02:49:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1720864162; x=1721468962; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=gUfwJ/Q8PMM5kCwlle/T/cSvHYKyhxEdVJ2Fqw5c4Rc=;
 b=lzQNFs+MkuqW1xn5jOUEHUL3zh1MAOsXw7ZzRvKpZI7brW9Wr/51gLGEsgixDpFEql
 +nJQV+sOzMSlgm8JFTPTW5XQufiYouEY7h1f4wnOSe4te45y56Hjnx8exNwxdTyKOga/
 QMbiEqFEkQOlGuLt7ufBir73kAYZ/RUZX20LAsjiJGbJ72Ik6ne7Nd0NzC671Z79VeRN
 emu5MQ09+OnvSoXOX42GVGbkkLxSdkqpoI/5xJSQZrdAazCwRqaWQWzine+KDSwT4EdD
 zTx23+6kT6CXRwgoI0MoszR5VnqPeSVHXk7fJdfrdGh9v7RNuDHKHYanDNI5tbWuZk4U
 FZ/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720864162; x=1721468962;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=gUfwJ/Q8PMM5kCwlle/T/cSvHYKyhxEdVJ2Fqw5c4Rc=;
 b=GMKvuITyjitSVfm+ctl01C4HDnOZSJdeVTzqPhjDuUqDOco/WGPGHW46nUjb081wxK
 t2gSFNkzN16TEXx78daZKnDVGKgVCFvbGBeFyhrT6QAGWVK9MxIXNVZS+QyLHJyXiYX8
 0RkypRnpjdpP8glUbXBfsU1VF8qxU7UdstGAQeXSflRa7GnlyqF6SB8SBItawQVwEz5K
 0xE07SpwYHu2gX4JtTH+r9NSTLV1LB0Pb3JNWUPzCCjWxV1H4Kkoza37rD7E6nbLvNh4
 FvBRV5M5qLQ0GFjjgJutPjkvCzPZDn+x5ERsjP16NmTeN/xr6lyrSieLq5Fh/Vjd4iFm
 mr3w==
X-Forwarded-Encrypted: i=1;
 AJvYcCXxno3HbgqOHyo7myBLaKXUAUardyMmF0nFg3toIkwdROuKLAzxIUmHoNcJSNWl5gmBx9/KC4+GE52MRPTEZEeTfzwIB8jnhNL+U5uI9PWB
X-Gm-Message-State: AOJu0YwA59W3arv1kuns3kL7DBtCyvncPGIuRwxsXAEfvtlt6GE97tpF
 NzpwbzCYt2O3Kc6jHnbYmpG5jOFlNmdEjgpKDA9l+0S+Nm11QvOXCfZ2BfWXQCmfn3RSQUpKjEj
 DZk7FLCrn4VElaUzkj2IaHAdjzz5fwt8RMMYJaA==
X-Google-Smtp-Source: AGHT+IFFhjze0e2IlmLKCdcI5HTMCQ7/JyyIk0Q8Vs81z2ulfIgAdlZFZUZim+vMQAkmh4r7JJ8EzxInoDKgQXWAZoU=
X-Received: by 2002:a05:690c:6308:b0:64b:a57:8441 with SMTP id
 00721157ae682-6593e4791femr152355357b3.19.1720864161684; Sat, 13 Jul 2024
 02:49:21 -0700 (PDT)
MIME-Version: 1.0
References: <20240625-dpu-mode-config-width-v5-0-501d984d634f@linaro.org>
 <20240625-dpu-mode-config-width-v5-2-501d984d634f@linaro.org>
 <637fbd36-d6cd-4bb7-af83-8849c0fee8f2@quicinc.com>
 <CAA8EJppxyUrEWYQvMGtw14UVobkQdaPZuwHPeMcONRYrgPp2jw@mail.gmail.com>
 <cf1ed8b1-1c70-47f8-8c34-ef62129d44a8@quicinc.com>
In-Reply-To: <cf1ed8b1-1c70-47f8-8c34-ef62129d44a8@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sat, 13 Jul 2024 12:49:10 +0300
Message-ID: <CAA8EJpqXv2cfN2CC1+FMgwXnwMh3BeocY5ae1sOZazdy0_FCNw@mail.gmail.com>
Subject: Re: [PATCH v5 02/16] drm/msm/dpu: fix error condition in
 dpu_encoder_virt_atomic_mode_set
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, Abel Vesa <abel.vesa@linaro.org>, 
 Johan Hovold <johan+linaro@kernel.org>, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
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

On Sat, 13 Jul 2024 at 03:25, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>
>
>
> On 7/12/2024 4:11 PM, Dmitry Baryshkov wrote:
> > On Fri, 12 Jul 2024 at 22:41, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
> >> On 6/24/2024 2:13 PM, Dmitry Baryshkov wrote:
> >>> The commit b954fa6baaca ("drm/msm/dpu: Refactor rm iterator") removed
> >>> zero-init of the hw_ctl array, but didn't change the error condition,
> >>> that checked for hw_ctl[i] being NULL. Use indices check instead.
> >>>
> >>> Fixes: b954fa6baaca ("drm/msm/dpu: Refactor rm iterator")
> >>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> >>> ---
> >>>    drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 2 +-
> >>>    1 file changed, 1 insertion(+), 1 deletion(-)
> >>>
> >>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> >>> index 5d205e09cf45..7613005fbfea 100644
> >>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> >>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> >>> @@ -1186,7 +1186,7 @@ static void :tag(struct drm_encoder *drm_enc,
> >>>                        return;
> >>>                }
> >>>
> >>> -             if (!hw_ctl[i]) {
> >>> +             if (i >= num_ctl) {
> >>
> >> This is not very clear to me.
> >>
> >> How will we hit this condition? I dont see i going beyond 1 in this loop
> >> and neither should num_ctl
> >
> > Why? the driver doesn't support flushing through a single CTL, so
> > num_ctl = num_intf.
> >
>
> num_ctl will be = num_intf, but what I was trying to understand here is
> that , previously this condition was making sure that we have a ctl
> assigned for each physical encoder which is actually a requirement for
> the display pipeline. If we assigned a hw_ctl for one phys encoder and
> not the other, its an error.
>
> But on closer look, I think even your check will catch that.
>
>
> >>
> >> Will it be just easier to bring back the NULL assignment at the top?
> >>
> >> struct dpu_hw_blk *hw_ctl[MAX_CHANNELS_PER_ENC] = { NULL };
> >>
> >> I also see the same issue for other blocks such as hw_dsc, hw_lm
> >
> > Other blocks loop properly up to the num_resource. I'd prefer to drop
> > the NULL init from the DSPP init and use num_dspp instead.
> >
>
> Overall, I think the purpose of NULL init was to make sure that before
> we call to_dpu_hw_***() macros, we have a valid hw_*.
>
> We could use either num_* or the hw_* as both are returned by RM.
>
> One side-note here is with a proper NULL hw_ctl is that the consumers of
> hw_ctl should also be able to check for NULL correctly.

The problem of the NULL checks is that it's too tempting to perform a
NULL check after to_dpu_hw_ctl conversion. However it's not safe to
pass NULL pointer to such functions: there is no guarantee that
conversion will return NULL if it gets passed the NULL pointer.

> So for example dpu_encoder_phys layers use if (!phys->hw_ctl) checks but
> today we do not set phys->hw_ctl to NULL correctly.
>
> Do you think that instead of the return statements, we should do
> something like
>
> dpu_enc->hw_ctl = i < num_ctl ?
>         to_dpu_hw_ctl(hw_ctl[i]) : NULL;

Yeah, why not.

Generally, I think we should stop storing the state-related data in
the non-state structures. Hopefully I'll have time for that at some
point later on.

>
>
> But this will need the NULL init back.

It doesn't, as you have the comparison.

>
> >>
> >>>                        DPU_ERROR_ENC(dpu_enc,
> >>>                                "no ctl block assigned at idx: %d\n", i);
> >>>                        return;
> >>>
> >
> >
> >



-- 
With best wishes
Dmitry
