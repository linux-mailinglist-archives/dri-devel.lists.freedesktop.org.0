Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E73E164D7E9
	for <lists+dri-devel@lfdr.de>; Thu, 15 Dec 2022 09:42:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B348B10E4F9;
	Thu, 15 Dec 2022 08:42:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb36.google.com (mail-yb1-xb36.google.com
 [IPv6:2607:f8b0:4864:20::b36])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 111AD10E4F9
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Dec 2022 08:42:00 +0000 (UTC)
Received: by mail-yb1-xb36.google.com with SMTP id j206so2711651ybj.1
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Dec 2022 00:42:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=HXhudpMG5ipoBTmDLzbqLq8C65gsSAGF3azolDiFn1I=;
 b=oS7MvThUFU/JGOGYBihO3JXdurEUA6AetFLg9F1AnzodZpwdxJ17GYUjSqGNCzoTGp
 CRuFzoKrac00hc011hygTaS6JwiED8YasNIiSyZOwO7Rr2BVjvDSPNZ2jW+55SXgL37h
 zS6tDMdtBWFqggnFJiu/bgOLD6DBI6onfSgpbJOitHJdVcPWTCDFAYwazw/7H8ZBL9Ud
 AFOFTA2S1zpGlxZ8fdoJeDXulzQWRXncyFQDnM4Af34bO2NwHMXQoF1R1nNbw0+pdP5o
 2yTopVMiLG76IUn8j6mKOuDmJj2ULCmX8EJyryF4gVzwlQtyLCBOMWPY0wZlTC8TJ9p8
 GxWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=HXhudpMG5ipoBTmDLzbqLq8C65gsSAGF3azolDiFn1I=;
 b=zS9orVZbhDdJLU6KQtqLPNvuRQp89Fxo4eInsM26bL6Jf70QqJhPG+wdcKx02LE8LV
 rA7dMoPt1RKvzM6QPcS0Lecig7c5cghvzL4TPHKYSVq1FE2O2tasEMSw5VIv/LfZv9am
 LTpYCgengSQVbaRNT2x9bO+PDEVRc7dxWS8AfAKLRCdgK0yyaDnTjLfowIiRqSiuuR+R
 MgzX229kKB4QkZHjlMkLf0wcNWVircRfshpS3y60QkfjObnUYkRyXbqDrrTntxPaJ+oj
 h2oaptXqQQZcXNumDHIY3w0xfLz/nic2c6euWCg24bJ5E7HOjlLquTaPZMsEuKwHnoXL
 RVrQ==
X-Gm-Message-State: ANoB5pnhzNAGYXeWLqIqq6paBqHS4p9wn5DroDDIel4WH0223Qietct5
 gBQ+QdEIOu4BWg04tHncc1jPrjabxW12yP2jBflLTQ==
X-Google-Smtp-Source: AA0mqf4x35ybJ0oUwOo6o569NEGQzeowDVqPBuoUY4Xc84d7hRJqGGcAdp6C8e04o0YEL7GfLMl3vaM3+xKvTlpWnG0=
X-Received: by 2002:a25:7648:0:b0:6fe:54d5:2524 with SMTP id
 r69-20020a257648000000b006fe54d52524mr24020034ybc.522.1671093719699; Thu, 15
 Dec 2022 00:41:59 -0800 (PST)
MIME-Version: 1.0
References: <20221214110037.149387-1-cbranchereau@gmail.com>
 <20221214110037.149387-2-cbranchereau@gmail.com>
In-Reply-To: <20221214110037.149387-2-cbranchereau@gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 15 Dec 2022 09:41:48 +0100
Message-ID: <CACRpkdag1ZDyHRu5FqLWrsiqbmVuX2Wj5z67yhkg_=ooFqsboQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] drm/panel: add the orisetech ota5601a
To: Christophe Branchereau <cbranchereau@gmail.com>
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
Cc: devicetree@vger.kernel.org, sam@ravnborg.org, linux-kernel@vger.kernel.org,
 robh+dt@kernel.org, thierry.reding@gmail.com, dri-devel@lists.freedesktop.org,
 krzysztof.kozlowski+dt@linaro.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Christophe,

thanks for your patch!

On Wed, Dec 14, 2022 at 12:01 PM Christophe Branchereau
<cbranchereau@gmail.com> wrote:

