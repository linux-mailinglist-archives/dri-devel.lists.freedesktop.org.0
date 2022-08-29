Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 482F85A4D56
	for <lists+dri-devel@lfdr.de>; Mon, 29 Aug 2022 15:15:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 497F310F248;
	Mon, 29 Aug 2022 13:15:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew2-smtp.messagingengine.com (wnew2-smtp.messagingengine.com
 [64.147.123.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8707210F231
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Aug 2022 13:15:24 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailnew.west.internal (Postfix) with ESMTP id 602492B0607B;
 Mon, 29 Aug 2022 09:15:21 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Mon, 29 Aug 2022 09:15:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm3; t=1661778920; x=
 1661786120; bh=20eH8m8Xvl9FZJWw0WkzB+p4KU7I79tJhWItQe47inA=; b=k
 uxqj0ih+aOHhSP5Qm4mEZ5kfSow3hCD8Cs/dIsXVPHzOsgig7eGPxjog2FhvJbIk
 wHYYg6e4IIAMfrPos+4EDR3S/iXdcI9EfGN7EPb6dzCGn3QXksGTi1oDPgB0HqV8
 tL+thL6C6yrkiA7WmenAZ/ZIvxudRvdcSVtoyho++rr5PKB85ABIwC2OYhb/u+mf
 tX+BhjZe10WgfKnZCUCf2MWfuG9Wl+7TRsvxJBZa3R0aZmyvcDwQYiOnSfe+FqJW
 k0GcfVir9gFg/ytgx+3R/Uc96ChQUgcRSdCEEw+AG0/fqlihOhMAzJGvCeEsOr+a
 XPd2JOwy9S0bcuO58djXQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1661778920; x=
 1661786120; bh=20eH8m8Xvl9FZJWw0WkzB+p4KU7I79tJhWItQe47inA=; b=L
 qMQBH/6NfHLUBDZl4Y4xpC1Y5S4l3DStw0gU4ojS/iWXfPa1tfCdeQr/d5jaHlTW
 BIdMskj/lMe5Om8gDO9oOX6E8kG3ucp544bRhF//STt0Y34qEDgPkU77MSKI2JOa
 Mj8dn4MvXEa0Hb96Y6NIf4GFd5uJFw7Mzedy+PdQeVrQKXwd44D5Wy/VURR9Y1Q+
 mMdlfEpz7Bul0qcHi+0YX4ShsB9M6n5EKr90dL/b5htxQgJ69iH9IKya0yz0PNfx
 zdTtRhLvANn1ZZJVuPqdWHPNTvbL408Qw+RiUx5vTlOoro1AEidK3+q6APQCq45r
 ytk26sfRTVurHg9ljAggw==
X-ME-Sender: <xms:57sMY4bHNnu1Zlw2culDTQ05LxcnZrgXAe2SLYVq5Ofz2GXg9RY99A>
 <xme:57sMYzZ0ExllqKohomUoHhMLDVnemxzjzMscYU4V9mU3N_K8KiGjsIwV-7-Enn1su
 5-j1ZoxTQ-p6ysgWEg>
X-ME-Received: <xmr:57sMYy9X2RSDV6SB6Rrq_vSJP691GNHC_CWgBMA50K8w_s3ozjv8ORza3-1F>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrvdekuddgieegucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvvefufffkofgjfhggtgfogfesthhqredtredtjeenucfhrhhomhepofgr
 gihimhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtf
 frrghtthgvrhhnpeefiedvfefggffgffehveejieffuddtgffhjefggeetieduvdeileet
 lefgveegtdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhroh
 hmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:57sMYyrFFYuZt2EoiviNUS7xDZ5JpJckSYeAOPTFeH9P8FmPhhtclw>
 <xmx:57sMYzpzZDLYN8YYHxprBnHgiwLlvI-WLUE0ZAWD947hJ5AY1K_1rg>
 <xmx:57sMYwTIqbqJ2pxIeFUjbgfxbYf89LgMzCu_0_IuRFkzau-uCAkF0Q>
 <xmx:6LsMY7AQ5Gi3WUbn8JoZmX7f1_xjJiKBWP6zpE-35jw4blSgQQYWOAruHFI>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 29 Aug 2022 09:15:18 -0400 (EDT)
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
Subject: [PATCH v2 30/41] drm/vc4: vec: Fix definition of PAL-M mode
Date: Mon, 29 Aug 2022 15:11:44 +0200
Message-Id: <20220728-rpi-analog-tv-properties-v2-30-459522d653a7@cerno.tech>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220728-rpi-analog-tv-properties-v2-0-459522d653a7@cerno.tech>
References: <20220728-rpi-analog-tv-properties-v2-0-459522d653a7@cerno.tech>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Mailer: b4 0.10.0-dev-65ba7
X-Developer-Signature: v=1; a=openpgp-sha256; l=1296; i=maxime@cerno.tech;
 h=from:subject:message-id; bh=tPg6Z+QHYzTZRNoX2QE1L9br4U069DFxWgKf5hS1TGY=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDMk8uxT+77r4asW9+0GuAtr263ZO8uXXLH4hEPO6r75P7OyT
 vVEPO0pZGMS4GGTFFFlihM2XxJ2a9bqTjW8ezBxWJpAhDFycAjCR+e4M/wyO82mumsTl7F17UOHbl9
 9CvrYss4W6q3yCzrIE/T3bVMHI8MkgcH2syNyr/v4zrs1YnirDKHpjafUmHmb54Ae6h5i5uAA=
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
PAL-M is a Brazilian analog TV standard that uses a PAL-style chroma=0D
subcarrier at 3.575611[888111] MHz on top of 525-line (480i60) timings.=0D
This commit makes the driver actually use the proper VEC preset for this=0D
mode instead of just changing PAL subcarrier frequency.=0D
=0D
Signed-off-by: Mateusz Kwiatkowski <kfyatek+publicgit@gmail.com>=0D
Signed-off-by: Maxime Ripard <maxime@cerno.tech>=0D
=0D
diff --git a/drivers/gpu/drm/vc4/vc4_vec.c b/drivers/gpu/drm/vc4/vc4_vec.c=
=0D
index 63e4e617e321..fa85dd260742 100644=0D
--- a/drivers/gpu/drm/vc4/vc4_vec.c=0D
+++ b/drivers/gpu/drm/vc4/vc4_vec.c=0D
@@ -69,6 +69,7 @@=0D
 #define VEC_CONFIG0_STD_MASK		GENMASK(1, 0)=0D
 #define VEC_CONFIG0_NTSC_STD		0=0D
 #define VEC_CONFIG0_PAL_BDGHI_STD	1=0D
+#define VEC_CONFIG0_PAL_M_STD		2=0D
 #define VEC_CONFIG0_PAL_N_STD		3=0D
 =0D
 #define VEC_SCHPH			0x108=0D
@@ -241,10 +242,9 @@ static const struct vc4_vec_tv_mode vc4_vec_tv_modes[]=
 =3D {=0D
 		.config1 =3D VEC_CONFIG1_C_CVBS_CVBS,=0D
 	},=0D
 	[VC4_VEC_TV_MODE_PAL_M] =3D {=0D
-		.mode =3D &drm_mode_576i,=0D
-		.config0 =3D VEC_CONFIG0_PAL_BDGHI_STD,=0D
-		.config1 =3D VEC_CONFIG1_C_CVBS_CVBS | VEC_CONFIG1_CUSTOM_FREQ,=0D
-		.custom_freq =3D 0x223b61d1,=0D
+		.mode =3D &drm_mode_480i,=0D
+		.config0 =3D VEC_CONFIG0_PAL_M_STD,=0D
+		.config1 =3D VEC_CONFIG1_C_CVBS_CVBS,=0D
 	},=0D
 };=0D
 =0D
=0D
-- =0D
b4 0.10.0-dev-65ba7=0D
