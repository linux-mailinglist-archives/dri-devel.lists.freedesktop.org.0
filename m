Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ED3C67FA964
	for <lists+dri-devel@lfdr.de>; Mon, 27 Nov 2023 19:59:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4034510E3D4;
	Mon, 27 Nov 2023 18:59:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 07CA710E3D4
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Nov 2023 18:59:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=uLJc/0q+PREavE8ipSgwZnKn6Rpre4aSziTiaa+cIMg=; b=HYIlCDFfNH+pZbTdTNNwCBpoPe
 7JajgREWAKmiBwrpRWyl52yhTboEnJWtCnF+7aaDEA2oAKIZLkqqF4etoeaRdZKqEnc/Le1cXVtdP
 9FvsBcfDBra7GPDjCjVMZBPVa6gJRW0KilgFRH1sxJpDQ/BsZxZHL0F8N9kbz2Yef+Y2OYhVjKTvQ
 OgzG2Q9Fo+XcNLKIRzJDnKLpkxT1R2fzAsYlfzw0cnYnNp4U1uEs5ptHc2MOcojY3CZY7Dc4WvpEJ
 FWdbScLrT9UcbWl1LSEKdwqFVCeQCdnwucRkjuIgA9pKhV7bxG8Mh+peBmNemZhJKacOSmYftpaYT
 OeIf9i0g==;
Received: from [177.34.168.16] (helo=morissey..)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1r7gpO-007jiM-GD; Mon, 27 Nov 2023 19:59:31 +0100
From: =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>
To: Melissa Wen <mwen@igalia.com>, Iago Toral <itoral@igalia.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v3 01/17] drm/v3d: Remove unused function header
Date: Mon, 27 Nov 2023 15:48:19 -0300
Message-ID: <20231127185723.10348-3-mcanal@igalia.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231127185723.10348-2-mcanal@igalia.com>
References: <20231127185723.10348-2-mcanal@igalia.com>
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
Cc: =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>,
 Boris Brezillon <boris.brezillon@collabora.com>, kernel-dev@igalia.com,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Melissa Wen <mwen@igalia.com>

v3d_mmu_get_offset header was added but the function was never defined.
Just remove it.

Signed-off-by: Melissa Wen <mwen@igalia.com>
Signed-off-by: Maíra Canal <mcanal@igalia.com>
---
 drivers/gpu/drm/v3d/v3d_drv.h | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/gpu/drm/v3d/v3d_drv.h b/drivers/gpu/drm/v3d/v3d_drv.h
index 4c59fefaa0b4..d8b392494eba 100644
--- a/drivers/gpu/drm/v3d/v3d_drv.h
+++ b/drivers/gpu/drm/v3d/v3d_drv.h
@@ -420,8 +420,6 @@ void v3d_irq_disable(struct v3d_dev *v3d);
 void v3d_irq_reset(struct v3d_dev *v3d);
 
 /* v3d_mmu.c */
-int v3d_mmu_get_offset(struct drm_file *file_priv, struct v3d_bo *bo,
-		       u32 *offset);
 int v3d_mmu_set_page_table(struct v3d_dev *v3d);
 void v3d_mmu_insert_ptes(struct v3d_bo *bo);
 void v3d_mmu_remove_ptes(struct v3d_bo *bo);
-- 
2.42.0

