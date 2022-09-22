Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 28F815E6566
	for <lists+dri-devel@lfdr.de>; Thu, 22 Sep 2022 16:28:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 25D3810EB91;
	Thu, 22 Sep 2022 14:28:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew4-smtp.messagingengine.com (wnew4-smtp.messagingengine.com
 [64.147.123.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1921E10EB9D;
 Thu, 22 Sep 2022 14:27:59 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailnew.west.internal (Postfix) with ESMTP id CCC942B05B34;
 Thu, 22 Sep 2022 10:27:55 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Thu, 22 Sep 2022 10:27:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm2; t=1663856875; x=
 1663864075; bh=LNibWIZ1W4oFh1EO7hNOkEOkBr+JL3i1WQh0c1QOIds=; b=E
 qjXHEhfsFJxGnXzlHxs8AGJ/IGlCJ4Je9Vkaw37k4eA97mPZkneMuA8RWDB3HH+i
 MZwBj14i91lWLB07WX/zewgpoAslc0LPsYk4z3vY/zdYB4zhW+MkVl9k/bUIvwnN
 yrCyQYCggzoQ3BVV835DLVI7j3GsW70l7i+5Yi38mQNTXhZ6PokB80LLNyMyUl3P
 0ialxYVCoDahe0/hZ0OSP/LB3t4SEp4jc0eic58DKQZzcxahSenn2ozbI5vJqcxx
 bHiUgi9eyZHLmlQOrxrh+vu8M13V5qpObxyoUO3kOfbgjwNLFbteJQvFYzZEmovd
 CAJHzGPBCpaW/yjMjUz5Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1663856875; x=
 1663864075; bh=LNibWIZ1W4oFh1EO7hNOkEOkBr+JL3i1WQh0c1QOIds=; b=F
 sWV473P8NYYQexGGABI/U0cKKIraWEr2rHvc+4mg4mpibxWI9MR7dEVOoyx9RmQV
 lqaONiY4JsGgOGv0YMEuhBWmK0HUWAXOZnv7X+QpgOp0ZG/kQqbDD3jCOQ/SjATz
 mcgkukz3WBbtMKaPXGHVIFiidpDXSH7UIkQWQA8Q4RgRE7r+g6T5kxsjdQw8ttSn
 i7ODyW2dbuXMZ2srWgYmwO9Q0VrLmOkfroLAaw2tyKKc7gQ5rWd5gyWu9kYtXpJh
 A4BYfEhRlP7rcCxurB1KUP3Cr5HszCE9q/Fk0F16WxVwIYO2VXwCeWx8/cHX+6Mn
 hObr4pofH2E+uI6dpPaxQ==
X-ME-Sender: <xms:63AsY19_0E76Ei5jFOD7QlmWfc7zwgMwy-BIDC8y18ya-o7d-nWQjw>
 <xme:63AsY5uxv_a5_e9JYXjHjsdgHhlHn1Z5rue_oPbE5ItFjN05L6HSsPWinHWqnCBUQ
 hUxhNuqjO9-UAUrLsw>
X-ME-Received: <xmr:63AsYzA5dGW0Meq8GuMdb8wOiExJfgDOoZIbFrTCrgmCY1fHuHvJbpg9HXA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrfeefgedgudejucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephfffufggtgfgkfhfjgfvvefosehtkeertdertdejnecuhfhrohhmpeforgig
 ihhmvgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrf
 grthhtvghrnhepudduudfhveejteefgedvffdvvedvjedugedukeejhedtlefhffevtefh
 jeeltdevnecuvehluhhsthgvrhfuihiivgepfeenucfrrghrrghmpehmrghilhhfrhhomh
 epmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:63AsY5flADs2WKJxrI1DfBJDwEg5nRVwkp7GEFP2pm09UEkn5Yhp0w>
 <xmx:63AsY6MvH8O4etx7iCFBnb3XyKc6QSM4kuZxQcyyXOE7SUn7SUNgvg>
 <xmx:63AsY7lWPt6Ztlw42gkSyJtSghLYPy5eD07nNSYfgORyxXpf9rRlpA>
 <xmx:63AsY_Yei1-8zPRN3NbjiVzrFy4sACBsiHrTYxE8Ra-evuDcJ5kxCH4QRSY>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 22 Sep 2022 10:27:53 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
Date: Thu, 22 Sep 2022 16:25:37 +0200
Subject: [PATCH v2 20/33] drm/modes: Fill drm_cmdline mode from named modes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20220728-rpi-analog-tv-properties-v2-20-f733a0ed9f90@cerno.tech>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1635; i=maxime@cerno.tech;
 h=from:subject:message-id; bh=Vry5+OU4UmtPLlNtlWmlVT8AGNp67JVCIbgY1gO14o0=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDMk6BYGTBLVVDtizMWVdeij876WFp+gKK09OnYcs/uxpJWEx
 4TUdpSwMYlwMsmKKLDHC5kviTs163cnGNw9mDisTyBAGLk4BmMiTEob/iX8nJmuELX3kvey/LfPp0D
 VTCh/6MXwXn293TJxrq91kN0aGBo0SUYm+rXEuJ4v47hucixC2K5kcGCIf1CT7u/DFfxc2AA==
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

The current code to deal with named modes will only set the mode name, and
then it's up to drivers to try to match that name to whatever mode or
configuration they see fit.

The plan is to remove that need and move the named mode handling out of
drivers and into the core, and only rely on modes and properties. Let's
start by properly filling drm_cmdline_mode from a named mode.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>

diff --git a/drivers/gpu/drm/drm_modes.c b/drivers/gpu/drm/drm_modes.c
index 8c8b37ba37dc..5d8b6a0d96f3 100644
--- a/drivers/gpu/drm/drm_modes.c
+++ b/drivers/gpu/drm/drm_modes.c
@@ -2226,11 +2226,22 @@ static int drm_mode_parse_cmdline_options(const char *str,
 
 struct drm_named_mode {
 	const char *name;
+	unsigned int xres;
+	unsigned int yres;
+	unsigned int flags;
 };
 
+#define NAMED_MODE(_name, _x, _y, _flags)		\
+	{						\
+		.name = _name,				\
+		.xres = _x,				\
+		.yres = _y,				\
+		.flags = _flags,			\
+	}
+
 static const struct drm_named_mode drm_named_modes[] = {
-	{ "NTSC", },
-	{ "PAL", },
+	NAMED_MODE("NTSC", 720, 480, DRM_MODE_FLAG_INTERLACE),
+	NAMED_MODE("PAL", 720, 576, DRM_MODE_FLAG_INTERLACE),
 };
 
 static int drm_mode_parse_cmdline_named_mode(const char *name,
@@ -2275,6 +2286,9 @@ static int drm_mode_parse_cmdline_named_mode(const char *name,
 			continue;
 
 		strcpy(cmdline_mode->name, mode->name);
+		cmdline_mode->xres = mode->xres;
+		cmdline_mode->yres = mode->yres;
+		cmdline_mode->interlace = !!(mode->flags & DRM_MODE_FLAG_INTERLACE);
 		cmdline_mode->specified = true;
 
 		return 1;

-- 
b4 0.10.0
