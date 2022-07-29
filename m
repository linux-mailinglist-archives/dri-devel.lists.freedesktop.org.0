Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 700AA5853D6
	for <lists+dri-devel@lfdr.de>; Fri, 29 Jul 2022 18:46:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9BE4411260F;
	Fri, 29 Jul 2022 16:46:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new4-smtp.messagingengine.com (new4-smtp.messagingengine.com
 [66.111.4.230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E25E10F72E
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Jul 2022 16:45:49 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailnew.nyi.internal (Postfix) with ESMTP id 6BA35580942;
 Fri, 29 Jul 2022 12:36:06 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Fri, 29 Jul 2022 12:36:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm2; t=1659112566; x=
 1659119766; bh=xVYLKG9KFFYmuOaTAKRLm+p8P7z09nrupInjkJzNlvg=; b=p
 eGkvPp9VkszCbBMSvqhe2K521WOU5cEUHToD9XxGzIfDWbJJPr+H6dqaUzk9G1cD
 b+08PM7zxoIsqqCRGLR/+8JyZo7zz6gfIC9xafnA8b43D8b0P676C9/mvdSWwUhs
 aLkF29Fx77MbrU9rlTgCTmKH+1P7yKWYEnn9KVOxM+uGkY2IoDonvMIwEBaP5PDS
 81X3ki1IHhB5/j4yJNDCZkFI1SAiPHDGlhgCy04HWUYpPZI0Dtd/ebYaVH68rnI0
 BPRidxXjFSG8Wr3nj1KBE0j8xzoZ1M/y1EXVAyomt6GrZbNd1edgUKsoibSys3Js
 /tFDmLl6UiTlh5ad5u01g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1659112566; x=
 1659119766; bh=xVYLKG9KFFYmuOaTAKRLm+p8P7z09nrupInjkJzNlvg=; b=1
 D201QYH+jhj5T7xGEgRqCS2cA0hqz3QnILFtJywMR6tcMSnaMUNqJVTnSMxZqoym
 76NEZOpWqd1ED/RqqPj/570LsmIdurCy5MfUNPPVPscoUNQyKJv9hdsekYMOd7Oo
 EWTMyenmGaPtXNCn7zp4WbNAWijODYgqbyiDOtquvbEkMdrH3thr8Zd7ltQFBo/k
 mKMrTy6nP/ZRA38kysqG8lX2ujjF5UDO1idAZOlO5SWTjcY4E4EyMGBvLzvRwVom
 EM8zVhrXQ5N1/nL0gxSmTtOsKcxmZbYxEcXK5Z+grTPSC0MQ6xkJnsj+h/dlYxIs
 0Pe1Q4po+xlRn9Ggwv+JQ==
X-ME-Sender: <xms:dgzkYk2BMFe6IlW7XEWt9Zd1PCm0fv3U6QdsTSEG0ehKJBRnN4S1hg>
 <xme:dgzkYvFXxPQAhxukA0ojKdCe600G3cDPLeF0OH-NbOAtT1Nb4OIK_htrbd0HdXTNv
 BTCOLeZST4sojAwkKY>
X-ME-Received: <xmr:dgzkYs5PKKYXyOW5OczTsWLN7AD8q3DHaYQdWDtUzy36lnEg2QPaHZmbMbSRLhQhipVd_6UHS6hTzRAygm0>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrvddujedguddtgecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpefhvfevufffkffojghfgggtoffgsehtkeertdertdejnecuhfhrohhmpefo
 rgigihhmvgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecugg
 ftrfgrthhtvghrnhepgfffgfetffduudelhfevieffffduleevgfegkeeutefgffejheel
 leekjeefhfejnecuvehluhhsthgvrhfuihiivgepudenucfrrghrrghmpehmrghilhhfrh
 homhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:dgzkYt16qHHK42HYu-VGLpBImaQ0ithtjM2up0DB0OuxBKo1y9YZHQ>
 <xmx:dgzkYnGiHunAAId1ZKwS4edR-O2_CtVLKT6FHqk3kcCPEzwkr2Qvog>
 <xmx:dgzkYm9MDwent-LImtPSrE4DwzIN32_CGylVWzo-Pn_KOGDHETcYlw>
 <xmx:dgzkYvUwKZYvB5olNpS7zIbdX2MkPT76qllhGq4ywK7PSVNtfTpQjA>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 29 Jul 2022 12:36:05 -0400 (EDT)
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
Subject: [PATCH v1 11/35] drm/modes: Fill drm_cmdline mode from named modes
Date: Fri, 29 Jul 2022 18:34:54 +0200
Message-Id: <20220728-rpi-analog-tv-properties-v1-11-3d53ae722097@cerno.tech>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220728-rpi-analog-tv-properties-v1-0-3d53ae722097@cerno.tech>
References: <20220728-rpi-analog-tv-properties-v1-0-3d53ae722097@cerno.tech>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Mailer: b4 0.10.0-dev-49460
X-Developer-Signature: v=1; a=openpgp-sha256; l=1439; i=maxime@cerno.tech;
 h=from:subject:message-id; bh=NWuztsnfEBMwtrwGZAZ89RBSXbuMUAK6h8TPssl7ueY=;
 b=owGbwMvMwCHc4XzqmfnC7acZT6slMSQ94VFatr10tcm+HI8krRuTQr8mfAkyKmqcsXSbdwP31w2/
 Y08UdpSyMAhzMMiKKbJcF3xrxxcW5RbB82EzzBxWJpAhDFycAjCR/YcZGR7ppvMEqYY8j2Pa/WDVgf
 lCS/ZWCwarVn+adbx93vncny8YGWa5Bx3lusat82xuXLT5NsZ/P2LCRU37244JmZ0wnDn9SBUA
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

The current code to deal with named modes will only set the mode name, and
then it's up to drivers to try to match that name to whatever mode or
configuration they see fit.

The plan is to remove that need and move the named mode handling out of
drivers and into the core, and only rely on modes and properties. Let's
start by properly filling drm_cmdline_mode from a named mode.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>

diff --git a/drivers/gpu/drm/drm_modes.c b/drivers/gpu/drm/drm_modes.c
index 1421e5da49e0..78ea520f2822 100644
--- a/drivers/gpu/drm/drm_modes.c
+++ b/drivers/gpu/drm/drm_modes.c
@@ -1770,11 +1770,12 @@ static int drm_mode_parse_cmdline_options(const char *str,
 
 struct drm_named_mode {
 	const char *name;
+	const struct drm_display_mode *mode;
 };
 
 static const struct drm_named_mode drm_named_modes[] = {
-	{ "NTSC", },
-	{ "PAL", },
+	{ "NTSC", &drm_mode_480i, },
+	{ "PAL", &drm_mode_576i, },
 };
 
 static bool drm_mode_parse_cmdline_named_mode(const char *name,
@@ -1792,6 +1793,9 @@ static bool drm_mode_parse_cmdline_named_mode(const char *name,
 			continue;
 
 		strcpy(cmdline_mode->name, mode->name);
+		cmdline_mode->xres = mode->mode->hdisplay;
+		cmdline_mode->yres = mode->mode->vdisplay;
+		cmdline_mode->interlace = !!(mode->mode->flags & DRM_MODE_FLAG_INTERLACE);
 		cmdline_mode->specified = true;
 
 		return true;

-- 
b4 0.10.0-dev-49460
