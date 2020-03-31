Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 78401199488
	for <lists+dri-devel@lfdr.de>; Tue, 31 Mar 2020 12:59:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0347C6E7EF;
	Tue, 31 Mar 2020 10:59:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x543.google.com (mail-ed1-x543.google.com
 [IPv6:2a00:1450:4864:20::543])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E8EF6E7EF;
 Tue, 31 Mar 2020 10:59:29 +0000 (UTC)
Received: by mail-ed1-x543.google.com with SMTP id o1so6327194edv.1;
 Tue, 31 Mar 2020 03:59:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=DT53h0dIogY7ErrjJA8TrTHmUe4dOqrLBwkiQ2UtfW0=;
 b=Fy2oIbUcbjXUoVQL59axRCHae/b1Gt0owNetSfdJNRDaz4t7uL38ycYfA6nVheA267
 jCixqlnULCLGgZ44sxaBuVkkB1sWacbw1ytWt1JxSVAFFeOQNlCQm48kHckEIqSSxVfA
 5p1A1QYn1t+MrOc871H/UUWTQTdiXCo3yLdT9pjN4zyjef4ZQRpPJXoSmZK99qOzAD7L
 Lg5yGoPCB71P2me8Ak+VyyhOXq9OhlVhNDtJxOcnkjM30czZSkGaxyBu3Ev6V5hBfjHz
 C5g/B8AZkgnzZ+N5gys7NwB8PJwCvp0bvglpe1FghYyltPHCr8Ax8i1E7NikFrQCcSnU
 MDMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=DT53h0dIogY7ErrjJA8TrTHmUe4dOqrLBwkiQ2UtfW0=;
 b=kZptGR/8Z+tWJ+JGWPVcEK/ozWjoJsw3N2tGdrmpiJY4UFVoXbLdPFDNowfFai/yF7
 JLlMmzERvThBKpaZl0uhdlnQetklHUGIR4KCQADYIRxVXaVRcW8s4pNzaa0MNzf7JUv2
 E3/YhiqJh4d+J0gYzxPX9jK0Uez/nY6IL5zeDKcUTJDAh4o6wicI7WKl6qYrruCz0Vt/
 PApw/UXtUe+XLIll1plHggJwheIgIT474pQGu68TQJPX9KraiTKQrYK5phuQbfkY7UlX
 /lrEIY0ANR7XyzkOMtXZwhBOF4BhOfQu0G1TrQR0Vc6QY2s7rvkt+1bLVHymoGkxL0w9
 /cWA==
X-Gm-Message-State: ANhLgQ2bORwDSTffvBYWURLgpWml8pbSKK9gEUIldVLhBZy5aHkgYIkp
 iQ6ed08oAHmH6mriNFoCw8M=
X-Google-Smtp-Source: ADFU+vtH+cLBNCi62IMdRIPqdZ8sGzN05khxc1hcrVhcaCWk6vU+aDK811Co/FdcLzhocURjschaMA==
X-Received: by 2002:a17:906:7a46:: with SMTP id
 i6mr14907931ejo.95.1585652367746; 
 Tue, 31 Mar 2020 03:59:27 -0700 (PDT)
Received: from smtp.gmail.com ([2001:818:e238:a000:51c6:2c09:a768:9c37])
 by smtp.gmail.com with ESMTPSA id x26sm1829363edr.44.2020.03.31.03.59.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 31 Mar 2020 03:59:27 -0700 (PDT)
Date: Tue, 31 Mar 2020 07:59:20 -0300
From: Melissa Wen <melissa.srw@gmail.com>
To: Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Christian Konig <christian.koenig@amd.com>,
 David Zhou <David1.Zhou@amd.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>,
 Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>, Rodrigo.Siqueira@amd.com
Subject: [PATCH 2/4] drm/amd/display: codestyle cleanup on dc_link file until
 detect_dp func
Message-ID: <f1dc315e03bc9f8512004b4aa8c174fcb506c4c2.1585651869.git.melissa.srw@gmail.com>
References: <cover.1585651869.git.melissa.srw@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <cover.1585651869.git.melissa.srw@gmail.com>
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
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Removes codestyle issues on the file dc_link until detect_dp func as
suggested by checkpatch.pl.

Types covered:

CHECK: Please don't use multiple blank lines
CHECK: Comparison to NULL could be written
ERROR: space required before the open parenthesis '('
CHECK: Alignment should match open parenthesis
CHECK: Lines should not end with a '('
WARNING: please, no space before tabs
WARNING: Comparisons should place the constant on the right side of the test
WARNING: braces {} are not necessary for single statement blocks
CHECK: Please don't use multiple blank lines

