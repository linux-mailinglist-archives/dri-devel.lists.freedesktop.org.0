Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DC33727FB54
	for <lists+dri-devel@lfdr.de>; Thu,  1 Oct 2020 10:17:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 780456E864;
	Thu,  1 Oct 2020 08:17:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x743.google.com (mail-qk1-x743.google.com
 [IPv6:2607:f8b0:4864:20::743])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B3F426E83E
 for <dri-devel@lists.freedesktop.org>; Thu,  1 Oct 2020 00:28:54 +0000 (UTC)
Received: by mail-qk1-x743.google.com with SMTP id f142so3567535qke.13
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Sep 2020 17:28:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=marek-ca.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=EHwLeNxlSJ3EARNPo85Hd8uD6D75QyiXLjXUxQ3hUGI=;
 b=h2x0wFzInna9YMHm6P0E45wxhWqOBWVDm/5zBlqYzYT4O+zpDSeC9+usBXBspL62HD
 Wfv7Ck+wGjMx4j8GuFzu9r3pWufd0nNC8QO9JoPCAXUIGkKOGKngUH46ySm8X9sKqB8a
 816F5UVIAD0BKewbdsOW0CInM2tocN4lJ47jE0QBX3SYgFPMKuyV1vMWLYj4KvdohZ6r
 UbfqiADYWHyGsRN8OTHzlsfdwVOdG1jq89HRP6bhewKbDdRqXQqdQpGmCwsLdyghD/gJ
 OuXfQgly0EIrIvfxvBZytgDWZMavQ3L9n3Pq/itHqczsZpsu0mHS4Zvl2+PrEfZv9GV7
 Y38A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=EHwLeNxlSJ3EARNPo85Hd8uD6D75QyiXLjXUxQ3hUGI=;
 b=oVYtOiJc1yUtWTv/Ummkb0TdgWBqxFj5+nMYxzSCmX5JvvqFqFd8pksI0YcatR95JZ
 VE8MKMV5zPgGoGWk8ILDOjkn+jVD9YcUUUbku8XxNetBHZh2a+BkHXzGqjvPEXGhOO6y
 UrgMfEo/y09TgNI+sjKDHitzeoR/FKiUzIL1jsvpDAx0+8nnUjD/MjVxO4sPbPEaZjKP
 Wx9FjItNWkj0siVH2wTIbMQ1eLOriTL4ez6lsjk/QQXIh/J0dItToMYAUm0bqo1cauYX
 7JcZPU+AXhHNYZevv31psW3NOx2XYy+2tWTwRLNybl/LmERw2NJprFlf7tczYxMFNMJk
 ntJA==
X-Gm-Message-State: AOAM530048SG8yjoWOkTEaoDBlRlgvrqCiCTK6IzZao1h8hqK6r+DBjK
 RSjgyFyInknUYEh8tC9iWgk6Aw==
X-Google-Smtp-Source: ABdhPJzLw800gfk1oonIT2sRo5VEKRKUttkzTSShle7j0kaa4WtY3ECvUdcXfd6YrGcyNPASiRd03Q==
X-Received: by 2002:a37:952:: with SMTP id 79mr5223335qkj.57.1601512133978;
 Wed, 30 Sep 2020 17:28:53 -0700 (PDT)
Received: from localhost.localdomain ([147.253.86.153])
 by smtp.gmail.com with ESMTPSA id 205sm3850908qki.118.2020.09.30.17.28.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Sep 2020 17:28:53 -0700 (PDT)
From: Jonathan Marek <jonathan@marek.ca>
To: freedreno@lists.freedesktop.org
Subject: [PATCH 3/3] drm/msm: bump up the uapi version
Date: Wed, 30 Sep 2020 20:27:06 -0400
Message-Id: <20201001002709.21361-4-jonathan@marek.ca>
X-Mailer: git-send-email 2.26.1
In-Reply-To: <20201001002709.21361-1-jonathan@marek.ca>
References: <20201001002709.21361-1-jonathan@marek.ca>
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 01 Oct 2020 08:15:43 +0000
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
Cc: David Airlie <airlied@linux.ie>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <dri-devel@lists.freedesktop.org>,
 Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Increase the minor version to indicate the presence of new features.

Signed-off-by: Jonathan Marek <jonathan@marek.ca>
---
 drivers/gpu/drm/msm/msm_drv.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
index 305db1db1064..502aafe7d1e6 100644
--- a/drivers/gpu/drm/msm/msm_drv.c
+++ b/drivers/gpu/drm/msm/msm_drv.c
@@ -38,9 +38,10 @@
  *           GEM object's debug name
  * - 1.5.0 - Add SUBMITQUERY_QUERY ioctl
  * - 1.6.0 - Syncobj support
+ * - 1.7.0 - MSM_BO_CACHED_COHERENT and DRM_IOCTL_MSM_GEM_SYNC_CACHE
  */
 #define MSM_VERSION_MAJOR	1
-#define MSM_VERSION_MINOR	6
+#define MSM_VERSION_MINOR	7
 #define MSM_VERSION_PATCHLEVEL	0
 
 static const struct drm_mode_config_funcs mode_config_funcs = {
-- 
2.26.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
