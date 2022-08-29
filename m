Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4904A5A4D42
	for <lists+dri-devel@lfdr.de>; Mon, 29 Aug 2022 15:14:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D713210F21A;
	Mon, 29 Aug 2022 13:13:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew2-smtp.messagingengine.com (wnew2-smtp.messagingengine.com
 [64.147.123.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 81A3510F233
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Aug 2022 13:13:45 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailnew.west.internal (Postfix) with ESMTP id 5CBD12B0605E;
 Mon, 29 Aug 2022 09:13:42 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Mon, 29 Aug 2022 09:13:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm3; t=1661778821; x=
 1661786021; bh=ltOYRG7v3tJzbIBGGuYcDX0LFcNaJ6PQeW/ZDe0nh/k=; b=m
 7cJL3Tx1R/AdRyXvg9fuTo+UkRM7I9GJqB3muCppd0uzMsB/u+S+VVVy0wfCEdl6
 wqXmchU4kN9Yc7O8Yv0Gh8nFHpXTqcJpMQd3ekaHDCn6Z1Ztl9tSpvjZBommGqwE
 vPQvOhoQcmftregixxfdTKx33AtFhnIqO6c2TPiMWAsU056yLTQvE1fs8bEzReC+
 dsK66EPukNp7njpMz+6Fers7BUpwGEJWYBvgtkE1pN3ig+CzJhnekQ32Xih+ZD3E
 Gh2WWZCvbqCBzeBPaGVmVDZOZkfOoZ6je/FTfd1DDQ+V8Pxf1FjXy+Vo+QSzp4mM
 wL4QDSD9lcQu7kVeuiyRg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1661778821; x=
 1661786021; bh=ltOYRG7v3tJzbIBGGuYcDX0LFcNaJ6PQeW/ZDe0nh/k=; b=E
 gQdFq4FpwAaoluysfo4+L8sX7Spy2I9XIpng5hfvx0hUvtTmCqkBPSwzxL4FuN/+
 y//4E/PG4eAiYFk7qUyue7xGvXvYrJ46yrRPGJdxnK2eear8WV0bpy3sX83/M61x
 uvTPdAfdGOoaiv7AdM+KToUcKeg3AFpmnD2uVCCRVgGL6Am7XD40/AhRkOtoKazd
 uhiMDGAVQir7q2+XFLzmwVa2cb/+YwqSHM6uJPWV2jQ47Zo8X8XlP1nXLm69c3/h
 Fqlka9w81rdGt7Yclq2SdV5oy/ElCUqrbeLEFKLZVOQ6zEV+oI4Y2/LHXj7Al6tt
 THo2S9JTcNZ2BD0tNUp2g==
X-ME-Sender: <xms:hbsMY5vcps2_3puTJjDMvyzENR-8l3Uy0zhJZdbd5-RBxUH1qVkbgw>
 <xme:hbsMYydMGYszsP-sCbJ_Lc6JAYs_ewkeb9WBALSADNM6QUMsDyfILlfL88jl7CCpN
 OissWLBjOno_FbfPu8>
X-ME-Received: <xmr:hbsMY8zOhPF9NTEpRDecT3dNxJ-abdHpgS6vhLLFfqGSwOtXkDTlqAxBO8f5>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrvdekuddgieefucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvvefufffkofgjfhggtgfogfesthhqredtredtjeenucfhrhhomhepofgr
 gihimhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtf
 frrghtthgvrhhnpeefiedvfefggffgffehveejieffuddtgffhjefggeetieduvdeileet
 lefgveegtdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhroh
 hmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:hbsMYwPBSvjkisKPropuHihfL10SZatWrV66cUQZXjT0ReuZpw786g>
 <xmx:hbsMY5-kRKZYvuxELIlRrqRqRaID1TVXCfMRBm-9eBmfBinN4xTlvQ>
 <xmx:hbsMYwWOm5zwDhli3FYSOIgeana7iVTWJnFb5fnIm9yP6Y5KptTDoA>
 <xmx:hbsMY5m5h5YmcfkVpx05rB6TdpoRVF3-geUZiKCYPIBrGy8AJEcGfEJLtmQ>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 29 Aug 2022 09:13:40 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Maxime Ripard <mripard@kernel.org>, Ben Skeggs <bskeggs@redhat.com>,
 David Airlie <airlied@linux.ie>, Chen-Yu Tsai <wens@csie.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Jani Nikula <jani.nikula@linux.intel.com>, Lyude Paul <lyude@redhat.com>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>, Karol Herbst <kherbst@redhat.com>,
 =?UTF-8?q?Noralf=20Tr=C3=B8nnes?= <noralf@tronnes.org>,
 Emma Anholt <emma@anholt.net>, Daniel Vetter <daniel@ffwll.ch>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Subject: [PATCH v2 15/41] drm/modes: Switch to named mode descriptors
Date: Mon, 29 Aug 2022 15:11:29 +0200
Message-Id: <20220728-rpi-analog-tv-properties-v2-15-459522d653a7@cerno.tech>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220728-rpi-analog-tv-properties-v2-0-459522d653a7@cerno.tech>
References: <20220728-rpi-analog-tv-properties-v2-0-459522d653a7@cerno.tech>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Mailer: b4 0.10.0-dev-65ba7
X-Developer-Signature: v=1; a=openpgp-sha256; l=1620; i=maxime@cerno.tech;
 h=from:subject:message-id; bh=dI9HvhesuJCadfdRJpcjt131uRCcHtdTs7qad6DvrlM=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDMk8u+SvxJRNvRO9PfP45cNP94Uk+JdUnqx/s6mu1+Psb7uL
 9nycHaUsDGJcDLJiiiwxwuZL4k7Net3JxjcPZg4rE8gQBi5OAZiIZzYjw3bHY1dcZ9wR1rhUue3wpU
 kNuTsdojmEy87kM/sbR/OeuMDwz+ShxdZlsx66S8zcaZ/nz3DsW7MlczSju49UVLQBz4s1XAA=
X-Developer-Key: i=maxime@cerno.tech; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D
Content-Transfer-Encoding: quoted-printable
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
Cc: Dom Cobley <dom@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>, nouveau@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-sunxi@lists.linux.dev,
 Hans de Goede <hdegoede@redhat.com>, Geert Uytterhoeven <geert@linux-m68k.org>,
 Maxime Ripard <maxime@cerno.tech>,
 Mateusz Kwiatkowski <kfyatek+publicgit@gmail.com>,
 Phil Elwell <phil@raspberrypi.com>, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The current named mode parsing relies only the mode name, and doesn't allow=
=0D
to specify any other parameter.=0D
=0D
Let's convert that string list to an array of a custom structure that will=
=0D
hold the name and some additional parameters in the future.=0D
=0D
Signed-off-by: Maxime Ripard <maxime@cerno.tech>=0D
=0D
diff --git a/drivers/gpu/drm/drm_modes.c b/drivers/gpu/drm/drm_modes.c=0D
index 0636cb707544..1fdfa004b139 100644=0D
--- a/drivers/gpu/drm/drm_modes.c=0D
+++ b/drivers/gpu/drm/drm_modes.c=0D
@@ -2206,9 +2206,13 @@ static int drm_mode_parse_cmdline_options(const char=
 *str,=0D
 	return 0;=0D
 }=0D
 =0D
-static const char * const drm_named_modes_whitelist[] =3D {=0D
-	"NTSC",=0D
-	"PAL",=0D
+struct drm_named_mode {=0D
+	const char *name;=0D
+};=0D
+=0D
+static const struct drm_named_mode drm_named_modes[] =3D {=0D
+	{ "NTSC", },=0D
+	{ "PAL", },=0D
 };=0D
 =0D
 static int drm_mode_parse_cmdline_named_mode(const char *name,=0D
@@ -2241,14 +2245,15 @@ static int drm_mode_parse_cmdline_named_mode(const =
char *name,=0D
 	 * We're sure we're a named mode at that point, iterate over the=0D
 	 * list of modes we're aware of.=0D
 	 */=0D
-	for (i =3D 0; i < ARRAY_SIZE(drm_named_modes_whitelist); i++) {=0D
+	for (i =3D 0; i < ARRAY_SIZE(drm_named_modes); i++) {=0D
+		const struct drm_named_mode *mode =3D &drm_named_modes[i];=0D
 		int ret;=0D
 =0D
-		ret =3D str_has_prefix(name, drm_named_modes_whitelist[i]);=0D
+		ret =3D str_has_prefix(name, mode->name);=0D
 		if (ret !=3D name_end)=0D
 			continue;=0D
 =0D
-		strcpy(cmdline_mode->name, drm_named_modes_whitelist[i]);=0D
+		strcpy(cmdline_mode->name, mode->name);=0D
 		cmdline_mode->specified =3D true;=0D
 =0D
 		return 1;=0D
=0D
-- =0D
b4 0.10.0-dev-65ba7=0D
