Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CA2975FB0E8
	for <lists+dri-devel@lfdr.de>; Tue, 11 Oct 2022 13:05:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F64510E04B;
	Tue, 11 Oct 2022 11:04:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [IPv6:2a00:1450:4864:20::632])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8529510E002
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Oct 2022 11:04:44 +0000 (UTC)
Received: by mail-ej1-x632.google.com with SMTP id nb11so30589428ejc.5
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Oct 2022 04:04:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0FGgm1Cm39i7x7/bM2g34/9gWqb7zDTDtawBA9mxFGw=;
 b=PXplF7HopM11ptp8/GEUKRxoD+SzQeUomywHQKMPpPhomu0wehubwYCa4EF40Ss4wA
 nwuApzbM3IgqI2bUFba1+Qk0rKXeEV86i93bBNxXGbEqQk4QBIOXnuXU7FjOuvjUMbmC
 80RPVlPB2+L0kGMc3Au3DrxhVM+QUJBUbm8xBz9gDzDZ8kJmjG/ZHTi9FPQChRdbCA7/
 PE7I8A1EGugY9VqA5uiUltrWQbyjPsGNDlclR5CKs5zVbaYpi7eliAoLV7sgEtVzyvzL
 4SRSGVonAG9RoxoigyRt8dUKhH8e9xiQy/546Kb03D10WEBtWEPxGn8hoYL2XQmildUm
 RM2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0FGgm1Cm39i7x7/bM2g34/9gWqb7zDTDtawBA9mxFGw=;
 b=aeJsseqm5BaGiczh6GybzTnOwerisdubq/iw7hG6gmYQ5FRnMYH9ZML2OioJZM03uK
 RGplGTobNtR0DOpwVtIITfi6MWaPmXQBihIBOuNYoE3Jvd4bld1mozdpnDsS3hnwtNvs
 DO3ArBmvTR3Fna+DIx8uvhNED/Iu6tTHkk52adnk1iyn0vrdHKfnT1bPctDr2opu5+wA
 Tjj9X0Pv4fgTwGGBq8LG2kqEZ0GI7rIZEJiNHg7kSX1kCVrxuXZJLyI5H/7dclOR8EDy
 /t3LNR2pWg3FeIkUWsmGfjQjC3X0Que4hgGBS4qioIsBSuQlOAVf2n5jw3hvF7QpUUw1
 viMQ==
X-Gm-Message-State: ACrzQf1tKP5hz4dldb/OAOges+JgCn2Ioe94JMlZd3JhbSivdlcJeGMg
 KaZlsiFyMdSsmHSg7n43JIpkVfyRPMw=
X-Google-Smtp-Source: AMsMyM5qcI8HlH25aQQL25s7idanHPUdGmUXxnLXTaajE5Oeq7qbbFBrHUNp0KYU1HpXH0pyeNqnyQ==
X-Received: by 2002:a17:907:7210:b0:783:37b0:b5ca with SMTP id
 dr16-20020a170907721000b0078337b0b5camr18158347ejc.689.1665486283127; 
 Tue, 11 Oct 2022 04:04:43 -0700 (PDT)
Received: from able.fritz.box (p5b0eacfe.dip0.t-ipconnect.de. [91.14.172.254])
 by smtp.gmail.com with ESMTPSA id
 v8-20020aa7d9c8000000b00458478a4295sm8938122eds.9.2022.10.11.04.04.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Oct 2022 04:04:42 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: dri-devel@lists.freedesktop.org,
	daniel@ffwll.ch,
	airlied@linux.ie
Subject: [PATCH 2/2] drm: add DRIVER_RENDER_ONLY
Date: Tue, 11 Oct 2022 13:04:37 +0200
Message-Id: <20221011110437.15258-3-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221011110437.15258-1-christian.koenig@amd.com>
References: <20221011110437.15258-1-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This allows to suppress creating the primary node. Useful for drivers
which don't expose any display functionality, but are render only by
design.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/drm_drv.c   | 10 ++++++----
 drivers/gpu/drm/drm_prime.c |  2 +-
 include/drm/drm_drv.h       |  7 +++++++
 3 files changed, 14 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/drm_drv.c b/drivers/gpu/drm/drm_drv.c
index d81783f43452..4a525f78a932 100644
--- a/drivers/gpu/drm/drm_drv.c
+++ b/drivers/gpu/drm/drm_drv.c
@@ -634,9 +634,11 @@ static int drm_dev_init(struct drm_device *dev,
 			goto err;
 	}
 
-	ret = drm_minor_alloc(dev, DRM_MINOR_PRIMARY);
-	if (ret)
-		goto err;
+	if (!drm_core_check_feature(dev, DRIVER_RENDER_ONLY)) {
+		ret = drm_minor_alloc(dev, DRM_MINOR_PRIMARY);
+		if (ret)
+			goto err;
+	}
 
 	ret = drm_legacy_create_map_hash(dev);
 	if (ret)
@@ -902,7 +904,7 @@ int drm_dev_register(struct drm_device *dev, unsigned long flags)
 		 driver->name, driver->major, driver->minor,
 		 driver->patchlevel, driver->date,
 		 dev->dev ? dev_name(dev->dev) : "virtual device",
-		 dev->primary->index);
+		 (dev->primary ?: dev->render)->index);
 
 	goto out_unlock;
 
diff --git a/drivers/gpu/drm/drm_prime.c b/drivers/gpu/drm/drm_prime.c
index a3f180653b8b..4afd3f15b135 100644
--- a/drivers/gpu/drm/drm_prime.c
+++ b/drivers/gpu/drm/drm_prime.c
@@ -740,7 +740,7 @@ int drm_gem_prime_mmap(struct drm_gem_object *obj, struct vm_area_struct *vma)
 	}
 
 	/* Used by drm_gem_mmap() to lookup the GEM object */
-	priv->minor = obj->dev->primary;
+	priv->minor = obj->dev->primary ?: obj->dev->render;
 	fil->private_data = priv;
 
 	ret = drm_vma_node_allow(&obj->vma_node, priv);
diff --git a/include/drm/drm_drv.h b/include/drm/drm_drv.h
index f6159acb8856..0a1450d47ca2 100644
--- a/include/drm/drm_drv.h
+++ b/include/drm/drm_drv.h
@@ -94,6 +94,13 @@ enum drm_driver_feature {
 	 * synchronization of command submission.
 	 */
 	DRIVER_SYNCOBJ_TIMELINE         = BIT(6),
+	/**
+	 * @DRIVER_RENDER_ONLY
+	 *
+	 * Driver is a render node only driver and don't want to support the
+	 * primary interface.
+	 */
+	DRIVER_RENDER_ONLY		= BIT(7),
 
 	/* IMPORTANT: Below are all the legacy flags, add new ones above. */
 
-- 
2.25.1

