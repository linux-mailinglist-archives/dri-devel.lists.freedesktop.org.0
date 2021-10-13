Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 16F5442CB74
	for <lists+dri-devel@lfdr.de>; Wed, 13 Oct 2021 22:49:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A85166EB14;
	Wed, 13 Oct 2021 20:49:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new3-smtp.messagingengine.com (new3-smtp.messagingengine.com
 [66.111.4.229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B36076EB13;
 Wed, 13 Oct 2021 20:48:59 +0000 (UTC)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailnew.nyi.internal (Postfix) with ESMTP id 28723581175;
 Wed, 13 Oct 2021 16:48:59 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute1.internal (MEProxy); Wed, 13 Oct 2021 16:48:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=u92.eu; h=from
 :to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm3; bh=4Oe5yMh7Te6eB
 YdkvCgUULOMM7ICrH5TnOSluUVONYs=; b=eW5Ip8AomcwuwiwMkMZP8t43/Zrzi
 j+VGIZA9Bp5PRBi6SxoyCqF6IvqryHr7L2g6iHdsblxzBtetWPB2YkTE91ObE5NI
 mvTlkgQnATZoBUUIAxYodaAEui40FxDNszbbcektD5jOH2jxhKTKXrcWMNiB0msK
 CzWvhLNGNZs29jV5TF8qbySckRH7T2CRFJMKEiKmSxwpTRRyfPubq7xQG3bfPBLB
 T8CNIdyk4sZttmciko0Y8lFZB8QgCncq4HViz9Bn3TDz0/6G6nHAbjJQ4dHdcQzp
 wqAHqoTtYWgHrfMc4HCT2P6TR6PFIl8obgtNaRjhFrq30dyMiOd0USC6w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=4Oe5yMh7Te6eBYdkvCgUULOMM7ICrH5TnOSluUVONYs=; b=lR7Vabyd
 wdaT0muwmAGHJkxGJpIJxF+2T3T91fYaijPGXeU7L4/16PIDzC8SpggRLtlBVX0A
 tLVzH4HxNGj2CpNX750OgLEp5Mi+o8/y+JtgdfqFe/G650Tbg+LTAS+mU9dPsVtp
 prVhCXGBv3xvaoaYfbiRZu0fX1YKdXH16xiITDVqOUUP8BJjFyGhJ3IGCIo+P+Sj
 o15/AsZCwIy0txIp2bHtf1IeNuGaLCdu1nPq9nZa0Rf/7WfD2SEcga7RpYkMhQ9N
 OfOTz5g+Ca5Zt/k40TTMXGUAMp/kg7HLuz8dQpep4Ob1eGiaDnDdrEnH2LV5VXiM
 AWMd5VPKwdIJtQ==
X-ME-Sender: <xms:O0ZnYa82k3hsHtV4nyh4w5EpmAuqn9GuOvzY225c_X9zovEJA5yEJQ>
 <xme:O0ZnYaueGQ23dBvXo7HMtaThVxzNxyMdOuxkFt-Z87SEJxntzvQKTQavlIqvanw6F
 9uLEawS_ckokXwFAg>
X-ME-Received: <xmr:O0ZnYQCJeh-KvZJyGxoYXN74z23BLH3OzjdBYmMO4do2M0Gsz9vwb5QVvJHATUyT6Utk>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrvddutddgudehudcutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffojghfggfgsedtke
 ertdertddtnecuhfhrohhmpefhvghrnhgrnhguohcutfgrmhhoshcuoehgrhgvvghnfhho
 ohesuhelvddrvghuqeenucggtffrrghtthgvrhhnpeekleekjedtheejheekfefggeevvd
 fgueegffeuveduhfehueegkeeijedvvdejfeenucevlhhushhtvghrufhiiigvpedtnecu
 rfgrrhgrmhepmhgrihhlfhhrohhmpehgrhgvvghnfhhoohesuhelvddrvghu
X-ME-Proxy: <xmx:O0ZnYSfBJQ_zeSsXoGElVk0ar_iSiKy12WBX6sNkSnFRz4m6AREvDQ>
 <xmx:O0ZnYfML1HxwQrDEiZaToUnkBib19bo09LBCSftKbdZ9kRqiSsttyQ>
 <xmx:O0ZnYckE8OeCowscXFGoWvEe9kSl9pHkhbsCyn11UBJSR4acO5nYJw>
 <xmx:O0ZnYap52WaKdv_h1ETeTjoRN-vAhsLbaHUSLG265M0vjvex-WC99Q>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 13 Oct 2021 16:48:56 -0400 (EDT)
From: Fernando Ramos <greenfoo@u92.eu>
To: dri-devel@lists.freedesktop.org
Cc: linux-kernel@vger.kernel.org, sean@poorly.run, linux-doc@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
 linux-tegra@vger.kernel.org
Subject: [PATCH v4 02/20] drm/i915: cleanup: drm_modeset_lock_all_ctx() -->
 DRM_MODESET_LOCK_ALL_BEGIN()
Date: Wed, 13 Oct 2021 22:48:28 +0200
Message-Id: <20211013204846.90026-3-greenfoo@u92.eu>
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

As requested in Documentation/gpu/todo.rst, replace the boilerplate code
surrounding drm_modeset_lock_all_ctx() with DRM_MODESET_LOCK_ALL_BEGIN()
and DRM_MODESET_LOCK_ALL_END()

Signed-off-by: Fernando Ramos <greenfoo@u92.eu>
Reviewed-by: Sean Paul <sean@poorly.run>
---
 drivers/gpu/drm/i915/display/intel_display.c | 18 +++++-------------
 1 file changed, 5 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
index 9cf987ee143d..c7d9a58f9f98 100644
--- a/drivers/gpu/drm/i915/display/intel_display.c
+++ b/drivers/gpu/drm/i915/display/intel_display.c
@@ -43,6 +43,7 @@
 #include <drm/drm_plane_helper.h>
 #include <drm/drm_probe_helper.h>
 #include <drm/drm_rect.h>
+#include <drm/drm_drv.h>
 
 #include "display/intel_audio.h"
 #include "display/intel_crt.h"
@@ -11923,22 +11924,13 @@ void intel_display_resume(struct drm_device *dev)
 	if (state)
 		state->acquire_ctx = &ctx;
 
-	drm_modeset_acquire_init(&ctx, 0);
-
-	while (1) {
-		ret = drm_modeset_lock_all_ctx(dev, &ctx);
-		if (ret != -EDEADLK)
-			break;
-
-		drm_modeset_backoff(&ctx);
-	}
+	DRM_MODESET_LOCK_ALL_BEGIN(dev, ctx, 0, ret);
 
-	if (!ret)
-		ret = __intel_display_resume(dev, state, &ctx);
+	ret = __intel_display_resume(dev, state, &ctx);
 
 	intel_enable_ipc(dev_priv);
-	drm_modeset_drop_locks(&ctx);
-	drm_modeset_acquire_fini(&ctx);
+
+	DRM_MODESET_LOCK_ALL_END(dev, ctx, ret);
 
 	if (ret)
 		drm_err(&dev_priv->drm,
-- 
2.33.0

