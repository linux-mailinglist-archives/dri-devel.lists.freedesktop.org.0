Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E53037982DD
	for <lists+dri-devel@lfdr.de>; Fri,  8 Sep 2023 08:56:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7665A10E874;
	Fri,  8 Sep 2023 06:56:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 152C510E1F5
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Sep 2023 20:47:46 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-31427ddd3fbso275006f8f.0
 for <dri-devel@lists.freedesktop.org>; Wed, 06 Sep 2023 13:47:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1694033264; x=1694638064; darn=lists.freedesktop.org;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:from:to:cc:subject:date:message-id:reply-to;
 bh=D4jlIvIDeaXZH3yZfiNk5m0ga1T9VUdf6C+njdswpE4=;
 b=WrZvN1I8WiD2o/vTNdZwf6IjpFO6Ua/OijLhK5XlqUDtiGs/X7DftQMyPBvBL/gZ4M
 kZvqpypeh5XZzTFkNJGlwG4AhrhYZkbuxOq8Ixax4+LiwV8r15TYFOTQBePShcluXRjD
 SHXuKaMv0ifn0EYzUky+B0eFWdMK2r9VrJBcHDd/oBNk2n0bqENFOB4mvUV80Ua6SA5/
 dYQ9tG/xSPLWLNf6tL2zcYl7IYIvCW4SYkU4GkOGI0OWBs7lRi+NJ/7OVl8GwIcNvo8I
 QypkQXNNx+T9N+hQlXDTJJQbUAEfSA/v+m8um3tGYHaQYp0Yg4crfT+cAUNj5a7yX9nU
 PQ1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1694033264; x=1694638064;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=D4jlIvIDeaXZH3yZfiNk5m0ga1T9VUdf6C+njdswpE4=;
 b=WldnveR4rDT91dYgjsyLati4RhElP+4gOrh89LL83heSj0w7UCBGxTC8U2NOSutOPC
 Lscc1aBxlHR79JdYLwwxfGBejipjITMqfK0kwgrqC4n/uk7XLsRV+RZpymsq9GJRcP7f
 zXepX01L0KZQHgf3yW+vmVJk0njts8dvEMv6EeM3IRIu/dXP1ROGts9HQ/9sAyNelJA4
 iQ6Y2f9+5ZE9r1mNnnu2/0kqdml57vKEEOcF4tN1tPg4gk5+KTwz41+TRT7VSrR4aqOd
 xiTlukN7tORegWEToD3Fst8RyMr8lTV9F5qYYxu541e7FfVD4ZIJBUDIQqtPo5S2DdmY
 selw==
X-Gm-Message-State: AOJu0YzB1W3Rg4tsM0dxxwA/jHqhFoYM7+kT1NsiIkkN6D7MRifrV0SZ
 n+N1k+MGnmR5XF9wjSkF730=
X-Google-Smtp-Source: AGHT+IF7eUkudv66fqfLlLjtyNNiG6JQMgxBmO32E3vDLPepUMSE/q8koGt9Nl6iS3YTPaoj8kEAXw==
X-Received: by 2002:a5d:63c6:0:b0:317:cff4:7357 with SMTP id
 c6-20020a5d63c6000000b00317cff47357mr2946013wrw.20.1694033264117; 
 Wed, 06 Sep 2023 13:47:44 -0700 (PDT)
Received: from [127.0.1.1]
 (2a02-8389-41b4-ce80-82c3-f600-375e-54bc.cable.dynamic.v6.surfer.at.
 [2a02:8389:41b4:ce80:82c3:f600:375e:54bc])
 by smtp.gmail.com with ESMTPSA id
 qx12-20020a170906fccc00b0099bd86f9248sm9436357ejb.63.2023.09.06.13.47.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Sep 2023 13:47:43 -0700 (PDT)
From: Javier Carrasco <javier.carrasco.cruz@gmail.com>
Date: Wed, 06 Sep 2023 22:47:38 +0200
Subject: [PATCH v2] drm/connector: document DRM_MODE_COLORIMETRY_COUNT
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230906-topic-drm_connector_doc-v2-1-1f2dcaa43269@gmail.com>
X-B4-Tracking: v=1; b=H4sIAGnl+GQC/4WOTQqDMBCFryJZNyWJ1tKuvEcRGSejDjSJJCIt4
 t0bvUCX33u8n00kikxJPItNRFo5cfAZzKUQOIEfSbLNLIwypXqoWi5hZpQ2ug6D94RLiJ0NKCt
 jgcoeqhJrkdM9JJJ9BI/TkXeQFoqHMUca+HNOvtrME6fc8T0frPpQ/4+tWmo5VEh3sErfFDajA
 35fMTjR7vv+A22rvM/XAAAA
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
X-Mailer: b4 0.12.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1694033262; l=1646;
 i=javier.carrasco.cruz@gmail.com; s=20230509; h=from:subject:message-id;
 bh=o5qS1h6uUEp6//p2GmoMRuubQDfqtXUZ8Ml+N/bqDuM=;
 b=k9PO34nKBp4BwltnWawdEi4BfIAah1NuWMA5YaSxvnjgCPuh+ogfqzZtlxeuCEANF2t+ZZg8y
 377FvdZ3L9EDnBDweM0Kw97xs/YwtiNL1u+QBbmMpNAQpyePicJ29j2
X-Developer-Key: i=javier.carrasco.cruz@gmail.com; a=ed25519;
 pk=tIGJV7M+tCizagNijF0eGMBGcOsPD+0cWGfKjl4h6K8=
X-Mailman-Approved-At: Fri, 08 Sep 2023 06:56:24 +0000
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
Cc: Javier Carrasco <javier.carrasco.cruz@gmail.com>,
 Randy Dunlap <rdunlap@infradead.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The drm_colorspace enum member DRM_MODE_COLORIMETRY_COUNT has been
properly documented by moving the description out of the enum to the
member description list to get rid of an additional warning and improve
documentation clarity.

Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>
Reviewed-by: Randy Dunlap <rdunlap@infradead.org>
---
Changes in v2:
- Remove applied changes in linux-next (supported_colorspaces
  documentation)
- Link to v1: https://lore.kernel.org/r/20230906-topic-drm_connector_doc-v1-1-f4ce7ad0150c@gmail.com
---
 include/drm/drm_connector.h | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h
index d300fde6c1a4..18cf46e3478b 100644
--- a/include/drm/drm_connector.h
+++ b/include/drm/drm_connector.h
@@ -498,6 +498,8 @@ enum drm_privacy_screen_status {
  *   ITU-R BT.601 colorimetry format
  *   The DP spec does not say whether this is the 525 or the 625
  *   line version.
+ * @DRM_MODE_COLORIMETRY_COUNT:
+ *   Not a valid value; merely used four counting
  */
 enum drm_colorspace {
 	/* For Default case, driver will set the colorspace */
@@ -522,7 +524,6 @@ enum drm_colorspace {
 	DRM_MODE_COLORIMETRY_RGB_WIDE_FIXED	= 13,
 	DRM_MODE_COLORIMETRY_RGB_WIDE_FLOAT	= 14,
 	DRM_MODE_COLORIMETRY_BT601_YCC		= 15,
-	/* not a valid value; merely used for counting */
 	DRM_MODE_COLORIMETRY_COUNT
 };
 

---
base-commit: 65d6e954e37872fd9afb5ef3fc0481bb3c2f20f4
change-id: 20230906-topic-drm_connector_doc-42dae3ba43c6

Best regards,
-- 
Javier Carrasco <javier.carrasco.cruz@gmail.com>

