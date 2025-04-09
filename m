Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 08033A8338F
	for <lists+dri-devel@lfdr.de>; Wed,  9 Apr 2025 23:45:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 09E6610E33B;
	Wed,  9 Apr 2025 21:45:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=googlemail.com header.i=@googlemail.com header.b="jVBEXdnH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com
 [209.85.218.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2BF4110E33B
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Apr 2025 21:45:01 +0000 (UTC)
Received: by mail-ej1-f43.google.com with SMTP id
 a640c23a62f3a-ac289147833so28672966b.2
 for <dri-devel@lists.freedesktop.org>; Wed, 09 Apr 2025 14:45:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20230601; t=1744235095; x=1744839895;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=3NPai227aDJvUuV8kWoPsqKGMzOpGvfzdkovhg7o0R8=;
 b=jVBEXdnHgVjtRWIUNfH6AK923O08JnISvQp3RhfFh0Zvt1EdSFh6bd45iPdA1Wh2Ez
 lY6FIHtvLRDRvfKks2b8tL2LMnDmnY/kNBNYKYXsby5tQyfbJSaChJ/LGfCrdmISxgnp
 f5BsVpwbqzqDLW+ncapoyfPcsbVMKiIVgtmyFqFaMBJEbtNImfu44Y4otRN5tTEVLD0S
 vaNkZNKYzAuiSwUQ16z/Q8u/V/WVQEgi/Cf0P06WJXz9tgpCLYZDxF0OX7Q7vmq09cKS
 ZhHTlrPhdx3+idoA+Mml+jUxrPIYkrSYUe9S/YLkNPeDg7c+PR7oWiIaxkRJY9ZumG74
 RZrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744235095; x=1744839895;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=3NPai227aDJvUuV8kWoPsqKGMzOpGvfzdkovhg7o0R8=;
 b=t0Ab62Q3cEkxiTH1DVGE2BWoqHGtNiKK6rb3RDeFgurpjUF1iyfuTBYy17DKNwwJqe
 vVHGmSEG2rBu5rBskeXdwZIqZu8z+tYPKx+x+OzNh2P1U2A30+tQGMx4HuKSm5RorSu1
 XEhiCJ4Z2bT4Xv4uyLl5yfBMa7mI3I6KhbuzNL71pCiIl+teZ1Cktr4DmWX8MFe9dVsH
 JChjw2aWL5ey5TqQ1WRkAOxEKDXf9qKzdtsVhE4HvkQhXwCxRSCtXOXoSP4xFRthxbkp
 KB/BSlNxK5v0K1JsfF6nng8KeCc0D6B4A5kQaQMt9Jo9OiIQ0ovAneb58F4ByLmqBLWI
 g3pw==
X-Forwarded-Encrypted: i=1;
 AJvYcCW/80OPTiiiARs+aZx1CU01o1rBHdxOkmAY2Q+dJvCkD++x6x9f7t9ETNCF1KKseQEejeDKYh94hGI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwjOFDH5STpbQBJWkY4Ta6c3hDQ8D8YP4qR6ZAydvlibWNbK0tO
 MvoRMNty6mXXR1OvYF6Y/NnZyu1PDz9WbRscPvW4zZHM8n7jdHPT
X-Gm-Gg: ASbGnctv1B+rGkcMHyh/p624YQIshFFgh9HPxNKhYZV21aFFmJROaqOwkWphns2QCme
 BiSJyx3N1PVpq1OsQXw0vLDVR+kPnEmdKb56dwhVT9qcT55lqKX1Amw042eSNXOWHfLT4oNIxUe
 v2sPNq1ERcZc7+8Xk1Dh3rjZGWfPYwAQ0f0n3BSN+GB8a5QvgbrH643oMZIu/ITxnfaLqHx0UyK
 WSFaORVUyZJFksV+8MLdOqErNfSs75Zo8EcdVTD6ro+JWXUMigOL74YHHQUsDfl3pjt7db8i97T
 erTJolDdxDVxuny7vhwzl08lEIi2zRkFckhYyx/XUUrO1DjSfu/Jl6pJJP4bGrx8A/9JrxXdhIW
 r5/9aswQouCpq/86MrVE2tuwgYkX74PFMnfKzz/15Krjliz/aBmffOuaDN922LqgEIg==
X-Google-Smtp-Source: AGHT+IGgAEroUeLQh0oYmzC+aJfi7NMR07UxELr9MmrtZo+ueWdUduUVZpBbInA6JPzZpHd/qY/X8w==
X-Received: by 2002:a17:907:868c:b0:ac3:3f11:b49d with SMTP id
 a640c23a62f3a-acabcb2f4b5mr27658666b.0.1744235094553; 
 Wed, 09 Apr 2025 14:44:54 -0700 (PDT)
Received: from localhost.localdomain
 (dynamic-2a02-3100-b3fc-b700-0000-0000-0000-0e63.310.pool.telefonica.de.
 [2a02:3100:b3fc:b700::e63]) by smtp.googlemail.com with ESMTPSA id
 a640c23a62f3a-acaa1be9152sm153577866b.42.2025.04.09.14.44.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Apr 2025 14:44:53 -0700 (PDT)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: linux-amlogic@lists.infradead.org,
	dri-devel@lists.freedesktop.org
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 jbrunet@baylibre.com, neil.armstrong@linaro.org,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Furkan Kardame <f.kardame@manjaro.org>
Subject: [PATCH] drm/meson: fix resource cleanup in meson_drv_bind_master() on
 error
Date: Wed,  9 Apr 2025 23:44:22 +0200
Message-ID: <20250409214422.1751825-1-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.49.0
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

meson_drv_bind_master() does not free resources in the order they are
allocated. This can lead to crashes such as:
    Unable to handle kernel NULL pointer dereference at virtual address 00000000000000c8
    [...]
    Hardware name: Beelink GT-King Pro (DT)
    pstate: 60000005 (nZCv daif -PAN -UAO -TCO -DIT -SSBS BTYPE=--)
    pc : meson_dw_hdmi_unbind+0x10/0x24 [meson_dw_hdmi]
    lr : component_unbind+0x38/0x60
    [...]
    Call trace:
     meson_dw_hdmi_unbind+0x10/0x24 [meson_dw_hdmi]
     component_unbind+0x38/0x60
     component_unbind_all+0xb8/0xc4
     meson_drv_bind_master+0x1ec/0x514 [meson_drm]
     meson_drv_bind+0x14/0x20 [meson_drm]
     try_to_bring_up_aggregate_device+0xa8/0x160
     __component_add+0xb8/0x1a8
     component_add+0x14/0x20
     meson_dw_hdmi_probe+0x1c/0x28 [meson_dw_hdmi]
     platform_probe+0x68/0xdc
     really_probe+0xc0/0x39c
     __driver_probe_device+0x7c/0x14c
     driver_probe_device+0x3c/0x120
     __driver_attach+0xc4/0x200
     bus_for_each_dev+0x78/0xd8
     driver_attach+0x24/0x30
     bus_add_driver+0x110/0x240
     driver_register+0x68/0x124
     __platform_driver_register+0x24/0x30
     meson_dw_hdmi_platform_driver_init+0x20/0x1000 [meson_dw_hdmi]
     do_one_initcall+0x50/0x1bc
     do_init_module+0x54/0x1fc
     load_module+0x788/0x884
     init_module_from_file+0x88/0xd4
     __arm64_sys_finit_module+0x248/0x340
     invoke_syscall+0x48/0x104
     el0_svc_common.constprop.0+0x40/0xe0
     do_el0_svc+0x1c/0x28
     el0_svc+0x30/0xcc
     el0t_64_sync_handler+0x120/0x12c
     el0t_64_sync+0x190/0x194

Clean up resources in the error path in the same order and under the
same conditions as they were allocated to fix this.

Reported-by: Furkan Kardame <f.kardame@manjaro.org>
Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
This issue was reported off-list so I'm unable to provide a link to the
report.

I'm not sure which Fixes tag fits best. My preference so far is
Fixes: 6a044642988b ("drm/meson: fix unbind path if HDMI fails to bind")
but I'll happily take other suggestions as well.


 drivers/gpu/drm/meson/meson_drv.c | 31 +++++++++++++++++--------------
 1 file changed, 17 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/meson/meson_drv.c b/drivers/gpu/drm/meson/meson_drv.c
index 81d2ee37e773..031686fd4104 100644
--- a/drivers/gpu/drm/meson/meson_drv.c
+++ b/drivers/gpu/drm/meson/meson_drv.c
@@ -314,35 +314,35 @@ static int meson_drv_bind_master(struct device *dev, bool has_components)
 			dev_err(drm->dev, "Couldn't bind all components\n");
 			/* Do not try to unbind */
 			has_components = false;
-			goto exit_afbcd;
+			goto cvbs_encoder_remove;
 		}
 	}
 
 	ret = meson_encoder_hdmi_probe(priv);
 	if (ret)
