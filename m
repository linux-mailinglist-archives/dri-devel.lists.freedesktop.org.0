Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CD48539AAD9
	for <lists+dri-devel@lfdr.de>; Thu,  3 Jun 2021 21:19:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C259E6F4F1;
	Thu,  3 Jun 2021 19:19:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x330.google.com (mail-ot1-x330.google.com
 [IPv6:2607:f8b0:4864:20::330])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EDFCA6F4FE
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Jun 2021 19:19:53 +0000 (UTC)
Received: by mail-ot1-x330.google.com with SMTP id
 w23-20020a9d5a970000b02903d0ef989477so2397572oth.9
 for <dri-devel@lists.freedesktop.org>; Thu, 03 Jun 2021 12:19:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=XDuTHy+WSy89MPdjzMkB+2AAnStth5q1riD/MqItVU4=;
 b=OI+T3T0cL+t14gfJunetRWN2tgWBdLvB4KxFRPyK5DVeHqTxqvLnfDIA5BvAnl6X2Q
 3QPRLndKmLybEGc4bt8aZ34d10UMz+vVibFdpJL+LApb1vVQutb06CCJcPEC7QV5PXDj
 TBdhq3qXqsTYTBozWkE7SUSfa41pqf+LXpaAA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=XDuTHy+WSy89MPdjzMkB+2AAnStth5q1riD/MqItVU4=;
 b=W2EVnBMjmsxIuk77XaQyYNbmhrarwSJcUEN4PnAW/oH5qUvurCNptqMO0GNAOekXAs
 OcY80iY2IsUCPHUU7HyRfy8aZ33Spb+0zme7h7/Eh3v0ai1cDTiE8B0DDj2hJjg+urmU
 HQj30cTgspJ3CO451QiqmQ7GJgDZWcV+vFrdy3CJTF/yz/ADo5atU3sEfwfZSLSdlMcC
 RMKaA8Gn95Ta6l2/XOybSxkDZ9iA3OKbm22m4p2Nsi+IYj1wpcEh+1ZTz2eqYO62SyPA
 oPqy6EYlV7S0Dbon5MuAejgRxJlxk3Hr74emfWcI7SrTbXZ3Pp6ibAFoN5jvFL/CfxAC
 djBg==
X-Gm-Message-State: AOAM533Cnwu9Ms1fCCkanYlfT3OoABw0Kt3GgqvHYaQFwm95cmXFt1rE
 p85k2SZT5omcIpuMwxVQRFRjJnl85YMM5FjZBtJRFQ==
X-Google-Smtp-Source: ABdhPJxn3K6b7ZhhEb/4cSo+a3w6aFxRrwtuOfV0rALuSFrFAk8eTzKE1DKQNbbx3q34atx5iWRm6vKzm7Sjgap1ebk=
X-Received: by 2002:a9d:27a4:: with SMTP id c33mr687970otb.281.1622747993300; 
 Thu, 03 Jun 2021 12:19:53 -0700 (PDT)
MIME-Version: 1.0
References: <20210602215252.695994-1-keescook@chromium.org>
 <20210602215252.695994-4-keescook@chromium.org>
 <CAL_JsqLO_YbT3VU0+uHH2t6ONs_dWfBhqds9okYD0254ZiBf=A@mail.gmail.com>
In-Reply-To: <CAL_JsqLO_YbT3VU0+uHH2t6ONs_dWfBhqds9okYD0254ZiBf=A@mail.gmail.com>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Thu, 3 Jun 2021 21:19:42 +0200
Message-ID: <CAKMK7uFBQk+KA0fPdjkB9=7By2a9V5i=u84ufO+n3dmjayq+vw@mail.gmail.com>
Subject: Re: [PATCH 3/3] drm/pl111: depend on CONFIG_VEXPRESS_CONFIG
To: Rob Herring <robh@kernel.org>
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
Cc: Arnd Bergmann <arnd@kernel.org>,
 Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
 Kees Cook <keescook@chromium.org>, Emma Anholt <emma@anholt.net>,
 David Airlie <airlied@linux.ie>, Sam Ravnborg <sam@ravnborg.org>,
 Sharat Masetty <smasetty@codeaurora.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Dave Airlie <airlied@redhat.com>, freedreno <freedreno@lists.freedesktop.org>,
 Sean Paul <sean@poorly.run>, kernel test robot <lkp@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jun 3, 2021 at 8:43 PM Rob Herring <robh@kernel.org> wrote:
>
> On Wed, Jun 2, 2021 at 4:53 PM Kees Cook <keescook@chromium.org> wrote:
> >
> > Avoid randconfig build failures by requiring VEXPRESS_CONFIG:
> >
> > aarch64-linux-gnu-ld: drivers/gpu/drm/pl111/pl111_versatile.o: in function `pl111_vexpress_clcd_init':
> > pl111_versatile.c:(.text+0x220): undefined reference to `devm_regmap_init_vexpress_config'
>
> pl111_vexpress_clcd_init() starts with:
>
> if (!IS_ENABLED(CONFIG_VEXPRESS_CONFIG))
>                 return -ENODEV;
>
> Isn't that supposed to be enough to avoid an undefined reference?
>
> Making the whole file depend on VEXPRESS_CONFIG is not right either.
> Not all platforms need it.

It needs a compile-time status inline then for the functions we're
using in pl111.
-Daniel

>
> >
> > Fixes: 826fc86b5903 ("drm: pl111: Move VExpress setup into versatile init")
> > Signed-off-by: Kees Cook <keescook@chromium.org>
> > ---
> >  drivers/gpu/drm/pl111/Kconfig | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/gpu/drm/pl111/Kconfig b/drivers/gpu/drm/pl111/Kconfig
> > index 80f6748055e3..c5210a5bef1b 100644
> > --- a/drivers/gpu/drm/pl111/Kconfig
> > +++ b/drivers/gpu/drm/pl111/Kconfig
> > @@ -2,7 +2,7 @@
> >  config DRM_PL111
> >         tristate "DRM Support for PL111 CLCD Controller"
> >         depends on DRM
> > -       depends on ARM || ARM64 || COMPILE_TEST
> > +       depends on VEXPRESS_CONFIG
> >         depends on COMMON_CLK
> >         select DRM_KMS_HELPER
> >         select DRM_KMS_CMA_HELPER
> > --
> > 2.25.1
> >



-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
