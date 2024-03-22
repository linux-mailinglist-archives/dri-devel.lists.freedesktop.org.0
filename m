Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E088D886BCA
	for <lists+dri-devel@lfdr.de>; Fri, 22 Mar 2024 13:04:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CFCC710F2EF;
	Fri, 22 Mar 2024 12:03:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="awzs2hWj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 40B2B10F2EF
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Mar 2024 12:03:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1711109035;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=qjVNM+N6vHW7yu8X+nopnyxaDmuWWC6+2Zu6VxEemAk=;
 b=awzs2hWjni2+UeAKztiF2jvD/yN+AFGfisX4R/V3iDIkDdKwEMrdbT9jE5DLQJU02aLHxQ
 jAtrO1ls18OatNwmg3oKH2KsdDXCs6Qt6jEGJ7mPsuNRvdjXVy8/Kz+4/ZXBjkXgAJynma
 bpV5sYIdKxskp3CeMA7pyHDQqVnkQ1k=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-382-WxZOw1vcO6mN_HlCRnGmiQ-1; Fri, 22 Mar 2024 08:03:52 -0400
X-MC-Unique: WxZOw1vcO6mN_HlCRnGmiQ-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A752C8007A1;
 Fri, 22 Mar 2024 12:03:51 +0000 (UTC)
Received: from kaapi.redhat.com (unknown [10.67.24.5])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id ADEEA492BD0;
 Fri, 22 Mar 2024 12:03:48 +0000 (UTC)
From: Prasad Pandit <ppandit@redhat.com>
To: Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>,
 dri-devel@lists.freedesktop.org, Prasad Pandit <pjp@fedoraproject.org>
Subject: [PATCH] drm/panel: replace utf multiply with an ascii x
Date: Fri, 22 Mar 2024 17:33:36 +0530
Message-ID: <20240322120339.1802922-1-ppandit@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.10
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
Signed-off-by: Prasad Pandit <pjp@fedoraproject.org>
---
 drivers/gpu/drm/panel/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/panel/Kconfig b/drivers/gpu/drm/panel/Kconfig
index 8f3783742208..e3970dee089f 100644
--- a/drivers/gpu/drm/panel/Kconfig
+++ b/drivers/gpu/drm/panel/Kconfig
@@ -270,7 +270,7 @@ config DRM_PANEL_JDI_LPM102A188A
 	help
 	  Say Y here if you want to enable support for JDI LPM102A188A DSI
 	  command mode panel as found in Google Pixel C devices.
-	  The panel has a 2560×1800 resolution. It provides a MIPI DSI interface
+	  The panel has a 2560x1800 resolution. It provides a MIPI DSI interface
 	  to the host.
 
 config DRM_PANEL_JDI_R63452
-- 
2.44.0

