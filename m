Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 04A63627FE6
	for <lists+dri-devel@lfdr.de>; Mon, 14 Nov 2022 14:02:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 86EF110E2BE;
	Mon, 14 Nov 2022 13:01:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new4-smtp.messagingengine.com (new4-smtp.messagingengine.com
 [66.111.4.230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4EEBC10E2B1;
 Mon, 14 Nov 2022 13:01:11 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailnew.nyi.internal (Postfix) with ESMTP id B1342580242;
 Mon, 14 Nov 2022 08:01:10 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Mon, 14 Nov 2022 08:01:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm2; t=1668430870; x=
 1668438070; bh=pk6h/+dXTjEvHbWXp2H46MfX1suxeK5YHIWTvO1KqGo=; b=Z
 SYsdLF8OccUNGPRYiUqJu0sesn0n9UvODUEGC8EwEA79RCxzMVOBIiig+q8DTtib
 3AVhCplGGaMgrTyVocnsDR9WTw5Fx1s9czVVkZgamNxPRytbciqpXS7lZi/NHIOk
 bsEs8ccTkAqRv4E5yG5Al11mLWyfkYhNrhojCiAocmfA8/z92ypU/VQgh5XLOS67
 zVxZVwCx9JxpL8fyVESHKJY5i633M7iBwiDFBbQ8mIZ2HdJPdUJIDp9V6NHft1tQ
 q5Dd4+/PQKMwL3tcTkf08fmc8Fx/YA1E6wosCgj4YBNrSXFRzYoNU/ILWyHKlVtk
 YNo8J1Efzru1+X2tfASoA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1668430870; x=
 1668438070; bh=pk6h/+dXTjEvHbWXp2H46MfX1suxeK5YHIWTvO1KqGo=; b=A
 BQ7siuZeQc98t50J/Xr7AKvv/OjkIdhBc6CnHVO5Vkzk2Uct2qZJcepX9uKArnQf
 zJY8cxPaxxNFZoGJuTyc5CANFunztEO5qw/Bn45kZIh2OvWkUSAv4wq0D2EB6kGg
 /FwzqwalQDTjAnbPT8hgwQcyge8bOIiyzrRywZwpTuElcAbWGzq45vU2ui1Mh3Ic
 mfAKhtBByF53CTp59/SsJpcrskiMqSR9Sh+urAgRdRzqDf0fwPlyEwJKFeuiG71v
 xwrDYih/C9Ti6X37GdRMXnfnKB5TB+/2zXLeoVdsVSYXx/7YR+S8ZdMGYDz7RCD1
 o4omDn9QHJSVJYChiBGfA==
X-ME-Sender: <xms:FTxyYzv1OAvx3_-gZZxRZbf6iInuV2mqXSYv-64ol3Bj19GbtALzPQ>
 <xme:FTxyY0eI7XcjZcjhVs7BzVtIEsTkG8Ih2FcIBtvtTuiwAW0wnHvG0y5t8Dup7aSos
 5NLZS0N9awt0kE9aOg>
X-ME-Received: <xmr:FTxyY2woZ6NMpZhot0t5HXBcmGEP91EurTUNiOoRWyiTQsHzuKHyotI1M01Pq3cszAs7K6TH5gSJvyv9sQwv1_25G6zm2f0Tb_uoHAAWRLspug>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvgedrgedvgddvtdcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhfffuggfgtgfkfhgjvfevofesthekredtredtjeenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpedvgfevjefhtdetveevhfelieeuueetgfdvgeevkeegudejffegfffgtedt
 leelhfenucevlhhushhtvghrufhiiigvpeehnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:FjxyYyOqsHGmDg7N6AQ8GHpYQ4hUsZ_pQqityeggDqi8e4tVYs4SrA>
 <xmx:FjxyYz-nm49_om2ZBkr7r_uowvvlDJMQviVrfcNXfFO4PfhqhBomPg>
 <xmx:FjxyYyVsg073Mko80ipY0N-UoyK9EPqlkocLtV0Ftr0Dud2U0WnQkA>
 <xmx:FjxyY_JzryikX2t1xgDuovtfNYBB7ZVaBrTR5-Afn_uy6Mlonlej8A>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 14 Nov 2022 08:01:09 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
Date: Mon, 14 Nov 2022 14:00:35 +0100
Subject: [PATCH v9 16/25] drm/client: Remove match on mode name
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <20220728-rpi-analog-tv-properties-v9-16-24b168e5bcd5@cerno.tech>
References: <20220728-rpi-analog-tv-properties-v9-0-24b168e5bcd5@cerno.tech>
In-Reply-To: <20220728-rpi-analog-tv-properties-v9-0-24b168e5bcd5@cerno.tech>
To: Maxime Ripard <mripard@kernel.org>, Karol Herbst <kherbst@redhat.com>,
 Samuel Holland <samuel@sholland.org>, 
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Daniel Vetter <daniel@ffwll.ch>, Chen-Yu Tsai <wens@csie.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Lyude Paul <lyude@redhat.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, Emma Anholt <emma@anholt.net>,
 Jani Nikula <jani.nikula@linux.intel.com>, 
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Ben Skeggs <bskeggs@redhat.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>, 
 David Airlie <airlied@linux.ie>, Jernej Skrabec <jernej.skrabec@gmail.com>
X-Mailer: b4 0.11.0-dev-99e3a
X-Developer-Signature: v=1; a=openpgp-sha256; l=1585; i=maxime@cerno.tech;
 h=from:subject:message-id; bh=DDRXVJjuSx00V6n4isqsuSESkv4kdxI6Sqc/QS4mqAQ=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDMlF1m/01ezq7AP3hE4/vv1G3rRVuQ5Hu/zeC755+PJlEVe0
 m4puRykLgxgXg6yYIkuMsPmSuFOzXney8c2DmcPKBDKEgYtTACYyw47hf8ndLdon31ms+epw56Pd9n
 cWk0KXBO6XK5b233eQf8Z1lbcMfzgrXvGvb1h36s7y1n7JLWrrJGTdZoitufI6V8+lWTpDiwEA
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
Cc: Dom Cobley <dom@raspberrypi.com>, Dave Stevenson <dave.stevenson@raspberrypi.com>, nouveau@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, Mateusz Kwiatkowski <kfyatek+publicgit@gmail.com>, Hans de Goede <hdegoede@redhat.com>, Noralf Trønnes <noralf@tronnes.org>, Geert Uytterhoeven <geert@linux-m68k.org>, Maxime Ripard <maxime@cerno.tech>, linux-sunxi@lists.linux.dev, Phil Elwell <phil@raspberrypi.com>, linux-arm-kernel@lists.infradead.org
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
