Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BB1555FFF9
	for <lists+dri-devel@lfdr.de>; Wed, 29 Jun 2022 14:36:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 522E014A608;
	Wed, 29 Jun 2022 12:36:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com
 [64.147.123.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A8AFB14A606
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Jun 2022 12:36:19 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id 6C7813200951;
 Wed, 29 Jun 2022 08:36:18 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Wed, 29 Jun 2022 08:36:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm1; t=1656506177; x=1656592577; bh=TQ
 xVDYAWo4bfQyvO2Y+yL2bws51iy3TAoAwjN/fZt1U=; b=qTb5HukKayTwhhzz1D
 05H7SuVoPrEjzJSf/uuv3B+orNG3OsX5lND3bPxXbZn2yC6vFTrTcpJlZj2wEti/
 DsrCYwdGikKoVQOTgWCSakvzMRQAjeKOxDkCndu3NUnF58Bv7Mq5KMzZStz7kL0/
 o6k1RAPaxEcvk6bF+GgR0jUuS0CjqQnO45sJneaBl2sgn/pvXmrORJnkkInSVMun
 DRqe0ckuFhNDbd3/ZBJxqVPFZXeRL7BsDuEeCgJcZqd6LD84d/g9/Z1FxfWiEgTV
 x5FZFfVynsIqDqqFe1CgF+jy+bOxSG4Nut6kvQWg+NKNSGtrj8aAv2jOkWkO/aJs
 8JbQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; t=1656506177; x=1656592577; bh=TQxVDYAWo4bfQ
 yvO2Y+yL2bws51iy3TAoAwjN/fZt1U=; b=akW1dWuk6OVuCOX2tnTX+UkEA+4aO
 YZVB3KYN4gOhWI5uP2UTCuyPSDPuEMx9PoBQOPlW0VYYv80TL2bk72YzGYEPJSGC
 faRFteXOr8z8g4b89Cylbn3aK2I148ag1CsebNMDjYw/2h+9y00gmBoIti6cz0NS
 E2kskOlYh5jHGizu8UwR/NEdfO46ySVtxNfpViORTAvGXdR3DLHbCKEX7wa1pZGI
 YiWaTU056lbM9sdr3jaq6RE/NzLSdlqMuwq9XYbs/4y8ARjEc+clEuArejnRgVyO
 tY0uWBe6GpXNsfpTzfciB4BOyvnlBig1+4ALLH3HGpozPHZYgja16O8ow==
X-ME-Sender: <xms:QUe8YrVW4Pf1ATyQhXYcbHTgSTFb4UIk9g5-jpZfJV5hjSonAyYNeA>
 <xme:QUe8YjmlPUVjIp_j9Wh8R6Kz3LvBj6iAhFvbIMa9JoS4Nk64XMa5h2MmR5P_ovNI5
 e4YOjHdgrSrkJHGV24>
X-ME-Received: <xmr:QUe8YnbnnJMzrPaeode5THMge5awEQliSdQBHvMsdQvzv-_OMeww4_QKznYiaGIBVNtVWrHyOU5rMM3jpXWWdNMpVlDCcAI1wXU20XA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudegledgheefucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeelkeefteduhfekjeeihfetudfguedvveekkeetteekhfekhfdtlefgfedu
 vdejhfenucevlhhushhtvghrufhiiigvpeejnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:QUe8YmX9bcudopvJ-lccsr5i5qcIdN9DxrGc4i35BP_CGMuf7NnzBw>
 <xmx:QUe8Yllm3dqdpcCmwWTtmS8ZlkW2PUgGu2PoWhVRh1SoU2Y6AvtHfQ>
 <xmx:QUe8YjcmKyNR3kHBRCWdSC9R2CB_zfrCzELjNaqjwIDZVvxy9NFKBg>
 <xmx:QUe8YosBn820ZW0KoXz6s6GawXXVoCYzrJoCGRzgbHJfUAvzwNoF5A>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 29 Jun 2022 08:36:17 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>,
 Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>
Subject: [PATCH v3 21/71] drm/vc4: crtc: Switch to drmm_kzalloc
Date: Wed, 29 Jun 2022 14:34:20 +0200
Message-Id: <20220629123510.1915022-22-maxime@cerno.tech>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220629123510.1915022-1-maxime@cerno.tech>
References: <20220629123510.1915022-1-maxime@cerno.tech>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: dri-devel@lists.freedesktop.org,
 Dave Stevenson <dave.stevenson@raspberrypi.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Our internal structure that stores the DRM entities structure is allocated
through a device-managed kzalloc.

This means that this will eventually be freed whenever the device is
removed. In our case, the most likely source of removal is that the main
device is going to be unbound, and component_unbind_all() is being run.

However, it occurs while the DRM device is still registered, which will
create dangling pointers, eventually resulting in use-after-free.

Switch to a DRM-managed allocation to keep our structure until the DRM
driver doesn't need it anymore.

Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_crtc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/vc4/vc4_crtc.c b/drivers/gpu/drm/vc4/vc4_crtc.c
index bcce61879d53..d5158a6c0f21 100644
--- a/drivers/gpu/drm/vc4/vc4_crtc.c
+++ b/drivers/gpu/drm/vc4/vc4_crtc.c
@@ -1284,7 +1284,7 @@ static int vc4_crtc_bind(struct device *dev, struct device *master, void *data)
 	struct drm_crtc *crtc;
 	int ret;
 
-	vc4_crtc = devm_kzalloc(dev, sizeof(*vc4_crtc), GFP_KERNEL);
+	vc4_crtc = drmm_kzalloc(drm, sizeof(*vc4_crtc), GFP_KERNEL);
 	if (!vc4_crtc)
 		return -ENOMEM;
 	crtc = &vc4_crtc->base;
-- 
2.36.1

