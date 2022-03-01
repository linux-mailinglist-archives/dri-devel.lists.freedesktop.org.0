Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 067BB4C98F8
	for <lists+dri-devel@lfdr.de>; Wed,  2 Mar 2022 00:13:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C8D110E7AC;
	Tue,  1 Mar 2022 23:13:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb29.google.com (mail-yb1-xb29.google.com
 [IPv6:2607:f8b0:4864:20::b29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B882810E7AC
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Mar 2022 23:13:08 +0000 (UTC)
Received: by mail-yb1-xb29.google.com with SMTP id g26so4787380ybj.10
 for <dri-devel@lists.freedesktop.org>; Tue, 01 Mar 2022 15:13:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=WVmXAPYzuyUp9cPda82pRMyWYcgH127Atrd/jKRj/J8=;
 b=MMpefUKWjVLrwv5LyYzK/4sO2meBH5IYzRhRVr9wZZiL3CfVmFuUqulaLyIvmAr/9P
 lcX5LJx1OjRdXhAkN0EV/OcgYBIW8d2zmMKg89H5NNiw27exN7RV/WEvq010kN5bKAEq
 mq8C/nHdHhjSdmvSIC6GaJC8ChSXxn+xzKeor86oyrtkFsHaGDgkL9cE4qEFBxbgg5iA
 FkgSVGUbuNjxoqVDYUgXwDz+YYbCheAFUIbT69Nvtk1fsW1kzTFSaRak4iYGKWUYX38d
 6Q/C1ft2MI/Mka0cEyF2sie6ORc6UeCKIXMvrLxW7QXpMb7VL7v82VTOuA4DHrjoHz6B
 SKLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=WVmXAPYzuyUp9cPda82pRMyWYcgH127Atrd/jKRj/J8=;
 b=u4QFobXEqWsceVUOHASZb1cKMncRgH655mRv7kA9KpOofujWdYZGsf3WBzJ/HsMZFR
 KnUYxzw77snuBFCDCGytQhAEMcTOVHLjXc0z3bADqxd8EAh/CzP5g++m+0j6tpBlLWjm
 ndXH7VbJvGK7LArrc0L/coCUCqVNXdlJB9z2g9vuC/CYnkVUv2+sBAlFdCGWrJfm6bDj
 47R905tw45A3us9uuAghSDF4C0MLVV1gMIxyPlH2mL7a13KRwTOLQ/gHfP4V/7w3LW1j
 qYwjraDBKsI2bSbQh3PMb4c18ecMlU7tLqWH55S2aprTnuYfCjSQTB4Zq0xiyX6eHrk/
 3nYg==
X-Gm-Message-State: AOAM533jKHbYG9L3MFIIggMsC4jBisv3qyvcyz+Z8o8+tV7RSJh9J4Fq
 hL2hq2S6vzRV7cSUKi6JGblSJ8eBT0LC4qdZtwZBQg==
X-Google-Smtp-Source: ABdhPJyEEmeor1mBkhy3MUQwqj7GjVnh17sHiCPOo6b/VIrKmCUfokqzS4hxI37QqfQnmDEVDqnyEF7BicOglbuC5Iw=
X-Received: by 2002:a25:cc8b:0:b0:628:9263:38ba with SMTP id
 l133-20020a25cc8b000000b00628926338bamr578433ybf.291.1646176387971; Tue, 01
 Mar 2022 15:13:07 -0800 (PST)
MIME-Version: 1.0
References: <20220301141247.126911-1-jagan@amarulasolutions.com>
 <20220301141247.126911-8-jagan@amarulasolutions.com>
In-Reply-To: <20220301141247.126911-8-jagan@amarulasolutions.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 2 Mar 2022 00:12:55 +0100
Message-ID: <CACRpkdZAPbe=_RMjnHkmAVBUir=HobMPWtp-4TQgETSsmEd8ww@mail.gmail.com>
Subject: Re: [PATCH v2 8/8] drm: bridge: anx7625: Switch to
 devm_drm_of_get_bridge
To: Jagan Teki <jagan@amarulasolutions.com>
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
Cc: dri-devel@lists.freedesktop.org, linux-amarula@amarulasolutions.com,
 Robert Foss <robert.foss@linaro.org>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <narmstrong@baylibre.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Mar 1, 2022 at 3:13 PM Jagan Teki <jagan@amarulasolutions.com> wrote:

> devm_drm_of_get_bridge is capable of looking up the downstream
> bridge and panel and trying to add a panel bridge if the panel
> is found.
>
> Replace explicit finding calls with devm_drm_of_get_bridge.
>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
> ---
> Changes for v2:
> - split the patch

This will be nice code reduction when it works!

> -       struct drm_panel *panel = NULL;
> -       struct drm_bridge *bridge = NULL;
> +       struct drm_bridge *bridge;

OK... and then you delete the code that uses panel. But:

static void mcde_dsi_unbind(struct device *dev, struct device *master,
                            void *data)
{
        struct mcde_dsi *d = dev_get_drvdata(dev);

        if (d->panel)
                drm_panel_bridge_remove(d->bridge_out);
        regmap_update_bits(d->prcmu, PRCM_DSI_SW_RESET,
                           PRCM_DSI_SW_RESET_DSI0_SW_RESETN, 0);
}

So this will not even compile.

I suppose you have a solution for removing the panel bridge automatically
as well?

Yours,
Linus Walleij
