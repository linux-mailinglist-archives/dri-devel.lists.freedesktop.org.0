Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 917D8A3E155
	for <lists+dri-devel@lfdr.de>; Thu, 20 Feb 2025 17:50:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC76210E1DB;
	Thu, 20 Feb 2025 16:50:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="nNh/dsFL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com
 [209.85.214.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EFA9010E1DB
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Feb 2025 16:50:13 +0000 (UTC)
Received: by mail-pl1-f169.google.com with SMTP id
 d9443c01a7336-2210d92292eso33479605ad.1
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Feb 2025 08:50:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1740070213; x=1740675013; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=3DmhWr2QmVyeGuDS1oXG9gsaDbVa/o2rG7jKNkrjMRs=;
 b=nNh/dsFL8yRs2mytCJp9U7zJ9ftONBBP+zH4hVnuXiIwirWDHLttyHWA6OaClogEpO
 vZFYofofijnNmPqRb9ClPvnkRl1QuzMzARJy7xf8hQfr0U5XIrZZoKneP3jO+erHxzjY
 /RRm3DmclC0LUAmE/i/ZK7oBJROswnb1Il91R8FCGfx+Co5PtXx1amagydNNat2RZAaD
 Lv/ElLLsVDU8l1307iO23nc7etYi+8NT1dCjoLHGMrmUMdXaIsQ12L5lY2D7hvpHs7Ir
 mK2r9joZDE4lbyXMvQwmFS8r/71z6AZAvhMPrk0Vorc0SESCUyyefkyLwL5s9otZLe0/
 DGxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740070213; x=1740675013;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=3DmhWr2QmVyeGuDS1oXG9gsaDbVa/o2rG7jKNkrjMRs=;
 b=IK/Vfd00ymDjM/kgd5nwaySzq+wfGdkf65AOR6NmTTYvF1SJm+XLfwEgH0b4Keo5VE
 DLMlt/oCQO7s07zEa92mOAzmR7+Myq4iqD/Lx9TaQNJXLHy9FEaHbRy3sjzyYI19zVgR
 OueZcONvBAHEn9ZxFpLB6xvJuB3pLekH3ovZtTkE4WffcH1xJJNL1PZLTyqP1BgMtSK6
 lwJYhW+lwBxFeSqiCZ1bafd9oZL2/PCdVHVRPbArY2XmiOVOOuxv4cuH5CpeAFnJvUzV
 r9XgN4mgE+of0B7HpAjYeOYyncayMwCNGEQtW6dPsdQ/XOxAgT7vyveIeYeUntFSec9C
 Byhw==
X-Gm-Message-State: AOJu0YwtI+cxelYgxGUHWjMspr3Ev2Z992jlpTRfRQbHDkx1UWBL+n/Q
 mbrQxQecoEoQ6CIqutH3C5IIZyrz0FZRjYzC2MSCIFi7147rfWtM
X-Gm-Gg: ASbGncs+1XmhiyARINcBSjZIH6bVwmNE2+cpMhezUBevAtNGaDASPkCNU6zC2O+eh0T
 2fHHj4i0ksj7F55/sAZHqn0vwJn3WR7BsKiE3z1D8D0iP3Zq79UkDo63wY59cuOmq/7P4W+WqEo
 ES1K9m/VEmLf9nK7BM/qKVmdHYeXiJfpEeAtEO508Mw5zMX4C9ohpVfNrNlxjIVUVGoZ7XGnla/
 d/t0WH252SzBPkpz5fxVf8oxQCMMQpo4Luuuwa2218sFR/LpDSBru7pnUlL6r1krKh0DgSDtPPn
 MGn1dAYLLjJlsRW1itbMKSZbW/5VhW9Isl66
X-Google-Smtp-Source: AGHT+IEZEJ5Vx0cDfop6Q20EF8DsuK+QyG7/1ZeIrNw7H+oUSeWhjSyHlDH+GyEOp57VhYxnE3uFtg==
X-Received: by 2002:a17:902:d2c2:b0:215:5625:885b with SMTP id
 d9443c01a7336-221711c2866mr129989005ad.52.1740070213205; 
 Thu, 20 Feb 2025 08:50:13 -0800 (PST)
Received: from localhost.localdomain ([106.207.145.213])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-73266fd6438sm10619451b3a.142.2025.02.20.08.50.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Feb 2025 08:50:12 -0800 (PST)
From: Pranav Tyagi <pranav.tyagi03@gmail.com>
To: maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch, corbet@lwn.net
Cc: dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
 linux-kernel-mentees@lists.linux.dev, bagasdotme@gmail.com,
 skhan@linuxfoundation.org, Pranav Tyagi <pranav.tyagi03@gmail.com>
Subject: [PATCH] vgaarbiter: documentation grammar correction 
Date: Thu, 20 Feb 2025 22:19:46 +0530
Message-ID: <20250220164946.18007-1-pranav.tyagi03@gmail.com>
X-Mailer: git-send-email 2.47.1
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

Corrects the following grammatical issues in the VGA Arbiter documentation:
- Fixes subject-verb agreement by changing "co-exists" to "co-exist"
- Corrects pluralization by changing "server" to "servers"
- Improves sentence structure for clarity

Signed-off-by: Pranav Tyagi <pranav.tyagi03@gmail.com>
Reviewed-by: Bagas Sanjaya <bagasdotme@gmail.com>
---
 Documentation/gpu/vgaarbiter.rst | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/Documentation/gpu/vgaarbiter.rst b/Documentation/gpu/vgaarbiter.rst
index bde3c0afb059..d1e953712cc2 100644
--- a/Documentation/gpu/vgaarbiter.rst
+++ b/Documentation/gpu/vgaarbiter.rst
@@ -11,9 +11,9 @@ Section 7, Legacy Devices.
 
 The Resource Access Control (RAC) module inside the X server [0] existed for
 the legacy VGA arbitration task (besides other bus management tasks) when more
-than one legacy device co-exists on the same machine. But the problem happens
+than one legacy device co-exist on the same machine. But the problem happens
 when these devices are trying to be accessed by different userspace clients
-(e.g. two server in parallel). Their address assignments conflict. Moreover,
+(e.g. two servers in parallel). Their address assignments conflict. Moreover,
 ideally, being a userspace application, it is not the role of the X server to
 control bus resources. Therefore an arbitration scheme outside of the X server
 is needed to control the sharing of these resources. This document introduces
@@ -106,7 +106,7 @@ In-kernel interface
 libpciaccess
 ------------
 
-To use the vga arbiter char device it was implemented an API inside the
+To use the vga arbiter char device, an API was implemented inside the
 libpciaccess library. One field was added to struct pci_device (each device
 on the system)::
 
-- 
2.47.1

