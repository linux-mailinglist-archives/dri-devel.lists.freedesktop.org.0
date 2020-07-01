Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 73285210573
	for <lists+dri-devel@lfdr.de>; Wed,  1 Jul 2020 09:52:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A26D56E82D;
	Wed,  1 Jul 2020 07:52:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com
 [IPv6:2a00:1450:4864:20::243])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 798C76E82D
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Jul 2020 07:52:34 +0000 (UTC)
Received: by mail-lj1-x243.google.com with SMTP id t25so21214306lji.12
 for <dri-devel@lists.freedesktop.org>; Wed, 01 Jul 2020 00:52:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Sp8OFRFf6RX3lWs07Kr7AL+Vpp0ArpSvDuDKv5ockV4=;
 b=ZWv+idF9f6C09tDpuANbtiZts4oy6Jp5G1wSc4cfgblqEH6E+eM6fWzw78g8Jym25H
 ESLvx77xZlyF23QX2tk/bGVSZNIB3cK6WP7tuOsSmSUSUfQKFljAkgjkGFTg5MVl2SHc
 I45UL6AyclZyHXiaOMg5f2gg14p0pj9SskoqwosD9HZoQEAmhfiFU6SFqpnSIdpxjDYK
 gb4O0POOdeIrAJGg2v5Pp1AmYKsvfYwczug197KEa/QuFl43CZRsgMDP7tJL54aSqTky
 SmG+X0j/S7GVnqpwYBphXgIDO0nunTa5tPSy6BcjTknPtA8noK/g2cyVwldEPqFh9+Xu
 zjfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Sp8OFRFf6RX3lWs07Kr7AL+Vpp0ArpSvDuDKv5ockV4=;
 b=CGC/yHAiRsXsMWTE4yo6SZCR6zur7rZmFTb4CD4RIXjZ/1e4xFMPXHOa5cXkfRF3Nw
 LwN7ofH2crpi0B0AvL6l0mk7gwdsSv3j1uIzDIZ8guChydBlWYblfJ1wr9DfYeqnT9Hh
 XddISi1j/kKjP3KqGm/wYHFc4eWk/5e+lXVkjAlOD+EIybNa8LCGRfhOw/zjQFEKfNNF
 8n1TCnZvdX33Y5xheCna0GHSvC+y6gVx1FfmkOzfvpBynCVkMjAliCS8WVcxgHENnox7
 rNm+ZSTUFl4nruo8c1byyeZMQOB1m7okISZ/XmDNGVGy6Vl/+yWdBdQTw6ti/9bBfvUj
 +v3Q==
X-Gm-Message-State: AOAM530Wmkte4GeIVo1qbjOnV4b6MEy1qo8Qiezh/zVX+xs87HdSUzYJ
 kzvg2GkvDyC5sAm/oiWufRAIVDPvHG4DChEV1vQXhw==
X-Google-Smtp-Source: ABdhPJwpRScXAGVUMqgSm84FX6WJ0SzvlgWp8UNzvNb5Aa6vqYqzZkRC8x+/6pQpFExpVAZVeTV2K/cWOS/1LOUiSjs=
X-Received: by 2002:a05:651c:112e:: with SMTP id
 e14mr11806438ljo.338.1593589952845; 
 Wed, 01 Jul 2020 00:52:32 -0700 (PDT)
MIME-Version: 1.0
References: <20200626005601.241022-1-megous@megous.com>
 <20200626005601.241022-13-megous@megous.com>
In-Reply-To: <20200626005601.241022-13-megous@megous.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 1 Jul 2020 09:52:21 +0200
Message-ID: <CACRpkdaca=1gvYv5e2v3BzZSTE_1gab6nOt6DCrFm3QX64xy9Q@mail.gmail.com>
Subject: Re: [PATCH v5 12/13] arm64: dts: sun50i-a64-pinephone: Enable LCD
 support on PinePhone
To: Ondrej Jirman <megous@megous.com>
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
Cc: "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Purism Kernel Team <kernel@puri.sm>,
 Samuel Holland <samuel@sholland.org>, David Airlie <airlied@linux.ie>,
 =?UTF-8?Q?Guido_G=C3=BCnther?= <agx@sigxcpu.org>, Bhushan Shah <bshah@kde.org>,
 Chen-Yu Tsai <wens@csie.org>, Rob Herring <robh+dt@kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Martijn Braam <martijn@brixit.nl>, linux-sunxi <linux-sunxi@googlegroups.com>,
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 Luca Weiss <luca@z3ntu.xyz>, Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Icenowy Zheng <icenowy@aosc.io>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jun 26, 2020 at 2:56 AM Ondrej Jirman <megous@megous.com> wrote:

> From: Icenowy Zheng <icenowy@aosc.io>
>
> PinePhone uses PWM backlight and a XBD599 LCD panel over DSI for
> display.
>
> Backlight levels curve was optimized by Martijn Braam using a
> lux meter.
>
> Add its device nodes.
>
> Signed-off-by: Icenowy Zheng <icenowy@aosc.io>
> Signed-off-by: Martijn Braam <martijn@brixit.nl>
> Signed-off-by: Ondrej Jirman <megous@megous.com>

Acked-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
