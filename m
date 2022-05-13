Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D53645263F3
	for <lists+dri-devel@lfdr.de>; Fri, 13 May 2022 16:26:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F30D210E87C;
	Fri, 13 May 2022 14:26:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 519E410E87C;
 Fri, 13 May 2022 14:26:01 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 7E8C5B8306E;
 Fri, 13 May 2022 14:25:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 94600C34100;
 Fri, 13 May 2022 14:25:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1652451957;
 bh=5TQdR9CfD/pFNVGjxcqLRAGHcY/q8Rinz6NZhij5HSw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=ga8+prMOVvKBLYpaOONtxdP9eDAlopCwtHRziEGZ9vyEkKNc/VaMygOGzEyXxyeY8
 tJyj8g9GGGdTPxKWcvkw/EvMyFh4oF5iMw4Qg7pLdC0MhsiI78cN1lbe60X58iWgrf
 uCD9xkRuvQitZFq0XBMkpenGdVnJL/f/4owBDRxE=
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 4.19 03/15] drm/amd/display/dc/gpio/gpio_service: Pass around
 correct dce_{version, environment} types
Date: Fri, 13 May 2022 16:23:25 +0200
Message-Id: <20220513142227.998453147@linuxfoundation.org>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220513142227.897535454@linuxfoundation.org>
References: <20220513142227.897535454@linuxfoundation.org>
User-Agent: quilt/0.66
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
Cc: Leo Li <sunpeng.li@amd.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 dri-devel@lists.freedesktop.org, stable@vger.kernel.org,
 Nathan Chancellor <nathan@kernel.org>, David Airlie <airlied@linux.ie>,
 amd-gfx@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 Lee Jones <lee.jones@linaro.org>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Lee Jones <lee.jones@linaro.org>

commit 353f7f3a9dd5fd2833b6462bac89ec1654c9c3aa upstream.

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
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Cc: Nathan Chancellor <nathan@kernel.org>
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 drivers/gpu/drm/amd/display/dc/gpio/gpio_service.c           |   12 +++++------
 drivers/gpu/drm/amd/display/include/gpio_service_interface.h |    4 +--
 2 files changed, 8 insertions(+), 8 deletions(-)

--- a/drivers/gpu/drm/amd/display/dc/gpio/gpio_service.c
+++ b/drivers/gpu/drm/amd/display/dc/gpio/gpio_service.c
@@ -51,8 +51,8 @@
  */
 
 struct gpio_service *dal_gpio_service_create(
-	enum dce_version dce_version_major,
-	enum dce_version dce_version_minor,
+	enum dce_version dce_version,
+	enum dce_environment dce_environment,
 	struct dc_context *ctx)
 {
 	struct gpio_service *service;
@@ -66,14 +66,14 @@ struct gpio_service *dal_gpio_service_cr
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


