Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BB01E4CE43F
	for <lists+dri-devel@lfdr.de>; Sat,  5 Mar 2022 11:38:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C8CBA10E26C;
	Sat,  5 Mar 2022 10:38:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x72b.google.com (mail-qk1-x72b.google.com
 [IPv6:2607:f8b0:4864:20::72b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 71D4110E275
 for <dri-devel@lists.freedesktop.org>; Sat,  5 Mar 2022 10:38:04 +0000 (UTC)
Received: by mail-qk1-x72b.google.com with SMTP id g24so8368732qkl.3
 for <dri-devel@lists.freedesktop.org>; Sat, 05 Mar 2022 02:38:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=lz9u63IzQ1ny8p1MWQPaj5qIKrAWncsqwglKvPt7b18=;
 b=ureuxwwCPGYZzOPqWphv5EaO1kY1yEOA+OfcMXKh++Ta5PzP3Vqj41pK77KeSt1CKr
 oHiDbgZS3JHbshLxXF+pEYWSLCyWKXK/3lNXWTjopaR9vPXmmPkmu1OeG56DQVBJKixm
 r1cZRZJw0aXAtNVTrDkVjGhEATMpLEMgHw1s67JnIwIUkOTer5TKItbrALbdsagJRkso
 1vze8yvTmfCCdTYPrB4FmzaUBlrchxOnMSc8i6PM4to8Avv9Su3Z1nVYOaYiJ32b+cLI
 BpP5eGR4IFMfuig3q+aDiYLkT8Xi41yIKswVkI2IOnKqaxrgZyqMnvFpr7tWsXugSDJ6
 ri2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=lz9u63IzQ1ny8p1MWQPaj5qIKrAWncsqwglKvPt7b18=;
 b=k1suAjz9aSkdDqN6ROMvWL6jHJcymK0MoWEJ0NB9oNip0cxmGuKCkHQj1bJnsxrvGx
 Txp9f9o1IpuJ7KX3RBPVoh39umCYnZ3W+7NjLKlzHwHe2T6eER4IDMF/oJHu7Y0POQW8
 ZlzJ08PDYu2fE7dvaVV/VjTM/lFpS0CMJsE3A6Ekr4HbUPibiNnYWg8WxyKoh5v6k325
 rB2q3mZzbv4gbSaLD1uxGiOO+faqseRzra4o7Aq7b46VX4ydPomaeKAdDi+5Wq1U8GUp
 Y6S3lIcrkISKRNEZk19hDVTmhGDMPEXSMgqjXAwu2IvYtCsZEEfdyVrjMgGmXgiI8MDi
 NyFA==
X-Gm-Message-State: AOAM5337XHX77vHnAbsG6c1fdpWuqwvzd091E30lddZuvyy0NyPXK050
 UbKvwC8/sz+4yf0skF79PhzDwFkZSoGiyebA5Ct34A==
X-Google-Smtp-Source: ABdhPJwhxXcWrkTJz60CRz6vpb74RSpT9uPgyqmT08HWXkR+SLRk4QdjvtxL/93LY0auGa7N0SvwegppCk4zzWi/9Z4=
X-Received: by 2002:a05:620a:1392:b0:60d:d76a:5073 with SMTP id
 k18-20020a05620a139200b0060dd76a5073mr1620167qki.59.1646476683364; Sat, 05
 Mar 2022 02:38:03 -0800 (PST)
MIME-Version: 1.0
References: <20220304202406.846485-1-robdclark@gmail.com>
 <CAA8EJprik57F+t0KicoYaRm=oDOgcQHyHSBjJKbekBKjO_-=0A@mail.gmail.com>
 <CAF6AEGtM+Jhye7ahW3uFg-8PFHH257-T7Qudo=XMU5-AU2LvcA@mail.gmail.com>
In-Reply-To: <CAF6AEGtM+Jhye7ahW3uFg-8PFHH257-T7Qudo=XMU5-AU2LvcA@mail.gmail.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sat, 5 Mar 2022 13:37:52 +0300
Message-ID: <CAA8EJpr3yDW=f4gc4d06KiETtNJkrLNaTcOx28UpS3toVOh6nw@mail.gmail.com>
Subject: Re: [PATCH] drm/msm/a6xx: Fix missing ARRAY_SIZE() check
To: Rob Clark <robdclark@gmail.com>
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
Cc: Rob Clark <robdclark@chromium.org>,
 freedreno <freedreno@lists.freedesktop.org>,
 Jonathan Marek <jonathan@marek.ca>, David Airlie <airlied@linux.ie>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Jordan Crouse <jordan@cosmicpenguin.net>,
 Akhil P Oommen <quic_akhilpo@quicinc.com>, Sean Paul <sean@poorly.run>,
 open list <linux-kernel@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, 5 Mar 2022 at 00:57, Rob Clark <robdclark@gmail.com> wrote:
>
> On Fri, Mar 4, 2022 at 1:47 PM Dmitry Baryshkov
> <dmitry.baryshkov@linaro.org> wrote:
> >
> > On Fri, 4 Mar 2022 at 23:23, Rob Clark <robdclark@gmail.com> wrote:
> > >
> > > From: Rob Clark <robdclark@chromium.org>
> > >
> > > Fixes: f6d62d091cfd ("drm/msm/a6xx: add support for Adreno 660 GPU")
> > > Signed-off-by: Rob Clark <robdclark@chromium.org>
> >
> > Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > However see the comment below.
> >
> > > ---
> > >  drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 1 +
> > >  1 file changed, 1 insertion(+)
> > >
> > > diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> > > index 02b47977b5c3..6406d8c3411a 100644
> > > --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> > > +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> > > @@ -687,6 +687,7 @@ static void a6xx_set_cp_protect(struct msm_gpu *gpu)
> > >
> > >         BUILD_BUG_ON(ARRAY_SIZE(a6xx_protect) > 32);
> > >         BUILD_BUG_ON(ARRAY_SIZE(a650_protect) > 48);
> > > +       BUILD_BUG_ON(ARRAY_SIZE(a660_protect) > 48);
> >
> > The magic number 32 and 48 are repeated through this code. I'd suggest
> > to define them and use defined names.
> > It can come up as a separate commit.
> >
>
> Or perhaps instead:

IMO this is much better.
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> ----
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> index 6406d8c3411a..58c371930fb4 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> @@ -683,20 +683,23 @@ static void a6xx_set_cp_protect(struct msm_gpu *gpu)
>  {
>         struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
>         const u32 *regs = a6xx_protect;
> -       unsigned i, count = ARRAY_SIZE(a6xx_protect), count_max = 32;
> -
> -       BUILD_BUG_ON(ARRAY_SIZE(a6xx_protect) > 32);
> -       BUILD_BUG_ON(ARRAY_SIZE(a650_protect) > 48);
> -       BUILD_BUG_ON(ARRAY_SIZE(a660_protect) > 48);
> +       unsigned i, count, count_max;
>
>         if (adreno_is_a650(adreno_gpu)) {
>                 regs = a650_protect;
>                 count = ARRAY_SIZE(a650_protect);
>                 count_max = 48;
> +               BUILD_BUG_ON(ARRAY_SIZE(a650_protect) > 48);
>         } else if (adreno_is_a660_family(adreno_gpu)) {
>                 regs = a660_protect;
>                 count = ARRAY_SIZE(a660_protect);
>                 count_max = 48;
> +               BUILD_BUG_ON(ARRAY_SIZE(a660_protect) > 48);
> +       } else {
> +               regs = a6xx_protect;
> +               count = ARRAY_SIZE(a6xx_protect);
> +               count_max = 32;
> +               BUILD_BUG_ON(ARRAY_SIZE(a6xx_protect) > 32);
>         }
>
>         /*
> ----
>
> that moves each of the two uses of constant together..  adding three
> #defines each used only twice seems a bit silly, IMHO
>
> BR,
> -R



-- 
With best wishes
Dmitry
