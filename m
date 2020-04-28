Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B48491BBD86
	for <lists+dri-devel@lfdr.de>; Tue, 28 Apr 2020 14:26:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1498089BB3;
	Tue, 28 Apr 2020 12:25:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com
 [IPv6:2a00:1450:4864:20::142])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 31ADC89BB3
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Apr 2020 12:25:55 +0000 (UTC)
Received: by mail-lf1-x142.google.com with SMTP id w145so16732653lff.3
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Apr 2020 05:25:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=y3CrBoDpzGJjyKIi+DpjYHt2NK5y8m5CojptJRFb0pU=;
 b=FQrwhGKLvaQDgj3OcQS2/tAhntXv2Kzc5Rg7N9I4UbMU7paoSFg+yWGK06VYXhk/1o
 UwCdQZj3Rd67ss3sinoBLCJy2qr7lmIyRw7vsb68gstUo6s2Tfc5KoG7Dt5BC8e7kcs3
 HECCE/eK6Ck9uQMuTnEx+SKE3hwkXSzz5QDl8PcB7GQe6LlgLtHpBeRXZEvuau2/jvln
 E8cQEmyO6jGOLaD2MTc6nOrs/AJ5el8oWlAnxoCF1nEhqYdoQKWTszF3dV096mo1IRMa
 jlxA1WJb4+Gkzm6GmWEs8cxFcyRseknKOUsSh6cTxq9cKWqEbEkr1vIRntp4Anapy6pO
 Hgzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=y3CrBoDpzGJjyKIi+DpjYHt2NK5y8m5CojptJRFb0pU=;
 b=ULou/DnigGY2Sgrs9cf/BeCeuuc8j5zl0VmvB4mWbKkJG6Abb8p/jIfe2eBh0ay5sN
 PLu4R321W8CdD6pWK8QS1prr5cVYILTeDFvyX7vgtVzgfDUGHvggBIWR3TIKZtsIvnU5
 fy62uxxADl5Kyd2sanQD8U32ALEA/nEk9JVE/t2M6dQrfTq/jg2ENfcIT+MiXhgDP033
 NpJyUGUBBBVIAOWz5k4FxOz01Vxd1YIu78qieLE2B3SZwpWg1ew6q7m29mmQDLsm7t7q
 xDkVQm4o5PUqgs/ysFKMX2VaIjdnrZ4bPH1K4J/GosLQKfNy1MawqfAGsy7JPoRav6OF
 qZ4g==
X-Gm-Message-State: AGi0PuadT9gCVQ0ylC6QuUpYFoKJku6Ahm9LC9sw99h4mfKdLcrETtkY
 WYRfFVsTe9Pw97CVm2kWhVrYgJK35vybI1TRR3FvQg==
X-Google-Smtp-Source: APiQypLPb2mAHpSsIdPNB3D7OVgcTv0eVuKODtDnL03qMl/e3W2QqNgeTth6RsbPQYrzCLTfa1qEof/jAdPKF+ud1Kg=
X-Received: by 2002:ac2:5c4e:: with SMTP id s14mr19280291lfp.77.1588076753555; 
 Tue, 28 Apr 2020 05:25:53 -0700 (PDT)
MIME-Version: 1.0
References: <20200423162548.129661-1-dianders@chromium.org>
 <20200423092431.v3.5.I72892d485088e57378a4748c86bc0f6c2494d807@changeid>
In-Reply-To: <20200423092431.v3.5.I72892d485088e57378a4748c86bc0f6c2494d807@changeid>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 28 Apr 2020 14:25:42 +0200
Message-ID: <CACRpkdZkRKgRo2-pxiyoz-3W_aoR+qb+AA-4+ZaPtt2Ykecs0w@mail.gmail.com>
Subject: Re: [PATCH v3 5/6] dt-bindings: drm/bridge: ti-sn65dsi86: Document
 no-hpd
To: Douglas Anderson <dianders@chromium.org>
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
Cc: Rob Clark <robdclark@chromium.org>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Jernej Skrabec <jernej.skrabec@siol.net>,
 Andrzej Hajda <a.hajda@samsung.com>, Dave Airlie <airlied@linux.ie>,
 MSM <linux-arm-msm@vger.kernel.org>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Jeffrey Hugo <jeffrey.l.hugo@gmail.com>, Sandeep Panda <spanda@codeaurora.org>,
 "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
 Stephen Boyd <swboyd@chromium.org>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 Jonas Karlman <jonas@kwiboo.se>, Rob Herring <robh+dt@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Apr 23, 2020 at 6:26 PM Douglas Anderson <dianders@chromium.org> wrote:

> The ti-sn65dsi86 MIPI DSI to eDP bridge chip has a dedicated hardware
> HPD (Hot Plug Detect) pin on it, but it's mostly useless for eDP
> because of excessive debouncing in hardware.  Specifically there is no
> way to disable the debouncing and for eDP debouncing hurts you because
> HPD is just used for knowing when the panel is ready, not for
> detecting physical plug events.
>
> Currently the driver in Linux just assumes that nobody has HPD hooked
> up.  It relies on folks setting the "no-hpd" property in the panel
> node to specify that HPD isn't hooked up and then the panel driver
> using this to add some worst case delays when turning on the panel.
>
> Apparently it's also useful to specify "no-hpd" in the bridge node so
> that the bridge driver can make sure it's doing the right thing
> without peeking into the panel [1].  This would be used if anyone ever
> found it useful to implement support for the HW HPD pin on the bridge.
> Let's add this property to the bindings.
>
> NOTES:
> - This is somewhat of a backward-incompatible change.  All current
>   known users of ti-sn65dsi86 didn't have "no-hpd" specified in the
>   bridge node yet none of them had HPD hooked up.  This worked because
>   the current Linux driver just assumed that HPD was never hooked up.
>   We could make it less incompatible by saying that for this bridge
>   it's assumed HPD isn't hooked up _unless_ a property is defined, but
>   "no-hpd" is much more standard and it's unlikely to matter unless
>   someone quickly goes and implements HPD in the driver.
> - It is sensible to specify "no-hpd" at the bridge chip level and
>   specify "hpd-gpios" at the panel level.  That would mean HPD is
>   hooked up to some other GPIO in the system, just not the hardware
>   HPD pin on the bridge chip.
>
> [1] https://lore.kernel.org/r/20200417180819.GE5861@pendragon.ideasonboard.com
>
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> Reviewed-by: Stephen Boyd <swboyd@chromium.org>

Makes sense to me so:
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

> +  no-hpd:
> +    type: boolean
> +    description: Set if the HPD line on the bridge isn't hooked up to anything.

I would perhaps tag on:
... or is otherwise unusable?

Yours,
Linus Walleij
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
