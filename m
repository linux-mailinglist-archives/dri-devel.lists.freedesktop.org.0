Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BFB97CE8452
	for <lists+dri-devel@lfdr.de>; Mon, 29 Dec 2025 23:05:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A06010E741;
	Mon, 29 Dec 2025 22:05:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=broadcom.com header.i=@broadcom.com header.b="O0kpEGPa";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-f99.google.com (mail-vs1-f99.google.com
 [209.85.217.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 517DD10E739
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Dec 2025 22:05:32 +0000 (UTC)
Received: by mail-vs1-f99.google.com with SMTP id
 ada2fe7eead31-5dbe6be1ac5so3769607137.1
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Dec 2025 14:05:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767045931; x=1767650731;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Ud7EWqvaAYC+L/BMEOnAHtOcyfh1O0xHeiVDUtFFCbY=;
 b=mBbqJGVJbJ1JslwUEQw9JoYkb/LIcirJct5mrAzN5S2O3tl/UEzDVL7a9dnTG2Nq0A
 w+jyDC4XE6lFHs1Nr6CmgC33vJZllYPpXAVDkgPeX/RrYWbMbsjJLclZmKOn0yGBiEJg
 n5oIYgIH0uQR5NEpqrHfcYXGUnf4poONYiavS0PPsHhEhN8XevkihMTX29OIaEDR5dR7
 oHsSuLx3Toeil3NWJqVVE5NXxTnAmY0iHNYCU6c6/mEUid8UOxJbSnTdqhRSZM1IGYQt
 i0vGnbCyTVURLluR6DgXVEi8YqK5b+OFgIA8LVZ8VyNprxH5/+hu5u5+PI6CI+Z8nx3p
 XILA==
X-Gm-Message-State: AOJu0Yy6dAZbYIUwMUkKTCW/jHDZbyX3j36T9rcZ4UVIbgMM7j4PSnhk
 zI8c9shcuRFatCivUo948upFx94hU6WBeR7ygwg0DNR/XOxovd2wpNdP42bcGVohYhegeHIaj7z
 DEnkHQibK00yJUVHN7rWskH0+iliAlsxSGL/OyaiYE9dX+NNmZmeI/mfs7sbvlBZpbyyshTk/lJ
 PctgXRikOiQphnNQt+AMSuFukF55H2BwOT4jqg0fTCa+Pr/kUy/nmERT2lY5tTJQSj/bEe2/r6x
 FcXVZ6pTYQPjigiWqo9
X-Gm-Gg: AY/fxX6A0C6zerfV6fcgTba72wkxKv4MxRUQX/BGLvfByHxZZlxilg+tzD/hrv5xlEt
 bkuKbVEsa2M9qBnaUJXnu9QMFwBnOq2EAFxq1RD49xQnV4RcuA87JPYr3SX2yKFzKgpbT+Nwe9O
 x8nTmQR3JHwnvs7WHTrKyt0i4WpI0c0HCveJIDc9bT7XO/lPkVeZsNpJ2M+nzVwwiaEOwoIFPr1
 aiFYDezV3tR80joKTEHnjsPdZ7b0lR6VqnDqQQ9txuYfXNuohmQKFHqsekuCCvP6jMf4aCpCzww
 mgDZ9/Xam6MYXmHYB046+NdG7KEG7IpIP5BK4FfHYxuGeWjFZ41A+/TQkxoVnGW2M8+070QFsF3
 ZiBr6yUtgw7lBb3SLxrr4446GjhyHHpexa06zNhxsFHjD3eaeJ5x09PnzjrAobJcXbBMa8v5VE2
 8IqHiW0OHjIabQq730alhWrN//bt73dl0Jj4Exr0anGwQn
X-Google-Smtp-Source: AGHT+IEkEjzggRxWi3jgawJw6YaYre0K/PNcltmh2JrA+G3RakBxq9UXQvFH0QXVVa5RqUcHCFOd5lkF8il7
X-Received: by 2002:a05:6102:580b:b0:5e5:63e3:ebb9 with SMTP id
 ada2fe7eead31-5eb1a859afbmr7492579137.40.1767045931208; 
 Mon, 29 Dec 2025 14:05:31 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com
 (address-144-49-247-117.dlp.protect.broadcom.com. [144.49.247.117])
 by smtp-relay.gmail.com with ESMTPS id
 ada2fe7eead31-5eb1a85ba69sm4855228137.0.2025.12.29.14.05.30
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 29 Dec 2025 14:05:31 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-pj1-f71.google.com with SMTP id
 98e67ed59e1d1-34c5d203988so20276035a91.3
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Dec 2025 14:05:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=broadcom.com; s=google; t=1767045929; x=1767650729;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Ud7EWqvaAYC+L/BMEOnAHtOcyfh1O0xHeiVDUtFFCbY=;
 b=O0kpEGPaORqMQWPWH1+UpWzQ3QU763SWzwDKAvv2heCk0mXQBxexPjZcfu0TuSqBva
 j86Xdo2vSf5qilb4vWGUdWnJXdzxsGBfU1KKEc843c0SEHIQMfKJvR6knHryqxweBnDb
 3xHCZ3XwQHJLLJkNA6H+KinzAQKC/7GmIGRCU=
X-Received: by 2002:a05:622a:2b0a:b0:4f1:b714:5864 with SMTP id
 d75a77b69052e-4f4abbcc5cfmr460052171cf.0.1767045580599; 
 Mon, 29 Dec 2025 13:59:40 -0800 (PST)
X-Received: by 2002:a05:622a:2b0a:b0:4f1:b714:5864 with SMTP id
 d75a77b69052e-4f4abbcc5cfmr460051871cf.0.1767045580088; 
 Mon, 29 Dec 2025 13:59:40 -0800 (PST)
Received: from localhost.localdomain
 (pool-173-49-113-140.phlapa.fios.verizon.net. [173.49.113.140])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-88d9759f164sm231530026d6.24.2025.12.29.13.59.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Dec 2025 13:59:39 -0800 (PST)
From: Zack Rusin <zack.rusin@broadcom.com>
To: dri-devel@lists.freedesktop.org
Cc: Dave Airlie <airlied@redhat.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 Jocelyn Falempe <jfalempe@redhat.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, linux-kernel@vger.kernel.org
Subject: [PATCH 10/12] drm/ast: Use devm aperture helpers for sysfb restore on
 probe failure
Date: Mon, 29 Dec 2025 16:58:16 -0500
Message-ID: <20251229215906.3688205-11-zack.rusin@broadcom.com>
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

This ensures users don't lose display output if the ast driver
fails to probe after removing the firmware framebuffer.

Signed-off-by: Zack Rusin <zack.rusin@broadcom.com>
Cc: Dave Airlie <airlied@redhat.com>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Jocelyn Falempe <jfalempe@redhat.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: David Airlie <airlied@gmail.com>
Cc: Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org
Cc: linux-kernel@vger.kernel.org
---
 drivers/gpu/drm/ast/ast_drv.c | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/ast/ast_drv.c b/drivers/gpu/drm/ast/ast_drv.c
index b9a9b050b546..8e6c7cbafa59 100644
--- a/drivers/gpu/drm/ast/ast_drv.c
+++ b/drivers/gpu/drm/ast/ast_drv.c
@@ -310,7 +310,12 @@ static int ast_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 	struct drm_device *drm;
 	bool need_post = false;
 
-	ret = aperture_remove_conflicting_pci_devices(pdev, ast_driver.name);
+	/*
+	 * Use devm variant to automatically restore sysfb if probe fails.
+	 * This ensures the user doesn't lose display if our probe fails
+	 * after removing the firmware framebuffer (efifb/simpledrm).
+	 */
+	ret = devm_aperture_remove_conflicting_pci_devices(pdev, ast_driver.name);
 	if (ret)
 		return ret;
 
@@ -426,6 +431,12 @@ static int ast_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 
 	drm_client_setup(drm, NULL);
 
+	/*
+	 * Probe succeeded - cancel the automatic sysfb restore action.
+	 * We're now responsible for display output.
+	 */
+	devm_aperture_remove_conflicting_pci_devices_done(pdev);
+
 	return 0;
 }
 
-- 
2.48.1