-		goto exit_afbcd;
+		goto unbind_components;
 
 	if (meson_vpu_is_compatible(priv, VPU_COMPATIBLE_G12A)) {
 		ret = meson_encoder_dsi_probe(priv);
 		if (ret)
-			goto exit_afbcd;
+			goto hdmi_encoder_remove;
 	}
 
 	ret = meson_plane_create(priv);
 	if (ret)
-		goto exit_afbcd;
+		goto dsi_encoder_remove;
 
 	ret = meson_overlay_create(priv);
 	if (ret)
-		goto exit_afbcd;
+		goto dsi_encoder_remove;
 
 	ret = meson_crtc_create(priv);
 	if (ret)
-		goto exit_afbcd;
+		goto dsi_encoder_remove;
 
 	ret = request_irq(priv->vsync_irq, meson_irq, 0, drm->driver->name, drm);
 	if (ret)
-		goto exit_afbcd;
+		goto dsi_encoder_remove;
 
 	drm_mode_config_reset(drm);
 
@@ -360,6 +360,16 @@ static int meson_drv_bind_master(struct device *dev, bool has_components)
 
 uninstall_irq:
 	free_irq(priv->vsync_irq, drm);
+dsi_encoder_remove:
+	if (meson_vpu_is_compatible(priv, VPU_COMPATIBLE_G12A))
+		meson_encoder_dsi_remove(priv);
+hdmi_encoder_remove:
+	meson_encoder_hdmi_remove(priv);
+unbind_components:
+	if (has_components)
+		component_unbind_all(dev, drm);
+cvbs_encoder_remove:
+	meson_encoder_cvbs_remove(priv);
 exit_afbcd:
 	if (priv->afbcd.ops)
 		priv->afbcd.ops->exit(priv);
@@ -374,13 +384,6 @@ static int meson_drv_bind_master(struct device *dev, bool has_components)
 free_drm:
 	drm_dev_put(drm);
 
-	meson_encoder_dsi_remove(priv);
-	meson_encoder_hdmi_remove(priv);
-	meson_encoder_cvbs_remove(priv);
-
-	if (has_components)
-		component_unbind_all(dev, drm);
-
 	return ret;
 }
 
-- 
2.49.0

