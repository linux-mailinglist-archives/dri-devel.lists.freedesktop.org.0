Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D474A61F578
	for <lists+dri-devel@lfdr.de>; Mon,  7 Nov 2022 15:18:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3156910E358;
	Mon,  7 Nov 2022 14:17:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew2-smtp.messagingengine.com (wnew2-smtp.messagingengine.com
 [64.147.123.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7706810E338;
 Mon,  7 Nov 2022 14:17:29 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailnew.west.internal (Postfix) with ESMTP id BA74D2B066F4;
 Mon,  7 Nov 2022 09:17:26 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Mon, 07 Nov 2022 09:17:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm2; t=1667830646; x=
 1667837846; bh=Ngp8whnuDWvZJFV5jotNpMrQ4mHBLOAsMNO1rcVm9kQ=; b=E
 vHG7QsL+VmAAFbFs178cud5gFq8O+bP4K5gxZsUPolQrtpokO83Uh8lqY6rHBRDL
 20nJDImNybhJhBYxYlwe4f68upZzMIF1/TTXYStVt+oMKR/SI3vsMh8cen3IxcUP
 uf9uDZkgFPnH4KThjQZLJGCkYOAESZSsQSrtyfUhZfbG2w3sGdu1YO88d3KSCt6r
 nQ91G0ED/S5G4VNny41Wtq8XoJCQsn/qBWmxDqvlL02Wn/NxC53VRuqzf5q2AKgq
 WG7i3DwqhSoAdXW1kfLHvf+L8FHznma3lrowcHB1EjqwK+FD1bovQ3b7BzSmuC1m
 zm9r0sAMtiy/tzVYd0KPA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1667830646; x=
 1667837846; bh=Ngp8whnuDWvZJFV5jotNpMrQ4mHBLOAsMNO1rcVm9kQ=; b=o
 gahNBtJhsf4lczNvByGhhGhnqf/Ab70p8nsY6+3z+dz0+YtaUTs4VyDn48GwPimR
 ZyMi8Up9QnYHwWnn8Z7LoSp6kcol1Z3IO8cv3z6S2voU6f0ygXZ0eMe6Yyst1Ws7
 ww2GlyHwLpr7gQi+duOa2mWOVyItK/oCWC0BgeBaBgnNOFGY+5sWe0KkrNqU0izm
 R9gHzzRs79vUYMxmkKe5W6U9KDJUxFTWbyirTZNAXI8t09HwVgMzQe76w7XZAbmt
 X+kzLq03wWZUUKoe5F1y/UqECZLH5/JLfIZBQ1Ymhk1kaAs+Psd/lYvSVuAIOtNS
 FXV3Op1bCtidfttYgSDig==
X-ME-Sender: <xms:dhNpY3z6DNqL5JvHREul7fkrrlLwNTwofcziqUTnrL4Y2WCngZcn1g>
 <xme:dhNpY_Qq2Dq4lUiC7zjHbXDRIpP2HMi84N5DLwMz8ZXi-JWPizF4Q6OWyqQ3ZveUu
 MqGVVy6M2vrnurnYPQ>
X-ME-Received: <xmr:dhNpYxXa8WxuHxODcohbX2iRh62Ui8LA_hToA6R3sGbk9WXC62msjERRSGKATYc_MjYfuvKAji9iCaYu6OIKVQTwBx0uLV5rC2UG8TNIXtOEJA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvgedrvdekgdeivdcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhfffuggfgtgfkfhgjvfevofesthekredtredtjeenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpedvgfevjefhtdetveevhfelieeuueetgfdvgeevkeegudejffegfffgtedt
 leelhfenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:dhNpYxglKDMyMZ-4oHGpXxg-Nla7pC4rIrQ3gAE11HAshcyEDWERoA>
 <xmx:dhNpY5AfzxdBGpRwn1e0VPSGZptoBsAygEJM8VtEmn_1nAQzQ0u4dQ>
 <xmx:dhNpY6JsMrO1klTM1le3Z33ny9cKLz5NGgkjP-tOgWW9BmU0iqmG-Q>
 <xmx:dhNpY6sHpl42Gb87nS8Y941Jb4HOXjyAESJVCWlOJoi-AOQBQ1K6oHcMq3k>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 7 Nov 2022 09:17:25 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
Date: Mon, 07 Nov 2022 15:16:36 +0100
Subject: [PATCH v7 10/23] drm/modes: Fill drm_cmdline mode from named modes
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <20220728-rpi-analog-tv-properties-v7-10-7072a478c6b3@cerno.tech>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1857; i=maxime@cerno.tech;
 h=from:subject:message-id; bh=FcO2lRsVFO8/cJ2pFa8Sj2nk/izc0QvJ9lvsv6CGgOk=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDMmZwg4WyW+3ztV+7Xj+fsNrBcVFHX06E/+lPNkZqb3IWDv6
 nlNARykLgxgXg6yYIkuMsPmSuFOzXney8c2DmcPKBDKEgYtTACbyyoaR4U7nh9fh2c+0bI581D8h4i
 36eVO9n46rwCY24TSeYxpnixn+2U7OSn2xnFWluVxn9n+lc0efdjKoZ2ZNOvFoS5WmQd40BgA=
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

The current code to deal with named modes will only set the mode name, and
then it's up to drivers to try to match that name to whatever mode or
configuration they see fit.

The plan is to remove that need and move the named mode handling out of
drivers and into the core, and only rely on modes and properties. Let's
start by properly filling drm_cmdline_mode from a named mode.

Reviewed-by: Noralf Trønnes <noralf@tronnes.org>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>

---
Changes in v7:
- Add Noralf Reviewed-by:w
---
 drivers/gpu/drm/drm_modes.c | 18 ++++++++++++++++--
 1 file changed, 16 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/drm_modes.c b/drivers/gpu/drm/drm_modes.c
index 7594b657f86a..acee23e1a8b7 100644
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
@@ -2271,6 +2282,9 @@ static int drm_mode_parse_cmdline_named_mode(const char *name,
 			continue;
 
 		strcpy(cmdline_mode->name, mode->name);
+		cmdline_mode->xres = mode->xres;
+		cmdline_mode->yres = mode->yres;
+		cmdline_mode->interlace = !!(mode->flags & DRM_MODE_FLAG_INTERLACE);
 		cmdline_mode->specified = true;
 
 		return 1;

-- 
b4 0.11.0-dev-99e3a
