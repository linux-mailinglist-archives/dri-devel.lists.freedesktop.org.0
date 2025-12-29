Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BCBF2CE846A
	for <lists+dri-devel@lfdr.de>; Mon, 29 Dec 2025 23:07:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 19DCE10E745;
	Mon, 29 Dec 2025 22:07:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=broadcom.com header.i=@broadcom.com header.b="Im0+8aGF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f97.google.com (mail-pj1-f97.google.com
 [209.85.216.97])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E34C10E745
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Dec 2025 22:07:30 +0000 (UTC)
Received: by mail-pj1-f97.google.com with SMTP id
 98e67ed59e1d1-34c1d84781bso10786163a91.2
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Dec 2025 14:07:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767046050; x=1767650850;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Q4KdukKFQUL9FIJkansAje16tRq8afqRuBs3aDoBF14=;
 b=bd5ZhK5ofXzY+OheIF4zkZPCXr9CPfylx2uFv8eU9TDFrmb3jvQapInbCodGg6BDxs
 INAPHFWdVVD3+kxDpj77Tj3f+sBPxz7QSS2Xkqx3eD2s+BuZiaENzzAH93ZUaebLBJHO
 Jl5o+Btg3iK9euWCz52wlNDt/iog/dxPw1MoqujnQSrRiEneQ6o3wZ3C6MR/sdm7xra2
 /ds3FCtAee6u1xxvttk5ZjcmtQMcHaOwSLhq0FXgmtfm38Ah1wP+b6/UmpCMIt0HfZgQ
 7J/uhyfN5BM7ShyBqYPTl5oCYzxOtPo+wLlof3fArgPlU9uTYv1FJTOavajoX4rs3zZ+
 3f7Q==
X-Gm-Message-State: AOJu0Yyb0VCoDkt5mjS+CQ2EZkCNE8xcK2Pp0E3M8FoBhGDHQKoQEfrq
 0VL4KPwaQOHt/81nYAc7Jap0JBB+XXiLxqPEpbuxGUfR15B3aw++eOHgD6eUhjMu7Sj1nwjF0OD
 BeaH1PAANFer6ka4dbQJZZ7F4gFrn7yMvyDOoio8pBjDWw5fY6u9+aD9W2qtI+k7DdF5wcE4jnF
 ZquW52CXTeU9Ro33Dmzz4KsEIaJlg6WOJc6c1gqx6GZ+Syn+q3ruCxAGLgPbkXSZaHpGiPBbHAD
 QRk3jsPrWRyeW+bVWzz
X-Gm-Gg: AY/fxX479pFf+jGdI0/4ONhtkUPGrkqfK6NzHhz9oIFvg1nCeRt4u49XqfXWC2cTQPI
 sRmAXwHmeXaQWE0Rfl6z5QitMZQG/gBSPhf2Mjr6qIAPvFsxPr4MKrk0Fkk55Qi3sh7kHQKO0oV
 hp053FK3zSPTYUQhLRjPJ0P9Ixoam/i+eBcNXxn1N6TsdG0M1l2/tp+NbAw9CWVAeBXFBIErWM0
 l/HdwWfqPB8SZy9UwbMK82zZKNGDYjW99mFABgqtK5UKPewsVIBlgwTHkV/IHw4A7yt/wynnNP4
 fZWelCiOjA6+v5pvLJ8nUe0y0ug7UGPuSFut4RwafuHG0cWZBmsmmCMjO43nQ/H6VjuR4EpQxeG
 I+6AnnfZtBYJBe9uXyKEyiCNXAnZDt1k0FW6MIcYJZKcBdJ3twcS/WiKl+3W07VOOvPIp5YtQM/
 BltrpVsSXPtMy3JuqUd89ch1p6FPHwisyNvvo6G6I87XCt
