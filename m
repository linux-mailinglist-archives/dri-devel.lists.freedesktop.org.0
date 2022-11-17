Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9932462D6EE
	for <lists+dri-devel@lfdr.de>; Thu, 17 Nov 2022 10:30:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C70810E5B1;
	Thu, 17 Nov 2022 09:29:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew2-smtp.messagingengine.com (wnew2-smtp.messagingengine.com
 [64.147.123.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 530C810E5AF;
 Thu, 17 Nov 2022 09:29:42 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailnew.west.internal (Postfix) with ESMTP id 96F392B069C6;
 Thu, 17 Nov 2022 04:29:39 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Thu, 17 Nov 2022 04:29:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm2; t=1668677379; x=
 1668684579; bh=pk6h/+dXTjEvHbWXp2H46MfX1suxeK5YHIWTvO1KqGo=; b=E
 l79hJdpbb5yN7oxf1ubvm3iaPxUzlPZGCn9ICe+0gQwwLhvbQIiLBObi5kCk9R3z
 yp542W+02hDaFQc9SSQNyfZxsLKuQEQfIEHRCi1L5y7vEaiR3avTTgXo9MehHYqu
 MDVzm7LTMt8pFoWY2ZjO5t4A9ys5MDBqhoubrVrdnMww2kqwDK+2lMavxJWf1nGh
 MdyHrtsIdBi9ubbYoXbTq7WvTpT72q9r6O5zg3skrYNNw9WgClXNNnxOwgp9lkL0
 TiJd15OUmtHn2vVY9gtyAd3Xap+TX8ywBZG8EkJ8YbPvdYzg7dSS+hfs8D6DWySJ
 /kie3p69diMJ5V9npi+lw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1668677379; x=
 1668684579; bh=pk6h/+dXTjEvHbWXp2H46MfX1suxeK5YHIWTvO1KqGo=; b=a
 vjOs42vJpS6cgSSsqlGTXqWEo5lk6Yb2zk3gEAt7FuNxXdP5wxaQo/2a5bG9rHw+
 2uUxapMYaI/tgILRjm+IVfrS/Q2dyARYMg7uimu3X9KzhR8lFUeBwGxCzlQfK4Dl
 EEV6gWc8NUoDgk7XcviuYoe9RcmRJu3vT9BevgEDs1MCWeRiN5a1m+V7KsfKe/Lk
 dTAwdXSv/4OvmGZHcq43P129Op1dQLvgP5s2YPHJTtsQn6gdd4WPoczKQE72j+Fx
 1v3uyKrWwTUSQPa0FW8Wvau2mQRUcVdvIUiLmJloaD8CjYKNuDjz2Z8o/UuqLpX7
 SDRIvC12kUi6Nqx85C5TA==
X-ME-Sender: <xms:A_91Y7kGkro3rvN4ETefbLyNceUf2zvKHAL1B8uOyOmdZXxbpp729w>
 <xme:A_91Y-0uuYqo1eKhpmA_Ham-nr_0wbVwLMH1Uro0yk7pbu0KqlV4Xn3qDKBzK-r0q
 H45pjB_7y78TgarAYs>
X-ME-Received: <xmr:A_91YxpB3jAf6VS3htZMnLN4GJhhYU7QR4IcCFwfwnhD_VMT_q-11JZJ1WL8efeaJMV-AXNv1EfjrXoTl9g4MhOtz1g2qrMrO6UhGWQg-8PFXQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvgedrgeekgddtfecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhfffuggfgtgfkfhgjvfevofesthekredtredtjeenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpedvgfevjefhtdetveevhfelieeuueetgfdvgeevkeegudejffegfffgtedt
 leelhfenucevlhhushhtvghrufhiiigvpedunecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:A_91YzmA-lFbrcCeT2_UWFc-qoofaT1kMvZYm-zjymdMDPiwz6FOqQ>
 <xmx:A_91Y52Sq9UTbA766Ir8aBCZYU4xiEjnqgrGwiacXl-qQEnM4BysCg>
 <xmx:A_91YysXae-r8LtWC5WDDRdLc_dNxBW7q4qx_p0m36-CYu94RsUSDQ>
 <xmx:A_91Y4CI6HSF-9HhgOnX1aXIu9AhxMJmoEP5D8YaS5H6LQlZ3J1Hqqf1fdE>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 17 Nov 2022 04:29:38 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
Date: Thu, 17 Nov 2022 10:28:53 +0100
Subject: [PATCH v10 10/19] drm/client: Remove match on mode name
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <20220728-rpi-analog-tv-properties-v10-10-256dad125326@cerno.tech>
References: <20220728-rpi-analog-tv-properties-v10-0-256dad125326@cerno.tech>
In-Reply-To: <20220728-rpi-analog-tv-properties-v10-0-256dad125326@cerno.tech>
To: Samuel Holland <samuel@sholland.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, 
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Ben Skeggs <bskeggs@redhat.com>, 
 Chen-Yu Tsai <wens@csie.org>, David Airlie <airlied@linux.ie>,
 Jani Nikula <jani.nikula@linux.intel.com>, 
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>, Emma Anholt <emma@anholt.net>,
 Karol Herbst <kherbst@redhat.com>, 
 Lyude Paul <lyude@redhat.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel@ffwll.ch>
X-Mailer: b4 0.11.0-dev-99e3a
X-Developer-Signature: v=1; a=openpgp-sha256; l=1585; i=maxime@cerno.tech;
 h=from:subject:message-id; bh=DDRXVJjuSx00V6n4isqsuSESkv4kdxI6Sqc/QS4mqAQ=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDMml/y4IT7j9fVPFm4wORpOXR3ktW+afYmM+6rDpUdbRlrBY
 H89pHaUsDGJcDLJiiiwxwuZL4k7Net3JxjcPZg4rE8gQBi5OAZhIrCTDP43TYS6Oh06JT0s1K1ec6m
 CYJDhPykrYYdm0EM3L9zLanBj+x1z56VTRdff+2adnz148fVi15PrunYsfBl+9KaIxaX14HT8A
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

Reviewed-by: Noralf Trønnes <noralf@tronnes.org>
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
