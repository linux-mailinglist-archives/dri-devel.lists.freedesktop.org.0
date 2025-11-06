Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E97CC3A4F5
	for <lists+dri-devel@lfdr.de>; Thu, 06 Nov 2025 11:39:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 247BA10E88A;
	Thu,  6 Nov 2025 10:39:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=ragnatech.se header.i=@ragnatech.se header.b="GlblFFFN";
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.b="N4aZT9ms";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fhigh-a2-smtp.messagingengine.com
 (fhigh-a2-smtp.messagingengine.com [103.168.172.153])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 27A7710E88A
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Nov 2025 10:39:09 +0000 (UTC)
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
 by mailfhigh.phl.internal (Postfix) with ESMTP id 719D11400062;
 Thu,  6 Nov 2025 05:39:08 -0500 (EST)
Received: from phl-mailfrontend-02 ([10.202.2.163])
 by phl-compute-02.internal (MEProxy); Thu, 06 Nov 2025 05:39:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
 cc:cc:content-transfer-encoding:content-type:content-type:date
 :date:from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:subject:subject:to:to; s=fm2; t=1762425548;
 x=1762511948; bh=sVaT6BxcmRmQAxRH2Rb7XH+rkD2/CxuB1igaRL7bLiA=; b=
 GlblFFFN4XyuWNN8F0HBrlZ9f1vM9upJE1hhfhrDTRAfSGIY/u0hl1LZ/jm+86Ir
 D0m6chOLHwiyTKdLhct5OIyVfuiy2uojeNUeA43Kb/o7c8I1cIjDy2SSdLPUoPLe
 T59Qtp80DhPFiPWgupYm6oXRHn0Jon2rLnW6WFVpah3D8r0tdGVg6nMPYx3m48W5
 dLgK6g1n82w82V9d/BGpDNfrjhLYr0se5bdoglH1ia9EisoKCZOMfXpphqzBQzQJ
 lRJRRFv4ve/rK/+ZGcCnOTKzFNANsSOdSwDkz+sfRjsM9+uFS5G/p5J8XBBobRoM
 j9APnl45RSZjD0/aw/HZHw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:content-type:date:date:feedback-id:feedback-id
 :from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:subject:subject:to:to:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1762425548; x=
 1762511948; bh=sVaT6BxcmRmQAxRH2Rb7XH+rkD2/CxuB1igaRL7bLiA=; b=N
 4aZT9msMX2/jI8oZCA4zfkYTHWn0tRe6xfGTwZkZF0qSbaZOo2bH2oQRwrMvOSQ9
 W6VRqH+KsbwLbDnwWQq7VhNWZe/hhO2hwmdvfcRSt93FL1IfWxwNvqCYPqmPv7xd
 YZKib8O2/TGZzdVEgttkfJZlpDDDv0w28bTz5JKm9B22OAFEDW+ichyRByUoiNr9
 1c6c40ZRrLBYRoOdGzq/miHOL4bGSM7nfL9Dy9kaGYKA1L6/pooQgFobIy9+d9sQ
 OvVjTHWA6S04+84WwoZ8tkI8iZzU8MuIEaXkPY1pYIRKeZ0GnztmsF1bcd4ZNqs/
 3ZMscrhcMgt5ltGw6xLJg==
X-ME-Sender: <xms:y3oMaf_JrRIK6tnN5pGC9nOE2cjwEAjOJfIF_j3-RRq_Q2Krx68Kvg>
 <xme:y3oMaUe3tg3aPHa-a5l_HfkwC04fGdQ4cgdz1IoIikiaCQxc5s9O4c8ZR5aoPQj4l
 pORqu_SVnagHvwffMeDPLAkk-enPriVU4BEpVEsdB2KnKM46xdYwEs>
