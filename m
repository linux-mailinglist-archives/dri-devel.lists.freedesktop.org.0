Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DF715853E4
	for <lists+dri-devel@lfdr.de>; Fri, 29 Jul 2022 18:47:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4192E10E638;
	Fri, 29 Jul 2022 16:47:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new4-smtp.messagingengine.com (new4-smtp.messagingengine.com
 [66.111.4.230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 87E0489115
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Jul 2022 16:45:50 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailnew.nyi.internal (Postfix) with ESMTP id EF557580934;
 Fri, 29 Jul 2022 12:35:53 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute3.internal (MEProxy); Fri, 29 Jul 2022 12:35:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm2; t=1659112553; x=
 1659119753; bh=YWzd1M45UJ404WTbCsULbW4KUvX+gwYYJ16acMe7FbA=; b=X
 UlA55IazycpWrng33oGOZjKDBcXEBEtCPzoC9xCLjQUHZglaSZbN57EODWPZWXF9
 VhjKvMYqJaqP06Def9hzPeLQWu4GJnaKaA1SALnMRB6KnQQRzpW98hfPnNQmJkjC
 5TCiOn5vtoKgsakxMv+WU2uFg4vx089YxYtVfIM17NiGf5W7twXh1Tn6V8LRAGoq
 sHq87bOw1FOGsmx2oJ/0v0ILsQcm4QR2guPJ1eJMvmCBNe12y2H2lAyXn3nU0AN0
 tJGrCu6Il8I0AVw/nOmyr3lsBQOOKGv0KWJLVOPGrLgSYaZo/YvwSHwsX1OReTlB
 qMh5Zq+gzIRPIsCDy2F5Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1659112553; x=
 1659119753; bh=YWzd1M45UJ404WTbCsULbW4KUvX+gwYYJ16acMe7FbA=; b=y
 r0ThaqJ/KJUkyoGPxyMP1PzOWIyvCPqanUCJ21AEWpRAPqWZjxcEVkRd/Rw+8efu
 riKGHAFPbHtiFGeDXXFraXWK8qP7WqpP56NTy1+AU8keJ2tKTUwwK8wFm78QVulr
 HEeULZTwMlKeDbhATRz6laOo73pw+2Jyy4LiwfP3DkMOgBw0qBEi9n/xJmbLkjsA
 j0ppPjjJbYRnN/iG7+LbCYhJWtryIG6zkcYeocUWDXFd5qfb7ZNvlvjRLh+6Jf0x
 Nf89bZDGsdSViQgrj+Xgop2nHYbin+yaCP93DtCZwyKbc6LgTTKzYpTMnJxDZdU6
 Vr8qvsYtmAJhs4dsLwswA==
X-ME-Sender: <xms:aQzkYqyC1xDGZK3BwkAWRwR4yFdftXfR9E4su9MA_MQZr_MK_VpCiA>
 <xme:aQzkYmRHr7EeEUnInUMxc73lZRvwIuhohC5_rdfi-zY1ubjEzTYM2Yarba-kLjn9G
 KQ_O_SF8PSa3ngKDfA>
X-ME-Received: <xmr:aQzkYsWVVaHjlYnZXpKhJLTXXpLLFbgw5rv4W6-j43PK1zdHFPH5_pe0a6z1wjrIZ6oMd2bco702e5lmtus>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrvddujedguddtgecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpefhvfevufffkffojghfgggtoffgsehtkeertdertdejnecuhfhrohhmpefo
 rgigihhmvgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecugg
 ftrfgrthhtvghrnhepgfffgfetffduudelhfevieffffduleevgfegkeeutefgffejheel
 leekjeefhfejnecuvehluhhsthgvrhfuihiivgepudenucfrrghrrghmpehmrghilhhfrh
 homhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:aQzkYggvf8ILTAkDv2QiqBE2OmHdAbkDsEiREydkkFR1GTkPoTRG4Q>
 <xmx:aQzkYsD6C5yIq-mdRxBQsBWTms7LgsklydXDAboZwJyIK-K7R_FbZg>
 <xmx:aQzkYhLgSF4Uh_YzGhlcS8kUiGhjMtKZzG_SZ-OLcoxOBI_peusljg>
 <xmx:aQzkYmy-G10uTbxQJwab9pMO_--EEeZZZ8DN6sdU-_ZFExFe1IQPfA>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 29 Jul 2022 12:35:52 -0400 (EDT)
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
Subject: [PATCH v1 07/35] drm/modes: Only consider bpp and refresh before
 options
Date: Fri, 29 Jul 2022 18:34:50 +0200
Message-Id: <20220728-rpi-analog-tv-properties-v1-7-3d53ae722097@cerno.tech>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220728-rpi-analog-tv-properties-v1-0-3d53ae722097@cerno.tech>
References: <20220728-rpi-analog-tv-properties-v1-0-3d53ae722097@cerno.tech>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Mailer: b4 0.10.0-dev-49460
X-Developer-Signature: v=1; a=openpgp-sha256; l=1546; i=maxime@cerno.tech;
 h=from:subject:message-id; bh=0dDWMayp8tTv4iediPV+Th9ldEA0clkjbey5Bc39YFo=;
 b=owGbwMvMwCHc4XzqmfnC7acZT6slMSQ94VHS+bvy0CbL/BcxfRX31OoO3U4T3Ml02bK8bFFfv9S+
 XO7rHaUsDMIcDLJiiizXBd/a8YVFuUXwfNgMM4eVCWQIAxenAExEejnD/wzjHzrzmEKfOfJu33CgXv
 tcKNutvdPr/ooX97F1a82fNZ2R4bNJTO9KrViujNObVlv/4N0y7Vu66nXjiZ2hB2K852S5/QQA
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

Some video= options might have a value that contains a dash. However, the
command line parsing mode considers all dashes as the separator between the
mode and the bpp count.

Let's rework the parsing code a bit to only consider a dash as the bpp
separator if it before a comma, the options separator.

A follow-up patch will add a unit-test for this once such an option is
introduced.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>

diff --git a/drivers/gpu/drm/drm_modes.c b/drivers/gpu/drm/drm_modes.c
index a4c1bd688338..06a006e0b2e3 100644
--- a/drivers/gpu/drm/drm_modes.c
+++ b/drivers/gpu/drm/drm_modes.c
@@ -1819,20 +1819,22 @@ bool drm_mode_parse_command_line_for_connector(const char *mode_option,
 
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
b4 0.10.0-dev-49460
