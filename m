Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C57339F071
	for <lists+dri-devel@lfdr.de>; Tue,  8 Jun 2021 10:10:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A0836EB1D;
	Tue,  8 Jun 2021 08:10:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E1E826EB1D
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Jun 2021 08:10:10 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id g204so1219929wmf.5
 for <dri-devel@lists.freedesktop.org>; Tue, 08 Jun 2021 01:10:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:organization:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=E3J+xt6q8apoKSlMITp5jB1t0UA5tHkCFFB5vT4Ep6U=;
 b=An0gqxHIPx5YsAej/hsCFqIN/oYezc1cVrluh5o4bBTInvmigvCmXS85A78HAGACSn
 g2p0SrMvnwBgv3m18eyQBIkHavaVf9rUkK0xZ/TIHj0jZorWG/PMJfxyRv1MRr4mxuKA
 8cfyAq07wRdcD/A6mnTchl51ayfhdbVkfuNA4gnlop89VtExAPQpGRFK9f3u75h3S03d
 pbh7g/VJnSFOw79Y5EMWQtYkyTgXwJ+dhghuC/gSCIDeGUyJn33uMJ4YCCyWghtyy680
 0TrQhVNROyJoEbLRbAKNJQcU6XAZcYfBh4stETdYSkl+kXKjm+uago2OESqRCI8pX1ZW
 FubQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=E3J+xt6q8apoKSlMITp5jB1t0UA5tHkCFFB5vT4Ep6U=;
 b=R6jV5HljFIVor9QAJhQukkJc1gCzquTybCZikzfvi+QF6Xa9YRwBfW+8uT+sE9eiLa
 HqCdxssgUVLRWlVNeb/xZHZrlTZWyF6wZl2pStycv8MCS9OCWGIKb9K8m42bxlfLIu82
 ZzCAASR29QGrWC249fvr/WmsS01LQn2O+ejmXrVEIhNrgPQ7TODP2kdM2v2FIdoOO6BF
 cbWNVwb4AH+qg5Pbn9VU7BWGXXFZRRXOq6LpL951Wl4DtlxNRV8Tly6J0c12dYlEN0rY
 Aakh2tHDL0PzObiXtIm5EqFob5QjBDk6epE5MEEwO0HXdKnKAs9Ibg28qnlNCsTgjNKM
 4r8g==
X-Gm-Message-State: AOAM533Hf3q1aOqnb7a/qYsWHWzkOfYPaqEAs8wXyNo51AeglAzDRnnb
 pNz9ZlAD4s1Gam2bB9ot4ohW7m5F4/chSkJX
X-Google-Smtp-Source: ABdhPJyuiJABKAF0xIHkWl6QA40iStRKM4oPVc4wHQzwvvvKrhy2iU/R+quzMBlW1vTHMQeddOZmJw==
X-Received: by 2002:a05:600c:4f4a:: with SMTP id
 m10mr8540919wmq.51.1623139808199; 
 Tue, 08 Jun 2021 01:10:08 -0700 (PDT)
Received: from ?IPv6:2a01:e0a:90c:e290:d35c:a474:f6ef:ed8b?
 ([2a01:e0a:90c:e290:d35c:a474:f6ef:ed8b])
 by smtp.gmail.com with ESMTPSA id w13sm5803671wmi.48.2021.06.08.01.10.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Jun 2021 01:10:07 -0700 (PDT)
Subject: Re: [PATCH V6 2/2] drm/bridge: ti-sn65dsi83: Add TI SN65DSI83 and
 SN65DSI84 driver
To: Marek Vasut <marex@denx.de>, Robert Foss <robert.foss@linaro.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
References: <20210607174258.16300-1-marex@denx.de>
 <20210607174258.16300-2-marex@denx.de>
