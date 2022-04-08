Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BC2E74F924C
	for <lists+dri-devel@lfdr.de>; Fri,  8 Apr 2022 11:55:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E37ED10EFF6;
	Fri,  8 Apr 2022 09:55:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x832.google.com (mail-qt1-x832.google.com
 [IPv6:2607:f8b0:4864:20::832])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 47D2B10EFF6;
 Fri,  8 Apr 2022 09:55:41 +0000 (UTC)
Received: by mail-qt1-x832.google.com with SMTP id t2so10171077qtw.9;
 Fri, 08 Apr 2022 02:55:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=MxHsvmkk8E+8FpG6AO+OTMlzwh4VkmczYAqMfO0S5aY=;
 b=BjuUx+JN6YPMS4VPTaoGRmF4THiXRmE5dClVXANJdixb00Tmbx9YBz44v7xr2sb/13
 LsbzNJoCfAgPqUlohr+6TaSVVNqSo7rC55YUfi2rarKPR3ezym6sz21lsd8Cexf3unTk
 iWmArqHoI/zthTWFhuEmH533coMXfmKduMUE+EP4aFHb2DOBjXTuWmx/J+cykgsbhfij
 +K+2UM+53MJu5JL/0X0+sFTripwxwLzwKie/EnhqZkC9Ee0i3ycinT8wcvcOw6jJinD0
 WhssIJRDulkEyq3DldPQz7sCjE794etEPc7n8izJvBs8jLMK1gcdbch9lSHtXUAEvBHP
 US9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=MxHsvmkk8E+8FpG6AO+OTMlzwh4VkmczYAqMfO0S5aY=;
 b=t0aNpY1899XYuHW+CZUlDEqaIjRIbHD/82vlQ20GA03DO4aGPQ8uuTYgiwj7RkwNYy
 UCbBBTJR25dgziCegVsUoX26rjZJRchQFleQ9UzS66Zbb2CdxDuyK1IzT4cO0XDmShEK
 Ue2lYCxIkTT3hP+2VNW2RhVPDUlH21x4hzW/9sGhbd+HrfZeKxQ3EtUpAtCaI2okttkU
 fJFC0djY5tjMI3MR7RgZ9SM9u/auCQU3Aa0MPUXW7Wb4niXGZQJ5QpCUmA0hKNPF1sZ7
 14r/X2ZGr664cgcHIqfdkmj/eFee9UfHQSeNJVwZWLBcax7brrNjeWOKi1pblVi+OjvQ
 A/fA==
X-Gm-Message-State: AOAM532rKwwzBtI/uNShGLYAB19rcB+OvWmjiFIPq7yMR+JkxjWpLnzt
 yYqRhifTSy4qOWixkyZYjBI=
X-Google-Smtp-Source: ABdhPJzWJ5ni8b38p1rxFytKpgn8pmy+7CSvFE2lehyOcyiuL5HOJcAl+7zIec6Yxf6Sj0fsKsSi9w==
X-Received: by 2002:a05:622a:1308:b0:2e1:e8a9:8aaf with SMTP id
 v8-20020a05622a130800b002e1e8a98aafmr15320487qtk.282.1649411740330; 
 Fri, 08 Apr 2022 02:55:40 -0700 (PDT)
Received: from localhost.localdomain ([193.203.214.57])
 by smtp.gmail.com with ESMTPSA id
 u13-20020a05622a010d00b002e1d653c2e1sm18122546qtw.46.2022.04.08.02.55.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Apr 2022 02:55:39 -0700 (PDT)
From: cgel.zte@gmail.com
X-Google-Original-From: lv.ruyi@zte.com.cn
To: alexander.deucher@amd.com, christian.koenig@amd.com, Xinhui.Pan@amd.com,
 airlied@linux.ie
Subject: [PATCH] drivers: Fix spelling mistake "writting" -> "writing"
Date: Fri,  8 Apr 2022 09:55:31 +0000
Message-Id: <20220408095531.2495168-1-lv.ruyi@zte.com.cn>
X-Mailer: git-send-email 2.25.1
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
Cc: linux-rtc@vger.kernel.org, tvrtko.ursulin@linux.intel.com,
 dri-devel@lists.freedesktop.org, linux-scsi@vger.kernel.org,
 netdev@vger.kernel.org, lv.ruyi@zte.com.cn, linux-wireless@vger.kernel.org,
 linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, rodrigo.vivi@intel.com,
 Zeal Robot <zealci@zte.com.cn>, intel-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Lv Ruyi <lv.ruyi@zte.com.cn>

