Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 11408912975
	for <lists+dri-devel@lfdr.de>; Fri, 21 Jun 2024 17:22:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C1CA10F203;
	Fri, 21 Jun 2024 15:22:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="cWTDtayi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f97.google.com (mail-ej1-f97.google.com
 [209.85.218.97])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7570B10F1E5
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Jun 2024 15:21:42 +0000 (UTC)
Received: by mail-ej1-f97.google.com with SMTP id
 a640c23a62f3a-a6fb341a7f2so269523566b.1
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Jun 2024 08:21:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raspberrypi.com; s=google; t=1718983301; x=1719588101;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1SWNvha1wpsFjIpNg/RuN6YQ2FuCiQ7YWDRgqKXVMVg=;
 b=cWTDtayilSFfFFvXJyHCB3ZW4fVvY1cn8buWV5ukQ0OrHIilfsetlBtiClc3RagwFn
 lRI8BH+0yZl/XQVoaRWH3BoR/GyfYXcr/g6AeeH/gG9qEzCgXFwn1rC+CB5/SbE0q9bx
 8tJVB322fXeubCckKLytZjHJ73c8Hiq5xBhKBx20a2/M3tBon7DUI84Z1vd+WE1Txtzl
 83I5cuml6aEXp9+buOf568uJyCAwKKqYu6EmpTZH9rbOPTAZm32ehNw8GGgd34PN+KXG
 SbNg4F1cCp8Cn2Z2PUF7HNNsCNa+9PWjRgQOF1baDvnz66RJ8ZgWBCIHjgXByQxhIBXO
 aXPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718983301; x=1719588101;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=1SWNvha1wpsFjIpNg/RuN6YQ2FuCiQ7YWDRgqKXVMVg=;
 b=wv4i32wmBje8y/B2WegBuaCYfjYdvaRUF5ob+CCoboe7fNesa9/G7GSJccQhnMeNzw
 Vezc2CFSHdHNjTqCR5ecHeCoVRhYPxY8IzYJw7CY0Sy2GBkCtY8zjidWB7I7axKvZkXn
 e+yXQjGaSzmLVaxqKvel+kVYdle6gmweESRrFtrXAp6nny6EsF0grpHO08m7lMXVtyUc
 ijxHBFBthPjC4vUfuNbWbKGSPU3sDBXwT6T84IqcMGb0HSTAeWjmQVE0gDfrQ9a8Rxtx
 xbog17OrZhTzqVRLjE0QGs4QVwC0FN/UEWHey9m/lRELhKIt7HRYDNowoZW+WZA930H6
 C/xQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCV8NltLJA2AOAGRfEMiOZXEdGdP/O0/rX1Q80Rv2wl/winixia+p7rRAX+DWjYtP18WbY+GnsKH8WsybWCfeEKUWBh2LmXeTGRmqNF4SOkP
X-Gm-Message-State: AOJu0Yzkv82iMlIMk4XE4dhcUVqcFsL6o3T/Y9NqOeYl5m7jog4GEv4H
 sgwFTTTZuxIZ5gtwf2IUuPmkY9HkjYiYlKai0eqy/fzB8J0nJ23LyONxwS0MZ8JTqRIS3zfoZul
 bw/qGeqlsvBfUhv2wAXJd0T30PNi160yt
X-Google-Smtp-Source: AGHT+IEBfMID2x21XRXGWZi9gk8h2MRle+i51KBEfEsRRaCLTCyqE3uUm27Ur3C22wvOZwMRwDlTrCM5J9tX
X-Received: by 2002:a17:907:765c:b0:a6f:a54:1598 with SMTP id
 a640c23a62f3a-a6fab779292mr599884966b.49.1718983300940; 
 Fri, 21 Jun 2024 08:21:40 -0700 (PDT)
Received: from raspberrypi.com ([188.39.149.98])
 by smtp-relay.gmail.com with ESMTPS id
 a640c23a62f3a-a6fcf56eeebsm5652266b.283.2024.06.21.08.21.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Jun 2024 08:21:40 -0700 (PDT)
