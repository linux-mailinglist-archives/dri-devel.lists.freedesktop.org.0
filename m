Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A1BC5979D8
	for <lists+dri-devel@lfdr.de>; Thu, 18 Aug 2022 00:55:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F4C212A250;
	Wed, 17 Aug 2022 22:55:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [IPv6:2a00:1450:4864:20::533])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4FA33AF79C
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Aug 2022 22:54:50 +0000 (UTC)
Received: by mail-ed1-x533.google.com with SMTP id z20so19288877edb.9
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Aug 2022 15:54:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=QschqWR/xbvl1D7imcOoJeImJIJB3zdqTJ6vvEQFZ4w=;
 b=Nlsrd3j+SqpVi0O5EgU7LKy3RgW5hlhIhEHJbL8PIe4KcgXB4S4VWvugb2BrDi72QO
 P29yb1T2N1GX/JPH/XtLz7DwBuv2p5xdYTM2diVXaK1/C7WP75BugOuwDWTs+lzS4qsG
 WZbAXOvndNMdRr34lChjTEKxN2yrbCMamJVbA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=QschqWR/xbvl1D7imcOoJeImJIJB3zdqTJ6vvEQFZ4w=;
 b=m8LRh5zPHl0kLNjoWozGoMD33vNZRwafTLX5xjKcnkWEfSHo4k+TqMIOpr8yjBOEoP
 izBFWoMnmfFcpw42glyuqU0PhE9lb9m3IOLMso7GrB66SNGOuexLFis1aw4KPWCQ1Oun
 sNNrRf+ErxsXf+7RQfmrJYuXUY4x/4AwL0q2F/5Sxsj/3TfookjxWSqDq9CqTH4ZkXIi
 4Z0BdbCwcgJEqSBbqR5dbFjFNd1tDc/NG+dO53vKezMg+iGzqK0BZsWk50WmW/5WAnLd
 mk+cB0Tv4FZ/ZcRQj+AbPmXJMiH2vdxrPK6M8io6Q6LKxApG+tfGXFRRGwZZrAH/oXOX
 1cGQ==
X-Gm-Message-State: ACgBeo0yPm2j1/QJ/owMcSEvJAsEvqGO2QPgwNtkwj3yeHdwqkkiL5Qu
 Y1f86uOTIM+hf4SwnGK62UYDXh7VKO/Q69HZ
X-Google-Smtp-Source: AA6agR7fzN1defV/kxh4pBPGFNBHf8ibRxxsCRT32M8OcHui3nL1jkRg2n7L7SNxt5DMDKqvDu2O7Q==
X-Received: by 2002:a05:6402:2683:b0:43e:76fc:f9db with SMTP id
 w3-20020a056402268300b0043e76fcf9dbmr201098edd.390.1660776888492; 
 Wed, 17 Aug 2022 15:54:48 -0700 (PDT)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com.
 [209.85.128.52]) by smtp.gmail.com with ESMTPSA id
 21-20020a170906301500b0071cef6c53aesm7368702ejz.0.2022.08.17.15.54.47
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 17 Aug 2022 15:54:47 -0700 (PDT)
Received: by mail-wm1-f52.google.com with SMTP id
 m3-20020a05600c3b0300b003a5e0557150so2315343wms.0
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Aug 2022 15:54:47 -0700 (PDT)
X-Received: by 2002:a05:600c:42c3:b0:3a6:431:91bf with SMTP id
 j3-20020a05600c42c300b003a6043191bfmr3178011wme.188.1660776886931; Wed, 17
 Aug 2022 15:54:46 -0700 (PDT)
MIME-Version: 1.0
References: <20220815093905.134164-1-hsinyi@chromium.org>
In-Reply-To: <20220815093905.134164-1-hsinyi@chromium.org>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 17 Aug 2022 15:54:35 -0700
X-Gmail-Original-Message-ID: <CAD=FV=XYNKF8q1mttru_J188pYMjSphQsEfQAO1Bt7GvjJRKXw@mail.gmail.com>
Message-ID: <CAD=FV=XYNKF8q1mttru_J188pYMjSphQsEfQAO1Bt7GvjJRKXw@mail.gmail.com>
Subject: Re: [PATCH] drm/bridge: ps8640: Add double reset T4 and T5 to
 power-on sequence
To: Hsin-Yi Wang <hsinyi@chromium.org>
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
Cc: Jonas Karlman <jonas@kwiboo.se>, David Airlie <airlied@linux.ie>,
 Robert Foss <robert.foss@linaro.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Neil Armstrong <narmstrong@baylibre.com>,
 rock.chiu@paradetech.corp-partner.google.com,
 LKML <linux-kernel@vger.kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Mon, Aug 15, 2022 at 2:39 AM Hsin-Yi Wang <hsinyi@chromium.org> wrote:
>
> The double reset power-on sequence is a workaround for the hardware
> flaw in some chip that SPI Clock output glitch and cause internal MPU
> unable to read firmware correctly. The sequence is suggested in ps8640
> application note.
>
> Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
> ---
>  drivers/gpu/drm/bridge/parade-ps8640.c | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/drivers/gpu/drm/bridge/parade-ps8640.c b/drivers/gpu/drm/bridge/parade-ps8640.c
> index 49107a6cdac18..d7483c13c569b 100644
> --- a/drivers/gpu/drm/bridge/parade-ps8640.c
> +++ b/drivers/gpu/drm/bridge/parade-ps8640.c
> @@ -375,6 +375,11 @@ static int __maybe_unused ps8640_resume(struct device *dev)
>         gpiod_set_value(ps_bridge->gpio_reset, 1);
>         usleep_range(2000, 2500);
>         gpiod_set_value(ps_bridge->gpio_reset, 0);
> +       /* Double reset for T4 and T5 */
> +       msleep(50);
> +       gpiod_set_value(ps_bridge->gpio_reset, 1);
> +       msleep(50);
> +       gpiod_set_value(ps_bridge->gpio_reset, 0);

We really need another 100 ms here? ps8640 is already quite slow at
powering itself up and that has a real user impact. Why was it only
2.5 ms for the first reset and 50 ms for the second?

-Doug
