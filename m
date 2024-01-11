Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6977982A99F
	for <lists+dri-devel@lfdr.de>; Thu, 11 Jan 2024 09:52:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE55010E56C;
	Thu, 11 Jan 2024 08:51:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 355 seconds by postgrey-1.36 at gabe;
 Thu, 11 Jan 2024 07:03:22 UTC
Received: from m16.mail.163.com (m15.mail.163.com [45.254.50.219])
 by gabe.freedesktop.org (Postfix) with ESMTP id DF16A10E7C8
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Jan 2024 07:03:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=From:Subject:Date:Message-Id; bh=N4fl1Vr4yKPgLj4QrJ
 Z2wWvmpX5FPtU3ppWBKDsxI5I=; b=ddCHvTHcyMUimurQEGeNViyjt3ZWfoyJq2
 Gnw9UJcJGS8l/eeRElLMZU7hg3a2i/Q/2CBiPx1BlBlZZH/wGEciHssWXxUEkozM
 tJz8e/czZrW7We3L+vl/RCZBSkvwyXHK3WoE86g/zAoEFDkssH5mWMr4dFjtg0Z1
 bTu85joT8=
Received: from localhost.localdomain (unknown [182.148.14.173])
 by gzga-smtp-mta-g0-4 (Coremail) with SMTP id _____wDnzyqnkp9lyLyPAA--.56040S2;
 Thu, 11 Jan 2024 15:03:04 +0800 (CST)
From: GuoHua Chen <chenguohua_716@163.com>
To: tzimmermann@suse.de, airlied@gmail.com, maarten.lankhorst@linux.intel.com,
 daniel@ffwll.ch, mripard@kernel.org, patrik.r.jakobsson@gmail.com
Subject: [PATCH] drm/gma500: Clean up errors in oaktrail_lvds.h
Date: Thu, 11 Jan 2024 07:03:03 +0000
Message-Id: <20240111070303.9344-1-chenguohua_716@163.com>
X-Mailer: git-send-email 2.17.1
X-CM-TRANSID: _____wDnzyqnkp9lyLyPAA--.56040S2
X-Coremail-Antispam: 1Uf129KBjvdXoWrtF1fZF1rZF45Kw4kCF47CFg_yoWfJFb_CF
 W8GF4rWw4Dua1q9r1xAr4Yvr1qy3W5urs7ZFs3tFy3J345Zr15W3yYgFW3XFyxZayxWFZr
 twna9F98AFs7CjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
 9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IUjb4S3UUUUU==
X-Originating-IP: [182.148.14.173]
X-CM-SenderInfo: xfkh0w5xrk3tbbxrlqqrwthudrp/xtbBEgVi1mVOBk2+6AAAsV
X-Mailman-Approved-At: Thu, 11 Jan 2024 08:50:44 +0000
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 GuoHua Chen <chenguohua_716@163.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fix the following errors reported by checkpatch:

ERROR: space prohibited after that open parenthesis '('

Signed-off-by: GuoHua Chen <chenguohua_716@163.com>
---
 drivers/gpu/drm/gma500/oaktrail_lvds.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/gma500/oaktrail_lvds.c b/drivers/gpu/drm/gma500/oaktrail_lvds.c
index d974d0c60d2a..62490a49c1ba 100644
--- a/drivers/gpu/drm/gma500/oaktrail_lvds.c
+++ b/drivers/gpu/drm/gma500/oaktrail_lvds.c
@@ -126,7 +126,7 @@ static void oaktrail_lvds_mode_set(struct drm_encoder *encoder,
 		return;
 	}
 
-	drm_object_property_get_value( &connector->base,
+	drm_object_property_get_value(&connector->base,
 		dev->mode_config.scaling_mode_property, &v);
 	drm_connector_list_iter_end(&conn_iter);
 
-- 
2.17.1

