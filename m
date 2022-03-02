Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BE344C99BC
	for <lists+dri-devel@lfdr.de>; Wed,  2 Mar 2022 01:13:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6962F10E8F9;
	Wed,  2 Mar 2022 00:13:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [IPv6:2a00:1450:4864:20::634])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B48D10E8F9
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Mar 2022 00:13:23 +0000 (UTC)
Received: by mail-ej1-x634.google.com with SMTP id d10so246909eje.10
 for <dri-devel@lists.freedesktop.org>; Tue, 01 Mar 2022 16:13:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=/j886eHeCQQ+B/LnhHOr3G5esNjPN9vWDMPN740hzTI=;
 b=cyJKIPiG45NiVS2hhjUCzfJF8FN3TzwKafhVpC8ItarLc9OljQC3p2Qa7HHgcxLZHp
 G1YXdkAvaMigvga2odmLWgKrkUv9HCf3QNLnYxCNw4dJcozblixr9jzolOxm6ATmGXGQ
 HFLhSbwJ2KS8FgvShRX04hWbkp7br/cgg+Q2A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=/j886eHeCQQ+B/LnhHOr3G5esNjPN9vWDMPN740hzTI=;
 b=u6E8y8MOcPti4qRrFXo/Pdd+0U0Df58c0wS5kj6Rc3wUj83GmdO/3Hg3C4H/7Xx9Sq
 qjA6FQwxxHA8YzEPzx5+A/KWLBDlO6KRCeX3sToC33VqLAs5pTSct824/Ma45ij8xCXS
 +l/K6q4+bFXvbi2x27LEbICXzdFyGvh2nqRuZMeQFwj11xkNDyxOVgGjJHZ1IRsqRo8z
 1TKT+6Y74lmfD/iXWno9FcjzppLPPxwlDChvghDc6vjxWmebz3MYjfuoac63mSuwXR7o
 rPGsX2P8SNHhphW90RPmZhYYOoRAA3LbQg3nSm8TSID67GNpUmSIaZ+TUATxYggpyOt8
 kbZQ==
X-Gm-Message-State: AOAM533CeuqEJstjIRSw21qkkMslh8w9DeHYFH6U7dFLNqUMXVpvcmaT
 dV+LWJALjNlgyhSX93w6OlnMM5YyWBFhV4nj
X-Google-Smtp-Source: ABdhPJwxRVlH8x+R4E2Ns53q9t8/SCy9AzLlf9tM8ILkuwQ3zMDkcU3cpmkKlFYRcZIHWUf3NcDAaQ==
X-Received: by 2002:a17:907:d20:b0:6d7:1a45:c1ed with SMTP id
 gn32-20020a1709070d2000b006d71a45c1edmr2201973ejc.447.1646180001596; 
 Tue, 01 Mar 2022 16:13:21 -0800 (PST)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com.
 [209.85.128.53]) by smtp.gmail.com with ESMTPSA id
 gq15-20020a170906e24f00b006cfba1c5433sm5842154ejb.172.2022.03.01.16.13.20
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 01 Mar 2022 16:13:20 -0800 (PST)
Received: by mail-wm1-f53.google.com with SMTP id y5so174085wmi.0
 for <dri-devel@lists.freedesktop.org>; Tue, 01 Mar 2022 16:13:20 -0800 (PST)
X-Received: by 2002:a05:600c:1d08:b0:381:6eda:67d1 with SMTP id
 l8-20020a05600c1d0800b003816eda67d1mr8377193wms.88.1646180000242; Tue, 01 Mar
 2022 16:13:20 -0800 (PST)
MIME-Version: 1.0
References: <cover.1645029005.git.dave.stevenson@raspberrypi.com>
In-Reply-To: <cover.1645029005.git.dave.stevenson@raspberrypi.com>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 1 Mar 2022 16:13:05 -0800
X-Gmail-Original-Message-ID: <CAD=FV=WX3i+6yubPVry8KUkO_14P94HTXv_uU8Pd5yPpw+iPRQ@mail.gmail.com>
Message-ID: <CAD=FV=WX3i+6yubPVry8KUkO_14P94HTXv_uU8Pd5yPpw+iPRQ@mail.gmail.com>
Subject: Re: [PATCH 0/2] DSI host and peripheral initialisation ordering
To: Dave Stevenson <dave.stevenson@raspberrypi.com>
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
Cc: Marek Vasut <marex@denx.de>, Jagan Teki <jagan@amarulasolutions.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 Robert Foss <robert.foss@linaro.org>, Jonas Karlman <jonas@kwiboo.se>,
 dri-devel <dri-devel@lists.freedesktop.org>, andrzej.hajda@gmail.com,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Wed, Feb 16, 2022 at 9:00 AM Dave Stevenson
<dave.stevenson@raspberrypi.com> wrote:
>
> Hi All
>
> Hopefully I've cc'ed all those that have bashed this problem around previously,
> or are otherwise linked to DRM bridges.
>
> There have been numerous discussions around how DSI support is currently broken
> as it doesn't support initialising the PHY to LP-11 and potentially the clock
> lane to HS prior to configuring the DSI peripheral. There is no op where the
> interface is initialised but HS video isn't also being sent.
> Currently you have:
> - peripheral pre_enable (host not initialised yet)
> - host pre_enable
> - encoder enable
> - host enable
> - peripheral enable (video already running)
>
> vc4 and exynos currently implement the DSI host as an encoder, and split the
> bridge_chain. This fails if you want to switch to being a bridge and/or use
> atomic calls as the state of all the elements split off are not added by
> drm_atomic_add_encoder_bridges.
>
> dw-mipi-dsi[1] and now msm[2] use the mode_set hook to initialise the PHY, so
> the bridge/panel pre_enable can send commands. In their post_disable they then
> call the downstream bridge/panel post_disable op manually so that shutdown
> commands can be sent before shutting down the PHY. Nothing handles that fact,
> so the framework then continues down the bridge chain and calls the post_disable
> again, so we get unbalanced panel prepare/unprepare calls being reported [3].
>
> There have been patches[4] proposing reversing the entire direction of
> pre_enable and post_disable, but that risks driving voltage into devices that
> have yet to be powered up.
> There have been discussions about adding either a pre_pre_enable, or adding a
> DSI host_op to initialise the host[5]. Both require significant reworking to all
> existing drivers in moving initialisation phases.
> We have patches that look like they may well be addressing race conditions in
> starting up a DSI peripheral[6].

In general I'm happy to let the more senior people in DRM set the
direction here so I probably won't do lots of review, but I will point
out that I did have another proposal that sorta got lost in the noise
of the whole "reversing the entire direction". That's basically:

https://lists.freedesktop.org/archives/dri-devel/2021-October/328934.html

I have no idea if something like that would work for your use case,
but after analyzing it it felt like a surprisingly clean proposal even
if my first instinct when I thought about it was that it was a hack.
;-) I suspect (but haven't analyzed your code) that it might be
equivalent to your proposal of using a flag but maybe easier to wrap
ones head around?


-Doug
