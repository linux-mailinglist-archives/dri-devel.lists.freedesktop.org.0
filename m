Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C76B65BDC83
	for <lists+dri-devel@lfdr.de>; Tue, 20 Sep 2022 07:41:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F0A1010E099;
	Tue, 20 Sep 2022 05:41:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from casper.infradead.org (casper.infradead.org
 [IPv6:2001:8b0:10b:1236::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E6C4B10E099
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Sep 2022 05:41:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:In-Reply-To:References;
 bh=SFA4U7SNnj5axMlyD6+ZISStwj66ZZ5rXuREXi8QMfM=; b=sW+JodFX8jPpgU5zktkR/G9VcH
 b3XRpzznJ1uI3aSl9He44RXvJX7I7PnyoN2sXgROC9EgHVOZu8qySf0gURRQs8BzPG1vVmAlmx/kL
 0+i5UwiqCb3gqX7PPf36h3tIhyFtKdRpv7qlWJjOXW63y+wjTV1T6yec6YMhbVsTVz2XSXw4yKX5T
 KWHt56vP9zXCp51tEgjJk1hmuBxTIYGfTVGQnfUVk18tb04D7+PFamcWU/H8ZDy8udWISPXw9rcC2
 PQCabQMt1DGwm7or1qNViX9rRn8XfxEVU7tjnUMlGSrwmjyyeB6FBxcArRY0SAYPj/4V7jvGmQekf
 fQlbEnoQ==;
Received: from [2601:1c2:d80:3110::a2e7] (helo=casper.infradead.org)
 by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1oaW0S-005Hes-KP; Tue, 20 Sep 2022 05:41:17 +0000
From: Randy Dunlap <rdunlap@infradead.org>
To: linux-kernel@vger.kernel.org
Subject: [PATCH] drm/atomic_helper: correct kernel-doc function name warning
Date: Mon, 19 Sep 2022 22:41:09 -0700
Message-Id: <20220920054109.5658-1-rdunlap@infradead.org>
X-Mailer: git-send-email 2.37.3
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

kernel-doc warns that a function name in a comment does not match the
code's function name, so correct that.

../drivers/gpu/drm/drm_atomic_helper.c:802: warning: expecting prototype for drm_atomic_helper_check_wb_connector_state(). Prototype was for drm_atomic_helper_check_wb_encoder_state() instead

Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Cc: David Airlie <airlied@linux.ie>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org
Cc: airlied@gmail.com
---
 drivers/gpu/drm/drm_atomic_helper.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

--- a/drivers/gpu/drm/drm_atomic_helper.c
+++ b/drivers/gpu/drm/drm_atomic_helper.c
@@ -786,7 +786,7 @@ drm_atomic_helper_check_modeset(struct d
 EXPORT_SYMBOL(drm_atomic_helper_check_modeset);
 
 /**
- * drm_atomic_helper_check_wb_connector_state() - Check writeback encoder state
+ * drm_atomic_helper_check_wb_encoder_state() - Check writeback encoder state
  * @encoder: encoder state to check
  * @conn_state: connector state to check
  *
