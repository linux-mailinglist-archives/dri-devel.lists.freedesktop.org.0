Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CE1FADF6E0
	for <lists+dri-devel@lfdr.de>; Wed, 18 Jun 2025 21:29:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C3B710E6E2;
	Wed, 18 Jun 2025 19:29:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=broadcom.com header.i=@broadcom.com header.b="JXLA5NTL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com
 [209.85.215.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4423410E6E2
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Jun 2025 19:29:34 +0000 (UTC)
Received: by mail-pg1-f170.google.com with SMTP id
 41be03b00d2f7-b1fd59851baso52792a12.0
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Jun 2025 12:29:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=broadcom.com; s=google; t=1750274973; x=1750879773;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=F8+TZfmF3MLk4xE+85WYNr1ilSLO44mBRcYRUA2SMdE=;
 b=JXLA5NTLYH6PYUftd7tL7u4tcmjszWuuwzbJKnUqko7ovxpUSUeYMbw4h/srprWHAr
 pCBN1t8Mgv9hEXRTGhQbsnE74mVQUWOcDJ2/zwsw04W2dUgLW1zkOcesWAn+YYCVsMZe
 VKUyGi2z1ti1zTIo0N36w0nz0GzetY2s0vwys=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1750274973; x=1750879773;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=F8+TZfmF3MLk4xE+85WYNr1ilSLO44mBRcYRUA2SMdE=;
 b=uLDfbQxNYAZsYTv3vSmssajjVJyJ5rHETbOPoPSxWlXBaqrOSJB0VhnR8DCRQot5R2
 U1/uLh4RsTAD625ITQhqWdzjBn+Y8j32nkuYVbaUoSiZReykIsZQDr8hDm7cGysn0QyV
 udj6w/UDs37g051ExOQQAWWFhYprkXHU4tfJf645oQmG0JT4NfLiVJezPXyzt1FAGpdk
 tbNYw8VEh/5OYNnjIcE3+SiNl2DCaPJ4TcFoPb1SVGzgsNIQHTuOhYz6hRZebg/WgNcv
 GKgPTyjfHb2cvxKB3Szsoo3jJX2qpbSJp4kBwiEVgEXE0Bkd6W8TbAyUgOCJNTk/3OuP
 z07w==
X-Gm-Message-State: AOJu0YyGpoVEO71X9xPr+oz+4Vz7Q2n5/m1nBv+QFz+15emmxOzyo9GQ
 q/EvsRh/3ywxQN+plJ3pB80XL8EfZIncFC+spfhJ9Lb31o7j2BlaO1YCyveO5HZ/Waqu/VRy1QS
 NYjv88lsfUj9o2IrxNDm53z4mli7AQpMMndk+pn/3mYuf4O4E7MlIwSivSUXXveECfJGXfd8vPa
 zXNg/rmnfOzCLvYcWvkmZSmnWpLur9L4fpnXU4I+qmtT9utat+6BqphA==
X-Gm-Gg: ASbGnctDrGB0wUp6BDPDk3vsflwyBwbpEO91DPWogpVgbrsud8v5yn/YIMuXjD22LUU
 84qw1JfUvD5+SYMqdPyRkn6SV9aRHj0VNwQ7JzqJlFiNt7qyzVPhlHphar7Xzo7VFAHZiKZxrgl
 LnGZbvnQe7V2MbmXl9iqYTqYx0ZvuWspE7tYIYVD54GM9IN+n0yX/lop83CduDkm97hlBXLKv5e
 kne1hjUTqPwb7s/d+DJrUjqyll6g09JGrUreLDHLY4E+LnnX4qO5mNerUa5Wrvp6xpVJxEP+7QK
 EBobYCWNp8g/dcCz8fX99eygIuruKvpT7ppn9ZWv9mcMSJBjHoW7qgWMkIaeiJEvOhZMfA5nPz1
 90to0X9qs3kvTAjuwxziaKEvaaPc=
X-Google-Smtp-Source: AGHT+IEemXY9lgPJEGcgUMUbG4MenbkaeF3LFGibrarvQsRmFlD2WLnpskK4KRqGLBUdq8hkOorarQ==
X-Received: by 2002:a05:6a21:338c:b0:21e:7d1b:4401 with SMTP id
 adf61e73a8af0-21fbd55a0e2mr28926494637.22.1750274973514; 
 Wed, 18 Jun 2025 12:29:33 -0700 (PDT)
Received: from localhost.localdomain ([192.19.144.250])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-748900cec72sm11451139b3a.150.2025.06.18.12.29.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Jun 2025 12:29:33 -0700 (PDT)
From: Zack Rusin <zack.rusin@broadcom.com>
To: dri-devel@lists.freedesktop.org
Cc: Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, ian.forbes@broadcom.com,
 martin.krastev@broadcom.com, maaz.mombasawala@broadcom.com,
 Marko Kiiskila <marko.kiiskila@broadcom.com>,
 Zack Rusin <zack.rusin@broadcom.com>,
 "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>,
 Ingo Molnar <mingo@kernel.org>, Andrew Morton <akpm@linux-foundation.org>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Peter Zijlstra <peterz@infradead.org>, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] drm/vmwgfx: Fix guests running with TDX/SEV
Date: Wed, 18 Jun 2025 15:29:26 -0400
Message-ID: <20250618192926.1092450-1-zack.rusin@broadcom.com>
X-Mailer: git-send-email 2.48.1
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

From: Marko Kiiskila <marko.kiiskila@broadcom.com>

Commit 81256a50aa0f ("x86/mm: Make memremap(MEMREMAP_WB) map memory as
encrypted by default") changed the default behavior of
memremap(MEMREMAP_WB) and started mapping memory as encrypted.
The driver requires the fifo memory to be decrypted to communicate with
the host but was relaying on the old default behavior of
memremap(MEMREMAP_WB) and thus broke.

Fix it by explicitly specifying the desired behavior and passing
MEMREMAP_DEC to memremap.

Fixes: 81256a50aa0f ("x86/mm: Make memremap(MEMREMAP_WB) map memory as encrypted by default")
Signed-off-by: Marko Kiiskila <marko.kiiskila@broadcom.com>
Signed-off-by: Zack Rusin <zack.rusin@broadcom.com>
Cc: Kirill A. Shutemov <kirill.shutemov@linux.intel.com>
Cc: Ingo Molnar <mingo@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: Dave Hansen <dave.hansen@linux.intel.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Peter Zijlstra <peterz@infradead.org>
Cc: linux-mm@kvack.org
Cc: linux-kernel@vger.kernel.org
---
 drivers/gpu/drm/vmwgfx/vmwgfx_drv.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c
index bc0342c58b4b..8ff958d119be 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c
@@ -750,7 +750,7 @@ static int vmw_setup_pci_resources(struct vmw_private *dev,
 		dev->fifo_mem = devm_memremap(dev->drm.dev,
 					      fifo_start,
 					      fifo_size,
-					      MEMREMAP_WB);
+					      MEMREMAP_WB | MEMREMAP_DEC);
 
 		if (IS_ERR(dev->fifo_mem)) {
 			drm_err(&dev->drm,
-- 
2.48.1