There are some spelling mistakes in the comments. Fix it.

Reported-by: Zeal Robot <zealci@zte.com.cn>
Signed-off-by: Lv Ruyi <lv.ruyi@zte.com.cn>
---
 drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c              | 2 +-
 drivers/gpu/drm/i915/i915_request.c                 | 2 +-
 drivers/net/ethernet/sfc/mcdi_pcol.h                | 4 ++--
 drivers/net/ethernet/toshiba/tc35815.c              | 2 +-
 drivers/net/wireless/realtek/rtlwifi/rtl8192cu/hw.c | 4 ++--
 drivers/platform/x86/hp_accel.c                     | 2 +-
 drivers/rtc/rtc-sa1100.c                            | 2 +-
 drivers/scsi/pmcraid.c                              | 4 ++--
 8 files changed, 11 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c b/drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c
index 9426e252d8aa..ce361fce7155 100644
--- a/drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c
@@ -7304,7 +7304,7 @@ static void gfx_v10_0_setup_grbm_cam_remapping(struct amdgpu_device *adev)
 		return;
 
 	/* initialize cam_index to 0
-	 * index will auto-inc after each data writting */
+	 * index will auto-inc after each data writing */
 	WREG32_SOC15(GC, 0, mmGRBM_CAM_INDEX, 0);
 
 	switch (adev->ip_versions[GC_HWIP][0]) {
diff --git a/drivers/gpu/drm/i915/i915_request.c b/drivers/gpu/drm/i915/i915_request.c
index 582770360ad1..cf79a25cd98a 100644
--- a/drivers/gpu/drm/i915/i915_request.c
+++ b/drivers/gpu/drm/i915/i915_request.c
@@ -451,7 +451,7 @@ static bool __request_in_flight(const struct i915_request *signal)
 	 * to avoid tearing.]
 	 *
 	 * Note that the read of *execlists->active may race with the promotion
-	 * of execlists->pending[] to execlists->inflight[], overwritting
+	 * of execlists->pending[] to execlists->inflight[], overwriting
 	 * the value at *execlists->active. This is fine. The promotion implies
 	 * that we received an ACK from the HW, and so the context is not
 	 * stuck -- if we do not see ourselves in *active, the inflight status
diff --git a/drivers/net/ethernet/sfc/mcdi_pcol.h b/drivers/net/ethernet/sfc/mcdi_pcol.h
index d3fcbf930dba..ff617b1b38d3 100644
--- a/drivers/net/ethernet/sfc/mcdi_pcol.h
+++ b/drivers/net/ethernet/sfc/mcdi_pcol.h
@@ -73,8 +73,8 @@
  *               \------------------------------ Resync (always set)
  *
  * The client writes it's request into MC shared memory, and rings the
- * doorbell. Each request is completed by either by the MC writting
- * back into shared memory, or by writting out an event.
+ * doorbell. Each request is completed by either by the MC writing
+ * back into shared memory, or by writing out an event.
  *
  * All MCDI commands support completion by shared memory response. Each
  * request may also contain additional data (accounted for by HEADER.LEN),
