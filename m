Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C64F82A995
	for <lists+dri-devel@lfdr.de>; Thu, 11 Jan 2024 09:51:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C626910E858;
	Thu, 11 Jan 2024 08:50:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m16.mail.126.com (m16.mail.126.com [220.197.31.8])
 by gabe.freedesktop.org (Postfix) with ESMTP id 5092D10E570
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Jan 2024 06:40:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
 s=s110527; h=From:Subject:Date:Message-Id; bh=bukJ7OHTol8WS/g72V
 ADTf1WGd5LwIRine63hdltWCU=; b=DFrWyuxld5F/tGn1JWAdmsmUPvIilKJ3Lo
 BbbaOfcBi5J0jDeayZ/d2utSDU3/xfSVK8XCWs+RmH/ZKSnRoeNVuCzbF/eUbQ8i
 H6LF79yLip7EIfEZ5dMwi15Lup56yBWq7mDatdyRGAJE8MfEsN9d05EIz613CXib
 ifDNpvFpo=
Received: from localhost.localdomain (unknown [182.148.14.173])
 by gzga-smtp-mta-g0-2 (Coremail) with SMTP id _____wDnz8cajZ9l8M6hAA--.27451S2;
 Thu, 11 Jan 2024 14:39:23 +0800 (CST)
From: chenxuebing <chenxb_99091@126.com>
To: daniel@ffwll.ch, airlied@gmail.com, mripard@kernel.org,
 maarten.lankhorst@linux.intel.com, tzimmermann@suse.de
Subject: [PATCH] drm/edid: Clean up errors in drm_edid.h
Date: Thu, 11 Jan 2024 06:39:21 +0000
Message-Id: <20240111063921.8701-1-chenxb_99091@126.com>
X-Mailer: git-send-email 2.17.1
X-CM-TRANSID: _____wDnz8cajZ9l8M6hAA--.27451S2
X-Coremail-Antispam: 1Uf129KBjvdXoWrtryUWFWDAw1rtrWkKFW3KFg_yoW3XFg_CF
 y8Z3srXrWI9FWIkrnrAw43ZrWIyF1ruF48Xw18tayFyry7X3W5Zryjvry3X348XF17Za4D
 A3WkGr4rJrnFkjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
 9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IUUZNVJUUUUU==
X-Originating-IP: [182.148.14.173]
X-CM-SenderInfo: hfkh05lebzmiizr6ij2wof0z/1tbiWR1ixWVLYUIH4QAAsI
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
 chenxuebing <chenxb_99091@126.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fix the following errors reported by checkpatch:

ERROR: do not use assignment in if condition

Signed-off-by: chenxuebing <chenxb_99091@126.com>
---
 drivers/gpu/drm/drm_edid.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
index 69c68804023f..9bcaf76f10fc 100644
--- a/drivers/gpu/drm/drm_edid.c
+++ b/drivers/gpu/drm/drm_edid.c
@@ -3611,7 +3611,8 @@ static bool mode_in_range(const struct drm_display_mode *mode,
 	if (!mode_in_vsync_range(mode, edid, t))
 		return false;
 
-	if ((max_clock = range_pixel_clock(edid, t)))
+	max_clock = range_pixel_clock(edid, t);
+	if (max_clock)
 		if (mode->clock > max_clock)
 			return false;
 
-- 
2.17.1

