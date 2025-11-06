Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 34053C3D1C8
	for <lists+dri-devel@lfdr.de>; Thu, 06 Nov 2025 19:49:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 03E7C10E9B9;
	Thu,  6 Nov 2025 18:49:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=ragnatech.se header.i=@ragnatech.se header.b="KUNi74DC";
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.b="WXiWl6hP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fout-a4-smtp.messagingengine.com
 (fout-a4-smtp.messagingengine.com [103.168.172.147])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 376E310E9B9
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Nov 2025 18:49:33 +0000 (UTC)
Received: from phl-compute-03.internal (phl-compute-03.internal [10.202.2.43])
 by mailfout.phl.internal (Postfix) with ESMTP id 7D484EC0294;
 Thu,  6 Nov 2025 13:49:32 -0500 (EST)
Received: from phl-mailfrontend-02 ([10.202.2.163])
 by phl-compute-03.internal (MEProxy); Thu, 06 Nov 2025 13:49:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
 cc:cc:content-transfer-encoding:content-type:content-type:date
 :date:from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:subject:subject:to:to; s=fm2; t=1762454972;
 x=1762541372; bh=3cDr0QtwUEUjzMnC5ZAIYokuX0/jaaVt0uuSfNP4Tkg=; b=
 KUNi74DCyt5ngXutgWBeTfW15X5i50IQYpsd9Vrq56EphDF70ILKf+RlSPj4qqRc
 IwKWBTFT4Qonn/GnvLM8VF7p6ge06mxqbNPDUD4QaYhZfbRFzjEdgvAffFFgLc0q
 cwMPq1DqzesgroJNDaD6eFJs6+4wb38vMahle8KvxDMcT3aA0Vkbu5isTSkCIw0A
 dY1sqRBV46F6bIQ4mhLQB/3VmEVdJpwI1ojmGUBZ4tJMUgm3hkLxqN933j+Mz0Gl
 RISLSOcgeEP/zYS2ghJ8cXX2xnMROf1IP/AetXmE+G9vz1988cK+/wPIkAF3Awex
 zuE1ZYZ4w1gMMtjpFVt13w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:content-type:date:date:feedback-id:feedback-id
 :from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:subject:subject:to:to:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1762454972; x=
 1762541372; bh=3cDr0QtwUEUjzMnC5ZAIYokuX0/jaaVt0uuSfNP4Tkg=; b=W
 XiWl6hPKV9aGFEI4ji8aylfXPQ1RNkHZjenLyVZlIrHZ26++U4sEb0LA5HU+5Fh2
 oJouFjsHWFUYs3fK2ArlS5/MmQvx6etI4cieqnaUv40YEHsC3bda5echfXNPmgZT
 brCJFcr+qyAzHMZBbfZZS62AOretbi1jstSy9SdJERFhcjo8bmfoTTy9VMkjM2Tc
 Wbj+5r7fBr1Jvh9sd9ausD7BzhC+Qb3ugnPSn4UX/o7Ue2VkbC+ciy4F8Fg1OG7o
 P2PtVo1gM9QXLxvtxdwHInnL+PacU/X8FNneaxR6+X71FaFis491NHeHlBE0MGlW
 hfUyLKf2bpac5FcoPbvmw==
X-ME-Sender: <xms:u-0MafPWQsTP_zlHIul8NRS1GcD8FwLFsgaw8V3IRdNJr-8n0cu5Cg>
 <xme:u-0MaStzwByYbrv69mDe4sLJZ8wzd9TeIIahxqdz4YgH4iyy_GXQ1aKYtLMWM3YbS
 0rEye1sN31DdevVv0A8RLi8eBcX2FatzisaUxvBPn8bLFPgBDLBXg>
X-ME-Received: <xmr:u-0Mac_KrOUCx1fpv1enSDegooE1cvgOzPQEIC_I-TwAMYrYdhSSUunLb_hxdYaqR5sd7aZpqsV_AK-WII4rokw_3cDvZgY>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggddukeejheegucetufdoteggodetrf
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
X-ME-Proxy: <xmx:u-0MaWHrtuPHdKc8pfye-AYKUnTIJ2Izh8K-LDrXpNb-m23a78X21Q>
 <xmx:u-0MabQdfgNsXYZbF4yIc2Kb2ICly05SxfUSWn-vMpoukJDPhQIjsQ>
 <xmx:u-0MaUsUSUm5DH8ssKhY7Bp-3gGOXjiZfsemKxKTojRC6b5W__9qEg>
 <xmx:u-0MaYAPI7FmII9cboxsgHHTWRiTIhIsi8fLfcTon8zoxRCX_rBaiA>
 <xmx:vO0MaV03Ogz1Hw4L_bCT90F8PIld3CeYI5KQiotOcy2i3JurT_isaXdo>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 6 Nov 2025 13:49:30 -0500 (EST)
Date: Thu, 6 Nov 2025 19:49:28 +0100
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
Message-ID: <20251106184928.GF3684509@ragnatech.se>
References: <20251105232737.1933437-1-niklas.soderlund+renesas@ragnatech.se>
 <20251105232737.1933437-3-niklas.soderlund+renesas@ragnatech.se>
 <c1c5a3ee-f5c9-46e4-8095-104d25d4621c@imgtec.com>
 <20251106103904.GD3684509@ragnatech.se>
 <e0373514-04ea-418c-a721-d694b816fa56@imgtec.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <e0373514-04ea-418c-a721-d694b816fa56@imgtec.com>
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

