Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D9D84829529
	for <lists+dri-devel@lfdr.de>; Wed, 10 Jan 2024 09:30:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D82F10E56E;
	Wed, 10 Jan 2024 08:30:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail5.25mail.st (mail5.25mail.st [74.50.62.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A23410E56E
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Jan 2024 08:30:24 +0000 (UTC)
Received: from localhost (91-158-86-216.elisa-laajakaista.fi [91.158.86.216])
 by mail5.25mail.st (Postfix) with ESMTPSA id 357696054F;
 Wed, 10 Jan 2024 08:29:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=atomide.com;
 s=25mailst; t=1704875422;
 bh=bFoJA47e/ENQMqfrZCLeRoCUKOWsd4nstT11nKJGDEA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=oFUD/rKdNHlx9bjp6ogxVOFj4ZI/BOAzLLQBtWg5/TRZhMohqej9K85C1Lpzhl7W7
 8laoKqARuPWNg5S7DAKwpovVR1Y6uXZmpS5qbWI7ehXoLGbVSDNP2ZuHLJj5wwz1sW
 Dpe/375EBlmljQTyGl/QmMIBBtqnMArNTLevJ4rJ7hbxybvH3MjIIPlAItPyIh2npD
 X9O8fvQBcrrt6ZLIZlmDy5zx6rFhA87E73hhyh+trKl6lR9ppWTXsfcCC+p8PpWHdM
 0OU1RfCWx3HTulxANJWE80mhmT0+iyz9m3KlvqSGCyLqc/9XgrmQaqt2vXAHQ0y0WM
 TLR4v3NQjCHJQ==
Date: Wed, 10 Jan 2024 10:29:24 +0200
From: Tony Lindgren <tony@atomide.com>
To: Andrew Davis <afd@ti.com>
Subject: Re: [PATCH 08/11] ARM: dts: DRA7xx: Add device tree entry for SGX GPU
Message-ID: <20240110082924.GA5185@atomide.com>
References: <20240109171950.31010-1-afd@ti.com>
 <20240109171950.31010-9-afd@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240109171950.31010-9-afd@ti.com>
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
Cc: Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>,
 "H . Nikolaus Schaller" <hns@goldelico.com>, dri-devel@lists.freedesktop.org,
 linux-mips@vger.kernel.org, Paul Cercueil <paul@crapouillou.net>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>,
 Samuel Holland <samuel@sholland.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Chen-Yu Tsai <wens@csie.org>,
 linux-sunxi@lists.linux.dev, devicetree@vger.kernel.org,
 Conor Dooley <conor+dt@kernel.org>,
 =?utf-8?Q?Beno=C3=AEt?= Cousson <bcousson@baylibre.com>,
 Maxime Ripard <mripard@kernel.org>, Matt Coster <matt.coster@imgtec.com>,
 Rob Herring <robh+dt@kernel.org>, linux-omap@vger.kernel.org,
 Adam Ford <aford173@gmail.com>, linux-arm-kernel@lists.infradead.org,
 Tero Kristo <kristo@kernel.org>, linux-kernel@vger.kernel.org,
 Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

* Andrew Davis <afd@ti.com> [240109 17:20]:
> --- a/arch/arm/boot/dts/ti/omap/dra7.dtsi
> +++ b/arch/arm/boot/dts/ti/omap/dra7.dtsi
> @@ -850,12 +850,19 @@ target-module@56000000 {
>  					<SYSC_IDLE_SMART>;
>  			ti,sysc-sidle = <SYSC_IDLE_FORCE>,
>  					<SYSC_IDLE_NO>,
> -					<SYSC_IDLE_SMART>;
> +					<SYSC_IDLE_SMART>,
> +					<SYSC_IDLE_SMART_WKUP>;

You probably checked this already.. But just in case, can you please
confirm this is intentional. The documentation lists the smart wakeup
capability bit as reserved for dra7, maybe the documentation is wrong.

Regards,

Tony

