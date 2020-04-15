Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F4241A9471
	for <lists+dri-devel@lfdr.de>; Wed, 15 Apr 2020 09:41:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0BD636E879;
	Wed, 15 Apr 2020 07:40:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8AA4C6E872
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Apr 2020 07:40:43 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id x4so16184529wmj.1
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Apr 2020 00:40:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=i/6OJckg0FYtxGo8Frv5fio5z4VslBD7hEowA01at0E=;
 b=gJcQMs+HXh33ciPIiREiLc4c2GiJdwJhYgv3DmecZo+60AK1eIyFdKWGhhlY34cErl
 Pf1oYs1E6guvvhBabs2KJULHUmSBNkgrFRHDdJevjb98kbOfYXs8eZp+BkYz4Kf3yyrn
 AOWZwxBmICrjccmAgTM7wLaOyDHEsHo8boF/Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=i/6OJckg0FYtxGo8Frv5fio5z4VslBD7hEowA01at0E=;
 b=LNLEmBm/CIP/BRgA9r752SzmgFLiSkYi0rUda2wX2wa/P7F3zmLkdKJ58QQTugkGTJ
 UXPvR1ItPRnDpdpa4jQZR6w5gfZkQ+h6qw4SzGvTyS35CWZQM0r5OHnMRs8V9SpslrWh
 XYHokHAnbGfamsIqS2GTkyUhsGVQJD7CaOjqzur+GZiM+otnFbkgQmra43ACaye5Hofm
 /tEKtbeD1ngAyIbR5iNJYQ/t2J6MglfxQCaXF68+wjaVYuGzcFvt2FS7tUwV/iwalmJ+
 24LhHthbQXgXuEvMcn/4bCaXJkOOu8NlUYBu712r1W7B5cGVs5JR5D39yacc9WINqwwN
 pFuQ==
X-Gm-Message-State: AGi0PuYR+Z+pLy9f7emod6LcSF3q1xFTtSsOXkZq9qI3fVefOwEuD3G1
 oBe696j3wobTQvlyoPIY+Y/Rsg==
X-Google-Smtp-Source: APiQypLN5ahm7RORRP3/C29Nq7g1nINWPZ3tqBsoiG6EcAVPdODfwy5kBwtHbJlwaiQ0+IIuHOJ/5w==
X-Received: by 2002:a7b:c1d4:: with SMTP id a20mr3929735wmj.111.1586936442238; 
 Wed, 15 Apr 2020 00:40:42 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id u30sm1878552wru.13.2020.04.15.00.40.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Apr 2020 00:40:41 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: Intel Graphics Development <intel-gfx@lists.freedesktop.org>
Subject: [PATCH 02/59] drm/vboxvideo: drop DRM_MTRR_WC #define
Date: Wed, 15 Apr 2020 09:39:37 +0200
Message-Id: <20200415074034.175360-3-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200415074034.175360-1-daniel.vetter@ffwll.ch>
References: <20200415074034.175360-1-daniel.vetter@ffwll.ch>
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, Hans de Goede <hdegoede@redhat.com>,
 Sam Ravnborg <sam@ravnborg.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Daniel Vetter <daniel.vetter@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Doesn't apply to upstream kernels since a rather long time.

Acked-by: Sam Ravnborg <sam@ravnborg.org>
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
