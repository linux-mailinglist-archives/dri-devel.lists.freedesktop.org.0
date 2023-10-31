Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CA8227DD5EE
	for <lists+dri-devel@lfdr.de>; Tue, 31 Oct 2023 19:16:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 26A3910E5AC;
	Tue, 31 Oct 2023 18:16:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x530.google.com (mail-pg1-x530.google.com
 [IPv6:2607:f8b0:4864:20::530])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 55EA010E5AD
 for <dri-devel@lists.freedesktop.org>; Tue, 31 Oct 2023 18:16:53 +0000 (UTC)
Received: by mail-pg1-x530.google.com with SMTP id
 41be03b00d2f7-5b9a456798eso1628717a12.3
 for <dri-devel@lists.freedesktop.org>; Tue, 31 Oct 2023 11:16:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anholt-net.20230601.gappssmtp.com; s=20230601; t=1698776212; x=1699381012;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=xFlBn81tf0XiqrjYfrWqrTfP41riZUG6Q0ewaR25f3I=;
 b=tL+0/amntVpypNnRb7AWpBtaOfOIk/NFWyPUwvcu4+yKuMfxA/2RcrzRil7aj+MwEj
 7WL/XPls0trc1BLr5hDJUEQBfz3Griu1+wVk/ms7gafeoqcTmCTa2u2RY7i9NLeh+RjM
 qgtD20gVPjcHAKZn3iZBLMZD2zqyMgBKsONsChKHUPeKep+aDZqp/f/MA6DZOqU5zzJo
 XfLeu/ONRy9KnK4gB/RAvCRGvMDHv4Fz0yrN/F7rOMmDel2st9RdZtoUnxQ2LlkiRyCq
 cHpt/UthQeKHDCGQUCjim8pAmi1NVyOxvtrYONRO/0Ec5TcWp4TN6v3RXFy39+L6lndl
 PynA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698776212; x=1699381012;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=xFlBn81tf0XiqrjYfrWqrTfP41riZUG6Q0ewaR25f3I=;
 b=wn6gWPMlYx6okkSe1QbwzWfSP8Xp6UWamkA247TAVFOZTICAFpYvJ9cVijhqjtTBsI
 gTBq2HWeZIKWUs+mw2qSt/VZ0FAZBmUFUrj8z7nqhjOKikdubIvyBvAYO69OKqkdT1th
 GufizFT9xATWNpXUwG3cd/gi83pSHLmnL1ZR0qTU+6HGR5kZpuaHQ9cCPiGGn0SoezJT
 f6F7zPnjcCCYKknF1VMf8A4UHatAI+AI0O1gDRDfM2r8YaAWUFRQUg4VbewOnHd0im/R
 hDk6RaCBLEefQfcv52+7fNMlk5s7zWrqSVttwGYzybet3MbB8ZmQUs/ZnT3OGW2Q93gR
 vAYA==
X-Gm-Message-State: AOJu0YxrGgnDP7ibAdnErdNuYfYM7bYipjT0b8kBJXCxeAd1oOGGCxi/
 AKwjNAdG1DeO5M09wZJJA8t9A5qCp6vUeVAg8p0=
X-Google-Smtp-Source: AGHT+IHtnG3LiVSEIL986YKjBxhwRsVR4vYT7PDhf69nxmtikdw0j3Bj568hS5/QkHqcs/FlJDCEgg==
X-Received: by 2002:a05:6a20:1608:b0:17b:1f75:e3f2 with SMTP id
 l8-20020a056a20160800b0017b1f75e3f2mr13078688pzj.39.1698776211735; 
 Tue, 31 Oct 2023 11:16:51 -0700 (PDT)
Received: from miranda.anholt.net ([2a00:79e1:abd:4a00:3f29:6694:bcf6:f5a5])
 by smtp.gmail.com with ESMTPSA id
 v19-20020aa78513000000b0064fd4a6b306sm1535487pfn.76.2023.10.31.11.16.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 31 Oct 2023 11:16:51 -0700 (PDT)
From: Emma Anholt <emma@anholt.net>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] MAINTAINERS: Drop Emma Anholt from all M lines.
Date: Tue, 31 Oct 2023 11:16:48 -0700
Message-ID: <20231031181648.48675-1-emma@anholt.net>
X-Mailer: git-send-email 2.42.0
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
Cc: Emma Anholt <emma@anholt.net>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

I am not active in the Linux kernel and don't want to see patches.

Signed-off-by: Emma Anholt <emma@anholt.net>
---
 MAINTAINERS | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 01fb9ee6b951..31854c48711e 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -5378,7 +5378,6 @@ T:	git git://anongit.freedesktop.org/drm/drm-misc
 F:	drivers/gpu/drm/sun4i/sun8i*
 
 DRM DRIVER FOR ARM PL111 CLCD
-M:	Eric Anholt <eric@anholt.net>
 S:	Supported
 T:	git git://anongit.freedesktop.org/drm/drm-misc
 F:	drivers/gpu/drm/pl111/
@@ -5441,7 +5440,6 @@ T:	git git://anongit.freedesktop.org/drm/drm-misc
 F:	drivers/gpu/drm/tiny/gm12u320.c
 
 DRM DRIVER FOR HX8357D PANELS
-M:	Eric Anholt <eric@anholt.net>
 S:	Maintained
 T:	git git://anongit.freedesktop.org/drm/drm-misc
 F:	Documentation/devicetree/bindings/display/himax,hx8357d.txt
@@ -5883,7 +5881,6 @@ F:	Documentation/devicetree/bindings/display/ti/
 F:	drivers/gpu/drm/omapdrm/
 
 DRM DRIVERS FOR V3D
-M:	Eric Anholt <eric@anholt.net>
 S:	Supported
 T:	git git://anongit.freedesktop.org/drm/drm-misc
 F:	Documentation/devicetree/bindings/gpu/brcm,bcm-v3d.txt
@@ -5891,7 +5888,6 @@ F:	drivers/gpu/drm/v3d/
 F:	include/uapi/drm/v3d_drm.h
 
 DRM DRIVERS FOR VC4
-M:	Eric Anholt <eric@anholt.net>
 S:	Supported
 T:	git git://github.com/anholt/linux
 T:	git git://anongit.freedesktop.org/drm/drm-misc
-- 
2.42.0

