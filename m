Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6157FA4EC5C
	for <lists+dri-devel@lfdr.de>; Tue,  4 Mar 2025 19:49:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 36EBF10E69A;
	Tue,  4 Mar 2025 18:49:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=broadcom.com header.i=@broadcom.com header.b="CzqAHkUp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f176.google.com (mail-oi1-f176.google.com
 [209.85.167.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE70010E6B3
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Mar 2025 18:49:51 +0000 (UTC)
Received: by mail-oi1-f176.google.com with SMTP id
 5614622812f47-3f3f149c334so4117924b6e.1
 for <dri-devel@lists.freedesktop.org>; Tue, 04 Mar 2025 10:49:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=broadcom.com; s=google; t=1741114191; x=1741718991;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=AEntj6N5k9AT9J54KnODOl6Ll8jQ7tHU8hxve1ZvKHs=;
 b=CzqAHkUpdqJgqmTotA9IApurGDnumZs+IsRael7Q2NZVCUUwFZYqRKgU6SMIJjZl/O
 2T/N1A8kEzBrLw3maHjuxR5jInfKW237rTWJMI6w1OdWrwk2FVtSCvQa7FoUTTK2jaf6
 vuH/4ISK/A7405DluUkeP5mb/J1C2H1XqO7wM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741114191; x=1741718991;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=AEntj6N5k9AT9J54KnODOl6Ll8jQ7tHU8hxve1ZvKHs=;
 b=C0bDUuBawZF4SgMTtWGfFPCuRiC6RU5PEKUG4mdHVqFYyF3HVhW1YA1hHAZm0t8NED
 RiLl1RS8g8nhTOiMHi3t8T7f/ORil/b8c23SKBiebMRw6RsSAfLyzL2vNgffGs1+HAwL
 FcYsrVpKnfIsewPKvtljm1zhKEPHCmBm+I0p6QOcFLnXMhpbMfFJS9n+YTN+sn+cOzLy
 zuvOpKoJknBwHahQgHTVkl5yDX63YtZc17WdUgRVIUguafmaX44jQc+AhkgQcbBqCz4V
 hFxkoxWV6GVGb4HAkoSKP7A9POBa3X/H6S3rOvTwHZZ1ZC5SiF7lg1rFIasQAossBrXT
 FjRw==
X-Gm-Message-State: AOJu0YzgJCT4ok4S0sgLs8yRHNugyb49w7ko0tqw6NXQ1D9dee02y6gP
 +xJY6BBf5Z0X3wuSbGRe1GFKcOX2vW7aELK3lotKzdJTyJLWL4vci88UskWsPudAAFxQI8MPnQC
 uHPGnoVkDuvJ2i4HRkBTT4W5q68fbXqPgolI+o1/nIdRztLToouTGpDzORsJNRPncrpF6XolxMZ
 xCNNKLGSB5FGCquDHp5P2Jgf0QvrJBRMa8mlrh6MW04u+NZJX3Tw==
X-Gm-Gg: ASbGnct3zOZEsbpD1hEYhbvUgRDuv2UHHkFLQDLAnsNX6mAsjml48TBokE0sQU6t8zr
 d95vNz2dIxfwMidmhOCws4JGhRcKZsPtwx/HZ1efPN5EbT/2ZjdpzDBrp6ahw9Ye8tDiLTQzCH2
 LGNxMqCCl93lNsw9H0LFRDksCzyydxpkbqxrIKVULlTBtE/z0v+GJwi0RreexiBXj008om+nSa/
 bgjrgQWZuAzX6bzHsz+x12zjuV5dWN2/2IWCK09+CqDZ6Qedxtpz+4171jyDYCC63LksodGlxL8
 mqqI5uO4Gf+ZeVP/F2rQNCIxeLV+/6Kgrhhw+WwTACHdmikodQuA34yh7riiYlI5M4Cz4DQ4Cuq
 j5Rbz4n42VYVj9f473v7fJgM6FuQho98fZypp
X-Google-Smtp-Source: AGHT+IEI24y3yUjWAG98Qw/8+Fpq9zUyItFzg9CID7h3yEpPaK7CIsKqyJycVhj0RwQThDTaAeRq0w==
X-Received: by 2002:a05:6808:3c89:b0:3f3:f89d:356d with SMTP id
 5614622812f47-3f68315d0bbmr13417b6e.15.1741114190945; 
 Tue, 04 Mar 2025 10:49:50 -0800 (PST)
Received: from localhost.localdomain
 (pool-173-49-113-140.phlapa.fios.verizon.net. [173.49.113.140])
 by smtp.gmail.com with ESMTPSA id
 5614622812f47-3f67b0bfa85sm354939b6e.13.2025.03.04.10.49.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Mar 2025 10:49:50 -0800 (PST)
From: Zack Rusin <zack.rusin@broadcom.com>
To: dri-devel@lists.freedesktop.org
Cc: Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, ian.forbes@broadcom.com,
 martin.krastev@broadcom.com, maaz.mombasawala@broadcom.com,
 Zack Rusin <zack.rusin@broadcom.com>
Subject: [PATCH] drm/vmwgfx: Make sure the dirty tracker is released on
 surfaces
Date: Tue,  4 Mar 2025 13:49:42 -0500
Message-ID: <20250304184942.2127704-1-zack.rusin@broadcom.com>
X-Mailer: git-send-email 2.45.2
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

Free all the dirty trackers associated with the surface when the
parent framebuffer is destroyed.

The buffers backing framebuffers are explicitly made coherent. Code
separates buffers from surfaces. Buffers only require a dirty tracker
which is released during the framebuffer cleanup. Surfaces, which can
be coherent to begin with, require a dirty tracker in the backing buffer
and in the resource. Neither was properly cleaned up. Make sure they're
correctly cleaned up when the parent framebuffer is destroyed.

Fixes: 609023571ff2 ("drm/vmwgfx: Refactor cursor handling")
Cc: Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
Cc: dri-devel@lists.freedesktop.org
Signed-off-by: Zack Rusin <zack.rusin@broadcom.com>
---
 drivers/gpu/drm/vmwgfx/vmwgfx_kms.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c b/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c
index d8937f3de514..339ed2ddb717 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c
@@ -438,7 +438,20 @@ static void vmw_framebuffer_surface_destroy(struct drm_framebuffer *framebuffer)
 {
 	struct vmw_framebuffer_surface *vfbs =
 		vmw_framebuffer_to_vfbs(framebuffer);
+	struct vmw_bo *bo = vmw_user_object_buffer(&vfbs->uo);
+	struct vmw_surface *surf = vmw_user_object_surface(&vfbs->uo);
 
+	if (bo) {
+		vmw_bo_dirty_release(bo);
+		/*
+		 * bo->dirty is reference counted so it being NULL
+		 * means that the surface wasn't coherent to begin
+		 * with and so we have to free the dirty tracker
+		 * in the vmw_resource
+		 */
+		if (!bo->dirty && surf && surf->res.dirty)
+			surf->res.func->dirty_free(&surf->res);
+	}
 	drm_framebuffer_cleanup(framebuffer);
 	vmw_user_object_unref(&vfbs->uo);
 
-- 
2.45.2

