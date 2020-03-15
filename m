Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 12418186064
	for <lists+dri-devel@lfdr.de>; Mon, 16 Mar 2020 00:19:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A77D6E25B;
	Sun, 15 Mar 2020 23:19:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x741.google.com (mail-qk1-x741.google.com
 [IPv6:2607:f8b0:4864:20::741])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C3A0C6E0FD
 for <dri-devel@lists.freedesktop.org>; Sun, 15 Mar 2020 21:42:42 +0000 (UTC)
Received: by mail-qk1-x741.google.com with SMTP id c145so22811554qke.12
 for <dri-devel@lists.freedesktop.org>; Sun, 15 Mar 2020 14:42:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=FxhoUoo60hHirpNjZjgUcRQ8tvG6+IwwwDsSTyR3B+w=;
 b=RRx8PIlQrGqFl/pjhexTqSgfkY3CZ/6pQp8Oxee6OexetLYufit8DRR41DRyEaBl53
 kwPUhEnkJUn54KU859IIwZ4YOzRGuwaHclDSKDMKyaBSh0Wm0Ag0Qv4srD8LXmhCHK2P
 1SldRrRHAM0NvP7YC9Qn9l5mV/nW0mVxGOVxrqxLzpM6St+t8djPQ8oMVAMWTGNsNfvP
 pQEV6LB/ZKpaFWwEGOryIj4AWVhFrakBm6yiZJLSugou2VU0ilMB67UOLlPH+04Q9NDt
 M8BbPG9nGOr9bgFI7X7q4BjbgDjJRXkZvS5w/SocufDWfuxk82apWNw6j7k+6IVMKidy
 Xbtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=FxhoUoo60hHirpNjZjgUcRQ8tvG6+IwwwDsSTyR3B+w=;
 b=hQlkvY1Hg5IfjcvXHNcl5ufUQHZ8vOIWnEkR9COBzj1mS5B/El7LkaQukys0Mhaarc
 e13wyJTQWkHZ2xNopcrfBCoReGeQ4xM/8s9AzJjfbMbAgnit9Qs2Jh0AOEln89V5lX04
 WJ8Jf73aZFZddhZqsrDHom01STlWulXYJd7x895n7dPgLzOqDKF7wqgMKdm3Vzm6yhGQ
 yulSgXepwXDvWZT5Nud1pDoNOkNSXO2013APVfoEHekWICtFIajIiFx0dMcjVagICJTh
 ANQ4gXJ0nzoyXAPThFKnhlgUpSVbbuYyiZR9hXrEWmqXaHOxZMKlmFVVEe30TcjLIvZa
 G+5A==
X-Gm-Message-State: ANhLgQ2fZYUIF3x7+Rghck/VAG1+O2Bu4PK9lbrr5w07DWdQmdpqL9o9
 1iVwIqXI4EVZlRxFptDlvPA=
X-Google-Smtp-Source: ADFU+vsDBkj3cY4nZ7uBSKWf29DMXhCY6qPBOwy6PyxTxBxEJ36C5hd9NR92TTn6nVgpFex/2Y8QHQ==
X-Received: by 2002:a37:b305:: with SMTP id c5mr15844409qkf.213.1584308561869; 
 Sun, 15 Mar 2020 14:42:41 -0700 (PDT)
Received: from localhost.localdomain ([68.202.211.176])
 by smtp.gmail.com with ESMTPSA id 17sm17674937qkm.105.2020.03.15.14.42.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 15 Mar 2020 14:42:41 -0700 (PDT)
From: Daniel Rodriguez <danielcrodriguez2012@gmail.com>
To: eric@anholt.net, airlied@linux.ie, daniel@ffwll.ch,
 dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/v3d: fix Kconfig ARCH_BCMSTB typo preventing compile
Date: Sun, 15 Mar 2020 21:42:33 +0000
Message-Id: <20200315214233.14211-1-danielcrodriguez2012@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Mailman-Approved-At: Sun, 15 Mar 2020 23:19:05 +0000
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
Cc: Daniel Rodriguez <danielcrodriguez2012@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The Kconfig for v3d includes a depend on ARCH_BRCMSTB. It is misspelled;
as ARCH_BCMSTB. This misspelling makes CONFIG_DRM_V3D not show up at all
on Linux menuconfig and breaks manual kernel compilation with
it manually set in .config (during compile CONFIG_DRM_V3D is transparently
removed as the non-existent depend is not satisfied)

Thus, v3d will (transparently) never compile into a kernel, even if
forcibly enabled in .config.

This patch corrects the typo, thus fixing menuconfig and kernel
compilation with v3d.

Signed-off-by: Daniel Rodriguez <danielcrodriguez2012@gmail.com>
---
 drivers/gpu/drm/v3d/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/v3d/Kconfig b/drivers/gpu/drm/v3d/Kconfig
index 9a5c44606337..e973ec487484 100644
--- a/drivers/gpu/drm/v3d/Kconfig
+++ b/drivers/gpu/drm/v3d/Kconfig
@@ -1,7 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0-only
 config DRM_V3D
 	tristate "Broadcom V3D 3.x and newer"
-	depends on ARCH_BCM || ARCH_BCMSTB || COMPILE_TEST
+	depends on ARCH_BCM || ARCH_BRCMSTB || COMPILE_TEST
 	depends on DRM
 	depends on COMMON_CLK
 	depends on MMU
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
