Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BF887554D61
	for <lists+dri-devel@lfdr.de>; Wed, 22 Jun 2022 16:35:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C6A01133A9;
	Wed, 22 Jun 2022 14:35:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com
 [64.147.123.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7989B1133A9
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Jun 2022 14:35:15 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.west.internal (Postfix) with ESMTP id 4BD0C3200942;
 Wed, 22 Jun 2022 10:35:14 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Wed, 22 Jun 2022 10:35:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm1; t=1655908513; x=1655994913; bh=Rs
 RIpUlOT9kuILSlKRRCKRjhOmSJb5m4YvFymsYvUPs=; b=gtItSRbrYVQsLPFKQK
 6uxtw33O73fRf9bmpqYS+fHKBcBOKwz02aSUt9CUqtILOyyL999WQXJEYo/liFsl
 8YTAryTgI3hzOjy/5B5wkaxCJ9JhR3emQTP3VR9Xm9atpXus5NSKmaK5WX81NBp4
 nZ+3wreCJp8dlIkBSigL5Uih4KM66Mt8l9JTCo1/EftIum2x7iFAu2PCoEoaFfgY
 oJQyZq8fd2ljkaZLcr5yBmIHtM5uZLu3/AhHgxPVjDxtaVsV16RVLO+IUwze7z1B
 bWXHpSspwaNETbENCuK5Z0IGU//77S/JYtAWdlb2nNg36W5ez43WYrBU9bhv7d9j
 ekWA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; t=1655908513; x=1655994913; bh=RsRIpUlOT9kuI
 LSlKRRCKRjhOmSJb5m4YvFymsYvUPs=; b=D8eY8jBw5ilUSHoCwc3F2nbzffJ8O
 oWms+X60q3sgmydU5ZdKF5aRXRLd87uEStEnKs6CdcX305q/TiHneSWdY/Pi5to0
 GfrOCLsvZZlLMwSHVouxUx2Ef20V4YTIz0flup4cC/bLvy6uftgFkRief+Lkq+FP
 GygEUcitIt4ettPchtqQE6A227372TFlUSGnxc06goSeWDyWWtNKtqbEsltom5c8
 1drsnSBHnWPX3wUaIrP3xdUg8AmulaVqHEqXLPf6sUDGrd+Y2+dvINEemU176pvz
 fBUZFJUmWAA9UPk4Ww6hfq8LHR3IIf2BdLhANwIkQFim0kB2O3dHektug==
X-ME-Sender: <xms:oSizYpeLDtGbJPVldUOpnHfu9uK6jJlRTKnef4edG94UNivvkve8gQ>
 <xme:oSizYnM1xf3Vf_YnHLYXWJkdD-1LqfusPNkkso8F1Trh8OtFOqgqHTf656Y62LYmK
 wOcUu4RAGeRfj1jw9I>
X-ME-Received: <xmr:oSizYihsYTLDYx9zNxPgfSbRluEcZVCDjGSJiyGXT7pZgxNIvLXQera0deOiPVVBHrB45bJcYFg85wUvfqZootYn2nK_gBJQNs9jsHo>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudefhedgjeekucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeelkeefteduhfekjeeihfetudfguedvveekkeetteekhfekhfdtlefgfedu
 vdejhfenucevlhhushhtvghrufhiiigvpeeknecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:oSizYi9paqTLv-fbnF0NBCi3NnFSvxZLCbncmabMrACv7w-4c3hkQQ>
 <xmx:oSizYlvHZpG_kDwZNLt4z0pxsR4iwagm4GeY2qeTSrlLu0xKakTOTw>
 <xmx:oSizYhFAqXIKotQKXJyh_L0erBxMGuEEXFpm9a49OKpbTnhIxVBQNg>
 <xmx:oSizYvKiSA0cSzAFdybpja-xa6UezhvumFU9ofg2ihx_if8jNAkZCw>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 22 Jun 2022 10:35:13 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>,
 Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>
Subject: [PATCH v2 57/68] drm/vc4: vec: Switch to DRM-managed encoder
 initialization
Date: Wed, 22 Jun 2022 16:31:58 +0200
Message-Id: <20220622143209.600298-58-maxime@cerno.tech>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220622143209.600298-1-maxime@cerno.tech>
References: <20220622143209.600298-1-maxime@cerno.tech>
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The current code will call drm_encoder_cleanup() when the device is
unbound. However, by then, there might still be some references held to
that encoder, including by the userspace that might still have the DRM
device open.

Let's switch to a DRM-managed initialization to clean up after ourselves
only once the DRM device has been last closed.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_vec.c | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_vec.c b/drivers/gpu/drm/vc4/vc4_vec.c
index 2e9dc09fc6f0..518b66bcc0b5 100644
--- a/drivers/gpu/drm/vc4/vc4_vec.c
+++ b/drivers/gpu/drm/vc4/vc4_vec.c
@@ -528,12 +528,18 @@ static int vc4_vec_bind(struct device *dev, struct device *master, void *data)
 
 	pm_runtime_enable(dev);
 
-	drm_simple_encoder_init(drm, &vec->encoder.base, DRM_MODE_ENCODER_TVDAC);
+	ret = drmm_encoder_init(drm, &vec->encoder.base,
+				NULL,
+				DRM_MODE_ENCODER_TVDAC,
+				NULL);
+	if (ret)
+		goto err_put_runtime_pm;
+
 	drm_encoder_helper_add(&vec->encoder.base, &vc4_vec_encoder_helper_funcs);
 
 	ret = vc4_vec_connector_init(drm, vec);
 	if (ret)
-		goto err_destroy_encoder;
+		goto err_put_runtime_pm;
 
 	dev_set_drvdata(dev, vec);
 
@@ -541,8 +547,7 @@ static int vc4_vec_bind(struct device *dev, struct device *master, void *data)
 
 	return 0;
 
-err_destroy_encoder:
-	drm_encoder_cleanup(&vec->encoder.base);
+err_put_runtime_pm:
 	pm_runtime_disable(dev);
 
 	return ret;
@@ -554,7 +559,6 @@ static void vc4_vec_unbind(struct device *dev, struct device *master,
 	struct vc4_vec *vec = dev_get_drvdata(dev);
 
 	drm_connector_cleanup(&vec->connector);
-	drm_encoder_cleanup(&vec->encoder.base);
 	pm_runtime_disable(dev);
 }
 
-- 
2.36.1

