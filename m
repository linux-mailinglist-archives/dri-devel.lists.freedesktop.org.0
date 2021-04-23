Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 27630369670
	for <lists+dri-devel@lfdr.de>; Fri, 23 Apr 2021 17:54:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A8576E123;
	Fri, 23 Apr 2021 15:54:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D9336E123
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Apr 2021 15:54:30 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id x7so48833656wrw.10
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Apr 2021 08:54:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:cc:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=nu1AQU+twsRz9Nxjz3ymYspXF0v3XdvGCJQ0v8RcVRo=;
 b=zzs2nDvmtgNn4vNGiTRoEFSmyZbqBJbAtiMphuEg6JWh/Bdg0bCBMnbuTxtZIEd3Xn
 Vwy3vTifWKZRRsrrS4WnmDTh/mYnBU4MS3yAl5j0+xIaRVdek32fO8fcQydcayFD/2W+
 bZAW/jScVBCqnth5PSQeqLv0jzajFH4T3e9Wi5JAqCNqTkEZ26iFQGw+jcDHXM9DPISb
 omjCxL9i4OxGp1qYfGRdZoqYFQcVXeGf/GeLGsaVmApLiEpXrnq2zLaXXRZrWeBgkXiH
 8wFslsPahoseJoFrAaYzi+5ZFvo6d1B5iAFq5Bb06LU+c3XDDisDnJWdO4xnlZGFaCmE
 zRPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:cc:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=nu1AQU+twsRz9Nxjz3ymYspXF0v3XdvGCJQ0v8RcVRo=;
 b=osIz9Z7yzJtRHIJbI9tkcqMNnrQ7prT4HYmdOhX4dBlEDQ5qyN1EKEpKb1/b5S5cPO
 IOBISFqKcMwktBzi1+7TSCIY1cDd7KUGcGtr4KE88wiTAq3zThNk7uC69dH63zv4J+nu
 df8xr9GpMj1+ESpoIf6V6m/vj4aH2P3niNp1dn+PbYH/AkabAJg02GI7iN47wzO9NJuV
 pRheepXelZkiS1DKCTCBzH1F4OGRY8wtC1T7+VoBykhcgctrUk/dB9quBebfIWi2y+gz
 cL958ECTNNx50/9u1+xgYi5lGpkUVBvQUa7NN+fpvBfzZzm4fN2DXK2ihfujBdXxu3Iq
 PBUQ==
X-Gm-Message-State: AOAM531lXsyrkFet9IVj/43DkHtfbzq9Q3hAtN3td4uhMAvE3PgqbCgi
 zVOoeS1Zkw15hLqsCZhyzLdBzMqDiH1QlZnN
X-Google-Smtp-Source: ABdhPJwLByVzjeQfrGQm37MTSxSmM8jUI0bZu5jLgqs98P2DdRBHTGNZGkVrk74Y3o5VcWcVKxExdA==
X-Received: by 2002:adf:fd90:: with SMTP id d16mr5478562wrr.96.1619193269230; 
 Fri, 23 Apr 2021 08:54:29 -0700 (PDT)
Received: from ?IPv6:2a01:e0a:82c:5f0:cdf4:4f8:cdd5:cc88?
 ([2a01:e0a:82c:5f0:cdf4:4f8:cdd5:cc88])
 by smtp.gmail.com with ESMTPSA id c16sm9281685wrt.83.2021.04.23.08.54.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 23 Apr 2021 08:54:28 -0700 (PDT)
Subject: Re: [PATCH V2 2/2] drm/bridge: ti-sn65dsi83: Add TI SN65DSI83 and
 SN65DSI84 driver
To: Marek Vasut <marex@denx.de>, dri-devel@lists.freedesktop.org
References: <20210421223122.112736-2-marex@denx.de>
From: Loic Poulain <loic.poulain@linaro.org>
Message-ID: <bbd542f5-9d75-20a5-55d4-67f1fd042fdd@linaro.org>
Date: Fri, 23 Apr 2021 18:03:43 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210421223122.112736-2-marex@denx.de>
Content-Language: en-US
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
Cc: dianders@chromium.org, swboyd@chromium.org, philippe.schenker@toradex.com,
 laurent.pinchart@ideasonboard.com, valentin@compulab.co.il, sam@ravnborg.org,
 jagan@amarulasolutions.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 22/04/2021 00:31, Marek Vasut wrote:
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
> Signed-off-by: Marek Vasut <marex@denx.de>
> Cc: Douglas Anderson <dianders@chromium.org>
> Cc: Jagan Teki <jagan@amarulasolutions.com>
> Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: Philippe Schenker <philippe.schenker@toradex.com>
> Cc: Sam Ravnborg <sam@ravnborg.org>
> Cc: Stephen Boyd <swboyd@chromium.org>
> Cc: Valentin Raevsky <valentin@compulab.co.il>
> To: dri-devel@lists.freedesktop.org
> ---
> V2: - Use dev_err_probe()
>      - Set REG_RC_RESET as volatile
>      - Wait for PLL stabilization by polling REG_RC_LVDS_PLL
>      - Use ctx->mode = *adj instead of *mode in sn65dsi83_mode_set
>      - Add tested DSI84 support in dual-link mode
>      - Correctly set VCOM
>      - Fill in missing DSI CHB and LVDS CHB bits from DSI84 and DSI85
>        datasheets, with that all the reserved bits make far more sense
>        as the DSI83 and DSI84 seems to be reduced version of DSI85
> ---
>   drivers/gpu/drm/bridge/Kconfig        |  10 +
>   drivers/gpu/drm/bridge/Makefile       |   1 +
>   drivers/gpu/drm/bridge/ti-sn65dsi83.c | 617 ++++++++++++++++++++++++++
>   3 files changed, 628 insertions(+)
>   create mode 100644 drivers/gpu/drm/bridge/ti-sn65dsi83.c

Tested on MSC-SM2S-IMX8MINI module with a 1024x768 (VESA-24) single LVDS 
channel panel.

Tested-by: Loic Poulain <loic.poulain@linaro.org>

Loic
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