On 2025-11-06 13:04:19 +0000, Matt Coster wrote:
> Hi Niklas,
> 
> On 06/11/2025 10:39, Niklas Söderlund wrote:
> > Hi Matt,
> > 
> > Thanks for your feedback.
> > 
> > On 2025-11-06 10:19:13 +0000, Matt Coster wrote:
> >> Hi Niklas,
> >>
> >> On 05/11/2025 23:27, Niklas Söderlund wrote:
> >>> Describe Imagination Technologies PowerVR Rogue GE7800 BNVC 15.5.1.64
> >>> present in Renesas R-Car R8A779A0 V3U SoC.
> >>>
> >>> Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> >>> ---
> >>>  arch/arm64/boot/dts/renesas/r8a779a0.dtsi | 17 +++++++++++++++++
> >>>  1 file changed, 17 insertions(+)
> >>>
> >>> diff --git a/arch/arm64/boot/dts/renesas/r8a779a0.dtsi b/arch/arm64/boot/dts/renesas/r8a779a0.dtsi
> >>> index b08865841476..aa347b699340 100644
> >>> --- a/arch/arm64/boot/dts/renesas/r8a779a0.dtsi
> >>> +++ b/arch/arm64/boot/dts/renesas/r8a779a0.dtsi
> >>> @@ -338,6 +338,23 @@ cmt3: timer@e6148000 {
> >>>  			status = "disabled";
> >>>  		};
> >>>  
> >>> +		gsx: gsx@fd000000 {
> >>
> >> Why gsx? Marek's equivalent patch for r8a77965-gpu[1] used gpu (as we do
> >> for every dt so far).
> > 
> > Wops, will fix.
> > 
> >>
> >>> +			compatible = "renesas,r8a779a0-gpu",
> >>> +				     "img,img-ge7800",
> >>> +				     "img,img-rogue";
> >>> +			reg = <0 0xfd000000 0 0x40000>;
> >>> +			interrupts = <GIC_SPI 223 IRQ_TYPE_LEVEL_HIGH>;
> >>> +			clocks = <&cpg CPG_CORE R8A779A0_CLK_ZG>,
> >>> +				 <&cpg CPG_CORE R8A779A0_CLK_S3D1>,
> >>> +				 <&cpg CPG_MOD 0>;
> >>
> >> I don't have access to a TRM for V3U (it's too new apparently, despite
> >> already being obsolete), but I believe the GPU integration should be
> >> similar to the M3N in [1]. In that case, the TRM (v2.40, fig 23.3) shows
> >> S2D1 and 112 in place of S3D1 and 0 – are these definitely correct? The
> >> 0 especially feels wrong (see also 8A.2.1.2 MSTPSR1).
> > 
> > Yea the V3U doc I have is not the latest. The diagram in the GPU chapter 
> > list the same as you say here (S2D1 and 112), however the diagram seems 
> > to just be a copy-past of the Gen3 document. Looking elsewhere in the 
> > document I see:
> > 
> > - In the clock chapter the GPU is list as MSTP0 and not MSTP112.  
> >   Comparing with the Gen3 doc this looks correct so MSTP0 is good IMHO.
> 
> Sounds reasonable. Just to cross-reference that, does 3DGE appear in the
> 0-bit row of the table under the register definition of MSTPSR0? I see
> from renesas-cpg-mssr.c that these registers have moved for gen4 though,
> so this could be a blind alley.

It do appear on the 0-bit row of MSTPSR0. But on V3U the bit is called 
RGX not 3DGE as in Gen3.

> 
> A similar thought – is a new entry in r8a779a0_mod_clks (defined in
> r8a779a0-cpg-mssr.c) required? The equivalent table for r8a77965 has a
> "3dge" entry at 112.

Yes. Both for MSTP112 module clock and the ZG core clock. Patches 
posted. Will try to do the v2 of that series at the same time as the 
fixes for this one.

https://lore.kernel.org/linux-renesas-soc/20251105231815.1927239-1-niklas.soderlund%2Brenesas@ragnatech.se/

> 
> > 
> > - The V3U don't have a S2D1 clock... but the GPU chapter lists it in the 
> >   (assumed) copy-pasted diagram...  What I did was track which clocks 
> >   where S2D1 on Gen3 and compared that to what those IP where using on 
> >   V3U. The overlap was the DU and that uses S3D1 on V3U so I just 
> >   followed that.
> 
> There's a top-level clock diagram near the top of the CPG chapter in the
> TRM I have (fig 8.1d for M3N) that annotates S2D1 as being an AXI-bus
> clock.

I see the M3-N S2D1 clock in the Gen3 doc.

> Is there a similar annotation on S3D1 for V3U in your TRM? If
> not, I'm happy to just follow your logic and ack this patch :)

I do not see the S3D1 in the same diagram for V3U, only S3. I do however 
see S3D1 a few pages below in the table below the diagram. In the Gen3 
doc that would be the equivalent of table Table 8.2d.

> 
> Cheers,
> Matt
> 
> > 
> >>
> >>> +			clock-names = "core", "mem", "sys";
> >>> +			power-domains = <&sysc R8A779A0_PD_3DG_A>,
> >>> +					<&sysc R8A779A0_PD_3DG_B>;
> >>> +			power-domain-names = "a", "b";
> >>> +			resets = <&cpg 0>;
> >>
> >> Same 0 concern as above.
> >>
> >> Cheers,
> >> Matt
> >>
> >> [1]: https://lore.kernel.org/r/20251104135716.12497-3-marek.vasut+renesas@mailbox.org/ 
> >>
> >>> +			status = "disabled";
> >>> +		};
> >>> +
> >>>  		cpg: clock-controller@e6150000 {
> >>>  			compatible = "renesas,r8a779a0-cpg-mssr";
> >>>  			reg = <0 0xe6150000 0 0x4000>;
> >>
> >> -- 
> >> Matt Coster
> >> E: matt.coster@imgtec.com
> 
> -- 
> Matt Coster
> E: matt.coster@imgtec.com




-- 
Kind Regards,
Niklas Söderlund