X-ME-Received: <xmr:y3oMabvyiNFCNyFlxxQN7Hppm5J0MN3Q5XxtJ0_QtnMgh3BhdWbYoPWzBr2Qbb0EjuzLy1ysW5puDMdaor56NgpG7XzJzCw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggddukeeiheeiucetufdoteggodetrf
 dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
 rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
 gurhepfffhvfevuffkfhggtggugfgjsehtkeertddttdejnecuhfhrohhmpefpihhklhgr
 shcuufpnuggvrhhluhhnugcuoehnihhklhgrshdrshhouggvrhhluhhnugdorhgvnhgvsh
 grshesrhgrghhnrghtvggthhdrshgvqeenucggtffrrghtthgvrhhnpeffkefgudekgefh
 hfejtedviedtgeetieekffeiudfhgeevteejvedtffdvkefftdenucffohhmrghinhepkh
 gvrhhnvghlrdhorhhgnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghi
 lhhfrhhomhepnhhikhhlrghsrdhsohguvghrlhhunhguodhrvghnvghsrghssehrrghgnh
 grthgvtghhrdhsvgdpnhgspghrtghpthhtohepudekpdhmohguvgepshhmthhpohhuthdp
 rhgtphhtthhopehmrghtthdrtghoshhtvghrsehimhhgthgvtgdrtghomhdprhgtphhtth
 hopehmrghrvghkrdhvrghsuhhtodhrvghnvghsrghssehmrghilhgsohigrdhorhhgpdhr
 tghpthhtohepghgvvghrthdorhgvnhgvshgrshesghhlihguvghrrdgsvgdprhgtphhtth
 hopegtohhnohhrodgutheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprghirhhlihgv
 ugesghhmrghilhdrtghomhdprhgtphhtthhopehfrhgrnhhkrdgsihhnnhhssehimhhgth
 gvtgdrtghomhdprhgtphhtthhopegrlhgvshhsihhordgsvghllhgvsehimhhgthgvtgdr
 tghomhdprhgtphhtthhopegrlhgvgigrnhgurhhurdgurgguuhesihhmghhtvggtrdgtoh
 hmpdhrtghpthhtohepkhhriihkodgutheskhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:y3oMad3y4ZEPovz4012ZBNqWwxAP0dhfkPNtNLIQNyksXDDESFiVGw>
 <xmx:y3oMaYC12UKhjuSip_dSjHjQKdw9bthy4YElmv0riOExyVBkHmR4dw>
 <xmx:y3oMaSf-uWWV7SrPqrcWXCghnIuOY8fOB7N7X4nq7soiwRwukAYa4Q>
 <xmx:y3oMaSxKIp5iD5D2RtRqMTycFGnjMaQVSLB40XwBNoaUyqIqe3KRuA>
 <xmx:zHoMaYkizoIbA1cELZbHYxPRSZAFJTSJD2GuiKDS2HudPvQEptGhVjjt>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 6 Nov 2025 05:39:07 -0500 (EST)
Date: Thu, 6 Nov 2025 11:39:04 +0100
From: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Matt Coster <Matt.Coster@imgtec.com>
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Conor Dooley <conor+dt@kernel.org>, David Airlie <airlied@gmail.com>,
 Frank Binns <Frank.Binns@imgtec.com>,
 Alessio Belle <Alessio.Belle@imgtec.com>,
 Alexandru Dadu <Alexandru.Dadu@imgtec.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Magnus Damm <magnus.damm@gmail.com>,
 Maxime Ripard <mripard@kernel.org>, Rob Herring <robh@kernel.org>,
 Simona Vetter <simona@ffwll.ch>, Thomas Zimmermann <tzimmermann@suse.de>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCH 2/2] arm64: dts: renesas: r8a779a0: Add GE7800 GPU node
Message-ID: <20251106103904.GD3684509@ragnatech.se>
References: <20251105232737.1933437-1-niklas.soderlund+renesas@ragnatech.se>
 <20251105232737.1933437-3-niklas.soderlund+renesas@ragnatech.se>
 <c1c5a3ee-f5c9-46e4-8095-104d25d4621c@imgtec.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <c1c5a3ee-f5c9-46e4-8095-104d25d4621c@imgtec.com>
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

