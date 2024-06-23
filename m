Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 061C99137D5
	for <lists+dri-devel@lfdr.de>; Sun, 23 Jun 2024 07:27:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4328B10E11F;
	Sun, 23 Jun 2024 05:27:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="U+KKWXZ/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com
 [209.85.167.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4367E10E0FE
 for <dri-devel@lists.freedesktop.org>; Sun, 23 Jun 2024 05:27:41 +0000 (UTC)
Received: by mail-lf1-f41.google.com with SMTP id
 2adb3069b0e04-52cd6784aa4so2068955e87.3
 for <dri-devel@lists.freedesktop.org>; Sat, 22 Jun 2024 22:27:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1719120459; x=1719725259; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=2saQ5GQqawAS020WhizaGqzYJuR5npRpI77BdgX5gZ4=;
 b=U+KKWXZ/7O385GO3v6OiOLVhqDLxjlozoo999Wp7iO/ZvngPOb2hHDtVGNkm6T90Y0
 A3kva3kZvHNEBCblHTSexzkfoGtC1q6QItACt0LIQKCVIcsUK6wN2DSUBkPiSsEt8hD3
 NM02A8U3zAg7xKWdsrSFubJXTRRLJPgyKJuWU2Ml0SgYP925YFPKY0qkqvw6CZKQoQPf
 yh8KHz+4JF/Hwjjd3DJHJcggGh8hq/KC7Jqaj/rLwuhGdVRhBmfxFpU9OZoJFWLPgTPm
 nUyd111BhmCTWQqKV6790172hudSv4OdO0yXIyim0cDXNrz35H1y9wmTvEHjBmT2O3As
 IzDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719120459; x=1719725259;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=2saQ5GQqawAS020WhizaGqzYJuR5npRpI77BdgX5gZ4=;
 b=LB35JK4Iz1YPLtd6aMBGrIhJxWRA12rf8u5VCTuiJbDzi6y1T4+TQvZqFyGEdkaE1r
 izD+1Ojyoj0h19hF3C4SKIFchtEIRBjctRPY8B/AapFejbIUd5Psq/tGbIknvuFA0rzc
 yzkqKIkfXLYa8wChSKPc6VpEbWkR+jHLO+mJIqDobsxlFH/b3UfSlthVMauRLLjej5AZ
 XAFIAp2qk3PvQ7pv5wqNs3MKYWcmK5WtYbjrZzZlB7OapekdD9RMWvk3jpAyjJQvvOOf
 u/LnRl/cJaMwcK0HXIaC11gL9AplQcOo02vWGIHKGzcBYpm/iX40mmFuY5RD1ijEyuHD
 sSdw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVcO82UMGCXdLmQ4SF0QKG6PMbGgTwilUHEkJx8TWdH6U4+bNQX3pVHqx58M6hmOLv6Xwy+cLrrrPC9k8a+vg8wu4EBB1/gzSyBZLLMxZrH
X-Gm-Message-State: AOJu0YxG0lM8UCZC1whA+u2KA91CmiT0G9wOWqgcuSq11Td8N5fEMG9W
 E40bjtnHiwU5zkRzqXNQ6W4uiiSy+zhRfMcq1jquw1evL70fQCrUKTaAtCClqyo=
X-Google-Smtp-Source: AGHT+IEvS2WjHnwWGl92qbL6wla2qBKHSorPxz8gak6ZS8m1ZorPAlVx9duVX5y/FvHE6ocjI98IJQ==
X-Received: by 2002:ac2:58fa:0:b0:52c:d7d1:7398 with SMTP id
 2adb3069b0e04-52ce1834ef3mr598682e87.28.1719120459472; 
 Sat, 22 Jun 2024 22:27:39 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-52cd6432006sm657651e87.194.2024.06.22.22.27.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 22 Jun 2024 22:27:39 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sun, 23 Jun 2024 08:27:36 +0300
Subject: [PATCH 2/2] drm/connector: automatically set immutable flag for
 max_bpc property
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240623-drm-bridge-connector-fix-hdmi-reset-v1-2-41e9894dcdec@linaro.org>
References: <20240623-drm-bridge-connector-fix-hdmi-reset-v1-0-41e9894dcdec@linaro.org>
In-Reply-To: <20240623-drm-bridge-connector-fix-hdmi-reset-v1-0-41e9894dcdec@linaro.org>
To: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1073;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=jAaTSmJr2uiPJgpayy5rEW5crModRwCP351g8zoCUvg=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmd7JJSqaP9hqJROLabxEuECkMvF5EbVH8tieWJ
 +gvAN4NyfmJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZneySQAKCRCLPIo+Aiko
 1eyaB/9cejxrfkEBvLqrLSL5QM8CBqHaFoTUlqQi6hrhvlhVa97iyQTVZTERvScncDTQYcftfyQ
 fKRz4XD8BSrCBWnmNzOrY4/7EJ8mY7mLBf62mlwWtMOybRqWYauFmuWarB09dIzyFaBFl+J1gn6
 CskDp8bTURZEO4DaTp0oQ2cGW+GR5g97CnvsMl+brvps1zhlge9SMoxIIpLVqukMp5xFX1sjTy4
 8zvvLkqy5FKWN8nDNDkmKJhY50v2fKQiKslKHJfAJ/hxXhxCPhlX5oDiuvRKyAOrXeZ75R65bh4
 X7pT14X2i+RurM+o/28x90weuzaTjeKKdvA3UD5PQFrr69W8
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
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

With the introduction of the HDMI Connector framework the driver might
end up creating the max_bpc property with min = max = 8. IGT insists
that such properties carry the 'immutable' flag. Automatically set the
flag if the driver asks for the max_bpc property with min == max.

Fixes: aadb3e16b8f3 ("drm/connector: hdmi: Add output BPC to the connector state")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/drm_connector.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connector.c
index ab6ab7ff7ea8..0725ca74dc37 100644
--- a/drivers/gpu/drm/drm_connector.c
+++ b/drivers/gpu/drm/drm_connector.c
@@ -2610,6 +2610,11 @@ int drm_connector_attach_max_bpc_property(struct drm_connector *connector,
 
 	prop = connector->max_bpc_property;
 	if (!prop) {
+		u32 flags = 0;
+
+		if (min == max)
+			flags |= DRM_MODE_PROP_IMMUTABLE;
+
 		prop = drm_property_create_range(dev, 0, "max bpc", min, max);
 		if (!prop)
 			return -ENOMEM;

-- 
2.39.2

