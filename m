Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 01B195E6546
	for <lists+dri-devel@lfdr.de>; Thu, 22 Sep 2022 16:27:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A7A6210EB78;
	Thu, 22 Sep 2022 14:27:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew4-smtp.messagingengine.com (wnew4-smtp.messagingengine.com
 [64.147.123.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 12FAA10EB71;
 Thu, 22 Sep 2022 14:27:00 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailnew.west.internal (Postfix) with ESMTP id C6B0C2B05B1D;
 Thu, 22 Sep 2022 10:26:56 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Thu, 22 Sep 2022 10:26:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm2; t=1663856816; x=
 1663864016; bh=jwz+ufkNT4RwFC1qE/qYHHRxmTxaMQhMtKio8e8RCO4=; b=k
 WthkSxJGwTqg7B8UZr2QYekK9lNpVbE4mlgOABGJ2KwdF9xlPZ0Nn2sdcmqj1Y1J
 gxzr401RJvXFiyFySZZge17mhnsAc3vdADTj/F1hcQwcxum20fmcuPWsGNeHR++X
 800ftB6re853EZw4l1RNFKfq565umhMN2Vxi5DhzRcjJXVyYIax6/cdt4FikybDJ
 Zp76t6li/eiwvheS68Qh8TfORgTHE6S/oKtTb0vNkC3FP9vUtE6D+f7S7bD7PLqT
 h0JTQ/lhOONIWD8hnVBhwSyYRl4k5sAkNgKpv3lSprOW8IbQMFKM8zH997mQAmwB
 b3HmWuRApnr8DIc2gW1VQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1663856816; x=
 1663864016; bh=jwz+ufkNT4RwFC1qE/qYHHRxmTxaMQhMtKio8e8RCO4=; b=H
 z9aJWg7FxXEUG6ai7wCGhXtcH2Xfenpj8of/aSOzT9uxVt0gJrmGxxNCaqIecfJ4
 fd+isDf1c8v+WL9NrcuGGyfzE3RMAUQr9c1Wq5zAlRoW05X+JKIlji6m0FcF0EB9
 AxdWk+0fOrpfo7reDffuWCUcAbR0Tkhf/P9HKMmoMO+FJv8T2ZRkBuaLI/Pit365
 mlaFG/D+WKcuUsockm1EjqJXpaVbm2yqXtaFhZSH2J3fZkZlzd3+GQgIT1/CnT0P
 OkZeMGU2xzIjavmvdyhlvbEA7AmsXXG0/QQIR8Zm/z3d7P4gYJ5lYBKKsWuVak6i
 mdYWptg0BNWzcjsyU410Q==
X-ME-Sender: <xms:sHAsYzOCeg0tROaT_j6J3TdFnlCTfRoQztWe8kWJqgdm4FZMIgcaGw>
 <xme:sHAsY99dHVcIYv7Ql96I5swc5nSnfPXlll8j9EBS0iMImEdWNNEkdmKfm6hqwOr4K
 Ke5Gi4TRam199Ojy3A>
X-ME-Received: <xmr:sHAsYySqy1zTWOr2U45OOPkRe5vK7bRnXi29328MGLzGwXtRxv_YEStg4vk>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrfeefgedgudejucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephfffufggtgfgkfhfjgfvvefosehtkeertdertdejnecuhfhrohhmpeforgig
 ihhmvgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrf
 grthhtvghrnhepudduudfhveejteefgedvffdvvedvjedugedukeejhedtlefhffevtefh
 jeeltdevnecuvehluhhsthgvrhfuihiivgepudenucfrrghrrghmpehmrghilhhfrhhomh
 epmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:sHAsY3s1p9NMJuIGkJMuVfHb03s7JkAhTDg-odC44-a2-Id1JsCPyA>
 <xmx:sHAsY7cL5ottEd0zsapT-4QiPJb5XDgxQ1eXCt0rj_EGbYaItFv1oQ>
 <xmx:sHAsYz0DFD9W83eDRdT5O4OvuHGkogKtHkjMdWPfIsSzK7UTLRERxw>
 <xmx:sHAsYypV0nKUydVGyEcsWDEpzFprvzmJGnIi-cEDoFOVWkWe9_J4JzqNq0s>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 22 Sep 2022 10:26:55 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
Date: Thu, 22 Sep 2022 16:25:29 +0200
Subject: [PATCH v2 12/33] drm/modes: parse_cmdline: Add support for named modes
 containing dashes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20220728-rpi-analog-tv-properties-v2-12-f733a0ed9f90@cerno.tech>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1059; i=maxime@cerno.tech;
 h=from:subject:message-id; bh=Ce7gNsshIO6NX55u/tgmO2tT97mlvVnxqv2Q70Rq8gA=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDMk6BQGR2f6vTLfOce1Tf/c2YcfK1KDF6yLux0os9nn2V3yN
 W2NkRykLgxgXg6yYIkuMsPmSuFOzXney8c2DmcPKBDKEgYtTACYSm83wV5z//6Yip8nV7kuKeARWyx
 dpiOeXHrWP3smlt+da1oxPUowMz8z2PunkvRDE0H7h2rdLvJNlP72a8fxHrNJWm4Wff//UYQEA
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

From: Geert Uytterhoeven <geert@linux-m68k.org>

It is fairly common for named video modes to contain dashes (e.g.
"tt-mid" on Atari, "dblntsc-ff" on Amiga).  Currently such mode names
are not recognized, as the dash is considered to be a separator between
mode name and bpp.

Fix this by skipping any dashes that are not followed immediately by a
digit when looking for the separator.

Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
Reviewed-by: Hans de Goede <hdegoede@redhat.com>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>

diff --git a/drivers/gpu/drm/drm_modes.c b/drivers/gpu/drm/drm_modes.c
index 8742ee078fe6..a1964e08c38f 100644
--- a/drivers/gpu/drm/drm_modes.c
+++ b/drivers/gpu/drm/drm_modes.c
@@ -2284,6 +2284,8 @@ bool drm_mode_parse_command_line_for_connector(const char *mode_option,
 
 	/* Try to locate the bpp and refresh specifiers, if any */
 	bpp_ptr = strnchr(name, options_off, '-');
+	while (bpp_ptr && !isdigit(bpp_ptr[1]))
+		bpp_ptr = strnchr(bpp_ptr + 1, options_off, '-');
 	if (bpp_ptr)
 		bpp_off = bpp_ptr - name;
 

-- 
b4 0.10.0
