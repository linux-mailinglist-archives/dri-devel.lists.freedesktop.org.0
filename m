Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D799664597E
	for <lists+dri-devel@lfdr.de>; Wed,  7 Dec 2022 12:56:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 31B9510E3A6;
	Wed,  7 Dec 2022 11:56:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6FFF310E39B
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Dec 2022 11:55:38 +0000 (UTC)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
 by mailout.nyi.internal (Postfix) with ESMTP id C613F5C01D2;
 Wed,  7 Dec 2022 06:55:37 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute6.internal (MEProxy); Wed, 07 Dec 2022 06:55:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm2; t=1670414137; x=
 1670500537; bh=KDXnofUNT0I/LkLW2Xe++pwe0GlWoAoqzj43/HZ72T4=; b=F
 C9ZYvM4xYi843Q2Mbz5jmzjroekj2WSzYl5MtVzUFvJ+zjPdfMD9rwD/pfysarB5
 JPTKlm/9yTBqMoz4XBhF8kRKxqvv6WNyBblKklUyh+YB83FoEfQY+ufAb4f7gWEr
 cZTqQP/vf635WUwWCOOGp7R7WJIpzTcuk/pSS0pBsKdUWLtZhV5TZ6mUg5MtjGUx
 gfZTfemltkyBpDV8Wf57ITDdSSvIl1Q08TbJak49Ci5p7R6Pn+kFpdsrplgelRyq
 YaFOueHcVGzuaD5fKo9cVUh1oBuL3T8fLAagdBY1o4ZpZ5c8OLyVuJSWksbi4wI8
 J6HJwNHBWOUEB9jFwyUiA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1670414137; x=
 1670500537; bh=KDXnofUNT0I/LkLW2Xe++pwe0GlWoAoqzj43/HZ72T4=; b=O
 7eF9M92z4LzKfQPWFkJD948iQYfszcp+HfweaoYNlgvbIgY/ePMUf1X9s1HXOUXy
 LleScZagN/HKmqd3CcHYrfU7KDdqk+zpEpOhMXDTwFBh01MLbHQIYIXJ98OOppiq
 7DrOgKG8zbRRGoMZ59vB6N+/cmiZDrNYZxS0OO+KFsLLf9A3sq0cQbS8Ydy2aUDO
 I142lhmF7amIglBDO1x6wAcaIZGpPHG/s0xgAhVMO989T0zrS1t9/d1gkj/dKiCV
 gt1ffm8MA9y/bZl6rYb32Rr1PQWa+uzrKhZpYN4rbI08ZeBA48GlLMnUhSe1/y42
 2UTm9E8eB4/KhMu9a4rCw==
X-ME-Sender: <xms:OX-QY1qczVMuncqrbrft_bGmUHznv2mnitOweeS69NIbZuCvlkGlHQ>
 <xme:OX-QY3qK8t-UJq7uCQZsgW4qgjTY0wCQUeTA4PU1jPcN24jE0hwPE-ZamZqhDb_fk
 uRIsRGcOAYHd3v3xDw>
X-ME-Received: <xmr:OX-QYyPqhq47DW9QGlNq0E2iSBJUOZppzM7-t7KDdm1ho1sC2UfL2q9NIksvEqTw545wB29H0OkE-NSWSRjWeaD8oC5u-pV5AkkVtDx2SQhMvQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrudekgdefgecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhfffugggtgffkfhgjvfevofesthejredtredtjeenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeevvdelieejgedvkeffheekheeilefhgefgffehteekueelvddtueffheet
 ledtffenucevlhhushhtvghrufhiiigvpeefnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:OX-QYw6P9Px1MJs6-izmvB4i3IPSDTP_lYTrBWpHuL0K9EELPfXbYw>
 <xmx:OX-QY05B061o16Fa5SPQwI5qXd10pDeT1eIVcQusbAT7PeJQ7RU_1Q>
 <xmx:OX-QY4h-bSidXQmSIwsRZgmMTWY3sRSca21qYC415tXtxo0_q8SBGw>
 <xmx:OX-QYxx8fFoKrgsqFhSm6k766TWvI6bNG9WFRL42wx0Y4T0iVR62_Q>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 7 Dec 2022 06:55:37 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
Date: Wed, 07 Dec 2022 12:53:25 +0100
Subject: [PATCH 14/15] drm/vc4: hdmi: Correct interlaced timings again
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20221207-rpi-hvs-crtc-misc-v1-14-1f8e0770798b@cerno.tech>
References: <20221207-rpi-hvs-crtc-misc-v1-0-1f8e0770798b@cerno.tech>
In-Reply-To: <20221207-rpi-hvs-crtc-misc-v1-0-1f8e0770798b@cerno.tech>
To: Emma Anholt <emma@anholt.net>, Maxime Ripard <mripard@kernel.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Eric Anholt <eric@anholt.net>
X-Mailer: b4 0.11.0-dev-8c583
X-Developer-Signature: v=1; a=openpgp-sha256; l=1375; i=maxime@cerno.tech;
 h=from:subject:message-id; bh=2Svk6pZ3lWM5+mLTO01TRJl0JjlnLEjaMR/enj/vUCc=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDMkT6lb2qtkW3Z7X+fCoW5fyptnbzOfOrUnzYAiftvSYvL5p
 rO3zjlIWBjEuBlkxRZYYYfMlcadmve5k45sHM4eVCWQIAxenAEzk8DyGf2rlLa1r7vxJ5342I5b72q
 rd0tOVNr178S77jat40LzXHZKMDDc++jXoPFU5VXdw17OO54UPv8X+M02/cVgxknftFoWeGm4A
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
Cc: Maxime Ripard <maxime@cerno.tech>,
 Mateusz Kwiatkowski <kfyatek+publicgit@gmail.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Dave Stevenson <dave.stevenson@raspberrypi.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Dave Stevenson <dave.stevenson@raspberrypi.com>

The back porch timings were correct, only the sync offset was wrong.
Correct timing is now reported for 1080i and 576i, but the h offset is
incorrect for 480i for non-obvious reasons.

Fixes: c0ba150ce468 ("drm/vc4: Correct HDMI timing registers for interlaced modes")
Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_hdmi.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
index 12a00d644b61..e027381b7331 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -1298,11 +1298,12 @@ static void vc5_hdmi_set_timings(struct vc4_hdmi *vc4_hdmi,
 		     VC4_SET_FIELD(mode->crtc_vdisplay, VC5_HDMI_VERTA_VAL));
 	u32 vertb = (VC4_SET_FIELD(mode->htotal >> (2 - pixel_rep),
 				   VC5_HDMI_VERTB_VSPO) |
-		     VC4_SET_FIELD(mode->crtc_vtotal - mode->crtc_vsync_end,
+		     VC4_SET_FIELD(mode->crtc_vtotal - mode->crtc_vsync_end +
+				   interlaced,
 				   VC4_HDMI_VERTB_VBP));
 	u32 vertb_even = (VC4_SET_FIELD(0, VC5_HDMI_VERTB_VSPO) |
 			  VC4_SET_FIELD(mode->crtc_vtotal -
-					mode->crtc_vsync_end - interlaced,
+					mode->crtc_vsync_end,
 					VC4_HDMI_VERTB_VBP));
 	unsigned long flags;
 	unsigned char gcp;

-- 
2.38.1
