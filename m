Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 892D2CE844F
	for <lists+dri-devel@lfdr.de>; Mon, 29 Dec 2025 23:05:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DFDA110E739;
	Mon, 29 Dec 2025 22:05:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=broadcom.com header.i=@broadcom.com header.b="FYTEkrvW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-f97.google.com (mail-qv1-f97.google.com
 [209.85.219.97])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 340C510E739
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Dec 2025 22:05:33 +0000 (UTC)
Received: by mail-qv1-f97.google.com with SMTP id
 6a1803df08f44-8888a444300so102324676d6.1
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Dec 2025 14:05:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767045932; x=1767650732;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=huMey1yvlTcl9trBYSLi6aENqnLSe9ecqic2n3VA9bs=;
 b=HjndeFn5LFLqQ6lx9FbCBfLiHv2a6pe8DaXQw2Y77J6SgTvOsRAnkEwALeEpTVeGmV
 d29vxZkuDYINE07Z37T1L4DM3WG4xNyPUx3kQYYugKh9DCYQbUTohdCDcMi+WuB+LE92
 7n2m/oplHM+gTaKJpdfB8E7zWyytb81Dzwovlc+8NlhnqLmyVhF9XppEVbJMCdU7ANMB
 PGIImrGgH6gG29bM/Y7xF/Z8wznmkGt8xcJDn05vX5gQOvSWj4XImdJLACkja2b9Izs/
 OfwwoNhLu1fXAf7l/acjuVzIo1zChBT0PaWQBhYySJl5ZAENZTRHHlCTm39Z6fEqcSQd
 yhnQ==
X-Gm-Message-State: AOJu0Yxkj+F2/qFRQZcaMcNXngx63Pv6cwRae7zrDK2vtHNTZ2MwncBY
 eevySDYZ8fLsWe7THGwCmPC76AuAl2PBHadPD+pYlDdGuZsvNkD2v1dBYLqV1PBUlPQVBAdum37
 R/RhGyf54igu07W6gml0H/51GuViWojDNOLgL67sqg41pFdRRx3E4r00KJ5L4d7N3ENMToDynUe
 SntMm3uC/g0Eww815y8AKRoPpak/Mhiup2RsmjSdG6uhCwzEvSRgfb9Ukxgl9FXndqUk+Z+vmZy
 sLRbE1sKx2stGdd6/ZZ
X-Gm-Gg: AY/fxX62vQ8BS02ReF/iz34gOX3Si+qvyR8upCT53vh6jW/SkX1hLEvQ10Hgn+4/mA+
 cQ2WV3GiAc0IrYwX2J5HApRx9VZR2Wj79/aBVtlRlt3FSK2Bmm66HTUTnj5uMwNThPojTDEEv8o
 c9wlJo+Sgw3VGZ7NFH3e/juFcvvsuwbkl7LjEmmThFhogvdgdT8sMYEPbwiHYsN6q7AiDI+hkZs
 ILnHFpNS4llB04T8K2QX6L8RUWZ0+9o2hDb7kOM8ytN5aTSF+sPJAfJTwCz/Jxh3VZ/l5iIM+BQ
 CSqhZQ1k7GjyLBRbP89mkyyLgOlj9YO8X/YEN+MgaFmy9B40muhtC9ksGirFjLRtfv8QX0fIRra
 sq664e4KSN6AV7A6sIFmvfnUu9/lQGaM3xSp5QJVgtNXq0naLdC0z4N0oQmSMqAPpLBM5jvr4bu
 +AEe7BLr8T61SBJgzWS9nVKo+LhOpdHAXJshB8Y0pdVih3
X-Google-Smtp-Source: AGHT+IGsLd9mn+YAqq47qhVaPQhAtnyPx0NQeTgcHvqbzWfEcUHEkt3cwj5crYYiE4H2Awzd5m+I9jc6NPa9
X-Received: by 2002:a05:6214:62e:b0:880:4eac:8689 with SMTP id
 6a1803df08f44-8901a046480mr112171366d6.57.1767045932235; 
 Mon, 29 Dec 2025 14:05:32 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com
 (address-144-49-247-101.dlp.protect.broadcom.com. [144.49.247.101])
 by smtp-relay.gmail.com with ESMTPS id
 6a1803df08f44-88d950c2d3asm42291326d6.7.2025.12.29.14.05.31
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 29 Dec 2025 14:05:32 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qt1-f198.google.com with SMTP id
 d75a77b69052e-4f1d60f037bso210607961cf.0
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Dec 2025 14:05:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=broadcom.com; s=google; t=1767045930; x=1767650730;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=huMey1yvlTcl9trBYSLi6aENqnLSe9ecqic2n3VA9bs=;
 b=FYTEkrvWxKPA8IQLtAmzKlBlSDHJfrn8MBRHfNa5lPYLQC9nK8caOXwv1yChH9/cCB
 wKUXo0Y2iwq6OArQh7mPYY9S6U/yjgPDsExu+FnjZGMUsH4G73yU9YczxnyV/ohfx0Ms
 a9qmobTmb7uCx+q8lWK7+OEbgmJDe4vkxseXc=
