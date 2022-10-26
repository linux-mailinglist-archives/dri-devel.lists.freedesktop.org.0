Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 62C9560E4B9
	for <lists+dri-devel@lfdr.de>; Wed, 26 Oct 2022 17:35:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF61010E545;
	Wed, 26 Oct 2022 15:34:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new4-smtp.messagingengine.com (new4-smtp.messagingengine.com
 [66.111.4.230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 66FF110E4F5;
 Wed, 26 Oct 2022 15:33:53 +0000 (UTC)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailnew.nyi.internal (Postfix) with ESMTP id C88E558040D;
 Wed, 26 Oct 2022 11:33:52 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute1.internal (MEProxy); Wed, 26 Oct 2022 11:33:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm3; t=1666798432; x=
 1666805632; bh=SXMlVCwujUWn5ijYluVa7H3jLHYEQBr1nrtXJ/1PSeY=; b=w
 QyLRcX3RKXHtCWol8ziF9sMZBc85vejZIeHrZGhJnfil9Oow2LaynO75kZNREqKR
 AXml+aSv/U3Yz1+qZRAOCZAhhHMvE3fDVzknNIWIdQ97UZmdVCiIL27GayU5u2RI
 i0Dl3DwGIPn+/fvUWjZfwSsZpTI4gTxjbT+wekV3MWY9xdJiNFF+I9tRV7h0iAZ4
 tdjAUUlPAtbFikoeV2t2ZnD2o9+N8TAZlN/md3SxE9um9rMNmuJKfhivHvHhzWQj
 SiS7JyenUGghkz2/C0nfEBrrW2w4vKeWrOWyJJccWN6kUrpo5AeQszTU5qLv6RU2
 9882qcCYC8HJ8HZEveGmg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1666798432; x=
 1666805632; bh=SXMlVCwujUWn5ijYluVa7H3jLHYEQBr1nrtXJ/1PSeY=; b=X
 CKcNHIMRkZpr2XU5d4cL+LJQ9l/gjiJIJ8yGJoEGuA/QYoBv4sg/3YDfVveGuAIU
 CapvIPiD3ZTgtACBRmHUJ0JdyaQRVmPOEQ9ZtzGGhLnw8mPZY1qc9k/bmM2zC7M4
 x2pyX5AgeHTQDnDHS4NiBG2+V+qV1i2Qi/gxeOK/Dc3z0mSJyIbclUEUfuHz1NZ7
 j05cF7b9WILs7OGWaoTVTJDmkj101igbMRKETbk0kfOjeok6tq4SvtU2WWEFs8x8
 XEPBBvAbmhWyxeawq+qDG32LUeONx902uTRkHxMHmOl80WU54t5Ch7nz58fAnAE9
 tuO9OOmYOhuEkawZxoTPw==
X-ME-Sender: <xms:YFNZY0wDGSaAfTUoDmb1RBLPodwByam0GsFOjVntqAA58UQgwyxM4w>
 <xme:YFNZY4TLouv2err9Jdy0R9hhLNygAAUJhcs6PS4tS_Q9-Dn7VbW1m1kEEr4Vk_2tK
 r-VbJ33AraNT9r1QLI>
X-ME-Received: <xmr:YFNZY2WXOaSjrBWGgQPthrPXwslMVQq58o0Lz3XdbA2qvIYCqP_kdmC4ufW5MLniRp9cs1EIwsVo6uLHFd2bYzeVaGGOJgQg9HWYtBQWLKW5Ng>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvgedrtddvgdeltdcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhfffugggtgffkfhgjvfevofesthekredtredtjeenucfhrhhomhepmhgrgihi
 mhgvsegtvghrnhhordhtvggthhenucggtffrrghtthgvrhhnpeefudfhgeevhefhfedtue
 evueeluddutdetuddtvddvgeekheelvefhteekteeihfenucevlhhushhtvghrufhiiigv
 pedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggvrhhnohdrthgvtg
 hh
X-ME-Proxy: <xmx:YFNZYyigiRYVEB6hg631NnOXYzZ3XEq3LvY1hMxPkgYSz8GxoJSd2A>
 <xmx:YFNZY2DloM9prgQvRSLH8jvtn_2jH_y3C__fwMk1Se7QDelN98fPgw>
 <xmx:YFNZYzKG_CqUTSUeWKdcCIRFHkRvYGpj4o8Ri75XplsPB3Wtk1Jiig>
 <xmx:YFNZY_uxyZ6f9b19uG9Q23PtBs7cVqhZ1O5dhNHk4laZGAVE8zknFg>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 26 Oct 2022 11:33:51 -0400 (EDT)
From: maxime@cerno.tech
Date: Wed, 26 Oct 2022 17:33:29 +0200
Subject: [PATCH v6 10/23] drm/modes: Fill drm_cmdline mode from named modes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20220728-rpi-analog-tv-properties-v6-10-e7792734108f@cerno.tech>
References: <20220728-rpi-analog-tv-properties-v6-0-e7792734108f@cerno.tech>
In-Reply-To: <20220728-rpi-analog-tv-properties-v6-0-e7792734108f@cerno.tech>
To: Karol Herbst <kherbst@redhat.com>, Emma Anholt <emma@anholt.net>,
 Ben Skeggs <bskeggs@redhat.com>, 
 Chen-Yu Tsai <wens@csie.org>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Jani Nikula <jani.nikula@linux.intel.com>, 
 Daniel Vetter <daniel@ffwll.ch>, Thomas Zimmermann <tzimmermann@suse.de>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Samuel Holland <samuel@sholland.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, David Airlie <airlied@linux.ie>,
 Maxime Ripard <mripard@kernel.org>, 
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Lyude Paul <lyude@redhat.com>
X-Mailer: b4 0.11.0-dev-99e3a
X-Developer-Signature: v=1; a=openpgp-sha256; l=1755; i=maxime@cerno.tech;
 h=from:subject:message-id; bh=H2y9y7eNqc9Q4StL5kM0iFsoomBesHaC2CAmPl0XFSQ=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDMmRwW6Pk8zc1XdIhyy5VLT6XJWNo7rbcY2dhWuWVSa1Gzjn
 mzt2lLIwiHExyIopssQImy+JOzXrdScb3zyYOaxMIEMYuDgFYCJTUxn++6w/vah31rIuT4bstyvOq5
 2/x5zd+ISNt6aIcfOi/5Z7vzL8FZsgfO2Y4tHiR2qvkpZM/u+95DXr16kJzxnqfvoVNj1pYwEA
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
