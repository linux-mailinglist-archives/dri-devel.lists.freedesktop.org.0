Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A9823912C3
	for <lists+dri-devel@lfdr.de>; Wed, 26 May 2021 10:48:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C8FD6EC3A;
	Wed, 26 May 2021 08:47:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 251906EC36
 for <dri-devel@lists.freedesktop.org>; Wed, 26 May 2021 08:47:46 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id
 l18-20020a1ced120000b029014c1adff1edso15016841wmh.4
 for <dri-devel@lists.freedesktop.org>; Wed, 26 May 2021 01:47:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=y4rHhgO5kc8Uj3Lmp2tl7QIeeh0JqKynJlHlJf9HHsE=;
 b=pTKy7PwPYMsEXaJH7oJfEPlkKYTVzDOWLgysWs0lli66m1+1b9YZwKwKje1Y0AtAwS
 ua2YswIkDmK/6J5vymRUjqigKGrVmrx1BBlzlFjv1w9naTfx2iR2TVZvavFrVVgYj2NF
 p3wpU4dx+LyBifeZLRvnkkS3jlHEkeOyv9wKC7pAsi1jNzzzbH2kaflP0eULkRGHPwrO
 hWM5uSFAKWo+b7Eond1ho04GldbKOIP/ayNZubYoU4QXrOwHTY19FMoigoAk1nAwrm58
 JyiyOEjN+aAU0GiufMh6JFioygCs2IAbnM/T1taDb/VmHq2IfD4ZiKnC55QdQgE+YrrT
 8wdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=y4rHhgO5kc8Uj3Lmp2tl7QIeeh0JqKynJlHlJf9HHsE=;
 b=bUa8jeGJH4XDaadGdt+us3ktmns+1aAAm7U9EsquBnvJ5ehTslfjSuPlVzV7BmxVyE
 DPtA64vURI2P8SUqAAacmcSmXTTOqLoKnafkb//vZWSq6MX8MshV+zf70iXuoUmryr2+
 9GvbJI86zk+8K+h8GwOZkauPF5QU42/Qw2WvqEIRzp1aspA7XRiniNMj45wD1w0Xw8dx
 wtm8w/EF+pV0rUyj7sKuw1uFi+tzBaYYyFB+7j/erJPBM+Sl8MyBqZf7/LRPen/08FzY
 V9jYH0Cn7XJvHLJDpPxYjTkWIye5vM0RU7wkjn9tHlkbZUpK43G+yODAs8QxzT10wfPS
 GO0g==
X-Gm-Message-State: AOAM532H/Q1y8ulrpwf3A0x5gmbK3AnsmPH1ZolaLugBiOeHrMJaePRb
 pE+G8+/PLrjncru3w04xLbnf4A==
X-Google-Smtp-Source: ABdhPJwmWlATieeB+cyUTNVhAlZSX2mheWuMR+R5VDc+yQmXYSlx5mLFXqmUAz2zy0vAKuMkWpotOw==
X-Received: by 2002:a05:600c:896:: with SMTP id
 l22mr28149778wmp.164.1622018864815; 
 Wed, 26 May 2021 01:47:44 -0700 (PDT)
Received: from dell.default ([91.110.221.223])
 by smtp.gmail.com with ESMTPSA id l18sm18911918wrt.97.2021.05.26.01.47.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 May 2021 01:47:44 -0700 (PDT)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 14/34] drm/amd/display/dc/gpio/gpio_service: Pass around
 correct dce_{version, environment} types
Date: Wed, 26 May 2021 09:47:06 +0100
Message-Id: <20210526084726.552052-15-lee.jones@linaro.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210526084726.552052-1-lee.jones@linaro.org>
References: <20210526084726.552052-1-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: Leo Li <sunpeng.li@amd.com>, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fixes the following W=1 kernel build warning(s):

 drivers/gpu/drm/amd/amdgpu/../display/dc/gpio/gpio_service.c: In function ‘dal_gpio_service_create’:
 drivers/gpu/drm/amd/amdgpu/../display/dc/gpio/gpio_service.c:71:4: warning: implicit conversion from ‘enum dce_version’ to ‘enum dce_environment’ [-Wenum-conversion]
 drivers/gpu/drm/amd/amdgpu/../display/dc/gpio/gpio_service.c:77:4: warning: implicit conversion from ‘enum dce_version’ to ‘enum dce_environment’ [-Wenum-conversion]

Cc: Harry Wentland <harry.wentland@amd.com>
Cc: Leo Li <sunpeng.li@amd.com>
Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: "Christian König" <christian.koenig@amd.com>
Cc: David Airlie <airlied@linux.ie>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: amd-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/gpu/drm/amd/display/dc/gpio/gpio_service.c   | 12 ++++++------
 .../drm/amd/display/include/gpio_service_interface.h |  4 ++--
 2 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/gpio/gpio_service.c b/drivers/gpu/drm/amd/display/dc/gpio/gpio_service.c
index 92280cc05e2db..dae8e489c8cf4 100644
--- a/drivers/gpu/drm/amd/display/dc/gpio/gpio_service.c
+++ b/drivers/gpu/drm/amd/display/dc/gpio/gpio_service.c
@@ -53,8 +53,8 @@
  */
 
 struct gpio_service *dal_gpio_service_create(
-	enum dce_version dce_version_major,
-	enum dce_version dce_version_minor,
+	enum dce_version dce_version,
+	enum dce_environment dce_environment,
 	struct dc_context *ctx)
 {
 	struct gpio_service *service;
@@ -67,14 +67,14 @@ struct gpio_service *dal_gpio_service_create(
 		return NULL;
 	}
 
-	if (!dal_hw_translate_init(&service->translate, dce_version_major,
-			dce_version_minor)) {
+	if (!dal_hw_translate_init(&service->translate, dce_version,
+			dce_environment)) {
 		BREAK_TO_DEBUGGER();
 		goto failure_1;
 	}
 
-	if (!dal_hw_factory_init(&service->factory, dce_version_major,
-			dce_version_minor)) {
+	if (!dal_hw_factory_init(&service->factory, dce_version,
+			dce_environment)) {
 		BREAK_TO_DEBUGGER();
 		goto failure_1;
 	}
diff --git a/drivers/gpu/drm/amd/display/include/gpio_service_interface.h b/drivers/gpu/drm/amd/display/include/gpio_service_interface.h
index 9c55d247227ea..7e3240e73c1fc 100644
--- a/drivers/gpu/drm/amd/display/include/gpio_service_interface.h
+++ b/drivers/gpu/drm/amd/display/include/gpio_service_interface.h
@@ -42,8 +42,8 @@ void dal_gpio_destroy(
 	struct gpio **ptr);
 
 struct gpio_service *dal_gpio_service_create(
-	enum dce_version dce_version_major,
-	enum dce_version dce_version_minor,
+	enum dce_version dce_version,
+	enum dce_environment dce_environment,
 	struct dc_context *ctx);
 
 struct gpio *dal_gpio_service_create_irq(
-- 
2.31.1

