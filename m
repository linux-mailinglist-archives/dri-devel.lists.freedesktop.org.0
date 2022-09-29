Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B50925EFAAB
	for <lists+dri-devel@lfdr.de>; Thu, 29 Sep 2022 18:33:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F57210EAE7;
	Thu, 29 Sep 2022 16:31:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new4-smtp.messagingengine.com (new4-smtp.messagingengine.com
 [66.111.4.230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 36A1C10EAE0;
 Thu, 29 Sep 2022 16:31:38 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailnew.nyi.internal (Postfix) with ESMTP id 9504C580800;
 Thu, 29 Sep 2022 12:31:37 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Thu, 29 Sep 2022 12:31:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm2; t=1664469097; x=
 1664476297; bh=wt2eTyIJwjxbZ/8tKEZiOXM8cMr/LAhIXsv9D0HeKWs=; b=1
 +TgCqSPejbAfkPQh/2VClweEeU/fwWEe/XePjv2CyjdJZJoqual2Hcnw0/jO65dW
 chpVDafy16ko/CNUxvh41GPLSebWm64YY5/R/KNh4mNrJ0P8KA8jqbSfdbiTf7BO
 3HmsnxnFfoTnhQXMNa18xEPCjzmQW8tNtPrzYnZ4h4mkQLk2qJbebj0j3xBrEHvj
 L+Jd5H5ZnnXMGi3oAlv+C2pBU+f/OPkFUtZLpFGa4hwZNNNGBjEQtgEfkP3zN5ju
 ba2HanD+GEK8/cgDvWsxgPBC3Zp86ULK9jFst7X/hzgO3n24RR/lwVyCNvk5Hnmr
 /A/noyISwfXRtEewNfoLA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1664469097; x=
 1664476297; bh=wt2eTyIJwjxbZ/8tKEZiOXM8cMr/LAhIXsv9D0HeKWs=; b=p
 wIfPeE5Uig5/dUO/WSGw53A2vOHlOwM1fBn/Jlwv/9xmIIg5zUCffwYD7g9Z5hhi
 3vcyk6fT6OPNZuneGtQvxhRZr6bw42Zsrb2bVpYM1uKmYiIkFpJlT7F34RkJ85WH
 CZVhs2ACwTejOcZ8LeZVOPG8kF5Ra0/jv1cL8MgSKxttoHgqAXnzbVKOkYXarTWH
 GUU/UoVuNDWHvEnUaQHywp+YYE90EgQih3VJeaFk+1MNBI67DRuRBwAMequcWMMb
 OyR3jf95nd1amoCiorPrn6UAcS74aJECL/Qjcpk09Ewq26v/22EfIgqpvSKrHfpm
 OI95RN8f2Wu9rFIam4DRg==
X-ME-Sender: <xms:acg1Y5HAB-J6DacQdEtB8MgQNFJXkPY1VZ7K7Pl7bsdMNK27mJV3AA>
 <xme:acg1Y-Vf8b_DBH_d912HUgc4rsdFUB4S8QoTDQKoPnVV0R_6qLs6mqnGeKokPkliY
 Lj9QBYLkFwjUTGuNJo>
X-ME-Received: <xmr:acg1Y7LqaYrLKfxVWIZaLiNjwFUQ2o58M0DVujHRHOOw7UlNWW9-ZePZsqys>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrfeehtddguddtfecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpefhfffugggtgffkfhgjvfevofesthekredtredtjeenucfhrhhomhepofgr
 gihimhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtf
 frrghtthgvrhhnpeduudduhfevjeetfeegvdffvdevvdejudegudekjeehtdelhfffveet
 hfejledtveenucevlhhushhtvghrufhiiigvpedunecurfgrrhgrmhepmhgrihhlfhhroh
 hmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:acg1Y_FF8BREBVaQ3ao2VTmviK3geHwWopq8UGgklL1jb18zp4udZw>
 <xmx:acg1Y_URlH2rhu62Dz8cYHEBItlmYAnM8mP987grP74Je57ARTkqTA>
 <xmx:acg1Y6Nf8AQY7yciKlzjqafT0Bwhuza9AJ1fC7Yfh5_ACoc0TeIB8Q>
 <xmx:acg1Y5ifqTo-XdVgoh_Q9Rwm6TO67YcIfhlJWe18-1mqloeAsm16NA>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 29 Sep 2022 12:31:36 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
Date: Thu, 29 Sep 2022 18:31:06 +0200
Subject: [PATCH v4 12/30] drm/modes: Only consider bpp and refresh before
 options
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20220728-rpi-analog-tv-properties-v4-12-60d38873f782@cerno.tech>
References: <20220728-rpi-analog-tv-properties-v4-0-60d38873f782@cerno.tech>
In-Reply-To: <20220728-rpi-analog-tv-properties-v4-0-60d38873f782@cerno.tech>
To: Jernej Skrabec <jernej.skrabec@gmail.com>, Chen-Yu Tsai <wens@csie.org>,
 Karol Herbst <kherbst@redhat.com>, 
 Samuel Holland <samuel@sholland.org>, Lyude Paul <lyude@redhat.com>,
 Jani Nikula <jani.nikula@linux.intel.com>, 
 Daniel Vetter <daniel@ffwll.ch>, Thomas Zimmermann <tzimmermann@suse.de>,
 Emma Anholt <emma@anholt.net>, 
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Ben Skeggs <bskeggs@redhat.com>, David Airlie <airlied@linux.ie>, 
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>
X-Mailer: b4 0.11.0-dev-7da52
X-Developer-Signature: v=1; a=openpgp-sha256; l=1709; i=maxime@cerno.tech;
 h=from:subject:message-id; bh=gD4ygdBGZNKIWb6y+2+6F5I7HQgHtgaK+RNW5UnuoHw=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDMmmJ9wzmdIf2E3KXahdepRrjdvmzUmGVuv+th86mhmrufh7
 TcijjlIWBjEuBlkxRZYYYfMlcadmve5k45sHM4eVCWQIAxenAEzkaTnD/1IPv9t79bdVHHt471vTC6
 tPN3t4Hph1b6hvz+jiOFoXcoThn+439Zj3Tay3XLb/KMqSOm/6sUhA8MSK/ZHb7y17OEdMgx0A
X-Developer-Key: i=maxime@cerno.tech; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D
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
Cc: Dom Cobley <dom@raspberrypi.com>, Dave Stevenson <dave.stevenson@raspberrypi.com>, Phil Elwell <phil@raspberrypi.com>, nouveau@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, Mateusz Kwiatkowski <kfyatek+publicgit@gmail.com>, Hans de Goede <hdegoede@redhat.com>, Noralf Trønnes <noralf@tronnes.org>, Geert Uytterhoeven <geert@linux-m68k.org>, Maxime Ripard <maxime@cerno.tech>, linux-sunxi@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Some video= options might have a value that contains a dash. However, the
command line parsing mode considers all dashes as the separator between the
mode and the bpp count.

Let's rework the parsing code a bit to only consider a dash as the bpp
separator if it before a comma, the options separator.

A follow-up patch will add a unit-test for this once such an option is
introduced.

Reviewed-by: Geert Uytterhoeven <geert@linux-m68k.org>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/drm_modes.c | 16 +++++++++-------
 1 file changed, 9 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/drm_modes.c b/drivers/gpu/drm/drm_modes.c
index 7cf2fe98d7d2..99809ea09ce3 100644
--- a/drivers/gpu/drm/drm_modes.c
+++ b/drivers/gpu/drm/drm_modes.c
@@ -2275,20 +2275,22 @@ bool drm_mode_parse_command_line_for_connector(const char *mode_option,
 
 	name = mode_option;
 
+	/* Locate the start of named options */
+	options_ptr = strchr(name, ',');
+	if (options_ptr)
+		options_off = options_ptr - name;
+	else
+		options_off = strlen(name);
+
 	/* Try to locate the bpp and refresh specifiers, if any */
-	bpp_ptr = strchr(name, '-');
+	bpp_ptr = strnchr(name, options_off, '-');
 	if (bpp_ptr)
 		bpp_off = bpp_ptr - name;
 
-	refresh_ptr = strchr(name, '@');
+	refresh_ptr = strnchr(name, options_off, '@');
 	if (refresh_ptr)
 		refresh_off = refresh_ptr - name;
 
-	/* Locate the start of named options */
-	options_ptr = strchr(name, ',');
-	if (options_ptr)
-		options_off = options_ptr - name;
-
 	/* Locate the end of the name / resolution, and parse it */
 	if (bpp_ptr) {
 		mode_end = bpp_off;

-- 
b4 0.11.0-dev-7da52
