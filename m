Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EA6D54F0CE3
	for <lists+dri-devel@lfdr.de>; Mon,  4 Apr 2022 01:10:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C35CA10E193;
	Sun,  3 Apr 2022 23:10:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF25410E193
 for <dri-devel@lists.freedesktop.org>; Sun,  3 Apr 2022 23:10:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=6kZxA/ryHkaU9h/eQxcRuN9OQKG8Wz6rQOnBsqvvAIM=; b=b8yQ+shycBrAuZ1bphbkYe/UY0
 w9RLUEg4rEzzdMw1tTMWh8L1mXzVEWZ2eXJhiSURz+lopWPE5LhVrQUZIAW3rOAk847f5nkDXvkrR
 6ApanfC8plvYpFWZfkK5jSg+3nyE+5czoL9JpjJvx50n4f7ahVgxbAUjkzoW8jKxqtirFcX2tEwyM
 RMxKdhTAPGb3m+DkpWZ0fNJIHceRUrSlxdzUAK+CRjwP3H5koSP/SYA75iY9v5gDy0qEhnc4Avenh
 kKH5NCSlJz2+Y41VToxQ2C3BpXH0eqLRxACCtZzeCQ07GQ9p5/OJwA1VN+AvscVyPf8Npy94QjfM8
 lROKVdZg==;
Received: from [2601:1c0:6280:3f0::aa0b] (helo=bombadil.infradead.org)
 by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nb9Mn-00CVxK-F4; Sun, 03 Apr 2022 23:10:41 +0000
From: Randy Dunlap <rdunlap@infradead.org>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v2] drm: drm/drm_file.h: fix a kernel-doc typo
Date: Sun,  3 Apr 2022 16:10:40 -0700
Message-Id: <20220403231040.18540-1-rdunlap@infradead.org>
X-Mailer: git-send-email 2.34.1
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
Cc: David Airlie <airlied@linux.ie>, Randy Dunlap <rdunlap@infradead.org>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fix a build warning from 'make htmldocs' by correcting the lock name
in the kernel-doc comment.

include/drm/drm_file.h:369: warning: Function parameter or member 'master_lookup_lock' not described in 'drm_file'

Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Cc: David Airlie <airlied@linux.ie>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org
Reviewed-by: Simon Ser <contact@emersion.fr>
---
v2: rebase/resend

 include/drm/drm_file.h |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

--- linux-next-20220401.orig/include/drm/drm_file.h
+++ linux-next-20220401/include/drm/drm_file.h
@@ -248,7 +248,7 @@ struct drm_file {
 	 */
 	struct drm_master *master;
 
-	/** @master_lock: Serializes @master. */
+	/** @master_lookup_lock: Serializes @master. */
 	spinlock_t master_lookup_lock;
 
 	/** @pid: Process that opened this file. */
