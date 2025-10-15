Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 66011BE03D2
	for <lists+dri-devel@lfdr.de>; Wed, 15 Oct 2025 20:46:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D5B1310E8BB;
	Wed, 15 Oct 2025 18:46:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="B+w6hops";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com
 [209.85.216.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5414F10E7FD
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Oct 2025 14:08:59 +0000 (UTC)
Received: by mail-pj1-f45.google.com with SMTP id
 98e67ed59e1d1-339e71ccf48so9240718a91.3
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Oct 2025 07:08:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1760537339; x=1761142139; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=BDEVuh4N5QxnjfWl9GfHaiYC0Bn0qUwYZnFQleExTuc=;
 b=B+w6hops3YF05AG5r3tp+77eTpOdIcBir2YVZbqgGvYWHlOW5eAysKQDiPi/Pq5n/N
 bTCwSXsgvpBJHDrA8sJjEwyHhHtBmPP0EMywFKcU2vTaBKl83jT8KYr5I78L3bVZsus2
 fhcCp1Y9qY5zSZOv0I4chN5iUHFC7XcVc0zko+JrvC9XCwmy9WLycWAdEJcvg45E8XEh
 ZI+x+8rtk6F9by+26VCoKcskc6AAzwqarl8+xdsYHZ7TqbCx49F10cdzaXVZiUfGlHF7
 t8HHD218GPTFnuEAESnwBG68poghxKyxDeDs1nGnF6rDq9p+lnlARncVC1lNtExz3Kf/
 24ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760537339; x=1761142139;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=BDEVuh4N5QxnjfWl9GfHaiYC0Bn0qUwYZnFQleExTuc=;
 b=pBnqVSJJQRAGbEsxvvR/OiM2nklPSFPuernfwDoKHNtMW7YYfnTqWwKnYHWBUJ7tx6
 gmNWru1G4zVIw0E2hKdL/2BX63d0BnIq64ZgIK5+avjUWz3Tq1ExZIiZvTYaEl4YzpwM
 5sQpD1l8VU306oeHrurb9W+LxHhRSTNuWfK5f+UrEzIIQN4SFHRAVrz3Yg1RsBNXyS0F
 5P0PzUnccAEo9bcjx9w6cC+xWsO/wVH035f3t/Jc6PrDGeOxvLEpHkGzT0EUplHvAEN1
 d/SzUEE72wzlj/JkFoVb7sH72Ncc1xNZ/a0/ZiN3wz191d7cC+CKcbBcNO/QuFRdD9HQ
 tQqQ==
X-Gm-Message-State: AOJu0YyMqjGcp9D+YkVyh0Bx8ugz1P/TH9SKklxzRguIH2v+VkOtLvOC
 Mnc/Eb34g8QvFZBvsMkkYOxV0VMvmDsVdQ1nXzvJYeRT91godDL4f+i8tSVw5A==
X-Gm-Gg: ASbGnct3lCH2XmI3pW9r38AbGSfcfIPhEAk5Mpiyqina0v2TaiorfVuvb6UCHF+k0La
 AOU4xP2VWdfZyGXzL+3wDbZ20URW9lPZ/GuXbHNTRjVTvhlu2SnntC53s4eU++9cRQfRBXhBmdJ
 nEPN8NBPKgB8jSqh0zdx2XMFJi8sNKwuj/N8m4PcNb2h/eiZVpdcQ5voJZWC2TcrYOi9yTx5kta
 ySG2ISQjcdH3VixtSVw1Yo1wgsRqG+BfeZ7VN9pgajDo6hezowl8dCNn/XX66SA3zdLfiS8Ew3W
 TIksWdGH6zzN0ic9zhCBNRotfECotB9EkD+kV1IiqPCKeDGi8tFY91UXf5B1cMkdaYsGocciKBR
 05vc2O0Gd/X5qAqkWreFR98gsw+lNZ3eRLaN78ToIAPIu7Dl1J0+LyhYE/g==
X-Google-Smtp-Source: AGHT+IHrOWHiUm/F/+lZtbBia8s/2w5x9paCeR7fv8SYDyLAYWcFv8myDkJZHNDMxMSeMJWGxY++Fg==
X-Received: by 2002:a17:90b:4c4c:b0:32d:3895:656b with SMTP id
 98e67ed59e1d1-33b51112266mr40262461a91.12.1760537338313; 
 Wed, 15 Oct 2025 07:08:58 -0700 (PDT)
Received: from fedora ([2401:4900:1c6a:12d1:7eb9:cd0c:2129:1182])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-33b6192995asm20043418a91.0.2025.10.15.07.08.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Oct 2025 07:08:57 -0700 (PDT)
From: Shi Hao <i.shihao.999@gmail.com>
To: linux-fbdev@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org, deller@gmx.de, adaplas@gmail.com,
 Shi Hao <i.shihao.999@gmail.com>
Subject: [RFC PATCH] fdev: i810: use appropriate log interface pr_info
Date: Wed, 15 Oct 2025 19:38:45 +0530
Message-ID: <20251015140845.31671-1-i.shihao.999@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Wed, 15 Oct 2025 18:46:05 +0000
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

use appropriate logging interface pr_info instead of printk
without KERN_INFO with it. It could be updated with proper
logging interfaces.

Legacy printk() calls in the i810 fbdev driver can be replaced
with the standard kernel logging interface pr_info() which will
help to allow proper log level handling, making messages easier
to filter and manage.

No functional changes to the driver behavior are introduced.
Only the logging method has been updated to follow modern
kernel coding guidelines.

Signed-off-by: Shi Hao <i.shihao.999@gmail.com>
---
 drivers/video/fbdev/i810/i810_main.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/video/fbdev/i810/i810_main.c b/drivers/video/fbdev/i810/i810_main.c
index d73a795fe1be..8c4b9eae151d 100644
--- a/drivers/video/fbdev/i810/i810_main.c
+++ b/drivers/video/fbdev/i810/i810_main.c
@@ -2137,7 +2137,7 @@ static void i810fb_remove_pci(struct pci_dev *dev)

 	unregister_framebuffer(info);
 	i810fb_release_resource(info, par);
-	printk("cleanup_module:  unloaded i810 framebuffer device\n");
+	pr_info("cleanup_module: unloaded i810 framebuffer device\n");
 }

 #ifndef MODULE
--
2.51.0

