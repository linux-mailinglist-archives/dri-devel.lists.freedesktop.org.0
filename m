Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D0FDCE83F5
	for <lists+dri-devel@lfdr.de>; Mon, 29 Dec 2025 22:59:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CDC2110E73A;
	Mon, 29 Dec 2025 21:59:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=broadcom.com header.i=@broadcom.com header.b="Ex0TSu1G";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-f226.google.com (mail-qt1-f226.google.com
 [209.85.160.226])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 45FBE10E73A
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Dec 2025 21:59:45 +0000 (UTC)
Received: by mail-qt1-f226.google.com with SMTP id
 d75a77b69052e-4ee1e18fb37so96122921cf.0
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Dec 2025 13:59:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767045584; x=1767650384;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=4cjHGpdx5LLmnDfUfy3cg6m+WR+7JCISjjlWlDNw0F4=;
 b=RSLGRHb0yEfdroEgrYMqb8IOpeqaw4Tw/03UYbnDckiE0szMaTE/dRtMnVvLAlLW7N
 +iqdEoCPVaXFDrKwcMxRo+WVdZBE60RHu2vQ6Wh5etogZGJ9PtvV8n7tZ2wwTGLgI4g8
 6/lJ+QEQwt9qHjVnGl6n2e+FIaizz27EN0z5qzJLQ+WFV1Oz2sB7GnVVw0r+191Yq8US
 /7J54rMpSsvloknq8PAICGQZhpl0ECtJTLNf7sAEnumN/WqMwPsKo4910/DPPA6MJcIa
 KBT8wiAb754S3A3Dvz3mPBz/4F/mIK+ouqKYQkZD2nrYvLbvJbn+WKTBibutdksd3FpR
 7RaQ==
X-Gm-Message-State: AOJu0YxdxcBrxyb+YICVv5o269xBygqSso1ZsavY8e8awkYpSduBzn0z
 ZNaVDQZBTgr6twfvH6WABNaafG+BV31uH3/zswhz5c6gST3Dbz7X2SHwYALs2qdjDDtPNVx2jja
 lRcVED/MqAczNFtpw8ZXRhTQLSAIB1hFyhbAMDp6+qdOcMQUIzE3KWeo8FdvfP2XNX7iRgBzmtO
 7XDtdD0estIv0faQ9ELh3L9yEI1Wss64nW7ddb1lVDIEeXpQrvbRBG0ZPgTlwNnH8Bn9xFFlX2x
 TmDkUX9UTYg6a/9j5Xw
X-Gm-Gg: AY/fxX4mqsdQUEd8fd0Zho70Rs7tp6bcAGaS4ZQWpDzX78H3VWmluHZQ4eQL0MkhOcS
 B9L9feXFzOQyJURgxB2ay6lcxeRxK/3z2DcbcTDRYljnhIltUXcYtXWMnW/Qn/u3/Qy96QREfjP
 Zcn7506d/z+HsRyLisUtB4/y+y4bv6p8jzwjjeu+uo1Mel/sJbHgQQ0wn+lwQIsbjvvWGom3Q1h
 kLSpgBL/1b/5oOjYETNOKuyAjqrjgMR+T8IyuFDfBzQOstBfzCjx/M8mfQMukLXMhmx6G4NbtzL
 VKgr+xIVLxxvXCsz8psmPel3+A29Hglr2HfZiSD3ESh06bkg7o9NlEIzRsuKbf/3eYVjP4ZKBzd
 hQVaAi7a9w5PW/etqVI3wmeseE+RmugSi1uyZGfJRTVLh8JM+J1cpn/Oy/hh5sTbFxV28TbRr0q
 3krwkPbtqdepHCalhBfgRdUxtbVOzo8sbD3oiOuaJyxSxm
X-Google-Smtp-Source: AGHT+IHxLBOZhQ6818gzKrG0ieiV8MXJN4RqxNPNmnz/3TO/JwOxMPChdUY8UgAiF3XXUw8p1E54uM1dkza0
X-Received: by 2002:a05:622a:5983:b0:4ee:280:2e49 with SMTP id
 d75a77b69052e-4f4abdc9b4emr468653961cf.66.1767045584315; 
 Mon, 29 Dec 2025 13:59:44 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com
 (address-144-49-247-101.dlp.protect.broadcom.com. [144.49.247.101])
 by smtp-relay.gmail.com with ESMTPS id
 6a1803df08f44-88d94fcba36sm40934306d6.4.2025.12.29.13.59.41
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 29 Dec 2025 13:59:44 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qv1-f69.google.com with SMTP id
 6a1803df08f44-88a3822c06bso271999996d6.2
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Dec 2025 13:59:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=broadcom.com; s=google; t=1767045579; x=1767650379;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4cjHGpdx5LLmnDfUfy3cg6m+WR+7JCISjjlWlDNw0F4=;
 b=Ex0TSu1GnVf1Xt2leABR4NTCZ6Vv+MVQgEw39Q1G1YxntPkG4V+yg8SHDS+jk4j3m0
 HydLA/oBjgTtbCLOohC3fIxEVoc3t53nSLn+4MyjRkSdqepGw9x/XLCDFNgn4WNQYC2H
 M1xiECB2inuShHt+bLGBGp7zKdw3jZ8/HfgmA=
