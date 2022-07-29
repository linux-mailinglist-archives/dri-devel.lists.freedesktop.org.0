Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BF85A5853EB
	for <lists+dri-devel@lfdr.de>; Fri, 29 Jul 2022 18:47:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 82ED51132CB;
	Fri, 29 Jul 2022 16:47:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new4-smtp.messagingengine.com (new4-smtp.messagingengine.com
 [66.111.4.230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7238610F765
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Jul 2022 16:45:50 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailnew.nyi.internal (Postfix) with ESMTP id 01DD4580994;
 Fri, 29 Jul 2022 12:37:15 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Fri, 29 Jul 2022 12:37:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm2; t=1659112634; x=
 1659119834; bh=rnDw7qj9bzanL0m4spGmvxCXU4AVDsUFtibuOfI5t5g=; b=x
 LMtBqIKpJPh/Xqrx8TlylzaK9ihLIPsvyc/vUT85xmp+fKqq90uN0eZ0z1chdTyL
 +6DRjN8CzF2WtdEJcHxjad/X23wQ6Fia+vpzh3w90+nOmVrPH5fl8+tV/6+c30Aj
 KxbEN37X+6GuQJLr8+KFdHDtArn4JmqkB5HSr89AiB16RwfbtTJnMKef1C7ow7s1
 aeXN8DFvBrZigFKCcOOoOSQZ/I3cVoc0FubCxllb4Rr3TV4Ds8i/4goEv9nABeX9
 Ohc0E3lMS/GAeX7OdwJR8Idb2mWWd/3uCWKPnQsIUYZtJrLfNoVrZk46SAXIQRGB
 6KFZ3RWzcaMsqk4walMGQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1659112634; x=
 1659119834; bh=rnDw7qj9bzanL0m4spGmvxCXU4AVDsUFtibuOfI5t5g=; b=R
 ynezzFo0PIqTm0FkFEc2j/jnUFy/VKp/jRLS7vrXwLM45hRfNx/7FQgYztG9BgQy
 UcP0yRL71bliiEIw0TPTrajitkhCkkBErRjS8K0ZK2aiIra7h5qZgIYlMtgCuKF3
 vd5rL7zAPWsGLdDljVCXw2CpHoB4C3W0NISz7CUpGNJCPga19JSLSL9Fl/9r2sEZ
 gKE7UECv5QrOxvomXSyl9hLvPfcKEaH/dPGdJn7gSsSqjbJjRnvx4KNWLgzyv117
 P9EUQWyIAvfwwE03j/PQ8gU7AWIBV2U1P33OcUqnoBQwHY81XX9EMwS+OzPckczx
 /caGpmWRGLAiXV1DsPokA==
X-ME-Sender: <xms:ugzkYn7H4wr8D7-dXT1F2zqjiOtmN_O0trQXRW0QsKhAL4mvJAs1xQ>
 <xme:ugzkYs5AVby3NLBxspvuo5rUuDqLtSS3ZM0SoORvmL00EaAMqf9DYKhCm6RCbMaw-
 o3ywQCQ0QR0FhA75Q0>
X-ME-Received: <xmr:ugzkYucDziFe7r_LTf1ck6Xgfa1115jPfFG6z04GJU5RIbBGyFtZG6gDXBxsBiIpA1gy65heCMFlB_LJuPM>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrvddujedguddtfecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpefhvfevufffkffojghfgggtoffgsehtkeertdertdejnecuhfhrohhmpefo
 rgigihhmvgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecugg
 ftrfgrthhtvghrnhepgfffgfetffduudelhfevieffffduleevgfegkeeutefgffejheel
 leekjeefhfejnecuvehluhhsthgvrhfuihiivgepjeenucfrrghrrghmpehmrghilhhfrh
 homhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:ugzkYoKfEKw1VVZXC6q5WyiMP0aJxYn-oCTU9mdu9XDTp7nC41L_uw>
 <xmx:ugzkYrJ6fjYNR_4_h3tZQLyjGfx4gymIqjsAjnttj8Q8u-J88domZA>
 <xmx:ugzkYhzGFM_tlZJbR1qQICSDnFxiRffwE-eTSTobHwQ6U6RxZogLtg>
 <xmx:ugzkYo7l30tM7Z3vZmTgldqoocOVC4R49IOH4bd1SM5MXO6ghVGVkA>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 29 Jul 2022 12:37:13 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Jernej Skrabec <jernej.skrabec@gmail.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Chen-Yu Tsai <wens@csie.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 Jerome Brunet <jbrunet@baylibre.com>, Samuel Holland <samuel@sholland.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Daniel Vetter <daniel@ffwll.ch>,
 Emma Anholt <emma@anholt.net>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 =?UTF-8?q?Noralf=20Tr=C3=B8nnes?= <noralf@tronnes.org>,
 Kevin Hilman <khilman@baylibre.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Maxime Ripard <mripard@kernel.org>
Subject: [PATCH v1 29/35] drm/sun4i: tv: Remove useless destroy function
Date: Fri, 29 Jul 2022 18:35:12 +0200
Message-Id: <20220728-rpi-analog-tv-properties-v1-29-3d53ae722097@cerno.tech>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220728-rpi-analog-tv-properties-v1-0-3d53ae722097@cerno.tech>
References: <20220728-rpi-analog-tv-properties-v1-0-3d53ae722097@cerno.tech>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Mailer: b4 0.10.0-dev-49460
X-Developer-Signature: v=1; a=openpgp-sha256; l=1108; i=maxime@cerno.tech;
 h=from:subject:message-id; bh=pzXgXNTV1ygEPClHpqPRUksIVdy7cRIin6TQuXeU0ww=;
 b=owGbwMvMwCHc4XzqmfnC7acZT6slMSQ94VHKSPGrb3K+PLvZkOfMU5MFZh/Udgvvqpv91qdntZW0
 ymLtjlIWBmEOBlkxRZbrgm/t+MKi3CJ4PmyGmcPKBDKEgYtTACbSYsfwT8XVzHn6NOk18QE1ywJeZ5
 YvT5Mz0wpI5V3tckTVyO5ZP8Nfwe65zopnvOese16zbM+hoJaQJe4seUfO2djXprxd8vSTAQA=
X-Developer-Key: i=maxime@cerno.tech; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D
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
 Dave Stevenson <dave.stevenson@raspberrypi.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Mateusz Kwiatkowski <kfyatek+publicgit@gmail.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>, Maxime Ripard <maxime@cerno.tech>,
 linux-amlogic@lists.infradead.org, linux-sunxi@lists.linux.dev,
 Phil Elwell <phil@raspberrypi.com>, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Our destroy implementation is just calling the generic helper, so let's
just remove our function and directly use the helper.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>

diff --git a/drivers/gpu/drm/sun4i/sun4i_tv.c b/drivers/gpu/drm/sun4i/sun4i_tv.c
index 52bbba8f19dc..6d7e1d51569a 100644
--- a/drivers/gpu/drm/sun4i/sun4i_tv.c
+++ b/drivers/gpu/drm/sun4i/sun4i_tv.c
@@ -491,15 +491,9 @@ static const struct drm_connector_helper_funcs sun4i_tv_comp_connector_helper_fu
 	.get_modes	= sun4i_tv_comp_get_modes,
 };
 
-static void
-sun4i_tv_comp_connector_destroy(struct drm_connector *connector)
-{
-	drm_connector_cleanup(connector);
-}
-
 static const struct drm_connector_funcs sun4i_tv_comp_connector_funcs = {
 	.fill_modes		= drm_helper_probe_single_connector_modes,
-	.destroy		= sun4i_tv_comp_connector_destroy,
+	.destroy		= drm_connector_cleanup,
 	.reset			= drm_atomic_helper_connector_reset,
 	.atomic_duplicate_state	= drm_atomic_helper_connector_duplicate_state,
 	.atomic_destroy_state	= drm_atomic_helper_connector_destroy_state,

-- 
b4 0.10.0-dev-49460
