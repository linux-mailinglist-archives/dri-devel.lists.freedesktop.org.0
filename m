Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A8E434949D6
	for <lists+dri-devel@lfdr.de>; Thu, 20 Jan 2022 09:47:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D8B110E8E3;
	Thu, 20 Jan 2022 08:47:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A9F810E7F2;
 Wed, 19 Jan 2022 22:46:30 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id
 e9-20020a05600c4e4900b0034d23cae3f0so9011931wmq.2; 
 Wed, 19 Jan 2022 14:46:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=dozCW/4nG3udLwOhRUS1K5kLFfVXF4cNdQjF1vkmvlo=;
 b=eTuSHohyTQB9Bmao7dqcPpa5iKgzaCjRBmINJezn9uUIsQIY4xO+7pmWpTVF4wcLIG
 gJPXwv1OyMMCfBpUj3UrZY4ymzGYu8uV2D+/V4rKdRa1tf2kSDeSAPHIhrbq3GEkyV/7
 C3v8D1BvXLf9U8Y8NdhEF5iNRuFqvH1l5RVHHLHoyJgogkZtBpV9PDF6+AeUMZovg6/2
 ruYB4kiA9sXp+gcvkbgN4aAXJbtYldRjVg3Ajg9nVpI5yw2rPc0necow6Xz3WD5D9hXi
 /UoIXE4A+U9vwKr8XaOIB+wRLsKWr9PzhocGZQrqTgWc4YTeI1xNTRZn+Ie5sofugWDE
 GFpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=dozCW/4nG3udLwOhRUS1K5kLFfVXF4cNdQjF1vkmvlo=;
 b=V02HLcHMwW0z0IhQykYBKL4+/iV+YrhPsJVqRuL2MgyZwBlUJyBPIkaPLDRpxedDEt
 QmKDAqGrw+yAel3RIbwtfwXj96T/pxHl65sJU2b4dU1GAaYwzkQLg3WPRaeGJ8SvXGcW
 X1nzNFNuUJb/6fjxKYdrumHUgzRub/FpIaBGgReZDdWb5E3wmhTYjEMBq/sToHGRQ3yw
 VDvptw08oaWG269fbAc2RDyhCYfLLvv0riK/f2TmnCiqD0aneuarihMnhBoDJiZ+bNCB
 iSQhfn8usLr45qk9hibRAoYBUk8Eq5PVAZb55yPe9HwmqN2cKP4Mhht/3KgE5BS7+xDU
 CygQ==
X-Gm-Message-State: AOAM530CBOgwAktwmITVX/tswNmokcHlL8aAKevmxuZIUcm8NQAZpMMF
 tk4Z+Xbwtw+Fl1SSQ4bUStA=
X-Google-Smtp-Source: ABdhPJxOGEhjagNWyMQplUIULkMwQHFIt60zMdvuUb+Ib7Lu3QRBbFO1q1Qqx/xdRqaQeI+pXzRlvQ==
X-Received: by 2002:a1c:4d01:: with SMTP id o1mr4298033wmh.170.1642632389084; 
 Wed, 19 Jan 2022 14:46:29 -0800 (PST)
Received: from localhost (cpc154979-craw9-2-0-cust193.16-3.cable.virginm.net.
 [80.193.200.194])
 by smtp.gmail.com with ESMTPSA id t17sm1109531wrs.10.2022.01.19.14.46.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Jan 2022 14:46:28 -0800 (PST)
From: Colin Ian King <colin.i.king@gmail.com>
To: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Xinhui.Pan@amd.com, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/radeon: remove redundant assignment to reg
Date: Wed, 19 Jan 2022 22:46:28 +0000
Message-Id: <20220119224628.123084-1-colin.i.king@gmail.com>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Thu, 20 Jan 2022 08:47:25 +0000
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
Cc: llvm@lists.linux.dev, kernel-janitors@vger.kernel.org,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The pointer reg is being assigned a value that is not read, the
exit path via label 'out' never accesses it. The assignment is
redundant and can be removed.

Cleans up clang scan build warning:
drivers/gpu/drm/radeon/radeon_object.c:570:3: warning: Value
stored to 'reg' is never read [deadcode.DeadStores]

Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
---
 drivers/gpu/drm/radeon/radeon_object.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/radeon/radeon_object.c b/drivers/gpu/drm/radeon/radeon_object.c
index 56ede9d63b12..87536d205593 100644
--- a/drivers/gpu/drm/radeon/radeon_object.c
+++ b/drivers/gpu/drm/radeon/radeon_object.c
@@ -567,7 +567,6 @@ int radeon_bo_get_surface_reg(struct radeon_bo *bo)
 		return 0;
 
 	if (bo->surface_reg >= 0) {
-		reg = &rdev->surface_regs[bo->surface_reg];
 		i = bo->surface_reg;
 		goto out;
 	}
-- 
2.33.1

