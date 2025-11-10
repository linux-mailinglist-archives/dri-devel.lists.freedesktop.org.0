Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 81E0BC489E8
	for <lists+dri-devel@lfdr.de>; Mon, 10 Nov 2025 19:43:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BED6510E073;
	Mon, 10 Nov 2025 18:43:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="IBcG7+Ek";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com
 [209.85.216.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9CEEE10E073
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Nov 2025 18:43:26 +0000 (UTC)
Received: by mail-pj1-f45.google.com with SMTP id
 98e67ed59e1d1-3437c093ef5so1670826a91.0
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Nov 2025 10:43:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1762800206; x=1763405006; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=qTyxgohfMyFm4qb2O3+6usfTAZwsXPA5PRmH04j0Qmo=;
 b=IBcG7+EkFMbDd0gppNbMC8/E5KEROm5I2pI75nTjadrOKS68AVIVjJb0omvcyAPyY4
 qa/PbvLezPh+4opsxGNAhFd9y72Vd8l8eFQefzFDLtvVbIDY3UPJemifiJ64Gg462zjW
 KJOJhvKbjWwqgLHKzHVtL0njTibA50tjjkwXihIpeXy/U+R6LF0eYxYGWkhn6T2ZnaHT
 bWNgP8lfJpqwWbDOhA2hS76j9znkidEotA9lvDWxTTDkxadgNrCdODs7qb0aeJ2fRbgC
 +k2QB09NrB57BH7mVgGCVGYH9x23XZwhCGF+TsPZ+TvdIwMh45sZdXZEsm1tuH0h/FjV
 Zxzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762800206; x=1763405006;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qTyxgohfMyFm4qb2O3+6usfTAZwsXPA5PRmH04j0Qmo=;
 b=w1uRcL99iif0M4QfQAS7z7lMbuLJ6RQPYtV7k+omOPsQO5u/XV8r1m/AGjr1w7qUnM
 YxKCWMBNqZx+JRMyvLleWf2mqAskWBPXlfzkbyUilU+RihXxO6ZDyU5KNXfR8N1RMUhe
 8MIrsLM69jFijoiITCBLcK2vh5ZiK6R+xN0mlzTgJBbgd9rN0HM0E6CvdbciHcdG6XbY
 xsb0tQ0GFwbUUzd0z2SEVYQvwmdw9bs6eJpgBgu/YCLWMDKD8BJmkOoBG8H9RCI+WBff
 tjxfBv2JrNRFcNGtTtwsOYglrPeNm+ZpelMVc4WrLjv28REMjKdNjyKPMI5GqsFX7qRk
 vuow==
X-Forwarded-Encrypted: i=1;
 AJvYcCVEL8cJPXKsYmC87VI5A1ZTS6Ax59qMT5T5fOQiUtExMUn0jEU1cRe5saR12Q27j7gp69d8JI9QTZo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzOSVTjlS6GR+2jLgBmgSXYCWXuBFxmmJWajHHzR9jeCclsignk
 J/OLx9LQDdy/R8DoC/RO/Oglinf+SHZu008+/KYL/sxGeoahtiudynSl
X-Gm-Gg: ASbGncsPnJbNh505zqbjxbrBpj7W7kaYDDO0KAF50GdPLrpXoyTGwuhlptUpsv/NG0m
 gl1AunHuJnde1XQ4rhluQf4so89FmoStqUfF+7tB1LV/p5shN7KCZe2EY+XlqvlU2NkgZSnoQJY
 xGqJoaN12ksjhPuno4q96tRP9aI/JpJP99Et/QjiNvzVjDBXQcmN6BC0LxyTzHWoITci+qFtmXi
 falnNUyNdQUAo/IyRmB04J7RO8cCzrejGARF5KtDDmaDtYF5l8hzwEZ0q/ss9tHwbrcKa5my8j4
 71KXza5PW+300Bth6KPUpWGQN07fcyQruupbv/CFzF7hCYGabSLHm7P/+7YHgx2Vld2s5wJbsG0
 XNQq6U34z7OwH2ZGtYQodvNU3gSKNJGupAtMuYZfeXCbtGJTQrElayRJ65mZV0xCxyyce+wq7MQ
 vwP5hOp+iDyG239z6Y
X-Google-Smtp-Source: AGHT+IF4fMPiC1+hZjj42Db+3of7c2CrTI3c2MCrSQNXvPFvgkM/x/aKN8kmrrpZocQqP6cAFKLHxw==
X-Received: by 2002:a17:90b:4a10:b0:340:9d52:44c1 with SMTP id
 98e67ed59e1d1-3436cd0bd74mr12391588a91.35.1762800206045; 
 Mon, 10 Nov 2025 10:43:26 -0800 (PST)
Received: from crl-3.node2.local ([125.63.65.162])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-343bf922ef8sm65515a91.0.2025.11.10.10.43.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Nov 2025 10:43:25 -0800 (PST)
From: Kriish Sharma <kriish.sharma2006@gmail.com>
To: lucas.demarchi@intel.com, thomas.hellstrom@linux.intel.com,
 rodrigo.vivi@intel.com, airlied@gmail.com, simona@ffwll.ch
Cc: intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Kriish Sharma <kriish.sharma2006@gmail.com>,
 kernel test robot <lkp@intel.com>
Subject: [PATCH] drm/xe: fix kernel-doc function name mismatch in xe_pm.c
Date: Mon, 10 Nov 2025 18:42:06 +0000
Message-Id: <20251110184206.2113830-1-kriish.sharma2006@gmail.com>
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

Documentation build reported:

   WARNING: ./drivers/gpu/drm/xe/xe_pm.c:131 expecting prototype for xe_pm_might_block_on_suspend(). Prototype was for xe_pm_block_on_suspend() instead

The kernel-doc comment for xe_pm_block_on_suspend() incorrectly used
the function name xe_pm_might_block_on_suspend(). Fix the header to
match the actual function prototype.

No functional changes.

Fixes: f73f6dd312a5 ("drm/xe/pm: Add lockdep annotation for the pm_block completion")
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202511061736.CiuroL7H-lkp@intel.com/
Signed-off-by: Kriish Sharma <kriish.sharma2006@gmail.com>
---
 drivers/gpu/drm/xe/xe_pm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
index 7b089e6fb63f..44924512830f 100644
--- a/drivers/gpu/drm/xe/xe_pm.c
+++ b/drivers/gpu/drm/xe/xe_pm.c
@@ -112,7 +112,7 @@ void xe_pm_might_block_on_suspend(void)
 }
 
 /**
- * xe_pm_might_block_on_suspend() - Block pending suspend.
+ * xe_pm_block_on_suspend() - Block pending suspend.
  * @xe: The xe device about to be suspended.
  *
  * Block if the pm notifier has start evicting bos, to avoid
-- 
2.34.1

