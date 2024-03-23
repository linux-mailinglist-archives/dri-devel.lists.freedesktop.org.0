Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AAA888776F
	for <lists+dri-devel@lfdr.de>; Sat, 23 Mar 2024 08:39:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A48210F420;
	Sat, 23 Mar 2024 07:39:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="Rede/TNO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 540C410F420
 for <dri-devel@lists.freedesktop.org>; Sat, 23 Mar 2024 07:39:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1711179578;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=uSnW75/sflA5JYd7AUg0Bg4XtL4/dCTPrn3kzQg0AO4=;
 b=Rede/TNOYrKI1y9GoY1ucoJkUL5Dm3e17v0m/uQjIgJNxWe8tIW4cet3mNqkci5wdCp3D/
 6csVUA4fockdCOYe5Tusl+9dNa/9qLtCV6cVoNQK0zdNVlJQvwQeFWPyEZJvypZDCOj9lr
 yl7k+n4XoZKueaD9hOlV37NoJInvK+U=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-15-3Iv0Y5ltOrutEv9ncqrSEw-1; Sat, 23 Mar 2024 03:39:35 -0400
X-MC-Unique: 3Iv0Y5ltOrutEv9ncqrSEw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 48C7C101A56C;
 Sat, 23 Mar 2024 07:39:35 +0000 (UTC)
Received: from kaapi.redhat.com (unknown [10.67.24.5])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id F0EF61C060A4;
 Sat, 23 Mar 2024 07:39:31 +0000 (UTC)
From: Prasad Pandit <ppandit@redhat.com>
To: Jessica Zhang <quic_jesszhan@quicinc.com>
Cc: diogo.ivo@tecnico.ulisboa.pt, neil.armstrong@linaro.org, sam@ravnborg.org,
 dri-devel@lists.freedesktop.org, Prasad Pandit <pjp@fedoraproject.org>
Subject: [PATCH v1] drm/panel: replace utf multiply with an ascii x
Date: Sat, 23 Mar 2024 13:09:20 +0530
Message-ID: <20240323073923.1824802-1-ppandit@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.7
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Prasad Pandit <pjp@fedoraproject.org>

Replace unicode multiplication character with an ascii x.
It helps Kconfig parsers to read file without error.

Fixes: 25205087df1f ("drm/panel: Add driver for JDI LPM102A188A")
Fixes: c96f566273bf ("drm/panel: Add JDI LT070ME05000 WUXGA DSI Panel")
Fixes: cf40c6600592 ("drm: panel: add TDO tl070wsh30 panel driver")
Signed-off-by: Prasad Pandit <pjp@fedoraproject.org>
---
 drivers/gpu/drm/panel/Kconfig | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

v1:
 - Fix other similar occurrences of utf multiply
v0:
 - https://lore.kernel.org/dri-devel/1e546c01-1126-45c8-9104-14e769dedb8b@quicinc.com/T/#t

diff --git a/drivers/gpu/drm/panel/Kconfig b/drivers/gpu/drm/panel/Kconfig
index 8f3783742208..40a021ee91c3 100644
--- a/drivers/gpu/drm/panel/Kconfig
+++ b/drivers/gpu/drm/panel/Kconfig
@@ -259,7 +259,7 @@ config DRM_PANEL_JDI_LT070ME05000
 	help
 	  Say Y here if you want to enable support for JDI DSI video mode
 	  panel as found in Google Nexus 7 (2013) devices.
-	  The panel has a 1200(RGB)×1920 (WUXGA) resolution and uses
+	  The panel has a 1200(RGB)x1920 (WUXGA) resolution and uses
 	  24 bit per pixel.
 
 config DRM_PANEL_JDI_LPM102A188A
@@ -270,7 +270,7 @@ config DRM_PANEL_JDI_LPM102A188A
 	help
 	  Say Y here if you want to enable support for JDI LPM102A188A DSI
 	  command mode panel as found in Google Pixel C devices.
-	  The panel has a 2560×1800 resolution. It provides a MIPI DSI interface
+	  The panel has a 2560x1800 resolution. It provides a MIPI DSI interface
 	  to the host.
 
 config DRM_PANEL_JDI_R63452
@@ -801,7 +801,7 @@ config DRM_PANEL_TDO_TL070WSH30
 	depends on BACKLIGHT_CLASS_DEVICE
 	help
 	  Say Y here if you want to enable support for TDO TL070WSH30 TFT-LCD
-	  panel module. The panel has a 1024×600 resolution and uses
+	  panel module. The panel has a 1024x600 resolution and uses
 	  24 bit RGB per pixel. It provides a MIPI DSI interface to
 	  the host, a built-in LED backlight and touch controller.
 
-- 
2.44.0

