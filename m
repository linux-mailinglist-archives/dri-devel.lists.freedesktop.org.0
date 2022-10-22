Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 169956084EA
	for <lists+dri-devel@lfdr.de>; Sat, 22 Oct 2022 08:06:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 682DF10E013;
	Sat, 22 Oct 2022 06:05:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bg4.exmail.qq.com (bg4.exmail.qq.com [43.155.65.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF3CA10E013;
 Sat, 22 Oct 2022 06:05:48 +0000 (UTC)
X-QQ-mid: bizesmtp82t1666418665tjb23529
Received: from localhost.localdomain ( [182.148.15.254])
 by bizesmtp.qq.com (ESMTP) with 
 id ; Sat, 22 Oct 2022 14:04:23 +0800 (CST)
X-QQ-SSF: 01000000000000C0E000000A0000000
X-QQ-FEAT: 83ShfzFP0oApFjXZWh6Y6La/aRvAwxua0Tpqn8jzPPYTX0L7/oa19+NgcY7Qf
 KOa2nDJGUPCsPhWk9XSa92bJNZSuFgWKhPctmcgn0z+PMjz8CiF+AmVehUwlFHiX835Dq8A
 0dZ9DJazxcGVKzXYGOiNUwUx9Qytw/nqLVehwSIp59JbOo9/ZV989EIYZp56fcjk/wT5BQB
 cqk9FgxJ4ZyUYs9/R3LwU9dHkVqK52xazSQRbJ9VKA1hA/YkpRYLqnRhEwpCCFWGcm3+VDa
 hPgokJteOVbLfPTDQsUf6N2g6sDw5WoAznB1N5tft7Cq5KmoThvM5EQ5KGMKa3tzvKqm0bU
 tqW8LMfpejQIeg4BQUZJ6aARKZx9y0c/92xM5Oh6VSfm9ZpFrg=
X-QQ-GoodBg: 0
From: wangjianli <wangjianli@cdjrlc.com>
To: alexander.deucher@amd.com, christian.koenig@amd.com, Xinhui.Pan@amd.com,
 airlied@linux.ie, daniel@ffwll.ch
Subject: [PATCH] drm/radeon: fix repeated words in comments
Date: Sat, 22 Oct 2022 14:04:17 +0800
Message-Id: <20221022060417.55166-1-wangjianli@cdjrlc.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:cdjrlc.com:qybglogicsvr:qybglogicsvr7
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
Cc: wangjianli <wangjianli@cdjrlc.com>, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Delete the redundant word 'the'.

Signed-off-by: wangjianli <wangjianli@cdjrlc.com>
---
 drivers/gpu/drm/radeon/radeon_device.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/radeon/radeon_device.c b/drivers/gpu/drm/radeon/radeon_device.c
index 15692cb241fc..ff52b5f4c1e6 100644
--- a/drivers/gpu/drm/radeon/radeon_device.c
+++ b/drivers/gpu/drm/radeon/radeon_device.c
@@ -1206,7 +1206,7 @@ static void radeon_check_arguments(struct radeon_device *rdev)
  * @pdev: pci dev pointer
  * @state: vga_switcheroo state
  *
- * Callback for the switcheroo driver.  Suspends or resumes the
+ * Callback for the switcheroo driver.  Suspends or resumes
  * the asics before or after it is powered up using ACPI methods.
  */
 static void radeon_switcheroo_set_state(struct pci_dev *pdev, enum vga_switcheroo_state state)
-- 
2.36.1

