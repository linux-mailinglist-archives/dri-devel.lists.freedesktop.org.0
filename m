Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 67E91CE83EC
	for <lists+dri-devel@lfdr.de>; Mon, 29 Dec 2025 22:59:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C29EA10E732;
	Mon, 29 Dec 2025 21:59:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=broadcom.com header.i=@broadcom.com header.b="TD76hYp7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-f100.google.com (mail-oa1-f100.google.com
 [209.85.160.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD94210E731
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Dec 2025 21:59:39 +0000 (UTC)
Received: by mail-oa1-f100.google.com with SMTP id
 586e51a60fabf-3e898ba2a03so7979495fac.0
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Dec 2025 13:59:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767045579; x=1767650379;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=khRhfUyS2wSCnelTC2k3Mez3rZkjvkbZG4nf8+8nWDY=;
 b=NMD0qp7HFfa/u8haPIk2VJQ6exCCEdDX+7UWedGEI84aXY2lzHblzeoL13aKF2vw6p
 y2F0BNIb3yxb4p0Y4r6fmkjj6s5hBd1Vdtxs7ZUvImyjxPCwWxiZ+/Tq2Ixvrh2pX5DO
 irIamNELw4hNpHyAzvWGv6alelHX0ClXOd1CcO/0lo2jX7ua29c4Z7q7FWO0VoN5IZhO
 hljedYwel1hVklToGsYL6n77jYIY8S0fhWm1+OvKN7m310YoDCXqFmNy8Drtw2XXqfA6
 V5XaAYT+P0LwF2DeT8wOgw2ZBLTAn5IKkRZzcvAb3GtxHaHrnyu+j6yVW5gxavO9480+
 7dmQ==
X-Gm-Message-State: AOJu0Yz3hWTpRagnKB7jFVbXyPx6NbjSSN0Bbq3mf9qJyukh4A7+RkGn
 shwUZYnY0HpcjQLbcABmDaMEdgUrx/0Y6+i45bwTKYzpllvVP8wOg+vtzFCBpZFBLT+u2jmVGsO
 T3vg5iq5lqZ7pSFJd7kGmTtFY5wIumGm2Qf9OMEzbeVmKqATTScvuzX2PrwyKsuetUVmDGxlI1v
 k4UEyGSxaQb1ibeFyFWusohrwAqfyGtGbxWlamYB1X0OGgu7mx+MlhKWypjBxLAEUH3NVTkaeJM
 ge3/YTgB8dbs18y3VpU
X-Gm-Gg: AY/fxX7tAXPnl3ygT8VMAIUrAcu+K7ZTNiKmum3JCqvEjSrkDsM+eQJ3lJ9NPzVWmll
 k87YADaKtZZZKSs5DR27eIvI7v21fpE9d9iLz3MrHlmCnFynhAiDn8vnObJR7wN+xdfS3zowanD
 YOzcNB2hmsqIKjjhXlBLJGpBwTisBKuG8T8tfQgUTJuGvX0diKyP+gKVv1JaBY3yp58WTTkeHDJ
 SCILJ8Pnsy8MVvvgGMPuatkk186eSdy/hYtL7EkOWOD9LUtanbUUtcJgRs8G0MPW7wDh7ujNgWW
 2XMeKF/X4x5i4PcrS4QXAFoUXmwpMZbNPiJOzub9pRnJwS+t3k+6sFUpQxphJmDFvdDg0Tk26oL
 Yjv90oVl5dfTTQ8WCRCL7u+Es47zNn1qodA2OD6o7FfzIUkZsr3kC1XgoWlraks6nTRFKmG+tBK
 TDXKoOtAPt4OkkPsnIrH6NE4uuIIlE33390GWS1i1QKcR/
X-Google-Smtp-Source: AGHT+IG3TCfMcYT8SMEt3xvhGyB5Zh4cMNO313f9m3zpKA0Gl8Am21YnhTbBN133raaHm2gbsaIbuATL292x
X-Received: by 2002:a05:6820:330d:b0:65c:f046:bb71 with SMTP id
 006d021491bc7-65d0ea9933fmr9358767eaf.46.1767045578857; 
 Mon, 29 Dec 2025 13:59:38 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com
 (address-144-49-247-117.dlp.protect.broadcom.com. [144.49.247.117])
 by smtp-relay.gmail.com with ESMTPS id
 006d021491bc7-65d0f6722c0sm1568198eaf.9.2025.12.29.13.59.37
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 29 Dec 2025 13:59:38 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qv1-f70.google.com with SMTP id
 6a1803df08f44-8887c0d3074so242817186d6.2
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Dec 2025 13:59:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=broadcom.com; s=google; t=1767045576; x=1767650376;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=khRhfUyS2wSCnelTC2k3Mez3rZkjvkbZG4nf8+8nWDY=;
 b=TD76hYp7PMu/bF/vlZ6LQoYz9bOkFE8XN8lENRxEEOGI6iew0WxA9eyqbeTJGlTKWP
 7de54LLBcSJS7zGPcAJ5Tabv8psVqLw50ys8fCq9+hOGES/uCWPryAFfb1VxGOzuX/Lv
 L4Tns94qGlZiRBEDJqWv4kNIoFQmwBaEjfLZE=
X-Received: by 2002:a0c:e98f:0:b0:888:7e02:50c4 with SMTP id
 6a1803df08f44-88d820415e9mr358861326d6.24.1767045576064; 
 Mon, 29 Dec 2025 13:59:36 -0800 (PST)
X-Received: by 2002:a0c:e98f:0:b0:888:7e02:50c4 with SMTP id
 6a1803df08f44-88d820415e9mr358861126d6.24.1767045575654; 
 Mon, 29 Dec 2025 13:59:35 -0800 (PST)
Received: from localhost.localdomain
 (pool-173-49-113-140.phlapa.fios.verizon.net. [173.49.113.140])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-88d9759f164sm231530026d6.24.2025.12.29.13.59.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Dec 2025 13:59:32 -0800 (PST)
From: Zack Rusin <zack.rusin@broadcom.com>
To: dri-devel@lists.freedesktop.org
Cc: Hans de Goede <hansg@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, linux-kernel@vger.kernel.org
Subject: [PATCH 08/12] drm/vboxvideo: Use devm aperture helpers for sysfb
 restore on probe failure
Date: Mon, 29 Dec 2025 16:58:14 -0500
Message-ID: <20251229215906.3688205-9-zack.rusin@broadcom.com>
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

This ensures users don't lose display output if the vboxvideo driver
fails to probe after removing the firmware framebuffer.

Signed-off-by: Zack Rusin <zack.rusin@broadcom.com>
Cc: Hans de Goede <hansg@kernel.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: David Airlie <airlied@gmail.com>
Cc: Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org
Cc: linux-kernel@vger.kernel.org
---
 drivers/gpu/drm/vboxvideo/vbox_drv.c | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/vboxvideo/vbox_drv.c b/drivers/gpu/drm/vboxvideo/vbox_drv.c
index bb861f0a0a31..569fd7b60115 100644
--- a/drivers/gpu/drm/vboxvideo/vbox_drv.c
+++ b/drivers/gpu/drm/vboxvideo/vbox_drv.c
@@ -46,7 +46,12 @@ static int vbox_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 	if (!vbox_check_supported(VBE_DISPI_ID_HGSMI))
 		return -ENODEV;
 
-	ret = aperture_remove_conflicting_pci_devices(pdev, driver.name);
+	/*
+	 * Use devm variant to automatically restore sysfb if probe fails.
+	 * This ensures the user doesn't lose display if our probe fails
+	 * after removing the firmware framebuffer (efifb/simpledrm).
+	 */
+	ret = devm_aperture_remove_conflicting_pci_devices(pdev, driver.name);
 	if (ret)
 		return ret;
 
@@ -84,6 +89,12 @@ static int vbox_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 
 	drm_client_setup(&vbox->ddev, NULL);
 
+	/*
+	 * Probe succeeded - cancel the automatic sysfb restore action.
+	 * We're now responsible for display output.
+	 */
+	devm_aperture_remove_conflicting_pci_devices_done(pdev);
+
 	return 0;
 
 err_irq_fini:
-- 
2.48.1

