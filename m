Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B0197658859
	for <lists+dri-devel@lfdr.de>; Thu, 29 Dec 2022 02:27:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C85B10E15E;
	Thu, 29 Dec 2022 01:27:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 1430 seconds by postgrey-1.36 at gabe;
 Thu, 29 Dec 2022 01:27:05 UTC
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 18EBE10E15E;
 Thu, 29 Dec 2022 01:27:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
 MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:In-Reply-To:References;
 bh=neOorG1ELpQLrTAY1AQ78oFCGRV3rTRmNpiDswYp1jY=; b=rkq4YJiOUBp77g6pZ2GKL/KDa1
 gnSEUWkJq5yu4RQT3Sa9gaT7uPzYF3vFvDbG5aP6V8iXJLxXxaI58m0SgheKehGBnboStecRc9PvU
 /4mkxE98noUe54MUIsy7iQwc/fYnQo/otZlQeWVBeTwkDQBQaaQrUIEWozlpjZuXE+J/xIxCSJAmC
 GaRuiHBtnbiyzDuVGnddnlqYx9bE+OZ3wjGaD5Ct/6Dy3BiU4wrPov8j50ASEoRawLr685abJu/BZ
 TbmgKiHsfIo6FITC4dmVg5qQ5BpXuNTxTYNijJyxzg+MRaZRuCHvrmVeoPaESdjYxl+BP6Zidpiv/
 qkRFtxHA==;
Received: from [2601:1c2:d80:3110::a2e7] (helo=casper.infradead.org)
 by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1pAhIB-009XL4-LR; Thu, 29 Dec 2022 01:01:08 +0000
From: Randy Dunlap <rdunlap@infradead.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm: amd: display: fix dc/core/dc.c kernel-doc
Date: Wed, 28 Dec 2022 17:00:51 -0800
Message-Id: <20221229010051.5397-1-rdunlap@infradead.org>
X-Mailer: git-send-email 2.39.0
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
Cc: "Pan, Xinhui" <Xinhui.Pan@amd.com>, kernel test robot <lkp@intel.com>,
 Leo Li <sunpeng.li@amd.com>, Randy Dunlap <rdunlap@infradead.org>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, amd-gfx@lists.freedesktop.org,
 Hamza Mahfooz <hamza.mahfooz@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fix all kernel-doc warnings in dc/core/dc.c:

dc.c:385: warning: missing initial short description on line:
 *  dc_stream_adjust_vmin_vmax:
dc.c:392: warning: contents before sections
dc.c:399: warning: No description found for return value of 'dc_stream_adjust_vmin_vmax'
dc.c:434: warning: Excess function parameter 'adjust' description in 'dc_stream_get_last_used_drr_vtotal'
dc.c:434: warning: No description found for return value of 'dc_stream_get_last_used_drr_vtotal'
dc.c:574: warning: No description found for return value of 'dc_stream_configure_crc'
dc.c:1746: warning: No description found for return value of 'dc_commit_state_no_check'
dc.c:4991: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
 * dc_extended_blank_supported 0 Decide whether extended blank is supported
dc.c:4991: warning: missing initial short description on line:
 * dc_extended_blank_supported 0 Decide whether extended blank is supported
dc.c:4723: warning: Function parameter or member 'dc' not described in 'dc_enable_dmub_outbox'
dc.c:4926: warning: Function parameter or member 'dc' not described in 'dc_process_dmub_dpia_hpd_int_enable'
dc.c:4926: warning: Function parameter or member 'hpd_int_enable' not described in 'dc_process_dmub_dpia_hpd_int_enable'
12 warnings

Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Reported-by: kernel test robot <lkp@intel.com>
Cc: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: Hamza Mahfooz <hamza.mahfooz@amd.com>
Cc: Harry Wentland <harry.wentland@amd.com>
Cc: Leo Li <sunpeng.li@amd.com>
Cc: Christian König <christian.koenig@amd.com>
Cc: "Pan, Xinhui" <Xinhui.Pan@amd.com>
Cc: amd-gfx@lists.freedesktop.org
---
Based on linux-next-20221226 but also applies to mainline.

 drivers/gpu/drm/amd/display/dc/core/dc.c |   40 +++++++++++++--------
 1 file changed, 25 insertions(+), 15 deletions(-)

