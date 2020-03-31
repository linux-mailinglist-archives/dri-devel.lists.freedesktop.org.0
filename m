Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 312AE199494
	for <lists+dri-devel@lfdr.de>; Tue, 31 Mar 2020 13:00:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B5C586E802;
	Tue, 31 Mar 2020 11:00:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x542.google.com (mail-ed1-x542.google.com
 [IPv6:2a00:1450:4864:20::542])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B2DB56E802;
 Tue, 31 Mar 2020 11:00:40 +0000 (UTC)
Received: by mail-ed1-x542.google.com with SMTP id v1so24553859edq.8;
 Tue, 31 Mar 2020 04:00:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=7YnYpUhCDEO6kVHkJtFT+/hpwswgtWuGWlgTnicwYjY=;
 b=KrA8KdmQhWXgSS1cNdY2OsLC5wtl1yWoiBQD5pFrjE3lWvcd99kK0TdAZ7bIruuXhX
 9hxoCBI54/t5j/vaUtyL1SyaMDxjsyTYTBzPA5TnCjaZt2C+mFxU0PylILQUtocfXCLw
 jDtiVfutJWxmZl+mRVQt/9L5viyVYeep/EPgBi6XavnPlB6G4fKGyVo21ij0XKdKn57p
 6RbLTp+41YX4mSyVThZKXGoedbWE3UHoNkZx5WTu0hS6Ftk+8uEvKGAPtkBlPkhP84gk
 l1R307xTqiII06+8dfBOj+C4JKM7sYa2f5Miy3iYXEwyO+ozJ//FxG6DBq6SOH81vkiR
 Jk8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=7YnYpUhCDEO6kVHkJtFT+/hpwswgtWuGWlgTnicwYjY=;
 b=MkGcGebXZ3wGR5acTKGiPKDm5bbp95K2iimaM5bN+PBe6tIHNlV8i0HuGPfYOxzgYQ
 7T+m9qyk08zodHLOleasweqopq4UkKNImykVT4G6Hysp2RVhHPbUNZ2M1s301cpq5CN7
 FfAHxqKSd6XfRFzoZLlQT7SE+Skov76N50R7PpQe65ZpctVvLZsXViwj0mFDA9xYISYF
 iN/aCLMaZBGs8ICv1neDE+tDIKQsQv3nCzb8fq52XoUyhL51BTtsyxRlLiud8t3I6jMQ
 dnGIy+6vvCh5a5dI7O4WG+p8AWUnvowWrmjXXq3ppK34sV/4ojr2iKCztCOyfXJY+RV+
 OkmA==
X-Gm-Message-State: ANhLgQ24zEE8olZfG6j+esv0iNs+z6ueuNcdQ14EY8gr25kxtp5GX9j0
 whBFikmY5qePST9nCFhT5Jk7dPxANUBUWQ==
X-Google-Smtp-Source: ADFU+vtcEH6VMi2/5ZUfbSOjQ9ayqwmDQ+TzR/DftcvNeSPRFf2kSkDlp2bXKuc5lBWHTi5qZwujhA==
X-Received: by 2002:a17:906:4d8d:: with SMTP id
 s13mr14367808eju.154.1585652439214; 
 Tue, 31 Mar 2020 04:00:39 -0700 (PDT)
Received: from smtp.gmail.com ([2001:818:e238:a000:51c6:2c09:a768:9c37])
 by smtp.gmail.com with ESMTPSA id w20sm2163124ejv.40.2020.03.31.04.00.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 31 Mar 2020 04:00:38 -0700 (PDT)
Date: Tue, 31 Mar 2020 08:00:32 -0300
From: Melissa Wen <melissa.srw@gmail.com>
To: Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Christian Konig <christian.koenig@amd.com>,
 David Zhou <David1.Zhou@amd.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>,
 Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>, Rodrigo.Siqueira@amd.com
Subject: [PATCH 4/4] drm/amd/display: code cleanup of dc_link file on func
 dc_link_construct
Message-ID: <35c885a1cc55513bbde719a868c8be195f982b43.1585651869.git.melissa.srw@gmail.com>
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

