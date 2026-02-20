Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eG5xL6EEmGk4/QIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 20 Feb 2026 07:52:17 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 731B21650C4
	for <lists+dri-devel@lfdr.de>; Fri, 20 Feb 2026 07:52:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4DCB210E794;
	Fri, 20 Feb 2026 06:52:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.b="0QJYLlDf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [198.137.202.133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B3A2710E794;
 Fri, 20 Feb 2026 06:52:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
 To:From:Sender:Reply-To:Content-ID:Content-Description;
 bh=dx1dnktvppkCGIBwbwkibz4i01EUu+vVFw3OIkmFqZ0=; b=0QJYLlDfMjIzaz+IK6FCwJ3WX0
 iNRnqZoKTmfVCPwAXiM6iBhBSN9O3eXVHTJNtX5jnguo8vGuQw5NGTeB1+WCr5GK6zGah0iA/x3T7
 2uVX3sH5dGzU4DJwxFz+QLlutfOsLkC+nnDg69hci/XODOKcbFXwRidSg2nCKMdXASriahwb/0iaM
 iL3cqfAABzDRhpE4z/a38+RAups0mZYqKt2+Z0fEezIqr04RxUO4wS+VF45O6FJAoJuIuvNfLhOaq
 LO76KBh23dRhvd//Eiu45pMuf0Q3SRJmcUjJyLBW2PQp9dRAQjMz4TUAgQ82YMJLbhArKo9tQYwGf
 BtSJa5uQ==;
Received: from [50.53.43.113] (helo=bombadil.infradead.org)
 by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
 id 1vtKMw-0000000DKX2-38tI; Fri, 20 Feb 2026 06:52:06 +0000
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
Subject: [PATCH 2/3] drm/amd/display: dmub_cmd.h: correct all kernel-doc
 prototype warnings
Date: Thu, 19 Feb 2026 22:51:54 -0800
Message-ID: <20260220065205.1036179-2-rdunlap@infradead.org>
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
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.996];
	FROM_NEQ_ENVFROM(0.00)[rdunlap@infradead.org,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[infradead.org:-];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,infradead.org:mid,infradead.org:email,intel.com:email,amd.com:email,lists.freedesktop.org:email,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,igalia.com:email]
X-Rspamd-Queue-Id: 731B21650C4
X-Rspamd-Action: no action

Correct all typedef, struct, and union prototype warnings in
dmub_cmd.h by using the matching names or "typedef" keyword:

Warning: drivers/gpu/drm/amd/display/dmub/inc/dmub_cmd.h:961 cannot understand function prototype: 'typedef uint32_t dmub_trace_code_t;'
Warning: drivers/gpu/drm/amd/display/dmub/inc/dmub_cmd.h:1183 expecting prototype for union dmub_shared_state_ips_fw. Prototype was for union dmub_shared_state_ips_fw_signals instead
Warning: drivers/gpu/drm/amd/display/dmub/inc/dmub_cmd.h:1203 expecting prototype for union dmub_shared_state_ips_signals. Prototype was for union dmub_shared_state_ips_driver_signals instead
Warning: drivers/gpu/drm/amd/display/dmub/inc/dmub_cmd.h:1253 expecting prototype for struct dmub_shared_state_cursor_offload_v1. Prototype was for struct dmub_shared_state_cursor_offload_stream_v1 instead
Warning: drivers/gpu/drm/amd/display/dmub/inc/dmub_cmd.h:2001 expecting prototype for struct dmub_cmd_read_modify_write_sequence. Prototype was for struct dmub_rb_cmd_read_modify_write instead
Warning: drivers/gpu/drm/amd/display/dmub/inc/dmub_cmd.h:2191 expecting prototype for struct dmub_rb_cmd_cab. Prototype was for struct dmub_rb_cmd_cab_for_ss instead
Warning: drivers/gpu/drm/amd/display/dmub/inc/dmub_cmd.h:2875 expecting prototype for struct dmub_cmd_set_pixel_clock_data. Prototype was for struct dmub_rb_cmd_set_pixel_clock instead
Warning: drivers/gpu/drm/amd/display/dmub/inc/dmub_cmd.h:3398 expecting prototype for union dpia_notify_data_type. Prototype was for union dpia_notification_data instead
Warning: drivers/gpu/drm/amd/display/dmub/inc/dmub_cmd.h:3447 expecting prototype for struct dmub_rb_cmd_hpd_sense_notify. Prototype was for struct dmub_rb_cmd_hpd_sense_notify_data instead
Warning: drivers/gpu/drm/amd/display/dmub/inc/dmub_cmd.h:6267 expecting prototype for struct dmub_cmd_cable_id_input. Prototype was for struct dmub_cmd_cable_id_output instead

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

 drivers/gpu/drm/amd/display/dmub/inc/dmub_cmd.h |   20 +++++++-------
 1 file changed, 10 insertions(+), 10 deletions(-)

