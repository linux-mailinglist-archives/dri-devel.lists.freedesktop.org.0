Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C773A47A18C
	for <lists+dri-devel@lfdr.de>; Sun, 19 Dec 2021 18:37:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D30E3112804;
	Sun, 19 Dec 2021 17:37:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 81450112804
 for <dri-devel@lists.freedesktop.org>; Sun, 19 Dec 2021 17:37:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=45VJu1f6INdq/MgERimVJHzqo+e8PJ5KOh5ifY4yM1E=; b=K6YkmXvqekoNPOZxSEU6lLaixa
 gFxw/p1M7ot+Ns70fO8L2AIh90SuO0O8nMypDwlNboTuOB5z3HTDXohM1hca2fI6a5eTTC570B8/A
 WZUhQtffYM2Qu4OzfYwRBiWY52aUBUKUMb46sOkO0tRV9CQYRP2mZvQJxiOFtzj9iXG1G/dEb8B4z
 Q0v8lQsn6f/cP0t0t/ZkfC92A/gFfkmGNvXKN4De4b0pTvwgNm2JRR61L5Ux05lvWJh9tBmQMbKn3
 OMS+fkad9MLDxL10J310sb5ridDVIZ21yQdK3tNN2k0ZIK7g9e/7/EXLYE49cB9X/B8qFOea7kHb9
 7xJZM+Kw==;
Received: from [2601:1c0:6280:3f0::aa0b] (helo=bombadil.infradead.org)
 by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mz07l-00GWmS-S2; Sun, 19 Dec 2021 17:37:29 +0000
From: Randy Dunlap <rdunlap@infradead.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm: drm/drm_file.h: fix a kernel-doc typo
Date: Sun, 19 Dec 2021 09:37:28 -0800
Message-Id: <20211219173728.9806-1-rdunlap@infradead.org>
X-Mailer: git-send-email 2.31.1
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
Cc: David Airlie <airlied@linux.ie>, Randy Dunlap <rdunlap@infradead.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fix a build warning from 'make htmldocs' by correcting the lock name
in the kernel-doc comment.

../include/drm/drm_file.h:369: warning: Function parameter or member 'master_lookup_lock' not described in 'drm_file'

Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Cc: David Airlie <airlied@linux.ie>
Cc: Daniel Vetter <daniel@ffwll.ch>
---
 include/drm/drm_file.h |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

--- linux-next-20211217.orig/include/drm/drm_file.h
+++ linux-next-20211217/include/drm/drm_file.h
@@ -248,7 +248,7 @@ struct drm_file {
 	 */
 	struct drm_master *master;
 
-	/** @master_lock: Serializes @master. */
+	/** @master_lookup_lock: Serializes @master. */
 	spinlock_t master_lookup_lock;
 
 	/** @pid: Process that opened this file. */
