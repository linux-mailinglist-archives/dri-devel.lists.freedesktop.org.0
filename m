Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 982AA1B8FDC
	for <lists+dri-devel@lfdr.de>; Sun, 26 Apr 2020 14:35:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3881A6E2B4;
	Sun, 26 Apr 2020 12:35:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com
 [IPv6:2607:f8b0:4864:20::1043])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4493F6E105
 for <dri-devel@lists.freedesktop.org>; Sat, 25 Apr 2020 19:38:23 +0000 (UTC)
Received: by mail-pj1-x1043.google.com with SMTP id a5so5403178pjh.2
 for <dri-devel@lists.freedesktop.org>; Sat, 25 Apr 2020 12:38:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:content-transfer-encoding:in-reply-to:references
 :subject:from:cc:to:date:message-id:user-agent;
 bh=wDIY7Zc1oPrCnhuBYSFyR9XUZ6XtcZd19wi4ia+d3a0=;
 b=PQhZzQtKgnw95PWTl4LWH+6v6ZwbejfOj/qMmmsjdx7wU67v8uPiFk9qhqZ3opVNap
 pe2PUhJC3EaAKlByWg1UYK37UjsqYUF/x3wUJ1jfdQbxI7Qhs8KBFv/+vP11S7XvUBLK
 ZsTjWMqTlgaPZeNXBgJA48vLHmaCV2316iK3s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:content-transfer-encoding
 :in-reply-to:references:subject:from:cc:to:date:message-id
 :user-agent;
 bh=wDIY7Zc1oPrCnhuBYSFyR9XUZ6XtcZd19wi4ia+d3a0=;
 b=ceLbhiBnP1o7bZyKzqUwzaV4flcO/imMaJqKwJN5DmmXCj4rEQyuF8EEIxKVjMBrJf
 mF3uusaeYRWtRQEJZ5jNNpGK03IAZHuVcLCwmIsLsHn8FVl4HfB/1IZgA3cjndfbE3zU
 V3ozbL6ozmWxVpyh0l0kkRFRNKI7fHXBUd0dtzHv3YZhWhZRm1IywMVpBRLu6O0PlPyM
 0L4oAglLf60no4ea4vFO1qrwsPZqJc9+PgHAs1BgwiJ+1W2bqgJPtOdyjUcOrsGH8xcA
 TIM9cBfnPEg8+AZL/Pvlk+O4S7dZD30ac9Kq1TugA0WwwyrC7Vxc8nxwPYjSHgIOJ8Zg
 WBfw==
X-Gm-Message-State: AGi0PuYAMD1ACuHHmBZobXWROi4H6z/o4AvSnPhC9XN4VUJiIU71xuY8
 dStU+/HXxgEZy4GnPjhBRbwyxA==
X-Google-Smtp-Source: APiQypKqi15ly1FCn64WfHLu7AD932QOaOgexubbURGEz41/S+Yww8OGEEEaC1cDZ/uvcHGogNT0rg==
X-Received: by 2002:a17:90a:25c3:: with SMTP id
 k61mr14548584pje.28.1587843502754; 
 Sat, 25 Apr 2020 12:38:22 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:1:fa53:7765:582b:82b9])
 by smtp.gmail.com with ESMTPSA id w28sm7623732pgc.26.2020.04.25.12.38.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 25 Apr 2020 12:38:22 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20200423092431.v3.1.Ia50267a5549392af8b37e67092ca653a59c95886@changeid>
References: <20200423162548.129661-1-dianders@chromium.org>
 <20200423092431.v3.1.Ia50267a5549392af8b37e67092ca653a59c95886@changeid>
Subject: Re: [PATCH v3 1/6] drm/bridge: ti-sn65dsi86: Export bridge GPIOs to
 Linux
From: Stephen Boyd <swboyd@chromium.org>
To: Douglas Anderson <dianders@chromium.org>, Laurent.pinchart@ideasonboard.com,
 a.hajda@samsung.com, airlied@linux.ie, bgolaszewski@baylibre.com,
 daniel@ffwll.ch, linus.walleij@linaro.org, narmstrong@baylibre.com,
 robh+dt@kernel.org, spanda@codeaurora.org
Date: Sat, 25 Apr 2020 12:38:21 -0700
Message-ID: <158784350116.117437.9524374865698963301@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9
X-Mailman-Approved-At: Sun, 26 Apr 2020 12:35:16 +0000
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

Quoting Douglas Anderson (2020-04-23 09:25:43)
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
