Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D1C2799C19
	for <lists+dri-devel@lfdr.de>; Sun, 10 Sep 2023 01:39:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3FD7210E0AE;
	Sat,  9 Sep 2023 23:39:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com
 [IPv6:2607:f8b0:4864:20::634])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F4C010E264
 for <dri-devel@lists.freedesktop.org>; Sat,  9 Sep 2023 11:04:50 +0000 (UTC)
Received: by mail-pl1-x634.google.com with SMTP id
 d9443c01a7336-1c0ecb9a075so21878505ad.2
 for <dri-devel@lists.freedesktop.org>; Sat, 09 Sep 2023 04:04:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1694257490; x=1694862290; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=hhJX5VWHXXtciuS9BkKk5zfmvkcSaBWZ/aSQRFscuJA=;
 b=InvNRkjWYQG1PKObzgGmB4a0Eny2XPqoEoFsrGWYhNxklPnYsjBlnjqdSznTgWkZLW
 7M+Q+0KfBNxhATxBzHI14TNL5by0R7fJuW64beiU3NmUjnYoFaPQEb2N6V4/JC6DVQVy
 6q8IgmfJRdY4bbvtxCygAm9uwiYj4GiY6qKVFMF5X1ls72OV4ssA4s+KgJtNttyO2Nak
 rn/g2nVOzroFxPwBL/SeJJjo2zj45m4IRPihvCHuukTsw4aemMJwDr5bGFqZu4Dqsj80
 gC2UF5kVWQh9kSH72MjgxzEDSr2H9/DvNOFpOzbGIgbdprltkVsU3O8KgrkSinFHX1Ha
 pOhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694257490; x=1694862290;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=hhJX5VWHXXtciuS9BkKk5zfmvkcSaBWZ/aSQRFscuJA=;
 b=kM9jqyR4o1mSiRZaAo7FEj8we2pgpmrnBdrdTfwDngdJA7cJaS6tGWsZZh8VKdg9vU
 wM6zCPtEoDS/9ZAoeQDCqzjPmee5GhYVYRbFm0wVsR15qS0yn+DJjTUEr+jGjykfuR0F
 NWFos/U//mEZMh3CXyUJ8ePGWosisxF4oKyRMBoZil31fKpy3+k/tJjinlAn+KftxtPa
 YWFQFeFGkhjlbwhXA6rSaBC6otpV+qPKHcHPM63Vg5XCMfdF8hb+sSr2TRhyNEGx6L+j
 jcNOKendUZrG6aiVSWI8gu/v1wcn7Y3jdEO48ns4A1Y9kwLE7K1E/aBKFxVgmDHJLBnr
 t15A==
X-Gm-Message-State: AOJu0YxuSsJ3MSxgG2iJKknvpFTIlt+17vD6PK+cZe/3ZX0D9xbmVwCy
 QomFX82fXF98Q8zYUIFwW40=
X-Google-Smtp-Source: AGHT+IGMiGpjKR5+4BJIqy4f/HlylX0MSMIi2+xFdaiFsk2sdaUrzTeLkVocsGY1gIjqCETBTBv8TQ==
X-Received: by 2002:a17:902:7489:b0:1bb:25bd:d09c with SMTP id
 h9-20020a170902748900b001bb25bdd09cmr4498991pll.1.1694257489858; 
 Sat, 09 Sep 2023 04:04:49 -0700 (PDT)
Received: from brag-vm.localdomain ([27.4.106.123])
 by smtp.gmail.com with ESMTPSA id
 j9-20020a170902da8900b001bbbbda70ccsm3017206plx.158.2023.09.09.04.04.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 09 Sep 2023 04:04:49 -0700 (PDT)
From: Bragatheswaran Manickavel <bragathemanick0908@gmail.com>
To: maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, daniel@ffwll.ch
Subject: [PATCH] drm: fix doc warnings related to drm connector
Date: Sat,  9 Sep 2023 16:33:43 +0530
Message-Id: <20230909110343.8103-1-bragathemanick0908@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Sat, 09 Sep 2023 23:39:17 +0000
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Bragatheswaran Manickavel <bragathemanick0908@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Addressing drm dp/hdmi connector related kernel documentation
warning and add more information about these values.

Signed-off-by: Bragatheswaran Manickavel <bragathemanick0908@gmail.com>
---
 drivers/gpu/drm/drm_connector.c | 2 ++
 include/drm/drm_connector.h     | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connector.c
index bf8371dc2a61..084c95785dda 100644
--- a/drivers/gpu/drm/drm_connector.c
+++ b/drivers/gpu/drm/drm_connector.c
@@ -2203,6 +2203,7 @@ static int drm_mode_create_colorspace_property(struct drm_connector *connector,
 /**
  * drm_mode_create_hdmi_colorspace_property - create hdmi colorspace property
  * @connector: connector to create the Colorspace property on.
+ * @supported_colorspaces: to get hdmi supported colorspaces.
  *
  * Called by a driver the first time it's needed, must be attached to desired
  * HDMI connectors.
@@ -2227,6 +2228,7 @@ EXPORT_SYMBOL(drm_mode_create_hdmi_colorspace_property);
 /**
  * drm_mode_create_dp_colorspace_property - create dp colorspace property
  * @connector: connector to create the Colorspace property on.
+ * @supported_colorspaces: to get dp supported colorspaces.
  *
  * Called by a driver the first time it's needed, must be attached to desired
  * DP connectors.
diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h
index d300fde6c1a4..556d66dd122c 100644
--- a/include/drm/drm_connector.h
+++ b/include/drm/drm_connector.h
@@ -498,6 +498,8 @@ enum drm_privacy_screen_status {
  *   ITU-R BT.601 colorimetry format
  *   The DP spec does not say whether this is the 525 or the 625
  *   line version.
+ * @DRM_MODE_COLORIMETRY_COUNT:
+ *   Represents the count of colorspaces.
  */
 enum drm_colorspace {
 	/* For Default case, driver will set the colorspace */
-- 
2.34.1

