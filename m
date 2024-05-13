Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 77B608C3B68
	for <lists+dri-devel@lfdr.de>; Mon, 13 May 2024 08:35:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7229410E1C8;
	Mon, 13 May 2024 06:35:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 876 seconds by postgrey-1.36 at gabe;
 Mon, 13 May 2024 06:35:06 UTC
Received: from mail-vip.corpemail.net (mail-vip.corpemail.net
 [162.243.126.186])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 73AB710E1C8;
 Mon, 13 May 2024 06:35:06 +0000 (UTC)
Received: from unicom146.biz-email.net
 by unicom146.biz-email.net ((D)) with ASMTP (SSL) id JBB00052;
 Mon, 13 May 2024 14:14:52 +0800
Received: from localhost.localdomain (10.94.2.243) by
 jtjnmail201606.home.langchao.com (10.100.2.6) with Microsoft SMTP Server id
 15.1.2507.35; Mon, 13 May 2024 14:14:53 +0800
From: Deming Wang <wangdeming@inspur.com>
To: <airlied@linux.ie>, <daniel@ffwll.ch>
CC: <intel-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, Deming Wang <wangdeming@inspur.com>
Subject: [PATCH] drm/i915/gem/i915_gem_ttm_move: Fix typo
Date: Mon, 13 May 2024 02:14:51 -0400
Message-ID: <20240513061451.1627-1-wangdeming@inspur.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.94.2.243]
tUid: 2024513141452779b28cd68fca5655d37adb3049c7554
X-Abuse-Reports-To: service@corp-email.com
Abuse-Reports-To: service@corp-email.com
X-Complaints-To: service@corp-email.com
X-Report-Abuse-To: service@corp-email.com
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

The mapings should be replaced by mappings.

Signed-off-by: Deming Wang <wangdeming@inspur.com>
---
 drivers/gpu/drm/i915/gem/i915_gem_ttm_move.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_ttm_move.c b/drivers/gpu/drm/i915/gem/i915_gem_ttm_move.c
index 7078af2f8f79..03b00a03a634 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_ttm_move.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_ttm_move.c
@@ -155,7 +155,7 @@ void i915_ttm_adjust_gem_after_move(struct drm_i915_gem_object *obj)
  * @bo: The ttm buffer object.
  *
  * This function prepares an object for move by removing all GPU bindings,
- * removing all CPU mapings and finally releasing the pages sg-table.
+ * removing all CPU mappings and finally releasing the pages sg-table.
  *
  * Return: 0 if successful, negative error code on error.
  */
-- 
2.31.1

