Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 351EB7E7BE3
	for <lists+dri-devel@lfdr.de>; Fri, 10 Nov 2023 12:44:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A29510E995;
	Fri, 10 Nov 2023 11:44:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [IPv6:2a00:1450:4864:20::52f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B22A10E995
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Nov 2023 11:44:11 +0000 (UTC)
Received: by mail-ed1-x52f.google.com with SMTP id
 4fb4d7f45d1cf-5431614d90eso3142841a12.1
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Nov 2023 03:44:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1699616649; x=1700221449; darn=lists.freedesktop.org;
 h=message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Ls+i1gmtLBTSrDfIDCKkUwn7wVHegofzcMpwXT7w+4A=;
 b=Da0y14oFphK2HkIVCS/DzVTGVBxs68mxn49ovXF9FOojmB4bAg82EOcTO8loVcMQ5k
 v/TjAa4y2kyWQp8gk7E7z20PR2D8w3dhqBh40LD2LHcWTa6uoZAkFnywPNqDbEyujZLk
 wLq7Ps5HfLSNHkTHCz1nYSL9/O3cjNgLWx2J8nUkE42C2jnIS5hjCsjgvpMi3gqOzwKT
 +RPGu8wwBxWVkQoSXHR5WzTVS9ux4F+/0YAm/tIfoki6LN5G0LeDZzvb7DTtBDLVLCG+
 psRubUx6WfgIaPM2cimkzOCf9NkLsBLk1UYBeC3KNA4boDwYWJ/6oyXQLIyj1As3Qyt8
 pXXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699616649; x=1700221449;
 h=message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Ls+i1gmtLBTSrDfIDCKkUwn7wVHegofzcMpwXT7w+4A=;
 b=VPe4guJHMd12IumlZ4jj5prvdXxIwNqAVoJwOzLC4NTYq2kQv5V5FA/DtP+fv7HkZc
 PzYu7+PeBDjHwecI4/dCfLe9Z/XhFHM2+j09Gd+x2El1LtbRbjd7UUcJdZvfoDPtQgy3
 wr1IGkG8gYqVbHDKD3DzvGJWFzOZvgkdpbBT27ctzJSKmd18x8GNTsmLSDpoSLYEIYWu
 NIbkv6tdmq+Da2Rijnb7I99nSGE0dYWe2dypVicJ9CCl9SODY59bIteK+gD0IgnXMpvz
 WZAP1EwZOT4yc5lQmp3Zwx0OZv57JFVZsH9JdKbsE7r78hTDdAvDV8z5bmdq26ej5RDj
 yu+A==
X-Gm-Message-State: AOJu0YwGCR+OzpPaMV/TYYuDN7sR7wvKpDIaaOMDPBgicyHacsCHHJtP
 CAY6ZsnNQtwVxlLZgZVG1OE=
X-Google-Smtp-Source: AGHT+IEDZNf7fK3SBH4Gvbr9dwhXqJGG5/7RAug27JiRlcTC2LXd/5Y7qKKS4jMCJMa8w2p8UhXYcg==
X-Received: by 2002:a50:d554:0:b0:543:5886:71c3 with SMTP id
 f20-20020a50d554000000b00543588671c3mr6540595edj.25.1699616649333; 
 Fri, 10 Nov 2023 03:44:09 -0800 (PST)
Received: from felia.fritz.box ([2a02:810d:7e40:14b0:cd7:bb15:91b6:862d])
 by smtp.gmail.com with ESMTPSA id
 cm7-20020a0564020c8700b005400dc94f43sm1018916edb.45.2023.11.10.03.44.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Nov 2023 03:44:08 -0800 (PST)
From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
To: Arnd Bergmann <arnd@arndb.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Helge Deller <deller@gmx.de>, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Subject: [PATCH] vgacon: drop IA64 reference in VGA_CONSOLE dependency list
Date: Fri, 10 Nov 2023 12:44:00 +0100
Message-Id: <20231110114400.30882-1-lukas.bulwahn@gmail.com>
X-Mailer: git-send-email 2.17.1
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
Cc: Lukas Bulwahn <lukas.bulwahn@gmail.com>, kernel-janitors@vger.kernel.org,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Commit e9e3300b6e77 ("vgacon: rework Kconfig dependencies") turns the
dependencies into a positive list of supported architectures, which
includes the IA64 architecture, but in the meantime, this architecture is
removed in commit cf8e8658100d ("arch: Remove Itanium (IA-64)
architecture").

Drop the reference to IA64 architecture in the dependency list of the
VGA_CONSOLE config definition.

Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
---
 drivers/video/console/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/video/console/Kconfig b/drivers/video/console/Kconfig
index 83c2d7329ca5..bc31db6ef7d2 100644
--- a/drivers/video/console/Kconfig
+++ b/drivers/video/console/Kconfig
@@ -7,7 +7,7 @@ menu "Console display driver support"
 
 config VGA_CONSOLE
 	bool "VGA text console" if EXPERT || !X86
-	depends on ALPHA || IA64 || X86 || \
+	depends on ALPHA || X86 || \
 		(ARM && ARCH_FOOTBRIDGE) || \
 		(MIPS && (MIPS_MALTA || SIBYTE_BCM112X || SIBYTE_SB1250 || SIBYTE_BCM1x80 || SNI_RM))
 	select APERTURE_HELPERS if (DRM || FB || VFIO_PCI_CORE)
-- 
2.17.1