Signed-off-by: Melissa Wen <melissa.srw@gmail.com>
---
 drivers/gpu/drm/amd/display/dc/core/dc_link.c | 109 ++++++++----------
 1 file changed, 49 insertions(+), 60 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/core/dc_link.c b/drivers/gpu/drm/amd/display/dc/core/dc_link.c
index f580b533db5f..0b303d17e543 100644
--- a/drivers/gpu/drm/amd/display/dc/core/dc_link.c
+++ b/drivers/gpu/drm/amd/display/dc/core/dc_link.c
@@ -49,7 +49,6 @@
 
 #define DC_LOGGER_INIT(logger)
 
-
 #define LINK_INFO(...) \
 	DC_LOG_HW_HOTPLUG(  \
 		__VA_ARGS__)
@@ -79,7 +78,7 @@ static void dc_link_destruct(struct dc_link *link)
 {
 	int i;
 
-	if (link->hpd_gpio != NULL) {
+	if (link->hpd_gpio) {
 		dal_gpio_destroy_irq(&link->hpd_gpio);
 		link->hpd_gpio = NULL;
 	}
@@ -87,7 +86,7 @@ static void dc_link_destruct(struct dc_link *link)
 	if (link->ddc)
 		dal_ddc_service_destroy(&link->ddc);
 
-	if(link->link_enc)
+	if (link->link_enc)
 		link->link_enc->funcs->destroy(&link->link_enc);
 
 	if (link->local_sink)
@@ -98,8 +97,8 @@ static void dc_link_destruct(struct dc_link *link)
 }
 
 struct gpio *get_hpd_gpio(struct dc_bios *dcb,
-		struct graphics_object_id link_id,
-		struct gpio_service *gpio_service)
+			  struct graphics_object_id link_id,
+			  struct gpio_service *gpio_service)
 {
 	enum bp_result bp_result;
 	struct graphics_object_hpd_info hpd_info;
@@ -116,10 +115,9 @@ struct gpio *get_hpd_gpio(struct dc_bios *dcb,
 		return NULL;
 	}
 
-	return dal_gpio_service_create_irq(
-		gpio_service,
-		pin_info.offset,
-		pin_info.mask);
+	return dal_gpio_service_create_irq(gpio_service,
+					   pin_info.offset,
+					   pin_info.mask);
 }
 
 /*
@@ -134,13 +132,10 @@ struct gpio *get_hpd_gpio(struct dc_bios *dcb,
  *  @return
  *     true on success, false otherwise
  */
-static bool program_hpd_filter(
-	const struct dc_link *link)
+static bool program_hpd_filter(const struct dc_link *link)
 {
 	bool result = false;
-
 	struct gpio *hpd;
-
 	int delay_on_connect_in_ms = 0;
 	int delay_on_disconnect_in_ms = 0;
 
@@ -159,10 +154,10 @@ static bool program_hpd_filter(
 	case SIGNAL_TYPE_DISPLAY_PORT_MST:
 		/* Program hpd filter to allow DP signal to settle */
 		/* 500:	not able to detect MST <-> SST switch as HPD is low for
-		 * 	only 100ms on DELL U2413
-		 * 0:	some passive dongle still show aux mode instead of i2c
-		 * 20-50:not enough to hide bouncing HPD with passive dongle.
-		 * 	also see intermittent i2c read issues.
+		 * only 100ms on DELL U2413
+		 * 0: some passive dongle still show aux mode instead of i2c
+		 * 20-50: not enough to hide bouncing HPD with passive dongle.
+		 * also see intermittent i2c read issues.
 		 */
 		delay_on_connect_in_ms = 80;
 		delay_on_disconnect_in_ms = 0;
@@ -175,7 +170,8 @@ static bool program_hpd_filter(
 	}
 
 	/* Obtain HPD handle */
-	hpd = get_hpd_gpio(link->ctx->dc_bios, link->link_id, link->ctx->gpio_service);
+	hpd = get_hpd_gpio(link->ctx->dc_bios, link->link_id,
+			   link->ctx->gpio_service);
 
 	if (!hpd)
 		return result;
@@ -226,8 +222,9 @@ bool dc_link_detect_sink(struct dc_link *link, enum dc_connection_type *type)
 	}
 
 	/* todo: may need to lock gpio access */
-	hpd_pin = get_hpd_gpio(link->ctx->dc_bios, link->link_id, link->ctx->gpio_service);
-	if (hpd_pin == NULL)
+	hpd_pin = get_hpd_gpio(link->ctx->dc_bios, link->link_id,
+			       link->ctx->gpio_service);
+	if (!hpd_pin)
 		goto hpd_gpio_failure;
 
 	dal_gpio_open(hpd_pin, GPIO_MODE_INTERRUPT);
@@ -248,8 +245,7 @@ bool dc_link_detect_sink(struct dc_link *link, enum dc_connection_type *type)
 	return false;
 }
 
