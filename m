Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9458C627FDE
	for <lists+dri-devel@lfdr.de>; Mon, 14 Nov 2022 14:02:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F29510E2AD;
	Mon, 14 Nov 2022 13:01:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new4-smtp.messagingengine.com (new4-smtp.messagingengine.com
 [66.111.4.230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5809910E293;
 Mon, 14 Nov 2022 13:00:54 +0000 (UTC)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailnew.nyi.internal (Postfix) with ESMTP id B81A358015F;
 Mon, 14 Nov 2022 08:00:53 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute1.internal (MEProxy); Mon, 14 Nov 2022 08:00:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm2; t=1668430853; x=
 1668438053; bh=c5RJi0M8Q1SE//r8kHa3xrGioqqVyBLDq6u+CcpOVQk=; b=O
 sB816SfgQofkGOWZbvzJ9GYybxr+ZPKmZSWSHnENRKg+utcxHrNcpTsiyBRSWub8
 MEtnPEA9lslDypEnRgTNMLNWeDLh73GidPDsEzH8qhFFfODr93yPhEn8v9yPQu7f
 wxlykI/uQQTFkL3TkdcQnbz3C4Ox19TvhqYUkvoOUyL83L1E4gwjy4VUVN4+ANZ4
 nm0JAtsjfc2iVsNY/V8zhfkrPlr5pVQZPGtLqybZWzaStFVJwWQAOZ0CH4n8GR4d
 CHlssmHsRv1pDpg+eQgY+aMeY8iYQ0fcFBqm8oVHGF1ecrzl1uCBytMTAGAQrgpp
 7MBFVIttd8wjbwmW6yiTw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1668430853; x=
 1668438053; bh=c5RJi0M8Q1SE//r8kHa3xrGioqqVyBLDq6u+CcpOVQk=; b=W
 XE1Zaj9Nj3RWinIqhJ331TpyNylggfJ8TGCxzQvXXlhW4InlFZY6jRTjHGuVGaOM
 Hfg/HpCRs0/CuFdZsa+6LAVuRz8lD0mcwJ2gv4wez/0+6r152TXFAFjMkP/G3s39
 Jwy31zDTXrMeqP2IjFh0VeeQ+vOtYm6XqjsmRW7qqjxCPSGhl9uIcUGmPV2hHwUv
 JVlfwFDf5Vi2IrGkOU4nwUSipB9z7kpHunkrEapt4+a7W0F8OptSWpx+uqSeV7ih
 qTlPonPDzqmLL814nzZSMmXxyPO6TPdwj8Zxukfwr0OhxZrCYJTRkxSG9ixWydOX
 KTJIfiNzTbi7qcO2jeJbA==
X-ME-Sender: <xms:BDxyY7YnLQko1CPtKc26AAGtHysmJCRFdXG5TNesMWMQCjtv29QkGA>
 <xme:BDxyY6aIpTFRxWH9tMx_9RaiQz7JID9qwX3BVDVAPDvfQ8tWHzH7Fo5wRN0wVsZqq
 QdfPB2ngk9f4aSBDKg>
X-ME-Received: <xmr:BDxyY9-qqMCVTOWQYxdxs-fmo7y1m7L8TI931vDfk5XmLu5DF0WvgKJ_u4LihpwdsF-2KcqJPx_LHEmBBk7IlWC-UvD9_3KmSCU6mCIzaRK4Jg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvgedrgedvgddvtdcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhfffuggfgtgfkfhgjvfevofesthekredtredtjeenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpedvgfevjefhtdetveevhfelieeuueetgfdvgeevkeegudejffegfffgtedt
 leelhfenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:BDxyYxqHzL1ZJFIAUmtQosDOBpxSwgOe2hsYQQtMXVVw53IKHjhxvg>
 <xmx:BDxyY2qmsuWnmx4xDWj-h1gqtCeTF73pCRBWRojutKlVfbRSP9VSKQ>
 <xmx:BDxyY3SzMiVesLOMW2QzaTTe5k45OnXciQfwnT4jT4xG-bGaM-NV2Q>
 <xmx:BTxyYxXYDF8HZzSceDmwOxIR63iBkmjUGc5Rxmn6knidtcCXCaQQ0g>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 14 Nov 2022 08:00:51 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
Date: Mon, 14 Nov 2022 14:00:28 +0100
Subject: [PATCH v9 09/25] drm/modes: Move named modes parsing to a separate
 function
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <20220728-rpi-analog-tv-properties-v9-9-24b168e5bcd5@cerno.tech>
References: <20220728-rpi-analog-tv-properties-v9-0-24b168e5bcd5@cerno.tech>
In-Reply-To: <20220728-rpi-analog-tv-properties-v9-0-24b168e5bcd5@cerno.tech>
To: Maxime Ripard <mripard@kernel.org>, Karol Herbst <kherbst@redhat.com>,
 Samuel Holland <samuel@sholland.org>, 
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Daniel Vetter <daniel@ffwll.ch>, Chen-Yu Tsai <wens@csie.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Lyude Paul <lyude@redhat.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, Emma Anholt <emma@anholt.net>,
 Jani Nikula <jani.nikula@linux.intel.com>, 
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Ben Skeggs <bskeggs@redhat.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>, 
 David Airlie <airlied@linux.ie>, Jernej Skrabec <jernej.skrabec@gmail.com>
X-Mailer: b4 0.11.0-dev-99e3a
X-Developer-Signature: v=1; a=openpgp-sha256; l=3806; i=maxime@cerno.tech;
 h=from:subject:message-id; bh=gJftk6Nvc/pYwNn1PcqGXwDIYm8zDBtvZRiBH7cMPJw=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDMlF1q8PvxS+1CvMz5k1rWLWzgn/9ot7Xl9d2rS060pD6ss2
 842eHaUsDGJcDLJiiiwxwuZL4k7Net3JxjcPZg4rE8gQBi5OAZhIyG+G/zHHFjXcbE6XW6+69vClac
 eLY6Vcl2iK7th8xkBv82+duTsY/td3duhvOGl4eIrni2nPf9rt7f5oU7H82zo3hf+H5/VY/+YBAA==
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
Cc: Dom Cobley <dom@raspberrypi.com>, Dave Stevenson <dave.stevenson@raspberrypi.com>, nouveau@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, Mateusz Kwiatkowski <kfyatek+publicgit@gmail.com>, Hans de Goede <hdegoede@redhat.com>, Noralf Trønnes <noralf@tronnes.org>, Geert Uytterhoeven <geert@linux-m68k.org>, Maxime Ripard <maxime@cerno.tech>, linux-sunxi@lists.linux.dev, Phil Elwell <phil@raspberrypi.com>, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The current construction of the named mode parsing doesn't allow to extend
it easily. Let's move it to a separate function so we can add more
parameters and modes.

In order for the tests to still pass, some extra checks are needed, so
it's not a 1:1 move.

Reviewed-by: Noralf Trønnes <noralf@tronnes.org>
Tested-by: Mateusz Kwiatkowski <kfyatek+publicgit@gmail.com>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>

---
Changes in v7:
- Add Noralf Reviewed-by

Changes in v6:
- Simplify the test for connection status extras
- Simplify the code path to call drm_mode_parse_cmdline_named_mode

Changes in v4:
- Fold down all the named mode patches that were split into a single
  patch again to maintain bisectability
---
 drivers/gpu/drm/drm_modes.c | 70 +++++++++++++++++++++++++++++++++++++--------
 1 file changed, 58 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/drm_modes.c b/drivers/gpu/drm/drm_modes.c
index 71c050c3ee6b..37542612912b 100644
--- a/drivers/gpu/drm/drm_modes.c
+++ b/drivers/gpu/drm/drm_modes.c
@@ -2229,6 +2229,51 @@ static const char * const drm_named_modes_whitelist[] = {
 	"PAL",
 };
 
+static int drm_mode_parse_cmdline_named_mode(const char *name,
+					     unsigned int name_end,
+					     struct drm_cmdline_mode *cmdline_mode)
+{
+	unsigned int i;
+
+	if (!name_end)
+		return 0;
+
+	/* If the name starts with a digit, it's not a named mode */
+	if (isdigit(name[0]))
+		return 0;
+
+	/*
+	 * If there's an equal sign in the name, the command-line
+	 * contains only an option and no mode.
+	 */
+	if (strnchr(name, name_end, '='))
+		return 0;
+
+	/* The connection status extras can be set without a mode. */
+	if (name_end == 1 &&
+	    (name[0] == 'd' || name[0] == 'D' || name[0] == 'e'))
+		return 0;
+
+	/*
+	 * We're sure we're a named mode at this point, iterate over the
+	 * list of modes we're aware of.
+	 */
+	for (i = 0; i < ARRAY_SIZE(drm_named_modes_whitelist); i++) {
+		int ret;
+
+		ret = str_has_prefix(name, drm_named_modes_whitelist[i]);
+		if (ret != name_end)
+			continue;
+
+		strcpy(cmdline_mode->name, drm_named_modes_whitelist[i]);
+		cmdline_mode->specified = true;
+
+		return 1;
+	}
+
+	return -EINVAL;
+}
+
 /**
  * drm_mode_parse_command_line_for_connector - parse command line modeline for connector
  * @mode_option: optional per connector mode option
@@ -2265,7 +2310,7 @@ bool drm_mode_parse_command_line_for_connector(const char *mode_option,
 	const char *bpp_ptr = NULL, *refresh_ptr = NULL, *extra_ptr = NULL;
 	const char *options_ptr = NULL;
 	char *bpp_end_ptr = NULL, *refresh_end_ptr = NULL;
-	int i, len, ret;
+	int len, ret;
 
 	memset(mode, 0, sizeof(*mode));
 	mode->panel_orientation = DRM_MODE_PANEL_ORIENTATION_UNKNOWN;
@@ -2306,18 +2351,19 @@ bool drm_mode_parse_command_line_for_connector(const char *mode_option,
 		parse_extras = true;
 	}
 
-	/* First check for a named mode */
-	for (i = 0; i < ARRAY_SIZE(drm_named_modes_whitelist); i++) {
-		ret = str_has_prefix(name, drm_named_modes_whitelist[i]);
-		if (ret == mode_end) {
-			if (refresh_ptr)
-				return false; /* named + refresh is invalid */
+	if (!mode_end)
+		return false;
 
-			strcpy(mode->name, drm_named_modes_whitelist[i]);
-			mode->specified = true;
-			break;
-		}
-	}
+	ret = drm_mode_parse_cmdline_named_mode(name, mode_end, mode);
+	if (ret < 0)
+		return false;
+
+	/*
+	 * Having a mode that starts by a letter (and thus is named) and
+	 * an at-sign (used to specify a refresh rate) is disallowed.
+	 */
+	if (ret && refresh_ptr)
+		return false;
 
 	/* No named mode? Check for a normal mode argument, e.g. 1024x768 */
 	if (!mode->specified && isdigit(name[0])) {

-- 
b4 0.11.0-dev-99e3a