diff --git a/drivers/net/ethernet/toshiba/tc35815.c b/drivers/net/ethernet/toshiba/tc35815.c
index ce38f7515225..1b4c207afb66 100644
--- a/drivers/net/ethernet/toshiba/tc35815.c
+++ b/drivers/net/ethernet/toshiba/tc35815.c
@@ -157,7 +157,7 @@ struct tc35815_regs {
 #define PROM_Read	       0x00004000 /*10:Read operation		     */
 #define PROM_Write	       0x00002000 /*01:Write operation		     */
 #define PROM_Erase	       0x00006000 /*11:Erase operation		     */
-					  /*00:Enable or Disable Writting,   */
+					  /*00:Enable or Disable Writing,    */
 					  /*	  as specified in PROM_Addr. */
 #define PROM_Addr_Ena	       0x00000030 /*11xxxx:PROM Write enable	     */
 					  /*00xxxx:	      disable	     */
diff --git a/drivers/net/wireless/realtek/rtlwifi/rtl8192cu/hw.c b/drivers/net/wireless/realtek/rtlwifi/rtl8192cu/hw.c
index eaba66113328..fbb4941d0da8 100644
--- a/drivers/net/wireless/realtek/rtlwifi/rtl8192cu/hw.c
+++ b/drivers/net/wireless/realtek/rtlwifi/rtl8192cu/hw.c
@@ -520,7 +520,7 @@ static void _rtl92cu_init_queue_reserved_page(struct ieee80211_hw *hw,
 		 * 2 out-ep. Remainder pages have assigned to High queue */
 		if (outepnum > 1 && txqremaininpage)
 			numhq += txqremaininpage;
-		/* NOTE: This step done before writting REG_RQPN. */
+		/* NOTE: This step done before writing REG_RQPN. */
 		if (ischipn) {
 			if (queue_sel & TX_SELE_NQ)
 				numnq = txqpageunit;
@@ -539,7 +539,7 @@ static void _rtl92cu_init_queue_reserved_page(struct ieee80211_hw *hw,
 			numlq = ischipn ? WMM_CHIP_B_PAGE_NUM_LPQ :
 				WMM_CHIP_A_PAGE_NUM_LPQ;
 		}
-		/* NOTE: This step done before writting REG_RQPN. */
+		/* NOTE: This step done before writing REG_RQPN. */
 		if (ischipn) {
 			if (queue_sel & TX_SELE_NQ)
 				numnq = WMM_CHIP_B_PAGE_NUM_NPQ;
diff --git a/drivers/platform/x86/hp_accel.c b/drivers/platform/x86/hp_accel.c
index e9f852f7c27f..b59b852a666f 100644
--- a/drivers/platform/x86/hp_accel.c
+++ b/drivers/platform/x86/hp_accel.c
@@ -122,7 +122,7 @@ static int lis3lv02d_acpi_read(struct lis3lv02d *lis3, int reg, u8 *ret)
 static int lis3lv02d_acpi_write(struct lis3lv02d *lis3, int reg, u8 val)
 {
 	struct acpi_device *dev = lis3->bus_priv;
-	unsigned long long ret; /* Not used when writting */
+	unsigned long long ret; /* Not used when writing */
 	union acpi_object in_obj[2];
 	struct acpi_object_list args = { 2, in_obj };
 
diff --git a/drivers/rtc/rtc-sa1100.c b/drivers/rtc/rtc-sa1100.c
index 1250887e4382..a52a333de8e8 100644
--- a/drivers/rtc/rtc-sa1100.c
+++ b/drivers/rtc/rtc-sa1100.c
@@ -231,7 +231,7 @@ int sa1100_rtc_init(struct platform_device *pdev, struct sa1100_rtc *info)
 	 * initialization is unknown and could in principle happen during
 	 * normal processing.
 	 *
-	 * Notice that clearing bit 1 and 0 is accomplished by writting ONES to
+	 * Notice that clearing bit 1 and 0 is accomplished by writing ONES to
 	 * the corresponding bits in RTSR. */
 	writel_relaxed(RTSR_AL | RTSR_HZ, info->rtsr);
 
diff --git a/drivers/scsi/pmcraid.c b/drivers/scsi/pmcraid.c
index fd674ed1febe..d7f4680f6106 100644
--- a/drivers/scsi/pmcraid.c
+++ b/drivers/scsi/pmcraid.c
@@ -857,7 +857,7 @@ static void _pmcraid_fire_command(struct pmcraid_cmd *cmd)
 	unsigned long lock_flags;
 
 	/* Add this command block to pending cmd pool. We do this prior to
-	 * writting IOARCB to ioarrin because IOA might complete the command
+	 * writing IOARCB to ioarrin because IOA might complete the command
 	 * by the time we are about to add it to the list. Response handler
 	 * (isr/tasklet) looks for cmd block in the pending pending list.
 	 */
@@ -2450,7 +2450,7 @@ static void pmcraid_request_sense(struct pmcraid_cmd *cmd)
 
 	/* request sense might be called as part of error response processing
 	 * which runs in tasklets context. It is possible that mid-layer might
-	 * schedule queuecommand during this time, hence, writting to IOARRIN
+	 * schedule queuecommand during this time, hence, writing to IOARRIN
 	 * must be protect by host_lock
 	 */
 	pmcraid_send_cmd(cmd, pmcraid_erp_done,
-- 
2.25.1


