Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D7819622CD4
	for <lists+dri-devel@lfdr.de>; Wed,  9 Nov 2022 14:51:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD9C010E5CB;
	Wed,  9 Nov 2022 13:51:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D8AA10E4F5
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Nov 2022 19:09:42 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id k8so22579440wrh.1
 for <dri-devel@lists.freedesktop.org>; Tue, 08 Nov 2022 11:09:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=aGcCWNr//3vMTTtn977bhx9FfG16+v60jhPdfwK24Kg=;
 b=kcEXxKYdo3cLlWAHEh/j31uxR6/PcTyQ+5GdwX9J6wlSz08DD60N6gPF49vGK3RNnx
 1UXND9MfrLhqJFmVfyGpakC/xTDbuOGkeLmnjCCRaJmMDyvVMQ50ODkscHzLfmRiu+Op
 sGh/bbc9kkDLoD2r3Asu12YieqPDFYBcuB0+8qRgJXfwGkNkOAkTnxJhmcX18uRPTAEK
 c/xyH43CxUxy3jCSpqQ7WCUt1muZFL7eVgadex8hxYXwilSd8mGlYCrJ9pqRTLJz0zsN
 qS/armOY3DvHEwSHFZaK2+CTCfqcPXsoNKMKQ4U3Om9sAoy7EK4af82kkiBdDLEEVFQ4
 Lf9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=aGcCWNr//3vMTTtn977bhx9FfG16+v60jhPdfwK24Kg=;
 b=D8xTogHJpXNVZSHwHXcPEQykRSMuJTQtbQcwwRlFwITIbL8nYKdjGxwvTQ1mh3LUlg
 dFRqnX2i+0XAUUPFadVYpjWTbYNj0az5ivkfD1m3w0taAk+1twMVOyT89s6TtGQA7nZq
 RcACD4CeN6y/OdNmsq7lDb+5KKdvGAteFn1AsXPsYYYUsjNC7in5WQyDTYqHzhAXGwRA
 xx1UEFOA7g7hB/TVn64XDQ/OLy+WgOlmd47Lb5h6xHkmHYHYd1P3pDejjkH+Ni/C7h/6
 ghQnuFozFwPW96jquaViEPO8yH3CT66uVJRjXt6FdyPrOnUHyZnLLqBkcZ/VZSesMA2Q
 d03A==
X-Gm-Message-State: ACrzQf3vWEh4N2d/QntmVQXRSciR5GMykiXvoJxZM0zWG/rLbkfpfPq/
 v08PirQlQiaA5m4bzMN+VdebTsz2p60=
X-Google-Smtp-Source: AMsMyM7dldZZ/TbaT7TAASxALKnAm8AWHGC9iBkiNGUrEexniYSYoXlbdYX/tp6Ri1lYBnXGB7/WWQ==
X-Received: by 2002:a5d:6181:0:b0:22e:3db0:67a2 with SMTP id
 j1-20020a5d6181000000b0022e3db067a2mr37455079wru.257.1667934580500; 
 Tue, 08 Nov 2022 11:09:40 -0800 (PST)
Received: from alaa.. ([41.42.191.11]) by smtp.gmail.com with ESMTPSA id
 b9-20020a05600003c900b0022e6178bd84sm11188508wrg.8.2022.11.08.11.09.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Nov 2022 11:09:39 -0800 (PST)
From: Alaa Mohamed <eng.alaamohamedsoliman.am@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/vkms: change min cursor size to accept smaller values
Date: Tue,  8 Nov 2022 21:09:26 +0200
Message-Id: <20221108190926.30439-1-eng.alaamohamedsoliman.am@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Wed, 09 Nov 2022 13:50:32 +0000
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
Cc: hamohammed.sa@gmail.com, andrealmeid@igalia.com,
 rodrigosiqueiramelo@gmail.com, melissa.srw@gmail.com, mwen@igalia.com,
 Alaa Mohamed <eng.alaamohamedsoliman.am@gmail.com>, aemad@igalia.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

change min cursor size of vkms driver from 20 to 10, to increase the IGT test
coverage of vkms by enabling 32x10 cursor size subtests in kms_cursor_crc

Signed-off-by: Alaa Mohamed <eng.alaamohamedsoliman.am@gmail.com>
---
 drivers/gpu/drm/vkms/vkms_drv.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/vkms/vkms_drv.h b/drivers/gpu/drm/vkms/vkms_drv.h
index 0a67b8073f7e..4a248567efb2 100644
--- a/drivers/gpu/drm/vkms/vkms_drv.h
+++ b/drivers/gpu/drm/vkms/vkms_drv.h
@@ -12,8 +12,8 @@
 #include <drm/drm_encoder.h>
 #include <drm/drm_writeback.h>
 
-#define XRES_MIN    20
-#define YRES_MIN    20
+#define XRES_MIN    10
+#define YRES_MIN    10
 
 #define XRES_DEF  1024
 #define YRES_DEF   768
-- 
2.34.1

