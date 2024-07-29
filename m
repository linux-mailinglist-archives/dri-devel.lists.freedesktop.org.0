Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D287193EE36
	for <lists+dri-devel@lfdr.de>; Mon, 29 Jul 2024 09:14:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C31F910E011;
	Mon, 29 Jul 2024 07:14:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=163.com header.i=@163.com header.b="Y2lGS09b";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 940 seconds by postgrey-1.36 at gabe;
 Mon, 29 Jul 2024 07:14:40 UTC
Received: from m15.mail.163.com (m15.mail.163.com [45.254.50.219])
 by gabe.freedesktop.org (Postfix) with ESMTP id 1922E10E011
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Jul 2024 07:14:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=qMnAg
 qz5utWZu6iGhNxZV1JaRMw2eNLw6IaRXRPszgk=; b=Y2lGS09bGUNCXBd5EvKXD
 PnLX9Vz2A0zg4U6lEfrMGLubHwD17OK+6Z5UlZuHIzyGIw6ZggYIVk9M68kVEMS4
 pIUZOX/BI8GDGo6ewgQL7b785CP+mq6Hyt106ONlHDK3zWYbvjoQ6IoTbOlbJ42F
 VqsrIJLFuQai9H1VK1qrJw=
Received: from localhost.localdomain (unknown [111.48.69.247])
 by gzga-smtp-mta-g0-0 (Coremail) with SMTP id _____wD3X051Padm2W56Ew--.54492S2;
 Mon, 29 Jul 2024 14:57:58 +0800 (CST)
From: oushixiong1025@163.com
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Shixiong Ou <oushixiong@kylinos.cn>
Subject: [PATCH] drm: Add the missing symbol '.'
Date: Mon, 29 Jul 2024 14:57:56 +0800
Message-Id: <20240729065756.123788-1-oushixiong1025@163.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wD3X051Padm2W56Ew--.54492S2
X-Coremail-Antispam: 1Uf129KBjvdXoWrZFW3uw4UJr1kAry8Gw13CFg_yoWfXrX_u3
 W7WwsrJrZrA3sFvFnIvanFqF9Fka4Y9F48Gw4vga4ftw12yw13JF4qgrsavr1DGw48AF98
 tanrXr17ZFnrujkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
 9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IU8dOz7UUUUU==
X-Originating-IP: [111.48.69.247]
X-CM-SenderInfo: xrxvxxx0lr0wirqskqqrwthudrp/1tbiXRorD2XAmeWNiwAAs8
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

From: Shixiong Ou <oushixiong@kylinos.cn>

Signed-off-by: Shixiong Ou <oushixiong@kylinos.cn>
---
 drivers/gpu/drm/drm_probe_helper.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_probe_helper.c b/drivers/gpu/drm/drm_probe_helper.c
index bb49d552e671..285290067056 100644
--- a/drivers/gpu/drm/drm_probe_helper.c
+++ b/drivers/gpu/drm/drm_probe_helper.c
@@ -888,7 +888,7 @@ EXPORT_SYMBOL(drm_kms_helper_is_poll_worker);
  * disabled. Polling is re-enabled by calling drm_kms_helper_poll_enable().
  *
  * If however, the polling was never initialized, this call will trigger a
- * warning and return
+ * warning and return.
  *
  * Note that calls to enable and disable polling must be strictly ordered, which
  * is automatically the case when they're only call from suspend/resume
-- 
2.25.1

