Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DC9B4133CDA
	for <lists+dri-devel@lfdr.de>; Wed,  8 Jan 2020 09:13:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2AD6E6E862;
	Wed,  8 Jan 2020 08:12:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 79A9A6E0D5;
 Tue,  7 Jan 2020 15:13:54 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id g17so54326144wro.2;
 Tue, 07 Jan 2020 07:13:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Obgi+vCF9pVe8CuCXB1svKkTLEs23TqkO84K9EA0/yU=;
 b=MAPHBKMf0l/6lU3qY7rRYUfyprgVU/WTvLEC44WSQ7ESU1bz2EKtEdyEzzY3fON8Wl
 HF+b3Z30x+uLjBFqzyjc4QL8hgvdjjxNJ27eCtZN7OxKlVv9TKb/ixRtJ0Pn8pEm/IhN
 nhsi9U8+nAclmAd0VvjmV/WfeikvlnNAaiucvNZuXe6SXP7gGYJaSiqBAif7s88//+mY
 tIdTaw6y1sAwocJDDsaOGaF2Iia3lh9FJoypKqBP/1rsFmrdEViNO/cpm9wMiKhjFPce
 Ix9Ls9liLZu4ByPa0WieLhf/SC+777W3L9UdIwagUJZeumt+9pt9BQ+4VVBc6DPdeMwo
 eBFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Obgi+vCF9pVe8CuCXB1svKkTLEs23TqkO84K9EA0/yU=;
 b=C3Swb9B4uj70VxXZA0Y2VWUE7u5+4wgFt1Sq/02wZZdgRAPjv/xSI7V0mGV1aY82v+
 D4DCU7yPATQyZaotJ4TfRlemvPPBuXEUBLXhyODISvDE0wRnDpl9rGtPmZDvnwcmVVaL
 iI+o6TL/kLqTJvCwnpfQt/RMy9EdbdUuXAUmbeyJIzYTo1hiB4bwFd+rKUKPOSS2QBgl
 dvwYN1JebImL9Z/aexc0KxHxu/S6EVw3VbGn+UL9002wZ8ucsCPhGsbxuHdyM3UMH+NU
 ynKvVHblx5pvLOK/8FtCR5a9WzFHFOWZmVCywMaNidHdzocrSUsQhYjG2Kd0f7VyC4p0
 v22w==
X-Gm-Message-State: APjAAAUF2GBQ5x72sTERNOH/r35hDl60Y3IOteeugTdYRc9jHQtXRT/H
 uuN3kwiFhA6FbnekHaWqurA=
X-Google-Smtp-Source: APXvYqxPR3RNAYbs3VtzknDFhsHO6P2T0ip+rKpCGfW35FZGSNmo5qhhvSO9RNdIsLxFLQEOkz9WYg==
X-Received: by 2002:a5d:6886:: with SMTP id h6mr96763900wru.154.1578410033098; 
 Tue, 07 Jan 2020 07:13:53 -0800 (PST)
Received: from wambui.zuku.co.ke ([197.237.61.225])
 by smtp.googlemail.com with ESMTPSA id c4sm27076664wml.7.2020.01.07.07.13.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Jan 2020 07:13:52 -0800 (PST)
From: Wambui Karuga <wambui.karugax@gmail.com>
To: jani.nikula@linux.intel.com, joonas.lahtinen@linux.intel.com,
 rodrigo.vivi@intel.com, airlied@linux.ie, daniel@ffwll.ch
Subject: [PATCH 5/5] drm/i915: use new struct drm_device based macros.
Date: Tue,  7 Jan 2020 18:13:33 +0300
Message-Id: <7142083e727ab400797c8a90a2196ee37a22c201.1578409433.git.wambui.karugax@gmail.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <cover.1578409433.git.wambui.karugax@gmail.com>
References: <cover.1578409433.git.wambui.karugax@gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 08 Jan 2020 08:12:31 +0000
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
Cc: intel-gfx@lists.freedesktop.org, seanpaul@chromium.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Convert to the use of new struct drm_device based logging macros to
replace the use of the printk based macros in i915/intel_uncore.c

Signed-off-by: Wambui Karuga <wambui.karugax@gmail.com>
---
 drivers/gpu/drm/i915/intel_uncore.c | 25 +++++++++++++------------
 1 file changed, 13 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/i915/intel_uncore.c b/drivers/gpu/drm/i915/intel_uncore.c
