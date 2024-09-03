Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E4AD296AC19
	for <lists+dri-devel@lfdr.de>; Wed,  4 Sep 2024 00:22:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5453610E603;
	Tue,  3 Sep 2024 22:22:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Og8rOcYB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E50210E603
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Sep 2024 22:22:32 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 7F524A44023;
 Tue,  3 Sep 2024 22:22:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 91259C4CEC4;
 Tue,  3 Sep 2024 22:22:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1725402151;
 bh=IrSk1o8ushhaKuCvXST63SQs3d3u8Ubc1CdP9PDsQnw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Og8rOcYBdixWlepQIzpJrspZ7kvoBiWT9LsKHvHXdyqJnRTlEjcgASXjE0aIvGykw
 AQfbliE++ETMY9X7AOG6J2TFpaNvCDNEpp9MNun0oeM+psjoMgY96zId6s0664dq0d
 hn/bhwss9gwn1Wp122WLGZTLFlK5MEsXs46AMnntrzptdAndYxVS3upeGqjGbo4sFP
 OZucNOaD7N6rvHfqICq4jG8/kucsZbT59gHbpY42ugqwhsZgV8AqwCHezoDbQfi3eB
 1tDZ5kVS1QwS4o97nug1h82No8RNSvZTUNVc3SfkUjOO7F4J9D6bpSOeW0zomg/5Vp
 vrjoeDIpf3Agg==
Date: Wed, 4 Sep 2024 00:22:27 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Heiko =?utf-8?Q?St=C3=BCbner?= <heiko@sntech.de>
Cc: Detlev Casanova <detlev.casanova@collabora.com>, 
 linux-kernel@vger.kernel.org, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>, Mark Brown <broonie@kernel.org>, 
 Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck <linux@roeck-us.net>, 
 Chris Morgan <macromorgan@hotmail.com>, Jonas Karlman <jonas@kwiboo.se>,
 Tim Lunn <tim@feathertop.org>, 
 Andy Yan <andyshrk@163.com>, Muhammed Efe Cetin <efectn@protonmail.com>, 
 Jagan Teki <jagan@edgeble.ai>, Dragan Simic <dsimic@manjaro.org>,
 Ondrej Jirman <megi@xff.cz>, 
 Michael Riesch <michael.riesch@wolfvision.net>,
 Jimmy Hon <honyuenkwun@gmail.com>, 
 Elon Zhang <zhangzj@rock-chips.com>, Alexey Charkov <alchark@gmail.com>, 
 Elaine Zhang <zhangqing@rock-chips.com>,
 Yifeng Zhao <yifeng.zhao@rock-chips.com>, 
 Finley Xiao <finley.xiao@rock-chips.com>, Liang Chen <cl@rock-chips.com>,
 Jamie Iles <jamie@jamieiles.com>, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, dri-devel@lists.freedesktop.org,
 linux-i2c@vger.kernel.org, 
 linux-serial@vger.kernel.org, linux-spi@vger.kernel.org,
 linux-watchdog@vger.kernel.org, 
 kernel@collabora.com, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v4 3/9] dt-bindings: i2c: i2c-rk3x: Add rk3576 compatible
Message-ID: <jqrcyl6whje7y4wdxdcul2kvncm7zrbqux7jmb56hvhf2r2c47@rw5g32dznqbw>
References: <20240903152308.13565-1-detlev.casanova@collabora.com>
 <12506188.O9o76ZdvQC@bootstrap>
 <ycbhqmkwz2hirnvp6j47kz3cxnli3db3i5ah76gngrezs5ww2r@57x2gxnr5hyk>
 <23007922.5W6oEpyPa8@diego>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-15
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <23007922.5W6oEpyPa8@diego>
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

Hi Heiko,

On Tue, Sep 03, 2024 at 11:59:12PM GMT, Heiko Stübner wrote:
> Am Dienstag, 3. September 2024, 18:47:17 CEST schrieb Andi Shyti:
> > On Tue, Sep 03, 2024 at 11:59:34AM GMT, Detlev Casanova wrote:
> > > On Tuesday, 3 September 2024 11:46:00 EDT Andi Shyti wrote:
> > > > Hi,
> > > > 
> > > > On Tue, Sep 03, 2024 at 11:22:33AM GMT, Detlev Casanova wrote:
> > > > > Just like RK356x and RK3588, RK3576 is compatible to the existing
> > > > > rk3399 binding.
> > > > > 
> > > > > Signed-off-by: Detlev Casanova <detlev.casanova@collabora.com>
> > > > > Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> > > > > Acked-by: Heiko Stuebner <heiko@sntech.de>
> > > > 
> > > > I will apply this after 1 and 2 have been merged.
> > > 
> > > Sure, although it is not really dependent on 1 and 2.
> > 
> > yes, but I want to be sure that everything is coming in.
> > 
> > > > BTW, who is maintaining rockchip.yaml?
> > > 
> > > Heiko Stuebner is the maintainer of Rockchip SoC support.
> > 
> > I would guess so, but I think we should also add the entry to
> > the maintainer's file :-)
> 
> now you made me doubt the wildcards we have in place ;-)
> 
> # scripts/get_maintainer.pl -f Documentation/devicetree/bindings/arm/rockchip.yaml
> [...]
> Heiko Stuebner <heiko@sntech.de> (maintainer:ARM/Rockchip SoC support)
> [...]
> linux-rockchip@lists.infradead.org (open list:ARM/Rockchip SoC support)
> 
> So Maintainers seems to be correct ... *phew* :-)

Normally I check the MAINTAINERS file where the rockchip.yaml is
not listed. There is an "N: rockchip" under your name, but having
it explicitely stated wouldn't hurt (as it is in other arm/*yaml
file. That's why I got confused at first.

Anyway, sorry for the noise.

Thanks,
Andi
