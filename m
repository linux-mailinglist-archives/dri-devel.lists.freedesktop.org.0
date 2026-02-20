Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eGAUMZ4EmGk4/QIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 20 Feb 2026 07:52:14 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EAA791650B6
	for <lists+dri-devel@lfdr.de>; Fri, 20 Feb 2026 07:52:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C755010E1E4;
	Fri, 20 Feb 2026 06:52:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.b="nNetMoIg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [198.137.202.133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B00B310E792;
 Fri, 20 Feb 2026 06:52:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
 To:From:Sender:Reply-To:Content-ID:Content-Description;
 bh=qLQ1xDm2Cr0RYEZeyd9Zi3xB484+HFF151CIFZ79Xz8=; b=nNetMoIgjx5EI6v02f+mTWaTHW
 MHlwnvnn7+beFcFXNlRGLn845EmUJFNu4KDxRj5YFLy7TEk11rrdM4yNM1XS8Cfp3z+uX76l6P+W9
 Gzb0urCyjimbehKZ0BUQU41THDmKiVkJZDKlHL+HDsho+bXo/CD6kYDANjhj5AQBP62b5tIXxEifa
 061zyIiB7mZpyuiSecJJ8MePEIu0Wj9pnziOdaoVBBsRiMvPndNiqm1zOQE8rjCAbqHPvKLM39Rww
 0YP0LCtL60gwzaWY7zw3+WXFfEm8szJUYbuA7BwRnoCvq6qFemZwy4m/SGhDjEaF5yKvwO+ko/SKe
 YsC5y5BQ==;
Received: from [50.53.43.113] (helo=bombadil.infradead.org)
 by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
 id 1vtKMx-0000000DKX2-0P3d; Fri, 20 Feb 2026 06:52:07 +0000
From: Randy Dunlap <rdunlap@infradead.org>
To: dri-devel@lists.freedesktop.org
Cc: Randy Dunlap <rdunlap@infradead.org>,
 Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Rodrigo Siqueira <siqueira@igalia.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 amd-gfx@lists.freedesktop.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 3/3] drm/amd/display: dmub_cmd.h: add missing kernel-doc for
 enums
