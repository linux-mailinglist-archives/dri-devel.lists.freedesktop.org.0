Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F2AAF3CC709
	for <lists+dri-devel@lfdr.de>; Sun, 18 Jul 2021 02:32:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 52E096EAC7;
	Sun, 18 Jul 2021 00:32:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [IPv6:2a00:1450:4864:20::12d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BEAD76EAC7
 for <dri-devel@lists.freedesktop.org>; Sun, 18 Jul 2021 00:32:00 +0000 (UTC)
Received: by mail-lf1-x12d.google.com with SMTP id x25so22508130lfu.13
 for <dri-devel@lists.freedesktop.org>; Sat, 17 Jul 2021 17:32:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=GiOcA9fDhX332QQkbECnDAuU57MnDvjKhHt74brAsd4=;
 b=QqbnQgsv/ajdlgCbOM0gq0g7FZNs0AbFigA/0ipXJiEXJGly+tlK9erNMERE8PA2rQ
 fV/gVY5xNUty2kHdSElmFKDGFoS+yMK3mf7CiRP6LrqKaFPtW5EDm9I4uFh2ZtZh4s3m
 z4bMO4lo51Dd3Qwhrc++2IKRxPSBmqwPAiUYFMlSPYHp9flltp5ibXqvq61dJlPGJTaQ
 0okiiInLKbfmBTEFnH1VyZdD2Ug8K3mh4o2jS+fAxh6J1K14jl3StwsfqWVPhzPYeRRp
 H45cRIUF/dYngweD8xQ0drMSaJrVAdN3Yn8w3t1wXnRcgfvCknH9ovNC64WK2NC7ho+i
 WMBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=GiOcA9fDhX332QQkbECnDAuU57MnDvjKhHt74brAsd4=;
 b=ei6RGbkZN6DN44I9i0zVLimJ+MamSKAiwhYayJ1/zat02WJRSnNkMc6vJOB508fr5m
 zyQeHkQrf3DeojYIqkSo7g4qRHffdMiYsxEQhM4t/o/m0V3Q94m2db50l2EblC9v7QO1
 mWfx0RnZPpwhzZwFaVxt/Kn0Yk2ABWdOXmSmZo6crB6YrRurdy+kb23Z7zUTndmXooeB
 2EIt5qrc9GTFmOyeEWc3B99chQZ2HgVCom881/pgd/qjLyj7ttxBa124NYw6WCGsNmsb
 KVX3N5ebZNQc7mCkUL0IzDsYslOHoBTPVWGiSVkmBRyez3i0bv6Gyt82B83FrRG9WFCp
 8EwA==
X-Gm-Message-State: AOAM532+G/J5P/zBmeKG7dA+fc77Ktxp7dw9GgpMPCuIrMAWhK/THDo9
 i0f4kAiUPwQAbJHESK0utp1mNRjADlUC4p0c0oc8Gw==
X-Google-Smtp-Source: ABdhPJzUE4mwcMvftXDt9OelhGDF5Xj2/T270B5egWGsaIKWTNtuSaIt9NhYbKXb4xTog5SSevqmX/HoABHDg7tXXbs=
X-Received: by 2002:a05:6512:3f1f:: with SMTP id
 y31mr6296371lfa.29.1626568319143; 
 Sat, 17 Jul 2021 17:31:59 -0700 (PDT)
MIME-Version: 1.0
References: <1626430843-23823-1-git-send-email-dillon.minfei@gmail.com>
 <1626430843-23823-3-git-send-email-dillon.minfei@gmail.com>
In-Reply-To: <1626430843-23823-3-git-send-email-dillon.minfei@gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Sun, 18 Jul 2021 02:31:48 +0200
Message-ID: <CACRpkdZZyN_8ND52+piHYaksujwwwTMigkv6eL0fih_2dYZ4Lg@mail.gmail.com>
Subject: Re: [PATCH 2/2] drm/panel: Add ilitek ili9341 panel driver
To: dillon min <dillon.minfei@gmail.com>
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
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>,
 =?UTF-8?Q?Noralf_Tr=C3=B8nnes?= <noralf@tronnes.org>,
 Dave Airlie <airlied@linux.ie>, linux-kernel <linux-kernel@vger.kernel.org>,
 Doug Anderson <dianders@chromium.org>,
 "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Rob Herring <robh+dt@kernel.org>,
 "thierry.reding@gmail.com" <thierry.reding@gmail.com>,
 Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Dillon,

thanks for your patch!

On Fri, Jul 16, 2021 at 12:20 PM <dillon.minfei@gmail.com> wrote:

> From: Dillon Min <dillon.minfei@gmail.com>
>
> This driver combine tiny/ili9341.c mipi_dbi_interface driver
> with mipi_dpi_interface driver, can support ili9341 with serial
> mode or parallel rgb interface mode by register configuration.
>
> Signed-off-by: Dillon Min <dillon.minfei@gmail.com>

Nice!

> +config DRM_PANEL_ILITEK_ILI9341
> +       tristate "Ilitek ILI9341 240x320 QVGA panels"
> +       depends on OF && SPI
> +       depends on DRM_KMS_HELPER
> +       depends on DRM_KMS_CMA_HELPER
(...)
> +#include <drm/drm_gem_framebuffer_helper.h>
> +#include <drm/drm_gem_cma_helper.h>
> +#include <drm/drm_fb_helper.h>
> +#include <drm/drm_gem_atomic_helper.h>
> +#include <drm/drm_atomic_helper.h>

Hm now there is a (partial) KMS driver in the panel driver, kinda, sorta.
Is this the right split? I'm not the best with DRM infrastructure,
just asking.

> +struct ili9341_config {
> +       u32 max_spi_speed;
> +       /** @mode: the drm display mode */
> +       const struct drm_display_mode mode;
> +       /* @ca: TODO: need comments for this register */
> +       u8 ca[ILI9341_CA_LEN];

These are all in the datasheet but I guess you plan to add these
TODOs later. (It's fine I suppose, the driver is already very nice.)

> +       struct regulator *vcc;

Use the right name of the pin for the regulator. I guess this is actually
vci. I would implement all three regulators and get them as bulk.
See e.g. drivers/gpu/drm/panel/panel-samsung-s6e3ha2.c
for an example on how to get and enable several regulators
using bulk.

The regulator framework will provide dummy regulators if you
didn't define some of them so it is fine to just provide one or two.

Yours,
Linus Walleij
