Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C9BC3411211
	for <lists+dri-devel@lfdr.de>; Mon, 20 Sep 2021 11:48:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 934006E453;
	Mon, 20 Sep 2021 09:48:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x429.google.com (mail-pf1-x429.google.com
 [IPv6:2607:f8b0:4864:20::429])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 71BEE8932B
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Sep 2021 09:48:04 +0000 (UTC)
Received: by mail-pf1-x429.google.com with SMTP id q23so13594110pfs.9
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Sep 2021 02:48:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=lP4lLyZsFEqWiwhyXMr4Opdw5/67jPTt6YJ5qHZtMJc=;
 b=fUWR1YeZCHBdf8WtcFiuDXW1UEOcO/z5GdAQKZefe5vPNlOUyRCInBmb64Yv94OFNq
 UIAcV472D0ALte6gWvbvcXdILE5WjurM27eLZGWV9VPheDaaQ7HXsyscibpQZ5u/0qRM
 il7QTUh8Vw+KRFYiEkRlKzWi67OyAsPLeamH+kwvLh/vUMPU1IPzaZj4DCI1nw5ZCKRF
 05fWoQE90MqwnFi1XCjGOeqmsRB4A1hhaOgEq9V5ebiXOnycTP9OEyd+AHAZSRV024F6
 MQ4j4FTxk0AZHdSuKcmpf2+qfkLmWGgYJRtzl68g0ocIyvr2p0yKGfpznaHA4W5AvLaB
 4qpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=lP4lLyZsFEqWiwhyXMr4Opdw5/67jPTt6YJ5qHZtMJc=;
 b=3Ht2X30hm7duvYOfnTLa2b0CVCpH20e6BvmiPwAqybw3TEhJ+HYVtItrr6DlE6b9iA
 g3DT1rFB+qFwAtOu1k4lpnoR09RhaVbdN1vz16foZ8+I5BbncbsXaVr1fPPswgLVsTJ7
 Nsu6AhSpwFSt399IGj2cHThOycbEBBJbScJMrevPRZNwb8rWKjjECyx5Hskg0wz5x/Y8
 l+4iEEQo1C+G6StPhgyk8BEU+Gxu2ZbtnWj3NYEPyo+41Yo4auYbHpGxGuRO+wV1jyd1
 MyB1/MocBPPokvXHF/dscLbmfZCqB3eT1wQ54nrm/GveuYAxyz5dDx/vEPe6gqM/bmaI
 /d9w==
X-Gm-Message-State: AOAM531ukN7KDNDXrLr+mrMrEaDOVFqdLBnJ9/SfUGOpfLtvymfYrWJd
 BBoVYTHBOnk4jD2erONARjcYmUXhBoWdI8+PffMGNg==
X-Google-Smtp-Source: ABdhPJy5bfNQJwVXlTMJ3A0voNBw3oOzciJaoe6AMl79fn/fbgGwvM9LgDIyKNH8lNsqpw2o8ZvofCUIHwWsSPRwhwk=
X-Received: by 2002:a63:391:: with SMTP id 139mr22691394pgd.410.1632131284170; 
 Mon, 20 Sep 2021 02:48:04 -0700 (PDT)
MIME-Version: 1.0
References: <20210918035041.25512-1-liyunlonga@uniontech.com>
In-Reply-To: <20210918035041.25512-1-liyunlonga@uniontech.com>
From: Robert Foss <robert.foss@linaro.org>
Date: Mon, 20 Sep 2021 11:47:53 +0200
Message-ID: <CAG3jFysCS2g4QrXgZQ9E9Jzq_-5OnXPPUf0kWMpkx56DFkdD1A@mail.gmail.com>
Subject: Re: [PATCH] drm: bridge: it66121: Added it66121 chip external screen
 status judgment.
To: Yunlongli <liyunlonga@uniontech.com>
Cc: Phong LE <ple@baylibre.com>, Neil Armstrong <narmstrong@baylibre.com>, 
 Andrzej Hajda <a.hajda@samsung.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 dri-devel <dri-devel@lists.freedesktop.org>, 
 linux-kernel <linux-kernel@vger.kernel.org>
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

Hey Yunlongli,

Thanks for submitting this fix.

On Sat, 18 Sept 2021 at 05:51, Yunlongli <liyunlonga@uniontech.com> wrote:

The formatting of this commit message is a bit unusual, let's try to
change it to the normal formatting.

Remove the dot from the commit title:
"drm: bridge: it66121: Added it66121 chip external screen status
judgment." -> "drm: bridge: it66121: Added it66121 chip external
screen status judgment"


>
> fix: Add further confirm if external screens are involved.

The "fix:" tag is not needed. However if this commit fixes a bug
introduced in an earlier commit a machine readable tag like the the
one below could be added after the commit message.

Fixes: 988156dc2fc9 ("drm: bridge: add it66121 driver")

>
> log: In the actual tests,  the IT66121 chip sometimes misjudged whether
>      it had an external screen, so, reference the it66121_user_guid.pdf
>      about Audio/Video data is stable or not A typical initialization
>      of HDMI link should be based on interrupt signal and appropriate
>      register probing. Recommended flow is detailed in IT66121
>      Programming Guide. Simply put, the microcontroller should monitor
>      the HPD status first. Upon valid HPD event, move on to check
>      RxSENDetect register to see if the receiver chip is ready for
>      further handshaking. When RxSENDetect is asserted, start reading EDID
>      data through DDC channels and carry on the rest of the handshaking
>      subsequently.If the micro-controller makes no use of the interrupt
>      signal as well as the above-mentioned status  registers, the link
>      establishment might fail. Please do follow the suggested
>      initialization flow recommended in IT66121 Programming Guide.
>      So, I add the IT66121_SYS_STATUS_SENDECTECT register status detection.
>

The "log:" prefix is not needed, and neither is the indentation of the text.

Secondly maybe it would be nice to format the above chunk of text into
paragraphs just to make it easier to read.

> Signed-off-by: Yunlongli <liyunlonga@uniontech.com>
> ---
>  drivers/gpu/drm/bridge/ite-it66121.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/bridge/ite-it66121.c b/drivers/gpu/drm/bridge/ite-it66121.c
> index 2f2a09adb4bc..9ed4fa298d11 100644
> --- a/drivers/gpu/drm/bridge/ite-it66121.c
> +++ b/drivers/gpu/drm/bridge/ite-it66121.c
> @@ -523,7 +523,7 @@ static bool it66121_is_hpd_detect(struct it66121_ctx *ctx)
>         if (regmap_read(ctx->regmap, IT66121_SYS_STATUS_REG, &val))
>                 return false;
>
> -       return val & IT66121_SYS_STATUS_HPDETECT;
> +       return ((val & IT66121_SYS_STATUS_HPDETECT) && (val & IT66121_SYS_STATUS_SENDECTECT));
>  }
>
>  static int it66121_bridge_attach(struct drm_bridge *bridge,
> --
> 2.20.1
>
>
>

With the above suggestions fixed, feel free to add my r-b and submit a
v2 of this patch.
Reviewed-by: Robert Foss <robert.foss@linaro.org>
