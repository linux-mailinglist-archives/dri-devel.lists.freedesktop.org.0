Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CCA850FD5C
	for <lists+dri-devel@lfdr.de>; Tue, 26 Apr 2022 14:42:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C0D410E893;
	Tue, 26 Apr 2022 12:42:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3605510E70B
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Apr 2022 12:41:59 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id 84C275C0179;
 Tue, 26 Apr 2022 08:41:58 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute3.internal (MEProxy); Tue, 26 Apr 2022 08:41:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm3; t=1650976918; x=
 1651063318; bh=0YL8IS4TwC1iAM4PQ2QoZZik7FIYRZo2R6rs1UgeIJ4=; b=c
 ldu4Tnj/zf4EcFiLiPZCYqeznBowezjG8beeJXWbRMrFMPrxEimMqnZNQjr9xYYN
 nG9U+2+ID6nQh6HKLuxTGaBhcw++0Pv55JbbctnXff8/uR1X1pcFcWEQMzmb3GCC
 9V+KxBE1UAEv7n88CRTb8g06ZL44s16tixMoukd1UD12Ou8Nx1SYWZ/vh62+2QfT
 Wf/Jnufd5CRtXPm2cPzdzT2LJqyOzgS77/wKzPRHJPe/giuqT9q+3ABLtuAIMexz
 r9QRXLdUXSRCm03GI/O+Wk2h8GbcQoOloh8m459t816IPGrsVLyJs6pK7ODYNIrD
 5Cil7gx6+FN4ouN9GPydg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm1; t=1650976918; x=1651063318; bh=0YL8IS4TwC1iA
 M4PQ2QoZZik7FIYRZo2R6rs1UgeIJ4=; b=TLIqi4MTEtNcNZ25R2MyPftY1Ol3l
 tbZfNFObKTSlRQmsP0+BcEyMkm5Lt7jpL2DKIkEbRdTbuUE2j/ZbEmuC03ttMCGt
 hohVJvAPf7SWO2xf3TPefmLf81qS0UD602PaMOscXWz34cT4pU5f6eX/tdl0m5QJ
 bOqfyj58H55d3IDndtMuvz4XN1EBt7WVNgZAmfYoyjyQ0FatdFK2NK+iDeFOyd/k
 nke9F5huzgaY6V+TUNGhihs9FUDRKZxEDB/a4bVFAFr7EPenKUMziyjMSc0BR4DG
 LYW2jw0q9nRiAXFkuBseVSOhYp/XAJ7STTezT09Tsn8qY3RPS5eYZfp+g==
X-ME-Sender: <xms:luhnYm-lKEkvmkUimF-pr19VoSWy6jCy0zcXNWXUi-twuIQwEINOJg>
 <xme:luhnYmtGOrcoPzJyU6Ga6qgiz6kKxDxC_HgauGf8c1R7_P4ehi50zEGVQIL8AYAim
 uMYUMDegVwvcvrTgEc>
X-ME-Received: <xmr:luhnYsB1GAt0b-WGjDuRAM9HEzH2gd0oHyV_E5hgy93JD3PVDFsl6zI1TjIRql0QVfAXv_jVB-O3Mp4GdDSGUZUu3kfH4OzYBE2FMOE>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudefgdehvdcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvfevufffkffojghfgggtgfesthekredtredtjeenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeeuieeggffhffffieefheduieeuvdetgeeufeffvefgtedvffehheekffev
 udefieenucevlhhushhtvghrufhiiigvpedunecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:luhnYucOGAU6uEbv0esRl_FKf8h8tHFPAGXzFA2iudg57sDoxVDeJw>
 <xmx:luhnYrOm2RPAoERVkceXAgi2Hy__MJC75FQok-XL-sWXYDEVozXP_g>
 <xmx:luhnYoloW2c07fn04bfoOOO76zdiXKI8_YiNkY5QsoDlspPhKTeGeQ>
 <xmx:luhnYvlWBi8EaGhP5FzRAoL79wD0mI8aDoM0EHGdwP2nD_2XjejDaA>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 26 Apr 2022 08:41:57 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Chen-Yu Tsai <wens@csie.org>, Maxime Ripard <mripard@kernel.org>,
 Samuel Holland <samuel@sholland.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>
Subject: Re: (subset) [PATCH v3 08/14] sun4i/drm: sun8i: use mode_set engine
 callback
Date: Tue, 26 Apr 2022 14:41:37 +0200
Message-Id: <165097689885.514433.13038159753725975780.b4-ty@cerno.tech>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220424162633.12369-9-samuel@sholland.org>
References: <20220424162633.12369-1-samuel@sholland.org>
 <20220424162633.12369-9-samuel@sholland.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
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
Cc: devicetree@vger.kernel.org, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Rob Herring <robh+dt@kernel.org>, Maxime Ripard <maxime@cerno.tech>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-sunxi@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, 24 Apr 2022 11:26:26 -0500, Samuel Holland wrote:
> From: Jernej Skrabec <jernej.skrabec@gmail.com>
> 
> Newly introduced mode_set callback in engine structure is a much better
> place for setting mixer output size and interlace mode for the following
> reasons:
> 1. Aforementioned properties change only when mode changes, so it's
>    enough to be set only once per mode set. Currently it's done whenever
>    properties of primary plane are changed.
> 2. It's assumed that primary plane will always cover whole screen. While
>    this is true most of the time, it's not always. DE2/3 planes are
>    universal and mostly equal in functionality. There is no reason to
>    add artificial limitation to primary planes.
> 3. The current code only works for UI layers, but some mixers do not
>    have any UI layers.
> 
> [...]

Applied to drm/drm-misc (drm-misc-next).

Thanks!
Maxime
