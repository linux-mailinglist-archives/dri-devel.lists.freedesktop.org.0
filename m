Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ADF5B8C6F81
	for <lists+dri-devel@lfdr.de>; Thu, 16 May 2024 02:26:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB37D10E284;
	Thu, 16 May 2024 00:26:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.b="V6+JPIJz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [198.137.202.133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D49310E284
 for <dri-devel@lists.freedesktop.org>; Thu, 16 May 2024 00:26:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=4DArABTCo0WR3iP3DuiOhCx7WM8NygHAkbkaCmaQADw=; b=V6+JPIJzduIeGM8NWBn9dMV9IF
 zYNvcPk/ByTzy9ivHU79fGyWNbUKbhoAI5ujKjNa0l5MstW1bPPX87P+SXrxi7tK5OYqJeIZ8bwhE
 oATdmt5BH/bZjtcmv6PtjT04sLy+Mv2WEuRdrCcpPk9sebaLrrua/TlfaZL9cUm3I1TcsMVdEn7NP
 BbQdD/7Fsd/tkErTm5oOU7JHMKwBZR2FpMQb/zITMSOFr6c9J9nJ/b0NidpBIIilu9d7v8IIXFl2i
 BUeo5Nv8W2ePOQN8my/60Tvy/8PdOPIfFXfqeVGtRN8mh9WIhrcfB/ECH4vEH17KBLHJ1oS+bH2Fk
 1/GGlClA==;
Received: from [50.53.4.147] (helo=bombadil.infradead.org)
 by bombadil.infradead.org with esmtpsa (Exim 4.97.1 #2 (Red Hat Linux))
 id 1s7OxH-00000003Fx8-3rTy; Thu, 16 May 2024 00:26:44 +0000
From: Randy Dunlap <rdunlap@infradead.org>
To: dri-devel@lists.freedesktop.org
Cc: Randy Dunlap <rdunlap@infradead.org>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH] drm/display/dp: fix all kernel-doc warnings
Date: Wed, 15 May 2024 17:26:42 -0700
Message-ID: <20240516002642.6659-1-rdunlap@infradead.org>
X-Mailer: git-send-email 2.45.0
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

Fix a struct member name in &struct drm_dp_as_sdp.
Add Returns: kernel-doc syntax for 4 functions.
In the Returns: sections, spell "%true" and "%false" consistently.

Fixes these kernel-doc warnings:

drm_dp_helper.h:126: warning: Function parameter or struct member 'mode' not described in 'drm_dp_as_sdp'
drm_dp_helper.h:126: warning: Excess struct member 'operation_mode' description in 'drm_dp_as_sdp'
drm_dp_helper.h:237: warning: No description found for return value of 'drm_dp_dsc_sink_supports_format'
drm_dp_helper.h:539: warning: No description found for return value of 'drm_dp_dpcd_readb'
drm_dp_helper.h:554: warning: No description found for return value of 'drm_dp_dpcd_writeb'
drm_dp_helper.h:721: warning: No description found for return value of 'drm_dp_has_quirk'

Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
---
Cc: David Airlie <airlied@gmail.com>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: Thomas Zimmermann <tzimmermann@suse.de>

 include/drm/display/drm_dp_helper.h |   17 +++++++++--------
 1 file changed, 9 insertions(+), 8 deletions(-)

diff -- a/include/drm/display/drm_dp_helper.h b/include/drm/display/drm_dp_helper.h
--- a/include/drm/display/drm_dp_helper.h
+++ b/include/drm/display/drm_dp_helper.h
@@ -112,7 +112,7 @@ struct drm_dp_vsc_sdp {
  * @target_rr: Target Refresh
  * @duration_incr_ms: Successive frame duration increase
  * @duration_decr_ms: Successive frame duration decrease
- * @operation_mode: Adaptive Sync Operation Mode
+ * @mode: Adaptive Sync Operation Mode
  */
 struct drm_dp_as_sdp {
 	unsigned char sdp_type;
@@ -230,7 +230,8 @@ drm_dp_dsc_sink_max_slice_width(const u8
  * @dsc_dpcd : DSC-capability DPCDs of the sink
  * @output_format: output_format which is to be checked
  *
- * Returns true if the sink supports DSC with the given output_format, false otherwise.
+ * Returns: %true if the sink supports DSC with the given output_format,
+ * %false otherwise.
  */
 static inline bool
 drm_dp_dsc_sink_supports_format(const u8 dsc_dpcd[DP_DSC_RECEIVER_CAP_SIZE], u8 output_format)
@@ -280,8 +281,8 @@ drm_dp_sink_can_do_video_without_timing_
  * backlight features but which require the brightness be set through PWM, and don't support setting
  * the brightness level via the DPCD.
  *
- * Returns: %True if @edp_dpcd indicates that VESA backlight controls are supported, %false
- * otherwise
+ * Returns: %true if @edp_dpcd indicates that VESA backlight controls are
+ * supported, %false otherwise
  */
 static inline bool
 drm_edp_backlight_supported(const u8 edp_dpcd[EDP_DISPLAY_CTL_CAP_SIZE])
@@ -295,7 +296,7 @@ drm_edp_backlight_supported(const u8 edp
  *
  * Determine if the provided link rate is an UHBR rate.
  *
- * Returns: %True if @link_rate is an UHBR rate.
+ * Returns: %true if @link_rate is an UHBR rate.
  */
 static inline bool drm_dp_is_uhbr_rate(int link_rate)
 {
@@ -531,7 +532,7 @@ ssize_t drm_dp_dpcd_write(struct drm_dp_
  * @offset: address of the register to read
  * @valuep: location where the value of the register will be stored
  *
- * Returns the number of bytes transferred (1) on success, or a negative
+ * Returns: the number of bytes transferred (1) on success, or a negative
  * error code on failure.
  */
 static inline ssize_t drm_dp_dpcd_readb(struct drm_dp_aux *aux,
@@ -546,7 +547,7 @@ static inline ssize_t drm_dp_dpcd_readb(
  * @offset: address of the register to write
  * @value: value to write to the register
  *
- * Returns the number of bytes transferred (1) on success, or a negative
+ * Returns: the number of bytes transferred (1) on success, or a negative
  * error code on failure.
  */
 static inline ssize_t drm_dp_dpcd_writeb(struct drm_dp_aux *aux,
@@ -714,7 +715,7 @@ enum drm_dp_quirk {
  * @desc: Device descriptor filled by drm_dp_read_desc()
  * @quirk: Quirk to query for
  *
- * Return true if DP device identified by @desc has @quirk.
+ * Returns: %true if DP device identified by @desc has @quirk.
  */
 static inline bool
 drm_dp_has_quirk(const struct drm_dp_desc *desc, enum drm_dp_quirk quirk)
