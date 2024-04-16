Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 79CA68A66B4
	for <lists+dri-devel@lfdr.de>; Tue, 16 Apr 2024 11:06:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D3BE112B21;
	Tue, 16 Apr 2024 09:06:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="hOTChC6y";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C416112B32
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Apr 2024 09:06:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1713258377;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=HfV3qzeSZFSXM27eiMA7/UR9Io4gITLHyZ6C3rSwR24=;
 b=hOTChC6y0dOIDZ5HI9M2SHuL7+BWS2RPZC+nPy1qLuPpLdKWMYPcT7GHPaItQffmokbDv/
 4yCtZ/y0n68622m3PVLZ15s2R6wXlj+ApAVmpni/V7dzJUhiNMjZG6eRGkWRcnnP/ZMbzj
 mV3eW7ntoNyqQCl+Gy07RA+B5XhDHyc=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-265-ge99TGUeMaC87AwiGtAycA-1; Tue, 16 Apr 2024 05:06:13 -0400
X-MC-Unique: ge99TGUeMaC87AwiGtAycA-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id BA96A8007BA;
 Tue, 16 Apr 2024 09:06:12 +0000 (UTC)
Received: from hydra.redhat.com (unknown [10.39.193.136])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1A8F7492BC9;
 Tue, 16 Apr 2024 09:06:10 +0000 (UTC)
From: Jocelyn Falempe <jfalempe@redhat.com>
To: dri-devel@lists.freedesktop.org, tzimmermann@suse.de, airlied@redhat.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, daniel@ffwll.ch
Cc: Jocelyn Falempe <jfalempe@redhat.com>,
 Stephen Rothwell <sfr@canb.auug.org.au>
Subject: [PATCH] drm/fb_dma: Fix parameter name in htmldocs
Date: Tue, 16 Apr 2024 11:05:51 +0200
Message-ID: <20240416090601.237286-1-jfalempe@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.9
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true
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

The parameter name is 'sb' and not 'drm_scanout_buffer'.
It fixes the following warnings:

drivers/gpu/drm/drm_fb_dma_helper.c:166: warning: Excess function parameter 'drm_scanout_buffer' description in 'drm_fb_dma_get_scanout_buffer'
drivers/gpu/drm/drm_fb_dma_helper.c:166: warning: Function parameter or struct member 'sb' not described in 'drm_fb_dma_get_scanout_buffer'
drivers/gpu/drm/drm_fb_dma_helper.c:166: warning: Excess function parameter 'drm_scanout_buffer' description in 'drm_fb_dma_get_scanout_buffer'

Fixes: 879b3b6511fe ("drm/fb_dma: Add generic get_scanout_buffer() for drm_panic")
Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
Signed-off-by: Jocelyn Falempe <jfalempe@redhat.com>
---
 drivers/gpu/drm/drm_fb_dma_helper.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_fb_dma_helper.c b/drivers/gpu/drm/drm_fb_dma_helper.c
index c79b5078303f..96e5ab960f12 100644
--- a/drivers/gpu/drm/drm_fb_dma_helper.c
+++ b/drivers/gpu/drm/drm_fb_dma_helper.c
@@ -153,7 +153,7 @@ EXPORT_SYMBOL_GPL(drm_fb_dma_sync_non_coherent);
 /**
  * drm_fb_dma_get_scanout_buffer - Provide a scanout buffer in case of panic
  * @plane: DRM primary plane
- * @drm_scanout_buffer: scanout buffer for the panic handler
+ * @sb: scanout buffer for the panic handler
  * Returns: 0 or negative error code
  *
  * Generic get_scanout_buffer() implementation, for drivers that uses the

base-commit: 7b0062036c3b71b4a69e244ecf0502c06c4cf5f0
-- 
2.44.0

