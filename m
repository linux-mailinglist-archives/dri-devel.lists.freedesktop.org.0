Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C7C45FDA81
	for <lists+dri-devel@lfdr.de>; Thu, 13 Oct 2022 15:21:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C864810E8DD;
	Thu, 13 Oct 2022 13:19:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new3-smtp.messagingengine.com (new3-smtp.messagingengine.com
 [66.111.4.229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9132710E8B4;
 Thu, 13 Oct 2022 13:19:25 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.nyi.internal (Postfix) with ESMTP id EE364580363;
 Thu, 13 Oct 2022 09:19:24 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Thu, 13 Oct 2022 09:19:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm3; t=1665667164; x=
 1665674364; bh=k4mI+P2Uyj6hcgKCV+eHrMM/leiBXfvlbKoa1CrN44E=; b=F
 tiUZ96YwkM0Dedam2hB7Ys+spk+aqEPjk3ciJax3b8ly83/m0/VtCJzg3sZBzGxR
 pgASR+AMlDqpWjkIaOmwLqOJqG3CClJLpM+ruWIkmyjg1JRdLwEWMXYTGkTta7a5
 jI8WdKF7FxOT744h/AzM/GwFEX6H1ro7s2GJbhzlVLMkHa5KaUaEwmxC6y95fGLJ
 E/QlSZMH7Z0mkyQCHdVOv6QSS3NDkdFFOF/OoJsDPQpKG+UCj2H1ynP4nzbgB7VH
 P+eRVdwSfkxbUCljhhdq89rM+sX/g1ZzeyYTXmNBuvr+lLq4I8N44m+uHAfafnfG
 hJknCwyfeN6kBara3hhBw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1665667164; x=
 1665674364; bh=k4mI+P2Uyj6hcgKCV+eHrMM/leiBXfvlbKoa1CrN44E=; b=W
 muPsotoCbS7SYVp0XvvLS/20g9LNDrTNKrCWn5S3Xz7CpTan4UYw+MiCEEmSFe6K
 YsXjKrhJNF6hnRS0OMrw2no0CyjXBOmiUSwawt3KcfacIMBH91VaaoEtGrdi6GJp
 1fJwoPykL6M4x6asRxgpt/2Ehfs+GONyhqNsSBcHSy5qAgfSj/LrOG/pTl4Dq6rd
 IbbzCdhFWi/rG3MSaVe7w+vXieq6upFF1Q48/e9NUy/OrNBgL4J2ebviaiH6PFOk
 IOWF5351f7fqC7Mfr1y1Ss22AbQi/Etoe7KnteGXj/SDoVhQzzKiCRyh+xUqWeSo
 EKcjFjy/LwHvJjJQxg2qg==
X-ME-Sender: <xms:XBBIY5coehT_0QSEZjyCECDv3S4lRE0YgTCbdKn658wY3WMTk6GRAA>
 <xme:XBBIY3MOpR2trYquItaN-MTFrDaBNlw3FUNeMyinnjdjjcx7WPW6FNT2Q5lfZzf_W
 lAIeg3rCXstis-6obA>
X-ME-Received: <xmr:XBBIYyjRpu0yqJtyXaZU1gzPBm9XsjkrPvM0T290T1i5h_cQRi81FtmJAH2T4oh1NdUveivzoJDYJyf2EIJbJkP0xXDn0AqL99Cd>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrfeektddgieehucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephfffufggtgfgkfhfjgfvvefosehtkeertdertdejnecuhfhrohhmpeforgig
 ihhmvgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrf
 grthhtvghrnhepudduudfhveejteefgedvffdvvedvjedugedukeejhedtlefhffevtefh
 jeeltdevnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
 epmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:XBBIYy9qtNW3-0Y5Ly1e0NImShnv7r6-nLrU9txIa5O2R3D-KtVfIg>
 <xmx:XBBIY1s0z_Zsv53gBeXan2rpZIezI85FUNLkCqrw1waBFB223zR-wA>
 <xmx:XBBIYxGpDe4BNYaCCY9FC6SEo_xsd8bKMsXtqQC7gOVpmPl2uMdZBw>
 <xmx:XBBIY25aCTFEeg7FU-EOAOqFHxxAAFfUMqcAG7nDTMtSTPephZCtTQ>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 13 Oct 2022 09:19:24 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
Date: Thu, 13 Oct 2022 15:18:53 +0200
Subject: [PATCH v5 09/22] drm/modes: Switch to named mode descriptors
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20220728-rpi-analog-tv-properties-v5-9-d841cc64fe4b@cerno.tech>
References: <20220728-rpi-analog-tv-properties-v5-0-d841cc64fe4b@cerno.tech>
In-Reply-To: <20220728-rpi-analog-tv-properties-v5-0-d841cc64fe4b@cerno.tech>
To: Karol Herbst <kherbst@redhat.com>,
 Jani Nikula <jani.nikula@linux.intel.com>, 
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 David Airlie <airlied@linux.ie>, 
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Lyude Paul <lyude@redhat.com>, Maxime Ripard <mripard@kernel.org>, 
 Emma Anholt <emma@anholt.net>, Chen-Yu Tsai <wens@csie.org>,
 Samuel Holland <samuel@sholland.org>, 
 Ben Skeggs <bskeggs@redhat.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>
X-Mailer: b4 0.11.0-dev-7da52
X-Developer-Signature: v=1; a=openpgp-sha256; l=1729; i=maxime@cerno.tech;
 h=from:subject:message-id; bh=59DgDb/G3ltKD7zwB3OQQJ/5jkTCTY8o4hInxsXZAc0=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDMkeAm7l+1XCP1rOe2Qwz/n0oS+u6/K/+XnefxZySu3qjYY/
 BuFnO0pZGMS4GGTFFFlihM2XxJ2a9bqTjW8ezBxWJpAhDFycAjARTnlGhhMPbE+LPHjFe9GFfcVhEf
 /Hko33zz98v/uKT/Xq9aE/ZM4zMvQpPeO5oSjxeotid2Pwz/3iUu9Zox7utnGt3tnWuGnOaR4A
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

The current named mode parsing relies only the mode name, and doesn't allow
to specify any other parameter.

Let's convert that string list to an array of a custom structure that will
hold the name and some additional parameters in the future.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/drm_modes.c | 17 +++++++++++------
 1 file changed, 11 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/drm_modes.c b/drivers/gpu/drm/drm_modes.c
index 2f020ef2ddf2..7ed3fb839db7 100644
--- a/drivers/gpu/drm/drm_modes.c
+++ b/drivers/gpu/drm/drm_modes.c
@@ -2224,9 +2224,13 @@ static int drm_mode_parse_cmdline_options(const char *str,
 	return 0;
 }
 
-static const char * const drm_named_modes_whitelist[] = {
-	"NTSC",
-	"PAL",
+struct drm_named_mode {
+	const char *name;
+};
+
+static const struct drm_named_mode drm_named_modes[] = {
+	{ "NTSC", },
+	{ "PAL", },
 };
 
 static int drm_mode_parse_cmdline_named_mode(const char *name,
@@ -2262,14 +2266,15 @@ static int drm_mode_parse_cmdline_named_mode(const char *name,
 	 * We're sure we're a named mode at that point, iterate over the
 	 * list of modes we're aware of.
 	 */
-	for (i = 0; i < ARRAY_SIZE(drm_named_modes_whitelist); i++) {
+	for (i = 0; i < ARRAY_SIZE(drm_named_modes); i++) {
+		const struct drm_named_mode *mode = &drm_named_modes[i];
 		int ret;
 
-		ret = str_has_prefix(name, drm_named_modes_whitelist[i]);
+		ret = str_has_prefix(name, mode->name);
 		if (ret != name_end)
 			continue;
 
-		strcpy(cmdline_mode->name, drm_named_modes_whitelist[i]);
+		strcpy(cmdline_mode->name, mode->name);
 		cmdline_mode->specified = true;
 
 		return 1;

-- 
b4 0.11.0-dev-7da52