X-Relaying-Domain: raspberrypi.com
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
To: Maxime Ripard <mripard@kernel.org>,
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org
Cc: Dave Stevenson <dave.stevenson@raspberrypi.com>
Subject: [PATCH v2 18/31] drm/vc4: hvs: Remove incorrect limit from hvs_dlist
 debugfs function
Date: Fri, 21 Jun 2024 16:20:42 +0100
Message-Id: <20240621152055.4180873-19-dave.stevenson@raspberrypi.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240621152055.4180873-1-dave.stevenson@raspberrypi.com>
References: <20240621152055.4180873-1-dave.stevenson@raspberrypi.com>
MIME-Version: 1.0
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

The debugfs function to dump dlists aborted at 256 bytes,
when actually the dlist memory is generally significantly
larger but varies based on SoC.

We already have the correct limit in __vc4_hvs_alloc, so
store it for use in the debugfs dlist function.

Fixes: c6dac00340fc ("drm/vc4: hvs: Add debugfs node that dumps the current display lists")
Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
---
 drivers/gpu/drm/vc4/vc4_drv.h | 1 +
 drivers/gpu/drm/vc4/vc4_hvs.c | 6 ++++--
 2 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_drv.h b/drivers/gpu/drm/vc4/vc4_drv.h
index 717fd1140561..6908b36d5953 100644
--- a/drivers/gpu/drm/vc4/vc4_drv.h
+++ b/drivers/gpu/drm/vc4/vc4_drv.h
@@ -315,6 +315,7 @@ struct vc4_hvs {
 	struct platform_device *pdev;
 	void __iomem *regs;
 	u32 __iomem *dlist;
+	unsigned int dlist_mem_size;
 
 	struct clk *core_clk;
 
diff --git a/drivers/gpu/drm/vc4/vc4_hvs.c b/drivers/gpu/drm/vc4/vc4_hvs.c
index 5dbc48d690e8..933177cb8d66 100644
--- a/drivers/gpu/drm/vc4/vc4_hvs.c
+++ b/drivers/gpu/drm/vc4/vc4_hvs.c
@@ -110,6 +110,7 @@ static int vc4_hvs_debugfs_dlist(struct seq_file *m, void *data)
 	struct vc4_dev *vc4 = to_vc4_dev(dev);
 	struct vc4_hvs *hvs = vc4->hvs;
 	struct drm_printer p = drm_seq_file_printer(m);
+	unsigned int dlist_mem_size = hvs->dlist_mem_size;
 	unsigned int next_entry_start;
 	unsigned int i, j;
 	u32 dlist_word, dispstat;
@@ -126,7 +127,7 @@ static int vc4_hvs_debugfs_dlist(struct seq_file *m, void *data)
 		drm_printf(&p, "HVS chan %u:\n", i);
 		next_entry_start = 0;
 
-		for (j = HVS_READ(SCALER_DISPLISTX(i)); j < 256; j++) {
+		for (j = HVS_READ(SCALER_DISPLISTX(i)); j < dlist_mem_size; j++) {
 			dlist_word = readl((u32 __iomem *)vc4->hvs->dlist + j);
 			drm_printf(&p, "dlist: %02d: 0x%08x\n", j,
 				   dlist_word);
@@ -816,9 +817,10 @@ struct vc4_hvs *__vc4_hvs_alloc(struct vc4_dev *vc4, struct platform_device *pde
 	 * our 16K), since we don't want to scramble the screen when
 	 * transitioning from the firmware's boot setup to runtime.
 	 */
+	hvs->dlist_mem_size = (SCALER_DLIST_SIZE >> 2) - HVS_BOOTLOADER_DLIST_END;
 	drm_mm_init(&hvs->dlist_mm,
 		    HVS_BOOTLOADER_DLIST_END,
-		    (SCALER_DLIST_SIZE >> 2) - HVS_BOOTLOADER_DLIST_END);
+		    hvs->dlist_mem_size);
 
 	/* Set up the HVS LBM memory manager.  We could have some more
 	 * complicated data structure that allowed reuse of LBM areas
-- 
2.34.1

