Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C3CF82205B6
	for <lists+dri-devel@lfdr.de>; Wed, 15 Jul 2020 09:00:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 248DC6E45C;
	Wed, 15 Jul 2020 07:00:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from casper.infradead.org (casper.infradead.org
 [IPv6:2001:8b0:10b:1236::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C20C6E378
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Jul 2020 05:23:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=tciRJW/36yu4csWuTfgh0yv4UeiTA/0HzJq70e8Fsh0=; b=NHRE3QmcqQ+ZYKnqffIXqgbtXK
 VnOAO0rX+Yenapjf8nEnGs0jYrBPs3p1cZ/7/sngs0LuV2CXj+edDFYvG/xZa9c48rzr+LJAdIJZY
 RXcIL/mFZOWyDW5lLXR3K/8+zNWgM8rSo+3NcUZ04SOiLaAxdQWzqkGqI/5241rMhmFggveeWYt6Q
 RceJD3dxbroAVE34y5/yCWI0baqnL5A1/yRBsWbdrtnQyO791d3NbH9Y8DPtfZnZWW0FQeD4BQYoy
 cvFMX96y2xEzjM1j00C61WpK43MSd1PwJoTe/R3nj2mu4BCLY+ZzIGGwq+TbfuoHQlFwB0Rmc7Ok+
 Y+ev10rw==;
Received: from [2601:1c0:6280:3f0::19c2] (helo=smtpauth.infradead.org)
 by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jvZtb-0006Vd-Lr; Wed, 15 Jul 2020 05:23:56 +0000
From: Randy Dunlap <rdunlap@infradead.org>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 3/7] drm: drm_gem.h: delete duplicated words in comments
Date: Tue, 14 Jul 2020 22:23:45 -0700
Message-Id: <20200715052349.23319-3-rdunlap@infradead.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200715052349.23319-1-rdunlap@infradead.org>
References: <20200715052349.23319-1-rdunlap@infradead.org>
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 15 Jul 2020 06:59:56 +0000
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Drop the doubled words "the" and "by" in comments.

Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Cc: David Airlie <airlied@linux.ie>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org
---
 include/drm/drm_gem.h |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

--- linux-next-20200714.orig/include/drm/drm_gem.h
+++ linux-next-20200714/include/drm/drm_gem.h
@@ -143,7 +143,7 @@ struct drm_gem_object_funcs {
 	/**
 	 * @vunmap:
 	 *
-	 * Releases the the address previously returned by @vmap. Used by the
+	 * Releases the address previously returned by @vmap. Used by the
 	 * drm_gem_dmabuf_vunmap() helper.
 	 *
 	 * This callback is optional.
@@ -157,7 +157,7 @@ struct drm_gem_object_funcs {
 	 *
 	 * This callback is optional.
 	 *
-	 * The callback is used by by both drm_gem_mmap_obj() and
+	 * The callback is used by both drm_gem_mmap_obj() and
 	 * drm_gem_prime_mmap().  When @mmap is present @vm_ops is not
 	 * used, the @mmap callback must set vma->vm_ops instead.
 	 */
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
