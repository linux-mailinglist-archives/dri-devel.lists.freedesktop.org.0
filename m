Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B40AEA85C63
	for <lists+dri-devel@lfdr.de>; Fri, 11 Apr 2025 14:00:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1873910EB7F;
	Fri, 11 Apr 2025 12:00:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=163.com header.i=@163.com header.b="cwaBQPxu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.3])
 by gabe.freedesktop.org (Postfix) with ESMTP id 4E1F310EB7F
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Apr 2025 12:00:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=From:Subject:Date:Message-ID:MIME-Version; bh=Ai6KO
 rDYRhXJ9lvg8B6jho/hJgKPY3oes6sm6uHCIVQ=; b=cwaBQPxugXqPHMuN975Hd
 UFQNFOVGGuJZ/NgXaZ3/WIGz95Z4k5nKjTV5hGLeSjYUjHyPufr2Rwr44+3EQcEa
 NniugkIkdMqlMREKpKmfxsig58eLbcW48Mq6Mv3iSR+8k55tMWYKRAvHDyDWPJ0O
 zFbkzzGAhUciPngSeO79Vg=
Received: from ProDesk.. (unknown [])
 by gzsmtp2 (Coremail) with SMTP id PSgvCgDXnwMuBPlnWR0nAA--.27850S2;
 Fri, 11 Apr 2025 19:59:46 +0800 (CST)
From: Andy Yan <andyshrk@163.com>
To: lumag@kernel.org
Cc: cristian.ciocaltea@collabora.com, mripard@kernel.org,
 neil.armstrong@linaro.org, andrzej.hajda@intel.com, dianders@chromium.org,
 jernej.skrabec@gmail.com, Laurent.pinchart@ideasonboard.com,
 maarten.lankhorst@linux.intel.com, rfoss@kernel.org, simona@ffwll.ch,
 tzimmermann@suse.de, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, heiko@sntech.de,
 Andy Yan <andy.yan@rock-chips.com>
Subject: [PATCH v2] drm/bridge: dw-hdmi: Avoid including uapi headers
Date: Fri, 11 Apr 2025 19:59:37 +0800
Message-ID: <20250411115941.318558-1-andyshrk@163.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: PSgvCgDXnwMuBPlnWR0nAA--.27850S2
X-Coremail-Antispam: 1Uf129KBjvdXoWrKr15ZFy8WF1rur1xZF48Xrb_yoWftwb_C3
 WSvrW5JrWUCr1qyF17ZrsxZ3sF9a1UuFWxWFn5tr9xAF4kZr4YgwnrZFyUJwn8uF15KFZr
 Wa45WFW2vrnxWjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
 9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IU1_Ma5UUUUU==
X-Originating-IP: [58.22.7.114]
X-CM-SenderInfo: 5dqg52xkunqiywtou0bp/xtbBkAosXmf5AzIMjwACsG
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
Reviewed-by: Heiko Stuebner <heiko@sntech.de>

---

Changes in v2:
- Collect R-b from Heiko.

 drivers/gpu/drm/bridge/synopsys/dw-hdmi.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
index b1cdf806b3c40..deaba3b6f9978 100644
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
2.43.0

