Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2543044C0BC
	for <lists+dri-devel@lfdr.de>; Wed, 10 Nov 2021 13:05:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 70A346E0D4;
	Wed, 10 Nov 2021 12:05:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com
 [IPv6:2607:f8b0:4864:20::634])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 194AE6E086;
 Wed, 10 Nov 2021 12:05:20 +0000 (UTC)
Received: by mail-pl1-x634.google.com with SMTP id u17so2777362plg.9;
 Wed, 10 Nov 2021 04:05:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=SmZpl8+j/iKc0sB5URMOhtFVFzKAZretNZR5phX8V54=;
 b=AaiaX03JzpUeQ855h1+dV9l4+ukSmXVfDTYDUIvRLiaosXsME3ilMxt6JVmhe3eg0D
 hEI8vZ/w0nFcav9KXmHFLiYPNUYV9Iq790h1ZUCk3NxUlH46TZhg9ttbXmTf9XQmlYya
 BKo3z3+De7+ajAo6ETVtdZjNKkdFyOauMMbR/stun+H8uoTsNuTF9JdnQG/2XrQ0wblS
 nvpjiL0Pbcbpw5iuPJFkMcBYjSRXGXqj/gV7LZO+Xe31ATHqy8NYxRjGo14yRul/841d
 dPgJWb1g9WtsHZyDJff21j+hMeiOrF77u40X6gZQpYjiZ4BKiva4FqCa4QEwFIfdmzw6
 80jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=SmZpl8+j/iKc0sB5URMOhtFVFzKAZretNZR5phX8V54=;
 b=qv/TauvlHwQVXpdYbOvS6JH2CzAJ+9Vf/nHDJncJnWE0pjiUmnyAZ+Vux9SnVcsJTh
 SF0xYHVOfPR7INOl23HxagBj0rwRaqTidq/fs8Kv0E2Ovmwj7GT65sXDl4/t3T93q728
 0ENGUb/aeOfbWIxWAW3pxI2+ZUsYzwaqXE3RYvx2Yd29YFPHh++jmOEwC+Ixc0wFIY54
 rnZeWvpxClIDiV8szTvhfNwZ/Fh9X/U/WpsvKdseI93h6MwSfD5RcBysaOuopuysq/FF
 ar5cf0hWo49UWClqlgvooZ2g6kf6Vxwp6iPivXwbda/T0DEDqHXEU97Ay1oAAGRfCu09
 Rikg==
X-Gm-Message-State: AOAM532bPmp+DACBW87Xp+DXaGj6dODMTKQo18dcS4IV/BOTI8/KawbI
 OfoHbTFCxnhRs8JchlGZHxU=
X-Google-Smtp-Source: ABdhPJxp1tSXAzZDWhWtzwlC+WpFHm5YVQ6u/yn2MK4ACIYuoQeY9VzDPTcS+qoyy0lkfOpDtimAVA==
X-Received: by 2002:a17:902:e294:b0:143:86a8:c56d with SMTP id
 o20-20020a170902e29400b0014386a8c56dmr2079842plc.22.1636545919705; 
 Wed, 10 Nov 2021 04:05:19 -0800 (PST)
Received: from localhost.localdomain ([193.203.214.57])
 by smtp.gmail.com with ESMTPSA id on6sm7070697pjb.47.2021.11.10.04.05.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Nov 2021 04:05:19 -0800 (PST)
From: cgel.zte@gmail.com
X-Google-Original-From: deng.changcheng@zte.com.cn
To: robdclark@gmail.com
Subject: [PATCH linux-next] drm/msm/dp: remove unneeded variable
Date: Wed, 10 Nov 2021 12:05:12 +0000
Message-Id: <20211110120512.150940-1-deng.changcheng@zte.com.cn>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
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
Cc: freedreno@lists.freedesktop.org, airlied@linux.ie,
 linux-arm-msm@vger.kernel.org, Zeal Robot <zealci@zte.com.cn>,
 deng.changcheng@zte.com.cn, abhinavk@codeaurora.org, swboyd@chromium.org,
 dri-devel@lists.freedesktop.org, sean@poorly.run, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Changcheng Deng <deng.changcheng@zte.com.cn>

Fix the following coccicheck review:
./drivers/gpu/drm/msm/dp/dp_debug.c: Unneeded variable

Remove unneeded variable used to store return value.

Reported-by: Zeal Robot <zealci@zte.com.cn>
Signed-off-by: Changcheng Deng <deng.changcheng@zte.com.cn>
---
 drivers/gpu/drm/msm/dp/dp_debug.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_debug.c b/drivers/gpu/drm/msm/dp/dp_debug.c
index 2f6247e80e9d..c5c75273d1e5 100644
--- a/drivers/gpu/drm/msm/dp/dp_debug.c
+++ b/drivers/gpu/drm/msm/dp/dp_debug.c
@@ -365,7 +365,6 @@ static const struct file_operations test_active_fops = {
 
 static int dp_debug_init(struct dp_debug *dp_debug, struct drm_minor *minor)
 {
-	int rc = 0;
 	struct dp_debug_private *debug = container_of(dp_debug,
 			struct dp_debug_private, dp_debug);
 
@@ -386,7 +385,7 @@ static int dp_debug_init(struct dp_debug *dp_debug, struct drm_minor *minor)
 
 	debug->root = minor->debugfs_root;
 
-	return rc;
+	return 0;
 }
 
 struct dp_debug *dp_debug_get(struct device *dev, struct dp_panel *panel,
-- 
2.25.1

