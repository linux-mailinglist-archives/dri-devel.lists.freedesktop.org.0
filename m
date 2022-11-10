Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DEF36240DE
	for <lists+dri-devel@lfdr.de>; Thu, 10 Nov 2022 12:09:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C473210E6E6;
	Thu, 10 Nov 2022 11:07:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new4-smtp.messagingengine.com (new4-smtp.messagingengine.com
 [66.111.4.230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C4C210E6E2;
 Thu, 10 Nov 2022 11:07:39 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailnew.nyi.internal (Postfix) with ESMTP id EE369580307;
 Thu, 10 Nov 2022 06:07:38 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Thu, 10 Nov 2022 06:07:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm2; t=1668078458; x=
 1668085658; bh=f5Bxyyy3gbM1aob3o5oavcw2aZQ/p0BMdvQWWMyrDVI=; b=e
 5ixgVarsWlxXXOyc7D1AySr/Bm0Glnge7ARI28BpIm586NGLYz2nmPbti5r4WLi8
 Nv7usIllIT3CRZwF80pfagUvfTr2S3UEjj3VuGYGJNrewDlwY23BHhcyu4U/BkCS
 HoKudD+kQkFaAD57kCPIfpmyeBNeLYrMyJqj8fX7rv7dO9yOSuOXeViiwQM9I9QL
 8PQFeVcaTXNpyiFRb6rCbokNq0tG+efL7b/y8BQlOwPmrTMdUgAK+2zKVIgIAoIy
 Fr2W+Vlq0/dcniLWLXuhCrWKtvKp4h1dQXPIJB3eiIUlfNOq0RBShWAzeeWkNs/o
 a5iTmbnCsrNEiT1V8oZXA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1668078458; x=
 1668085658; bh=f5Bxyyy3gbM1aob3o5oavcw2aZQ/p0BMdvQWWMyrDVI=; b=M
 JwgfqQhSIR0a6ry/1aJSEnO1pkH6TRV5IZi7jJWNFHHmLPdF0Mk7HLWI6bEf9crt
 y7x6+FN7FbXJmXM8U7xqu4xIzbzdc/y4FdzNZt/un5CQMrkHAtXVYfr446doyLN9
 Pr80iM3P/96XRSM9pD8ibb0Hh0A93v5k0SixA6mje3CZgQ8L+J27vfaOkdvvJ4EI
 N8u22/KuzpVKs/4hyCNVSwY87JRr9SfHpg4g15LsWsttrlBUwDVwGA9T9mQJ7H2d
 hBIxq1XfeAJaju/591bhEhE8xGIRG5PsBQioGl3ro2lRuDqZ+mGV4vHrfBNBoMse
 WucNBSk3rMgSsN1t3UGFg==
X-ME-Sender: <xms:ettsY_EehMr7lxHEcC8T02yc2e9MTCb70Pxlcbh5Tw4sIJAmeYowQg>
 <xme:ettsY8XOL7rtgQgKpl-elUf6vvznSgs8QDe5ofB8II-IkVb2N9MuJU0sm7z1Grqdl
 kCB1lhxOloejb7t0e4>
X-ME-Received: <xmr:ettsYxJgHKV8DOsStxA1CnP9ESQDGOUOTovkJKctQWusvQ39MEH5YEynxhOYD9o6x5ePjMFbZMoOoZbcRjit3B49jX735RaM19oGduXsTaF0JA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvgedrfeeggddvgecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhfffuggfgtgfkfhgjvfevofesthekredtredtjeenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpedvgfevjefhtdetveevhfelieeuueetgfdvgeevkeegudejffegfffgtedt
 leelhfenucevlhhushhtvghrufhiiigvpeefnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:ettsY9F_4DxDJq21fcvpIf5sntPbtEtW7T_FB8WzZEEO4NEHyuX6Cw>
 <xmx:ettsY1X2W-2rKM4kOz1wDYnkVq3XwN9WG_0DbDngOVaX2nEl6XfQpw>
 <xmx:ettsY4Pcuvzu3tAJ59Tz58aiAMAKRdC6O5Bqg88qz8pNJTe_Z1VATA>
 <xmx:ettsY_g6C0t1U9hLm-KzN4RxjhYBrp9DMkREQ4P1inj29JCLV7JTvA>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 10 Nov 2022 06:07:38 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
Date: Thu, 10 Nov 2022 12:07:22 +0100
Subject: [PATCH v8 10/24] drm/modes: Fill drm_cmdline mode from named modes
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <20220728-rpi-analog-tv-properties-v8-10-09ce1466967c@cerno.tech>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1919; i=maxime@cerno.tech;
 h=from:subject:message-id; bh=V/HryWBeSFhWZNkmbgXKuJjMNJOyfsAtwscHjRyAPVk=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDMk5t1NKV51R9l3xYIZWrsevj4oRIc8ehkgcWKuR8dpw25pp
 Mf+4OkpZGMS4GGTFFFlihM2XxJ2a9bqTjW8ezBxWJpAhDFycAjCRF18YGW6IXeS3VHyS5cbnt6e+9v
 oB4W2Jyv8vyXIWVW7gWTuxu4qRYdFtnyyFkqWOjIYaG5pOmHHJcey6/dy8Z+0tNrG0FS/2MQAA
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
Tested-by: Mateusz Kwiatkowski <kfyatek+publicgit@gmail.com>
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
