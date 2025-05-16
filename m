Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EE82AB98B2
	for <lists+dri-devel@lfdr.de>; Fri, 16 May 2025 11:24:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA43E10EA02;
	Fri, 16 May 2025 09:24:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=163.com header.i=@163.com header.b="ohFhW1oB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.3])
 by gabe.freedesktop.org (Postfix) with ESMTP id 4646D10EA02
 for <dri-devel@lists.freedesktop.org>; Fri, 16 May 2025 09:24:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=HT
 Nhmctmjx4Z/bGQiWHj5z1Zlft6woH0PtPOT4ao6Qo=; b=ohFhW1oBCY9KWubs99
 QZ+/ZhJcN8vxocqeGvn5kO4cUuHjX1eNq0jog+ptxQnx1kU9e3NDHzndkK7Wj93d
 FaUud4rsrqOwzlhTc2+gXc6M/AjQARW3/X0et8NMFQY3PtKGZrUgG/ia9yA/SRij
 N9YyU56Uq9a+diF9UJFj25x4Q=
Received: from ProDesk.. (unknown [])
 by gzsmtp4 (Coremail) with SMTP id PygvCgD3_3UgBCdo+HWMAw--.22577S2;
 Fri, 16 May 2025 17:23:48 +0800 (CST)
From: Andy Yan <andyshrk@163.com>
To: tzimmermann@suse.de
Cc: airlied@gmail.com, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 simona@ffwll.ch, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Andy Yan <andyshrk@163.com>
Subject: [PATCH] drm: Fix one indentation issue in drm_auth.h
Date: Fri, 16 May 2025 17:23:38 +0800
Message-ID: <20250516092343.3206846-1-andyshrk@163.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: PygvCgD3_3UgBCdo+HWMAw--.22577S2
X-Coremail-Antispam: 1Uf129KBjvdXoWrtrWrAr4xZry5XrWrJFWxXrb_yoWxCrc_Aa
 4xW3W8Wry8u343Ar1xZa95Aryaga4rXan0qFn5XF47AF1kJr4Yqas5GFyUta4rWr18GrZ3
 Wan8Jr9xAr13KjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
 9fnUUvcSsGvfC2KfnxnUUI43ZEXa7sRpVbqPUUUUU==
X-Originating-IP: [58.22.7.114]
X-CM-SenderInfo: 5dqg52xkunqiywtou0bp/1tbiqBFPXmgnAPF43gAAsw
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

This should be one space.

Signed-off-by: Andy Yan <andyshrk@163.com>
---

 include/drm/drm_auth.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/drm/drm_auth.h b/include/drm/drm_auth.h
index 50131383ed81..830386804f91 100644
--- a/include/drm/drm_auth.h
+++ b/include/drm/drm_auth.h
@@ -86,7 +86,7 @@ struct drm_master {
 	 * ID for lessees. Owners (i.e. @lessor is NULL) always have ID 0.
 	 * Protected by &drm_device.mode_config's &drm_mode_config.idr_mutex.
 	 */
-	int	lessee_id;
+	int lessee_id;
 
 	/**
 	 * @lessee_list:
-- 
2.43.0

base-commit: a4f3be422d87958ef9f17d96df142e5d573d2f23
branch: drm-misc-next

