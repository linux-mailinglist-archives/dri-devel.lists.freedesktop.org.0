Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 01E2B5E6549
	for <lists+dri-devel@lfdr.de>; Thu, 22 Sep 2022 16:27:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3725710EB7F;
	Thu, 22 Sep 2022 14:27:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew4-smtp.messagingengine.com (wnew4-smtp.messagingengine.com
 [64.147.123.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C3CE910EB6C;
 Thu, 22 Sep 2022 14:26:52 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailnew.west.internal (Postfix) with ESMTP id 7F6242B05B1F;
 Thu, 22 Sep 2022 10:26:49 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Thu, 22 Sep 2022 10:26:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm2; t=1663856809; x=
 1663864009; bh=2NnjqCO4NMItXEoc0zbBHgLZ+xECh6BN8zUKWTW55Ys=; b=O
 Fur9YXofY21mq8/gyq5m9k34T3BnkOm/lebs2fS/9lQTv9OZ7qJtpPiqUG/i5qSW
 q2UPOYfEr2wAcKPH5kxFHiyvywyaS38jogfrFu/Yzr7fZlwJ/39soTMEVGEsaCd6
 6pThEloiLC9+9fTlOK08KvQsqgT68CW0uhJKWue45pkGAnq+HPnBlCZlpj6Z1gDz
 kTww85DYX9CrT6JnACTDL0d3ExE2QaFHKsnknm2UIXQgL/HamkG9E2nedNBdHbGY
 fEbtp9vprjVk65lSRw0gWRN0+e0AfEJl+Zu9otf56xlmnzOIaArAKeCY+NXdbAL7
 59BrLEON2azateYkI/tNw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1663856809; x=
 1663864009; bh=2NnjqCO4NMItXEoc0zbBHgLZ+xECh6BN8zUKWTW55Ys=; b=m
 q59E+H7i2lBNJMivDIRlLGh3hl9lsuqkFmc2YXlPPNy6wgNkQ3IUC+ijgUOkEfXD
 SOlC4HnisJ3BE62GnoH021mV8S6k73OsV6Vg2YXxFIJGHfUO0X5stLjJjfVMHzb1
 WCjLniWIf2BNdZoPeISf4i0JB3zt4qj+DVgepXHI+iWt+fdiUTw0ZKBKa6Hk67JQ
 NUY5NCjWsPkKusIY0fLROVbnxwW2ipm8lUd/n00z8tG0bTcm/ZL6HnC7ah11UIaf
 QvyuoplKNyigAVeqX6hB6Hkp0sIjGYm/2RzGaGmlTsusp3nq7ic5bZl67WIeZiwe
 QUN0Xnl415RGVmqjRv3Jw==
X-ME-Sender: <xms:qHAsY6YZvi7sGk4TN9koFC6XE2l6q7Z-FkDN3PozE84W06hTEET-4w>
 <xme:qHAsY9Yr-pL1e2rFnAt9xTofZw-82IfEBGdByZoekLNl4NmxN2bWzYVsqYtcKivGG
 Sb-bE6u2SHL2z1M66E>
X-ME-Received: <xmr:qHAsY09Gj0x-JUtQyGSENOA2cb3-nWKx6iptrd0gbTIugDriGADJVrpZ0Mg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrfeefgedgudejucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephfffufggtgfgkfhfjgfvvefosehtkeertdertdejnecuhfhrohhmpeforgig
 ihhmvgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrf
 grthhtvghrnhepudduudfhveejteefgedvffdvvedvjedugedukeejhedtlefhffevtefh
 jeeltdevnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
 epmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:qHAsY8pV4-lMfalNqce6-1mUcXDuSFPpwEIwSv7OclRsRnbsswlskQ>
 <xmx:qHAsY1rHWlNlPZKHoFySSgILPGPZYrONgq0GvLQz1FHE0akS_QvEIA>
 <xmx:qHAsY6RZoGAn4o74U40lgvnYSjlfYAyPWhC5P07OAh0effV2s-Angg>
 <xmx:qXAsY4WyHY9vun7PbQ2put0dBdKs3Ng4SogAhvMi4Qx-_0UKFm0QzaqH4zw>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 22 Sep 2022 10:26:48 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
Date: Thu, 22 Sep 2022 16:25:28 +0200
Subject: [PATCH v2 11/33] drm/modes: Only consider bpp and refresh before
 options
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20220728-rpi-analog-tv-properties-v2-11-f733a0ed9f90@cerno.tech>
References: <20220728-rpi-analog-tv-properties-v2-0-f733a0ed9f90@cerno.tech>
In-Reply-To: <20220728-rpi-analog-tv-properties-v2-0-f733a0ed9f90@cerno.tech>
To: Jernej Skrabec <jernej.skrabec@gmail.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Ben Skeggs <bskeggs@redhat.com>, 
 David Airlie <airlied@linux.ie>, Maxime Ripard <mripard@kernel.org>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, 
 Emma Anholt <emma@anholt.net>, Karol Herbst <kherbst@redhat.com>,
 Samuel Holland <samuel@sholland.org>, 
 Jani Nikula <jani.nikula@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Daniel Vetter <daniel@ffwll.ch>, 
 Lyude Paul <lyude@redhat.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>, Chen-Yu Tsai <wens@csie.org>
X-Mailer: b4 0.10.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1592; i=maxime@cerno.tech;
 h=from:subject:message-id; bh=ehH+i59Vs/OowDE5NFRENhDEDWKHnp2mavFJ4/wcEk8=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDMk6BQEdq/PX9K6y2R4w8bddEENn17rOqilr9H5FnZWSzXwW
 l1TfUcrCIMbFICumyBIjbL4k7tSs151sfPNg5rAygQxh4OIUgIlMa2Jk2HqaR3mjKMvhis2sDY5Ktv
 HPj959KqvW2PH0yBePOpbgJQz/y1xTmidsqzKZWla2cOPyjNP3Vp+rXOH7TsZEPPXbo+3reQA=
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
Cc: Dom Cobley <dom@raspberrypi.com>, Dave Stevenson <dave.stevenson@raspberrypi.com>, nouveau@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-sunxi@lists.linux.dev, Hans de Goede <hdegoede@redhat.com>, Noralf Trønnes <noralf@tronnes.org>, Geert Uytterhoeven <geert@linux-m68k.org>, Maxime Ripard <maxime@cerno.tech>, Mateusz Kwiatkowski <kfyatek+publicgit@gmail.com>, Phil Elwell <phil@raspberrypi.com>, linux-arm-kernel@lists.infradead.org
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

diff --git a/drivers/gpu/drm/drm_modes.c b/drivers/gpu/drm/drm_modes.c
index 76ab700f56ff..8742ee078fe6 100644
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
b4 0.10.0
