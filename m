Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BC208432892
	for <lists+dri-devel@lfdr.de>; Mon, 18 Oct 2021 22:43:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF1946EA5A;
	Mon, 18 Oct 2021 20:43:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd30.google.com (mail-io1-xd30.google.com
 [IPv6:2607:f8b0:4864:20::d30])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE42E6EA63
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Oct 2021 20:43:11 +0000 (UTC)
Received: by mail-io1-xd30.google.com with SMTP id h196so17876300iof.2
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Oct 2021 13:43:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=NEzkQ9AMimvLzS0zxjsiIV7V37hJ+OdttYyqIoFNqLU=;
 b=RYeZX0qbLYX5B/8w8AGyG/PUKn2mi5CkbqHMQZ1HVTrpYucMxBIwaC5K23Da2IDRs/
 P0sSsMh0AGfFbKC5g9VZ5RnOIi/a/K9ODJGGKjhT2z/iCgJSgW0kL4ed1S4Ziua06sIg
 hd4V5LQ/y2btPOQrWgZy+7ZGx4QNReKC8RBbQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=NEzkQ9AMimvLzS0zxjsiIV7V37hJ+OdttYyqIoFNqLU=;
 b=0Tn0wM8v45lQ6Sgfnocf7Ba1UPwEgZy4K+jU+8rar+iEtpMzwYTx0iCiCJ6HodA067
 HmcnQAjH8vfg9OJmKtmO5WvJsBlHU4lneyx+qkN8o2/9HbG9e4yEHcF/7w1TesaaRfgX
 K6p24ggBuM5IKEif4Ii+uPUYIpK1jwNaio0KW72e+HMppaStiFsqanjFpB9ER5kjZh7a
 BnQbFfVdev+6rUNgB7GIc8K4/2uRLjevutEkzQosl/FWv/+Kp+LPqKOdR5DwJ6Cq17Fr
 hI1pGMJ6KhNiSzHn7S/e8L4sszG2H0lJ16lrO2OyQYXiGcoBz/19hQkcC124IGgXPjt4
 Kx/w==
X-Gm-Message-State: AOAM533vcSYlnMtrmkEMVCC2IbqvVqcyKrsSkAQ35eU8gK9kjHYSs5cS
 ZN9sNmsoLrIeQa41M+qaUG9H0jlqDYRk3w==
X-Google-Smtp-Source: ABdhPJybKksPd3ogTngru/p0hxjOK/uVBRQtPaZKSxDvlufPHzKvpjW6N8ILaRtyuslwu5T6VkVhdA==
X-Received: by 2002:a05:6602:2c88:: with SMTP id
 i8mr16293996iow.48.1634589790850; 
 Mon, 18 Oct 2021 13:43:10 -0700 (PDT)
Received: from mail-il1-f172.google.com (mail-il1-f172.google.com.
 [209.85.166.172])
 by smtp.gmail.com with ESMTPSA id j3sm7687712ilu.15.2021.10.18.13.43.10
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 18 Oct 2021 13:43:10 -0700 (PDT)
Received: by mail-il1-f172.google.com with SMTP id a8so16215756ilj.10
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Oct 2021 13:43:10 -0700 (PDT)
X-Received: by 2002:a05:6e02:15cb:: with SMTP id
 q11mr15819434ilu.180.1634589789692; 
 Mon, 18 Oct 2021 13:43:09 -0700 (PDT)
MIME-Version: 1.0
References: <20211016095644.1.I9d81c3b44f350707b5373d00524af77c4aae862b@changeid>
In-Reply-To: <20211016095644.1.I9d81c3b44f350707b5373d00524af77c4aae862b@changeid>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 18 Oct 2021 13:42:58 -0700
X-Gmail-Original-Message-ID: <CAD=FV=V7+MzyjsLKE87c=8bkFiRbQkGoM4Jfm8jcsJBG0aYAWw@mail.gmail.com>
Message-ID: <CAD=FV=V7+MzyjsLKE87c=8bkFiRbQkGoM4Jfm8jcsJBG0aYAWw@mail.gmail.com>
Subject: Re: [PATCH 1/2] drm/bridge: parade-ps8640: Enable runtime power
 management
To: Philip Chen <philipchen@chromium.org>
Cc: LKML <linux-kernel@vger.kernel.org>, Stephen Boyd <swboyd@chromium.org>, 
 Andrzej Hajda <a.hajda@samsung.com>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@linux.ie>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, Jonas Karlman <jonas@kwiboo.se>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Neil Armstrong <narmstrong@baylibre.com>, Robert Foss <robert.foss@linaro.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
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

Hi,

On Sat, Oct 16, 2021 at 9:57 AM Philip Chen <philipchen@chromium.org> wrote:
>
> @@ -319,81 +345,70 @@ static void ps8640_bridge_poweron(struct ps8640 *ps_bridge)
>          */
>         msleep(200);
>
> -       ret = regmap_read_poll_timeout(map, PAGE2_GPIO_H, status,
> -                                      status & PS_GPIO9, 20 * 1000, 200 * 1000);
> -
> -       if (ret < 0) {
> -               DRM_ERROR("failed read PAGE2_GPIO_H: %d\n", ret);
> -               goto err_regulators_disable;
> -       }

Above the "msleep(200)" I see a comment that says "and then check the
MCU ready flag every 20ms". That probably refers to the code that
you're moving here. Maybe change the comment above the "msleep(200);"
to something like this if you like it:

/*
 * Mystery 200 ms delay for the "MCU to be ready". It's unclear if
 * this is truly necessary since the MCU will already signal that
 * things are "good to go" by signaling HPD on "gpio 9". See
 * ps8640_ensure_hpd(). For now we'll keep this mystery delay just in
 * case.
 */

Other than that this looks good to me, which isn't really a surprise
since I was involved in helping with / reviewing early versions of
this change. In any case, I'm happy with:

Reviewed-by: Douglas Anderson <dianders@chromium.org>
