Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A118B5E6558
	for <lists+dri-devel@lfdr.de>; Thu, 22 Sep 2022 16:27:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1ED2D10EB8F;
	Thu, 22 Sep 2022 14:27:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew4-smtp.messagingengine.com (wnew4-smtp.messagingengine.com
 [64.147.123.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA6C010EB8C;
 Thu, 22 Sep 2022 14:27:36 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailnew.west.internal (Postfix) with ESMTP id 7459D2B05B2B;
 Thu, 22 Sep 2022 10:27:33 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute3.internal (MEProxy); Thu, 22 Sep 2022 10:27:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm2; t=1663856852; x=
 1663864052; bh=2J8ePPZWtgHL+Hggk4tVDJx1sG6hl+uFivM/ERtqGsg=; b=3
 mDNWZNIe3DDqHKKg9XVsm47n7p8liMzAERITZAhAD7Jtv66VpdBtwazK/jqjmrjP
 Ab+FQLr0JB8CuHEhaMrD+73mSYZ+t2Qf3HM7eNaM2xpnWQEuqq3yAVDm19GFDdh+
 WIU+Sys7mUeYoscOsdgvU826AaBhj6tk2jexZSRCf8owvzPCqcodoOiuDMT4dhyr
 xpeF7G3b90I0IyjnwqvEhQehpHmpj7IZv+19frAVFx5yBUCTf2Yd+dKrNTF83OVR
 qpYIwXRNJWS8p8XlB9e4oRCjYA85XUr0JIOLZmdqertSp4oUmTvZBdSMf6CquSMy
 ZX7PawU65R36uriF/rmwg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1663856852; x=
 1663864052; bh=2J8ePPZWtgHL+Hggk4tVDJx1sG6hl+uFivM/ERtqGsg=; b=I
 xCAkikURCXPNtPe/OFLT/L8HOGuOt9N7gxlGwiYeQ5Pe4Zo5nVpiemzlw29eCoMx
 rcIulxLP8ndPULBs00x2T7ZvJykYH/k22PY7CGbVMSYbxvDdQX3aPChv3+l70lSH
 M5u6erWvTI50ND20z1m++SJGV4j2fI/YSWk5MMGNI56DCP1MBVch3D2u5Obi+3eW
 hLg/JpqqLFhV5TzCfM9KQG8a+JGdKfunrY5qKrlirdVPOSKrO1zxKm9qb+JzkXqx
 Ubg1dPT4A9Y5vY+BM1fdOy7PUjapsRlIj2HyoWfUeBThJ+tH61/sPtUZplwSitrA
 HrAQSFho2nKAvNsLpInJA==
X-ME-Sender: <xms:1HAsY4U0HWCzsVjyLqmYWyXiMvIYSpcgvMIS3rHBHznVUge0hLcD6w>
 <xme:1HAsY8n2MDLlKFzOCNMs1YNwL3hhLGH8XlVU73INAjcEiDkaUrvrOpZ8SEfKo3Bye
 Hkp5jJXXPQKME172aw>
X-ME-Received: <xmr:1HAsY8YBPiPmRfbLRAKJNzy7_hOH4GOxwaXretFnEuOveMCRSTlfB2tDIgc>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrfeefgedgudejucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephfffufggtgfgkfhfjgfvvefosehtkeertdertdejnecuhfhrohhmpeforgig
 ihhmvgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrf
 grthhtvghrnhepudduudfhveejteefgedvffdvvedvjedugedukeejhedtlefhffevtefh
 jeeltdevnecuvehluhhsthgvrhfuihiivgepvdenucfrrghrrghmpehmrghilhhfrhhomh
 epmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:1HAsY3URalKFpRnDUGq_lMRPswHHdksPFXZBW3AKCIuDOYQCIeGtbA>
 <xmx:1HAsYylR-CzYooBbtPlEjXDv7_ZhN5RfPZC0lbOzmi5A0q0ypS--jQ>
 <xmx:1HAsY8cAWB-BJesrYogyAZLkIimG4qZSfq-w0_DV5-HEzTuYjw_Pqg>
 <xmx:1HAsY-xNlJQnKFbg288rcARu1mkQBKOHZ6JOhxgpQjbBJfuom9bWzdOxxZM>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 22 Sep 2022 10:27:31 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
Date: Thu, 22 Sep 2022 16:25:34 +0200
Subject: [PATCH v2 17/33] drm/modes: Bail out of named mode parsing early if
 it's an option
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20220728-rpi-analog-tv-properties-v2-17-f733a0ed9f90@cerno.tech>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1102; i=maxime@cerno.tech;
 h=from:subject:message-id; bh=hUcbhwJ9DBy9NDrshDAAcggJzHGewykANY8cYFaxCfU=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDMk6BYGvwz9JBsU1OMkff7fXYf3G8Omz2y6rsMtblO7ZEiBz
 ckVNRykLgxgXg6yYIkuMsPmSuFOzXney8c2DmcPKBDKEgYtTACYSO4WRoe/GFdmGNA2FT4KPznq/0D
 ljVLZy3fz/L9NymZU+hs9aIs3wT+X5IkPpRWF/n0Ss2m/+6Lg622/jlxEzXv6pUJnD/nztTRYA
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

The name we are given is the first part of the command line split at a
comma.

We can thus be called in two cases, either we are parsing a (named?)
mode, before the optional part separated by a comma, or we never had a
mode specified but only options.

Options use the equal sign as separator between the name and its value,
so if we ever find an equal sign in our string, we can bail early since
we never had a mode to parse.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>

diff --git a/drivers/gpu/drm/drm_modes.c b/drivers/gpu/drm/drm_modes.c
index ede5b094da4c..dc5d5bdbea7a 100644
--- a/drivers/gpu/drm/drm_modes.c
+++ b/drivers/gpu/drm/drm_modes.c
@@ -2242,6 +2242,13 @@ static int drm_mode_parse_cmdline_named_mode(const char *name,
 	if (isdigit(name[0]))
 		return 0;
 
+	/*
+	 * If there's an equal sign in the name, the command-line
+	 * contains only an option and no mode.
+	 */
+	if (strnchr(name, name_end, '='))
+		return 0;
+
 	/*
 	 * We're sure we're a named mode at that point, iterate over the
 	 * list of modes we're aware of.

-- 
b4 0.10.0
