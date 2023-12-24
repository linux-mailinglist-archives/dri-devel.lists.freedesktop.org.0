Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F232381D7F9
	for <lists+dri-devel@lfdr.de>; Sun, 24 Dec 2023 06:21:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 289AE10E095;
	Sun, 24 Dec 2023 05:21:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-xf32.google.com (mail-qv1-xf32.google.com
 [IPv6:2607:f8b0:4864:20::f32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A44FE10E095
 for <dri-devel@lists.freedesktop.org>; Sun, 24 Dec 2023 05:21:26 +0000 (UTC)
Received: by mail-qv1-xf32.google.com with SMTP id
 6a1803df08f44-67f47b15fa3so25098856d6.1
 for <dri-devel@lists.freedesktop.org>; Sat, 23 Dec 2023 21:21:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=broadcom.com; s=google; t=1703395285; x=1704000085;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=1Va9uKfUKNctGYZAEDrYv1WrpTtXNDm86DRklEW6gSA=;
 b=D8ahWaoHnIWWOQsgNXnLDIPNPzrk1z5lIV8G/FFH+q5Qv4S6fDs0BKHUD9xSiujeL5
 zuH1y4C8lSweVQ6cJNDtf9tgAoWaV6VKMbuYT4Ks6/ctM+x0hxFS9c4dNZ0bHreyihNF
 Dn33/t3+ymfgULb9FRmhY/118FrlJrH9Tu7lU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1703395285; x=1704000085;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=1Va9uKfUKNctGYZAEDrYv1WrpTtXNDm86DRklEW6gSA=;
 b=qcEQhMRNif3ntstFSb42xCk2p3CkVbQfbMwF3uU9R6ooe3phLno/2dAchutMxlqM4k
 4QeaAdwq2ufqpEsHP8ATDgqcZkAVKyBhW9groxAoAs/FJZ3u1l50EV+IyoxH3sB3E8bt
 ZvdBP7/vvHIw3jRJSvg5FWtatpd3DgkOc2uJJD56WkUI0KzuIQAuG3IDt6HT9G3HEAk5
 u6dENJ/cqo0r4C4cIOo138iHkUaKgoFIODfjHhqjLYne2gh917IZKTXZU/bKhZQkALJB
 gfZS/g1kCZ0EJarpedOeBTDdve0NM8WTqT9NRiq7C0B0SIO/jmjIRjQ3py6oDBVSUX89
 Zssw==
X-Gm-Message-State: AOJu0Yy1EpglhByswZwGFi2yX8wQ7Gt4bPa5waHkUdrAZeoIEogKlXEZ
 wVXQD2ioYUPU0FLQoRyRpMeESRsdht5C
X-Google-Smtp-Source: AGHT+IGbBPRb2fvJ+S7ksHoxbaOd3JVYbHW4dTFHsf/WS3E7V8T+Gqradt+yTgPKu23FX+j3hbriJg==
X-Received: by 2002:a05:6214:332:b0:67f:bd03:42fa with SMTP id
 j18-20020a056214033200b0067fbd0342famr2580930qvu.64.1703395285437; 
 Sat, 23 Dec 2023 21:21:25 -0800 (PST)
Received: from vertex.localdomain
 (pool-173-49-113-140.phlapa.fios.verizon.net. [173.49.113.140])
 by smtp.gmail.com with ESMTPSA id
 de11-20020ad4584b000000b0067fa0a9163bsm1315352qvb.143.2023.12.23.21.21.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 23 Dec 2023 21:21:25 -0800 (PST)
From: Zack Rusin <zack.rusin@broadcom.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH] MAINTAINERS: Change vmware.com addresses to broadcom.com
Date: Sun, 24 Dec 2023 00:20:36 -0500
Message-Id: <20231224052036.603621-1-zack.rusin@broadcom.com>
X-Mailer: git-send-email 2.40.1
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
Cc: dri-devel@lists.freedesktop.org, Ian Forbes <ian.forbes@broadcom.com>,
 Maaz Mombasawala <maaz.mombasawala@broadcom.com>,
 Martin Krastev <martin.krastev@broadcom.com>,
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
 Andrew Morton <akpm@linux-foundation.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Update the email addresses for vmwgfx and vmmouse to reflect the fact
that VMware is now part of Broadcom.

Add a .mailmap entry because the vmware.com address will start bouncing
soon.

Signed-off-by: Zack Rusin <zack.rusin@broadcom.com>
Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: Ian Forbes <ian.forbes@broadcom.com>
Cc: Martin Krastev <martin.krastev@broadcom.com>
Cc: Maaz Mombasawala <maaz.mombasawala@broadcom.com>
Cc: Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
Cc: dri-devel@lists.freedesktop.org
Cc: linux-kernel@vger.kernel.org
---
 .mailmap    | 1 +
 MAINTAINERS | 9 ++++-----
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/.mailmap b/.mailmap
index 68e72a6017a0..ac31f47f4636 100644
--- a/.mailmap
+++ b/.mailmap
@@ -637,4 +637,5 @@ Wolfram Sang <wsa@kernel.org> <w.sang@pengutronix.de>
 Wolfram Sang <wsa@kernel.org> <wsa@the-dreams.de>
 Yakir Yang <kuankuan.y@gmail.com> <ykk@rock-chips.com>
 Yusuke Goda <goda.yusuke@renesas.com>
+Zack Rusin <zack.rusin@broadcom.com> <zackr@vmware.com>
 Zhu Yanjun <zyjzyj2000@gmail.com> <yanjunz@nvidia.com>
diff --git a/MAINTAINERS b/MAINTAINERS
index 7cef2d2ef8d7..221871bd4e92 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -6902,8 +6902,8 @@ T:	git git://anongit.freedesktop.org/drm/drm-misc
 F:	drivers/gpu/drm/vboxvideo/
 
 DRM DRIVER FOR VMWARE VIRTUAL GPU
-M:	Zack Rusin <zackr@vmware.com>
-R:	VMware Graphics Reviewers <linux-graphics-maintainer@vmware.com>
+M:	Zack Rusin <zack.rusin@broadcom.com>
+R:	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
 L:	dri-devel@lists.freedesktop.org
 S:	Supported
 T:	git git://anongit.freedesktop.org/drm/drm-misc
@@ -23207,9 +23207,8 @@ F:	drivers/misc/vmw_vmci/
 F:	include/linux/vmw_vmci*
 
 VMWARE VMMOUSE SUBDRIVER
-M:	Zack Rusin <zackr@vmware.com>
-R:	VMware Graphics Reviewers <linux-graphics-maintainer@vmware.com>
-R:	VMware PV-Drivers Reviewers <pv-drivers@vmware.com>
+M:	Zack Rusin <zack.rusin@broadcom.com>
+R:	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
 L:	linux-input@vger.kernel.org
 S:	Supported
 F:	drivers/input/mouse/vmmouse.c
-- 
2.40.1