X-Google-Smtp-Source: AGHT+IFzGycgvQARh1nhuTt+OouvcFrdudCE+rZdHsG7WAEvg+bv/sZAfgoxuvhDRlqkNL723ox4AItjv1a+
X-Received: by 2002:a17:90b:4c06:b0:34c:c50e:9b80 with SMTP id
 98e67ed59e1d1-34e921bba16mr30285251a91.27.1767046050040; 
 Mon, 29 Dec 2025 14:07:30 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com
 (address-144-49-247-101.dlp.protect.broadcom.com. [144.49.247.101])
 by smtp-relay.gmail.com with ESMTPS id
 98e67ed59e1d1-34e921a27bfsm4020153a91.2.2025.12.29.14.07.29
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 29 Dec 2025 14:07:30 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-vs1-f70.google.com with SMTP id
 ada2fe7eead31-5dfb66cd4bdso16552227137.1
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Dec 2025 14:07:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=broadcom.com; s=google; t=1767046048; x=1767650848;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Q4KdukKFQUL9FIJkansAje16tRq8afqRuBs3aDoBF14=;
 b=Im0+8aGFL4Qvwjh4M03hyYhNTgBAwSkSq009ZU6dqa76y6DVTDhlQ2p1zkxzLoRUcj
 WztG6eUDOS8W2zFRRw3U1GWnmZPEGGDq/rJ3hQaku6T1lTHTH3d61gtobAmU6gQRpDBw
 nLlLahV8x445Pxt7JB6EKopTMMDBYSfqQYoLk=
X-Received: by 2002:a05:6214:212f:b0:88a:4694:5921 with SMTP id
 6a1803df08f44-88d833b7862mr558877996d6.37.1767045569382; 
 Mon, 29 Dec 2025 13:59:29 -0800 (PST)
X-Received: by 2002:a05:6214:212f:b0:88a:4694:5921 with SMTP id
 6a1803df08f44-88d833b7862mr558877646d6.37.1767045568851; 
 Mon, 29 Dec 2025 13:59:28 -0800 (PST)
Received: from localhost.localdomain
 (pool-173-49-113-140.phlapa.fios.verizon.net. [173.49.113.140])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-88d9759f164sm231530026d6.24.2025.12.29.13.59.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Dec 2025 13:59:25 -0800 (PST)
From: Zack Rusin <zack.rusin@broadcom.com>
To: dri-devel@lists.freedesktop.org
Cc: Lyude Paul <lyude@redhat.com>, Danilo Krummrich <dakr@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH 06/12] drm/nouveau: Use devm aperture helpers for sysfb
 restore on probe failure
Date: Mon, 29 Dec 2025 16:58:12 -0500
Message-ID: <20251229215906.3688205-7-zack.rusin@broadcom.com>
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

This ensures users don't lose display output if the nouveau driver
fails to probe after removing the firmware framebuffer.

Signed-off-by: Zack Rusin <zack.rusin@broadcom.com>
Cc: Lyude Paul <lyude@redhat.com>
Cc: Danilo Krummrich <dakr@kernel.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: David Airlie <airlied@gmail.com>
Cc: Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org
Cc: nouveau@lists.freedesktop.org
Cc: linux-kernel@vger.kernel.org
---
 drivers/gpu/drm/nouveau/nouveau_drm.c | 16 ++++++++++++++--
 1 file changed, 14 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_drm.c b/drivers/gpu/drm/nouveau/nouveau_drm.c
index 1527b801f013..7211ec6cdcc9 100644
--- a/drivers/gpu/drm/nouveau/nouveau_drm.c
+++ b/drivers/gpu/drm/nouveau/nouveau_drm.c
@@ -871,8 +871,13 @@ static int nouveau_drm_probe(struct pci_dev *pdev,
 	if (ret)
 		return ret;
 
-	/* Remove conflicting drivers (vesafb, efifb etc). */
-	ret = aperture_remove_conflicting_pci_devices(pdev, driver_pci.name);
+	/*
+	 * Remove conflicting drivers (vesafb, efifb etc). Use devm variant
+	 * to automatically restore sysfb if probe fails. This ensures the
+	 * user doesn't lose display if our probe fails after removing the
+	 * firmware framebuffer (efifb/simpledrm).
+	 */
+	ret = devm_aperture_remove_conflicting_pci_devices(pdev, driver_pci.name);
 	if (ret)
 		return ret;
 
@@ -903,6 +908,13 @@ static int nouveau_drm_probe(struct pci_dev *pdev,
 	drm_client_setup(drm->dev, format);
 
 	quirk_broken_nv_runpm(pdev);
+
+	/*
+	 * Probe succeeded - cancel the automatic sysfb restore action.
+	 * We're now responsible for display output.
+	 */
+	devm_aperture_remove_conflicting_pci_devices_done(pdev);
+
 	return 0;
 
 fail_pci:
-- 
2.48.1

