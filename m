Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 73B3E732089
	for <lists+dri-devel@lfdr.de>; Thu, 15 Jun 2023 21:55:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A184510E065;
	Thu, 15 Jun 2023 19:55:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb2e.google.com (mail-yb1-xb2e.google.com
 [IPv6:2607:f8b0:4864:20::b2e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 11A7A10E065
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Jun 2023 19:55:00 +0000 (UTC)
Received: by mail-yb1-xb2e.google.com with SMTP id
 3f1490d57ef6-bc4f89f0f2fso2206644276.3
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Jun 2023 12:55:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1686858900; x=1689450900;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zarhNLNxJGcgzFm4V/dlUfwEydM2+khl1826v1Ld6wo=;
 b=omzFWI9V+BtaWILreAC2kA65CZu3BhXlKb9bd1vTMVRxwqvTQ86NWOMb8UBr7/+zom
 +k1fUe4ve3JpHGCqQcK9NsZVkImdB/Lo+/njCuQPf32XfaaZL9CZBdhjOsBBUZSZqcae
 SmQGh+G7KR6p70maYmVRYPCLLZ04fZaf0q6LeoWmhLvvRZyGg2Wqz1Chrg2E1ZaR+1tR
 gHcjBvMlW4iE9ItnxoZRvMeeOIbZVsIENG7e3JHw8Wz6k7d0NwrafuHHwwoYFP6Wkv6+
 hwyJMjWgJqY/3Ux+26E2hWY3M57/nh2n7O2MenAcHc6+q88IETUCRGyLS7ahtXvbnf+L
 q7SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686858900; x=1689450900;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=zarhNLNxJGcgzFm4V/dlUfwEydM2+khl1826v1Ld6wo=;
 b=LO8L28yii6WpqRKwdRLpwboRC4864AfeUMIKAWp8Xj/fXYO14Ylqw5TaNfhunVP3FE
 1+TQSEmfockT1WfieLKqLEQQFgdbEhJ3oV9+jD0yPT6bXiE1bLn8kkulDK5tthi8vk2N
 UJfvEIzHPKOQbXTm9H5bptwMVt1DcsD3PQeQM2PdXWsg/b6BeuNmsiQ458y3vOziXWpj
 IzhsXjyX/J04R/JxSibNvv5IhaA8rUGKyy6X93wD6Sr6SE7tSNXBm7ojg18a1d0SJkDM
 h6LY2iGwnr1lSzpPaI6eU3KxqAfUBrZdKNKrXHb0H7HOh2mpDuZII7hP/ZXHJ3vMpbO3
 Ky9g==
X-Gm-Message-State: AC+VfDw+NEhh9XBtPIT+LweNfsc67sWBZO8ZOttKOYmwUHbrA8Mpx0ql
 8ddO5oyQH0KZd93Mh5yz2bkenxsEQUUfD8CphllQOg==
X-Google-Smtp-Source: ACHHUZ6Yx/mZVW7nno+7MO/Qy94W3ta+kHrxF19zn9d6b4qJpSAQFM1D+WoaDzO9Q8B9HSCJAgBJFmvbmrbEGNKRsaE=
X-Received: by 2002:a25:cc86:0:b0:bca:9c66:e53b with SMTP id
 l128-20020a25cc86000000b00bca9c66e53bmr6280244ybf.14.1686858899754; Thu, 15
 Jun 2023 12:54:59 -0700 (PDT)
MIME-Version: 1.0
References: <20230607151127.1542024-1-pavacic.p@gmail.com>
 <20230607151127.1542024-4-pavacic.p@gmail.com>
In-Reply-To: <20230607151127.1542024-4-pavacic.p@gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 15 Jun 2023 21:54:48 +0200
Message-ID: <CACRpkdbrEA54qmfTKSsFRG9ZS4u8hM6P5TXtOjRAiW+TD_v-fQ@mail.gmail.com>
Subject: Re: [PATCH v4 3/3] drm/panel-fannal-c3004: Add fannal c3004 DSI panel
To: Paulo Pavacic <pavacic.p@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: neil.armstrong@linaro.org, conor+dt@kernel.org, devicetree@vger.kernel.org,
 sam@ravnborg.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Paulo,

thanks for your patch!

Overall this looks very good.

I doubt that the display controller is actually by Fannal, but I guess
you tried to find out? We usually try to identify the underlying display
controller so the driver can be named after it and reused for more
display panels.

Some minor questions/nitpicks below.

On Wed, Jun 7, 2023 at 5:11=E2=80=AFPM Paulo Pavacic <pavacic.p@gmail.com> =
wrote:

> +static int fannal_panel_enable(struct drm_panel *panel)
> +{
> +       struct mipi_dsi_device *dsi =3D to_mipi_dsi_device(panel->dev);
> +
> +       mipi_dsi_generic_write_seq(dsi, 0xFF, 0x77, 0x01, 0x00, 0x00, 0x1=
3);
> +       mipi_dsi_generic_write_seq(dsi, 0xEF, 0x08);

Why is everything using mipi_dsi_generic_write_seq() instead of
mipi_dsi_dcs_write_seq()?

Especially here, because 0x11 is certainly a command:

> +       mipi_dsi_generic_write_seq(dsi, 0x11); //MIPI_DCS_EXIT_SLEEP_MODE

Instead use:

    ret =3D mipi_dsi_dcs_exit_sleep_mode(dsi);
    if (ret)
            return ret;


> +       mipi_dsi_generic_write_seq(dsi, 0x29); //MIPI_DCS_SET_DISPLAY_ON

Instead use:

    ret =3D mipi_dsi_dcs_set_display_on(dsi);
    if (ret)
            return ret;

Yours,
Linus Walleij
