Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 699706240D7
	for <lists+dri-devel@lfdr.de>; Thu, 10 Nov 2022 12:09:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8816510E6E7;
	Thu, 10 Nov 2022 11:07:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new4-smtp.messagingengine.com (new4-smtp.messagingengine.com
 [66.111.4.230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE8EB10E6E0;
 Thu, 10 Nov 2022 11:07:37 +0000 (UTC)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailnew.nyi.internal (Postfix) with ESMTP id 2B777580305;
 Thu, 10 Nov 2022 06:07:37 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute1.internal (MEProxy); Thu, 10 Nov 2022 06:07:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm2; t=1668078457; x=
 1668085657; bh=I9h0WGDEgvQvPKNY7aY+X/bcnurAusGAi85fmyhOKCA=; b=R
 m1BAUzuxYK1HngO/fCvD6H8kWzcN7MLdN1TKcNFqSiR6xQpT450k3cUlA/T6FEWO
 RzYeKn2TTZl+HxozhkdpNJga/vUYfrQeF628jpVfhuAiPYYq4J0bQi+hj3X+a3bQ
 L9STcI6EQu0sP3qyGBcBBWlk4u5F7RCAUJzS2VZhMw6XJuSRNryzctdTH3ki6T0m
 WVILPx6S8qbvuxdURuOSx7C1eRtN52JxXx0sLAmlYayow+p2t1cbVUX8UFI4s6M/
 0SEX4ejNo+TJl4IMu40mWD9mJu8AB7YTL/r2VMX2Yq6ERDeQjdSGApq//iz24hVd
 siCWjhSbe9ohZWM1uqeow==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1668078457; x=
 1668085657; bh=I9h0WGDEgvQvPKNY7aY+X/bcnurAusGAi85fmyhOKCA=; b=S
 sUxXhwAVLdAFYxp3MXpSdLdle8/RWpNP2MblFmiQX9nF9Ec3hc2UjouRcH40vIP+
 PuKLyOjkzXrQ+mdgPKYiBNPdV5NdCOIulcubxKphggLfhaWCOw0DFcQ01vDA45LJ
 68okWzwOjFd0rVt8YtuKsgS3PrAxUHkfeNIefcncfrg0DEUEpL4Uwkp+A+MN9oYn
 y4ZJkUmUOzspl2GkIMep21Pvqe2aVXBomR8B31k1CKlM+QXIVPJvmveiaZKLegKt
 gXJPcwdSw1vF0Cl9s0q6oMRlwkWc/vXXFQcqnzM4L0gqfGTwtYoT+sJyXBnOatCY
 boqjXHmowm5ajilrkFODg==
X-ME-Sender: <xms:edtsYxJOMJmYdJKrb5pXiYjqJw0fjHWgtCfhzacR0InbvQ1InbXKNg>
 <xme:edtsY9KFQ3z9_QRkphR0-r5dBr3heK4imivT_BIUzCNRFiR_tO2104B1QHulw41PC
 RZSFBXarPIV_rpPKmw>
X-ME-Received: <xmr:edtsY5v-8gNtILfjujy_h6KHxHfXYd71FZeYxRBW8jGkCoaJdW3N2jsQsDM6jMWwJJOgm3-vJWbDPSqYtWwdY4eSNeJOjRKUTZN8BwUYZ4A5Pw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvgedrfeeggddvhecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhfffuggfgtgfkfhgjvfevofesthekredtredtjeenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpedvgfevjefhtdetveevhfelieeuueetgfdvgeevkeegudejffegfffgtedt
 leelhfenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:edtsYyYW_WSvx-K0jrPwOCIUdTsNWm2JbHxBPAZ9mqvyI7fDcWiK4A>
 <xmx:edtsY4ZW9PxL8ell23d3MsWJmWzMIGGLHeq1s4zXnIOri5E5N0jFLw>
 <xmx:edtsY2DXM7IZs0h5OB3BtVa5pWJHLXcRChAc_43YIu_ateWO44iJNA>
 <xmx:edtsY5GZ2m0sHbv6VXNxUQIMw5jzwsCTqvzJT549BMY-x2j6vMBcAw>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 10 Nov 2022 06:07:36 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
Date: Thu, 10 Nov 2022 12:07:21 +0100
Subject: [PATCH v8 09/24] drm/modes: Switch to named mode descriptors
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <20220728-rpi-analog-tv-properties-v8-9-09ce1466967c@cerno.tech>
References: <20220728-rpi-analog-tv-properties-v8-0-09ce1466967c@cerno.tech>
In-Reply-To: <20220728-rpi-analog-tv-properties-v8-0-09ce1466967c@cerno.tech>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Chen-Yu Tsai <wens@csie.org>, 
 Maxime Ripard <mripard@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Karol Herbst <kherbst@redhat.com>, 
 Jani Nikula <jani.nikula@linux.intel.com>, Daniel Vetter <daniel@ffwll.ch>,
 Lyude Paul <lyude@redhat.com>, Samuel Holland <samuel@sholland.org>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, Emma Anholt <emma@anholt.net>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, 
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 David Airlie <airlied@linux.ie>, Ben Skeggs <bskeggs@redhat.com>
X-Mailer: b4 0.11.0-dev-99e3a
X-Developer-Signature: v=1; a=openpgp-sha256; l=1924; i=maxime@cerno.tech;
 h=from:subject:message-id; bh=w9lKNNto+j9b2STH/OZ0qo6XjNHI6R3fCJ+Pp5+TrKM=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDMk5t1OyZxXL/Lrlq/+vpdXks+uq07urNmTc+PBKuCs/V0G7
 naeyo4SFQYyLQVZMkSVG2HxJ3KlZrzvZ+ObBzGFlAhnCwMUpABPhuMTI8PF4L9Pui892lx/arClrmy
 Clxb/hFEuT2AK2FPNZqR7Byxl+rDJaPd9ussQW37S0FV4n274df8Cr9HBW5fav5cITnfJZAA==
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

The current named mode parsing relies only on the mode name, and doesn't
allow to specify any other parameter.

Let's convert that string list to an array of a custom structure that will
hold the name and some additional parameters in the future.

Reviewed-by: Noralf Trønnes <noralf@tronnes.org>
Tested-by: Mateusz Kwiatkowski <kfyatek+publicgit@gmail.com>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>

---
Changes in v7:
- Fix typo in the commit log
- Add Noralf Reviewed-by
---
 drivers/gpu/drm/drm_modes.c | 17 +++++++++++------
 1 file changed, 11 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/drm_modes.c b/drivers/gpu/drm/drm_modes.c
index 37542612912b..7594b657f86a 100644
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
@@ -2258,14 +2262,15 @@ static int drm_mode_parse_cmdline_named_mode(const char *name,
 	 * We're sure we're a named mode at this point, iterate over the
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
b4 0.11.0-dev-99e3a
