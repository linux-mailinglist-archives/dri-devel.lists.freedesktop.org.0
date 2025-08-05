Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F6B9B1AE81
	for <lists+dri-devel@lfdr.de>; Tue,  5 Aug 2025 08:44:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF68010E250;
	Tue,  5 Aug 2025 06:44:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="UOWSRomr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7BEBC10E250
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Aug 2025 06:44:24 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 55699A4BB3D;
 Tue,  5 Aug 2025 06:44:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6C91FC4CEF4;
 Tue,  5 Aug 2025 06:44:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1754376263;
 bh=zmCWDbWtpbzzMgGs32xyb++YFUupJejY/iPWbySknCE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=UOWSRomr0pF+kNq2Wqx0WlNWOK9zgM8cUY4Q8tKNvhWGi7wzFQdn2ouq4/W9+uH85
 mzCdCgNqfZslO1QHOiHipKSZvLTfL8KESWciykzs3LDpWEmdYWFp+YItmvxl7WUBr4
 LZU4bjSpoT3Dse6+qPk9lzuxQ1i79ZeHBY3qtTkUlaMiw42Pss9n+Wok3g4oJwxsQb
 vttuoPPbgCp6JTHu69W+t2Mjl6Dl+xWNJIvyr/I7GOjMRd9TmlwPDeQ98JQIn44OQW
 TqrUjW/ZeBMqSYB9xaslr0IJaWLP3EGmNFSFN4BJ0OjrszA4lrqI1jOBi/1ARtSeNW
 172AqkZbP6dYQ==
Date: Tue, 5 Aug 2025 08:44:20 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Louis Chauvet <louis.chauvet@bootlin.com>
Cc: Rob Herring <robh@kernel.org>, Jyri Sarha <jyri.sarha@iki.fi>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Sam Ravnborg <sam@ravnborg.org>, Benoit Parrot <bparrot@ti.com>,
 Lee Jones <lee@kernel.org>, 
 Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Tero Kristo <kristo@kernel.org>, thomas.petazzoni@bootlin.com,
 Jyri Sarha <jsarha@ti.com>, 
 Tomi Valkeinen <tomi.valkeinen@ti.com>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 stable@vger.kernel.org
Subject: Re: [PATCH 3/4] arm64: dts: ti: k3-am62-main: Add tidss clk-ctrl
 property
Message-ID: <20250805-imperial-bobcat-of-improvement-5cf705@kuoka>
References: <20250730-fix-edge-handling-v1-0-1bdfb3fe7922@bootlin.com>
 <20250730-fix-edge-handling-v1-3-1bdfb3fe7922@bootlin.com>
 <20250731001725.GA1938112-robh@kernel.org>
 <8a2b1876-d1d4-4523-ae6a-bd14875772cf@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <8a2b1876-d1d4-4523-ae6a-bd14875772cf@bootlin.com>
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

On Thu, Jul 31, 2025 at 11:50:16AM +0200, Louis Chauvet wrote:
>=20
>=20
> Le 31/07/2025 =C3=A0 02:17, Rob Herring a =C3=A9crit=C2=A0:
> > On Wed, Jul 30, 2025 at 07:02:46PM +0200, Louis Chauvet wrote:
> > > For am62 processors, we need to use the newly created clk-ctrl proper=
ty to
> > > properly handle data edge sampling configuration. Add them in the main
> > > device tree.
> > >=20
> > > Fixes: 32a1795f57ee ("drm/tidss: New driver for TI Keystone platform =
Display SubSystem")
> > > Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
> > > ---
> > >=20
> > > Cc: stable@vger.kernel.org
> > > ---
> > >   arch/arm64/boot/dts/ti/k3-am62-main.dtsi | 6 ++++++
> > >   1 file changed, 6 insertions(+)
> > >=20
> > > diff --git a/arch/arm64/boot/dts/ti/k3-am62-main.dtsi b/arch/arm64/bo=
ot/dts/ti/k3-am62-main.dtsi
> > > index 9e0b6eee9ac77d66869915b2d7bec3e2275c03ea..d3131e6da8e70fde035d3=
c44716f939e8167795a 100644
> > > --- a/arch/arm64/boot/dts/ti/k3-am62-main.dtsi
> > > +++ b/arch/arm64/boot/dts/ti/k3-am62-main.dtsi
> > > @@ -76,6 +76,11 @@ audio_refclk1: clock-controller@82e4 {
> > >   			assigned-clock-parents =3D <&k3_clks 157 18>;
> > >   			#clock-cells =3D <0>;
> > >   		};
> > > +
> > > +		dss_clk_ctrl: dss_clk_ctrl@8300 {
> > > +			compatible =3D "ti,am625-dss-clk-ctrl", "syscon";
> > > +			reg =3D <0x8300 0x4>;
> >=20
> > H/w blocks are rarely only 4 bytes of registers... Does this belong to
> > some larger block. The problem with bindings defining single registers
> > like this is they don't get defined until needed and you have a constant
> > stream of DT updates.
>=20
> In this case, I don't think there is a "larger block". This register exis=
ts
> only because TI had issues in the display controller [1].
>=20
> Here is the extract of MMR registers ([2], page 4311):
>=20
> [...]
> A2E4h AUDIO_REFCLK1_CTRL_PROXY <unrelated>

Here is clk ctrl proxy...

> A300h DPI0_CLK_CTRL_PROXY <this register, 32 bits>

and here as well, so pretty related. This looks also close to regular
syscon and we do not define individual syscon registers as device nodes.

Best regards,
Krzysztof

