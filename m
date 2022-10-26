Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EDDA460E4D8
	for <lists+dri-devel@lfdr.de>; Wed, 26 Oct 2022 17:36:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 35FC610E563;
	Wed, 26 Oct 2022 15:34:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new4-smtp.messagingengine.com (new4-smtp.messagingengine.com
 [66.111.4.230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5854510E4F5;
 Wed, 26 Oct 2022 15:33:51 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailnew.nyi.internal (Postfix) with ESMTP id B752E5803B9;
 Wed, 26 Oct 2022 11:33:50 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Wed, 26 Oct 2022 11:33:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm3; t=1666798430; x=
 1666805630; bh=gkFPZs5rRNz3id5hIc3/8x0iB0e0logZPupusEIvsqM=; b=e
 6F35n9ZX577djBGUS24iZwp3UEa1ARzkNMb5KWqtNQeG3ntrAL8ZR4kcp/3ZQjkQ
 jVytmuKj4t3MnPiLbB+seFdjHn9y5KG3rptpcpLOf8qr7o525gLtfUdlcX8czk8f
 oD8K+Pwnbl8YO8ZidAzLDeTTkMfgs/OXVgGeIAyl1AnTsxTsaXtgQ47sDskstTcI
 mojcIBXYnVRQk/qiNGoNW9P1bcEuc7m9oJga1etjpgs6ggftSG36dWMRCoQBnI/8
 mQ+E686y5s7Q8jhuvKS3b/0JS7OPCHBdsSzJtAAwi0d8oaYFggNLPCd9EHYtVTnu
 oTyD7QtTx4Xu5ZJ+BzdpQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1666798430; x=
 1666805630; bh=gkFPZs5rRNz3id5hIc3/8x0iB0e0logZPupusEIvsqM=; b=B
 MvTsFHwnM2YEsHeNjZnTS9HT0aTcXoqOGEvV85faMc1og5dPyYZIpfoCDVVCXsNU
 LCZ2zU6iCwA0ca99KjPVJwE/Rau0qHYIgk0WbpwpuzmZ2f8dS40873r2wbb/vB9s
 BmkhnZAwlGgjNvOnVg4VvkiPVL9VZRcpmbVeaZoS4DxNoX19XiticLTxD4wp78d/
 a6hmrc32ZHTF0lI/ZRgaDUDvwwC3dbBOl02Bdl4ZwoaobmQw9MOxT//Y8CVS5bGd
 Eg2GZ+h8aELFgYbe31EVk5Wml1AUGGqn6TAkBee6VRRtWs/fBd7fn6HiBgcmFEHr
 E0lKP4Ejp9L4AbqE92osA==
X-ME-Sender: <xms:XlNZY5EL2QbGZ8Ovj-UpkjXUnKCmgOSFHM_MQyCWPqxtl09Pj7f4Og>
 <xme:XlNZY-VOcJqesEK32aCeHNyyeQpvCfdo7w1NCkAFmCnA-XL8XFhInp9FGsL24ep9I
 O3ypWpJQv1Dx8fVuwk>
X-ME-Received: <xmr:XlNZY7KtL_F48Nz6l-qLqJ7oxE4Luf4zpdjDUdCGMjV-rJyFATbc2VHfTVkArixVdidmFPX4aE-QI_J_FsyxTWxu_vnbxuiQ2DtVH03eIU-xCg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvgedrtddvgdeltdcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhfffugggtgffkfhgjvfevofesthekredtredtjeenucfhrhhomhepmhgrgihi
 mhgvsegtvghrnhhordhtvggthhenucggtffrrghtthgvrhhnpeefudfhgeevhefhfedtue
 evueeluddutdetuddtvddvgeekheelvefhteekteeihfenucevlhhushhtvghrufhiiigv
 pedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggvrhhnohdrthgvtg
 hh
X-ME-Proxy: <xmx:XlNZY_FMVkgoJwf9dK-TpWXmMuG4beZHdV-XTXqa55agSsU-lDzSFg>
 <xmx:XlNZY_UMT36Ihi2Evzs0b8S16cREONtiliPvDTey6bGW-fiIaS2nhA>
 <xmx:XlNZY6M-D7Z6tjI4l948lqthGtCHzfK8EQCGb5-2wfCkAJNJIYbkIA>
 <xmx:XlNZY5gSnhbyylSYppnm-u0p26MLjcpnn4zwUDl1YZxTPuT9hS_aDQ>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 26 Oct 2022 11:33:50 -0400 (EDT)
From: maxime@cerno.tech
Date: Wed, 26 Oct 2022 17:33:28 +0200
Subject: [PATCH v6 09/23] drm/modes: Switch to named mode descriptors
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20220728-rpi-analog-tv-properties-v6-9-e7792734108f@cerno.tech>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1729; i=maxime@cerno.tech;
 h=from:subject:message-id; bh=wFJmFy9jCP/Mr1lXz7xJuzUZPb/AYXRtxmNByekH3iw=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDMmRwW6vs/dp7ljZVXaW5eLahwoGO25MyjypknBbh9fNWSHy
 nKhARykLgxgXg6yYIkuMsPmSuFOzXney8c2DmcPKBDKEgYtTACaiFsHI8CohKN6H6ePp9PyLxsdUj3
 gUxbK9W9N4Ie5Jos/uLadD8hj+KX9cuGf/yQTN0tkp0XpSt1sTlJ3ZUwNdNv/mZQ6/xFbPDQA=
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

The current named mode parsing relies only the mode name, and doesn't allow
to specify any other parameter.

Let's convert that string list to an array of a custom structure that will
hold the name and some additional parameters in the future.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
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
