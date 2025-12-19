Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5693BCD16ED
	for <lists+dri-devel@lfdr.de>; Fri, 19 Dec 2025 19:47:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8661D10F089;
	Fri, 19 Dec 2025 18:46:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.b="JDoHBmd5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [198.137.202.133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D07410F075;
 Fri, 19 Dec 2025 18:46:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=aMTIQNpoq4JnAFqdCgtDfaBJpJ3OgOmObmKnmGO00n4=; b=JDoHBmd50J/M3U7CCh1onN8s6k
 k9MHobWgJnnXINbEC/RM39feFQ7H9i1odRJm1/J9Qs8jtlpLV/Jv3K6GhYsVYpOev4oZj0jsTuns/
 2plQ068hGsd2BuFtZ51GCMrnkCnNu7HJKzzYz77R3oIKeCAY2Wwd7j2uKVdpTKwgl+BI0EKftjwCB
 H1UepCWmTfPaENsy/Dpe3f8bBoOuUv//P0clWecKSoQBkQtUAbEcM2arTdJisbBk214Ll/c0NRTpB
 QI+cg1MrWaHQXpiZzxYwyB2tHK9h83vCxUI41bWutIVhWg629/Mh/+qaKjXGmF0zLNz/u75TcYb2j
 q+xVNvxg==;
Received: from [50.53.43.113] (helo=bombadil.infradead.org)
 by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
 id 1vWfUw-0000000AqkV-0mbJ; Fri, 19 Dec 2025 18:46:42 +0000
From: Randy Dunlap <rdunlap@infradead.org>
To: dri-devel@lists.freedesktop.org
Cc: Randy Dunlap <rdunlap@infradead.org>,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 05/19] drm/msm/dpu: dpu_hw_cwb.h: fix all kernel-doc warnings
Date: Fri, 19 Dec 2025 10:46:24 -0800
Message-ID: <20251219184638.1813181-6-rdunlap@infradead.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251219184638.1813181-1-rdunlap@infradead.org>
References: <20251219184638.1813181-1-rdunlap@infradead.org>
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

Correct or add kernel-doc comments to eliminate all warnings:

Warning: drivers/gpu/drm/msm/disp/dpu1/dpu_hw_cwb.h:30 Cannot find
 identifier on line: *
Warning: drivers/gpu/drm/msm/disp/dpu1/dpu_hw_cwb.h:61 expecting prototype
 for dpu_hw_cwb(). Prototype was for to_dpu_hw_cwb() instead

Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
---
Cc: Rob Clark <robin.clark@oss.qualcomm.com>
Cc: Dmitry Baryshkov <lumag@kernel.org>
Cc: linux-arm-msm@vger.kernel.org
Cc: freedreno@lists.freedesktop.org
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_cwb.h |    3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

--- linux-next-20251119.orig/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_cwb.h
+++ linux-next-20251119/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_cwb.h
@@ -28,7 +28,6 @@ struct dpu_hw_cwb_setup_cfg {
 };
 
 /**
- *
  * struct dpu_hw_cwb_ops : Interface to the cwb hw driver functions
  * @config_cwb: configure CWB mux
  */
@@ -54,7 +53,7 @@ struct dpu_hw_cwb {
 };
 
 /**
- * dpu_hw_cwb - convert base object dpu_hw_base to container
+ * to_dpu_hw_cwb - convert base object dpu_hw_base to container
  * @hw: Pointer to base hardware block
  * return: Pointer to hardware block container
  */
