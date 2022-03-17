Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BEA6C4DC297
	for <lists+dri-devel@lfdr.de>; Thu, 17 Mar 2022 10:26:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A596810E10F;
	Thu, 17 Mar 2022 09:26:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com
 [IPv6:2a00:1450:4864:20::231])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F4E710E10F
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Mar 2022 09:26:01 +0000 (UTC)
Received: by mail-lj1-x231.google.com with SMTP id h11so6438047ljb.2
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Mar 2022 02:26:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=K1w+4nmtaY3LFBqGvszUib5TMkZXEl+qdfo2pX/IGTY=;
 b=pqGPEyx5t8K8X7hY5gGrp6TBiiU107p4hRR5t/H8tDOBN2qan4abaa31J4YYLA7g6L
 kKLAQ8Y6PCsJ2/daUUsWxFODRMdMtyX4nc/9FXZgI6elrm81jggW1D4Xj9kw9gwc9NX+
 qB9kVgFgFXmWGA2XSnQz+P2jYqroz7EQVzBi2gRp5rQDfinSHiKcIy5dMegazx0Vogf9
 Cwxhcy3pRSk8nrU3lYDGv2eko4u0y/9YETSQb+XsDu5ZFE4ecQtYAVn2dIDp/o+uoqy7
 UXfQl775EApxkjIrrY2PU4BWI9EgFuL+rIGk703YzwS8dgY+HFD9kbaBBAZ7j/4nMgcq
 +O0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=K1w+4nmtaY3LFBqGvszUib5TMkZXEl+qdfo2pX/IGTY=;
 b=elgC4q5kZAy3jRs50astQVpQ74iu/tUst/Sw0xBWO/UzghmS1wUMW6zd5m8BLyi6yb
 5xw2qESSubIopbsWbH8LKPGEdv5UvTGkdhjUU2pQj4hZUIOUMGMmpG2EzyQdoV9eXIKm
 +4NSPMHw3xWuD3GLMZQR+udElD/wXqHsCmx8hOJw/JSNShGFVQUKJzjvQyHh63zNiL9M
 Jv+UzGhtiG4qDtYSPZuQM+Jw1vzkZ6QGPttb1GlrKlaB1J7MqUU+0Lq5qAAKTwGYAJeu
 L8tgCyj0WzsWofV+zDPa/nkB1BHVy3G8Cj1Zecnnyb76tMY7A+mEuT09Dq3I7Q4to+WB
 6qdQ==
X-Gm-Message-State: AOAM5321ekWvJAOdE9YdyNqMgpVEPdmTasMcdsgogRHYrX4H9Od4Uaa4
 J4MF5dnF1EZwITzFQPIv++J3i+kiDG0=
X-Google-Smtp-Source: ABdhPJwADxE2I+l1QVccEEG/r8KoY+4ETEvGLH6HeVeqwAGJgL0S9F3O85mXUXBN5f40cxm74vI7EA==
X-Received: by 2002:a2e:9bc6:0:b0:246:440d:b273 with SMTP id
 w6-20020a2e9bc6000000b00246440db273mr2241109ljj.121.1647509159409; 
 Thu, 17 Mar 2022 02:25:59 -0700 (PDT)
Received: from localhost.localdomain (81-226-149-122-no518.tbcn.telia.com.
 [81.226.149.122]) by smtp.gmail.com with ESMTPSA id
 h3-20020a2e9003000000b00249278d3bd7sm391050ljg.77.2022.03.17.02.25.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Mar 2022 02:25:58 -0700 (PDT)
From: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 1/4] drm/gma500: Remove unused declarations and other cruft
Date: Thu, 17 Mar 2022 10:25:52 +0100
Message-Id: <20220317092555.17882-1-patrik.r.jakobsson@gmail.com>
X-Mailer: git-send-email 2.35.1
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
Cc: daniel.vetter@ffwll.ch, sam@ravnborg.org, tzimmermann@suse.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Most of these are old leftovers from one of the driver merges. This is
all dead code.

Signed-off-by: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
---
 drivers/gpu/drm/gma500/psb_drv.h | 75 +-------------------------------
 1 file changed, 1 insertion(+), 74 deletions(-)

diff --git a/drivers/gpu/drm/gma500/psb_drv.h b/drivers/gpu/drm/gma500/psb_drv.h
index 553d03190ce1..66f61909a8c8 100644
--- a/drivers/gpu/drm/gma500/psb_drv.h
+++ b/drivers/gpu/drm/gma500/psb_drv.h
@@ -36,12 +36,6 @@
 /* Append new drm mode definition here, align with libdrm definition */
 #define DRM_MODE_SCALE_NO_SCALE   	2
 
-enum {
-	CHIP_PSB_8108 = 0,		/* Poulsbo */
-	CHIP_PSB_8109 = 1,		/* Poulsbo */
-	CHIP_MRST_4100 = 2,		/* Moorestown/Oaktrail */
-};
-
 #define IS_PSB(drm) ((to_pci_dev((drm)->dev)->device & 0xfffe) == 0x8108)
 #define IS_MRST(drm) ((to_pci_dev((drm)->dev)->device & 0xfff0) == 0x4100)
 #define IS_CDV(drm) ((to_pci_dev((drm)->dev)->device & 0xfff0) == 0x0be0)
