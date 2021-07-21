Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B0B83D1995
	for <lists+dri-devel@lfdr.de>; Thu, 22 Jul 2021 00:12:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F0D786E8EF;
	Wed, 21 Jul 2021 22:12:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-relay-canonical-0.canonical.com
 (smtp-relay-canonical-0.canonical.com [185.125.188.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD8926E8D4
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Jul 2021 22:12:02 +0000 (UTC)
Received: from localhost (cpc154979-craw9-2-0-cust193.16-3.cable.virginm.net
 [80.193.200.194])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by smtp-relay-canonical-0.canonical.com (Postfix) with ESMTPSA id 0FE4A3F235; 
 Wed, 21 Jul 2021 22:11:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1626905521;
 bh=J0x7Mk1L5wZTTEhmdsCR4xaxJH/q6r74SfQ+T3WO81M=;
 h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type;
 b=F6JXIqyfwgCM+QUxviWiUftXatS9E5+eLjw7iO0ub1ji0ezhfiSrm/+fL3OmjxjSE
 vyEfMYJhtGrNJysNmegfjHqnvckALkM6ag2h0aLI0CjJFiRd36oLI4mJ9C4QlFb996
 +8kIO/BsfR7N+mbTmoOoVRuBCuLQTv2eNFE0SeyXMCcEK6BwkN9V3jXL6RfPjLtnXt
 nZgb7r3MLubAJu3kX5JYA+VX6xsMhnt5DsftPh3j8AWsYY2ZLx7MJaYwiQ3oXIP15j
 UdFubKABTdh8XFwCJxDW/5xHmHyVHKF1A7BpmBkJWLlJVuG0xCvqKx8YfAd2w3pThw
 c56ujzTWR35ow==
From: Colin King <colin.king@canonical.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org
Subject: [PATCH][next] drm: Fix space indentations, replace with tabs
Date: Wed, 21 Jul 2021 23:11:48 +0100
Message-Id: <20210721221148.18127-1-colin.king@canonical.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
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
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Colin Ian King <colin.king@canonical.com>

A couple of statements are indented with spaces, clean this up
by replacing spaces with tabs.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/gpu/drm/drm_ioctl.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/drm_ioctl.c b/drivers/gpu/drm/drm_ioctl.c
index f454e0424086..c023da67ca7a 100644
--- a/drivers/gpu/drm/drm_ioctl.c
+++ b/drivers/gpu/drm/drm_ioctl.c
@@ -834,8 +834,8 @@ long drm_ioctl(struct file *filp,
 	if (drm_dev_is_unplugged(dev))
 		return -ENODEV;
 
-       if (DRM_IOCTL_TYPE(cmd) != DRM_IOCTL_BASE)
-               return -ENOTTY;
+	if (DRM_IOCTL_TYPE(cmd) != DRM_IOCTL_BASE)
+		return -ENOTTY;
 
 	is_driver_ioctl = nr >= DRM_COMMAND_BASE && nr < DRM_COMMAND_END;
 
-- 
2.31.1

