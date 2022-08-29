Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D10235A4D85
	for <lists+dri-devel@lfdr.de>; Mon, 29 Aug 2022 15:18:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F1AD610F251;
	Mon, 29 Aug 2022 13:18:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew2-smtp.messagingengine.com (wnew2-smtp.messagingengine.com
 [64.147.123.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A37D210F1BD
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Aug 2022 13:16:22 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailnew.west.internal (Postfix) with ESMTP id 7C3232B0608B;
 Mon, 29 Aug 2022 09:16:19 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Mon, 29 Aug 2022 09:16:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm3; t=1661778979; x=
 1661786179; bh=2pxPB8e3CUm+60/d+Ajs5F0Dd4Kd+gAOE9TGfZOvPi0=; b=s
 IFzr/KwlpJ8OIhfGNGLHBQZSFbYXA/GT17RVJbxwYyhlHyMA12oQDgfug6L0m9aD
 X0IDX/9OOlU5kSeAcMawyeLAQKO0XIgBCsm1ZFdVniAQWCHANKzHtpBNo3cAZww0
 5MicvOD/rEkF3wNV/UB9O7nKs1xzJY9wLXTV/GogF93gLyWvVWJi4ngfOWMSnWh5
 CwygGs605KWyBc1wCllQfe3TbNN6uVtsY9HtvpnE3O5Y/Zoag1prGyRPCSVL3nWo
 0Gabzdw9tf46rgj4C8mlK+bWWDnD7Q6ujmZDRNy1TSiqfDM1t95jNN/epM1ns6UZ
 Ph43mk9o9BiUEA0LYSdaw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1661778979; x=
 1661786179; bh=2pxPB8e3CUm+60/d+Ajs5F0Dd4Kd+gAOE9TGfZOvPi0=; b=K
 amRuNAMz7RG67NNqG11/jS2FJetLjnF/YCqhACRhauGq6fVhcyl24R02JFViBwod
 kN9W9BEWH6Qnz/aarJGl7Btr7qRERvCqBl8TbrtR4A8V5KBA3t0837rb60apLAw9
 xd7KmfwJlAIc76trDkH6gtlXNNURuAyRxS2nGYkKq8KXkIKHXNAyHKlfdtXQ+y6K
 HdJxeD4NiKCPAa6F9109Yq58K2kJCaWeFzj4dpW0sCMB9T281wJzF4SXFOh+wCG8
 jJmAZsevO8Fyfym2peyHMM6WQdbYnl4/4zdiM1Pm4AItNfYQXOCRF+UGirJUNFkP
 +BKov0Dj/yu9diciK0emQ==
X-ME-Sender: <xms:IrwMY6HKXmvjcrY5OUBLX29cLbQRNmqBvvc4dJt-ijjE3u7qqOZzpw>
 <xme:IrwMY7UIy5M6u2zppGrV1v1INpY7hHSWYxRrJ2pXn8-pEmjQeiTC0LSBU5KsWJ7Dp
 rQSBkomKIbxepqfW1Q>
X-ME-Received: <xmr:IrwMY0KrgUvJl6XDQktT5t25aTSJoP54fuSaRJv8HoOdknF2idNzwUoutWg_>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrvdekuddgieegucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvvefufffkofgjfhggtgfogfesthhqredtredtjeenucfhrhhomhepofgr
 gihimhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtf
 frrghtthgvrhhnpeefiedvfefggffgffehveejieffuddtgffhjefggeetieduvdeileet
 lefgveegtdenucevlhhushhtvghrufhiiigvpeelnecurfgrrhgrmhepmhgrihhlfhhroh
 hmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:IrwMY0GjzgcwM3BsMZ3jxQq-KmMz2K0Nqr9J9l5R-g0RmyXBXmW4iw>
 <xmx:IrwMYwWt1xN9sEbEUp3EbfmQBszTubS0qin7I7vvO_RPdmiq0ZTY7g>
 <xmx:IrwMY3PFyY_-BojPHYtG0V0KAsWDX6NIRt7zs8Y_ej0GKRowTr6nKQ>
 <xmx:I7wMY7co049-iAcdjZG-cJJFkWtE5pmmq790n3kevJM2HHXZuXHzz71yOeA>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 29 Aug 2022 09:16:17 -0400 (EDT)
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
Subject: [PATCH v2 39/41] drm/sun4i: tv: Rename error label
Date: Mon, 29 Aug 2022 15:11:53 +0200
Message-Id: <20220728-rpi-analog-tv-properties-v2-39-459522d653a7@cerno.tech>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220728-rpi-analog-tv-properties-v2-0-459522d653a7@cerno.tech>
References: <20220728-rpi-analog-tv-properties-v2-0-459522d653a7@cerno.tech>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Mailer: b4 0.10.0-dev-65ba7
X-Developer-Signature: v=1; a=openpgp-sha256; l=1217; i=maxime@cerno.tech;
 h=from:subject:message-id; bh=992aKe2/qrCZVBZV8U/tKPDwh4IEN+c9wkBDNYDBbNw=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDMk8uxTL71furRMuLyvh3dMXLdC772S+DmPCi8cBU29O2WvA
 qFffUcrCIMbFICumyBIjbL4k7tSs151sfPNg5rAygQxh4OIUgIlsX8Hw36lcJjPlBVej+dHv2ofUdy
 3jua8+67uphfXJTysbF+QuUmf4nzo9Nr7FyGiSnJlYzZNy83ZFqXeOm77bTWD/fCHy9fQybgA=
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

The other error labels in sun4i_tv_bind() are named after the task they=0D
perform (err_disable_clk to call clk_disable_unprepare for example).=0D
=0D
However, the err_cleanup_connector is named after the calling site=0D
(drm_connector_init failing) and will actually cleanup the encoder. Let's=0D
rename it to err_cleanup_encoder to be consistent.=0D
=0D
Signed-off-by: Maxime Ripard <maxime@cerno.tech>=0D
Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>=0D
=0D
diff --git a/drivers/gpu/drm/sun4i/sun4i_tv.c b/drivers/gpu/drm/sun4i/sun4i=
_tv.c=0D
index 6d7e1d51569a..ad6a3739bfa9 100644=0D
--- a/drivers/gpu/drm/sun4i/sun4i_tv.c=0D
+++ b/drivers/gpu/drm/sun4i/sun4i_tv.c=0D
@@ -580,7 +580,7 @@ static int sun4i_tv_bind(struct device *dev, struct dev=
ice *master,=0D
 	if (ret) {=0D
 		dev_err(dev,=0D
 			"Couldn't initialise the Composite connector\n");=0D
-		goto err_cleanup_connector;=0D
+		goto err_cleanup_encoder;=0D
 	}=0D
 	tv->connector.interlace_allowed =3D true;=0D
 =0D
@@ -588,7 +588,7 @@ static int sun4i_tv_bind(struct device *dev, struct dev=
ice *master,=0D
 =0D
 	return 0;=0D
 =0D
-err_cleanup_connector:=0D
+err_cleanup_encoder:=0D
 	drm_encoder_cleanup(&tv->encoder);=0D
 err_disable_clk:=0D
 	clk_disable_unprepare(tv->clk);=0D
=0D
-- =0D
b4 0.10.0-dev-65ba7=0D