Removes codestyle issues in dc_link file, on dc_link_construct and
translate_encoder_to_transmitter as suggested by checkpatch.pl.

Types covered:

CHECK: Lines should not end with a '('
WARNING: Missing a blank line after declarations
CHECK: Alignment should match open parenthesis
CHECK: Comparison to NULL could be written
CHECK: Logical continuations should be on the previous line
CHECK: Blank lines aren't necessary after an open brace '{'

Signed-off-by: Melissa Wen <melissa.srw@gmail.com>
---
 drivers/gpu/drm/amd/display/dc/core/dc_link.c | 94 ++++++++++---------
 1 file changed, 50 insertions(+), 44 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/core/dc_link.c b/drivers/gpu/drm/amd/display/dc/core/dc_link.c
index b5b202bd9d7c..a93997ff0419 100644
--- a/drivers/gpu/drm/amd/display/dc/core/dc_link.c
+++ b/drivers/gpu/drm/amd/display/dc/core/dc_link.c
@@ -1098,13 +1098,13 @@ bool dc_link_get_hpd_state(struct dc_link *dc_link)
 	return state;
 }
 
-static enum hpd_source_id get_hpd_line(
-		struct dc_link *link)
+static enum hpd_source_id get_hpd_line(struct dc_link *link)
 {
 	struct gpio *hpd;
 	enum hpd_source_id hpd_id = HPD_SOURCEID_UNKNOWN;
 
-	hpd = get_hpd_gpio(link->ctx->dc_bios, link->link_id, link->ctx->gpio_service);
+	hpd = get_hpd_gpio(link->ctx->dc_bios, link->link_id,
+			   link->ctx->gpio_service);
 
 	if (hpd) {
 		switch (dal_irq_get_source(hpd)) {
@@ -1179,8 +1179,7 @@ static enum channel_id get_ddc_line(struct dc_link *link)
 	return channel;
 }
 
-static enum transmitter translate_encoder_to_transmitter(
-	struct graphics_object_id encoder)
+static enum transmitter translate_encoder_to_transmitter(struct graphics_object_id encoder)
 {
 	switch (encoder.id) {
 	case ENCODER_ID_INTERNAL_UNIPHY:
@@ -1244,9 +1243,8 @@ static enum transmitter translate_encoder_to_transmitter(
 	}
 }
 
-static bool dc_link_construct(
-	struct dc_link *link,
-	const struct link_init_data *init_params)
+static bool dc_link_construct(struct dc_link *link,
+			      const struct link_init_data *init_params)
 {
 	uint8_t i;
 	struct ddc_service_init_data ddc_service_init_data = { { 0 } };
@@ -1255,6 +1253,7 @@ static bool dc_link_construct(
 	struct integrated_info info = {{{ 0 }}};
 	struct dc_bios *bios = init_params->dc->ctx->dc_bios;
 	const struct dc_vbios_funcs *bp_funcs = bios->funcs;
+
 	DC_LOGGER_INIT(dc_ctx->logger);
 
 	link->irq_source_hpd = DC_IRQ_SOURCE_INVALID;
@@ -1266,23 +1265,27 @@ static bool dc_link_construct(
 	link->ctx = dc_ctx;
 	link->link_index = init_params->link_index;
 
-	memset(&link->preferred_training_settings, 0, sizeof(struct dc_link_training_overrides));
-	memset(&link->preferred_link_setting, 0, sizeof(struct dc_link_settings));
+	memset(&link->preferred_training_settings, 0,
+	       sizeof(struct dc_link_training_overrides));
+	memset(&link->preferred_link_setting, 0,
+	       sizeof(struct dc_link_settings));
 
-	link->link_id = bios->funcs->get_connector_id(bios, init_params->connector_index);
+	link->link_id =
+		bios->funcs->get_connector_id(bios, init_params->connector_index);
 
 	if (link->link_id.type != OBJECT_TYPE_CONNECTOR) {
 		dm_output_to_console("%s: Invalid Connector ObjectID from Adapter Service for connector index:%d! type %d expected %d\n",
-			 __func__, init_params->connector_index,
-			 link->link_id.type, OBJECT_TYPE_CONNECTOR);
+				     __func__, init_params->connector_index,
+				     link->link_id.type, OBJECT_TYPE_CONNECTOR);
 		goto create_fail;
 	}
 
 	if (link->dc->res_pool->funcs->link_init)
 		link->dc->res_pool->funcs->link_init(link);
 
-	link->hpd_gpio = get_hpd_gpio(link->ctx->dc_bios, link->link_id, link->ctx->gpio_service);
-	if (link->hpd_gpio != NULL) {
+	link->hpd_gpio = get_hpd_gpio(link->ctx->dc_bios, link->link_id,
+				      link->ctx->gpio_service);
+	if (link->hpd_gpio) {
 		dal_gpio_open(link->hpd_gpio, GPIO_MODE_INTERRUPT);
 		dal_gpio_unlock_pin(link->hpd_gpio);
 		link->irq_source_hpd = dal_irq_get_source(link->hpd_gpio);
@@ -1302,9 +1305,9 @@ static bool dc_link_construct(
 		link->connector_signal = SIGNAL_TYPE_DVI_DUAL_LINK;
 		break;
 	case CONNECTOR_ID_DISPLAY_PORT:
-		link->connector_signal =	SIGNAL_TYPE_DISPLAY_PORT;
+		link->connector_signal = SIGNAL_TYPE_DISPLAY_PORT;
 
-		if (link->hpd_gpio != NULL)
+		if (link->hpd_gpio)
 			link->irq_source_hpd_rx =
 					dal_irq_get_rx_source(link->hpd_gpio);
 
@@ -1312,7 +1315,7 @@ static bool dc_link_construct(
 	case CONNECTOR_ID_EDP:
 		link->connector_signal = SIGNAL_TYPE_EDP;
 
-		if (link->hpd_gpio != NULL) {
+		if (link->hpd_gpio) {
 			link->irq_source_hpd = DC_IRQ_SOURCE_INVALID;
 			link->irq_source_hpd_rx =
 					dal_irq_get_rx_source(link->hpd_gpio);
@@ -1322,32 +1325,33 @@ static bool dc_link_construct(
 		link->connector_signal = SIGNAL_TYPE_LVDS;
 		break;
 	default:
-		DC_LOG_WARNING("Unsupported Connector type:%d!\n", link->link_id.id);
+		DC_LOG_WARNING("Unsupported Connector type:%d!\n",
+			       link->link_id.id);
 		goto create_fail;
 	}
 
 	/* TODO: #DAL3 Implement id to str function.*/
 	LINK_INFO("Connector[%d] description:"
-			"signal %d\n",
-			init_params->connector_index,
-			link->connector_signal);
+		  "signal %d\n",
+		  init_params->connector_index,
+		  link->connector_signal);
 
 	ddc_service_init_data.ctx = link->ctx;
 	ddc_service_init_data.id = link->link_id;
 	ddc_service_init_data.link = link;
 	link->ddc = dal_ddc_service_create(&ddc_service_init_data);
 
-	if (link->ddc == NULL) {
+	if (!link->ddc) {
 		DC_ERROR("Failed to create ddc_service!\n");
 		goto ddc_create_fail;
 	}
 
 	link->ddc_hw_inst =
-		dal_ddc_get_line(
-			dal_ddc_service_get_ddc_pin(link->ddc));
+		dal_ddc_get_line(dal_ddc_service_get_ddc_pin(link->ddc));
 
 	enc_init_data.ctx = dc_ctx;
-	bp_funcs->get_src_obj(dc_ctx->dc_bios, link->link_id, 0, &enc_init_data.encoder);
+	bp_funcs->get_src_obj(dc_ctx->dc_bios, link->link_id, 0,
+			      &enc_init_data.encoder);
 	enc_init_data.connector = link->link_id;
 	enc_init_data.channel = get_ddc_line(link);
 	enc_init_data.hpd_source = get_hpd_line(link);
@@ -1355,11 +1359,11 @@ static bool dc_link_construct(
 	link->hpd_src = enc_init_data.hpd_source;
 
 	enc_init_data.transmitter =
-			translate_encoder_to_transmitter(enc_init_data.encoder);
-	link->link_enc = link->dc->res_pool->funcs->link_enc_create(
-								&enc_init_data);
+		translate_encoder_to_transmitter(enc_init_data.encoder);
+	link->link_enc =
+		link->dc->res_pool->funcs->link_enc_create(&enc_init_data);
 
-	if (link->link_enc == NULL) {
+	if (!link->link_enc) {
 		DC_ERROR("Failed to create link encoder!\n");
 		goto link_enc_create_fail;
 	}
@@ -1367,8 +1371,9 @@ static bool dc_link_construct(
 	link->link_enc_hw_inst = link->link_enc->transmitter;
 
 	for (i = 0; i < 4; i++) {
-		if (BP_RESULT_OK !=
-				bp_funcs->get_device_tag(dc_ctx->dc_bios, link->link_id, i, &link->device_tag)) {
+		if (bp_funcs->get_device_tag(dc_ctx->dc_bios,
+					     link->link_id, i,
+					     &link->device_tag) != BP_RESULT_OK) {
 			DC_ERROR("Failed to find device tag!\n");
 			goto device_tag_fail;
 		}
@@ -1376,13 +1381,14 @@ static bool dc_link_construct(
 		/* Look for device tag that matches connector signal,
 		 * CRT for rgb, LCD for other supported signal tyes
 		 */
-		if (!bp_funcs->is_device_id_supported(dc_ctx->dc_bios, link->device_tag.dev_id))
+		if (!bp_funcs->is_device_id_supported(dc_ctx->dc_bios,
+						      link->device_tag.dev_id))
 			continue;
-		if (link->device_tag.dev_id.device_type == DEVICE_TYPE_CRT
-			&& link->connector_signal != SIGNAL_TYPE_RGB)
+		if (link->device_tag.dev_id.device_type == DEVICE_TYPE_CRT &&
+		    link->connector_signal != SIGNAL_TYPE_RGB)
 			continue;
-		if (link->device_tag.dev_id.device_type == DEVICE_TYPE_LCD
-			&& link->connector_signal == SIGNAL_TYPE_RGB)
+		if (link->device_tag.dev_id.device_type == DEVICE_TYPE_LCD &&
+		    link->connector_signal == SIGNAL_TYPE_RGB)
 			continue;
 		break;
 	}
@@ -1394,16 +1400,16 @@ static bool dc_link_construct(
 	for (i = 0; i < MAX_NUMBER_OF_EXT_DISPLAY_PATH; i++) {
 		struct external_display_path *path =
 			&info.ext_disp_conn_info.path[i];
-		if (path->device_connector_id.enum_id == link->link_id.enum_id
-			&& path->device_connector_id.id == link->link_id.id
-			&& path->device_connector_id.type == link->link_id.type) {
 
-			if (link->device_tag.acpi_device != 0
-				&& path->device_acpi_enum == link->device_tag.acpi_device) {
+		if (path->device_connector_id.enum_id == link->link_id.enum_id &&
+		    path->device_connector_id.id == link->link_id.id &&
+		    path->device_connector_id.type == link->link_id.type) {
+			if (link->device_tag.acpi_device != 0 &&
+			    path->device_acpi_enum == link->device_tag.acpi_device) {
 				link->ddi_channel_mapping = path->channel_mapping;
 				link->chip_caps = path->caps;
 			} else if (path->device_tag ==
-					link->device_tag.dev_id.raw_device_tag) {
+				   link->device_tag.dev_id.raw_device_tag) {
 				link->ddi_channel_mapping = path->channel_mapping;
 				link->chip_caps = path->caps;
 			}
@@ -1427,7 +1433,7 @@ static bool dc_link_construct(
 ddc_create_fail:
 create_fail:
 
-	if (link->hpd_gpio != NULL) {
+	if (link->hpd_gpio) {
 		dal_gpio_destroy_irq(&link->hpd_gpio);
 		link->hpd_gpio = NULL;
 	}
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
