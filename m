Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E0AB85A4D4A
	for <lists+dri-devel@lfdr.de>; Mon, 29 Aug 2022 15:14:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 12D1D10F234;
	Mon, 29 Aug 2022 13:14:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew2-smtp.messagingengine.com (wnew2-smtp.messagingengine.com
 [64.147.123.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CEEF910F21A
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Aug 2022 13:13:51 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailnew.west.internal (Postfix) with ESMTP id A60042B0605D;
 Mon, 29 Aug 2022 09:13:48 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Mon, 29 Aug 2022 09:13:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm3; t=1661778828; x=
 1661786028; bh=AAvXImFRqhXK3wzdRCgVDl9APZWKjeBdFuiGKB1+8lA=; b=O
 3Ju7lSD9HBG2Jp2F5aPP1xNX7MinO6GQLZ1QfrCnLDMSS1OaLPtEww6liBm0C7AK
 1W25pMbOBRD59a1kpko5mU92VQHgrxQn3NKxVuIUdL3vjbS/AnhQ33yp0PQS/Azp
 HfUI7mD2BILNiCwU4Y08fqhBmgIpxDHG57SaMG+muUzCCeab2JL0FAAwqzp6DpRO
 AtGZM+wAyNl02LsE7VrB446RlL95Y+Ab1KYOyGy6Y+zlrY2tBZjKZLv9nr0SeivU
 sxwhkaV80DT55n+8ot86G1y7T1QFeWQJe6bzM7fHnxrgH313kAXBY8jcVm0tRCYu
 4GYWR2GWwuOn9oBF842Lg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1661778828; x=
 1661786028; bh=AAvXImFRqhXK3wzdRCgVDl9APZWKjeBdFuiGKB1+8lA=; b=r
 7HiL1g/pL8NSYTqdGC8mulIobHbDSVRvB90imWhz2bioxrU71fBtvzh2iQhTOD0P
 fY6OuyimI2YOK6y1EeK+QB+VTylc5tM/G5tJOc2VSLHRvQJYX9gzUL8YPWh3bY2/
 WtR/I6DZEHtkCKCQo/a90fKS9hh5DaO47jVEED9d7bqe9HfZeD+RWn50EkmzgnkZ
 84RYzBF73EeOumdLJeVNNnQ23pX7csARnQ+HUc4qtQtD4VpGCWklnU8jTXKSwUJ6
 /OMtztafTFh9AqrLgmCSfuJ2FAaLyCK8AhqcQt/ZpNz8dHQLoEKhvek1zLvtTBXg
 VtL+udw+acHjQqUK7ybhA==
X-ME-Sender: <xms:i7sMYy85J60l4VBWG5rvMR3BvDNEvYbfHTc_nMs7at1UpJhvGb1VkA>
 <xme:i7sMYyuvXbgIHjw7YJAgq2H0biWrESgpNEaqSWPc6UnknVLaNi1HoZl7tRZNYIuPM
 g80Ek9iBKoDSD7VIn4>
X-ME-Received: <xmr:i7sMY4CPSGj3xem-c06yHUEEHOHl98rtxr_pfkgbFPvLJD_Uu7koNIJAalCt>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrvdekuddgieegucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvvefufffkofgjfhggtgfogfesthhqredtredtjeenucfhrhhomhepofgr
 gihimhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtf
 frrghtthgvrhhnpeefiedvfefggffgffehveejieffuddtgffhjefggeetieduvdeileet
 lefgveegtdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhroh
 hmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:i7sMY6eFtSbF4hHYRonDP_DPSSzmbhoOpOcE1pgITN0fOg2ZRTGrKA>
 <xmx:i7sMY3O2ldVXG-x_0fDQF4sB0h4QzdQn6rQM2P2-Fq9e10Wg8cWlKA>
 <xmx:i7sMY0mdlN8gD1G5_PTOpC6n599SFzll59cUbU4Apdh9cm-qGTkiWw>
 <xmx:jLsMY33mKs4wVsDab7xs7OlT_22CLClMyxBK6ldA3V7PM0xVGKLHo1z3bl4>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 29 Aug 2022 09:13:47 -0400 (EDT)
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
Subject: [PATCH v2 16/41] drm/modes: Fill drm_cmdline mode from named modes
Date: Mon, 29 Aug 2022 15:11:30 +0200
Message-Id: <20220728-rpi-analog-tv-properties-v2-16-459522d653a7@cerno.tech>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220728-rpi-analog-tv-properties-v2-0-459522d653a7@cerno.tech>
References: <20220728-rpi-analog-tv-properties-v2-0-459522d653a7@cerno.tech>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Mailer: b4 0.10.0-dev-65ba7
X-Developer-Signature: v=1; a=openpgp-sha256; l=1645; i=maxime@cerno.tech;
 h=from:subject:message-id; bh=cx3bZ2Z+vnsINoBvMJVTM9LZ3rHQTrc0mEfL62Vz/88=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDMk8u+Rzt3OsVsjbJGv7UNrGwSXJqZuBm/2ZUZuby4QFFz5Y
 NU7tKGVhEONikBVTZIkRNl8Sd2rW6042vnkwc1iZQIYwcHEKwESW8jMyHI33m2VpfF5wnZj/uaSObg
 7Z31KKeUJrtxS89ApY86M4gZGhQUtZ/lNcn530bpOoYvOQe/8nLJQ+8uHtTHt94Td/M3ayAgA=
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

The current code to deal with named modes will only set the mode name, and=
=0D
then it's up to drivers to try to match that name to whatever mode or=0D
configuration they see fit.=0D
=0D
The plan is to remove that need and move the named mode handling out of=0D
drivers and into the core, and only rely on modes and properties. Let's=0D
start by properly filling drm_cmdline_mode from a named mode.=0D
=0D
Signed-off-by: Maxime Ripard <maxime@cerno.tech>=0D
=0D
diff --git a/drivers/gpu/drm/drm_modes.c b/drivers/gpu/drm/drm_modes.c=0D
index 1fdfa004b139..5e898699b532 100644=0D
--- a/drivers/gpu/drm/drm_modes.c=0D
+++ b/drivers/gpu/drm/drm_modes.c=0D
@@ -2208,11 +2208,22 @@ static int drm_mode_parse_cmdline_options(const cha=
r *str,=0D
 =0D
 struct drm_named_mode {=0D
 	const char *name;=0D
+	unsigned int xres;=0D
+	unsigned int yres;=0D
+	unsigned int flags;=0D
 };=0D
 =0D
+#define NAMED_MODE(_name, _x, _y, _flags)		\=0D
+	{						\=0D
+		.name =3D _name,				\=0D
+		.xres =3D _x,				\=0D
+		.yres =3D _y,				\=0D
+		.flags =3D _flags,			\=0D
+	}=0D
+=0D
 static const struct drm_named_mode drm_named_modes[] =3D {=0D
-	{ "NTSC", },=0D
-	{ "PAL", },=0D
+	NAMED_MODE("NTSC", 720, 480, DRM_MODE_FLAG_INTERLACE),=0D
+	NAMED_MODE("PAL", 720, 576, DRM_MODE_FLAG_INTERLACE),=0D
 };=0D
 =0D
 static int drm_mode_parse_cmdline_named_mode(const char *name,=0D
@@ -2254,6 +2265,9 @@ static int drm_mode_parse_cmdline_named_mode(const ch=
ar *name,=0D
 			continue;=0D
 =0D
 		strcpy(cmdline_mode->name, mode->name);=0D
+		cmdline_mode->xres =3D mode->xres;=0D
+		cmdline_mode->yres =3D mode->yres;=0D
+		cmdline_mode->interlace =3D !!(mode->flags & DRM_MODE_FLAG_INTERLACE);=0D
 		cmdline_mode->specified =3D true;=0D
 =0D
 		return 1;=0D
=0D
-- =0D
b4 0.10.0-dev-65ba7=0D
