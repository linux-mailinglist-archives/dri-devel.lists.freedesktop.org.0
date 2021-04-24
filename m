Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E64EE36A238
	for <lists+dri-devel@lfdr.de>; Sat, 24 Apr 2021 18:50:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE0996E2D1;
	Sat, 24 Apr 2021 16:50:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [IPv6:2a00:1450:4864:20::636])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B180B6E2D1
 for <dri-devel@lists.freedesktop.org>; Sat, 24 Apr 2021 16:50:44 +0000 (UTC)
Received: by mail-ej1-x636.google.com with SMTP id v6so76838581ejo.6
 for <dri-devel@lists.freedesktop.org>; Sat, 24 Apr 2021 09:50:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=5m4sbKb1mKDj2CQTY50xzkbYv3PjnU1uIP8oNNYAVao=;
 b=GFF0+1DJiChlYl8FNWpHHNDZvW9IjIr62vsAo8VaSx4wU5tKMCxa2tvHT0DnKZILaN
 rhjhGi9NHqbwDXQz4w5IO6TrZFweKliScVCUglRHDF/OngEFtglfrBHxu+eyYjA7ovu3
 lB+dMJt5DSovsp5vbbO6ENqhNxSEOxaDlfBu5779i2XbljxMBEevy5CvVobw1eRLdYrx
 FhdzKaHe/LR1tfAlhfY5VOIbwRYxZoHhuBlzQpxJWOnbKGgeTNEth6Hijqur+e9Ab1Eq
 7evazICJpH9K47jzER0wurmaovsrr881Mefy7QfIazJmgj8hcf3mMsz3wuaEBCfFy1Sv
 XMQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=5m4sbKb1mKDj2CQTY50xzkbYv3PjnU1uIP8oNNYAVao=;
 b=uKoNgs9i+3oaf/UxfA3F209B3iLyGsvWrXHdPeYrdedEq0A3sOaruicYInbVBfPhS7
 dYSJ0wN+/OhWmZMKIOBHSvMXXSRqQsfMYEbWtQIEhw3jxrq41ObU4YDL7bqn2tPWRO5M
 11r33kC0+hs7JTDgEsCSpw/UT73Y58LUElJ8Mrrr1yWdimutzaKNFY5lT+UuSkHkv16n
 XwN+Ia9MixHPk7vwfW9CPFqbokT1z3TeNewb2wS8IyLYJzxW1na9irHlpvj628zEs2Bg
 84V2xYk/qN8ZcudEe4TTBcZtS0Aa8++GG1pelUv/OTK8v9wQSXsLiNaMN2xVV/V+dSbO
 KnLQ==
X-Gm-Message-State: AOAM5310mr3wqNdY+RbQCeYgI6QpuZXYO3wGxflUVmoS8+toiYAQVCcG
 xadFvdeu9MYXGSGbehkFK28=
X-Google-Smtp-Source: ABdhPJwLnq7m+rieQW/fDIu+zXwdvmXJgUACf+b+POUJPJ093gNSYAu/aIivSqxQl3FXf6Ck9Dpdmw==
X-Received: by 2002:a17:906:9b15:: with SMTP id
 eo21mr10240199ejc.237.1619283043335; 
 Sat, 24 Apr 2021 09:50:43 -0700 (PDT)
Received: from linux.local (host-79-52-107-152.retail.telecomitalia.it.
 [79.52.107.152])
 by smtp.gmail.com with ESMTPSA id n14sm7200702ejy.90.2021.04.24.09.50.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 24 Apr 2021 09:50:42 -0700 (PDT)
From: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
To: outreachy-kernel@googlegroups.com, dri-devel@lists.freedesktop.org,
 Felix Kuehling <Felix.Kuehling@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH] drm/amd/amdkfd/kfd_process.c: Fix kernel-doc syntax error
Date: Sat, 24 Apr 2021 18:50:39 +0200
Message-Id: <20210424165039.22717-1-fmdefrancesco@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
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
Cc: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fixed a kernel-doc error in the documentation of a function.

Signed-off-by: Fabio M. De Francesco <fmdefrancesco@gmail.com>
---
 drivers/gpu/drm/amd/amdkfd/kfd_process.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_process.c b/drivers/gpu/drm/amd/amdkfd/kfd_process.c
index 65803e153a22..12587fa768a9 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_process.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_process.c
@@ -250,7 +250,7 @@ static void kfd_sdma_activity_worker(struct work_struct *work)
 }
 
 /**
- * @kfd_get_cu_occupancy() - Collect number of waves in-flight on this device
+ * @kfd_get_cu_occupancy - Collect number of waves in-flight on this device
  * by current process. Translates acquired wave count into number of compute units
  * that are occupied.
  *
-- 
2.31.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
