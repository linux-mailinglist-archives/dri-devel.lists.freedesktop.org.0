Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 986FE7BCECB
	for <lists+dri-devel@lfdr.de>; Sun,  8 Oct 2023 16:02:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9EB2410E145;
	Sun,  8 Oct 2023 14:02:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:3::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0134610E145;
 Sun,  8 Oct 2023 14:02:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=figW6V5IxO3BN+Q3ev6fcFUCPxrFf784LSxaFnVtQh0=; b=hXUnR+z5iXugz8qJvJ6sO3rUMU
 UeLlJjoEa0+ezplb8/cgbEVxY6c+TS+Ai6cz4h1cNpXUOjJ2NNk0+fESqqPVLe006JtsNF1dg9AWP
 lfutHgYn+Rr3H3OV6fBEyxhXzfDxxeL2zgzbmdUfZYwuqximXP/PGjdZ5ZJuTU96ZKEpkvGyEqFmQ
 mvguTtscESZ/a9E5tY4/P5VCh5iGSeGKbZ+B7qI0KVb7ITD423v0aCqdOJlBU9LWEEKDMwwODYFvX
 pSo3X24IOb3FGnnQ3C/UYbPt9vwhLl7P8g3gGK1oESwLkdV5LQWVfoEDfyZwhCNn/NRckVnppBE84
 TvF5BEJA==;
Received: from [50.53.46.231] (helo=bombadil.infradead.org)
 by bombadil.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
 id 1qpUMZ-008vP6-2d; Sun, 08 Oct 2023 14:02:31 +0000
From: Randy Dunlap <rdunlap@infradead.org>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v2] drm/nouveau: exec: fix ioctl kernel-doc warning
Date: Sun,  8 Oct 2023 07:02:31 -0700
Message-ID: <20231008140231.17921-1-rdunlap@infradead.org>
X-Mailer: git-send-email 2.42.0
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
Cc: Karol Herbst <kherbst@redhat.com>,
 Bragatheswaran Manickavel <bragathemanick0908@gmail.com>,
 nouveau@lists.freedesktop.org, Randy Dunlap <rdunlap@infradead.org>,
 dri-devel@lists.freedesktop.org, Danilo Krummrich <dakr@redhat.com>,
 Dave Airlie <airlied@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

kernel-doc emits a warning:

include/uapi/drm/nouveau_drm.h:49: warning: Cannot understand  * @NOUVEAU_GETPARAM_EXEC_PUSH_MAX
 on line 49 - I thought it was a doc line

We don't have a way to document a macro value via kernel-doc, so
change the "/**" kernel-doc marker to a C comment and format the comment
more like a kernel-doc comment for consistency.

Fixes: d59e75eef52d ("drm/nouveau: exec: report max pushs through getparam")
Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Cc: Dave Airlie <airlied@redhat.com>
Cc: Danilo Krummrich <dakr@redhat.com>
Cc: Karol Herbst <kherbst@redhat.com>
Cc: Lyude Paul <lyude@redhat.com>
Cc: dri-devel@lists.freedesktop.org
Cc: nouveau@lists.freedesktop.org
Cc: Bragatheswaran Manickavel <bragathemanick0908@gmail.com>
---
v2: update commit text; somehow I sent a version of the patch before
    adding the full text.
v1: https://lore.kernel.org/lkml/20231007005518.32015-1-rdunlap@infradead.org/

 include/uapi/drm/nouveau_drm.h |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff -- a/include/uapi/drm/nouveau_drm.h b/include/uapi/drm/nouveau_drm.h
--- a/include/uapi/drm/nouveau_drm.h
+++ b/include/uapi/drm/nouveau_drm.h
@@ -45,8 +45,8 @@ extern "C" {
 #define NOUVEAU_GETPARAM_HAS_BO_USAGE    15
 #define NOUVEAU_GETPARAM_HAS_PAGEFLIP    16
 
-/**
- * @NOUVEAU_GETPARAM_EXEC_PUSH_MAX
+/*
+ * NOUVEAU_GETPARAM_EXEC_PUSH_MAX - query max pushes through getparam
  *
  * Query the maximum amount of IBs that can be pushed through a single
  * &drm_nouveau_exec structure and hence a single &DRM_IOCTL_NOUVEAU_EXEC
