Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B354313DB39
	for <lists+dri-devel@lfdr.de>; Thu, 16 Jan 2020 14:13:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 90E416ECF9;
	Thu, 16 Jan 2020 13:13:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com
 [IPv6:2607:f8b0:4864:20::541])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D0476ECF9;
 Thu, 16 Jan 2020 13:12:59 +0000 (UTC)
Received: by mail-pg1-x541.google.com with SMTP id k3so9887199pgc.3;
 Thu, 16 Jan 2020 05:12:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=aRXdGY9ecbhuEeNZ24odCIwAOk0VbdzxvC5sYvZf8qE=;
 b=SeVTp+hOJfQXvIYnbF5/exfMcDuf+3raQojyCka/wE1AcTeFcjvzn+IXORSDMDFFLO
 fJ3o7I2GoAiV36yEa4dqgOWQ7UjG/K5g9nCdi7J/06+WxZDJSRxOlch48rKgWNAAnYVp
 uFwYXYROAmIlaj5hhVkGVThCqDp7K8oOxdcYXph0PvOnMZj4kjQoCxBfQKgKQMTojVB/
 3OkrTHKMykr0P7dsbR3gjE5tru/uycuasrapHXSbnKfjDCih5yctkLppbxaZqEtRCTN7
 cNN9Z75LVV/3dLK8Wzq0OVgbjh7rGYV2oDtkHe+zKTMUY6I7oQ/1IM/cPPGXOSZf12GB
 o89g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=aRXdGY9ecbhuEeNZ24odCIwAOk0VbdzxvC5sYvZf8qE=;
 b=OLKaGWqp/afUyWothHc1XGclcIEIf1DFYYYCRWak5L2AKv0CaX03zCQl+w77jlZY97
 N4XfeUlTjdNp/lRi4u1ZbtFID19STeZiKTQGBvw0kj7j6sg32tVFeEDmcUH09awAzCdr
 4EZFEiQT/aiUf/Eg+zcwOjYZamMCmmRUSlPDSgNziFC/04MMdTZpBLK9zg07+vaieIt4
 TGV7VR0X+MU+kpfXcrh2wJpVeAUzIOb3yEEy/Y2YPQk+g2Cbeox1BSBMb5NRoffrfaWR
 5newIlBtkOdoZi67ZjfAb/frRRw42yGppxyCEdwD3ziPKZiwpGkgAqqCV9utbPktXeic
 J3HQ==
X-Gm-Message-State: APjAAAWmbi8gsADNm1ad43sKCvgTnE1FDKRP/m2EgD2frPsox1ilCa7L
 TCPMVAAf8q/GG98JB4YMvKf3d7CH
X-Google-Smtp-Source: APXvYqxKFijuE1lyjx05MxY8aVISyJlW4bGfjvjOCCt2ch1yXWmRnNSAbzzNn+c3N9R0lg0s6SleLw==
X-Received: by 2002:a62:f94d:: with SMTP id g13mr36792684pfm.60.1579180379064; 
 Thu, 16 Jan 2020 05:12:59 -0800 (PST)
Received: from localhost.localdomain ([103.219.195.110])
 by smtp.gmail.com with ESMTPSA id v9sm25945877pfi.37.2020.01.16.05.12.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Jan 2020 05:12:58 -0800 (PST)
From: Qiang Yu <yuq825@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 5/5] drm/lima: increase driver version to 1.1
Date: Thu, 16 Jan 2020 21:11:57 +0800
Message-Id: <20200116131157.13346-6-yuq825@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200116131157.13346-1-yuq825@gmail.com>
References: <20200116131157.13346-1-yuq825@gmail.com>
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
Cc: lima@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
 Vasily Khoruzhick <anarsoul@gmail.com>, Andreas Baierl <ichgeh@imkreisrum.de>,
 Qiang Yu <yuq825@gmail.com>, Erico Nunes <nunes.erico@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Signed-off-by: Qiang Yu <yuq825@gmail.com>
---
 drivers/gpu/drm/lima/lima_drv.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/lima/lima_drv.c b/drivers/gpu/drm/lima/lima_drv.c
index 18f88aaef1a2..2daac64d8955 100644
--- a/drivers/gpu/drm/lima/lima_drv.c
+++ b/drivers/gpu/drm/lima/lima_drv.c
@@ -245,6 +245,12 @@ static const struct drm_ioctl_desc lima_drm_driver_ioctls[] = {
 
 DEFINE_DRM_GEM_FOPS(lima_drm_driver_fops);
 
+/**
+ * Changelog:
+ *
+ * - 1.1.0 - add heap buffer support
+ */
+
 static struct drm_driver lima_drm_driver = {
 	.driver_features    = DRIVER_RENDER | DRIVER_GEM | DRIVER_SYNCOBJ,
 	.open               = lima_drm_driver_open,
@@ -254,9 +260,9 @@ static struct drm_driver lima_drm_driver = {
 	.fops               = &lima_drm_driver_fops,
 	.name               = "lima",
 	.desc               = "lima DRM",
-	.date               = "20190217",
+	.date               = "20191231",
 	.major              = 1,
-	.minor              = 0,
+	.minor              = 1,
 	.patchlevel         = 0,
 
 	.gem_create_object  = lima_gem_create_object,
-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
