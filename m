Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EAEF482BAB9
	for <lists+dri-devel@lfdr.de>; Fri, 12 Jan 2024 06:17:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D27A10E02D;
	Fri, 12 Jan 2024 05:17:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:3::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7772E10E02D
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Jan 2024 05:17:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=KaXHBB1lQIJmdSrt3Oq4GYxXze7lBTy8oSpYLRXSEvs=; b=p6EUstRNcwrw2/B5R5yy5+Q7d3
 Dz5SteK7fA7mjcanZQtSPsjlQrX9USO0ttFvM6yCjuWsIS6NyDursvEYsU8L4WiFqt7X8zZZ06yjb
 TjhhTh6dSF0o/2WjJfBGZpHIxsS12p1HijhrVsrms3lMh4RNX1C2udKSpRYQv6B5x8nFJ+r3Ax73s
 mzUWwdAymd72VQIE0eeMp0P4CY8nkkwL3U424EyDtxvJPlAr5cGML2glMCH3/Y5MXznaQngufJau4
 PXH5L1y2dEnBW0OXOROREXz2v9SqFKBa6+lmLoqI/wWxRipvywC7MfPLEUgLtPakfWQ0BZXlT1orf
 9U+xqBUQ==;
Received: from [50.53.46.231] (helo=bombadil.infradead.org)
 by bombadil.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
 id 1rO9v9-001vL0-2m; Fri, 12 Jan 2024 05:17:31 +0000
From: Randy Dunlap <rdunlap@infradead.org>
To: linux-kernel@vger.kernel.org
Subject: [PATCH] drm/doc: internals: remove section on PCI legacy support
Date: Thu, 11 Jan 2024 21:17:31 -0800
Message-ID: <20240112051731.15722-1-rdunlap@infradead.org>
X-Mailer: git-send-email 2.43.0
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, Jonathan Corbet <corbet@lwn.net>,
 Randy Dunlap <rdunlap@infradead.org>, linux-doc@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The functions that were described in this section of
drm-internals.rst were removed in NOV-2023, along with all of the
kernel-doc comments in the source file. This now causes a
docs build warning, so remove that section of the documentation also.

drivers/gpu/drm/drm_pci.c:1: warning: no structured comments found

Fixes: 2504c7ec728b ("drm: Remove source code for non-KMS drivers")
Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: David Airlie <airlied@gmail.com>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org
Cc: Jonathan Corbet <corbet@lwn.net>
Cc: linux-doc@vger.kernel.org
---
 Documentation/gpu/drm-internals.rst |   12 ------------
 1 file changed, 12 deletions(-)

diff -- a/Documentation/gpu/drm-internals.rst b/Documentation/gpu/drm-internals.rst
--- a/Documentation/gpu/drm-internals.rst
+++ b/Documentation/gpu/drm-internals.rst
@@ -153,18 +153,6 @@ Managed Resources
 .. kernel-doc:: include/drm/drm_managed.h
    :internal:
 
-Bus-specific Device Registration and PCI Support
-------------------------------------------------
-
-A number of functions are provided to help with device registration. The
-functions deal with PCI and platform devices respectively and are only
-provided for historical reasons. These are all deprecated and shouldn't
-be used in new drivers. Besides that there's a few helpers for pci
-drivers.
-
-.. kernel-doc:: drivers/gpu/drm/drm_pci.c
-   :export:
-
 Open/Close, File Operations and IOCTLs
 ======================================
 
