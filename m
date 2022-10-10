Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E17D5F9E75
	for <lists+dri-devel@lfdr.de>; Mon, 10 Oct 2022 14:11:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A4D310E6E0;
	Mon, 10 Oct 2022 12:11:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew2-smtp.messagingengine.com (wnew2-smtp.messagingengine.com
 [64.147.123.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D6AB310E4D4;
 Mon, 10 Oct 2022 12:11:22 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.west.internal (Postfix) with ESMTP id E056E2B06398;
 Mon, 10 Oct 2022 08:11:17 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Mon, 10 Oct 2022 08:11:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm3; t=1665403877; x=
 1665411077; bh=KfLeLBND2U5FFYxKmdsidgYpBYJw4BBLL4Hxf7Bm3DM=; b=d
 Jq8m6lRBijyH2Gu/bWNT9bxFI7SqXKfl2Yz5kTaIr8sPqDntS8nRM55a0wQTgSJE
 3gi7RdAlQNGTXJgd6IwdDqwkp+UV1+FJUQMOWB1IdhoewoEIjuDnNWeU5Ci4Udq3
 cXYXSgo8tSBU0MSLpuK5lGgNwo+fGy/NGS3s0WyMW2CI391wDBQjnxt7SejRIJTM
 Y+7VkmLu4YIwLBPeDoIHa2qYW/7UioKHpZ+rgxNaOyYF2ad7avdyezbV1ykjhUfl
 2zspX7UIKboBpanxXzeX+I+py6FsaMBgib2QzG+7AcAdEJolOfAbPSjQAL6/nsqo
 on3SZPWU18Bps+5zcFb/A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1665403877; x=
 1665411077; bh=KfLeLBND2U5FFYxKmdsidgYpBYJw4BBLL4Hxf7Bm3DM=; b=J
 spHYM7cLibIjljKg226jqyqFimkMlG7ZN+FImsPYCm4mwz5Rt2Ku1bkc9riVyiJu
 tB1t6GQR57keENvlyPyXRG3Fh+ZPGoSJgWbSkbpPdMjqJ75HvGVc6FaIaT/SOvUy
 J2ZCTU4gMCCx1ieKbM3hW6VT48aGAtGIxPJ67fyFsHfOJAz0Lc1RDnGDfD0SHx0y
 6chGYwLPsrN5L/DlL9EKtQvhZtpEdY022BRkS3C9zjoARcBOMnkMmne/HkFz9iin
 mQdNMJXet/tZF7U+/H9vbkOA0JJ7Mi2ySGVGy062NIQTjFdl4H1EPPe2gziUSXDr
 NHG0vpttDlxrRBZ7ti9Sg==
X-ME-Sender: <xms:5QtEY1vGNmoWCcil_vvAC4kIY41dVgqD0UxFb4mGWDVQtbdCPlFmQA>
 <xme:5QtEY-dSYn2aqx9DHw_BqMbL5tLMnBA0Zbfy4IQ9nTyu8IcjOZ9FYoM8QQgT9pELh
 WTwm_Lxr9X4KHNGQb8>
X-ME-Received: <xmr:5QtEY4wurW-sshj7-u-RBo_M7OnsOuOlXq3-eDOGeEUSTQxQ_sNQi--0k8Ub>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrfeejgedggeefucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvvefufffkofgjfhggtgfgsehtkeertdertdejnecuhfhrohhmpeforgig
 ihhmvgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrf
 grthhtvghrnhepueeigefghfffffeifeehudeiuedvteegueefffevgfetvdffheehkeff
 vedufeeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
 epmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:5QtEY8MFgron5R1f_odB6VoRLtT5JXnOUrJOLL5hV0M-Qlc-TDf54g>
 <xmx:5QtEY19qkeDG5YAd9jl1ZNDZycshIGepxAYuM_k0nKSWfkpGfbIOrQ>
 <xmx:5QtEY8VA9jXJ7T7C6YLlM5wnwRvcDcA9pRYHyr-JKWOdsEWOscBxtw>
 <xmx:5QtEY9ZJTEGB3BouwwzvaA7Y9wir_JLe6aSh1T7PQj6YBrgYPVQ7AnZfwVw>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 10 Oct 2022 08:11:16 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Karol Herbst <kherbst@redhat.com>, Samuel Holland <samuel@sholland.org>,
 Ben Skeggs <bskeggs@redhat.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Daniel Vetter <daniel@ffwll.ch>, Chen-Yu Tsai <wens@csie.org>,
 David Airlie <airlied@linux.ie>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Lyude Paul <lyude@redhat.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 Emma Anholt <emma@anholt.net>, Maxime Ripard <maxime@cerno.tech>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Subject: Re: (subset) [PATCH v4 12/30] drm/modes: Only consider bpp and
 refresh before options
Date: Mon, 10 Oct 2022 14:10:40 +0200
Message-Id: <166540374295.183315.12011253963127991638.b4-ty@cerno.tech>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220728-rpi-analog-tv-properties-v4-12-60d38873f782@cerno.tech>
References: <20220728-rpi-analog-tv-properties-v4-0-60d38873f782@cerno.tech>
 <20220728-rpi-analog-tv-properties-v4-12-60d38873f782@cerno.tech>
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
Cc: Dom Cobley <dom@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>, nouveau@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Mateusz Kwiatkowski <kfyatek+publicgit@gmail.com>,
 Hans de Goede <hdegoede@redhat.com>,
 =?UTF-8?q?Noralf=20Tr=EF=BF=BD=EF=BF=BDnnes?= <noralf@tronnes.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>, linux-sunxi@lists.linux.dev,
 Phil Elwell <phil@raspberrypi.com>, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 29 Sep 2022 18:31:06 +0200, Maxime Ripard wrote:
> Some video= options might have a value that contains a dash. However, the
> command line parsing mode considers all dashes as the separator between the
> mode and the bpp count.
> 
> Let's rework the parsing code a bit to only consider a dash as the bpp
> separator if it before a comma, the options separator.
> 
> [...]

Applied to drm/drm-misc (drm-misc-next).

Thanks!
Maxime