X-Received: by 2002:a05:622a:120e:b0:4ed:1bba:f935 with SMTP id
 d75a77b69052e-4f4abdb2f22mr498101481cf.57.1767045572464; 
 Mon, 29 Dec 2025 13:59:32 -0800 (PST)
X-Received: by 2002:a05:622a:120e:b0:4ed:1bba:f935 with SMTP id
 d75a77b69052e-4f4abdb2f22mr498101101cf.57.1767045571961; 
 Mon, 29 Dec 2025 13:59:31 -0800 (PST)
Received: from localhost.localdomain
 (pool-173-49-113-140.phlapa.fios.verizon.net. [173.49.113.140])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-88d9759f164sm231530026d6.24.2025.12.29.13.59.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Dec 2025 13:59:29 -0800 (PST)
From: Zack Rusin <zack.rusin@broadcom.com>
To: dri-devel@lists.freedesktop.org
Cc: Dave Airlie <airlied@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, virtualization@lists.linux.dev,
 spice-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH 07/12] drm/qxl: Use devm aperture helpers for sysfb restore on
 probe failure
Date: Mon, 29 Dec 2025 16:58:13 -0500
Message-ID: <20251229215906.3688205-8-zack.rusin@broadcom.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20251229215906.3688205-1-zack.rusin@broadcom.com>
References: <20251229215906.3688205-1-zack.rusin@broadcom.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
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

Use devm_aperture_remove_conflicting_pci_devices() instead of the
non-devm variant to automatically restore the system framebuffer
(efifb/simpledrm) if the driver's probe fails after removing the
firmware framebuffer.

Call devm_aperture_remove_conflicting_pci_devices_done() after
successful probe to cancel the automatic restore, as the driver
is now responsible for display output.

This ensures users don't lose display output if the qxl driver
fails to probe after removing the firmware framebuffer.

Signed-off-by: Zack Rusin <zack.rusin@broadcom.com>
Cc: Dave Airlie <airlied@redhat.com>
Cc: Gerd Hoffmann <kraxel@redhat.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: David Airlie <airlied@gmail.com>
Cc: Simona Vetter <simona@ffwll.ch>
Cc: virtualization@lists.linux.dev
Cc: spice-devel@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org
Cc: linux-kernel@vger.kernel.org
---
 drivers/gpu/drm/qxl/qxl_drv.c | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/qxl/qxl_drv.c b/drivers/gpu/drm/qxl/qxl_drv.c
index 2bbb1168a3ff..ca4c817fd611 100644
--- a/drivers/gpu/drm/qxl/qxl_drv.c
+++ b/drivers/gpu/drm/qxl/qxl_drv.c
@@ -93,7 +93,12 @@ qxl_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 	if (ret)
 		return ret;
 
-	ret = aperture_remove_conflicting_pci_devices(pdev, qxl_driver.name);
+	/*
+	 * Use devm variant to automatically restore sysfb if probe fails.
+	 * This ensures the user doesn't lose display if our probe fails
+	 * after removing the firmware framebuffer (efifb/simpledrm).
+	 */
+	ret = devm_aperture_remove_conflicting_pci_devices(pdev, qxl_driver.name);
 	if (ret)
 		goto disable_pci;
 
@@ -121,6 +126,13 @@ qxl_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 		goto modeset_cleanup;
 
 	drm_client_setup(&qdev->ddev, NULL);
+
+	/*
+	 * Probe succeeded - cancel the automatic sysfb restore action.
+	 * We're now responsible for display output.
+	 */
+	devm_aperture_remove_conflicting_pci_devices_done(pdev);
+
 	return 0;
 
 modeset_cleanup:
-- 
2.48.1