X-Received: by 2002:a05:6214:458b:b0:882:437d:282d with SMTP id
 6a1803df08f44-88d82de8226mr482656336d6.30.1767045579152; 
 Mon, 29 Dec 2025 13:59:39 -0800 (PST)
X-Received: by 2002:a05:6214:458b:b0:882:437d:282d with SMTP id
 6a1803df08f44-88d82de8226mr482656146d6.30.1767045578716; 
 Mon, 29 Dec 2025 13:59:38 -0800 (PST)
Received: from localhost.localdomain
 (pool-173-49-113-140.phlapa.fios.verizon.net. [173.49.113.140])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-88d9759f164sm231530026d6.24.2025.12.29.13.59.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Dec 2025 13:59:36 -0800 (PST)
From: Zack Rusin <zack.rusin@broadcom.com>
To: dri-devel@lists.freedesktop.org
Cc: Deepak Rawat <drawat.floss@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, linux-hyperv@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH 09/12] drm/hyperv: Add sysfb restore on probe failure
Date: Mon, 29 Dec 2025 16:58:15 -0500
Message-ID: <20251229215906.3688205-10-zack.rusin@broadcom.com>
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

Register a devm action on the vmbus device to restore the system
framebuffer (efifb/simpledrm) if the driver's probe fails after
removing the firmware framebuffer.

Unlike PCI drivers, hyperv cannot use the
devm_aperture_remove_conflicting_pci_devices() helper because this
is a vmbus device, not a PCI device. Instead, register the sysfb
restore action on the hv device (&hdev->device) which will be
released if probe fails. Cancel the action after successful probe
since the driver is now responsible for display output.

This ensures users don't lose display output if the hyperv driver
fails to probe after removing the firmware framebuffer.

Signed-off-by: Zack Rusin <zack.rusin@broadcom.com>
Cc: Deepak Rawat <drawat.floss@gmail.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: David Airlie <airlied@gmail.com>
Cc: Simona Vetter <simona@ffwll.ch>
Cc: linux-hyperv@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org
Cc: linux-kernel@vger.kernel.org
---
 drivers/gpu/drm/hyperv/hyperv_drm_drv.c | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/drivers/gpu/drm/hyperv/hyperv_drm_drv.c b/drivers/gpu/drm/hyperv/hyperv_drm_drv.c
index 06b5d96e6eaf..6d66cd243bab 100644
--- a/drivers/gpu/drm/hyperv/hyperv_drm_drv.c
+++ b/drivers/gpu/drm/hyperv/hyperv_drm_drv.c
@@ -8,6 +8,7 @@
 #include <linux/hyperv.h>
 #include <linux/module.h>
 #include <linux/pci.h>
+#include <linux/sysfb.h>
 
 #include <drm/clients/drm_client_setup.h>
 #include <drm/drm_atomic_helper.h>
@@ -102,6 +103,11 @@ static int hyperv_setup_vram(struct hyperv_drm_device *hv,
 	return ret;
 }
 
+static void hyperv_restore_sysfb(void *unused)
+{
+	sysfb_restore();
+}
+
 static int hyperv_vmbus_probe(struct hv_device *hdev,
 			      const struct hv_vmbus_device_id *dev_id)
 {
@@ -127,6 +133,17 @@ static int hyperv_vmbus_probe(struct hv_device *hdev,
 
 	aperture_remove_all_conflicting_devices(hyperv_driver.name);
 
+	/*
+	 * Register sysfb restore on the hv device. We can't use
+	 * devm_aperture_remove_conflicting_pci_devices() because this
+	 * is a vmbus device, not a PCI device. Register on &hdev->device
+	 * so it fires if our probe fails after removing firmware FB.
+	 */
+	ret = devm_add_action_or_reset(&hdev->device, hyperv_restore_sysfb,
+				       NULL);
+	if (ret)
+		goto err_vmbus_close;
+
 	ret = hyperv_setup_vram(hv, hdev);
 	if (ret)
 		goto err_vmbus_close;
@@ -152,6 +169,12 @@ static int hyperv_vmbus_probe(struct hv_device *hdev,
 
 	drm_client_setup(dev, NULL);
 
+	/*
+	 * Probe succeeded - cancel sysfb restore. We're now responsible
+	 * for display output.
+	 */
+	devm_remove_action(&hdev->device, hyperv_restore_sysfb, NULL);
+
 	return 0;
 
 err_free_mmio:
-- 
2.48.1

