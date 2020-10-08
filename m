Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C32E288391
	for <lists+dri-devel@lfdr.de>; Fri,  9 Oct 2020 09:30:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1BA906EC5D;
	Fri,  9 Oct 2020 07:29:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new2-smtp.messagingengine.com (new2-smtp.messagingengine.com
 [66.111.4.224])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E6376E3D0
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Oct 2020 11:25:28 +0000 (UTC)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailnew.nyi.internal (Postfix) with ESMTP id AF7DB58030C;
 Thu,  8 Oct 2020 07:25:25 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute6.internal (MEProxy); Thu, 08 Oct 2020 07:25:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding; s=fm1; bh=sHcEwSUG7e+/roVIKWUn3IXraM
 j4SoT70hMYWvgm1EQ=; b=s2N77QSV0n6haN+NoA71D+iQFXWrVmuxCWYg7kV4O5
 AE+EMpRCDfkN+BHl8S04sf0beV7Cfc41dS1vH0eftvD3NQD3Q8sOh2YVJkcGE2RC
 GEHK7h7DeSzyR6OyVclCpeFs4HZl71FIbiAJRIvKVzApx5aoCznsCEOOJBy20EXY
 ghkEmHf211GQqgsxm122BmVFnhTELgsDk95CFm4uYGs9dPOZjbw283kEx1GToZRF
 Zo5e35RgBnlos5Bn8hKJs15muPCtLm81NxzAF2G1PUbU7qNxrLRrPz73em1Xtzr2
 k4iW0UPX8xzY7Gp68xWxEH3v1GKr7DxRrby83B7mLwyQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=sHcEwSUG7e+/roVIK
 WUn3IXraMj4SoT70hMYWvgm1EQ=; b=nHqc2FbBWzZ2+DZiYCapf46+ERei1j4Fj
 t78Jlt5HgJpDadG0VkoQjvhZ9MzcxGxWFN+A7AtwFh4ldjTLamT3Rr7WosY2fMlS
 B1w9cH/UVFb055Xtu7p18jBQFVX054ptqTBc3KQEn15od9WhNWtUDLAnehpedXsZ
 m7k3W40KgJZyYIkEpLyEOncMV0az4ODGDS3foUCIXOh8EuOeVyXjmFpKhDZW8Shm
 ji3r1bjlG0tMzh6FyCNture4CDJhh1qny1eRiu1NZGlS0ZWXGIaMK0loFDjYwFQj
 tYNda3VMaNqBKKij3NettgxS4cIlPTbVJ6s9qQVj4F1TWQzv9WjFg==
X-ME-Sender: <xms:Ivd-X15fw2-BTYMMx2Q5LSwX2c0mXWT9ohEdjfErmevrxK9l3vA45Q>
 <xme:Ivd-Xy4rfNT6wb1iLSsI9CeJ_mEeJn37D954yxyDfLijDnj5hUEf_AACbuDqkzoEu
 0c2UKllEAPPqW3oURY>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrgeelgddufecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgggfestdekredtredttdenucfhrhhomhepofgrgihimhgvucft
 ihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtthgvrh
 hnpeejffehuddvvddvlefhgeelleffgfeijedvhefgieejtdeiueetjeetfeeukeejgeen
 ucfkphepledtrdekledrieekrdejieenucevlhhushhtvghrufhiiigvpedtnecurfgrrh
 grmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:Ivd-X8cOcrHj4KIxIBujIae34VcELnOWBcyPwZb6l7VYVm9bvUW-3g>
 <xmx:Ivd-X-KALn128y4sinZe8W6yaCsiuwDgLbKD3Csm3pe0X7e9jxN15g>
 <xmx:Ivd-X5KwMx1tbPrixKhy-eH6XX4UPtm1JnFxN_qwH_WqmNhlCjOcrw>
 <xmx:Jfd-Xy7c3wleo_ag90sUgW6Gk9iazziohPbEdcrcquQtpP8a7xRgsg>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id 104CF3280063;
 Thu,  8 Oct 2020 07:25:21 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh+dt@kernel.org>,
 Frank Rowand <frowand.list@gmail.com>,
 Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>,
 Eric Anholt <eric@anholt.net>
Subject: [PATCH 1/4] drm/vc4: kms: Split the HVS muxing check in a separate
 function
Date: Thu,  8 Oct 2020 13:25:16 +0200
Message-Id: <20201008112519.43691-1-maxime@cerno.tech>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 09 Oct 2020 07:29:53 +0000
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
Cc: devicetree@vger.kernel.org, Tim Gover <tim.gover@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 dri-devel@lists.freedesktop.org, Hoegeun Kwon <hoegeun.kwon@samsung.com>,
 bcm-kernel-feedback-list@broadcom.com, linux-rpi-kernel@lists.infradead.org,
 Phil Elwell <phil@raspberrypi.com>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The code that assigns HVS channels during atomic_check is starting to grow
a bit big, let's move it into a separate function.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_kms.c | 18 +++++++++++++++---
 1 file changed, 15 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_kms.c b/drivers/gpu/drm/vc4/vc4_kms.c
index 149825ff5df8..846fe8b3cb7a 100644
--- a/drivers/gpu/drm/vc4/vc4_kms.c
+++ b/drivers/gpu/drm/vc4/vc4_kms.c
@@ -612,13 +612,13 @@ static const struct drm_private_state_funcs vc4_load_tracker_state_funcs = {
 #define NUM_OUTPUTS  6
 #define NUM_CHANNELS 3
 
-static int
-vc4_atomic_check(struct drm_device *dev, struct drm_atomic_state *state)
+static int vc4_pv_muxing_atomic_check(struct drm_device *dev,
+				      struct drm_atomic_state *state)
 {
 	unsigned long unassigned_channels = GENMASK(NUM_CHANNELS - 1, 0);
 	struct drm_crtc_state *old_crtc_state, *new_crtc_state;
 	struct drm_crtc *crtc;
-	int i, ret;
+	unsigned int i;
 
 	/*
 	 * Since the HVS FIFOs are shared across all the pixelvalves and
@@ -691,6 +691,18 @@ vc4_atomic_check(struct drm_device *dev, struct drm_atomic_state *state)
 		}
 	}
 
+	return 0;
+}
+
+static int
+vc4_atomic_check(struct drm_device *dev, struct drm_atomic_state *state)
+{
+	int ret;
+
+	ret = vc4_pv_muxing_atomic_check(dev, state);
+	if (ret)
+		return ret;
+
 	ret = vc4_ctm_atomic_check(dev, state);
 	if (ret < 0)
 		return ret;
-- 
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
