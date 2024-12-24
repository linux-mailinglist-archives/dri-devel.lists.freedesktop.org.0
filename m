Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 01F139FBAC1
	for <lists+dri-devel@lfdr.de>; Tue, 24 Dec 2024 09:53:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E72F10E295;
	Tue, 24 Dec 2024 08:53:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="l7KL2Pd1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EFF4510E295
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Dec 2024 08:53:44 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 1FF535C5D98;
 Tue, 24 Dec 2024 08:53:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E809EC4CED6;
 Tue, 24 Dec 2024 08:53:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1735030423;
 bh=oyUzWxScHY5JktUj76SAcLkQhUMTi1JD+++R1xKImUM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=l7KL2Pd1eMbG7+IT5VzXzp8TwyhFDFBcm23dLtuEz+116n5GY9T5D7jFK0D+erV4/
 veBzuVbQU42IOdqMG0K3gJhluGz+D3/zi7a5PWcNqaB05v5N9+V/xzK8xbsWC+yVv/
 rjeRu+DpmOi95fF1JUHmGhuefWos3vvEjkkqJKssLscFggqVdixexfdYHiSC1BEN1t
 hNa1F7AACRErlNXOJ+X9cWYgZ9RumXmVJ68gq58V5MOZzOdu2vrfCBPYeJi2/vzzyQ
 k+qqyyyk4N612rDQJEKvdPm7Ppzi+jO6ABhJOuFpyMInHhPtIGo5cs1KvT8tcqVz09
 HQ1RMLWnIt/+w==
Date: Tue, 24 Dec 2024 09:53:41 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Stephen Boyd <sboyd@kernel.org>
Cc: Michal Wilczynski <m.wilczynski@samsung.com>, airlied@gmail.com, 
 aou@eecs.berkeley.edu, conor+dt@kernel.org, drew@pdp7.com,
 frank.binns@imgtec.com, 
 guoren@kernel.org, jassisinghbrar@gmail.com, jszhang@kernel.org,
 krzk+dt@kernel.org, 
 m.szyprowski@samsung.com, maarten.lankhorst@linux.intel.com,
 matt.coster@imgtec.com, 
 mripard@kernel.org, mturquette@baylibre.com, p.zabel@pengutronix.de, 
 palmer@dabbelt.com, paul.walmsley@sifive.com, robh@kernel.org, simona@ffwll.ch,
 tzimmermann@suse.de, ulf.hansson@linaro.org, wefu@redhat.com, 
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, 
 linux-riscv@lists.infradead.org, dri-devel@lists.freedesktop.org,
 linux-pm@vger.kernel.org
Subject: Re: [RFC PATCH v2 01/19] dt-bindings: clock: Add VO subsystem clocks
 and update address requirements
Message-ID: <wjet4yvtcobjaf7c4u7to6rm3ppkvmgyitp6evoqjpndtno6qg@h5xxyukph6y6>
References: <20241223125553.3527812-1-m.wilczynski@samsung.com>
 <CGME20241223125601eucas1p1d274193122638075dc65310a22616bae@eucas1p1.samsung.com>
 <20241223125553.3527812-2-m.wilczynski@samsung.com>
 <2cd0c34fbd14a0d69e689d04c2241938.sboyd@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <2cd0c34fbd14a0d69e689d04c2241938.sboyd@kernel.org>
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

On Mon, Dec 23, 2024 at 12:50:59PM -0800, Stephen Boyd wrote:
> Quoting Michal Wilczynski (2024-12-23 04:55:35)
> > The T-Head TH1520 SoC=E2=80=99s AP clock controller now needs two addre=
ss ranges
> > to manage both the Application Processor (AP) and Video Output (VO)
> > subsystem clocks. Update the device tree bindings to require two `reg`
> > entries, one for the AP clocks and one for the VO clocks.
> >=20
> > Additionally, introduce new VO subsystem clock constants in the header
> > file. These constants will be used by the driver to control VO-related
> > components such as display and graphics units.
> >=20
> > Signed-off-by: Michal Wilczynski <m.wilczynski@samsung.com>
> > ---
> [...]
> > diff --git a/Documentation/devicetree/bindings/clock/thead,th1520-clk-a=
p.yaml b/Documentation/devicetree/bindings/clock/thead,th1520-clk-ap.yaml
> > index 0129bd0ba4b3..f0df97a450ef 100644
> > --- a/Documentation/devicetree/bindings/clock/thead,th1520-clk-ap.yaml
> > +++ b/Documentation/devicetree/bindings/clock/thead,th1520-clk-ap.yaml
> > @@ -47,7 +54,9 @@ examples:
> >      #include <dt-bindings/clock/thead,th1520-clk-ap.h>
> >      clock-controller@ef010000 {
> >          compatible =3D "thead,th1520-clk-ap";
> > -        reg =3D <0xef010000 0x1000>;
> > +        reg =3D <0xef010000 0x1000>,
> > +              <0xff010000 0x1000>;
>=20
> I don't get it. Why not have two nodes and two devices? They have
> different register regions so likely they're different devices on the
> internal SoC bus. They may have the same input clks, but otherwise I
> don't see how they're the same node.

That's a good point. Aren't here simply two different clock controllers?

Best regards,
Krzysztof

