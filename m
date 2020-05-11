Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D28E71CE87B
	for <lists+dri-devel@lfdr.de>; Tue, 12 May 2020 00:52:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D2FC6E5D5;
	Mon, 11 May 2020 22:52:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com
 [IPv6:2607:f8b0:4864:20::643])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D55B76E049
 for <dri-devel@lists.freedesktop.org>; Mon, 11 May 2020 16:24:11 +0000 (UTC)
Received: by mail-pl1-x643.google.com with SMTP id g11so910016plp.1
 for <dri-devel@lists.freedesktop.org>; Mon, 11 May 2020 09:24:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:content-transfer-encoding:in-reply-to:references
 :subject:from:cc:to:date:message-id:user-agent;
 bh=nIHK0pERFEVTVOMQQjzKbYldCgkef0vrbHxpu8mVr5o=;
 b=TCOaST54SvL3086A7HHjNJTa/H/ch7lt91lpjhI79d01O042oBl3o3vcfVKRm5Bgqr
 yqPGz//m/aDJWTMYb7QNLl80YovugT4IKGrQtd1r/Zqt1DDke4Ieh/Xlc0YwHABLni2N
 VVzT8Wn9BpUiNvWsFe41tKvu7vmzWntoMa20w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:content-transfer-encoding
 :in-reply-to:references:subject:from:cc:to:date:message-id
 :user-agent;
 bh=nIHK0pERFEVTVOMQQjzKbYldCgkef0vrbHxpu8mVr5o=;
 b=gJOdeIxGR0Ipoli2xO5ZEtg/0Tk5+pXhxgffdxgdS09afdmrVjZgZMTGoVkBgdqqMW
 k95EPsZQb3Yz94q73VICSdJKoBOriShAWZYAbEpZ3Rr9EuBQ25teCV9UaIGyUYSazQt6
 K7vkffSyVcPj3ruoX8dYN8dq9WKhf8k62Oi9AH7dDBYXmQ3dikesg4LIJJrj4QeTmV0W
 +szWVs4+FDgsnYK5VD3mpCq7dy6ikwyEofbCEtWr9ceq1hVWq3mXMWGGjWrQLKk3RRYx
 CyV/c7LL74JuhkUZX+KOu+tSL85d5duDtOxoREg9smLe5OxmOQQH7UXAPXbGb7QNesJm
 wWGQ==
X-Gm-Message-State: AGi0PuYolpViIG/FZaVB5MVwsPhD4cJun8TPgdlaqYLIyeRpDKJLhgk4
 wyUiEpPpRJXSfsWqL5NripGEWg==
X-Google-Smtp-Source: APiQypLIWX8xdd1JBGRzmfOJI4N2dj1AtQSQdOmDg36PNZdcgR9LSF47B8adWOS/qPaOt3Lk6Yv3GA==
X-Received: by 2002:a17:90a:d245:: with SMTP id
 o5mr25045160pjw.213.1589214251377; 
 Mon, 11 May 2020 09:24:11 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:1:fa53:7765:582b:82b9])
 by smtp.gmail.com with ESMTPSA id j5sm9359046pfh.58.2020.05.11.09.24.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 May 2020 09:24:10 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20200507143354.v5.1.Ia50267a5549392af8b37e67092ca653a59c95886@changeid>
References: <20200507213500.241695-1-dianders@chromium.org>
 <20200507143354.v5.1.Ia50267a5549392af8b37e67092ca653a59c95886@changeid>
Subject: Re: [PATCH v5 1/6] drm/bridge: ti-sn65dsi86: Export bridge GPIOs to
 Linux
From: Stephen Boyd <swboyd@chromium.org>
To: Douglas Anderson <dianders@chromium.org>, Laurent.pinchart@ideasonboard.com,
 a.hajda@samsung.com, airlied@linux.ie, bgolaszewski@baylibre.com,
 daniel@ffwll.ch, linus.walleij@linaro.org, narmstrong@baylibre.com,
 robh+dt@kernel.org, spanda@codeaurora.org
Date: Mon, 11 May 2020 09:24:09 -0700
Message-ID: <158921424955.26370.14824525920971881719@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9
X-Mailman-Approved-At: Mon, 11 May 2020 22:51:58 +0000
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
Cc: robdclark@chromium.org, devicetree@vger.kernel.org, jernej.skrabec@siol.net,
 jeffrey.l.hugo@gmail.com, linux-arm-msm@vger.kernel.org, jonas@kwiboo.se,
 Douglas Anderson <dianders@chromium.org>, dri-devel@lists.freedesktop.org,
 bjorn.andersson@linaro.org, linux-gpio@vger.kernel.org,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Douglas Anderson (2020-05-07 14:34:55)
> The ti-sn65dsi86 MIPI DSI to eDP bridge chip has 4 pins on it that can
> be used as GPIOs in a system.  Each pin can be configured as input,
> output, or a special function for the bridge chip.  These are:
> - GPIO1: SUSPEND Input
> - GPIO2: DSIA VSYNC
> - GPIO3: DSIA HSYNC or VSYNC
> - GPIO4: PWM
> 
> Let's expose these pins as GPIOs.  A few notes:
> - Access to ti-sn65dsi86 is via i2c so we set "can_sleep".
> - These pins can't be configured for IRQ.
> - There are no programmable pulls or other fancy features.
> - Keeping the bridge chip powered might be expensive.  The driver is
>   setup such that if all used GPIOs are only inputs we'll power the
>   bridge chip on just long enough to read the GPIO and then power it
>   off again.  Setting a GPIO as output will keep the bridge powered.
> - If someone releases a GPIO we'll implicitly switch it to an input so
>   we no longer need to keep the bridge powered for it.
> 
> Because of all of the above limitations we just need to implement a
> bare-bones GPIO driver.  The device tree bindings already account for
> this device being a GPIO controller so we only need the driver changes
> for it.
> 
> NOTE: Despite the fact that these pins are nominally muxable I don't
> believe it makes sense to expose them through the pinctrl interface as
> well as the GPIO interface.  The special functions are things that the
> bridge chip driver itself would care about and it can just configure
> the pins as needed.
> 
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
