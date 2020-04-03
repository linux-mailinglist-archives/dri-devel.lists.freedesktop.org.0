Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C113319D829
	for <lists+dri-devel@lfdr.de>; Fri,  3 Apr 2020 15:59:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 495DC6EBB0;
	Fri,  3 Apr 2020 13:58:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 60AF76EBA1
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Apr 2020 13:58:44 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id c81so7254764wmd.4
 for <dri-devel@lists.freedesktop.org>; Fri, 03 Apr 2020 06:58:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=hAlOMj7No1NvrsQLBdK4R7UjdMBvhy1FvedvNT5x/A4=;
 b=k+suZu4wf1eUlT1IhhP1+d3rBgnZT99NWkdFFH+e/nNKVUzrK+K5PKx/cjDKGhrHfC
 eakqPSPCYj9o6vciF2SRkbU3c9aEnCO8jNqJl1KE0h+T847tBqxvRr0n6ir3yr1lH+Nw
 M2J3DVxuaqxrMebIwcbNRNS5NFywXxqxL1qU4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=hAlOMj7No1NvrsQLBdK4R7UjdMBvhy1FvedvNT5x/A4=;
 b=h94s6PQAc0fyEbU+UiXJB8opyzfG1DugQwFC2kmc5XbgYvzgjKUFDjjrsvrRql5AF5
 gTxSrFTAaGhmJkMFZHGymih167lLaaGMIwNb6XsY11JzbB6fs+eMzKBAbgSjZ2b8vbxY
 qEzZSIOg5xf7CxHIRfQtOn5kvqgI3yrgB6kif3fCTZahijng3DZ/DorFV016o7qaqlvm
 KTp7mBkNZPSfghBgW16dGzfB16Fuin56wTBnTy/CeT7Y5LW3MKqRCJ8CJt8E4OE1Hrc4
 zhqDk7O/7r1wrwv1VFUhutOrWvirTDVBs0bQfNJpTdSXc5y7IqdQdK2z1TXhnm1MogQb
 yBjQ==
X-Gm-Message-State: AGi0PuZrn+TSbMeCJREYck/atGLazFKhF1qt21pjXalYPBg4kQUTmEwe
 CivRVZQd1YKKhLnt1jldi2EEKPZ/E9Vzxg==
X-Google-Smtp-Source: APiQypLwtx1Vg3FsBzGPTMzbZvqqvMNvUGhG5mQihZvzME+/e7/ib8zH4/+62LvcmWT5L3ICoWftHg==
X-Received: by 2002:a05:600c:21cc:: with SMTP id
 x12mr9270114wmj.104.1585922322700; 
 Fri, 03 Apr 2020 06:58:42 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id f141sm11783919wmf.3.2020.04.03.06.58.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Apr 2020 06:58:41 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH 06/44] drm/vboxvideo: drop DRM_MTRR_WC #define
Date: Fri,  3 Apr 2020 15:57:50 +0200
Message-Id: <20200403135828.2542770-7-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200403135828.2542770-1-daniel.vetter@ffwll.ch>
References: <20200403135828.2542770-1-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Hans de Goede <hdegoede@redhat.com>, Daniel Vetter <daniel.vetter@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Doesn't apply to upstream kernels since a rather long time.

Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
Cc: Hans de Goede <hdegoede@redhat.com>
---
 drivers/gpu/drm/vboxvideo/vbox_ttm.c | 12 ------------
 1 file changed, 12 deletions(-)

diff --git a/drivers/gpu/drm/vboxvideo/vbox_ttm.c b/drivers/gpu/drm/vboxvideo/vbox_ttm.c
index 976423d0c3cc..f5a06675da43 100644
--- a/drivers/gpu/drm/vboxvideo/vbox_ttm.c
+++ b/drivers/gpu/drm/vboxvideo/vbox_ttm.c
@@ -24,25 +24,13 @@ int vbox_mm_init(struct vbox_private *vbox)
 		return ret;
 	}
 
-#ifdef DRM_MTRR_WC
-	vbox->fb_mtrr = drm_mtrr_add(pci_resource_start(dev->pdev, 0),
-				     pci_resource_len(dev->pdev, 0),
-				     DRM_MTRR_WC);
-#else
 	vbox->fb_mtrr = arch_phys_wc_add(pci_resource_start(dev->pdev, 0),
 					 pci_resource_len(dev->pdev, 0));
-#endif
 	return 0;
 }
 
 void vbox_mm_fini(struct vbox_private *vbox)
 {
-#ifdef DRM_MTRR_WC
-	drm_mtrr_del(vbox->fb_mtrr,
-		     pci_resource_start(vbox->ddev.pdev, 0),
-		     pci_resource_len(vbox->ddev.pdev, 0), DRM_MTRR_WC);
-#else
 	arch_phys_wc_del(vbox->fb_mtrr);
-#endif
 	drm_vram_helper_release_mm(&vbox->ddev);
 }
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
