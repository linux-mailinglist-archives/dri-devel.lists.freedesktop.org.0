Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EB42AAD928
	for <lists+dri-devel@lfdr.de>; Wed,  7 May 2025 09:55:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 99C7410E75C;
	Wed,  7 May 2025 07:55:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="hhhWy9pX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A50810E75C
 for <dri-devel@lists.freedesktop.org>; Wed,  7 May 2025 07:55:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1746604545;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=JQX/5m+jQ3v0Hngdb0F2esP3jDYn3gk1n+QUBzrPG4A=;
 b=hhhWy9pXmeOopmi3LGm+mx3o2QZ+Mh6/EklPwsX5cIJbB+pQ+SOXEQiBXdhti/QkPsdaXR
 mfIBIJ4535ChCgRxLbGZhrWmTGn15OkPj2tVbrVviZVS/6j5EJnFGQ0j2h7g8q/hNlYYWZ
 XqYMXPsL2kckGS2ufLLruacSWV10qW8=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-283-TxKFw1hAPPmQqrYRWraNSg-1; Wed,
 07 May 2025 03:55:42 -0400
X-MC-Unique: TxKFw1hAPPmQqrYRWraNSg-1
X-Mimecast-MFC-AGG-ID: TxKFw1hAPPmQqrYRWraNSg_1746604540
Received: from mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.15])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 043D51800370; Wed,  7 May 2025 07:55:40 +0000 (UTC)
Received: from hydra.redhat.com (unknown [10.45.226.157])
 by mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id A04531953B82; Wed,  7 May 2025 07:55:35 +0000 (UTC)
From: Jocelyn Falempe <jfalempe@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, jani.nikula@linux.intel.com,
 dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org,
 linux-kernel@vger.kernel.org
Cc: Jocelyn Falempe <jfalempe@redhat.com>
Subject: [PATCH v2] MAINTAINERS: Add entries for drm_panic,
 drm_panic_qr_code and drm_log
Date: Wed,  7 May 2025 09:51:47 +0200
Message-ID: <20250507075529.263355-1-jfalempe@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.15
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

Add myself and Javier as maintainer for drm_panic, drm_panic_qr_code
and drm_log.

Signed-off-by: Jocelyn Falempe <jfalempe@redhat.com>
Acked-by: Thomas Zimmermann <tzimmermann@suse.de>
---

v2:
 * move DRM LOG to keep the entries sorted (Jani Nikula)
 
 MAINTAINERS | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 38df6b159a3b..1ecb04e0ddfd 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -8166,6 +8166,14 @@ T:	git https://gitlab.freedesktop.org/drm/misc/kernel.git
 F:	drivers/gpu/drm/scheduler/
 F:	include/drm/gpu_scheduler.h
 
+DRM LOG
+M:	Jocelyn Falempe <jfalempe@redhat.com>
+M:	Javier Martinez Canillas <javierm@redhat.com>
+L:	dri-devel@lists.freedesktop.org
+S:	Supported
+T:	git https://gitlab.freedesktop.org/drm/misc/kernel.git
+F:	drivers/gpu/drm/clients/drm_log.c
+
 DRM PANEL DRIVERS
 M:	Neil Armstrong <neil.armstrong@linaro.org>
 R:	Jessica Zhang <quic_jesszhan@quicinc.com>
@@ -8177,6 +8185,26 @@ F:	drivers/gpu/drm/drm_panel.c
 F:	drivers/gpu/drm/panel/
 F:	include/drm/drm_panel.h
 
+DRM PANIC
+M:	Jocelyn Falempe <jfalempe@redhat.com>
+M:	Javier Martinez Canillas <javierm@redhat.com>
+L:	dri-devel@lists.freedesktop.org
+S:	Supported
+T:	git https://gitlab.freedesktop.org/drm/misc/kernel.git
+F:	drivers/gpu/drm/drm_draw.c
+F:	drivers/gpu/drm/drm_draw_internal.h
+F:	drivers/gpu/drm/drm_panic*.c
+F:	include/drm/drm_panic*
+
+DRM PANIC QR CODE
+M:	Jocelyn Falempe <jfalempe@redhat.com>
+M:	Javier Martinez Canillas <javierm@redhat.com>
+L:	dri-devel@lists.freedesktop.org
+L:	rust-for-linux@vger.kernel.org
+S:	Supported
+T:	git https://gitlab.freedesktop.org/drm/misc/kernel.git
+F:	drivers/gpu/drm/drm_panic_qr.rs
+
 DRM PRIVACY-SCREEN CLASS
 M:	Hans de Goede <hdegoede@redhat.com>
 L:	dri-devel@lists.freedesktop.org

base-commit: 258aebf100540d36aba910f545d4d5ddf4ecaf0b
-- 
2.49.0

