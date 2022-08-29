Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A3A6F5A4D55
	for <lists+dri-devel@lfdr.de>; Mon, 29 Aug 2022 15:15:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0622A10F240;
	Mon, 29 Aug 2022 13:15:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew2-smtp.messagingengine.com (wnew2-smtp.messagingengine.com
 [64.147.123.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 073BF10F231
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Aug 2022 13:15:10 +0000 (UTC)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailnew.west.internal (Postfix) with ESMTP id D00CF2B06078;
 Mon, 29 Aug 2022 09:15:06 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute1.internal (MEProxy); Mon, 29 Aug 2022 09:15:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm3; t=1661778906; x=
 1661786106; bh=Geyfyn7lfIjW9QZzqjQEZrV6BKt6Cr6Jw67lImD/OP4=; b=h
 33Sqoi3MkH+ZfTUG5VyM/1Yc4D0pxeQLMY9HSQHQ9Mo2IG1PDJUNCVB3pqA9rvnL
 LMEKXt4dmv0GP0ITDYj/FfUZCwY15kFl0QdezZEf+TDII8t/6NhrR2pG8lfdD++7
 NeE/0udJEPaol0QQoe3yfkJzOzVLUneLEp+0Nt09Bxxgoaxmx2GmbU/qsgTiI0js
 ATh3k2IB2n00v5oUh/H8snvsQCI17AhnLXatMoWEKsQOsyi5mJbJ6TLo8dOUeDDm
 ebhsRkqfPzYj6g/0V/FWZMGcINYxs0eyHBG6ZAT85WMspC5azLuoHo+oyJg43Mvy
 IfUnKoNoU0/A19XLmZh5A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1661778906; x=
 1661786106; bh=Geyfyn7lfIjW9QZzqjQEZrV6BKt6Cr6Jw67lImD/OP4=; b=3
 Bjv21wSh+GGHvc5hlBIDbzL3rKJF7MtA9EN/oaUUinAyKYv9FP8JEhwty3Gxx4Mc
 AVqF2CHgMXYa99YqyJGyr47vci3oBHhHtPT41H4FixhO8T2EkP2Xr11FsKcOEOte
 3yH5F/kyqxt0IY5QDRMpUeKpvrmg5ERKdUWcatbn34ENW5F6gBo8JYwq3ok6x/wC
 8oV9h9Mb6bsRWOEugQAZpZDfDx+l++ASlzQ4IsM1d7w1Q9FHtvc1fkXaR3s8+L4v
 Z8SbooHfl3vcmjVqdIQ9V3MNlcfpUEEna6w7Ll35wX7YeSPl9ZxbCpX7+/3P16kJ
 DUSmGdh31y/ZWOWPRX44Q==
X-ME-Sender: <xms:2rsMY8JCdF_8rteGEr2k2yvQvhEBGnq9oQvCRPBEQayX95Y_HN5I7g>
 <xme:2rsMY8LUSCcC0VEGgs0qrwXBu9pIftsmHF101NVYfZ7iyFHKddotBBCBbJI9LoKUg
 l6kKqSrV_0MfxruZyI>
X-ME-Received: <xmr:2rsMY8s6YX-G6cO9GjDtYI3LOp8psHcne1FsHvtym8aZAuJSVvo7F0eyjrNo>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrvdekuddgieefucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvvefufffkofgjfhggtgfogfesthhqredtredtjeenucfhrhhomhepofgr
 gihimhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtf
 frrghtthgvrhhnpeefiedvfefggffgffehveejieffuddtgffhjefggeetieduvdeileet
 lefgveegtdenucevlhhushhtvghrufhiiigvpeehnecurfgrrhgrmhepmhgrihhlfhhroh
 hmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:2rsMY5bWPxkAVFpDeM43i4y_BVD63X8wGJmW6fAM1R81raTncLzWCg>
 <xmx:2rsMYzbmhD1B_2j8SrSNGK_75-LzYQC9Ywi4hMPZmczx1gL8M0oBCA>
 <xmx:2rsMY1AlGSd7E8HpeiuRyAdKh7xwlBoJh9MY27lytQZhq2hJD2_0WA>
 <xmx:2rsMY9zSQ2tNxwqPsy_4R-vp1fu-0LcZF8Y0y42MtY_gRvlqp9q5ko7iVfI>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 29 Aug 2022 09:15:05 -0400 (EDT)
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
Subject: [PATCH v2 28/41] drm/vc4: vec: Fix timings for VEC modes
Date: Mon, 29 Aug 2022 15:11:42 +0200
Message-Id: <20220728-rpi-analog-tv-properties-v2-28-459522d653a7@cerno.tech>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220728-rpi-analog-tv-properties-v2-0-459522d653a7@cerno.tech>
References: <20220728-rpi-analog-tv-properties-v2-0-459522d653a7@cerno.tech>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Mailer: b4 0.10.0-dev-65ba7
X-Developer-Signature: v=1; a=openpgp-sha256; l=1306; i=maxime@cerno.tech;
 h=from:subject:message-id; bh=9tioiA5EY1yO34HzEK5H+VWpSJS31+Xh9uw365Ba2yU=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDMk8uxRU4rkSg9yPxRosun83wiov2a7/nrxu9Y6Aph1rXLe0
 7mLuKGVhEONikBVTZIkRNl8Sd2rW6042vnkwc1iZQIYwcHEKwETu7GZkmMWzwP741qhVqtP7flkdWf
 nO+EBY5h7n/M235WT1pRIuMDIyrP2h9Snyj8H1n6cVJOKSZlgmxAnPyzI2qlKMVZz4s/sLBwA=
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

From: Mateusz Kwiatkowski <kfyatek+publicgit@gmail.com>=0D
=0D
This commit fixes vertical timings of the VEC (composite output) modes=0D
to accurately represent the 525-line ("NTSC") and 625-line ("PAL") ITU-R=0D
standards.=0D
=0D
Previous timings were actually defined as 502 and 601 lines, resulting=0D
in non-standard 62.69 Hz and 52 Hz signals being generated,=0D
respectively.=0D
=0D
Signed-off-by: Mateusz Kwiatkowski <kfyatek+publicgit@gmail.com>=0D
Signed-off-by: Maxime Ripard <maxime@cerno.tech>=0D
=0D
diff --git a/drivers/gpu/drm/vc4/vc4_vec.c b/drivers/gpu/drm/vc4/vc4_vec.c=
=0D
index 4d7bc7c20704..d1d40b69279e 100644=0D
--- a/drivers/gpu/drm/vc4/vc4_vec.c=0D
+++ b/drivers/gpu/drm/vc4/vc4_vec.c=0D
@@ -227,14 +227,14 @@ static const struct debugfs_reg32 vec_regs[] =3D {=0D
 static const struct drm_display_mode ntsc_mode =3D {=0D
 	DRM_MODE("720x480", DRM_MODE_TYPE_DRIVER, 13500,=0D
 		 720, 720 + 14, 720 + 14 + 64, 720 + 14 + 64 + 60, 0,=0D
-		 480, 480 + 3, 480 + 3 + 3, 480 + 3 + 3 + 16, 0,=0D
+		 480, 480 + 7, 480 + 7 + 6, 525, 0,=0D
 		 DRM_MODE_FLAG_INTERLACE)=0D
 };=0D
 =0D
 static const struct drm_display_mode pal_mode =3D {=0D
 	DRM_MODE("720x576", DRM_MODE_TYPE_DRIVER, 13500,=0D
 		 720, 720 + 20, 720 + 20 + 64, 720 + 20 + 64 + 60, 0,=0D
-		 576, 576 + 2, 576 + 2 + 3, 576 + 2 + 3 + 20, 0,=0D
+		 576, 576 + 4, 576 + 4 + 6, 625, 0,=0D
 		 DRM_MODE_FLAG_INTERLACE)=0D
 };=0D
 =0D
=0D
-- =0D
b4 0.10.0-dev-65ba7=0D
