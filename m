Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A8EA82A9D6
	for <lists+dri-devel@lfdr.de>; Thu, 11 Jan 2024 09:57:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF4E410E3AA;
	Thu, 11 Jan 2024 08:57:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m16.mail.163.com (m15.mail.163.com [45.254.50.220])
 by gabe.freedesktop.org (Postfix) with ESMTP id 56D5C10E3AA;
 Thu, 11 Jan 2024 08:57:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=From:Subject:Date:Message-Id; bh=yFj5GxwaCMUOxN9nS2
 xcQoPLil4M8eZJj9YIdaRGuhQ=; b=kw54TgAJaeOT+0u/arryUJUz8p/UVmcJNX
 OqTL1KCVNc5rkJn7oPbG7DkLf73N2tXjANkLathlyy4hwbDR+1pvEFOa4p7hXXSb
 h4LGi/0Rdbd/vZvMLnvRIKWJZj8oE40wP7zmBJTdjDvjG5wQACT1LwLyCR70BKN+
 8gXMXvxn8=
Received: from localhost.localdomain (unknown [182.148.14.173])
 by gzga-smtp-mta-g0-1 (Coremail) with SMTP id _____wDXfxFZrZ9lRZwTAA--.4717S2; 
 Thu, 11 Jan 2024 16:56:57 +0800 (CST)
From: GuoHua Chen <chenguohua_716@163.com>
To: daniel@ffwll.ch, Xinhui.Pan@amd.com, alexander.deucher@amd.com,
 airlied@gmail.com, christian.koenig@amd.com
Subject: [PATCH] drm/radeon: Clean up errors in evergreen_reg.h
Date: Thu, 11 Jan 2024 08:56:54 +0000
Message-Id: <20240111085654.12977-1-chenguohua_716@163.com>
X-Mailer: git-send-email 2.17.1
X-CM-TRANSID: _____wDXfxFZrZ9lRZwTAA--.4717S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7tFWruF1xCFyDJFW8GryfJFb_yoW8ZrWxp3
 yDWFyFqr4FyFZFkw4xA3W2gay3G342qFyxArWDZ3ZrZF4UXw1vvF1Y9rWfZFyDXF4Iya4f
 J3WDtwnrWF93A37anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07UFdgAUUUUU=
X-Originating-IP: [182.148.14.173]
X-CM-SenderInfo: xfkh0w5xrk3tbbxrlqqrwthudrp/xtbBEgxi1mVOBlCFFAAAsG
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
Cc: GuoHua Chen <chenguohua_716@163.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fix the following errors reported by checkpatch:

ERROR: space prohibited before that close parenthesis ')'
ERROR: need consistent spacing around '<<' (ctx:WxV)
ERROR: need consistent spacing around '-' (ctx:WxV)

Signed-off-by: GuoHua Chen <chenguohua_716@163.com>
---
 drivers/gpu/drm/radeon/evergreen_reg.h | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/radeon/evergreen_reg.h b/drivers/gpu/drm/radeon/evergreen_reg.h
index b436badf9efa..3ff9fda54aa3 100644
--- a/drivers/gpu/drm/radeon/evergreen_reg.h
+++ b/drivers/gpu/drm/radeon/evergreen_reg.h
@@ -265,8 +265,8 @@
 
 
 #define NI_DIG_BE_CNTL                    0x7140
-#       define NI_DIG_BE_CNTL_FE_SOURCE_SELECT(x)     (((x) >> 8 ) & 0x3F)
-#       define NI_DIG_FE_CNTL_MODE(x)                 (((x) >> 16) & 0x7 )
+#       define NI_DIG_BE_CNTL_FE_SOURCE_SELECT(x)     (((x) >> 8) & 0x3F)
+#       define NI_DIG_FE_CNTL_MODE(x)                 (((x) >> 16) & 0x7)
 
 #define NI_DIG_BE_EN_CNTL                              0x7144
 #       define NI_DIG_BE_EN_CNTL_ENABLE               (1 << 0)
@@ -284,7 +284,7 @@
 
 #define EVERGREEN_DP_VID_STREAM_CNTL                    0x730C
 #       define EVERGREEN_DP_VID_STREAM_CNTL_ENABLE     (1 << 0)
-#       define EVERGREEN_DP_VID_STREAM_STATUS          (1 <<16)
+#       define EVERGREEN_DP_VID_STREAM_STATUS          (1 << 16)
 #define EVERGREEN_DP_STEER_FIFO                         0x7310
 #       define EVERGREEN_DP_STEER_FIFO_RESET           (1 << 0)
 #define EVERGREEN_DP_SEC_CNTL                           0x7280
@@ -302,8 +302,8 @@
 #       define EVERGREEN_DP_SEC_SS_EN                   (1 << 28)
 
 /*DCIO_UNIPHY block*/
-#define NI_DCIO_UNIPHY0_UNIPHY_TX_CONTROL1            (0x6600  -0x6600)
-#define NI_DCIO_UNIPHY1_UNIPHY_TX_CONTROL1            (0x6640  -0x6600)
+#define NI_DCIO_UNIPHY0_UNIPHY_TX_CONTROL1            (0x6600 - 0x6600)
+#define NI_DCIO_UNIPHY1_UNIPHY_TX_CONTROL1            (0x6640 - 0x6600)
 #define NI_DCIO_UNIPHY2_UNIPHY_TX_CONTROL1            (0x6680 - 0x6600)
 #define NI_DCIO_UNIPHY3_UNIPHY_TX_CONTROL1            (0x66C0 - 0x6600)
 #define NI_DCIO_UNIPHY4_UNIPHY_TX_CONTROL1            (0x6700 - 0x6600)
-- 
2.17.1

