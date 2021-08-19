Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D1773F19A1
	for <lists+dri-devel@lfdr.de>; Thu, 19 Aug 2021 14:44:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C3E6B6E833;
	Thu, 19 Aug 2021 12:44:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x431.google.com (mail-pf1-x431.google.com
 [IPv6:2607:f8b0:4864:20::431])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5CA4D6E833
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Aug 2021 12:44:32 +0000 (UTC)
Received: by mail-pf1-x431.google.com with SMTP id i21so5385273pfd.8
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Aug 2021 05:44:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=huaqin-corp-partner-google-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=tpdnVovIf9f36fxXsG47k5UX+4nv4gnLZxZo5LHNkVg=;
 b=dWEH/SBMM9XBrR35++2cnoA8rP5VhwS8bum3E6f6Jl86Z2yulQe5LUJJmF809A0KDp
 fGPd8FyzcMC3eLLMOgn4F765JPiBfFE1AHz64Fm1c7WARVsdQrestXs//sGn1ne2cmFD
 UYBuPgiwMoqQjyY0TUUI38W12DQcQFNWicRfAu+YnLGpuN28f/dC/khnQY0YzrzXRLZA
 K21+kYly5hV7UxiH4tZPZ8eFgr/r1+yskhHwLWOuTcSBjn5fISSGACC4wrAGyjx1OVKs
 6+JDvYbH4ltnkzemVF/X3MNYZgCylWr66UKYYGPW/xmz7f49ilyfNzaED5RIb9lgVUoM
 O9Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=tpdnVovIf9f36fxXsG47k5UX+4nv4gnLZxZo5LHNkVg=;
 b=eRyw5pSHnHlK57SVw9a02DSX9l+VMzWkCRXrLAhaf5Y8TXyerS9FWtoFsDdBk6hRO+
 8gCDM7efzIWP7cBjLxcYU9zwYpMIBaR9UVddK9gqtwtiofIjb+C1W28ydo0AWzIdoOVo
 Q+/SltpGVs3Yc1IMK1kht1Hmoyz5gU1hkJUo5sl4u/GrIiwpsgTTHIsy53UwQFv7oYtO
 iB+CDAMdqiGN+EKVPR6M6CLcni9+Q2YNkc3I5ra75qZcofapK6KqZotySJdYYM/RN1eA
 ILwEgxa4lWrQSonxA579YMrvwtWv7QvInM6Mu3pb8D/m5FLtzVqZ1luITK0rz06QvEdt
 weHg==
X-Gm-Message-State: AOAM532ZoaZzEg5pOhyiv86Otr2aU9t3+EYD8gqcZavh82v6UON9eUo5
 XmadVrMR7NyXrdbb0imEosCydxanxovBAFvk
X-Google-Smtp-Source: ABdhPJy3WI1J/e+pRGGKh963u5fG4uQGc8fxE4jcGFHpYB8tOfrFxADNwbMHRKBahzUYincyeGEgUg==
X-Received: by 2002:a65:578a:: with SMTP id b10mr14006811pgr.135.1629377072017; 
 Thu, 19 Aug 2021 05:44:32 -0700 (PDT)
Received: from yc.huaqin.com ([101.78.151.214])
 by smtp.gmail.com with ESMTPSA id n185sm3681717pfn.171.2021.08.19.05.44.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Aug 2021 05:44:31 -0700 (PDT)
From: yangcong <yangcong5@huaqin.corp-partner.google.com>
To: yangcong5@huaqin.com
Cc: dri-devel@lists.freedesktop.org,
 yangcong <yangcong5@huaqin.corp-partner.google.com>
Subject: [PATCH] test upstream
Date: Thu, 19 Aug 2021 20:44:27 +0800
Message-Id: <20210819124427.12264-1-yangcong5@huaqin.corp-partner.google.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

test upstream panel

Signed-off-by: yangcong <yangcong5@huaqin.corp-partner.google.com>
---
 drivers/gpu/drm/panel/panel-truly-nt35597.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/panel/panel-truly-nt35597.c b/drivers/gpu/drm/panel/panel-truly-nt35597.c
index b24b92d93ea5..e3cd37025c12 100644
--- a/drivers/gpu/drm/panel/panel-truly-nt35597.c
+++ b/drivers/gpu/drm/panel/panel-truly-nt35597.c
@@ -2,7 +2,9 @@
 /*
  * Copyright (c) 2018, The Linux Foundation. All rights reserved.
  */
-
+/*
+ * test upstream.
+ */
 #include <linux/backlight.h>
 #include <linux/delay.h>
 #include <linux/gpio/consumer.h>
-- 
2.25.1

