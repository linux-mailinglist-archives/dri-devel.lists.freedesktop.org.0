Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C8B7211CD3
	for <lists+dri-devel@lfdr.de>; Thu,  2 Jul 2020 09:25:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B843F6EA5C;
	Thu,  2 Jul 2020 07:24:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from vps.xff.cz (vps.xff.cz [195.181.215.36])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E23D36E1D7
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Jul 2020 10:34:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=megous.com; s=mail;
 t=1593599692; bh=B7kWQsfpsGr8GvlX/z/EdaUkxTMac7sQsGSIptCqVQE=;
 h=Date:From:To:Cc:Subject:References:X-My-GPG-KeyId:From;
 b=a/cVqSQJeci9mwW2INPMd6BuXqViGSBir/xjSPUR3Df3hcV+pzYZosoSHUHT0o2GX
 Op3mZ9UoCxzoidvMK3P6lWYVlLNFONzbOF9a0NmK5IwJqY1ZJQPCynM7DKy7s118y3
 SQ/7qhljisG3F7W8VnkQ3GND12mq3LLxvLaryu+8=
Date: Wed, 1 Jul 2020 12:34:51 +0200
From: =?utf-8?Q?Ond=C5=99ej?= Jirman <megous@megous.com>
To: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v5 09/13] drm/panel: st7703: Add support for Xingbangda
 XBD599
Message-ID: <20200701103451.67worsg3wvupyuoh@core.my.home>
Mail-Followup-To: =?utf-8?Q?Ond=C5=99ej?= Jirman <megous@megous.com>,
 Linus Walleij <linus.walleij@linaro.org>,
 linux-sunxi <linux-sunxi@googlegroups.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Sam Ravnborg <sam@ravnborg.org>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>,
 Guido =?utf-8?Q?G=C3=BCnther?= <agx@sigxcpu.org>,
 Purism Kernel Team <kernel@puri.sm>,
 Rob Herring <robh+dt@kernel.org>,
 Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Icenowy Zheng <icenowy@aosc.io>,
 "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, 
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Samuel Holland <samuel@sholland.org>,
 Martijn Braam <martijn@brixit.nl>, Luca Weiss <luca@z3ntu.xyz>,
 Bhushan Shah <bshah@kde.org>
References: <20200626005601.241022-1-megous@megous.com>
 <20200626005601.241022-10-megous@megous.com>
 <CACRpkdZcMA_Y_eH8_TL09Z0_DADDcUy5s_S45UfrnoSKmNgtXw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CACRpkdZcMA_Y_eH8_TL09Z0_DADDcUy5s_S45UfrnoSKmNgtXw@mail.gmail.com>
X-My-GPG-KeyId: EBFBDDE11FB918D44D1F56C1F9F0A873BE9777ED
 <https://xff.cz/key.txt>
X-Mailman-Approved-At: Thu, 02 Jul 2020 07:24:22 +0000
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
 Guido =?utf-8?Q?G=C3=BCnther?= <agx@sigxcpu.org>, Bhushan Shah <bshah@kde.org>,
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

Hello Linus,

On Wed, Jul 01, 2020 at 09:50:40AM +0200, Linus Walleij wrote:
> On Fri, Jun 26, 2020 at 2:56 AM Ondrej Jirman <megous@megous.com> wrote:
> 
> > Xingbangda XBD599 is a 5.99" 720x1440 MIPI-DSI LCD panel used in
> > PinePhone. Add support for it.
> >
> > Signed-off-by: Icenowy Zheng <icenowy@aosc.io>
> > Signed-off-by: Ondrej Jirman <megous@megous.com>
> 
> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Thank you very much for the review. :)

I've sent v6 which should fix the currently remaining issues with dt bindings
+ one timing issue I've found in this patch. I've kept your reviewed-by tag,
because it's a fairly trivial issue. But feel free to complain.

thank you again and regards,
	o.

> Yours,
> Linus Walleij
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