Date: Thu, 19 Feb 2026 22:51:55 -0800
Message-ID: <20260220065205.1036179-3-rdunlap@infradead.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260220065205.1036179-1-rdunlap@infradead.org>
References: <20260220065205.1036179-1-rdunlap@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.49 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_REJECT(1.00)[infradead.org:s=bombadil.20210309];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[infradead.org : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	NEURAL_HAM(-0.00)[-0.997];
	FROM_NEQ_ENVFROM(0.00)[rdunlap@infradead.org,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[infradead.org:-];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[infradead.org:mid,infradead.org:email,igalia.com:email,amd.com:email,intel.com:email,suse.de:email,lists.freedesktop.org:email,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: EAA791650B6
X-Rspamd-Action: no action

For enums that have a kernel-doc ("/**") comment block, add or correct
their kernel-doc to eliminate all kernel-doc enum warnings.

Some of these needed "struct" changed to "enum" in the kernel-doc header.
For a few of them, I changed the "/**" comment to a plain "/*"
comment since there was no kernel-doc content there.

Example:

Warning: drivers/gpu/drm/amd/display/dmub/inc/dmub_cmd.h:2673 Enum value 'FAMS2_ALLOW_DELAY_CHECK_NONE' not described in enum 'dmub_fams2_allow_delay_check_mode'
Warning: drivers/gpu/drm/amd/display/dmub/inc/dmub_cmd.h:2673 Enum value 'FAMS2_ALLOW_DELAY_CHECK_FROM_START' not described in enum 'dmub_fams2_allow_delay_check_mode'
Warning: drivers/gpu/drm/amd/display/dmub/inc/dmub_cmd.h:2673 Enum value 'FAMS2_ALLOW_DELAY_CHECK_FROM_PREPARE' not described in enum 'dmub_fams2_allow_delay_check_mode'

All .o files are the same with or without this patch.

Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
---
Cc: Harry Wentland <harry.wentland@amd.com>
Cc: Leo Li <sunpeng.li@amd.com>
Cc: Rodrigo Siqueira <siqueira@igalia.com>
Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: Christian König <christian.koenig@amd.com>
Cc: amd-gfx@lists.freedesktop.org
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: Thomas Zimmermann <tzimmermann@suse.de>

 drivers/gpu/drm/amd/display/dmub/inc/dmub_cmd.h |  160 +++++++++-----
 1 file changed, 110 insertions(+), 50 deletions(-)

--- linux-next-20260218.orig/drivers/gpu/drm/amd/display/dmub/inc/dmub_cmd.h
+++ linux-next-20260218/drivers/gpu/drm/amd/display/dmub/inc/dmub_cmd.h
@@ -1007,15 +1007,30 @@ union dmub_fw_boot_status {
  * enum dmub_fw_boot_status_bit - Enum bit definitions for SCRATCH0.
  */
 enum dmub_fw_boot_status_bit {
-	DMUB_FW_BOOT_STATUS_BIT_DAL_FIRMWARE = (1 << 0), /**< 1 if DAL FW */
-	DMUB_FW_BOOT_STATUS_BIT_MAILBOX_READY = (1 << 1), /**< 1 if mailbox ready */
-	DMUB_FW_BOOT_STATUS_BIT_OPTIMIZED_INIT_DONE = (1 << 2), /**< 1 if init done */
-	DMUB_FW_BOOT_STATUS_BIT_RESTORE_REQUIRED = (1 << 3), /**< 1 if driver should call restore */
-	DMUB_FW_BOOT_STATUS_BIT_DEFERRED_LOADED = (1 << 4), /**< 1 if VBIOS data is deferred programmed */
-	DMUB_FW_BOOT_STATUS_BIT_FAMS_ENABLED = (1 << 5), /**< 1 if FAMS is enabled*/
-	DMUB_FW_BOOT_STATUS_BIT_DETECTION_REQUIRED = (1 << 6), /**< 1 if detection need to be triggered by driver*/
-	DMUB_FW_BOOT_STATUS_BIT_HW_POWER_INIT_DONE = (1 << 7), /**< 1 if hw power init is completed */
-	DMUB_FW_BOOT_STATUS_BIT_ONO_REGIONS_ENABLED = (1 << 8), /**< 1 if ONO regions are enabled */
+	/** @DMUB_FW_BOOT_STATUS_BIT_DAL_FIRMWARE: 1 if DAL FW */
+	DMUB_FW_BOOT_STATUS_BIT_DAL_FIRMWARE = (1 << 0),
+	/** @DMUB_FW_BOOT_STATUS_BIT_MAILBOX_READY: 1 if mailbox ready */
+	DMUB_FW_BOOT_STATUS_BIT_MAILBOX_READY = (1 << 1),
+	/** @DMUB_FW_BOOT_STATUS_BIT_OPTIMIZED_INIT_DONE: 1 if init done */
+	DMUB_FW_BOOT_STATUS_BIT_OPTIMIZED_INIT_DONE = (1 << 2),
+	/** @DMUB_FW_BOOT_STATUS_BIT_RESTORE_REQUIRED: 1 if driver should call restore */
+	DMUB_FW_BOOT_STATUS_BIT_RESTORE_REQUIRED = (1 << 3),
+	/**
+	 * @DMUB_FW_BOOT_STATUS_BIT_DEFERRED_LOADED: 1 if VBIOS data is
+	 * deferred programmed
+	 */
+	DMUB_FW_BOOT_STATUS_BIT_DEFERRED_LOADED = (1 << 4),
+	/** @DMUB_FW_BOOT_STATUS_BIT_FAMS_ENABLED: 1 if FAMS is enabled */
+	DMUB_FW_BOOT_STATUS_BIT_FAMS_ENABLED = (1 << 5),
+	/**
+	 * @DMUB_FW_BOOT_STATUS_BIT_DETECTION_REQUIRED: 1 if detection needs
+	 * to be triggered by driver
+	 */
+	DMUB_FW_BOOT_STATUS_BIT_DETECTION_REQUIRED = (1 << 6),
+	/** @DMUB_FW_BOOT_STATUS_BIT_HW_POWER_INIT_DONE: 1 if hw power init is completed */
+	DMUB_FW_BOOT_STATUS_BIT_HW_POWER_INIT_DONE = (1 << 7),
+	/** @DMUB_FW_BOOT_STATUS_BIT_ONO_REGIONS_ENABLED: if ONO regions are enabled */
+	DMUB_FW_BOOT_STATUS_BIT_ONO_REGIONS_ENABLED = (1 << 8),
 };
 
 /* Register bit definition for SCRATCH5 */
@@ -1079,18 +1094,22 @@ enum dmub_ips_comand_type {
  */
 enum dmub_cursor_offload_comand_type {
 	/**
+	 * @DMUB_CMD__CURSOR_OFFLOAD_INIT:
 	 * Initializes the cursor offload feature.
 	 */
 	DMUB_CMD__CURSOR_OFFLOAD_INIT = 0,
 	/**
-	 * Enables cursor offloading for a stream and updates the timing parameters.
+	 * @DMUB_CMD__CURSOR_OFFLOAD_STREAM_ENABLE: Enables cursor offloading
+	 * for a stream and updates the timing parameters.
 	 */
 	DMUB_CMD__CURSOR_OFFLOAD_STREAM_ENABLE = 1,
 	/**
+	 * @DMUB_CMD__CURSOR_OFFLOAD_STREAM_DISABLE:
 	 * Disables cursor offloading for a given stream.
 	 */
 	DMUB_CMD__CURSOR_OFFLOAD_STREAM_DISABLE = 2,
 	/**
+	 * @DMUB_CMD__CURSOR_OFFLOAD_STREAM_PROGRAM:
 	 * Programs the latest data for a given stream.
 	 */
 	DMUB_CMD__CURSOR_OFFLOAD_STREAM_PROGRAM = 3,
@@ -1156,7 +1175,7 @@ enum dmub_fw_boot_options_bit {
  * [Header (256 Bytes)][Feature 1 (256 Bytes)][Feature 2 (256 Bytes)]...
  */
 
-/**
+/*
  * enum dmub_shared_state_feature_id - List of shared state features.
  */
 enum dmub_shared_state_feature_id {
@@ -1262,14 +1281,14 @@ struct dmub_shared_state_cursor_offload_
 }; /* 248-bytes, fixed */
 
 /**
- * enum dmub_shared_state_feature_common - Generic payload.
+ * struct dmub_shared_state_feature_common - Generic payload.
  */
 struct dmub_shared_state_feature_common {
 	uint32_t padding[62];
 }; /* 248-bytes, fixed */
 
 /**
- * enum dmub_shared_state_feature_header - Feature description.
+ * struct dmub_shared_state_feature_header - Feature description.
  */
 struct dmub_shared_state_feature_header {
 	uint16_t id; /**< Feature ID */
@@ -1909,30 +1928,36 @@ enum dmub_cmd_type {
  */
 enum dmub_out_cmd_type {
 	/**
-	 * Invalid outbox command, ignored.
+	 * @DMUB_OUT_CMD__NULL: Invalid outbox command, ignored.
 	 */
 	DMUB_OUT_CMD__NULL = 0,
 	/**
+	 * @DMUB_OUT_CMD__DP_AUX_REPLY:
 	 * Command type used for DP AUX Reply data notification
 	 */
 	DMUB_OUT_CMD__DP_AUX_REPLY = 1,
 	/**
+	 * @DMUB_OUT_CMD__DP_HPD_NOTIFY:
 	 * Command type used for DP HPD event notification
 	 */
 	DMUB_OUT_CMD__DP_HPD_NOTIFY = 2,
 	/**
+	 * @DMUB_OUT_CMD__SET_CONFIG_REPLY:
 	 * Command type used for SET_CONFIG Reply notification
 	 */
 	DMUB_OUT_CMD__SET_CONFIG_REPLY = 3,
 	/**
+	 * @DMUB_OUT_CMD__DPIA_NOTIFICATION:
 	 * Command type used for USB4 DPIA notification
 	 */
 	DMUB_OUT_CMD__DPIA_NOTIFICATION = 5,
 	/**
+	 * @DMUB_OUT_CMD__HPD_SENSE_NOTIFY:
 	 * Command type used for HPD redetect notification
 	 */
 	DMUB_OUT_CMD__HPD_SENSE_NOTIFY = 6,
 	/**
+	 * @DMUB_OUT_CMD__FUSED_IO:
 	 * Command type used for Fused IO notification
 	 */
 	DMUB_OUT_CMD__FUSED_IO = 7,
@@ -2124,19 +2149,19 @@ struct dmub_rb_cmd_PLAT_54186_wa {
  */
 enum dmub_cmd_mall_type {
 	/**
-	 * Allows display refresh from MALL.
+	 * @DMUB_CMD__MALL_ACTION_ALLOW: Allows display refresh from MALL.
 	 */
 	DMUB_CMD__MALL_ACTION_ALLOW = 0,
 	/**
-	 * Disallows display refresh from MALL.
+	 * @DMUB_CMD__MALL_ACTION_DISALLOW: Disallows display refresh from MALL.
 	 */
 	DMUB_CMD__MALL_ACTION_DISALLOW = 1,
 	/**
-	 * Cursor copy for MALL.
+	 * @DMUB_CMD__MALL_ACTION_COPY_CURSOR: Cursor copy for MALL.
 	 */
 	DMUB_CMD__MALL_ACTION_COPY_CURSOR = 2,
 	/**
-	 * Controls DF requests.
+	 * @DMUB_CMD__MALL_ACTION_NO_DF_REQ: Controls DF requests.
 	 */
 	DMUB_CMD__MALL_ACTION_NO_DF_REQ = 3,
 };
@@ -2165,18 +2190,21 @@ struct dmub_rb_cmd_mall {
  */
 enum dmub_cmd_cab_type {
 	/**
+	 * @DMUB_CMD__CAB_NO_IDLE_OPTIMIZATION:
 	 * No idle optimizations (i.e. no CAB)
 	 */
 	DMUB_CMD__CAB_NO_IDLE_OPTIMIZATION = 0,
 	/**
-	 * No DCN requests for memory
+	 * @DMUB_CMD__CAB_NO_DCN_REQ: No DCN requests for memory
 	 */
 	DMUB_CMD__CAB_NO_DCN_REQ = 1,
 	/**
+	 * @DMUB_CMD__CAB_DCN_SS_FIT_IN_CAB:
 	 * Fit surfaces in CAB (i.e. CAB enable)
 	 */
 	DMUB_CMD__CAB_DCN_SS_FIT_IN_CAB = 2,
 	/**
+	 * @DMUB_CMD__CAB_DCN_SS_NOT_FIT_IN_CAB:
 	 * Do not fit surfaces in CAB (i.e. no CAB)
 	 */
 	DMUB_CMD__CAB_DCN_SS_NOT_FIT_IN_CAB = 3,
@@ -2191,7 +2219,7 @@ struct dmub_rb_cmd_cab_for_ss {
 	uint8_t debug_bits;     /* debug bits */
 };
 
-/**
+/*
  * Enum for indicating which MCLK switch mode per pipe
  */
 enum mclk_switch_mode {
@@ -2665,11 +2693,18 @@ struct dmub_fams2_stream_static_state_v1
  * p-state request to allow latency
  */
 enum dmub_fams2_allow_delay_check_mode {
-	/* No check for request to allow delay */
+	/**
+	 * @FAMS2_ALLOW_DELAY_CHECK_NONE: No check for request to allow delay
+	 */
 	FAMS2_ALLOW_DELAY_CHECK_NONE = 0,
-	/* Check for request to allow delay */
+	/**
+	 * @FAMS2_ALLOW_DELAY_CHECK_FROM_START: Check for request to allow delay
+	 */
 	FAMS2_ALLOW_DELAY_CHECK_FROM_START = 1,
-	/* Check for prepare to allow delay */
+	/**
+	 * @FAMS2_ALLOW_DELAY_CHECK_FROM_PREPARE:
+	 * Check for prepare to allow delay
+	 */
 	FAMS2_ALLOW_DELAY_CHECK_FROM_PREPARE = 2,
 };
 
@@ -2741,27 +2776,28 @@ struct dmub_rb_cmd_ib {
  */
 enum dmub_cmd_idle_opt_type {
 	/**
-	 * DCN hardware restore.
+	 * @DMUB_CMD__IDLE_OPT_DCN_RESTORE: DCN hardware restore.
 	 */
 	DMUB_CMD__IDLE_OPT_DCN_RESTORE = 0,
 
 	/**
-	 * DCN hardware save.
+	 * @DMUB_CMD__IDLE_OPT_DCN_SAVE_INIT: DCN hardware save.
 	 */
 	DMUB_CMD__IDLE_OPT_DCN_SAVE_INIT = 1,
 
 	/**
-	 * DCN hardware notify idle.
+	 * @DMUB_CMD__IDLE_OPT_DCN_NOTIFY_IDLE: DCN hardware notify idle.
 	 */
 	DMUB_CMD__IDLE_OPT_DCN_NOTIFY_IDLE = 2,
 
 	/**
+	 * @DMUB_CMD__IDLE_OPT_SET_DC_POWER_STATE:
 	 * DCN hardware notify power state.
 	 */
 	DMUB_CMD__IDLE_OPT_SET_DC_POWER_STATE = 3,
 
 	/**
-	 * DCN notify to release HW.
+	 * @DMUB_CMD__IDLE_OPT_RELEASE_HW: DCN notify to release HW.
 	 */
 	 DMUB_CMD__IDLE_OPT_RELEASE_HW = 4,
 };
@@ -2790,7 +2826,7 @@ struct dmub_rb_cmd_idle_opt_dcn_notify_i
 	struct dmub_dcn_notify_idle_cntl_data cntl_data;
 };
 
-/**
+/*
  * enum dmub_idle_opt_dc_power_state - DC power states.
  */
 enum dmub_idle_opt_dc_power_state {
@@ -2832,7 +2868,7 @@ struct dmub_clocks {
  */
 enum dmub_cmd_clk_mgr_type {
 	/**
-	 * Notify DMCUB of clock update.
+	 * @DMUB_CMD__CLK_MGR_NOTIFY_CLOCKS: Notify DMCUB of clock update.
 	 */
 	DMUB_CMD__CLK_MGR_NOTIFY_CLOCKS = 0,
 };
@@ -3077,21 +3113,40 @@ struct dmub_rb_cmd_dpphy_init {
  * 4 AUX request command bits are shifted to high nibble.
  */
 enum dp_aux_request_action {
-	/** I2C-over-AUX write request */
+	/**
+	 * @DP_AUX_REQ_ACTION_I2C_WRITE: I2C-over-AUX write request
+	 */
 	DP_AUX_REQ_ACTION_I2C_WRITE		= 0x00,
-	/** I2C-over-AUX read request */
+	/**
+	 * @DP_AUX_REQ_ACTION_I2C_READ: I2C-over-AUX read request
+	 */
 	DP_AUX_REQ_ACTION_I2C_READ		= 0x10,
-	/** I2C-over-AUX write status request */
+	/**
+	 * @DP_AUX_REQ_ACTION_I2C_STATUS_REQ: I2C-over-AUX write status request
+	 */
 	DP_AUX_REQ_ACTION_I2C_STATUS_REQ	= 0x20,
-	/** I2C-over-AUX write request with MOT=1 */
+	/**
+	 * @DP_AUX_REQ_ACTION_I2C_WRITE_MOT:
+	 * I2C-over-AUX write request with MOT=1
+	 */
 	DP_AUX_REQ_ACTION_I2C_WRITE_MOT		= 0x40,
-	/** I2C-over-AUX read request with MOT=1 */
+	/**
+	 * @DP_AUX_REQ_ACTION_I2C_READ_MOT:
+	 * I2C-over-AUX read request with MOT=1
+	 */
 	DP_AUX_REQ_ACTION_I2C_READ_MOT		= 0x50,
-	/** I2C-over-AUX write status request with MOT=1 */
+	/**
+	 * @DP_AUX_REQ_ACTION_I2C_STATUS_REQ_MOT:
+	 * I2C-over-AUX write status request with MOT=1
+	 */
 	DP_AUX_REQ_ACTION_I2C_STATUS_REQ_MOT	= 0x60,
-	/** Native AUX write request */
+	/**
+	 * @DP_AUX_REQ_ACTION_DPCD_WRITE: Native AUX write request
+	 */
 	DP_AUX_REQ_ACTION_DPCD_WRITE		= 0x80,
-	/** Native AUX read request */
+	/**
+	 * @DP_AUX_REQ_ACTION_DPCD_READ: Native AUX read request
+	 */
 	DP_AUX_REQ_ACTION_DPCD_READ		= 0x90
 };
 
@@ -3099,21 +3154,21 @@ enum dp_aux_request_action {
  * enum aux_return_code_type - DP AUX process return code listing.
  */
 enum aux_return_code_type {
-	/** AUX process succeeded */
+	/** @AUX_RET_SUCCESS: AUX process succeeded */
 	AUX_RET_SUCCESS = 0,
-	/** AUX process failed with unknown reason */
+	/** @AUX_RET_ERROR_UNKNOWN: AUX process failed with unknown reason */
 	AUX_RET_ERROR_UNKNOWN,
-	/** AUX process completed with invalid reply */
+	/** @AUX_RET_ERROR_INVALID_REPLY: AUX process completed with invalid reply */
 	AUX_RET_ERROR_INVALID_REPLY,
-	/** AUX process timed out */
+	/** @AUX_RET_ERROR_TIMEOUT: AUX process timed out */
 	AUX_RET_ERROR_TIMEOUT,
-	/** HPD was low during AUX process */
+	/** @AUX_RET_ERROR_HPD_DISCON: HPD was low during AUX process */
 	AUX_RET_ERROR_HPD_DISCON,
-	/** Failed to acquire AUX engine */
+	/** @AUX_RET_ERROR_ENGINE_ACQUIRE: Failed to acquire AUX engine */
 	AUX_RET_ERROR_ENGINE_ACQUIRE,
-	/** AUX request not supported */
+	/** @AUX_RET_ERROR_INVALID_OPERATION: AUX request not supported */
 	AUX_RET_ERROR_INVALID_OPERATION,
-	/** AUX process not available */
+	/** @AUX_RET_ERROR_PROTOCOL_ERROR: AUX process not available */
 	AUX_RET_ERROR_PROTOCOL_ERROR,
 };
 
@@ -3121,9 +3176,9 @@ enum aux_return_code_type {
  * enum aux_channel_type - DP AUX channel type listing.
  */
 enum aux_channel_type {
-	/** AUX thru Legacy DP AUX */
+	/** @AUX_CHANNEL_LEGACY_DDC: AUX thru Legacy DP AUX */
 	AUX_CHANNEL_LEGACY_DDC,
-	/** AUX thru DPIA DP tunneling */
+	/** @AUX_CHANNEL_DPIA: AUX thru DPIA DP tunneling */
 	AUX_CHANNEL_DPIA
 };
 
@@ -3608,7 +3663,7 @@ enum phy_link_rate {
 	 */
 };
 
-/**
+/*
  * enum dmub_phy_fsm_state - PHY FSM states.
  * PHY FSM state to transit to during PSR enable/disable.
  */
@@ -5825,10 +5880,11 @@ struct dmub_rb_cmd_abm_query_caps {
  */
 enum dmub_abm_ace_curve_type {
 	/**
-	 * ACE curve as defined by the SW layer.
+	 * @ABM_ACE_CURVE_TYPE__SW: ACE curve as defined by the SW layer.
 	 */
 	ABM_ACE_CURVE_TYPE__SW = 0,
 	/**
+	 * @ABM_ACE_CURVE_TYPE__SW_IF:
 	 * ACE curve as defined by the SW to HW translation interface layer.
 	 */
 	ABM_ACE_CURVE_TYPE__SW_IF = 1,
@@ -5839,10 +5895,11 @@ enum dmub_abm_ace_curve_type {
  */
 enum dmub_abm_histogram_type {
 	/**
-	 * ACE curve as defined by the SW layer.
+	 * @ABM_HISTOGRAM_TYPE__SW: ACE curve as defined by the SW layer.
 	 */
 	ABM_HISTOGRAM_TYPE__SW = 0,
 	/**
+	 * @ABM_HISTOGRAM_TYPE__SW_IF:
 	 * ACE curve as defined by the SW to HW translation interface layer.
 	 */
 	ABM_HISTOGRAM_TYPE__SW_IF = 1,
@@ -6048,14 +6105,17 @@ struct dmub_rb_cmd_get_visual_confirm_co
  */
 enum dmub_cmd_panel_cntl_type {
 	/**
+	 * @DMUB_CMD__PANEL_CNTL_HW_INIT:
 	 * Initializes embedded panel hardware blocks.
 	 */
 	DMUB_CMD__PANEL_CNTL_HW_INIT = 0,
 	/**
+	 * @DMUB_CMD__PANEL_CNTL_QUERY_BACKLIGHT_INFO:
 	 * Queries backlight info for the embedded panel.
 	 */
 	DMUB_CMD__PANEL_CNTL_QUERY_BACKLIGHT_INFO = 1,
 	/**
+	 * @DMUB_CMD__PANEL_DEBUG_PWM_FREQ:
 	 * Sets the PWM Freq as per user's requirement.
 	 */
 	DMUB_CMD__PANEL_DEBUG_PWM_FREQ = 2,