From: Neil Armstrong <narmstrong@baylibre.com>
Organization: Baylibre
Message-ID: <8376707f-7234-4555-a892-0581fee00908@baylibre.com>
Date: Tue, 8 Jun 2021 10:10:05 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210607174258.16300-2-marex@denx.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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
Cc: Loic Poulain <loic.poulain@linaro.org>, ch@denx.de,
 Adam Ford <aford173@gmail.com>, dri-devel@lists.freedesktop.org,
 Douglas Anderson <dianders@chromium.org>,
 Frieder Schrempf <frieder.schrempf@kontron.de>,
 Stephen Boyd <swboyd@chromium.org>,
 Philippe Schenker <philippe.schenker@toradex.com>,
 Jagan Teki <jagan@amarulasolutions.com>,
 Valentin Raevsky <valentin@compulab.co.il>, Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On 07/06/2021 19:42, Marek Vasut wrote:
> Add driver for TI SN65DSI83 Single-link DSI to Single-link LVDS bridge
> and TI SN65DSI84 Single-link DSI to Dual-link or 2x Single-link LVDS
> bridge. TI SN65DSI85 is unsupported due to lack of hardware to test on,
> but easy to add.
> 
> The driver operates the chip via I2C bus. Currently the LVDS clock are
> always derived from DSI clock lane, which is the usual mode of operation.
> Support for clock from external oscillator is not implemented, but it is
> easy to add if ever needed. Only RGB888 pixel format is implemented, the
> LVDS666 is not supported, but could be added if needed.
> 
> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
> Reviewed-by: Frieder Schrempf <frieder.schrempf@kontron.de>
> Tested-by: Frieder Schrempf <frieder.schrempf@kontron.de>
> Tested-by: Adam Ford <aford173@gmail.com>
> Signed-off-by: Marek Vasut <marex@denx.de>
> Cc: Douglas Anderson <dianders@chromium.org>
> Cc: Jagan Teki <jagan@amarulasolutions.com>
> Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: Loic Poulain <loic.poulain@linaro.org>
> Cc: Philippe Schenker <philippe.schenker@toradex.com>
> Cc: Sam Ravnborg <sam@ravnborg.org>
> Cc: Stephen Boyd <swboyd@chromium.org>
> Cc: Valentin Raevsky <valentin@compulab.co.il>
> To: dri-devel@lists.freedesktop.org
> ---
> V2: - Use dev_err_probe()
>     - Set REG_RC_RESET as volatile
>     - Wait for PLL stabilization by polling REG_RC_LVDS_PLL
>     - Use ctx->mode = *adj instead of *mode in sn65dsi83_mode_set
>     - Add tested DSI84 support in dual-link mode
>     - Correctly set VCOM
>     - Fill in missing DSI CHB and LVDS CHB bits from DSI84 and DSI85
>       datasheets, with that all the reserved bits make far more sense
>       as the DSI83 and DSI84 seems to be reduced version of DSI85
> V3: - Handle the dual-link LVDS with two port panel or bridge
> V4: - Add RB from Linus Walleij
>     - Rename REG_DSI_LANE_LVDS_LINK_CFG_DUAL to
>       REG_DSI_LANE_DSI_CHANNEL_MODE_SINGLE and fill in the remaining
>       DSI link options from DSI85 datasheet. DSI85 can do dual and 2x
>       single DSI mode, but DSI85 is currently unsupported by the
>       driver. Add a comment about DSI85, so that all the places which
>       need to be adjusted for DSI85 are marked accordingly.
>     - Add REG_DSI_LANE_LEFT_RIGHT_PIXELS bit for DSI
>     - Add handling for JEIDA18/JEIDA24/SPWG24 LVDS formats. Use SPWG24
>       as fallback on output bridges until they are all fixed.
>     - Patch DSI bus format to fixed RGB888_1X24 instead of passing
>       through the LVDS bus format.
> V5: - Move bus format patching to mode_fixup
>     - Use cpu_to_le16() to guarantee endianness in regmap_bulk_write()
> V6: - Cast of_device_get_match_data() output to uintptr_t first
> ---
>  drivers/gpu/drm/bridge/Kconfig        |  10 +
>  drivers/gpu/drm/bridge/Makefile       |   1 +
>  drivers/gpu/drm/bridge/ti-sn65dsi83.c | 709 ++++++++++++++++++++++++++
>  3 files changed, 720 insertions(+)
>  create mode 100644 drivers/gpu/drm/bridge/ti-sn65dsi83.c
> 

Looks complete & well reviewed, LGTM

Rob, Laurent ? is it ok for you ?

Neil
