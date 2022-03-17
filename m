Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ADA304DBD0D
	for <lists+dri-devel@lfdr.de>; Thu, 17 Mar 2022 03:33:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9076F10EACE;
	Thu, 17 Mar 2022 02:33:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 409 seconds by postgrey-1.36 at gabe;
 Thu, 17 Mar 2022 02:33:50 UTC
Received: from out1.migadu.com (out1.migadu.com [91.121.223.63])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6026810EACE
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Mar 2022 02:33:50 +0000 (UTC)
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1647484018;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=Q2+xTQ4dDnoeik2e2Wdggjy35zUCHf1Mo81wsw6HvK0=;
 b=ijBIt63wme2u/42TH6noyAasLdbYIl7uXztMzIhMFJd4gtNpfq6uZoCuwBg6Gmnl6o+mxu
 /VtuJnFaAirBqAVa6DEsOjRMxWqpQMNJw/YiQJZ06qLmNKLmDhOD3WPe2gjcE1OBcZfFNs
 3xa2CidBfKxQXkGizv3bUKcHVxvgX5Y=
From: Cai Huoqing <cai.huoqing@linux.dev>
To: cai.huoqing@linux.dev
Subject: [PATCH] drm/mm: Fix the param description for 'size' tag
Date: Thu, 17 Mar 2022 10:26:31 +0800
Message-Id: <20220317022631.10570-1-cai.huoqing@linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-Migadu-Auth-User: linux.dev
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Using "size of" instead of  "end of" to fix the description for 'size' tag.

Signed-off-by: Cai Huoqing <cai.huoqing@linux.dev>
---
 drivers/gpu/drm/drm_mm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_mm.c b/drivers/gpu/drm/drm_mm.c
index 8257f9d4f619..c2eedfd264f8 100644
--- a/drivers/gpu/drm/drm_mm.c
+++ b/drivers/gpu/drm/drm_mm.c
@@ -956,7 +956,7 @@ EXPORT_SYMBOL(drm_mm_scan_color_evict);
  * drm_mm_init - initialize a drm-mm allocator
  * @mm: the drm_mm structure to initialize
  * @start: start of the range managed by @mm
- * @size: end of the range managed by @mm
+ * @size: size of the range managed by @mm
  *
  * Note that @mm must be cleared to 0 before calling this function.
  */
-- 
2.25.1

