Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2201E42CBC4
	for <lists+dri-devel@lfdr.de>; Wed, 13 Oct 2021 22:49:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3563B6EB3B;
	Wed, 13 Oct 2021 20:49:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new3-smtp.messagingengine.com (new3-smtp.messagingengine.com
 [66.111.4.229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9FFB06EB2C;
 Wed, 13 Oct 2021 20:49:22 +0000 (UTC)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailnew.nyi.internal (Postfix) with ESMTP id 14B69581176;
 Wed, 13 Oct 2021 16:49:22 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute6.internal (MEProxy); Wed, 13 Oct 2021 16:49:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=u92.eu; h=from
 :to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm3; bh=r21xTV04JhLQh
 FFcwkc0d4AVLdWU1vIuTxgVGoPXBxw=; b=jmggCI4nAHOjgsyZ7LKJYxRovm3oa
 e1eidPiQPqiTEN5n3HSMh+9QE/ovfE8BF4dk6niXE4xqsPpuM6d3FVin9ZcNt4Uf
 MOJfoJyaCjxHvTQaznR0WLTzKWkx5g6TPoVO8mTxM78Jnxraghh5baPq+sCwleal
 9U6SFRbGtL0fCwG75kHXIq3Rz4i7m1gu3TmvBo6IWxskJP1teg5x3agxP8J8yYgN
 pBpRksjRniLRt/I6kfWlQ8vp7wOnbXaGdVRaQ9HM4HNeXvNTLZiMRYEM0FioF/nc
 uB3KOZmVO8G2qh1kpVd421zqRGhbTOYO983aQOVLBgtW5WiMunLMRypRw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=r21xTV04JhLQhFFcwkc0d4AVLdWU1vIuTxgVGoPXBxw=; b=APCckOHB
 yQUvsruSR9YI/RkIl0TsTDqo9b8ukMjGIafQvtaVRYG7gbkMz8QL6Oc/qJdPGrl/
 8bxO4nIcojW91vqtUejR51nV3CHRred37TRDyc10ggNXNz1FzK7NWN8aqbXsr2Fe
 qjwk7XWOTVrKEoifL40or+JrMBgpqYzjg+IlEYjWu8hUlmnp8dJvL/6/GsbvGgRZ
 7wyQZfhkGf4E+qvKeZ9ZIsxLoDgXlLzgKmW+TLnXrmH17yCgociqj42KTeXnakCN
 E9kwkykGSjXGhixshWSIDINpUJVhvg1hKU2FdZ6SmsVWT1FHi0CK7v2CkuIwL8il
 99jKAPfe446EDg==
X-ME-Sender: <xms:UUZnYTlSd3bsa2XAUqRMxS0ln0yChXmRqg0jkR5o3jmsxjHNw0865A>
 <xme:UUZnYW1ULyetTpPE_X6Whoso1i3gatmkYkkdOKgpmCnB6Neyg3B8NOD8cjQdJFTEN
 J6pUhmwSo_FSVBLOQ>
X-ME-Received: <xmr:UUZnYZo43YY9-v3nmnI56x-S2v-_BT9O5NOdWfRHowPNnk2SU2VuSefrA1MZFRmVarnG>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrvddutddgudehtdcutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffojghfggfgsedtke
 ertdertddtnecuhfhrohhmpefhvghrnhgrnhguohcutfgrmhhoshcuoehgrhgvvghnfhho
 ohesuhelvddrvghuqeenucggtffrrghtthgvrhhnpeekleekjedtheejheekfefggeevvd
 fgueegffeuveduhfehueegkeeijedvvdejfeenucevlhhushhtvghrufhiiigvpeefnecu
 rfgrrhgrmhepmhgrihhlfhhrohhmpehgrhgvvghnfhhoohesuhelvddrvghu
X-ME-Proxy: <xmx:UUZnYbnh5itb_Alq1fRxept250ycGkhXGr5y9qYq0i3CAx4fvDu5og>
 <xmx:UUZnYR0W6uAw_PL9Pp8oaWrrecNSGHMGMF-eqkjf-LjS20qlmsXNvA>
 <xmx:UUZnYasULB3Tv5R9n0-POOybTxxcSjYA_08iao68Bqjs0IVdK7HLFw>
 <xmx:UkZnYbziS7hsVZP139IWIDU_JLQTqi12-C3m1xcTLNISbyDSKSPzJA>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 13 Oct 2021 16:49:19 -0400 (EDT)
From: Fernando Ramos <greenfoo@u92.eu>
To: dri-devel@lists.freedesktop.org
Cc: linux-kernel@vger.kernel.org, sean@poorly.run, linux-doc@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
 linux-tegra@vger.kernel.org
Subject: [PATCH v4 10/20] drm/nouveau: cleanup: drm_modeset_lock_all() -->
 DRM_MODESET_LOCK_ALL_BEGIN()
Date: Wed, 13 Oct 2021 22:48:36 +0200
Message-Id: <20211013204846.90026-11-greenfoo@u92.eu>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211013204846.90026-1-greenfoo@u92.eu>
References: <20211013204846.90026-1-greenfoo@u92.eu>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

As requested in Documentation/gpu/todo.rst, replace driver calls to
drm_modeset_lock_all() with DRM_MODESET_LOCK_ALL_BEGIN() and
DRM_MODESET_LOCK_ALL_END()

Signed-off-by: Fernando Ramos <greenfoo@u92.eu>
Reviewed-by: Sean Paul <sean@poorly.run>
---
 drivers/gpu/drm/nouveau/dispnv50/disp.c | 15 ++++++++++-----
 1 file changed, 10 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/dispnv50/disp.c b/drivers/gpu/drm/nouveau/dispnv50/disp.c
index d7b9f7f8c9e3..86e18a844953 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/disp.c
+++ b/drivers/gpu/drm/nouveau/dispnv50/disp.c
@@ -42,6 +42,7 @@
 #include <drm/drm_probe_helper.h>
 #include <drm/drm_scdc_helper.h>
 #include <drm/drm_vblank.h>
+#include <drm/drm_drv.h>
 
 #include <nvif/push507c.h>
 
@@ -667,16 +668,18 @@ nv50_audio_component_bind(struct device *kdev, struct device *hda_kdev,
 	struct drm_device *drm_dev = dev_get_drvdata(kdev);
 	struct nouveau_drm *drm = nouveau_drm(drm_dev);
 	struct drm_audio_component *acomp = data;
+	struct drm_modeset_acquire_ctx ctx;
+	int ret;
 
 	if (WARN_ON(!device_link_add(hda_kdev, kdev, DL_FLAG_STATELESS)))
 		return -ENOMEM;
 
-	drm_modeset_lock_all(drm_dev);
+	DRM_MODESET_LOCK_ALL_BEGIN(drm_dev, ctx, 0, ret);
 	acomp->ops = &nv50_audio_component_ops;
 	acomp->dev = kdev;
 	drm->audio.component = acomp;
-	drm_modeset_unlock_all(drm_dev);
-	return 0;
+	DRM_MODESET_LOCK_ALL_END(drm_dev, ctx, ret);
+	return ret;
 }
 
 static void
@@ -686,12 +689,14 @@ nv50_audio_component_unbind(struct device *kdev, struct device *hda_kdev,
 	struct drm_device *drm_dev = dev_get_drvdata(kdev);
 	struct nouveau_drm *drm = nouveau_drm(drm_dev);
 	struct drm_audio_component *acomp = data;
+	struct drm_modeset_acquire_ctx ctx;
+	int ret;
 
-	drm_modeset_lock_all(drm_dev);
+	DRM_MODESET_LOCK_ALL_BEGIN(drm_dev, ctx, 0, ret);
 	drm->audio.component = NULL;
 	acomp->ops = NULL;
 	acomp->dev = NULL;
-	drm_modeset_unlock_all(drm_dev);
+	DRM_MODESET_LOCK_ALL_END(drm_dev, ctx, ret);
 }
 
 static const struct component_ops nv50_audio_component_bind_ops = {
-- 
2.33.0