Hi Matt,

Thanks for your feedback.

On 2025-11-06 10:19:13 +0000, Matt Coster wrote:
> Hi Niklas,
> 
> On 05/11/2025 23:27, Niklas Söderlund wrote:
> > Describe Imagination Technologies PowerVR Rogue GE7800 BNVC 15.5.1.64
> > present in Renesas R-Car R8A779A0 V3U SoC.
> > 
> > Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> > ---
> >  arch/arm64/boot/dts/renesas/r8a779a0.dtsi | 17 +++++++++++++++++
> >  1 file changed, 17 insertions(+)
> > 
> > diff --git a/arch/arm64/boot/dts/renesas/r8a779a0.dtsi b/arch/arm64/boot/dts/renesas/r8a779a0.dtsi
> > index b08865841476..aa347b699340 100644
> > --- a/arch/arm64/boot/dts/renesas/r8a779a0.dtsi
> > +++ b/arch/arm64/boot/dts/renesas/r8a779a0.dtsi
> > @@ -338,6 +338,23 @@ cmt3: timer@e6148000 {
> >  			status = "disabled";
> >  		};
> >  
> > +		gsx: gsx@fd000000 {
> 
> Why gsx? Marek's equivalent patch for r8a77965-gpu[1] used gpu (as we do
> for every dt so far).

Wops, will fix.

> 
> > +			compatible = "renesas,r8a779a0-gpu",
> > +				     "img,img-ge7800",
> > +				     "img,img-rogue";
> > +			reg = <0 0xfd000000 0 0x40000>;
> > +			interrupts = <GIC_SPI 223 IRQ_TYPE_LEVEL_HIGH>;
> > +			clocks = <&cpg CPG_CORE R8A779A0_CLK_ZG>,
> > +				 <&cpg CPG_CORE R8A779A0_CLK_S3D1>,
> > +				 <&cpg CPG_MOD 0>;
> 
> I don't have access to a TRM for V3U (it's too new apparently, despite
> already being obsolete), but I believe the GPU integration should be
> similar to the M3N in [1]. In that case, the TRM (v2.40, fig 23.3) shows
> S2D1 and 112 in place of S3D1 and 0 – are these definitely correct? The
> 0 especially feels wrong (see also 8A.2.1.2 MSTPSR1).

Yea the V3U doc I have is not the latest. The diagram in the GPU chapter 
list the same as you say here (S2D1 and 112), however the diagram seems 
to just be a copy-past of the Gen3 document. Looking elsewhere in the 
document I see:

- In the clock chapter the GPU is list as MSTP0 and not MSTP112.  
  Comparing with the Gen3 doc this looks correct so MSTP0 is good IMHO.

- The V3U don't have a S2D1 clock... but the GPU chapter lists it in the 
  (assumed) copy-pasted diagram...  What I did was track which clocks 
  where S2D1 on Gen3 and compared that to what those IP where using on 
  V3U. The overlap was the DU and that uses S3D1 on V3U so I just 
  followed that.

> 
> > +			clock-names = "core", "mem", "sys";
> > +			power-domains = <&sysc R8A779A0_PD_3DG_A>,
> > +					<&sysc R8A779A0_PD_3DG_B>;
> > +			power-domain-names = "a", "b";
> > +			resets = <&cpg 0>;
> 
> Same 0 concern as above.
> 
> Cheers,
> Matt
> 
> [1]: https://lore.kernel.org/r/20251104135716.12497-3-marek.vasut+renesas@mailbox.org/
> 
> > +			status = "disabled";
> > +		};
> > +
> >  		cpg: clock-controller@e6150000 {
> >  			compatible = "renesas,r8a779a0-cpg-mssr";
> >  			reg = <0 0xe6150000 0 0x4000>;
> 
> -- 
> Matt Coster
> E: matt.coster@imgtec.com




-- 
Kind Regards,
Niklas Söderlund
