Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 83C70CE83FF
	for <lists+dri-devel@lfdr.de>; Mon, 29 Dec 2025 22:59:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C6E5410E73F;
	Mon, 29 Dec 2025 21:59:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=broadcom.com header.i=@broadcom.com header.b="Vu+2SDlJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vk1-f228.google.com (mail-vk1-f228.google.com
 [209.85.221.228])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C4E8C10E73B
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Dec 2025 21:59:47 +0000 (UTC)
Received: by mail-vk1-f228.google.com with SMTP id
 71dfb90a1353d-55b302b8369so7793398e0c.0
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Dec 2025 13:59:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767045587; x=1767650387;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=IB8+29ViFF3HgSBOU+iv2rB43ubUg7MMKbsWRsTRATY=;
 b=Xcr2axSYLxYbjZj0lZ0cTxnh03BMJNIbW4vWfLwoebp+VLjQtd1WvF356mF9Vp88ti
 UlVdDuA+4nLoFClszHxkewyRqTTp/1z0SD0bQgb09lvvJm/KDljlhHVFEBqX+B5yHwaf
 oWGHGM4wo1yf+j4euWEAKA1fIs1obOjfqZP9MyV/CrlL3adoDOLdo4WZCTpRopqz0Heu
 IL694WIZ2lNbocMzagf/b2e9ZUkYfzci6dpahK/NfdJ8hcVDXGmNolsNgonNbUQqnvis
 CF6UDX9pTicG22PEHaLb59ZgWSY2mMiR64XTQjPS98HsQk+DrrcxM7kHsrD193XsL5Om
 jdcw==
X-Gm-Message-State: AOJu0YyTWpt15Y2TLLIuzM5gSm4vVss5/kWg8BZ4t4qpPcewcSrlmvoC
 v5pwrUMEJandPjOmaLn8kssZ1p/iGlFR7yyZaoOI0uMoO+rvbduBLA2zRuE41wtkuz2g9WAVn2S
 vwKwEJc9UmZWZbQyp6vgrRbDQDv3wora8c1CvmsTUACqU7/1Atoy9A2/H2gNZGaB9L9MCYPLQTZ
 j0CgoA6nksaQTPY9VcD6ChEPEMzkoUO5Ej7ZGBKyxvcssofYB2144Efo+Da/YjI73uIqyWLVHDI
 9MDdQihGzyDCmcG4cYr
X-Gm-Gg: AY/fxX74ASV8OBm+1UjPuyZA6XGr4rByx6SqFyRjuMgP0pKpQ4wEGS12wCTt0Qihhvt
 FE9qFZoogdPwhvTKypf7QKJwCOVGBhZb+ZFZyoi0EOUeODk/BQ7hGj7O1LU98j6Yr1hnL8LCsGy
 5o/pt5dKaEc1uD9oKBVe37H/PEloIsOyWTbICo9IM66tvYnXE7Wm31vyr63lZ+p8y8UJeFZRYgu
 Ce4OEup3dWea8MGJ7897tklg9Ssbwaqp3zyivB5P6ugPraqsu7esH42VvECLSScTVSPucGB3Rkh
 ioTSx2SM3vbu9CWsNzZm5oy6S5NHQai/DQyfGnRaTaKdrVxLpR/m0AL8UQD35IHXGe2x+ilNlSl
 jbhz4ddbwagi9tIgCUFqeQzhl7gh3RAYtL3Nzp4jwkXs4HcJ34Oe5Av8UC119OlxoRP612uargk
 jMiEdYDkBMS1wAczmEhffbQqPbk+mHm46Rc1LUmFc=