-static enum ddc_transaction_type get_ddc_transaction_type(
-		enum signal_type sink_signal)
+static enum ddc_transaction_type get_ddc_transaction_type(enum signal_type sink_signal)
 {
 	enum ddc_transaction_type transaction_type = DDC_TRANSACTION_TYPE_NONE;
 
@@ -282,9 +278,8 @@ static enum ddc_transaction_type get_ddc_transaction_type(
 	return transaction_type;
 }
 
-static enum signal_type get_basic_signal_type(
-	struct graphics_object_id encoder,
-	struct graphics_object_id downstream)
+static enum signal_type get_basic_signal_type(struct graphics_object_id encoder,
+					      struct graphics_object_id downstream)
 {
 	if (downstream.type == OBJECT_TYPE_CONNECTOR) {
 		switch (downstream.id) {
@@ -373,8 +368,8 @@ bool dc_link_is_dp_sink_present(struct dc_link *link)
 	 * which indicates we need additional delay
 	 */
 
-	if (GPIO_RESULT_OK != dal_ddc_open(
-		ddc, GPIO_MODE_INPUT, GPIO_DDC_CONFIG_TYPE_MODE_I2C)) {
+	if (dal_ddc_open(ddc, GPIO_MODE_INPUT,
+			 GPIO_DDC_CONFIG_TYPE_MODE_I2C) != GPIO_RESULT_OK) {
 		dal_ddc_close(ddc);
 
 		return present;
@@ -408,12 +403,11 @@ bool dc_link_is_dp_sink_present(struct dc_link *link)
  * @brief
  * Detect output sink type
  */
-static enum signal_type link_detect_sink(
-	struct dc_link *link,
-	enum dc_detect_reason reason)
+static enum signal_type link_detect_sink(struct dc_link *link,
+					 enum dc_detect_reason reason)
 {
-	enum signal_type result = get_basic_signal_type(
-		link->link_enc->id, link->link_id);
+	enum signal_type result = get_basic_signal_type(link->link_enc->id,
+							link->link_id);
 
 	/* Internal digital encoder will detect only dongles
 	 * that require digital signal
@@ -428,17 +422,16 @@ static enum signal_type link_detect_sink(
 	 */
 
 	/* PCIE detects the actual connector on add-on board */
-
-	if (link->link_id.id == CONNECTOR_ID_PCIE) {
+	if (link->link_id.id == CONNECTOR_ID_PCIE)
 		/* ZAZTODO implement PCIE add-on card detection */
-	}
 
 	switch (link->link_id.id) {
 	case CONNECTOR_ID_HDMI_TYPE_A: {
 		/* check audio support:
 		 * if native HDMI is not supported, switch to DVI
 		 */
-		struct audio_support *aud_support = &link->dc->res_pool->audio_support;
+		struct audio_support *aud_support =
+					&link->dc->res_pool->audio_support;
 
 		if (!aud_support->hdmi_audio_native)
 			if (link->link_id.id == CONNECTOR_ID_HDMI_TYPE_A)
@@ -466,16 +459,15 @@ static enum signal_type link_detect_sink(
 	return result;
 }
 
-static enum signal_type decide_signal_from_strap_and_dongle_type(
-		enum display_dongle_type dongle_type,
-		struct audio_support *audio_support)
+static enum signal_type decide_signal_from_strap_and_dongle_type(enum display_dongle_type dongle_type,
+								 struct audio_support *audio_support)
 {
 	enum signal_type signal = SIGNAL_TYPE_NONE;
 
 	switch (dongle_type) {
 	case DISPLAY_DONGLE_DP_HDMI_DONGLE:
 		if (audio_support->hdmi_audio_on_dongle)
-			signal =  SIGNAL_TYPE_HDMI_TYPE_A;
+			signal = SIGNAL_TYPE_HDMI_TYPE_A;
 		else
 			signal = SIGNAL_TYPE_DVI_SINGLE_LINK;
 		break;
@@ -496,16 +488,14 @@ static enum signal_type decide_signal_from_strap_and_dongle_type(
 	return signal;
 }
 
-static enum signal_type dp_passive_dongle_detection(
-		struct ddc_service *ddc,
-		struct display_sink_capability *sink_cap,
-		struct audio_support *audio_support)
+static enum signal_type dp_passive_dongle_detection(struct ddc_service *ddc,
+						    struct display_sink_capability *sink_cap,
+						    struct audio_support *audio_support)
 {
-	dal_ddc_service_i2c_query_dp_dual_mode_adaptor(
-						ddc, sink_cap);
-	return decide_signal_from_strap_and_dongle_type(
-			sink_cap->dongle_type,
-			audio_support);
+	dal_ddc_service_i2c_query_dp_dual_mode_adaptor(ddc, sink_cap);
+
+	return decide_signal_from_strap_and_dongle_type(sink_cap->dongle_type,
+							audio_support);
 }
 
 static void link_disconnect_sink(struct dc_link *link)
@@ -524,7 +514,6 @@ static void link_disconnect_remap(struct dc_sink *prev_sink, struct dc_link *lin
 	link->local_sink = prev_sink;
 }
 
-
 static void read_current_link_settings_on_detect(struct dc_link *link)
 {
 	union lane_count_set lane_count_set = { {0} };
@@ -537,18 +526,18 @@ static void read_current_link_settings_on_detect(struct dc_link *link)
 
 	// Read DPCD 00101h to find out the number of lanes currently set
 	for (i = 0; i < read_dpcd_retry_cnt; i++) {
-		status = core_link_read_dpcd(
-				link,
-				DP_LANE_COUNT_SET,
-				&lane_count_set.raw,
-				sizeof(lane_count_set));
+		status = core_link_read_dpcd(link,
+					     DP_LANE_COUNT_SET,
+					     &lane_count_set.raw,
+					     sizeof(lane_count_set));
 		/* First DPCD read after VDD ON can fail if the particular board
 		 * does not have HPD pin wired correctly. So if DPCD read fails,
 		 * which it should never happen, retry a few times. Target worst
 		 * case scenario of 80 ms.
 		 */
 		if (status == DC_OK) {
-			link->cur_link_settings.lane_count = lane_count_set.bits.LANE_COUNT_SET;
+			link->cur_link_settings.lane_count =
+					lane_count_set.bits.LANE_COUNT_SET;
 			break;
 		}
 
@@ -557,7 +546,7 @@ static void read_current_link_settings_on_detect(struct dc_link *link)
 
 	// Read DPCD 00100h to find if standard link rates are set
 	core_link_read_dpcd(link, DP_LINK_BW_SET,
-			&link_bw_set, sizeof(link_bw_set));
+			    &link_bw_set, sizeof(link_bw_set));
 
 	if (link_bw_set == 0) {
 		if (link->connector_signal == SIGNAL_TYPE_EDP) {
@@ -565,12 +554,12 @@ static void read_current_link_settings_on_detect(struct dc_link *link)
 			 * Read DPCD 00115h to find the edp link rate set used
 			 */
 			core_link_read_dpcd(link, DP_LINK_RATE_SET,
-					&link_rate_set, sizeof(link_rate_set));
+					    &link_rate_set, sizeof(link_rate_set));
 
 			// edp_supported_link_rates_count = 0 for DP
 			if (link_rate_set < link->dpcd_caps.edp_supported_link_rates_count) {
 				link->cur_link_settings.link_rate =
-						link->dpcd_caps.edp_supported_link_rates[link_rate_set];
+					link->dpcd_caps.edp_supported_link_rates[link_rate_set];
 				link->cur_link_settings.link_rate_set = link_rate_set;
 				link->cur_link_settings.use_link_rate_set = true;
 			}
@@ -584,7 +573,7 @@ static void read_current_link_settings_on_detect(struct dc_link *link)
 	}
 	// Read DPCD 00003h to find the max down spread.
 	core_link_read_dpcd(link, DP_MAX_DOWNSPREAD,
-			&max_down_spread.raw, sizeof(max_down_spread));
+			    &max_down_spread.raw, sizeof(max_down_spread));
 	link->cur_link_settings.link_spread =
 		max_down_spread.bits.MAX_DOWN_SPREAD ?
 		LINK_SPREAD_05_DOWNSPREAD_30KHZ : LINK_SPREAD_DISABLED;
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
