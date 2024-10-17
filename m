Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C9379A18B6
	for <lists+dri-devel@lfdr.de>; Thu, 17 Oct 2024 04:43:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D3BC10E785;
	Thu, 17 Oct 2024 02:43:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.b="iYAWEXSC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [198.137.202.133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D531F10E785
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Oct 2024 02:43:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=kegHJLpQz6vdtwsFfnK7vEYWeG6yPEw7RqtmTwSUv7c=; b=iYAWEXSCoRNt6tGqkYRCjxbqp8
 o6c90oEVdp54y+tfoMj9i0GBrOg+f5KIfqeHXknE+ZAtAB9OsyI5ITPBx6ZyxWtEkenRwH0PVowuS
 R1osB3kwRTIp4ZLrUHWH+uSR8J3xQzKe3ouRE8p/JVB0KWJDoMR20QhSAmD+Fo6jAByQxoboz9XSb
 +LlPeMGSbooUhfCH9YWb6yV7dPzuXIaHiCRHLVUD2kkQvK2Zeb7ZU/i9OIkY0umzZbwwuwEDr4Dpy
 2KtGdKYOUq0Sys513id/J8q1RatPK6qgUSC5mWhofZt4ws6Dwm0FakdhtbajiqNrDhHboW4ItSwNQ
 UnaywK9g==;
Received: from [50.53.2.24] (helo=bombadil.infradead.org)
 by bombadil.infradead.org with esmtpsa (Exim 4.98 #2 (Red Hat Linux))
 id 1t1GTi-0000000DZmR-092C; Thu, 17 Oct 2024 02:43:06 +0000
From: Randy Dunlap <rdunlap@infradead.org>
To: dri-devel@lists.freedesktop.org
Cc: patches@lists.linux.dev, Randy Dunlap <rdunlap@infradead.org>,
 Stephen Rothwell <sfr@canb.auug.org.au>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH] >>>>>>>>>>>>>>>>>>>>>>> FIXME <<<<<<<<<<<<<<<<<<<<<<
Date: Wed, 16 Oct 2024 19:43:05 -0700
Message-ID: <20241017024305.61318-1-rdunlap@infradead.org>
X-Mailer: git-send-email 2.47.0
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


drivers/gpu/drm/drm_fbdev_dma.c:1: warning: no structured comments found
drivers/gpu/drm/drm_fbdev_shmem.c:1: warning: no structured comments found
drivers/gpu/drm/drm_fbdev_ttm.c:1: warning: no structured comments found

Fixes: 731fddf4302e ("drm/fbdev-dma: Remove obsolete setup function")
Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: David Airlie <airlied@gmail.com>
Cc: Simona Vetter <simona@ffwll.ch>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: dri-devel@lists.freedesktop.org
---
 Documentation/gpu/drm-kms-helpers.rst |    9 ---------
 1 file changed, 9 deletions(-)

--- linux-next-20241016.orig/Documentation/gpu/drm-kms-helpers.rst
+++ linux-next-20241016/Documentation/gpu/drm-kms-helpers.rst
@@ -110,15 +110,6 @@ fbdev Helper Functions Reference
 .. kernel-doc:: drivers/gpu/drm/drm_fb_helper.c
    :doc: fbdev helpers
 
-.. kernel-doc:: drivers/gpu/drm/drm_fbdev_dma.c
-   :export:
-
-.. kernel-doc:: drivers/gpu/drm/drm_fbdev_shmem.c
-   :export:
-
-.. kernel-doc:: drivers/gpu/drm/drm_fbdev_ttm.c
-   :export:
-
 .. kernel-doc:: include/drm/drm_fb_helper.h
    :internal:
 