index 94a97bf8c021..5f2cf6f43b8b 100644
--- a/drivers/gpu/drm/i915/intel_uncore.c
+++ b/drivers/gpu/drm/i915/intel_uncore.c
@@ -359,7 +359,8 @@ static void __gen6_gt_wait_for_fifo(struct intel_uncore *uncore)
 		if (wait_for_atomic((n = fifo_free_entries(uncore)) >
 				    GT_FIFO_NUM_RESERVED_ENTRIES,
 				    GT_FIFO_TIMEOUT_MS)) {
-			DRM_DEBUG("GT_FIFO timeout, entries: %u\n", n);
+			drm_dbg(&uncore->i915->drm,
+				"GT_FIFO timeout, entries: %u\n", n);
 			return;
 		}
 	}
@@ -432,7 +433,7 @@ intel_uncore_forcewake_reset(struct intel_uncore *uncore)
 			break;
 
 		if (--retry_count == 0) {
-			DRM_ERROR("Timed out waiting for forcewake timers to finish\n");
+			drm_err(&uncore->i915->drm, "Timed out waiting for forcewake timers to finish\n");
 			break;
 		}
 
@@ -490,7 +491,7 @@ gen6_check_for_fifo_debug(struct intel_uncore *uncore)
 	fifodbg = __raw_uncore_read32(uncore, GTFIFODBG);
 
 	if (unlikely(fifodbg)) {
-		DRM_DEBUG_DRIVER("GTFIFODBG = 0x08%x\n", fifodbg);
+		drm_dbg(&uncore->i915->drm, "GTFIFODBG = 0x08%x\n", fifodbg);
 		__raw_uncore_write32(uncore, GTFIFODBG, fifodbg);
 	}
 
@@ -562,7 +563,7 @@ void intel_uncore_resume_early(struct intel_uncore *uncore)
 	unsigned int restore_forcewake;
 
 	if (intel_uncore_unclaimed_mmio(uncore))
-		DRM_DEBUG("unclaimed mmio detected on resume, clearing\n");
+		drm_dbg(&uncore->i915->drm, "unclaimed mmio detected on resume, clearing\n");
 
 	if (!intel_uncore_has_forcewake(uncore))
 		return;
@@ -1595,8 +1596,8 @@ static int intel_uncore_fw_domains_init(struct intel_uncore *uncore)
 		spin_unlock_irq(&uncore->lock);
 
 		if (!(ecobus & FORCEWAKE_MT_ENABLE)) {
-			DRM_INFO("No MT forcewake available on Ivybridge, this can result in issues\n");
-			DRM_INFO("when using vblank-synced partial screen updates.\n");
+			drm_info(&i915->drm, "No MT forcewake available on Ivybridge, this can result in issues\n");
+			drm_info(&i915->drm, "when using vblank-synced partial screen updates.\n");
 			fw_domain_fini(uncore, FW_DOMAIN_ID_RENDER);
 			fw_domain_init(uncore, FW_DOMAIN_ID_RENDER,
 				       FORCEWAKE, FORCEWAKE_ACK);
@@ -1683,8 +1684,7 @@ static int uncore_mmio_setup(struct intel_uncore *uncore)
 		mmio_size = 2 * 1024 * 1024;
 	uncore->regs = pci_iomap(pdev, mmio_bar, mmio_size);
 	if (uncore->regs == NULL) {
-		DRM_ERROR("failed to map registers\n");
-
+		drm_err(&i915->drm, "failed to map registers\n");
 		return -EIO;
 	}
 
@@ -1807,7 +1807,7 @@ int intel_uncore_init_mmio(struct intel_uncore *uncore)
 
 	/* clear out unclaimed reg detection bit */
 	if (intel_uncore_unclaimed_mmio(uncore))
-		DRM_DEBUG("unclaimed mmio detected on uncore init, clearing\n");
+		drm_dbg(&i915->drm, "unclaimed mmio detected on uncore init, clearing\n");
 
 	return 0;
 
@@ -2072,9 +2072,10 @@ intel_uncore_arm_unclaimed_mmio_detection(struct intel_uncore *uncore)
 
 	if (unlikely(check_for_unclaimed_mmio(uncore))) {
 		if (!i915_modparams.mmio_debug) {
-			DRM_DEBUG("Unclaimed register detected, "
-				  "enabling oneshot unclaimed register reporting. "
-				  "Please use i915.mmio_debug=N for more information.\n");
+			drm_dbg(&uncore->i915->drm,
+				"Unclaimed register detected, "
+				"enabling oneshot unclaimed register reporting. "
+				"Please use i915.mmio_debug=N for more information.\n");
 			i915_modparams.mmio_debug++;
 		}
 		uncore->debug->unclaimed_mmio_check--;
-- 
2.24.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
