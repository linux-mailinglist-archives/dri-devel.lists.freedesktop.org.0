Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A3D57E7B96
	for <lists+dri-devel@lfdr.de>; Fri, 10 Nov 2023 12:03:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6079210E64B;
	Fri, 10 Nov 2023 11:03:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com
 [IPv6:2607:f8b0:4864:20::632])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8563C10E64B
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Nov 2023 11:03:39 +0000 (UTC)
Received: by mail-pl1-x632.google.com with SMTP id
 d9443c01a7336-1cc9784dbc1so16445675ad.2
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Nov 2023 03:03:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1699614219; x=1700219019; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=AKw4O8MZEMOutKTAoJPOv7w9iVpbVz72yRMuKDaXQPE=;
 b=Cpy6rUqkBw1AQwmzz24Py7Vhvur8JKMX6t7IbaR99vqBmpOzAb5e5vzkaEJD1R0GDA
 Zu1CinV/Y5kUZvn846qKO07PgJOhAu7w11fE5sPEnViRDDvrYz914nMuiqF5iA5Jj9mI
 QI3aEUSEx69XnlgLG3YwtT0mzlKJNurDhufg/xNx4IdHk4DrbsIYOzrZhe/qKKjUxLgS
 1j0zmlxtzFv+q/hS+aUcVAKiMoaRt+caRi+naE51IA78SvqwDUxg92768N9WIQq0yHND
 xqr3nJgg6qmwhxcu/Jfj3zE10ZPjwbK4Dm6zLjAbrtoQ1JAe41OF2+3Brv+jX6jVovyu
 55MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699614219; x=1700219019;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=AKw4O8MZEMOutKTAoJPOv7w9iVpbVz72yRMuKDaXQPE=;
 b=RDQPE8EpOP471OsJzD+vpIyt+N5FvItisLox//ODz5WTwf/OVEGlzESNLkizZMKORO
 KBczYQFaiSfji85NndkbYpNBMUxDfDA0HEmhqqi/PhOi8r1nMMt3RJriV4qqo7/u1zKg
 Ix53tKSMN/tgFs36kdMhmR9VfBnIucVZejpyzChJpsK9XxXmKdM+jyLMhkrRzIzD3zJ5
 cKOL5qmN+CJA9uYAKZnDQKhAqnHr8uy0ihYewrr39gep+5w6DUNbRFRs98OYH8xFQtks
 AbgooCwcv45zP6ZDl86vdM7/LFP7mVU+Kr3ZSuJeJy911IRKK9Oh9vkmOhl+kNZGb4LZ
 YeHw==
X-Gm-Message-State: AOJu0YzdLNwEmiqq09O0N1lNa1F+bVC3B++7Pi8frz4fNk+kuCnejeOX
 Hn4a2q7u5wxJ2s4Wnay51Yk=
X-Google-Smtp-Source: AGHT+IFHwT2sbY2VJnvXIZ+EMaEwIg99+ncPmI/ey7ABQ1jF2vodiKtBR+L5R61wPWZTLgb7f/tZww==
X-Received: by 2002:a17:903:11d0:b0:1cc:50ad:58 with SMTP id
 q16-20020a17090311d000b001cc50ad0058mr7979575plh.42.1699614218952; 
 Fri, 10 Nov 2023 03:03:38 -0800 (PST)
Received: from anfanite396-Predator-PH315-51.gateway.iitmandi.ac.in
 ([14.139.34.101]) by smtp.gmail.com with ESMTPSA id
 iy18-20020a170903131200b001c5eb2c4d8csm5097631plb.160.2023.11.10.03.03.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Nov 2023 03:03:38 -0800 (PST)
From: Dipam Turkar <dipamt1729@gmail.com>
To: maarten.lankhorst@linux.intel.com
Subject: [PATCH] drm/tests: Add KUnit tests for
 drm_mode_create_dvi_i_properties()
Date: Fri, 10 Nov 2023 16:33:23 +0530
Message-Id: <20231110110323.381215-1-dipamt1729@gmail.com>
X-Mailer: git-send-email 2.34.1
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
Cc: Dipam Turkar <dipamt1729@gmail.com>, tzimmermann@suse.de,
 javierm@redhat.com, mripard@kernel.org, linux-kernel@vger.kernel.org,
 mairacanal@riseup.net, dri-devel@lists.freedesktop.org,
 arthurgrillo@riseup.net
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Introduce unit tests for the drm_mode_create_dvi_i_properties() function to ensure
the proper creation of DVI-I specific connector properties.

Signed-off-by: Dipam Turkar <dipamt1729@gmail.com>
---
 drivers/gpu/drm/tests/drm_connector_test.c | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/drivers/gpu/drm/tests/drm_connector_test.c b/drivers/gpu/drm/tests/drm_connector_test.c
index c66aa2dc8d9d..aad63839b5e5 100644
--- a/drivers/gpu/drm/tests/drm_connector_test.c
+++ b/drivers/gpu/drm/tests/drm_connector_test.c
@@ -4,6 +4,9 @@
  */
 
 #include <drm/drm_connector.h>
+#include <drm/drm_device.h>
+#include <drm/drm_drv.h>
+#include <drm/drm_kunit_helpers.h>
 
 #include <kunit/test.h>
 
@@ -58,10 +61,27 @@ static void drm_test_get_tv_mode_from_name_truncated(struct kunit *test)
 	KUNIT_EXPECT_LT(test, ret, 0);
 };
 
+static void drm_test_mode_create_dvi_i_properties(struct kunit *test)
+{
+	struct drm_device *drm;
+	struct device *dev;
+
+	dev = drm_kunit_helper_alloc_device(test);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, dev);
+
+	drm = __drm_kunit_helper_alloc_drm_device(test, dev, sizeof(*drm), 0, DRIVER_MODESET);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, drm);
+
+	KUNIT_EXPECT_EQ(test, drm_mode_create_dvi_i_properties(drm), 0);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, drm->mode_config.dvi_i_select_subconnector_property);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, drm->mode_config.dvi_i_subconnector_property);
+}
+
 static struct kunit_case drm_get_tv_mode_from_name_tests[] = {
 	KUNIT_CASE_PARAM(drm_test_get_tv_mode_from_name_valid,
 			 drm_get_tv_mode_from_name_valid_gen_params),
 	KUNIT_CASE(drm_test_get_tv_mode_from_name_truncated),
+	KUNIT_CASE(drm_test_mode_create_dvi_i_properties),
 	{ }
 };
 
-- 
2.34.1

