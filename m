Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 78198998397
	for <lists+dri-devel@lfdr.de>; Thu, 10 Oct 2024 12:32:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D80F810E8BC;
	Thu, 10 Oct 2024 10:32:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="eqY8zJwk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com
 [209.85.208.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9874510E8BC
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Oct 2024 10:32:09 +0000 (UTC)
Received: by mail-ed1-f52.google.com with SMTP id
 4fb4d7f45d1cf-5c9362c26d8so827586a12.1
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Oct 2024 03:32:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1728556328; x=1729161128; darn=lists.freedesktop.org;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:from:to:cc:subject:date:message-id:reply-to;
 bh=EKfCr8K8XATwTEc5LZiBxGmuNZQGRkSeS/Vp37hWSP4=;
 b=eqY8zJwkkNlTbFwTN08U0sp9ipyDbNLBYzpAlcXU0TdQkO2Bt5Jq2+VtWsyVlgYnAS
 0VBTBMn7Hr4YzQhKd37dzoJqmXKJiz4tAMvETZxCIX41LBChbhrXctJFcMs+qLueF7KA
 fR05c5xB3XopE2PPqEtSlhl8Vj8iNxvhL4txrsimUmr5QGsTu6k+6sNHw9MQXeRSYPG/
 5KFr+Mrd8YuP8J6ZNWhAkk3b0MNEocH6YLIF6lBOCZUw7s/E7TlNrBcJeqrzKJvH/q7D
 leIXMjNXOE02xWUN4Tb61rnLX9XX0t9FvyRkRWzmM0Cu8qmlcfNrqZKzhoio6Sr3h+aD
 6dPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1728556328; x=1729161128;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=EKfCr8K8XATwTEc5LZiBxGmuNZQGRkSeS/Vp37hWSP4=;
 b=PSIqAkrqc8Pjo+3Z8DzoXCii41bL8yd6P2NprEG1JUiPM2OwEMwD3PtLuHAtPWA9t/
 2MG2s5wrB3JN6HLmgbh/uKa42nWau0wG7TWRL9uz5yuhUp8F9pckbaUxRYny9Hmz8aQG
 1SzLt3QGnmjhz7qeFwQVgdW1Gb2f109tRR8VMgFXcHYRNGw7HyaijTNThLs607sv8vSY
 UGY7aeinL5ODmHkGIwZV5Vnsr6efnfd8IuQiD5FRFt0kqHigDQkxO9+HGnGWAiGxaSmw
 w9U2E3au8HEhy/U5wV+CST47IEAaPM13pMak70SYYXD0tPMnSDcNY9wzazLHkXnADZwf
 j/YQ==
X-Gm-Message-State: AOJu0YxU/C+HroXD96BbvJF0sezB+C0HkhZqHeHjTZ0VinE9eFkd2hsK
 A1JBGt/g8baybWJn5Lv5weOY91P6kGJ62rJCQeAwfOLCXGTO65ZbUfgSPw==
X-Google-Smtp-Source: AGHT+IGJ+FHXEoWNw2jQBNeAzKGmH/WOieImY89fddm17ppYNB7oLiViUmG4HFDkNWVkiKeN91bdCw==
X-Received: by 2002:a05:6402:3508:b0:5c5:cda5:9328 with SMTP id
 4fb4d7f45d1cf-5c93353c8f1mr2301881a12.4.1728556327707; 
 Thu, 10 Oct 2024 03:32:07 -0700 (PDT)
Received: from [127.0.1.1] (leased-line-46-53-189-107.telecom.by.
 [46.53.189.107]) by smtp.googlemail.com with ESMTPSA id
 4fb4d7f45d1cf-5c93715159csm597314a12.42.2024.10.10.03.32.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Oct 2024 03:32:07 -0700 (PDT)
From: Dzmitry Sankouski <dsankouski@gmail.com>
Date: Thu, 10 Oct 2024 13:31:42 +0300
Subject: [PATCH] drm/mipi-dsi: fix kernel doc on
 mipi_dsi_compression_mode_multi
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241010-starqltechn_integration_upstream_drm_fix-v1-1-cf3cb1d1ce77@gmail.com>
X-B4-Tracking: v=1; b=H4sIAA2tB2cC/x2N0QrCMAxFf2Xk2UKbCk5/RaSULd0Crs4kE2Hs3
 y0+ngvnnh2UhEnh1u0g9GHlV20QTh0Mc64TOR4bA3o8Bx+8U8vyfhoNc01cjSbJ1py0rWpCeUm
 jLKnw110QY4w9lmtfoN2tQm3+p+6P4/gBybGUlHoAAAA=
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Neil Armstrong <neil.armstrong@linaro.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 kernel test robot <lkp@intel.com>, Dzmitry Sankouski <dsankouski@gmail.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1728556326; l=1225;
 i=dsankouski@gmail.com; s=20240619; h=from:subject:message-id;
 bh=U8Qpq6Kc34eBmGAV0KHkX48owBKgN62YeboZL5ZEL24=;
 b=0IvFTL9sBSstv6QvX78a5xbC9GwOL1MGNboZNiXyqkJTGKUSlN9NQQkpBoLOL5fdnaeNOEkVh
 eVqSaAam8fNDcU45aT0VMQ5EUCvJoP4JEZ8GynpFID4DaDrS2ZjnOVh
X-Developer-Key: i=dsankouski@gmail.com; a=ed25519;
 pk=YJcXFcN1EWrzBYuiE2yi5Mn6WLn6L1H71J+f7X8fMag=
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

Replace dsi parameter on ctx in kernel doc of
mipi_dsi_compression_mode_multi function.

Fixes: 975bdea8c470 ("drm/mipi-dsi: add mipi_dsi_compression_mode_multi")
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202410092245.tfsuUllL-lkp@intel.com/
Signed-off-by: Dzmitry Sankouski <dsankouski@gmail.com>
---
 drivers/gpu/drm/drm_mipi_dsi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_mipi_dsi.c b/drivers/gpu/drm/drm_mipi_dsi.c
index d8ee74701f1e..5e5c5f84daac 100644
--- a/drivers/gpu/drm/drm_mipi_dsi.c
+++ b/drivers/gpu/drm/drm_mipi_dsi.c
@@ -1522,7 +1522,7 @@ EXPORT_SYMBOL(mipi_dsi_compression_mode_ext_multi);
 
 /**
  * mipi_dsi_compression_mode_multi() - enable/disable DSC on the peripheral
- * @dsi: DSI peripheral device
+ * @ctx: Context for multiple DSI transactions
  * @enable: Whether to enable or disable the DSC
  *
  * Enable or disable Display Stream Compression on the peripheral using the

---
base-commit: 4c93ede2b0c73a7708f46a01669769d15d31e1d2
change-id: 20241010-starqltechn_integration_upstream_drm_fix-72233382f98f

Best regards,
-- 
Dzmitry Sankouski <dsankouski@gmail.com>

