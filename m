Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A76B05A4D66
	for <lists+dri-devel@lfdr.de>; Mon, 29 Aug 2022 15:16:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF86B10F1C2;
	Mon, 29 Aug 2022 13:16:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew2-smtp.messagingengine.com (wnew2-smtp.messagingengine.com
 [64.147.123.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5115410F1AF
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Aug 2022 13:16:10 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.west.internal (Postfix) with ESMTP id D39432B06042;
 Mon, 29 Aug 2022 09:16:06 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Mon, 29 Aug 2022 09:16:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm3; t=1661778966; x=
 1661786166; bh=d7clZxO7I3eO98KnGdsmo+IO+/vbylIbR6+bBaeoXdw=; b=r
 Yebl8gxFwJmJvRJ+TAQrxa2mZzy9LMyCcQTFVma7R7SzwQUA66DgZlZqNF25NHMj
 L3PiguJJmWk8wMWPJ1rM6MNUecQMSEm8fy5qIcNGnvsQhfX5nnCLlfSsybShX22l
 vWfsR3ngGRm2NpwRJf+fA8PtwEDdW+JA4I2HLHHklLMvA6HW/rslBVjucJAuZe18
 Y7lOxDLgPrHoIIwq3M4ps0KEl4jSUIzDH64039T3e7GEf0A0tnI5OO3r2kWHLdaY
 GSMnl2FhqCPnwbWJ/qkOndrSMZEz8Q7LgVKXGF5kKT3COz6R03cpb1ltx0fZQ5Db
 2SJd4bUnl0g5wsdgSpfgw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1661778966; x=
 1661786166; bh=d7clZxO7I3eO98KnGdsmo+IO+/vbylIbR6+bBaeoXdw=; b=z
 66An1LQGGHpif1xWysF2LJUXkLrlRKOYi0c6475Wq2Y1GRdr8iAr9H+sSmJBqPq9
 JRSoTMwOoMgnvHOUyRp6Fus77Y1K/RL6NFw4O5Wv9SnON1KwCmhZqXz+f5gVTtnk
 zbtCbk0Jrnki19Vf3MDFReoWtVC3dxBrmQYpYOFW8xJxYkXBO6safcX1qOSi/Hkp
 YLHtEIEYFU71z2yNTAI4AB3A/ppZ3O799MnWm27eWTsj8xsIvRDE0JOP2aVDYpP/
 rJ+aD0Cx7a8IYoKfWYMaLcEVu+KFdNY96I0ZwoUsXkTCnIGbRbsz/tOn+EOvwEJ/
 GdLBJtpTW0Eb1I4V2hEOg==
X-ME-Sender: <xms:FrwMY1gdM8t6C4cbVzbHwOZdjwpBaStfT6KO3rNFOvoZebm9cTLr_A>
 <xme:FrwMY6CqNhbTcEkyfkhMh_mI-PWcrzOydSGoIvy3gqEC220tB6dfxqxKItKDH4NRW
 riQ06emzA3arIOV5BU>
X-ME-Received: <xmr:FrwMY1G-cpWUh5f8ugQhOhAmjWQXTl_rt63Jywqedg41tkCn9Lk2Z1HFd_TG>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrvdekuddgieefucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvvefufffkofgjfhggtgfogfesthhqredtredtjeenucfhrhhomhepofgr
 gihimhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtf
 frrghtthgvrhhnpeefiedvfefggffgffehveejieffuddtgffhjefggeetieduvdeileet
 lefgveegtdenucevlhhushhtvghrufhiiigvpeeinecurfgrrhgrmhepmhgrihhlfhhroh
 hmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:FrwMY6Q6Z67PJLSAC2093kB412p3PL0XXOayWFDNEqe0cdCcGZnfDA>
 <xmx:FrwMYywUF4S2zmhSI5dctw2uX3nhR6irH-PvXZ61qMoCbakm908oXg>
 <xmx:FrwMYw67aTtbepsh0oeHW8E9CWlS4roX-lp4iu0IaBZWNWJKnPTwVA>
 <xmx:FrwMY8q49ofEqsOCAHBVLEoVGA43s74JpT8hueTbl8yQCqBZRI4zeflGBtA>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 29 Aug 2022 09:16:05 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Maxime Ripard <mripard@kernel.org>, Ben Skeggs <bskeggs@redhat.com>,
 David Airlie <airlied@linux.ie>, Chen-Yu Tsai <wens@csie.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Jani Nikula <jani.nikula@linux.intel.com>, Lyude Paul <lyude@redhat.com>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>, Karol Herbst <kherbst@redhat.com>,
 =?UTF-8?q?Noralf=20Tr=C3=B8nnes?= <noralf@tronnes.org>,
 Emma Anholt <emma@anholt.net>, Daniel Vetter <daniel@ffwll.ch>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Subject: [PATCH v2 37/41] drm/sun4i: tv: Remove useless function
Date: Mon, 29 Aug 2022 15:11:51 +0200
Message-Id: <20220728-rpi-analog-tv-properties-v2-37-459522d653a7@cerno.tech>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220728-rpi-analog-tv-properties-v2-0-459522d653a7@cerno.tech>
References: <20220728-rpi-analog-tv-properties-v2-0-459522d653a7@cerno.tech>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Mailer: b4 0.10.0-dev-65ba7
X-Developer-Signature: v=1; a=openpgp-sha256; l=761; i=maxime@cerno.tech;
 h=from:subject:message-id; bh=azl4tdJEs9Q+qPax/2oZwteOATZIm73l0YTHGZIqrtQ=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDMk8uxQzNPYcqlDddEq8sk43uLttZt9+fX95AwGNtYZ8XFqf
 DH50lLIwiHExyIopssQImy+JOzXrdScb3zyYOaxMIEMYuDgFYCJVbYwMM98mf2BaJX7jtZ+YdP+7NW
 arv9/IWJm0yetM6Pb91oFVkQz/CzfcT/zIZWG291nTivZcq/Pzb/jf8hWXykjambbzUaoRGwA=
X-Developer-Key: i=maxime@cerno.tech; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D
Content-Transfer-Encoding: quoted-printable
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
 Maxime Ripard <maxime@cerno.tech>,
 Mateusz Kwiatkowski <kfyatek+publicgit@gmail.com>,
 Phil Elwell <phil@raspberrypi.com>, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The drm_connector_to_sun4i_tv() function isn't used anywhere in the driver,=
=0D
so let's remove it.=0D
=0D
Signed-off-by: Maxime Ripard <maxime@cerno.tech>=0D
=0D
diff --git a/drivers/gpu/drm/sun4i/sun4i_tv.c b/drivers/gpu/drm/sun4i/sun4i=
_tv.c=0D
index 3944da9a3c34..52bbba8f19dc 100644=0D
--- a/drivers/gpu/drm/sun4i/sun4i_tv.c=0D
+++ b/drivers/gpu/drm/sun4i/sun4i_tv.c=0D
@@ -275,13 +275,6 @@ drm_encoder_to_sun4i_tv(struct drm_encoder *encoder)=0D
 			    encoder);=0D
 }=0D
 =0D
-static inline struct sun4i_tv *=0D
-drm_connector_to_sun4i_tv(struct drm_connector *connector)=0D
-{=0D
-	return container_of(connector, struct sun4i_tv,=0D
-			    connector);=0D
-}=0D
-=0D
 /*=0D
  * FIXME: If only the drm_display_mode private field was usable, this=0D
  * could go away...=0D
=0D
-- =0D
b4 0.10.0-dev-65ba7=0D
