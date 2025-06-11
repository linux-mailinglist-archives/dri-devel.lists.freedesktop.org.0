Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 91869AD5FCD
	for <lists+dri-devel@lfdr.de>; Wed, 11 Jun 2025 22:06:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9AD1B10E72C;
	Wed, 11 Jun 2025 20:06:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=jannau.net header.i=@jannau.net header.b="DbpyhmQy";
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.b="AaQCpqQv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 364 seconds by postgrey-1.36 at gabe;
 Wed, 11 Jun 2025 20:06:10 UTC
Received: from fhigh-a1-smtp.messagingengine.com
 (fhigh-a1-smtp.messagingengine.com [103.168.172.152])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BEED710E72C
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Jun 2025 20:06:10 +0000 (UTC)
Received: from phl-compute-05.internal (phl-compute-05.phl.internal
 [10.202.2.45])
 by mailfhigh.phl.internal (Postfix) with ESMTP id E70121140228;
 Wed, 11 Jun 2025 16:00:05 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
 by phl-compute-05.internal (MEProxy); Wed, 11 Jun 2025 16:00:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jannau.net; h=cc
 :cc:content-type:content-type:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:subject
 :subject:to:to; s=fm3; t=1749672005; x=1749758405; bh=h3f2xmewGr
 A2fiX+ijKnJQ24Xtnklc8qk5NEda4Ofj4=; b=DbpyhmQyaU9k/kzsc8fDWHz7Q/
 tFXOLIszNs4w1FKCJL/iKWQ32T2lUaMZkl2pXirI6tg1SOP7putL45MH/v3r003+
 5eZCpm6yMwXRmZKkjw0bYQrOxI3NmTdaLloe3ci62ATNf3xvCa2LzPnZVTIW4ucj
 OKGiivPhABrsVQ2i/UHegmZog/KGHk4gp722C1mtA22+0e3t1PXo+F/VWyuwsUBt
 I9S8YG46jVvFtcCKRHQTPAehl2tr3svetVRs3zQC+AcQk8+qvTxYXSwh8mzNVdie
 rc6bQaF2+a/yDyldnuvFXVyyh/4dchyQwxBA5sNixmzG1h19QvFC6i50WEyw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:content-type:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:subject:subject:to
 :to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
 1749672005; x=1749758405; bh=h3f2xmewGrA2fiX+ijKnJQ24Xtnklc8qk5N
 Eda4Ofj4=; b=AaQCpqQvaSmk7bfdLerLYRC3XDoNohomgNAmhV2CcfADUxqLX8F
 CMPymDI7MQR5GL8X1RkObHQsedOnLrEqCtXSGKDKtN3INYI7Uk9glbNLEmSmi9My
 vec+UE1W4QGbZcg44BGFU3rbT3S3Q/Pm3Ae9+WtN2ko/WplwFjZxEun7RXdSH/tR
 /GPD/8ZAMH/BpXbn2asIRx6HuN0hpXe60agEqRDMMW47OG7vtAmodz644bwJP4Tz
 xBWKEG4lmc18FUap5kL0WHsUEYh4XEd/fj9dss1S/TM2rwjVmrRqK2rJFbY6nnE6
 RXPnaX3kAuslqZ8K3ucsoPxtCsI7yobyeHA==
X-ME-Sender: <xms:ReBJaAcGqIsC-WnIsspIousoe8lBV7IfHHwvlbQXhz0apIfG6GN1xA>
 <xme:ReBJaCP3XlSnD-q8LQp3JJtFDXSwiG-8sbJLQIDxjX8MmCyD9Gu1FH3j9YuQaILyO
 U5YrImxWCIVePu4hZc>
X-ME-Received: <xmr:ReBJaBgEHWQDdgOwGw60AaZYDOtSmjCn7XEFzF1TLAO1G3EcCElTmpeBewvPp2eBlvSOdApXVkFir8Qd0jou5gLmIQszIxaVTuA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddugddufedtlecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
 uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
 hnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfhfgggtuggjsehttdertddttdej
 necuhfhrohhmpeflrghnnhgvucfirhhunhgruhcuoehjsehjrghnnhgruhdrnhgvtheqne
 cuggftrfgrthhtvghrnhepgfdvffevleegudejfeefheehkeehleehfefgjefffeetudeg
 tefhuedufeehfeetnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilh
 hfrhhomhepjhesjhgrnhhnrghurdhnvghtpdhnsggprhgtphhtthhopedujedpmhhouggv
 pehsmhhtphhouhhtpdhrtghpthhtohepfhhnkhhlrdhkvghrnhgvlhesghhmrghilhdrtg
 homhdprhgtphhtthhopehsvhgvnheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprghl
 hihsshgrsehrohhsvghniiifvghighdrihhopdhrtghpthhtohepnhgvrghlsehgohhmph
 grrdguvghvpdhrtghpthhtoheprghirhhlihgvugesghhmrghilhdrtghomhdprhgtphht
 thhopehsihhmohhnrgesfhhffihllhdrtghhpdhrtghpthhtohepmhgrrghrthgvnhdrlh
 grnhhkhhhorhhstheslhhinhhugidrihhnthgvlhdrtghomhdprhgtphhtthhopehmrhhi
 phgrrhgusehkvghrnhgvlhdrohhrghdprhgtphhtthhopehtiihimhhmvghrmhgrnhhnse
 hsuhhsvgdruggv
