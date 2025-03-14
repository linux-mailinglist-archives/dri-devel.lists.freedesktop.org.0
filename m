Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 693DDA60A9E
	for <lists+dri-devel@lfdr.de>; Fri, 14 Mar 2025 08:58:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7FFC210E1BE;
	Fri, 14 Mar 2025 07:58:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=163.com header.i=@163.com header.b="DmXchrkj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.3])
 by gabe.freedesktop.org (Postfix) with ESMTP id 1D88C10E1BE
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Mar 2025 07:58:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=From:Subject:Date:Message-ID:MIME-Version; bh=helvO
 iEZEla5qyx3wM/5yytYahGTNScL6SHolKzTrVI=; b=DmXchrkj/ETvBx4bovvS5
 cysMMNJYY2ZALNPFsSTodncG7JPY0nY3my69xnnyzCDcm/zpzKf1VrNJgBKOutzt
 zlxyveV7jFLAhqRVltpiixaHU6cjsMIoAJAva7I7F63Iw++wOk8Dh6bPH4ixisEq
 KJbHIJDX8LK11+vv+eN4i8=
Received: from ProDesk.. (unknown [])
 by gzga-smtp-mtada-g1-3 (Coremail) with SMTP id
 _____wCnEAuD4dNnAqebSg--.11559S2; 
 Fri, 14 Mar 2025 15:57:59 +0800 (CST)
From: Andy Yan <andyshrk@163.com>
To: lumag@kernel.org
Cc: cristian.ciocaltea@collabora.com, mripard@kernel.org,
 neil.armstrong@linaro.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, heiko@sntech.de,
 Andy Yan <andy.yan@rock-chips.com>
Subject: [PATCH] drm/bridge: dw-hdmi: Avoid including uapi headers
Date: Fri, 14 Mar 2025 15:57:47 +0800
Message-ID: <20250314075754.539221-1-andyshrk@163.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wCnEAuD4dNnAqebSg--.11559S2
X-Coremail-Antispam: 1Uf129KBjvdXoWrZrW7Kw48uw15GFyrWrWrGrg_yoWfGrc_C3
 WxZr4DGrWjkr1qvF13ArsxZ34q9w4UuFWxWFn5Kr9xAF4kZr4agw17ZFyUJwn8uF15KF9r
 Wa45WFWIyrnxGjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
 9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IU0hL0UUUUUU==
X-Originating-IP: [58.22.7.114]
X-CM-SenderInfo: 5dqg52xkunqiywtou0bp/xtbB0gwQXmfT3XZ7-QAAsJ
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

From: Andy Yan <andy.yan@rock-chips.com>

It is not recommended for drivers to include UAPI header
directly.

Signed-off-by: Andy Yan <andy.yan@rock-chips.com>
---

 drivers/gpu/drm/bridge/synopsys/dw-hdmi.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
index 0890add5f707..306e09a24a1c 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
@@ -22,8 +22,8 @@
 
 #include <media/cec-notifier.h>
 
-#include <uapi/linux/media-bus-format.h>
-#include <uapi/linux/videodev2.h>
+#include <linux/media-bus-format.h>
+#include <linux/videodev2.h>
 
 #include <drm/bridge/dw_hdmi.h>
 #include <drm/display/drm_hdmi_helper.h>
-- 
2.34.1