X-Google-Smtp-Source: AGHT+IFjvGitVPFMljRxDhNXNiBIBymZTZWiCo05JRO3m4ze4ypqWVFtCvUzXEzvu//4jw9Ce0prM+wXWj0N
X-Received: by 2002:a05:6122:50d:b0:54a:9fe8:171e with SMTP id
 71dfb90a1353d-5615bd7271amr10163955e0c.7.1767045586883; 
 Mon, 29 Dec 2025 13:59:46 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com
 (address-144-49-247-2.dlp.protect.broadcom.com. [144.49.247.2])
 by smtp-relay.gmail.com with ESMTPS id
 71dfb90a1353d-5615d15fac2sm4709487e0c.6.2025.12.29.13.59.46
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 29 Dec 2025 13:59:46 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qv1-f69.google.com with SMTP id
 6a1803df08f44-88a3a4af701so256276416d6.1
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Dec 2025 13:59:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=broadcom.com; s=google; t=1767045584; x=1767650384;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=IB8+29ViFF3HgSBOU+iv2rB43ubUg7MMKbsWRsTRATY=;
 b=Vu+2SDlJXcENMM1kIUXAzx8luxKh4uvBwOLAJiMKFm2s/dQCW/Ih5+x1cEJi0jIcFN
 VUHkQcloxfnjVf5GpIzhfoz9KqINrzblgHqOgYBVBvJ5dwunjPVP+1ZYr/XrKc5iJfpQ
 gyhCav+ph2fwWHiI0ui1mE6n5d4gkZYjC3F6s=
X-Received: by 2002:a05:620a:2911:b0:89e:b8af:f72d with SMTP id
 af79cd13be357-8c08fa99987mr4700270485a.57.1767045584663; 
 Mon, 29 Dec 2025 13:59:44 -0800 (PST)
X-Received: by 2002:a05:620a:2911:b0:89e:b8af:f72d with SMTP id
 af79cd13be357-8c08fa99987mr4700268685a.57.1767045584169; 
 Mon, 29 Dec 2025 13:59:44 -0800 (PST)
Received: from localhost.localdomain
 (pool-173-49-113-140.phlapa.fios.verizon.net. [173.49.113.140])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-88d9759f164sm231530026d6.24.2025.12.29.13.59.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Dec 2025 13:59:40 -0800 (PST)
From: Zack Rusin <zack.rusin@broadcom.com>
To: dri-devel@lists.freedesktop.org
Cc: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 amd-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH 11/12] drm/radeon: Use devm aperture helpers for sysfb restore
 on probe failure
Date: Mon, 29 Dec 2025 16:58:17 -0500
Message-ID: <20251229215906.3688205-12-zack.rusin@broadcom.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20251229215906.3688205-1-zack.rusin@broadcom.com>
References: <20251229215906.3688205-1-zack.rusin@broadcom.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

This ensures users don't lose display output if the radeon driver
fails to probe after removing the firmware framebuffer.

Signed-off-by: Zack Rusin <zack.rusin@broadcom.com>
Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: "Christian König" <christian.koenig@amd.com>
Cc: David Airlie <airlied@gmail.com>
Cc: Simona Vetter <simona@ffwll.ch>
Cc: amd-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org
Cc: linux-kernel@vger.kernel.org
---
 drivers/gpu/drm/radeon/radeon_drv.c | 15 +++++++++++++--
 1 file changed, 13 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/radeon/radeon_drv.c b/drivers/gpu/drm/radeon/radeon_drv.c
index 87fd6255c114..225f716d5db9 100644
--- a/drivers/gpu/drm/radeon/radeon_drv.c
+++ b/drivers/gpu/drm/radeon/radeon_drv.c
@@ -324,8 +324,13 @@ static int radeon_pci_probe(struct pci_dev *pdev,
 	if (vga_switcheroo_client_probe_defer(pdev))
 		return -EPROBE_DEFER;
 
-	/* Get rid of things like offb */
-	ret = aperture_remove_conflicting_pci_devices(pdev, kms_driver.name);
+	/*
+	 * Get rid of things like offb. Use devm variant to automatically
+	 * restore sysfb if probe fails. This ensures the user doesn't lose
+	 * display if our probe fails after removing the firmware framebuffer
+	 * (efifb/simpledrm).
+	 */
+	ret = devm_aperture_remove_conflicting_pci_devices(pdev, kms_driver.name);
 	if (ret)
 		return ret;
 
@@ -361,6 +366,12 @@ static int radeon_pci_probe(struct pci_dev *pdev,
 
 	drm_client_setup(ddev, format);
 
+	/*
+	 * Probe succeeded - cancel the automatic sysfb restore action.
+	 * We're now responsible for display output.
+	 */
+	devm_aperture_remove_conflicting_pci_devices_done(pdev);
+
 	return 0;
 
 err:
-- 
2.48.1

