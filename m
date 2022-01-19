Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BF83E493658
	for <lists+dri-devel@lfdr.de>; Wed, 19 Jan 2022 09:32:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A8EB810E82B;
	Wed, 19 Jan 2022 08:32:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com
 [IPv6:2607:f8b0:4864:20::62b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D99CF10E82F
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jan 2022 08:32:22 +0000 (UTC)
Received: by mail-pl1-x62b.google.com with SMTP id a7so1492990plh.1
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jan 2022 00:32:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=dSmyI9DWw4yjUYr1nbkInCEVJfsKrWWmNEo3N5Pb/+8=;
 b=ALKiXykSDyTEQAdxfUqak//n6c0I9iHi2l01AJef/DYgG2GQHArPmubo5KNHrbOreS
 of5NeR6NqgQ74KZ2WEOxDtJ/W0rutGdyD6dQavhGy9ohiXGf0MxS15oFWHcLOgi8vPOg
 Lm0s7HKLAEStRsolrJ6I3VbLcfKOhgABBPiDdIgmJwf1xRTzZSiNp8l1JRH/Ct11F01v
 8LVzQgfrD0TiZsaDVN16goRrt6TIn1xN8b35eNsjs9bJfo6RhDZoXFNv+WkHxdbhgn8j
 FZT42ZpmNEAd7KCW9ENDt2JZrQNqXMNDuS4e8L5dFzB6gYFYNBFObdgBbDUzgCQplcpI
 BjGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=dSmyI9DWw4yjUYr1nbkInCEVJfsKrWWmNEo3N5Pb/+8=;
 b=yjcgz+rg0Wg9zgmD91wh8EGrW+m7mezcMwLNL2cBDeFpyFEUCvv/Qv7IaxRskwBIZd
 FLGHuFgqaNuEbXK0VHaqYYY9ZNcNsDmFywNfQMB4uO1aQUhlrEdUEON/6rmUYtCq5EAd
 xgs810akWzZgroQVA/T5Mt7861tIsusEvLspM7tPNiCQ3a6xl6buF4zn/YjNNij7oPF1
 gby9uhZ1zET2LHmZqLawy+ny8PHSry4yrrDr+gtsmYnh8rUo7GSeSiWFRwANJ7KHf2B5
 C2L8CL0BC9EDrfQvSARrL+8xSSabmVcj2JUmoAU0syMoKzrzoftWlQIP7zfosQPUKTcB
 b1aA==
X-Gm-Message-State: AOAM533FGDZdaITJIg8WaMoM1LL3+ZN/qD0ykRhcki51OeGp1OBRM+G4
 E+f7Lwsts2F/r+5If3GTe5QlzMG3Jqcj89xl/nNYig==
X-Google-Smtp-Source: ABdhPJxDax72AjX8z4FnT10PwvTLx2e5zuOtT54rp12MpXvCqQWd+6XrpPRdBI429DXhFjcp17gIF9WQpBvZSgLgIFQ=
X-Received: by 2002:a17:90a:53:: with SMTP id 19mr2927524pjb.159.1642581142444; 
 Wed, 19 Jan 2022 00:32:22 -0800 (PST)
MIME-Version: 1.0
References: <1642520854-32196-1-git-send-email-loic.poulain@linaro.org>
 <c37daeda-e58e-6a93-36aa-28e392bb06f2@linaro.org>
In-Reply-To: <c37daeda-e58e-6a93-36aa-28e392bb06f2@linaro.org>
From: Loic Poulain <loic.poulain@linaro.org>
Date: Wed, 19 Jan 2022 09:44:05 +0100
Message-ID: <CAMZdPi8VLa4VEKk9BsO5i-cSA=itpUTBr6YoQN7Y7AE6Jugo_Q@mail.gmail.com>
Subject: Re: [PATCH 1/2] drm/msm: add support for QCM2290 MDSS
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
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
Cc: devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, bjorn.andersson@linaro.org,
 robh+dt@kernel.org, sean@poorly.run
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Dmitry,

On Tue, 18 Jan 2022 at 19:02, Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> On 18/01/2022 18:47, Loic Poulain wrote:
> > Add compatibility for QCM2290 display subsystem, including
> > required entries in DPU hw catalog.
> >
> > Signed-off-by: Loic Poulain <loic.poulain@linaro.org>
> > ---
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c | 175 ++++++++++++++++++++++++-
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h |   1 +
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c        |   1 +
> >   drivers/gpu/drm/msm/msm_drv.c                  |   1 +
> >   4 files changed, 177 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> > index ce6f32a..7fa3fc7 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> > @@ -25,6 +25,8 @@
> >   #define VIG_SM8250_MASK \
[...]
> > +static const struct dpu_vbif_cfg qcm2290_vbif[] = {
> > +     {
> > +     .name = "vbif_0", .id = VBIF_0,
> > +     .base = 0, .len = 0x1040,
> > +     .features = BIT(DPU_VBIF_QOS_REMAP),
> > +     .xin_halt_timeout = 0x4000,
> > +     .qos_rt_tbl = {
> > +             .npriority_lvl = ARRAY_SIZE(sdm845_rt_pri_lvl),
> > +             .priority_lvl = sdm845_rt_pri_lvl,
> > +             },
> > +     .memtype_count = 14,
> > +     .memtype = {3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3},
> > +     },
> > +};
>
> The only difference from sdm845_vbif is the lack of .qos_nrt_tbl. Is
> this on purpose?

Yes, I've not found any info related to non-rt for QCM2290 dpu, but I
assume it would be safe to just use sdm845_vbif here, as the others.

Regards,
Loic
