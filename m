Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 56ABCAD993E
	for <lists+dri-devel@lfdr.de>; Sat, 14 Jun 2025 02:51:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6514C10E80F;
	Sat, 14 Jun 2025 00:51:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="MqG6v7Yi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-f170.google.com (mail-yb1-f170.google.com
 [209.85.219.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD3E210E80F
 for <dri-devel@lists.freedesktop.org>; Sat, 14 Jun 2025 00:51:03 +0000 (UTC)
Received: by mail-yb1-f170.google.com with SMTP id
 3f1490d57ef6-e7db5c13088so2340297276.1
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Jun 2025 17:51:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1749862263; x=1750467063; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Q4BvcwXUpYpF53aglFHdWaMYuKTVfMzFy1gAx/zcHH8=;
 b=MqG6v7YilarZtBAB2w+58ekP0hxhqSJBY7GEs8Z50JHC2SlcZdhAuqcg2spJ+1JCb/
 nmP80mAcRiDzrH4zoC9Lr2IspokthiYvMqmAcxWW7Rb4YYtI/6J/ZZ3QrGrpomNk7q7a
 hjYGhV1CRknkJwvO3EeehlnIDnuzofACV0Bm8EpiLmzzFbm/4lTO7YQQuGOKGVCf4Alb
 QLz0VHJpHD4xLX92Ns9ElcCegHPzj0uvxllFiGZ5J8ThkGLGOs9OqdNvCdOaMyjU8bqK
 zxX0GVHAsNlBavJsTI2u9XczZ41ZzaLW3sbdjukgQO2p2w5mmkfpa98XMEKrp9sh8ugg
 nO3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749862263; x=1750467063;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Q4BvcwXUpYpF53aglFHdWaMYuKTVfMzFy1gAx/zcHH8=;
 b=AR9kGx5mNS8VZ61efV5POaTwWZS0fN+QNWZRawJaUtHePDzRUiXmRF+ETfvrgvGfn7
 j8KXQ/rIqcial/pLuQyb7qgAoutD01aF+2dTo2WxxbzaL1q4+mBw1qBaqndkjlp0POck
 beQ+KVW7OwdeNpA8c4u81VyPTN5hikUX+hcL5d3ATuyFbWUIileANvhs+SIZdaomyTCk
 YoIn6rJQyZxEUJsgbbv7eg94jQhRjOM1xA/KU4y9KbvVR8+53IqSuFEbZLnyI/Idjy50
 nMOLg9HNdP/X72iqGozipixTDXTbbqe1t88iwLRpBwPxwN1v8dWg9B5Ca0Mjg1ZuL8uN
 6/5w==
X-Forwarded-Encrypted: i=1;
 AJvYcCWPjKhdHi1nIvPItcQfSLzd/7jftdnpbVKQn3ZhdhsGfAZcUaLuhhWNkqTTWJX7ZfFEAB37HECOa/w=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzyNFMZp6++U/PtyXQ8PTYbXihFUxTozu2o+H81uNXnKebd7fTi
 Z1O8KKN6t33FVRI162YwJKOymJqnijxhlxU7FUr5mbZFXY2NhJv/IBK6ZPkaNGKc
X-Gm-Gg: ASbGncvHZp1bxDYy1bxV8WjOmvgZcmURyy6xqCCgPDg94z7hdKVKLVz59LGMB7AJz7X
 PlZtVovKIhlelgDwv0hhtsAFWAuyyT/GZKFr5VKtALsOeRrRLikcbrQZjYVkhScdyFJF5TRALTv
 9z70wAu4SbR5H+DpwbkfzoysG7rHWR3DOJpQChhplAEJWokrOmcqGKo4Xfkn4YJqWPVTh+NkMaH
 DHDlLvLv2gz9/U1UQ6nNt7lug50cngt7qPdI+mSt0K4nqmTv3C0BDu+84BDJJCcPWxQ4dn6Up9i
 t54iPE3uKSI+JojoH/2o+AMyl/qr5L4lXknoJCGfayfYdMk+Ax7vNvkGIYR2bz5jmI2Z6112gsr
 iXWajUxFuwng=
X-Google-Smtp-Source: AGHT+IESW6urO3WUlGFtx1OVEKIz7u5UMPmvMN/XKB+gqkytA6iQPBFo0Ygy9Q8aFIp9XHXF40d4YA==
X-Received: by 2002:a05:6902:2186:b0:e81:b5c8:3d71 with SMTP id
 3f1490d57ef6-e82281be2b4mr3513048276.17.1749862262905; 
 Fri, 13 Jun 2025 17:51:02 -0700 (PDT)
Received: from trojai4.cs.purdue.edu ([128.210.0.165])
 by smtp.gmail.com with ESMTPSA id
 3f1490d57ef6-e820e09b464sm1409902276.20.2025.06.13.17.51.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Jun 2025 17:51:02 -0700 (PDT)
From: Alex Guo <alexguo1023@gmail.com>
To: deller@gmx.de
Cc: alexguo1023@gmail.com, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH] fbdev: sstfb: Fix potential divide by zero
Date: Fri, 13 Jun 2025 20:50:59 -0400
Message-Id: <20250614005059.3108265-1-alexguo1023@gmail.com>
X-Mailer: git-send-email 2.34.1
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Variable var->pixclock can be set by user. In case it equals to
 zero, divide by zero would occur in sstfb_check_var. Similar
crashes have happened in other fbdev drivers. We fix this by
checking whether 'pixclock' is zero.

Signed-off-by: Alex Guo <alexguo1023@gmail.com>
---
 drivers/video/fbdev/sstfb.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/video/fbdev/sstfb.c b/drivers/video/fbdev/sstfb.c
index 2ea947f57efb..fd387ca8401b 100644
--- a/drivers/video/fbdev/sstfb.c
+++ b/drivers/video/fbdev/sstfb.c
@@ -359,7 +359,7 @@ static int sstfb_check_var(struct fb_var_screeninfo *var,
 	int tiles_in_X, real_length;
 	unsigned int freq;
 
-	if (sst_calc_pll(PICOS2KHZ(var->pixclock), &freq, &par->pll)) {
+	if (var->pixclock && sst_calc_pll(PICOS2KHZ(var->pixclock), &freq, &par->pll)) {
 		printk(KERN_ERR "sstfb: Pixclock at %ld KHZ out of range\n",
 				PICOS2KHZ(var->pixclock));
 		return -EINVAL;
-- 
2.34.1

