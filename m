Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D0D247A18D
	for <lists+dri-devel@lfdr.de>; Sun, 19 Dec 2021 18:37:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD4B1112F16;
	Sun, 19 Dec 2021 17:37:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D85FF112822
 for <dri-devel@lists.freedesktop.org>; Sun, 19 Dec 2021 17:37:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=IBFrIn/V19OhL/sHWtJj02de2xDyPGP3uatKMq3FTgs=; b=1vG0XLZgveZnsXWs1KwxNp40uu
 92jBM6ELh7EkBgQl78XSiOCug3X7rHdo1mUbGnuGoaIVFj5MZzwwwVU2rTbxozAP8XSjc8JuNJiDY
 IMWoZg6QyVejZdygjCrmEIelL2mjYwEyrh8xltkEDRTnSkbarDoN8wlcoBbOrk6zVwjXtU2AFFzp1
 RpteAgQiI1JO3pNYfet8uXbR7Fk/9ht9XU5kWOTzd4PycXALnxtPIGuh4kkvAiYzdll9eMww1nAiu
 MweJ6bW3B9RGW1zeAGWEhxm+LLbbcTokbM6jt3bHvW8H2Ii5fJr1SKEwVGuECHG/y5ChgsfCwZuF/
 DOlJkgPA==;
Received: from [2601:1c0:6280:3f0::aa0b] (helo=bombadil.infradead.org)
 by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mz07t-00GWno-9c; Sun, 19 Dec 2021 17:37:37 +0000
From: Randy Dunlap <rdunlap@infradead.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm: drm/drm_modeset_lock.h: add a kernel-doc entry
Date: Sun, 19 Dec 2021 09:37:36 -0800
Message-Id: <20211219173736.10081-1-rdunlap@infradead.org>
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

Add @stack_depot to the kernel-doc comments to prevent a kernel-doc
build warning.

../include/drm/drm_modeset_lock.h:74: warning: Function parameter or member 'stack_depot' not described in 'drm_modeset_acquire_ctx'

Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Cc: David Airlie <airlied@linux.ie>
Cc: Daniel Vetter <daniel@ffwll.ch>
---
 include/drm/drm_modeset_lock.h |    1 +
 1 file changed, 1 insertion(+)

--- linux-next-20211217.orig/include/drm/drm_modeset_lock.h
+++ linux-next-20211217/include/drm/drm_modeset_lock.h
@@ -34,6 +34,7 @@ struct drm_modeset_lock;
  * struct drm_modeset_acquire_ctx - locking context (see ww_acquire_ctx)
  * @ww_ctx: base acquire ctx
  * @contended: used internally for -EDEADLK handling
+ * @stack_depot: used for debugging contended locks & backoff
  * @locked: list of held locks
  * @trylock_only: trylock mode used in atomic contexts/panic notifiers
  * @interruptible: whether interruptible locking should be used.
