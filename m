Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D38DF5A4D88
	for <lists+dri-devel@lfdr.de>; Mon, 29 Aug 2022 15:18:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 73DCA10F262;
	Mon, 29 Aug 2022 13:18:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew2-smtp.messagingengine.com (wnew2-smtp.messagingengine.com
 [64.147.123.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4888E10F1C1
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Aug 2022 13:16:29 +0000 (UTC)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailnew.west.internal (Postfix) with ESMTP id 1F6682B0608F;
 Mon, 29 Aug 2022 09:16:26 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute1.internal (MEProxy); Mon, 29 Aug 2022 09:16:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm3; t=1661778985; x=
 1661786185; bh=lN7bNSOCMzy68afbhfiVt1hAVLOOacA7oPD2TeryXSs=; b=g
 aeOBAyFL3r2QIe8OCH1iFRgWnMODA4K0311mTQusoNqJTsW7pyd4XnwmegAiCpt9
 +En8iXRtrSPElJv91UWRtxnyPn/aYJldPEebV0n95tUpwahYP6UyLB+LTesuYSeg
 Gbt4eFuQyw+NwzT2V6cB1qsCx0Y5yM78mV333wM/GHS5OjKxRw+dfph989WqMoR+
 QgiGEf4sCj5YmcKNBvCAKvJLRD05ae0jQ27z5Exs4qJrN2jm07+5dIuL+zBCQCmW
 KB/CrUcgOdohHUrYImGxpXLotbR4wJaev5JNNlba7zadu67EqptVuogoxmSiLN1o
 4L2wXaX/NLI+l7KxLpqfw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1661778985; x=
 1661786185; bh=lN7bNSOCMzy68afbhfiVt1hAVLOOacA7oPD2TeryXSs=; b=T
 NGs8CcQ9zOUdtTiQPSqj65UfjOy2DqmcoCtDZ+24PqWm9TtsDUYyWT9vrrwMliod
 MjooPslBJABqRez7Dy7PwgG5Aflf0XXeZ+m1qjiQycHYbjfRQc3UJhyv1SQl+j9L
 j9xQuhKPPBMlXGPbJZJuZNqtPiMNcqA1tPSRNSTyiotKgD/PK9BNTKbHXxk+hdyT
 XnLEVDrk+d8Ea2wtXa4vTAoIxOI75qlZ/M6t8xrMvyVcwgePO2L5SC4e05xm+sMo
 UvJy0VSVVvzB0BXjB6vUjsBj8zbnYVXrfTiEqp+WKms66VJPXNDuuib4fowtrrGY
 8JRPKVGvPMsha+caC4cwQ==
X-ME-Sender: <xms:KbwMYydCVFbmRfWurdOP39J-E1nqQoTpfWcVbGMsBK9aDfXX-voE1A>
 <xme:KbwMY8NQOYt-RhB9EaABtO35TJU4DT28ECC0ji-4Fayf-yyDYfaMfhB_b4PH5AtSJ
 TiYWPFV-Bddl8Wz4aM>
X-ME-Received: <xmr:KbwMYzjtGkuh2sFOwV43cl1use8afEixHCyuS_pw-KNORjq5KI1JRXYXvfzH>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrvdekuddgieegucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvvefufffkofgjfhggtgfogfesthhqredtredtjeenucfhrhhomhepofgr
 gihimhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtf
 frrghtthgvrhhnpeefiedvfefggffgffehveejieffuddtgffhjefggeetieduvdeileet
 lefgveegtdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhroh
 hmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:KbwMY_-8GrCU0SaHRljZtnJ5IgtOgva8MBhLMe5_IkmdduUQvFb6ig>
 <xmx:KbwMY-tWh5oCgXzpqfMjnrRaqBc1L380_KpNimftfkhr8Jphf5SpLA>
 <xmx:KbwMY2HAQc9-JBMR_krLYdAZXgtByZlUd0qz7A95GnoqPs6tWij7IQ>
 <xmx:KbwMY1WHUMQY6dAP14j79txCnoECNibXa2I2snItS-jwL8uOqKUs2up1rTU>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 29 Aug 2022 09:16:24 -0400 (EDT)
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
Subject: [PATCH v2 40/41] drm/sun4i: tv: Add missing reset assertion
Date: Mon, 29 Aug 2022 15:11:54 +0200
Message-Id: <20220728-rpi-analog-tv-properties-v2-40-459522d653a7@cerno.tech>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220728-rpi-analog-tv-properties-v2-0-459522d653a7@cerno.tech>
References: <20220728-rpi-analog-tv-properties-v2-0-459522d653a7@cerno.tech>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Mailer: b4 0.10.0-dev-65ba7
X-Developer-Signature: v=1; a=openpgp-sha256; l=815; i=maxime@cerno.tech;
 h=from:subject:message-id; bh=r7LcpFs7qXcJi8XUdtLYEk3itduP1hTLzq2Bc5XOe7Q=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDMk8uxR5qjSTzZ5o7LpVE7xN9dyhQ549wbl2azjmXeU0dlrf
 906/o5SFQYyLQVZMkSVG2HxJ3KlZrzvZ+ObBzGFlAhnCwMUpABOZpcDIcE9cdX7DrmXcxb/Y7f67c/
 IXqTOzfJ62UcRzrd/Wc9/NHjH8s779wy7khmruMYsYS3e5B3z58Ssabv2u33eslvGSVa0bAwA=
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

The reset line is deasserted at bind, and asserted if we ever encounter an=
=0D
error there. However, it's never asserted in unbind which will lead to a=0D
resource unbalance.=0D
=0D
Signed-off-by: Maxime Ripard <maxime@cerno.tech>=0D
Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>=0D
=0D
diff --git a/drivers/gpu/drm/sun4i/sun4i_tv.c b/drivers/gpu/drm/sun4i/sun4i=
_tv.c=0D
index ad6a3739bfa9..74ff5ad6a8b9 100644=0D
--- a/drivers/gpu/drm/sun4i/sun4i_tv.c=0D
+++ b/drivers/gpu/drm/sun4i/sun4i_tv.c=0D
@@ -605,6 +605,7 @@ static void sun4i_tv_unbind(struct device *dev, struct =
device *master,=0D
 	drm_connector_cleanup(&tv->connector);=0D
 	drm_encoder_cleanup(&tv->encoder);=0D
 	clk_disable_unprepare(tv->clk);=0D
+	reset_control_assert(tv->reset);=0D
 }=0D
 =0D
 static const struct component_ops sun4i_tv_ops =3D {=0D
=0D
-- =0D
b4 0.10.0-dev-65ba7=0D