--- linux-next-20260218.orig/drivers/gpu/drm/amd/display/dmub/inc/dmub_cmd.h
+++ linux-next-20260218/drivers/gpu/drm/amd/display/dmub/inc/dmub_cmd.h
@@ -957,7 +957,7 @@ union dmub_fw_meta {
 //==============================================================================
 #if !defined(TENSILICA) && !defined(DMUB_TRACE_ENTRY_DEFINED)
 /**
- * dmub_trace_code_t - firmware trace code, 32-bits
+ * typedef dmub_trace_code_t - firmware trace code, 32-bits
  */
 typedef uint32_t dmub_trace_code_t;
 
@@ -1169,7 +1169,7 @@ enum dmub_shared_state_feature_id {
 };
 
 /**
- * struct dmub_shared_state_ips_fw - Firmware signals for IPS.
+ * struct dmub_shared_state_ips_fw_signals - Firmware signals for IPS.
  */
 union dmub_shared_state_ips_fw_signals {
 	struct {
@@ -1184,7 +1184,7 @@ union dmub_shared_state_ips_fw_signals {
 };
 
 /**
- * struct dmub_shared_state_ips_signals - Firmware signals for IPS.
+ * struct dmub_shared_state_ips_driver_signals - Firmware signals for IPS.
  */
 union dmub_shared_state_ips_driver_signals {
 	struct {
@@ -1246,7 +1246,7 @@ struct dmub_shared_state_ips_driver {
 }; /* 248-bytes, fixed */
 
 /**
- * struct dmub_shared_state_cursor_offload_v1 - Header metadata for cursor offload.
+ * struct dmub_shared_state_cursor_offload_stream_v1 - Header metadata for cursor offload.
  */
 struct dmub_shared_state_cursor_offload_stream_v1 {
 	uint32_t last_write_idx; /**< Last write index */
@@ -1991,7 +1991,7 @@ struct dmub_cmd_read_modify_write_sequen
 #define DMUB_READ_MODIFY_WRITE_SEQ__MAX 5
 
 /**
- * struct dmub_cmd_read_modify_write_sequence - Read modify write command.
+ * struct dmub_rb_cmd_read_modify_write - Read modify write command.
  */
 struct dmub_rb_cmd_read_modify_write {
 	struct dmub_cmd_header header;  /**< command header */
@@ -2183,7 +2183,7 @@ enum dmub_cmd_cab_type {
 };
 
 /**
- * struct dmub_rb_cmd_cab - CAB command data.
+ * struct dmub_rb_cmd_cab_for_ss - CAB command data.
  */
 struct dmub_rb_cmd_cab_for_ss {
 	struct dmub_cmd_header header;
@@ -2868,7 +2868,7 @@ struct dmub_cmd_set_pixel_clock_data {
 };
 
 /**
- * struct dmub_cmd_set_pixel_clock_data - Set pixel clock command.
+ * struct dmub_rb_cmd_set_pixel_clock - Set pixel clock command.
  */
 struct dmub_rb_cmd_set_pixel_clock {
 	struct dmub_cmd_header header; /**< header */
@@ -3384,7 +3384,7 @@ struct dpia_bw_allocation_notify_data {
 };
 
 /**
- * union dpia_notify_data_type - DPIA Notification in Outbox command
+ * union dpia_notification_data - DPIA Notification in Outbox command
  */
 union dpia_notification_data {
 	/**
@@ -3440,7 +3440,7 @@ struct dmub_rb_cmd_query_hpd_state {
 };
 
 /**
- * struct dmub_rb_cmd_hpd_sense_notify - HPD sense notification data.
+ * struct dmub_rb_cmd_hpd_sense_notify_data - HPD sense notification data.
  */
 struct dmub_rb_cmd_hpd_sense_notify_data {
 	uint32_t old_hpd_sense_mask; /**< Old HPD sense mask */
@@ -6258,7 +6258,7 @@ struct dmub_cmd_cable_id_input {
 };
 
 /**
- * struct dmub_cmd_cable_id_input - Defines the output of DMUB_CMD_GET_USBC_CABLE_ID command.
+ * struct dmub_cmd_cable_id_output - Defines the output of DMUB_CMD_GET_USBC_CABLE_ID command.
  */
 struct dmub_cmd_cable_id_output {
 	uint8_t UHBR10_20_CAPABILITY	:2; /**< b'01 for UHBR10 support, b'10 for both UHBR10 and UHBR20 support */