@@ -617,15 +611,7 @@ struct psb_ops {
 	int i2c_bus;		/* I2C bus identifier for Moorestown */
 };
 
-
-
-extern int drm_crtc_probe_output_modes(struct drm_device *dev, int, int);
-extern int drm_pick_crtcs(struct drm_device *dev);
-
 /* psb_irq.c */
-extern void psb_irq_uninstall_islands(struct drm_device *dev, int hw_islands);
-extern int psb_vblank_wait2(struct drm_device *dev, unsigned int *sequence);
-extern int psb_vblank_wait(struct drm_device *dev, unsigned int *sequence);
 extern int psb_enable_vblank(struct drm_crtc *crtc);
 extern void psb_disable_vblank(struct drm_crtc *crtc);
 void
@@ -636,17 +622,9 @@ psb_disable_pipestat(struct drm_psb_private *dev_priv, int pipe, u32 mask);
 
 extern u32 psb_get_vblank_counter(struct drm_crtc *crtc);
 
-/* framebuffer.c */
-extern int psbfb_probed(struct drm_device *dev);
-extern int psbfb_remove(struct drm_device *dev,
-			struct drm_framebuffer *fb);
-/* psb_drv.c */
-extern void psb_spank(struct drm_psb_private *dev_priv);
-
-/* psb_reset.c */
+/* psb_lid.c */
 extern void psb_lid_timer_init(struct drm_psb_private *dev_priv);
 extern void psb_lid_timer_takedown(struct drm_psb_private *dev_priv);
-extern void psb_print_pagefault(struct drm_psb_private *dev_priv);
 
 /* modesetting */
 extern void psb_modeset_init(struct drm_device *dev);
@@ -689,43 +667,7 @@ extern const struct psb_ops oaktrail_chip_ops;
 /* cdv_device.c */
 extern const struct psb_ops cdv_chip_ops;
 
-/* Debug print bits setting */
-#define PSB_D_GENERAL (1 << 0)
-#define PSB_D_INIT    (1 << 1)
-#define PSB_D_IRQ     (1 << 2)
-#define PSB_D_ENTRY   (1 << 3)
-/* debug the get H/V BP/FP count */
-#define PSB_D_HV      (1 << 4)
-#define PSB_D_DBI_BF  (1 << 5)
-#define PSB_D_PM      (1 << 6)
-#define PSB_D_RENDER  (1 << 7)
-#define PSB_D_REG     (1 << 8)
-#define PSB_D_MSVDX   (1 << 9)
-#define PSB_D_TOPAZ   (1 << 10)
-
-extern int drm_idle_check_interval;
-
 /* Utilities */
-static inline u32 MRST_MSG_READ32(int domain, uint port, uint offset)
-{
-	int mcr = (0xD0<<24) | (port << 16) | (offset << 8);
-	uint32_t ret_val = 0;
-	struct pci_dev *pci_root = pci_get_domain_bus_and_slot(domain, 0, 0);
-	pci_write_config_dword(pci_root, 0xD0, mcr);
-	pci_read_config_dword(pci_root, 0xD4, &ret_val);
-	pci_dev_put(pci_root);
-	return ret_val;
-}
-static inline void MRST_MSG_WRITE32(int domain, uint port, uint offset,
-				    u32 value)
-{
-	int mcr = (0xE0<<24) | (port << 16) | (offset << 8) | 0xF0;
-	struct pci_dev *pci_root = pci_get_domain_bus_and_slot(domain, 0, 0);
-	pci_write_config_dword(pci_root, 0xD4, value);
-	pci_write_config_dword(pci_root, 0xD0, mcr);
-	pci_dev_put(pci_root);
-}
-
 static inline uint32_t REGISTER_READ(struct drm_device *dev, uint32_t reg)
 {
 	struct drm_psb_private *dev_priv = to_drm_psb_private(dev);
@@ -806,24 +748,9 @@ static inline void REGISTER_WRITE8(struct drm_device *dev,
 #define PSB_WVDC32(_val, _offs)		iowrite32(_val, dev_priv->vdc_reg + (_offs))
 #define PSB_RVDC32(_offs)		ioread32(dev_priv->vdc_reg + (_offs))
 
-/* #define TRAP_SGX_PM_FAULT 1 */
-#ifdef TRAP_SGX_PM_FAULT
-#define PSB_RSGX32(_offs)						\
-({									\
-	if (inl(dev_priv->apm_base + PSB_APM_STS) & 0x3) {		\
-		pr_err("access sgx when it's off!! (READ) %s, %d\n",	\
-		       __FILE__, __LINE__);				\
-		melay(1000);						\
-	}								\
-	ioread32(dev_priv->sgx_reg + (_offs));				\
-})
-#else
 #define PSB_RSGX32(_offs)		ioread32(dev_priv->sgx_reg + (_offs))
-#endif
 #define PSB_WSGX32(_val, _offs)		iowrite32(_val, dev_priv->sgx_reg + (_offs))
 
-#define MSVDX_REG_DUMP 0
-
 #define PSB_WMSVDX32(_val, _offs)	iowrite32(_val, dev_priv->msvdx_reg + (_offs))
 #define PSB_RMSVDX32(_offs)		ioread32(dev_priv->msvdx_reg + (_offs))
 
-- 
2.35.1

