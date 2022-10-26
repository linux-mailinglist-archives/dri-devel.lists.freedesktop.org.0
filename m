Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EEAD460E4B1
	for <lists+dri-devel@lfdr.de>; Wed, 26 Oct 2022 17:35:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2CDFD10E50B;
	Wed, 26 Oct 2022 15:34:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new4-smtp.messagingengine.com (new4-smtp.messagingengine.com
 [66.111.4.230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 782A510E33F;
 Wed, 26 Oct 2022 15:33:49 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailnew.nyi.internal (Postfix) with ESMTP id D5EA5580391;
 Wed, 26 Oct 2022 11:33:48 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Wed, 26 Oct 2022 11:33:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm3; t=1666798428; x=
 1666805628; bh=AzjQD+27iFybW2XxMLzmHNkTgkXQr6tgJryuAJobNU8=; b=m
 H/NGITpDHSzobXhqeBmgyBMre7N0VqAKwYGxqknEO8BWpG33vojj74ISf0UQpqAw
 bddf1GTuyfbMQ9xdcnz+qAHV5kd7xeGlKR2gM6L5wVtuH1IAQn4Kvu0Z81SKUWsg
 oexZLbZbO9O7fKPINW9mNlVNH7rmW973i0CV1NtpAyQagBNLvwGF1HxeEg3+FJ8O
 GuVeE7ejA0HMMptdMhq7bZwz0HYbrHx8ZteT0smxUOd/wr2LKRAiQ05kbgFKs1d9
 rApROl9demDgHuqzJx5nCMMKcR/TkAVKbjlSvynfb4hLw58z8YH9obJuIUyWTf/i
 Be4h4DERfeQptzAMgdp0A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1666798428; x=
 1666805628; bh=AzjQD+27iFybW2XxMLzmHNkTgkXQr6tgJryuAJobNU8=; b=Y
 u//MUMim6KsuVkbiOCX2pPPa10HV3sxDzMwS6uFtZM0cZJlzUV9fL6UPfTbq02BS
 P3kAEvnX+6iqYC2lNhEp0um3BpxuyKgAP/Iit1ogRVcrruyg+wRNm+euqf9XKFZ5
 LgOCxKDSxp9E5Dpsj/uu87Ae4+OwzovyREDn9ZkVja+5V8QO3+cfjdLmlAV2bGen
 VK6MTBNFar5h3LQDsf2IZqr9FDp03fup58k5Alxf/J3QuyGxTcv/RNawq2E1qBIT
 n3KcnPEzTGJeTM0CuMl+V7dx28v57e1W4NY24q61iE1/FaBlLDoWeDhXaL4RV1Oa
 CAAQzATzQdg7jggd+A1uQ==
X-ME-Sender: <xms:XFNZYxyyoYz2_qh47KOT1CIKxvu4-YGOymrAqfB-YkWOcHU7NCBrdA>
 <xme:XFNZYxQapOizQLsvUYS1OHmHqnVkYHWd9mehb_4cle6xlxtR9k2pQo_5nTtXsOWAu
 FMCq1UlS4AFVAsIyOE>
X-ME-Received: <xmr:XFNZY7VqHddhllDt0lixlfKky6TsXA6eQA5lc9KGEYt6udOSOjB8r77xxYe6qi7N8jt7E7ve4riQXC7wRtzbOmqaiQLD5jtexODbeGdALYnSXw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvgedrtddvgdeludcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhfffugggtgffkfhgjvfevofesthekredtredtjeenucfhrhhomhepmhgrgihi
 mhgvsegtvghrnhhordhtvggthhenucggtffrrghtthgvrhhnpeefudfhgeevhefhfedtue
 evueeluddutdetuddtvddvgeekheelvefhteekteeihfenucevlhhushhtvghrufhiiigv
 pedunecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggvrhhnohdrthgvtg
 hh
X-ME-Proxy: <xmx:XFNZYzh5JJ-fYSR94wmRYwOYOcD8loIXr7kqdNSilPh23WabMPCwNQ>
 <xmx:XFNZYzCxUxN4UyaDWd0wi-eRc7jlpAg7d5dxl6arpgp4KAZf_xI7Wg>
 <xmx:XFNZY8It-uSCqFYF6IkOAdQfwCaZ0GCc7nP_3kUri71Y5XfGY4S0Cg>
 <xmx:XFNZY0vSZ9-Piofng-NKdidKuuNQaEiLOErYa6hENNnKFLJbsNb2xw>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 26 Oct 2022 11:33:48 -0400 (EDT)
From: maxime@cerno.tech
Date: Wed, 26 Oct 2022 17:33:27 +0200
Subject: [PATCH v6 08/23] drm/modes: Move named modes parsing to a separate
 function
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20220728-rpi-analog-tv-properties-v6-8-e7792734108f@cerno.tech>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3649; i=maxime@cerno.tech;
 h=from:subject:message-id; bh=L8E11yDG8xDlOq4bDAkcnN86+ZzmzsUoFIrf654tiVE=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDMmRwW4Szx4+/8Du88xN6ui+eVuv5c6eEqFdfDro/RZbY2W9
 5SUsHaUsDGJcDLJiiiwxwuZL4k7Net3JxjcPZg4rE8gQBi5OAZjIuRkM/z3PrdzE+VC2V8ymxIbHgP
 XIxpnf7plMmn/3yNREudXssQEM/+sZlVg+6S5/obk4cL7/oujpUz/ovVTmKvZ48z710E5PZxYA
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

The current construction of the named mode parsing doesn't allow to extend
it easily. Let's move it to a separate function so we can add more
parameters and modes.

In order for the tests to still pass, some extra checks are needed, so
it's not a 1:1 move.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>

---
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
