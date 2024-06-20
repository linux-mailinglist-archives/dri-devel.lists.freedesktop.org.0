Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 59A2E910A67
	for <lists+dri-devel@lfdr.de>; Thu, 20 Jun 2024 17:47:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB5D589CC1;
	Thu, 20 Jun 2024 15:47:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="KOqL2DJZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f100.google.com (mail-wm1-f100.google.com
 [209.85.128.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E928D10EA9A
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Jun 2024 15:46:53 +0000 (UTC)
Received: by mail-wm1-f100.google.com with SMTP id
 5b1f17b1804b1-42172ed3597so6703075e9.0
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Jun 2024 08:46:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raspberrypi.com; s=google; t=1718898412; x=1719503212;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=DPTCPOzTx0DeaHi6HiuwY5/K7xdIGnW/BJUGF4vDZG4=;
 b=KOqL2DJZ1eEIF3aSwuhVWei6OWFGd/cTqpRKT41OIBVQzsae94m0Ekyl+Im9yQsnHc
 Lcfo2pZtYfzH41fx7dO/i5z/Eu2716ePqwInG6YwNhqASwW5jo/9phN/+ogTXZKhLB7k
 dR9XPrbJ7v9ouHiimRhUiZ7Qm7zv8hWI6MDFtP7PFpfLkLojd5/zu8xMHjYs79U+o0Iq
 hNV3x0IjlgHJaAhNLXrfQ716QBKc0BH8yfkAO16OBosPsUVW1Kd70oW5DbuB+v+exrqE
 NfGsZIETYs6tMhSp5wtyCAhznWmL4l8FSz81w779pOvP2i5gccFOqT9ZXvzhJ+ktY2/E
 DRWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718898412; x=1719503212;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=DPTCPOzTx0DeaHi6HiuwY5/K7xdIGnW/BJUGF4vDZG4=;
 b=mYlA4uLt2MX64d+lKWKEl/K/SZ7nAXeX1MKmAMRtewDUdmP4x1TwMxMF620fDz4gJ+
 8lleiHmjdXsgb2iUiHfl8CudNMLaXeyf1BHodPJmuB3oBpmyT7cds6Gcyk0yzEkyATDW
 Xy1QALcp7XuoT0hBeCTSfJ6of06jsqfxgQsQQTDiiNYVTtzRvIv/m30EAVwsrPWxotHD
 YrL26WBjxGi023Ikp2hgMkMjBRge/DsxyN4dVDrb+wzKks8GLebcaCZ19tGVkFQtduAR
 KEwVoYj7LAfK5WryOMOgMF8EtKr7Gt7pkbn2ZgQPMRJsA9taOK1B6YLkdrH8HNfS6iIf
 GPxg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUJwEPYzwNcNkhQPK1NigyQNr0btBJOhoBsrttuwOBkAOF2i4zmK6uTh5nNGytxFG1Jvbz8km1FNhvVpi799b3gEtRwA9JGvvw3y5PPVA3c
X-Gm-Message-State: AOJu0YxW+x4h8NACZ5cbX3cw11/5uRFjqggownuBa+nm4TAYxcRK0fww
 y5EoyNmLrH8eTYoUDlVBP4sw4re8QBtgSDYAd371+7Xk9eyx6NsqOwlgXwjU4YZkWrmUE3zqhl9
 /lKI0F2sUUfPVj4yx+OaMY8wmWc3HSeN0
X-Google-Smtp-Source: AGHT+IGWK/CO5eOSnUfKZPlA56YLXW9bxmR3azHT/+58zcCOin3DYfM5nZ6GufMWRi6/RjZ37xUSP7w4JYYq
X-Received: by 2002:a05:600c:314a:b0:421:811b:b83e with SMTP id
 5b1f17b1804b1-4246f5cfa54mr89638545e9.13.1718898412500; 
 Thu, 20 Jun 2024 08:46:52 -0700 (PDT)
Received: from raspberrypi.com ([188.39.149.98])
 by smtp-relay.gmail.com with ESMTPS id
 5b1f17b1804b1-4247d1e0679sm3229405e9.36.2024.06.20.08.46.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Jun 2024 08:46:52 -0700 (PDT)
X-Relaying-Domain: raspberrypi.com
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
To: Maxime Ripard <mripard@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org
Cc: Dave Stevenson <dave.stevenson@raspberrypi.com>
Subject: [PATCH 19/31] drm/vc4: Remove incorrect limit from hvs_dlist debugfs
 function
Date: Thu, 20 Jun 2024 16:46:20 +0100
Message-Id: <20240620154632.4125308-20-dave.stevenson@raspberrypi.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240620154632.4125308-1-dave.stevenson@raspberrypi.com>
References: <20240620154632.4125308-1-dave.stevenson@raspberrypi.com>
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

