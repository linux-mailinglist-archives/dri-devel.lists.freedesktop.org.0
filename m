Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BE5277982DB
	for <lists+dri-devel@lfdr.de>; Fri,  8 Sep 2023 08:56:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 09CA710E872;
	Fri,  8 Sep 2023 06:56:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [IPv6:2a00:1450:4864:20::62d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5AB5A10E6F4
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Sep 2023 18:19:33 +0000 (UTC)
Received: by mail-ej1-x62d.google.com with SMTP id
 a640c23a62f3a-9a63b2793ecso2900266b.2
 for <dri-devel@lists.freedesktop.org>; Wed, 06 Sep 2023 11:19:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1694024371; x=1694629171; darn=lists.freedesktop.org;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:from:to:cc:subject:date:message-id:reply-to;
 bh=brVuhGNSmL2KjjAtb0WsBUqLQf3d/P9cAPHdmHgOTbE=;
 b=AeZX/wvaD1+rxTcX2ZFPzaoAcdyBV1438UgwwXrMYXtA6f/+ruFxunD1vV8Te5bT7m
 kvofGqfWQTf+a/rrtRLAWGUSURi5AKEhbagYwMix/i7Ie5LfrJxstLEn1kIGu53tKQqC
 R8rirqDvoA3On1nWZDW9rdURLg1uoVK6GUYz75kpVrfGdrhVIPBq/17qWjUCY4xLNQRq
 64cKy1W+upmSNOnIaEDJuLmiliu1kbzFATj9oEszs7xAjpKEwVmMG/+NOt7nPRxqDHTS
 W5untxw+AJwKqihb1mMfLE46jeM+A47Z5Gd+98OnL8v96IJzskqAxvnqOlPHVZ1t+3w4
 uvdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1694024371; x=1694629171;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=brVuhGNSmL2KjjAtb0WsBUqLQf3d/P9cAPHdmHgOTbE=;
 b=ApyE0TYoxAhTZkBilXgRlSQF8sxAJB77F6788oteIhI79BOHcE21A81bbUxOJvCeEo
 SEMoekAQH+ziwy0oF+qs4q2Kdg3Qygw+B1oTZ9PZbQkk++NM//MvE/UL/ZkX+2WDKE2y
 3SgXy8ZoxKYI/r7yDNCJn4HNcwBGAa95HwU78Jwl4NwZfkaU05pwMIoZyRP8D/jhL7s7
 3Z1I/wPgqywMnv7CizcnzNgePriBq3RBhO6IYNBvOXeAQeqDCUJ+k1hSXqbPKXZntf8K
 F2Y+I3URcEfkmVMfIcfTbAZzyjlGk8dSHVLPlFKVgHfs61m52dfwqh+d5jgLnUYmlpNL
 c3XA==
X-Gm-Message-State: AOJu0YzY8P1j10ggK6J9IfEE8+NwiV5P4r7nB3SeW9sRr5ndiwhtw8Xv
 hxQHs1z5BDKmdACGwJnrEmF4pZicQR6rMg==
X-Google-Smtp-Source: AGHT+IHAnI889hIsnFWWcWV/k5vE0fMUU6pVi/t1v65SUwHvOj7p3j1rAwq/pOhnoXkQ72cJ0bMboA==
X-Received: by 2002:a17:906:3d2a:b0:9a1:fc90:bdf2 with SMTP id
 l10-20020a1709063d2a00b009a1fc90bdf2mr3073093ejf.21.1694024371285; 
 Wed, 06 Sep 2023 11:19:31 -0700 (PDT)
Received: from [127.0.1.1]
 (2a02-8389-41b4-ce80-82c3-f600-375e-54bc.cable.dynamic.v6.surfer.at.
 [2a02:8389:41b4:ce80:82c3:f600:375e:54bc])
 by smtp.gmail.com with ESMTPSA id
 x24-20020a170906299800b0099cadcf13cesm9350186eje.66.2023.09.06.11.19.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Sep 2023 11:19:30 -0700 (PDT)
From: Javier Carrasco <javier.carrasco.cruz@gmail.com>
Date: Wed, 06 Sep 2023 20:19:29 +0200
Subject: [PATCH] drm/connector: document supported_colorspaces and
 DRM_MODE_COLORIMETRY_COUNT
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230906-topic-drm_connector_doc-v1-1-f4ce7ad0150c@gmail.com>
X-B4-Tracking: v=1; b=H4sIALDC+GQC/x2N0QrCMAwAf2Xk2UJtx0B/RWSkaXR5WDuSIsLYv
 9v5eBzH7WCswgb3YQflj5jU0uF6GYAWLG92kjtD8CH6m59cq5uQy7rOVEthalXnXMmNISPHhGO
 kCXqd0NglxULL2a9ojfUUm/JLvv/l43kcP96JCt+CAAAA
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
X-Mailer: b4 0.12.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1694024369; l=3375;
 i=javier.carrasco.cruz@gmail.com; s=20230509; h=from:subject:message-id;
 bh=XV2PA7cr0H7sW98GKzNL+aV/eA4RnJXKRgazWsFy6y4=;
 b=kR2YgUglN1L8b1w6Fo+0crgbap4wAZhb0h4VIkqL28FUiwXAMT8DjbcdCV74jDQ9/pErwCWNP
 BwFMTJ3p9bIBMxs/GAluoYOgbhINE7F2rjKIg3dFecNfJjW/JF8tl+Q
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
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The supported_colorspaces parameter was added to the following
functions without documenting it:

drm_mode_create_dp_colorspace_property
drm_mode_create_hdmi_colorspace_property

The missing descriptions generate warnings when compiling the
documentation. Add the descriptions to document the
supported_colorspaces parameter.

The drm_colorspace enum member DRM_MODE_COLORIMETRY_COUNT has been
properly documented by moving the description out of the enum to the
member description list to get rid of an additional warning and improve
documentation clarity.

Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>
---
The supported_colorspaces parameter was added to the following
functions without documenting it:

drm_mode_create_dp_colorspace_property
drm_mode_create_hdmi_colorspace_property

The missing descriptions generate warnings when compiling the
documentation. Add the descriptions to document the
supported_colorspaces parameter.

The drm_colorspace enum member DRM_MODE_COLORIMETRY_COUNT has been
properly documented by moving the description out of the enum to the
member description list to get rid of an additional warning and improve
documentation clarity.
---
 drivers/gpu/drm/drm_connector.c | 2 ++
 include/drm/drm_connector.h     | 3 ++-
 2 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connector.c
index bf8371dc2a61..77bfe17dcf98 100644
--- a/drivers/gpu/drm/drm_connector.c
+++ b/drivers/gpu/drm/drm_connector.c
@@ -2203,6 +2203,7 @@ static int drm_mode_create_colorspace_property(struct drm_connector *connector,
 /**
  * drm_mode_create_hdmi_colorspace_property - create hdmi colorspace property
  * @connector: connector to create the Colorspace property on.
+ * @supported_colorspaces: colorspaces supported by the driver.
  *
  * Called by a driver the first time it's needed, must be attached to desired
  * HDMI connectors.
@@ -2227,6 +2228,7 @@ EXPORT_SYMBOL(drm_mode_create_hdmi_colorspace_property);
 /**
  * drm_mode_create_dp_colorspace_property - create dp colorspace property
  * @connector: connector to create the Colorspace property on.
+ * @supported_colorspaces: colorspaces supported by the driver.
  *
  * Called by a driver the first time it's needed, must be attached to desired
  * DP connectors.
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

