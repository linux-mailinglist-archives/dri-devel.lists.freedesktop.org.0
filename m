Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1889661F576
	for <lists+dri-devel@lfdr.de>; Mon,  7 Nov 2022 15:18:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F60110E344;
	Mon,  7 Nov 2022 14:17:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew2-smtp.messagingengine.com (wnew2-smtp.messagingengine.com
 [64.147.123.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1BF1A10E331;
 Mon,  7 Nov 2022 14:17:34 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailnew.west.internal (Postfix) with ESMTP id 54CB12B066F5;
 Mon,  7 Nov 2022 09:17:31 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Mon, 07 Nov 2022 09:17:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm2; t=1667830650; x=
 1667837850; bh=yoj5WKvcN+DitFS3PC/brG0rlVlDPy2pHx+FgtWCUOQ=; b=F
 4yMM16gNESoKQxrnq06Wlr9Vne62jGwIu3bpBYF2RiZ7tjGsgy7WUUQed+aA/0W3
 qQ2MpC+KD7f9Bt3/VRLYVqNaUxOo4+0U93Or63Lx5tn6B5JzIODWmNwLjv+jawFM
 VrfREupvUX0DPB0bQuLlaZ9qmCmycKljp7uu1pYxHZwAN4MhQE5i6VN44pui4BAX
 KGl3rY2GrrT+fYSwx1OD34jQEvxZQ42bOdfbLlyDlJfZ4pb4tsPD6qM2au3cbGFN
 QcGWyHjztiHr9g/Uh0yHmnZ28u6Z2+iPHjBhtihE8gl7mM3je7ldqFcpEk0HKkJE
 xBH2eHEYrtJDNe4al/GKA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1667830650; x=
 1667837850; bh=yoj5WKvcN+DitFS3PC/brG0rlVlDPy2pHx+FgtWCUOQ=; b=a
 Um4mBk/m1lnzZ+IBrWdO75uNC8APlMQ2D0NmyPv0XrimHhK1oezgifDjKnyn7RHk
 MLtX7lDVKOw5QG3WVI+wMSL/sWQSLgNWUkifAEhxqBkuGSZw2aaNDFp/GN0G54sZ
 ZqKLBE5Vz81CM4I2UvIpqo14ednf8a17f0HdXPLW1QSb2wRWZ3POOzK/jrlE15t5
 G5J9DULRp+bnlcDbT54vo7Xcp1+X2OHJVUk/BQOEnkW6ZSy/opYYlKp0y+tera47
 tsUhy190O5sj1t+H8Fqd5vt9ORB/OFR7OG1fa6etoCYmwZ7hVsLX03coL8Kg6rjo
 MEYFF2xHQWiK++zGn3R6g==
X-ME-Sender: <xms:ehNpY5GVISvmy2yDySD-O6cu6BUoWYC_U07zkkMqsSV34rugluwm4w>
 <xme:ehNpY-UQT3Gmja3T6IOAuKHF2-tLs0z0bZL9YXvDp6JS_8CIUAcSrOwrdmDxHwAdi
 NqNtoi2GWTVomE2wCg>
X-ME-Received: <xmr:ehNpY7JHVGj3-7c9XT_BngysD_F4bBbQAQ5usuSQw8gdc8CdCitVpS3bjM-HObJyGwxfzF_y51wkTqSNWtOX1K_oomyj54sbC3bGRWl2W7Y0SQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvgedrvdekgdeiudcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhfffuggfgtgfkfhgjvfevofesthekredtredtjeenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpedvgfevjefhtdetveevhfelieeuueetgfdvgeevkeegudejffegfffgtedt
 leelhfenucevlhhushhtvghrufhiiigvpedunecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:ehNpY_HeR92zwfA--DgafOtkRAr2Dbh1dm3RlVSXw0_aCZiOfeUC4w>
 <xmx:ehNpY_U2VopXa7XtFHzoJCACcllPGGbVqGkXxXH0KkE7ASOusDdKbA>
 <xmx:ehNpY6Mg2PxMVPfIFOSIe-kF08QDLdbxNgvb66qo88bHhuZYGeOX3A>
 <xmx:ehNpY5hM151avKBrw6BtrRuTknHfxTigN8ySD6_peqOHcaMqQtD0A5VuSYE>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 7 Nov 2022 09:17:30 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
Date: Mon, 07 Nov 2022 15:16:37 +0100
Subject: [PATCH v7 11/23] drm/connector: Add pixel clock to cmdline mode
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <20220728-rpi-analog-tv-properties-v7-11-7072a478c6b3@cerno.tech>
References: <20220728-rpi-analog-tv-properties-v7-0-7072a478c6b3@cerno.tech>
In-Reply-To: <20220728-rpi-analog-tv-properties-v7-0-7072a478c6b3@cerno.tech>
To: Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, 
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Ben Skeggs <bskeggs@redhat.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Samuel Holland <samuel@sholland.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Emma Anholt <emma@anholt.net>, Karol Herbst <kherbst@redhat.com>, 
 Daniel Vetter <daniel@ffwll.ch>, Chen-Yu Tsai <wens@csie.org>,
 Lyude Paul <lyude@redhat.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>
X-Mailer: b4 0.11.0-dev-99e3a
X-Developer-Signature: v=1; a=openpgp-sha256; l=2306; i=maxime@cerno.tech;
 h=from:subject:message-id; bh=5aHCX2d0S94yyJeG+Ur00vibzmjncq+gbdTOB8Bo01E=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDMmZwg6/ZdpMwvc5vtVXfOdQ+zv3qdW0P9fF3ct1O/QmuWTs
 KNDvKGVhEONikBVTZIkRNl8Sd2rW6042vnkwc1iZQIYwcHEKwES4vzMy3Dl7dkr8x9Pqs8Tl/4jrnl
 3+74qW8pSjs/3dHMOm/JNwcWf4n/qsZrvvKu8JGT/MOKeJzdfObbp956NxwvcsmY+Xd8+5wQ0A
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

We'll need to get the pixel clock to generate proper display modes for
all the current named modes. Let's add it to struct drm_cmdline_mode and
fill it when parsing the named mode.

Reviewed-by: Noralf Trønnes <noralf@tronnes.org>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>

---
Changes in v7:
- Add Noralf Reviewed-by:w
---
 drivers/gpu/drm/drm_modes.c | 9 ++++++---
 include/drm/drm_connector.h | 7 +++++++
 2 files changed, 13 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/drm_modes.c b/drivers/gpu/drm/drm_modes.c
index acee23e1a8b7..c826f9583a1d 100644
--- a/drivers/gpu/drm/drm_modes.c
+++ b/drivers/gpu/drm/drm_modes.c
@@ -2226,22 +2226,24 @@ static int drm_mode_parse_cmdline_options(const char *str,
 
 struct drm_named_mode {
 	const char *name;
+	unsigned int pixel_clock_khz;
 	unsigned int xres;
 	unsigned int yres;
 	unsigned int flags;
 };
 
-#define NAMED_MODE(_name, _x, _y, _flags)		\
+#define NAMED_MODE(_name, _pclk, _x, _y, _flags)	\
 	{						\
 		.name = _name,				\
+		.pixel_clock_khz = _pclk,		\
 		.xres = _x,				\
 		.yres = _y,				\
 		.flags = _flags,			\
 	}
 
 static const struct drm_named_mode drm_named_modes[] = {
-	NAMED_MODE("NTSC", 720, 480, DRM_MODE_FLAG_INTERLACE),
-	NAMED_MODE("PAL", 720, 576, DRM_MODE_FLAG_INTERLACE),
+	NAMED_MODE("NTSC", 13500, 720, 480, DRM_MODE_FLAG_INTERLACE),
+	NAMED_MODE("PAL", 13500, 720, 576, DRM_MODE_FLAG_INTERLACE),
 };
 
 static int drm_mode_parse_cmdline_named_mode(const char *name,
@@ -2282,6 +2284,7 @@ static int drm_mode_parse_cmdline_named_mode(const char *name,
 			continue;
 
 		strcpy(cmdline_mode->name, mode->name);
+		cmdline_mode->pixel_clock = mode->pixel_clock_khz;
 		cmdline_mode->xres = mode->xres;
 		cmdline_mode->yres = mode->yres;
 		cmdline_mode->interlace = !!(mode->flags & DRM_MODE_FLAG_INTERLACE);
diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h
index 9afc7956fdc6..4927dcb2573f 100644
--- a/include/drm/drm_connector.h
+++ b/include/drm/drm_connector.h
@@ -1273,6 +1273,13 @@ struct drm_cmdline_mode {
 	 */
 	bool bpp_specified;
 
+	/**
+	 * @pixel_clock:
+	 *
+	 * Pixel Clock in kHz. Optional.
+	 */
+	unsigned int pixel_clock;
+
 	/**
 	 * @xres:
 	 *

-- 
b4 0.11.0-dev-99e3a
