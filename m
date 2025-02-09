Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 71571A2E1AB
	for <lists+dri-devel@lfdr.de>; Mon, 10 Feb 2025 00:53:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D2CB10E029;
	Sun,  9 Feb 2025 23:53:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="VZUtqn4g";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com
 [209.85.214.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F25A710E029
 for <dri-devel@lists.freedesktop.org>; Sun,  9 Feb 2025 23:53:04 +0000 (UTC)
Received: by mail-pl1-f178.google.com with SMTP id
 d9443c01a7336-21f710c17baso17288985ad.1
 for <dri-devel@lists.freedesktop.org>; Sun, 09 Feb 2025 15:53:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1739145184; x=1739749984; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:reply-to:message-id:date
 :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=dWCnWPYL68r0Z2Bnk7TaHU9Wrb4IP7n7TPpDNfmxihM=;
 b=VZUtqn4gB1df+/ig40JiAwleOU0uogmIDHY+w2syaTw8SGxg4Spwy4lMjWyTSQt1iO
 mRL1Dco9y4hdufaU840kGlzyeqaK47x3Zcm4EJlxvJrEMTs6AgWGwqMOzKKCUs0177sT
 9KrJbDvsXflTXxyKOG58hirIVbHdNZ4NVwOCSrS8uWJitcu/1YAMjSsbFILOwiyTULzO
 AMUfPWydFiJdCOMJMnse/1s6gfqLvH2xAwqv5k1Uy5Hn5tMBgX5J9sktlZBmsFgFGH9w
 qyM3qTRoNQLOz3hsTIBHOsT4Tvb8WyimqYzC2Y3jbnJexs7xKCVzefDnBkpu+PQSdJLb
 914w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739145184; x=1739749984;
 h=content-transfer-encoding:mime-version:reply-to:message-id:date
 :subject:cc:to:from:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=dWCnWPYL68r0Z2Bnk7TaHU9Wrb4IP7n7TPpDNfmxihM=;
 b=P8GuzAxMwtK0OUfOzLiCjBGUrRBlflP2FCp7Zdb2RlMzU1DHOgvYZLp41EiSSAUfue
 kubYjoI+0Oj2wUOzFQ7UYYgHj9wtEj6q+PAJQFIhtohaNjZcxHaaGf1rDRP3UPBK5Blg
 A4XJuGWeAkX4chPNzniCEJZtg4R3PCxxlOyLnybNFk+17iIzaQ9qLimWSA3XKCggbSTs
 D8OteAjgPh+lNOG6f3O+s6dejiQxqHH9Q8zKADLwq7aCCt7IbWepF/qRR9MsehetkkCz
 dWlCIWuSEgDBT4sNMjT3HNZ8KiKo1jCGRRLTVmqZfW29y/NaAf91G4pWoGuJicTHe8wA
 rkbg==
X-Gm-Message-State: AOJu0YwbAe3ArYVeFlfBi/PaA3P/SvCKnu4sof/WYY48TjaqIKIy0ePB
 2tb9B4OVn2ALdjMIpidWoSO38d20fRo6kcEKynQKUA0fAzWWpGjT
X-Gm-Gg: ASbGncvPFhE10W3fX9npswntLYkRhkFQyT9TCFOcCmXD7q3xNso3m5ZDu/kLjZUQHs1
 6KWsMhlX4ulUHbJArRVsoDdO3l0ZX3txzBiwU+jiULxyB4pb+w8K/s29GKqmrTdPh2j3L9XUH7x
 BGQSHkw0NZnN8zXC7qy4knTCCq11T76arO/yLGcXisSe1AMY1gksiQXXCzvm9zudidcl11d4QUa
 aEXLQ68jabBw2Ems6ZN7IhdQjxy9DiA6hoP2d0V7bF6GLO+arNi6SZxrfezF1ysyjBmxHCzndpn
 tBKnuCocc/mEn1JYAQgb4eMWfOxsV//OV9Y5c7tJPpFBp8LzfD5FN/oAyMsPs5kdH6upmg==
X-Google-Smtp-Source: AGHT+IE4FJPyNy5xGYQRplvww+BnPsgZJRqLjMHqBPSL43m6jWzmeKRSRadCcA59GdXx5pLc7fGXtA==
X-Received: by 2002:a17:903:3d05:b0:21f:3e2d:7d58 with SMTP id
 d9443c01a7336-21f4e6ba733mr154138565ad.13.1739145184345; 
 Sun, 09 Feb 2025 15:53:04 -0800 (PST)
Received: from localhost.localdomain (c-67-160-120-253.hsd1.wa.comcast.net.
 [67.160.120.253]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-21f3650e6aasm65021435ad.12.2025.02.09.15.53.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 09 Feb 2025 15:53:04 -0800 (PST)
From: mhkelley58@gmail.com
X-Google-Original-From: mhklinux@outlook.com
To: haiyangz@microsoft.com, wei.liu@kernel.org, decui@microsoft.com,
 deller@gmx.de, weh@microsoft.com
Cc: dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-hyperv@vger.kernel.org
Subject: [PATCH 1/1] fbdev: hyperv_fb: iounmap() the correct memory when
 removing a device
Date: Sun,  9 Feb 2025 15:52:52 -0800
Message-Id: <20250209235252.2987-1-mhklinux@outlook.com>
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
Reply-To: mhklinux@outlook.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Michael Kelley <mhklinux@outlook.com>

When a Hyper-V framebuffer device is removed, or the driver is unbound
from a device, any allocated and/or mapped memory must be released. In
particular, MMIO address space that was mapped to the framebuffer must
be unmapped. Current code unmaps the wrong address, resulting in an
error like:

[ 4093.980597] iounmap: bad address 00000000c936c05c

followed by a stack dump.

Commit d21987d709e8 ("video: hyperv: hyperv_fb: Support deferred IO for
Hyper-V frame buffer driver") changed the kind of address stored in
info->screen_base, and the iounmap() call in hvfb_putmem() was not
updated accordingly.

Fix this by updating hvfb_putmem() to unmap the correct address.

Fixes: d21987d709e8 ("video: hyperv: hyperv_fb: Support deferred IO for Hyper-V frame buffer driver")
Signed-off-by: Michael Kelley <mhklinux@outlook.com>
---
 drivers/video/fbdev/hyperv_fb.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/video/fbdev/hyperv_fb.c b/drivers/video/fbdev/hyperv_fb.c
index 7fdb5edd7e2e..363e4ccfcdb7 100644
--- a/drivers/video/fbdev/hyperv_fb.c
+++ b/drivers/video/fbdev/hyperv_fb.c
@@ -1080,7 +1080,7 @@ static void hvfb_putmem(struct hv_device *hdev, struct fb_info *info)
 
 	if (par->need_docopy) {
 		vfree(par->dio_vp);
-		iounmap(info->screen_base);
+		iounmap(par->mmio_vp);
 		vmbus_free_mmio(par->mem->start, screen_fb_size);
 	} else {
 		hvfb_release_phymem(hdev, info->fix.smem_start,
-- 
2.25.1

