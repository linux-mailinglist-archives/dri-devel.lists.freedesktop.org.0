Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 25F3526D5BA
	for <lists+dri-devel@lfdr.de>; Thu, 17 Sep 2020 10:08:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D909B6EB76;
	Thu, 17 Sep 2020 08:08:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 574 seconds by postgrey-1.36 at gabe;
 Thu, 17 Sep 2020 02:14:22 UTC
Received: from m17618.mail.qiye.163.com (m17618.mail.qiye.163.com
 [59.111.176.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 780756E037
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Sep 2020 02:14:22 +0000 (UTC)
Received: from vivo-HP-ProDesk-680-G4-PCI-MT.vivo.xyz (unknown [58.251.74.226])
 by m17618.mail.qiye.163.com (Hmail) with ESMTPA id D1D7F4E15CF;
 Thu, 17 Sep 2020 10:04:41 +0800 (CST)
From: Wang Qing <wangqing@vivo.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] drm: fix spelling error in comments
Date: Thu, 17 Sep 2020 10:04:32 +0800
Message-Id: <1600308275-32094-1-git-send-email-wangqing@vivo.com>
X-Mailer: git-send-email 2.7.4
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgYFAkeWUFZS1VLWVdZKFlBSE83V1ktWUFJV1kPCR
 oVCBIfWUFZGUMYTB5KTx9KHU0aVkpNS0tIS0NJQ0lJQ0lVEwETFhoSFyQUDg9ZV1kWGg8SFR0UWU
 FZT0tIVUpKS0hKQ1VKS0tZBg++
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6Kxg6Nhw*Fj8tNBQsPTEUUTcf
 ITkaCRZVSlVKTUtLSEtDSUNJTExIVTMWGhIXVQwaFRwKEhUcOw0SDRRVGBQWRVlXWRILWUFZTkNV
 SU5KVUxPVUlJTVlXWQgBWUFKTEhONwY+
X-HM-Tid: 0a7499ce83409376kuwsd1d7f4e15cf
X-Mailman-Approved-At: Thu, 17 Sep 2020 08:08:02 +0000
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
Cc: Wang Qing <wangqing@vivo.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Change the comment typo: "manger" -> "manager".

Signed-off-by: Wang Qing <wangqing@vivo.com>
---
 include/drm/drm_mm.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/drm/drm_mm.h b/include/drm/drm_mm.h
index a01bc6f..9b4292f
--- a/include/drm/drm_mm.h
+++ b/include/drm/drm_mm.h
@@ -338,7 +338,7 @@ static inline u64 drm_mm_hole_node_end(const struct drm_mm_node *hole_node)
 
 /**
  * drm_mm_nodes - list of nodes under the drm_mm range manager
- * @mm: the struct drm_mm range manger
+ * @mm: the struct drm_mm range manager
  *
  * As the drm_mm range manager hides its node_list deep with its
  * structure, extracting it looks painful and repetitive. This is
-- 
2.7.4

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