X-ME-Proxy: <xmx:ReBJaF-6C433O2_kPVtGT8tI1M-ODmgZGHNPuDzmhB1aPHrFG2uouA>
 <xmx:ReBJaMt4RwWye9hTEOOSVRJ4Shst3gl5IA3CGfLWjWOl-4qIiNn-MQ>
 <xmx:ReBJaMFs_1tSbjWqcLHBeEltbf_qsTNjbLJxByaNVXiFHpfRH5Wp6w>
 <xmx:ReBJaLNFALoQnckxNUfiTJKIhQ05vbyJckSyprsvOo-lTPBaIk80VA>
 <xmx:ReBJaNocCudOOzWtPPAj_j3L7S_yIWYfm86-yUNumJElYoIZ7chKcont>
Feedback-ID: i47b949f6:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 11 Jun 2025 16:00:03 -0400 (EDT)
Date: Wed, 11 Jun 2025 21:59:59 +0200
From: Janne Grunau <j@jannau.net>
To: fnkl.kernel@gmail.com
Cc: Sven Peter <sven@kernel.org>, Alyssa Rosenzweig <alyssa@rosenzweig.io>,
 Neal Gompa <neal@gompa.dev>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, asahi@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] arm64: dts: Add Apple SoC GPU
Message-ID: <20250611195959.GA3141695@robin.jannau.net>
References: <20250611-sgx-dt-v1-0-7a11f3885c60@gmail.com>
 <20250611-sgx-dt-v1-2-7a11f3885c60@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250611-sgx-dt-v1-2-7a11f3885c60@gmail.com>
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

On Wed, Jun 11, 2025 at 07:32:17PM +0200, Sasha Finkelstein via B4 Relay wrote:
> From: Sasha Finkelstein <fnkl.kernel@gmail.com>
> 
> Add device tree entries for GPUs in M-series SoCs
> 
> Signed-off-by: Sasha Finkelstein <fnkl.kernel@gmail.com>
> ---
>  arch/arm64/boot/dts/apple/t6000.dtsi        |  4 ++++
>  arch/arm64/boot/dts/apple/t6001.dtsi        |  4 ++++
>  arch/arm64/boot/dts/apple/t6002.dtsi        |  4 ++++
>  arch/arm64/boot/dts/apple/t600x-common.dtsi | 34 ++++++++++++++++++++++++++++++++++
>  arch/arm64/boot/dts/apple/t600x-die0.dtsi   | 28 ++++++++++++++++++++++++++++
>  arch/arm64/boot/dts/apple/t8103.dtsi        | 62 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
>  arch/arm64/boot/dts/apple/t8112.dtsi        | 62 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
>  7 files changed, 198 insertions(+)

...

> diff --git a/arch/arm64/boot/dts/apple/t600x-common.dtsi b/arch/arm64/boot/dts/apple/t600x-common.dtsi
> index 87dfc13d74171f62bf3087401918d9d41eaac560..329bd084b63e3688547166a8d0c3d9ace5d6d937 100644
> --- a/arch/arm64/boot/dts/apple/t600x-common.dtsi
> +++ b/arch/arm64/boot/dts/apple/t600x-common.dtsi
> @@ -11,6 +11,10 @@ / {
>  	#address-cells = <2>;
>  	#size-cells = <2>;
>  
> +	aliases {
> +		gpu = &gpu;
> +	};
> +
>  	cpus {
>  		#address-cells = <2>;
>  		#size-cells = <0>;
> @@ -378,4 +382,34 @@ nco_clkref: clock-ref-nco {
>  		#clock-cells = <0>;
>  		clock-output-names = "nco_ref";
>  	};
> +
> +	reserved-memory {
> +		#address-cells = <2>;
> +		#size-cells = <2>;
> +		ranges;
> +
> +		gpu_globals: globals {
> +			reg = <0x0 0 0 0>;

all memory-regions with invalid address should be disabled. iirc the
kernel and/or u-boot will try to map those which does not end well.

Janne
