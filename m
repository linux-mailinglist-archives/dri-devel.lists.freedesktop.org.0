Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 915731F8290
	for <lists+dri-devel@lfdr.de>; Sat, 13 Jun 2020 12:17:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E4A76E3A4;
	Sat, 13 Jun 2020 10:16:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1044.google.com (mail-pj1-x1044.google.com
 [IPv6:2607:f8b0:4864:20::1044])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE8006E8C7
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Jun 2020 09:58:25 +0000 (UTC)
Received: by mail-pj1-x1044.google.com with SMTP id i12so2040279pju.3
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Jun 2020 02:58:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:content-transfer-encoding:in-reply-to:references
 :subject:from:cc:to:date:message-id:user-agent;
 bh=2Od4RPoy3QKGp+dnzd4aF9qRJSfueENgUATI+IJ7EOQ=;
 b=C1fB/+ehBCIfy+Cw7OARJj7r0ZtWVP26Xm1aqT/BGrMFUp4kXcVKMOdyHEDXydfWUs
 etKTuVNkUtH4m59MYngZWgW96he1xiDs02Q0nn6BK3Ba9ODztvpnH/aHtf9X1KjxFuiP
 3tj9XvByF/IGfO6sCMMjVIF0MI1PyBaLC2L04=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:content-transfer-encoding
 :in-reply-to:references:subject:from:cc:to:date:message-id
 :user-agent;
 bh=2Od4RPoy3QKGp+dnzd4aF9qRJSfueENgUATI+IJ7EOQ=;
 b=OjQc9/59e+OYIbg5FRv1dmnqclbP2VUKWzSQef3FyFQtT7CSLD2O+X50KbQ2/LhJje
 /RKVwJ40gq7JjuQ4P/QqG2OgJ5+FG1g2zYa1fFlQCsx82uoeuaOtKc+SsDnTdVqOZV3e
 wWDIYRBSrQRMh3dM/XQxPVjrdPcBChLI5pBMncjTiYZL6GXE1btJNMGWDkFp8O4la/A3
 HhNYoQGianJkliUdG1UCVqXjdudSzXWBuK/3wP08e5vPNyXi8FgVjuO/STZ4cjjSUPj6
 4+V8PDajW7Sig5pUdei/qw3lH9gk9SVY7O1eALGuutsWmFMUFC0cI2YH0pcJePqTpMo6
 dPFg==
X-Gm-Message-State: AOAM532yml0nSrQsOaNs2pCXZa5BTMMyUjt3JjvArwVsf1ohPPEeU4Pb
 /kpe50AZPn2D1OpVtrsseiv4oQ==
X-Google-Smtp-Source: ABdhPJzw0lDTAqGGWpNRk2DktUonsIF2tysXh92/1xtLg01onVMOBI4W4nLWCtLW7mmD3S4whQ9BMg==
X-Received: by 2002:a17:90a:34cc:: with SMTP id
 m12mr7338528pjf.123.1591869505598; 
 Thu, 11 Jun 2020 02:58:25 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:1:fa53:7765:582b:82b9])
 by smtp.gmail.com with ESMTPSA id iq19sm2188545pjb.48.2020.06.11.02.58.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Jun 2020 02:58:24 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20200608104832.4.Ia4376fd88cdc6e8f8b43c65548458305f82f1d61@changeid>
References: <20200608104832.1.Ibe95d8f3daef01e5c57d4c8c398f04d6a839492c@changeid>
 <20200608104832.4.Ia4376fd88cdc6e8f8b43c65548458305f82f1d61@changeid>
Subject: Re: [PATCH 4/4] drm/bridge: ti-sn65dsi86: Check the regmap return
 value when setting a GPIO
From: Stephen Boyd <swboyd@chromium.org>
To: Douglas Anderson <dianders@chromium.org>, a.hajda@samsung.com,
 narmstrong@baylibre.com, sam@ravnborg.org
Date: Thu, 11 Jun 2020 02:58:24 -0700
Message-ID: <159186950406.242598.11120838219466948342@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9
X-Mailman-Approved-At: Sat, 13 Jun 2020 10:16:46 +0000
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
Cc: robdclark@chromium.org, Jernej Skrabec <jernej.skrabec@siol.net>,
 Jonas Karlman <jonas@kwiboo.se>, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, Douglas Anderson <dianders@chromium.org>,
 dri-devel@lists.freedesktop.org, spanda@codeaurora.org,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 bjorn.andersson@linaro.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Douglas Anderson (2020-06-08 10:48:35)
> The ti_sn_bridge_gpio_set() got the return value of
> regmap_update_bits() but didn't check it.  The function can't return
> an error value, but we should at least print a warning if it didn't
> work.
> 
> This fixes a compiler warning about setting "ret" but not using it.
> 
> Fixes: 27ed2b3f22ed ("drm/bridge: ti-sn65dsi86: Export bridge GPIOs to Linux")
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---
> 
>  drivers/gpu/drm/bridge/ti-sn65dsi86.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> index 1080e4f9df96..526add27dc03 100644
> --- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> +++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> @@ -999,6 +999,9 @@ static void ti_sn_bridge_gpio_set(struct gpio_chip *chip, unsigned int offset,
>         ret = regmap_update_bits(pdata->regmap, SN_GPIO_IO_REG,
>                                  BIT(SN_GPIO_OUTPUT_SHIFT + offset),
>                                  val << (SN_GPIO_OUTPUT_SHIFT + offset));
> +       if (ret)
> +               dev_warn(pdata->dev,
> +                        "Failed to set bridge GPIO %d: %d\n", offset, ret);

GPIO %u because it's unsigned?
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
