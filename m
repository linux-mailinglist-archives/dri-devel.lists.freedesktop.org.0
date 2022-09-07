Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AE37F5AFF36
	for <lists+dri-devel@lfdr.de>; Wed,  7 Sep 2022 10:37:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2AD9810E494;
	Wed,  7 Sep 2022 08:36:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew1-smtp.messagingengine.com (wnew1-smtp.messagingengine.com
 [64.147.123.26])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 96E2810E495;
 Wed,  7 Sep 2022 08:36:17 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailnew.west.internal (Postfix) with ESMTP id 4245E2B05918;
 Wed,  7 Sep 2022 04:36:14 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Wed, 07 Sep 2022 04:36:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm2; t=1662539773; x=
 1662546973; bh=rLFNfQ2mi/UOeK131VY+ISj9/vvbSVnssaatn4l2ajw=; b=J
 CjPBQQxAlWPg2C7odV5L7gB7R7vuVeN8kgJQ7iaa28d++BExy7+V5pE4aR8+ZbjH
 Ib99hn0RC3k9OqLHu3tB5qyHDikiBh4Wg8Ll4TqUB2ucnwVE3dRKoqwqC7reyBbB
 L4GAFUI4j8D2z9esUCjOH42UW2/uJiUV5Y8Cno7MjENu5Ba8Nba3V4mj2aZFcZX4
 nAn5UnMzBew5+2S1K8iGPQ90UkDmQBM1k0QF2TIMYfi0ndJXHWlAHissCJP4G8xp
 qli6HXewXKAjkfBz9TbCgyp39h9GOO6WOxWPwHxM24rQJvIqeBxPctikfMia1O1u
 4XyGAtO/EkyqK/s3hJE1Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1662539773; x=
 1662546973; bh=rLFNfQ2mi/UOeK131VY+ISj9/vvbSVnssaatn4l2ajw=; b=t
 NCRLRHxqulbbxBV03PmIAmnOKYjLg6BB3AkP51Kd9rwWBgEXLFAEKwAVVL8rEIct
 k1M0C24iHmsWnGy6e7bfU2n0uwQOzW2N7HwmpwfVip3CNRiailPddb0peJOOmNp6
 Q/2j6QGCUa/tC8N/VexznK+eeidLaQ4dMcfp9lp+VecRB2+P5SQ0kzJK6uHcDn/6
 kwbjoZoopdUPnCezeINTW1rgO167o67vbA/vhEbGOnuAiHF7fYr9HkgcoCmwqthA
 kvR/MCPW9W8lrwrK8EGxeHQsnE0aIPI9j8cYZ8ReokwLYoX4H6eo0LqKnz0EmZsA
 qI9+dWuF8bC7hGfvpX0vQ==
X-ME-Sender: <xms:_VcYY3xPXPFnJZN-wnJtxmMSr0kRGTtOMVxgttFEryuKj1LuSlL4tw>
 <xme:_VcYY_Rb_ckUNXJRr4nC2U0Q4ak94pm7DrtGsIykRFrW_TbSDaB7OU-zj-uTMAEBF
 rI9MFyrCTGthBr7Rxk>
X-ME-Received: <xmr:_VcYYxW3zfU4-h0vcRIpL4vSiZOhuMjeYGDBnESxmfLCa99wLBfFLMpyp28>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrfedttddgtdegucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvvefufffkofgjfhggtgfgsehtkeertdertdejnecuhfhrohhmpeforgig
 ihhmvgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrf
 grthhtvghrnhepueeigefghfffffeifeehudeiuedvteegueefffevgfetvdffheehkeff
 vedufeeinecuvehluhhsthgvrhfuihiivgepfeenucfrrghrrghmpehmrghilhhfrhhomh
 epmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:_VcYYxg-U71Q2w5G9kqWzUBCLE_kxC4MVisxf1YbAv_u0hVR1hB_pw>
 <xmx:_VcYY5DEnrCheau8dIKSAgNn4hogEMBIL4hEip9BMVz2bFIbYdnCbw>
 <xmx:_VcYY6Kt2W31GC47vlQ-ko8X5YaT_S6Hap2yy5dOZkxa3m6DWsfp1Q>
 <xmx:_VcYY35pKGM0K__e8jjWgvlkINmxNaorg0ufB80uZK39PeT_eXPhHLE2fpY>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 7 Sep 2022 04:36:12 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: David Airlie <airlied@linux.ie>, Samuel Holland <samuel@sholland.org>,
 Daniel Vetter <daniel@ffwll.ch>, Chen-Yu Tsai <wens@csie.org>,
 Maxime Ripard <mripard@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 Jani Nikula <jani.nikula@linux.intel.com>, Ben Skeggs <bskeggs@redhat.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Emma Anholt <emma@anholt.net>,
 =?UTF-8?q?Noralf=20Tr=C3=B8nnes?= <noralf@tronnes.org>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Lyude Paul <lyude@redhat.com>,
 Karol Herbst <kherbst@redhat.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maxime Ripard <maxime@cerno.tech>
Subject: Re: (subset) [PATCH v2 38/41] drm/sun4i: tv: Remove useless destroy
 function
Date: Wed,  7 Sep 2022 10:35:07 +0200
Message-Id: <166253967462.2236193.13167889603983513294.b4-ty@cerno.tech>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220728-rpi-analog-tv-properties-v2-38-459522d653a7@cerno.tech>
References: <20220728-rpi-analog-tv-properties-v2-0-459522d653a7@cerno.tech>
 <20220728-rpi-analog-tv-properties-v2-38-459522d653a7@cerno.tech>
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
 dri-devel@lists.freedesktop.org, linux-sunxi@lists.linux.dev,
 Hans de Goede <hdegoede@redhat.com>, Geert Uytterhoeven <geert@linux-m68k.org>,
 Mateusz Kwiatkowski <kfyatek+publicgit@gmail.com>,
 Phil Elwell <phil@raspberrypi.com>, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 29 Aug 2022 15:11:52 +0200, Maxime Ripard wrote:
> Our destroy implementation is just calling the generic helper, so let's
> just remove our function and directly use the helper.
> 
> 

Applied to drm/drm-misc (drm-misc-next).

Thanks!
Maxime
