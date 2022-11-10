Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6727A6240F7
	for <lists+dri-devel@lfdr.de>; Thu, 10 Nov 2022 12:10:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0EEAF10E712;
	Thu, 10 Nov 2022 11:08:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new4-smtp.messagingengine.com (new4-smtp.messagingengine.com
 [66.111.4.230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F00CB10E6E2;
 Thu, 10 Nov 2022 11:07:48 +0000 (UTC)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailnew.nyi.internal (Postfix) with ESMTP id 588425802EC;
 Thu, 10 Nov 2022 06:07:48 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute1.internal (MEProxy); Thu, 10 Nov 2022 06:07:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm2; t=1668078468; x=
 1668085668; bh=2hsixTqx80DvaeO/LF2g1u82V3cMDJ81NIDmTmWKEBs=; b=H
 mzRyJ0EPvH4uTP2NhUDEynO4dh3pIf0JtvgjRIBnfMMDGmevVrHeSwXx9HhXaPWb
 7/tagpHC5QZ9g9KTFS3NnY1Y7UKETOaQa2OnlCZ9DQOW4T57OnH1BxQCnycxSvG+
 tBn8krC7Csx18ZR/DdwJYUtLKdOmjdgxZXfHQ/mnENuckP2wzhSsl3pWCadaAAzt
 vEUJ2AZGNtoEGCIdt/VNaP+ET3BnytSVgRkn2ykTHnlQ48I5OzfVlT4r9Dq2DSEO
 gk9oGNVTVgxjBE1Q2IlxdYbB5CmjqcldYuEXi15+pw2WnW6pBD/9b+/w/BjGhjY9
 zv1bkswU9WpIByIVJY7IA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1668078468; x=
 1668085668; bh=2hsixTqx80DvaeO/LF2g1u82V3cMDJ81NIDmTmWKEBs=; b=T
 AVHQlfASsYiD3JGAYsPkZZSPkxUaMuk8WbO+RwHJe1RJSTgFZBbLr/SkogIfwREH
 GXt2S4FM94g+Y1PkWpM2Llp7936BUahDzjywqcP1UjOyz6EUuFWybZoQDExD55cM
 TnI14LjDfLlb/8EHS8aoVwfsnzyr48Yqt0Heq9Y+UtgM8rPw8JHXNRUyEHhUJhzf
 T/B5fPMjj4vsV36rWP2LLGPdgjxLcQ0mny7gf4O075fnpTPd9vb0TqQWGY39y7lq
 XF+HZd+7uF15ZOK28Lyjr6nFjzh7Uz81wNpN2ME3zE17NejZrOjV9OgDwuZkmd9q
 hYNPB98quCz8COKofGDHA==
X-ME-Sender: <xms:hNtsYzYB9TSo_eoKJ6NmwG-QFeucjiFxK6rsqW0jj3FWji0veCdYOw>
 <xme:hNtsYyYkJuWwBjgEGwCYNLe2tBm4SSzX9whsoA7I0NciqJdHEIGEnybzgwt8nPbpd
 M5mCyCr6wwl0nMJ2CY>
X-ME-Received: <xmr:hNtsY1_gHxSI4p5ndSOEzW2otm7hcC_IXmnwwW0clCvODFFj-4x5wPlfyFGm3yNkFY9UyeIra1zj6U3Vr0p644y7QriUmxZWgbPjOWMrnqgttA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvgedrfeeggddvhecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhfffuggfgtgfkfhgjvfevofesthekredtredtjeenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpedvgfevjefhtdetveevhfelieeuueetgfdvgeevkeegudejffegfffgtedt
 leelhfenucevlhhushhtvghrufhiiigvpedunecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:hNtsY5pOn7PaYbhsIFcfZs_8O3iQYDE_gW5EMd7NrNQ2WheMZwZ11w>
 <xmx:hNtsY-qXrtn4HiwvMZKe3hQLvz0bLENkq9qZO6F4sZvsvBdQypqHnw>
 <xmx:hNtsY_SGcQS4J6BVFscSSzgIUUnRdj7WrYRzzAty4TqNw8bNIxSAww>
 <xmx:hNtsY5Wl5p93u3N2qYaGzLRxcmRdMADAGJi4pucabo9BMukF-vhw6g>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 10 Nov 2022 06:07:47 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
Date: Thu, 10 Nov 2022 12:07:27 +0100
Subject: [PATCH v8 15/24] drm/client: Remove match on mode name
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <20220728-rpi-analog-tv-properties-v8-15-09ce1466967c@cerno.tech>
References: <20220728-rpi-analog-tv-properties-v8-0-09ce1466967c@cerno.tech>
In-Reply-To: <20220728-rpi-analog-tv-properties-v8-0-09ce1466967c@cerno.tech>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Chen-Yu Tsai <wens@csie.org>, 
 Maxime Ripard <mripard@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Karol Herbst <kherbst@redhat.com>, 
 Jani Nikula <jani.nikula@linux.intel.com>, Daniel Vetter <daniel@ffwll.ch>,
 Lyude Paul <lyude@redhat.com>, Samuel Holland <samuel@sholland.org>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, Emma Anholt <emma@anholt.net>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, 
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 David Airlie <airlied@linux.ie>, Ben Skeggs <bskeggs@redhat.com>
X-Mailer: b4 0.11.0-dev-99e3a
X-Developer-Signature: v=1; a=openpgp-sha256; l=1534; i=maxime@cerno.tech;
 h=from:subject:message-id; bh=rsG6uUL6JkaDcz2xmtlhcxfIn9ltco9C8smN0JEg9lE=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDMk5t1PvvItmkuLVF1ojNvPDXFfhzq95jvrGb2eUCV6/3LDw
 zLPLHaUsDGJcDLJiiiwxwuZL4k7Net3JxjcPZg4rE8gQBi5OAZiIAAMjw4P4RwvDzM2M9Oz0YiU/SW
 wSP8Ul9+LlvIYLsrZnJ3qsmcHw39mr5qPvdj7bj61fTutcdrW22mSxfuYdBtH7e6ZVfw335gQA
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
Cc: Dom Cobley <dom@raspberrypi.com>, Dave Stevenson <dave.stevenson@raspberrypi.com>, nouveau@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, Phil Elwell <phil@raspberrypi.com>, Hans de Goede <hdegoede@redhat.com>, Noralf Trønnes <noralf@tronnes.org>, Geert Uytterhoeven <geert@linux-m68k.org>, Maxime Ripard <maxime@cerno.tech>, Mateusz Kwiatkowski <kfyatek+publicgit@gmail.com>, linux-sunxi@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Commit 3aeeb13d8996 ("drm/modes: Support modes names on the command
line") initially introduced the named modes support by essentially
matching the name passed on the command-line to the mode names defined
by the drivers.

This proved to be difficult to work with, since all drivers had to
provide properly named modes. This was also needed because we weren't
passing a full blown-mode to the drivers, but were only filling its
name.

Thanks to the previous patches, we now generate a proper mode, and we
thus can use the usual matching algo on timings, and can simply drop the
name match.

Suggested-by: Noralf Trønnes <noralf@tronnes.org>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>

---
Changes in v8:
- New patch
---
 drivers/gpu/drm/drm_client_modeset.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/gpu/drm/drm_client_modeset.c b/drivers/gpu/drm/drm_client_modeset.c
index d553e793e673..1b12a3c201a3 100644
--- a/drivers/gpu/drm/drm_client_modeset.c
+++ b/drivers/gpu/drm/drm_client_modeset.c
@@ -188,10 +188,6 @@ static struct drm_display_mode *drm_connector_pick_cmdline_mode(struct drm_conne
 	prefer_non_interlace = !cmdline_mode->interlace;
 again:
 	list_for_each_entry(mode, &connector->modes, head) {
-		/* Check (optional) mode name first */
-		if (!strcmp(mode->name, cmdline_mode->name))
-			return mode;
-
 		/* check width/height */
 		if (mode->hdisplay != cmdline_mode->xres ||
 		    mode->vdisplay != cmdline_mode->yres)

-- 
b4 0.11.0-dev-99e3a
