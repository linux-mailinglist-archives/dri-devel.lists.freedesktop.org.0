Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A93D9923C24
	for <lists+dri-devel@lfdr.de>; Tue,  2 Jul 2024 13:13:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 29B1D10E5AC;
	Tue,  2 Jul 2024 11:13:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="O561il+f";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com
 [209.85.128.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C172310E5AC
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Jul 2024 11:13:12 +0000 (UTC)
Received: by mail-yw1-f179.google.com with SMTP id
 00721157ae682-64b101294c0so35957957b3.1
 for <dri-devel@lists.freedesktop.org>; Tue, 02 Jul 2024 04:13:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1719918791; x=1720523591; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=yZwkViluL9fZYJDEVjVHxofuWUETp5oFGLDBWD1R34Y=;
 b=O561il+fCtourU7rYWiMGSY2Si6xoPaDS7nuz10MU2NLoqWYoggm+Mx/ZLJAUnvgBz
 xRuiCU2sfJSR0iGp2rAFshHyKDBwFYO2bj9PUWmwTzZrYckRHaKB7myITr9sRKljZnUI
 qeKu09VNvbQgpteVvpt7y9zq1lRlrJLZB4o8IRA8WbjIxD8I8FkaLMxr+OPvOK5tYVIF
 NGmny19w5K9M+ZMQlprFcDnztgiD3sIELW2R3sklaASJDZrt+F7f1JxzFUpE+Z5EI8FK
 XFk+hNoQR/Beql7N9aWPLOi/c9ibQnMOyXM6uRX1wa5I0oQHS30wkCT6kbx+TfdinXKv
 NkjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719918791; x=1720523591;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=yZwkViluL9fZYJDEVjVHxofuWUETp5oFGLDBWD1R34Y=;
 b=qzqdhrvLoEDOD5nj93y8RN5dErIjRHFzdAv/QSj6raXlTsQqGG2r535XTLs22CTmqJ
 2fNOIEwMsbrMnilU9xnnS05NkHO5by6ULimLKp18hRe8FjV2Qa9xMdcCe9GGTBRHW7zo
 CwILfV9rVwBIcHXA+2wYQvUaF8j9Vx5PByUmhGBUzXsGURRd1QckPZtnOpFFDrudkrxI
 ruRD/fHvCPJmp8DZDV9NSYqjlCyQ6nNLFgyfn8R06bttLr0OsDBRU4t+SVxvCFhNQZcC
 vqfbAtyLN+G8EjDNPyaIHq3v+6/hNZNaQxOnjW08NjolmuxWlgM5P8XTy1X3+sOCFqjB
 QNhQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXpZnho2PQwTm7tgLzxpxnv15znHKrc/SkBHo7ldtw7KsNugs3DnwDk/UvUGXUjVuDIF+YqDaeAhe8k9k04/fEyDm/ya86/oNIrXIBtBe7d
X-Gm-Message-State: AOJu0Yz32l4BISk2FbFD7XQ11/EpZAxwZlVb1NdZoz61Uyk8FWYq3Eec
 a6rLoijtQo8FFwUeby+3G5wKGwHubMS6y+PxattILmAupaWNFP8W6Ah/edRjvv6bYvm9vSona5+
 phoejM8TqwxYr32ndddltg+D9VlUYRxOtt8JAOg==
X-Google-Smtp-Source: AGHT+IE+XENqew12llqHSNS380ty5q6Xoz123+Kygwygr+yT2Q9JclDAXyV8vjEJVMRy6iBc7TeDkbDj9c+tJaEHcv4=
X-Received: by 2002:a81:69c4:0:b0:630:de2f:79b8 with SMTP id
 00721157ae682-64c71802f74mr90961787b3.13.1719918791593; Tue, 02 Jul 2024
 04:13:11 -0700 (PDT)
MIME-Version: 1.0
References: <20240630-oneplus8-v2-0-c4a1f8da74f1@postmarketos.org>
 <20240630-oneplus8-v2-6-c4a1f8da74f1@postmarketos.org>
 <37y25ko7q2hoqlzvteqt3cj2lsms3lkwi6xu6qm4xaq5gm6pus@lxh4jo4hpryv>
 <efa5b7c2-05ac-4354-830b-1d5a66e2fb58@postmarketos.org>
In-Reply-To: <efa5b7c2-05ac-4354-830b-1d5a66e2fb58@postmarketos.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 2 Jul 2024 14:13:00 +0300
Message-ID: <CAA8EJprniEW4ktqRQb0Zac1BcwzrvBbXQcve6V3rGmCOAC-vUA@mail.gmail.com>
Subject: Re: [PATCH v2 6/8] drm/panel: add driver for samsung amb655x
To: Caleb Connolly <caleb@postmarketos.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, Henrik Rydberg <rydberg@bitmath.org>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-input@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 ~postmarketos/upstreaming@lists.sr.ht
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

On Tue, 2 Jul 2024 at 12:43, Caleb Connolly <caleb@postmarketos.org> wrote:
>
>
>
> On 01/07/2024 22:32, Dmitry Baryshkov wrote:
> > On Sun, Jun 30, 2024 at 08:36:29PM GMT, Caleb Connolly wrote:
> >> This is a 1080x2400 120hz panel used on the OnePlus 8T. It uses DSC but
> >> with many non-standard DCS commands.
> >>
> >> The only user of this panel (the OnePlus 8T) has a bug somewhere in the
> >> DSI stack whereby it isn't possible to properly initialize this panel
> >> after a reset. As a result, the reset GPIO is made optional so it can be
> >> left unused on that device.
> >>
> >> Signed-off-by: Caleb Connolly <caleb@postmarketos.org>
> >> ---
> >>   MAINTAINERS                                   |   7 +
> >>   drivers/gpu/drm/panel/Kconfig                 |   9 +
> >>   drivers/gpu/drm/panel/Makefile                |   1 +
> >>   drivers/gpu/drm/panel/panel-samsung-amb655x.c | 399 ++++++++++++++++++++++++++
> >>   4 files changed, 416 insertions(+)
> >>
> >> diff --git a/MAINTAINERS b/MAINTAINERS
> >> index 807feae089c4..2b9cfbf92d7a 100644
> >> --- a/MAINTAINERS
> >> +++ b/MAINTAINERS
> >> @@ -7142,8 +7142,15 @@ M:    Robert Chiras <robert.chiras@nxp.com>
> >>   S: Maintained
> >>   F: Documentation/devicetree/bindings/display/panel/raydium,rm67191.yaml
> >>   F: drivers/gpu/drm/panel/panel-raydium-rm67191.c
> >>
> >> +DRM DRIVER FOR SAMSUNG AMB655X PANEL
> >> +M:  Caleb Connolly <caleb@postmarketos.org>
> >> +S:  Maintained
> >> +T:  git https://gitlab.freedesktop.org/drm/misc/kernel.git
> >> +F:  Documentation/devicetree/bindings/display/panel/samsung,amb655x.yaml
> >> +F:  drivers/gpu/drm/panel/panel-samsung-amb655x.c
> >> +
> >>   DRM DRIVER FOR SAMSUNG DB7430 PANELS
> >>   M: Linus Walleij <linus.walleij@linaro.org>
> >>   S: Maintained
> >>   T: git https://gitlab.freedesktop.org/drm/misc/kernel.git
> >> diff --git a/drivers/gpu/drm/panel/Kconfig b/drivers/gpu/drm/panel/Kconfig
> >> index bf4eadfe21cb..7203d16ab20a 100644
> >> --- a/drivers/gpu/drm/panel/Kconfig
> >> +++ b/drivers/gpu/drm/panel/Kconfig
> >> @@ -590,8 +590,17 @@ config DRM_PANEL_SAMSUNG_S6E88A0_AMS452EF01
> >>      depends on OF
> >>      select DRM_MIPI_DSI
> >>      select VIDEOMODE_HELPERS
> >>
> >> +config DRM_PANEL_SAMSUNG_AMB655X
> >> +    tristate "Samsung AMB655X DSI panel"
> >> +    depends on OF
> >> +    depends on DRM_MIPI_DSI
> >> +    depends on BACKLIGHT_CLASS_DEVICE
> >> +    help
> >> +      DRM panel driver for the Samsung AMB655X panel.
> >> +      This panel has a resolution of 1080x2400 @ 60hz or 120Hz.
> >> +
> >>   config DRM_PANEL_SAMSUNG_ATNA33XC20
> >>      tristate "Samsung ATNA33XC20 eDP panel"
> >>      depends on OF
> >>      depends on BACKLIGHT_CLASS_DEVICE
> >> diff --git a/drivers/gpu/drm/panel/Makefile b/drivers/gpu/drm/panel/Makefile
> >> index 051b75b3df7b..be6d500a56a4 100644
> >> --- a/drivers/gpu/drm/panel/Makefile
> >> +++ b/drivers/gpu/drm/panel/Makefile
> >> @@ -58,8 +58,9 @@ obj-$(CONFIG_DRM_PANEL_RAYDIUM_RM67191) += panel-raydium-rm67191.o
> >>   obj-$(CONFIG_DRM_PANEL_RAYDIUM_RM68200) += panel-raydium-rm68200.o
> >>   obj-$(CONFIG_DRM_PANEL_RAYDIUM_RM692E5) += panel-raydium-rm692e5.o
> >>   obj-$(CONFIG_DRM_PANEL_RAYDIUM_RM69380) += panel-raydium-rm69380.o
> >>   obj-$(CONFIG_DRM_PANEL_RONBO_RB070D30) += panel-ronbo-rb070d30.o
> >> +obj-$(CONFIG_DRM_PANEL_SAMSUNG_AMB655X) += panel-samsung-amb655x.o
> >>   obj-$(CONFIG_DRM_PANEL_SAMSUNG_ATNA33XC20) += panel-samsung-atna33xc20.o
> >>   obj-$(CONFIG_DRM_PANEL_SAMSUNG_DB7430) += panel-samsung-db7430.o
> >>   obj-$(CONFIG_DRM_PANEL_SAMSUNG_LD9040) += panel-samsung-ld9040.o
> >>   obj-$(CONFIG_DRM_PANEL_SAMSUNG_S6D16D0) += panel-samsung-s6d16d0.o
> >
> >
> >> +static int samsung_amb655x_prepare(struct drm_panel *panel)
> >> +{
> >> +    struct samsung_amb655x *ctx = to_samsung_amb655x(panel);
> >> +    struct device *dev = &ctx->dsi->dev;
> >> +    int ret;
> >> +
> >> +    /*
> >> +     * During the first call to prepare, the regulators are already enabled
> >> +     * since they're boot-on. Avoid enabling them twice so we keep the refcounts
> >> +     * balanced.
> >
> > I see your intent, but I don't think this is fully correct. If the
> > driver gets rebound, then it will perform one extra disable call. On the
> > next driver probe / enable / disable / remove cycle the driver will
> > perform one more, underflowing enable count. I think
> > regulator_init_complete_work_function should give the phone enough time
> > to boot the panel.
>
> I do make an extra call to regulator_bulk_enable() in probe(), does that
> balance things out?

Hmm, I missed it. But if you have it, why not just have a single
regulator_bulk_enable() in pre_enable() like everybody else does?

> >
> >> +     */
> >> +    if (!regulator_is_enabled(ctx->supplies[0].consumer)) {
> >> +            ret = regulator_bulk_enable(ARRAY_SIZE(ctx->supplies), ctx->supplies);
> >> +            if (ret) {
> >> +                    dev_err(dev, "Failed to enable regulators: %d\n", ret);
> >> +                    return ret;
> >> +            }
> >> +    }
> >> +
> >



-- 
With best wishes
Dmitry