diff -- a/drivers/gpu/drm/amd/display/dc/core/dc.c b/drivers/gpu/drm/amd/display/dc/core/dc.c
--- a/drivers/gpu/drm/amd/display/dc/core/dc.c
+++ b/drivers/gpu/drm/amd/display/dc/core/dc.c
@@ -382,16 +382,18 @@ static void dc_perf_trace_destroy(struct
 }
 
 /**
- *  dc_stream_adjust_vmin_vmax:
+ *  dc_stream_adjust_vmin_vmax - look up pipe context & update parts of DRR
+ *  @dc:     dc reference
+ *  @stream: Initial dc stream state
+ *  @adjust: Updated parameters for vertical_total_min and vertical_total_max
  *
  *  Looks up the pipe context of dc_stream_state and updates the
  *  vertical_total_min and vertical_total_max of the DRR, Dynamic Refresh
  *  Rate, which is a power-saving feature that targets reducing panel
  *  refresh rate while the screen is static
  *
- *  @dc:     dc reference
- *  @stream: Initial dc stream state
- *  @adjust: Updated parameters for vertical_total_min and vertical_total_max
+ *  Return: %true if the pipe context is found and adjusted;
+ *          %false if the pipe context is not found.
  */
 bool dc_stream_adjust_vmin_vmax(struct dc *dc,
 		struct dc_stream_state *stream,
@@ -419,14 +421,17 @@ bool dc_stream_adjust_vmin_vmax(struct d
 }
 
 /**
- * dc_stream_get_last_used_drr_vtotal - dc_stream_get_last_vrr_vtotal
+ * dc_stream_get_last_used_drr_vtotal - Looks up the pipe context of
+ * dc_stream_state and gets the last VTOTAL used by DRR (Dynamic Refresh Rate)
  *
  * @dc: [in] dc reference
  * @stream: [in] Initial dc stream state
- * @adjust: [in] Updated parameters for vertical_total_min and
+ * @refresh_rate: [in] new refresh_rate
  *
- * Looks up the pipe context of dc_stream_state and gets the last VTOTAL used
- * by DRR (Dynamic Refresh Rate)
+ * Return: %true if the pipe context is found and there is an associated
+ *         timing_generator for the DC;
+ *         %false if the pipe context is not found or there is no
+ *         timing_generator for the DC.
  */
 bool dc_stream_get_last_used_drr_vtotal(struct dc *dc,
 		struct dc_stream_state *stream,
@@ -567,7 +572,10 @@ dc_stream_forward_crc_window(struct dc_s
  *              once.
  *
  * By default, only CRC0 is configured, and the entire frame is used to
- * calculate the crc.
+ * calculate the CRC.
+ *
+ * Return: %false if the stream is not found or CRC capture is not supported;
+ *         %true if the stream has been configured.
  */
 bool dc_stream_configure_crc(struct dc *dc, struct dc_stream_state *stream,
 			     struct crc_params *crc_window, bool enable, bool continuous)
@@ -636,7 +644,7 @@ bool dc_stream_configure_crc(struct dc *
  * dc_stream_configure_crc needs to be called beforehand to enable CRCs.
  *
  * Return:
- * false if stream is not found, or if CRCs are not enabled.
+ * %false if stream is not found, or if CRCs are not enabled.
  */
 bool dc_stream_get_crc(struct dc *dc, struct dc_stream_state *stream,
 		       uint32_t *r_cr, uint32_t *g_y, uint32_t *b_cb)
@@ -1741,6 +1749,8 @@ void dc_z10_save_init(struct dc *dc)
  *
  * Applies given context to the hardware and copy it into current context.
  * It's up to the user to release the src context afterwards.
+ *
+ * Return: an enum dc_status result code for the operation
  */
 static enum dc_status dc_commit_state_no_check(struct dc *dc, struct dc_state *context)
 {
@@ -4705,7 +4715,7 @@ bool dc_enable_dmub_notifications(struct
 /**
  * dc_enable_dmub_outbox - Enables DMUB unsolicited notification
  *
- * dc: [in] dc structure
+ * @dc: [in] dc structure
  *
  * Enables DMUB unsolicited notifications to x86 via outbox.
  */
@@ -4906,8 +4916,8 @@ enum dc_status dc_process_dmub_set_mst_s
 /**
  * dc_process_dmub_dpia_hpd_int_enable - Submits DPIA DPD interruption
  *
- * @dc [in]: dc structure
- * @hpd_int_enable [in]: 1 for hpd int enable, 0 to disable
+ * @dc: [in] dc structure
+ * @hpd_int_enable: [in] 1 for hpd int enable, 0 to disable
  *
  * Submits dpia hpd int enable command to dmub via inbox message
  */
@@ -4988,7 +4998,7 @@ void dc_notify_vsync_int_state(struct dc
 }
 
 /**
- * dc_extended_blank_supported 0 Decide whether extended blank is supported
+ * dc_extended_blank_supported - Decide whether extended blank is supported
  *
  * @dc: [in] Current DC state
  *
@@ -4997,7 +5007,7 @@ void dc_notify_vsync_int_state(struct dc
  * ability to enter z9/z10.
  *
  * Return:
- * Indicate whether extended blank is supported (true or false)
+ * Indicate whether extended blank is supported (%true or %false)
  */
 bool dc_extended_blank_supported(struct dc *dc)
 {
