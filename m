Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B0D117B5803
	for <lists+dri-devel@lfdr.de>; Mon,  2 Oct 2023 18:47:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F7A810E18D;
	Mon,  2 Oct 2023 16:47:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x534.google.com (mail-pg1-x534.google.com
 [IPv6:2607:f8b0:4864:20::534])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8762989A94
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Oct 2023 16:47:24 +0000 (UTC)
Received: by mail-pg1-x534.google.com with SMTP id
 41be03b00d2f7-578d0dcd4e1so10536849a12.2
 for <dri-devel@lists.freedesktop.org>; Mon, 02 Oct 2023 09:47:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1696265243; x=1696870043; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=L94V/mhJvOGoqUkLJuYY9jGAmQ4R2zgqjGiThhQmT9g=;
 b=OACWGBAL7Lb9YxsMq8h0eP/MQajZp2GXc7YVrFN9wifVa5j5b2D7UlXS57g3o//4tM
 qnHweQPxzlES0fh4CF9WoGaKeuiSBv9DMHZQguVLt2JMyqY/uLy6r7ukYJCHtqxSSuEm
 9SJst4kvg3JDSqI189KVsLf8pQ3QMhu/akUWAuxLxWrLTgdKA45ZG0Qj9RTXklxi0Xft
 zOrVutKjTDTJRAo3if168s66rlxZYbGVz4vKYKqK8ourPaG57cCJhbd8yA2PDLy7CSwk
 ikkGjQ5tjbO+N2dXzka8c0MXFZrBBudEp8ssbu121aaH2UkoTJ9UyuDkx7oJdHYcOOjm
 mpuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696265243; x=1696870043;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=L94V/mhJvOGoqUkLJuYY9jGAmQ4R2zgqjGiThhQmT9g=;
 b=TVt2ulaUPaHfqkjL+DF2tmZWIJC4LqKM1wZ6PEgLbEhx1yizxiKgNDAPoRHyWf+UmL
 e0pMtQeYjZVWZxoPk6TtCEcMn7MxBoAjkFliVm9XOpDfkz0+AuNt6urNhxYqEV1M/ktT
 RPpusb64ns0Dq77zCnrg29Qstp7eRFyL/EpTkR73YB2fwqnAasKseDI9Ub6dinlcbQZh
 oCXUCqmMA171yxrnMpHai4liqr/uRtIkfgY3dBbvyV3ZmEirWQ5+jsAKE1HWtZOBmWcC
 5zHRGj1sVDtyCPfR5ao6MMy+VeHeU2Q5JCJImZiIGE7fzioQRI894MVarjtndzab2F1S
 Ketw==
X-Gm-Message-State: AOJu0YzMjN4jRwq+2dLohbaYW6q9/WlDB7+w7xLpmypAxJ31LO6XYjVt
 rNdaaWyKZ2bR0XxanZ8k+z4ximiV1brC2A==
X-Google-Smtp-Source: AGHT+IFMF9AwNXuXqclSP10HCKrHjq9ZIAqXU0my9R8SvXNzWzu15JV4oNo5krndhcPJOsDXG7B+FA==
X-Received: by 2002:a05:6a20:12cc:b0:138:836c:5370 with SMTP id
 v12-20020a056a2012cc00b00138836c5370mr12239506pzg.42.1696265243101; 
 Mon, 02 Oct 2023 09:47:23 -0700 (PDT)
Received: from localhost ([2a00:79e1:abd:4a00:6c80:7c10:75a0:44f4])
 by smtp.gmail.com with ESMTPSA id
 w12-20020a170902e88c00b001c55e13bf39sm22113356plg.275.2023.10.02.09.47.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Oct 2023 09:47:22 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/ci: Enable CONFIG_BACKLIGHT_CLASS_DEVICE
Date: Mon,  2 Oct 2023 09:47:14 -0700
Message-ID: <20231002164715.157298-1-robdclark@gmail.com>
X-Mailer: git-send-email 2.41.0
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
Cc: Rob Clark <robdclark@chromium.org>, Emma Anholt <emma@anholt.net>,
 open list <linux-kernel@vger.kernel.org>,
 Helen Koike <helen.koike@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

Dependency for CONFIG_DRM_PANEL_EDP.  Missing this was causing the drm
driver to not probe on devices that use panel-edp.

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/ci/arm.config   | 1 +
 drivers/gpu/drm/ci/arm64.config | 1 +
 2 files changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/ci/arm.config b/drivers/gpu/drm/ci/arm.config
index 871f4de063ad..411e814819a8 100644
--- a/drivers/gpu/drm/ci/arm.config
+++ b/drivers/gpu/drm/ci/arm.config
@@ -24,6 +24,7 @@ CONFIG_DRM_LIMA=y
 CONFIG_DRM_PANEL_SIMPLE=y
 CONFIG_PWM_CROS_EC=y
 CONFIG_BACKLIGHT_PWM=y
+CONFIG_BACKLIGHT_CLASS_DEVICE=y
 
 CONFIG_ROCKCHIP_CDN_DP=n
 
diff --git a/drivers/gpu/drm/ci/arm64.config b/drivers/gpu/drm/ci/arm64.config
index 817e18ddfd4f..45f9deb7c4f6 100644
--- a/drivers/gpu/drm/ci/arm64.config
+++ b/drivers/gpu/drm/ci/arm64.config
@@ -26,6 +26,7 @@ CONFIG_DRM_ETNAVIV=y
 CONFIG_DRM_I2C_ADV7511=y
 CONFIG_PWM_CROS_EC=y
 CONFIG_BACKLIGHT_PWM=y
+CONFIG_BACKLIGHT_CLASS_DEVICE=y
 
 CONFIG_ROCKCHIP_CDN_DP=n
 
-- 
2.41.0