> Add the orisetech ota5601a ic driver
>
> For now it only supports the focaltech gpt3 3" 640x480 ips panel
> found in the ylm rg300x handheld.
>
> Signed-off-by: Christophe Branchereau <cbranchereau@gmail.com>
(...)
> +config DRM_PANEL_ORISETECH_OTA5601A
> +       tristate "Orise Technology ota5601a RGB/SPI panel"
> +       depends on OF && SPI
> +       depends on BACKLIGHT_CLASS_DEVICE
> +       select REGMAP_SPI

Nice use of regmap in this driver.

> +static const struct reg_sequence ota5601a_panel_regs[] = {
> +       { 0xfd, 0x00 },
> +       { 0x02, 0x00 },
> +
> +       { 0x18, 0x00 },
> +       { 0x34, 0x20 },
> +
> +       { 0x0c, 0x01 },
> +       { 0x0d, 0x48 },
> +       { 0x0e, 0x48 },
> +       { 0x0f, 0x48 },
> +       { 0x07, 0x40 },
> +       { 0x08, 0x33 },
> +       { 0x09, 0x3a },
> +
> +       { 0x16, 0x01 },
> +       { 0x19, 0x8d },
> +       { 0x1a, 0x28 },
> +       { 0x1c, 0x00 },
> +
> +       { 0xfd, 0xc5 },
> +       { 0x82, 0x0c },
> +       { 0xa2, 0xb4 },
> +
> +       { 0xfd, 0xc4 },
> +       { 0x82, 0x45 },
> +
> +       { 0xfd, 0xc1 },
> +       { 0x91, 0x02 },
> +
> +       { 0xfd, 0xc0 },
> +       { 0xa1, 0x01 },
> +       { 0xa2, 0x1f },
> +       { 0xa3, 0x0b },
> +       { 0xa4, 0x38 },
> +       { 0xa5, 0x00 },
> +       { 0xa6, 0x0a },
> +       { 0xa7, 0x38 },
> +       { 0xa8, 0x00 },
> +       { 0xa9, 0x0a },
> +       { 0xaa, 0x37 },
> +
> +       { 0xfd, 0xce },
> +       { 0x81, 0x18 },
> +       { 0x82, 0x43 },
> +       { 0x83, 0x43 },
> +       { 0x91, 0x06 },
> +       { 0x93, 0x38 },
> +       { 0x94, 0x02 },
> +       { 0x95, 0x06 },
> +       { 0x97, 0x38 },
> +       { 0x98, 0x02 },
> +       { 0x99, 0x06 },
> +       { 0x9b, 0x38 },
> +       { 0x9c, 0x02 },
> +
> +       { 0xfd, 0x00 },
> +};

If these are registers, why is register 0xfd written 7 times with different
values?

This is rather a jam table or intializations sequence, so it should be
names something like that and a comment about undocumented
registers added probably as well.

> +static int ota5601a_enable(struct drm_panel *drm_panel)
> +{
> +       struct ota5601a *panel = to_ota5601a(drm_panel);
> +       int err;
> +
> +       err = regmap_write(panel->map, 0x01, 0x01);

Since you know what this register does, what about:

#include <linux/bits.h>

#define OTA5601A_CTL 0x01
#define OTA5601A_CTL_OFF 0x00
#define OTA5601A_CTL_ON BIT(0)

> +static int ota5601a_get_modes(struct drm_panel *drm_panel,
> +                            struct drm_connector *connector)
> +{
> +       struct ota5601a *panel = to_ota5601a(drm_panel);
> +       const struct ota5601a_panel_info *panel_info = panel->panel_info;
> +       struct drm_display_mode *mode;
> +       unsigned int i;
> +
> +       for (i = 0; i < panel_info->num_modes; i++) {
> +               mode = drm_mode_duplicate(connector->dev,
> +                                         &panel_info->display_modes[i]);
> +               if (!mode)
> +                       return -ENOMEM;
> +
> +               drm_mode_set_name(mode);
> +
> +               mode->type = DRM_MODE_TYPE_DRIVER;
> +               if (panel_info->num_modes == 1)

But ... you have just added an array that contains 2 elements, you
KNOW it will not be 1.

> +                       mode->type |= DRM_MODE_TYPE_PREFERRED;

I think you should probably set this on the preferred resolution
anyways, take the one you actually use.

> +static const struct of_device_id ota5601a_of_match[] = {
> +       { .compatible = "focaltech,gpt3", .data = &gpt3_info },
> +       { /* sentinel */ }
> +};
> +MODULE_DEVICE_TABLE(of, ota5601a_of_match);

Does this mean the display controller is ota5601a and the display
manufacturer and product is focaltech gpt3? Then it's fine.

Overall the driver looks very good, just the above little details.

Yours,
Linus Walleij
