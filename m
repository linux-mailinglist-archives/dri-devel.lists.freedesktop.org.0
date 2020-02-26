Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AFB91170B3C
	for <lists+dri-devel@lfdr.de>; Wed, 26 Feb 2020 23:08:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F5B36E48F;
	Wed, 26 Feb 2020 22:08:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x544.google.com (mail-ed1-x544.google.com
 [IPv6:2a00:1450:4864:20::544])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 396616EBE1;
 Wed, 26 Feb 2020 22:08:31 +0000 (UTC)
Received: by mail-ed1-x544.google.com with SMTP id n18so412347edw.9;
 Wed, 26 Feb 2020 14:08:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=jp59utgfg7BcBD4RiJuNr7SC9meFZCk4nKcHVjkdN50=;
 b=Qz9P+oGnzpRBIGm+tjDYqC7KUbkMLXzwKCqJyVX6pWiKSNOtpN4SEQi4/jqWDfUrkD
 6gBbvmkX5kEHf4Dj1xuaNM0jHKaLdHYAYGygGRIpDNDzFQgi7+dhWPJ5t6l9rq+YAl2m
 XLwFkKZeAEuDbWlqESft9qhr3/p6MaG1X6OdmxGyeNsLxq/oUJuNfpO1HKSPqJqPLE5L
 qBUpjtgFU3f31/dvTtaC41DwPGURuN3jwmtnWFPo6zrUPmB1G0eakN/UKjJkU1fwhqTM
 jKBBf2JVTR9PA0bWpAlVvwzINzPTxzYPDKR8K/XwoJTfY14Nf0GKdWv+4jWmyyKafSKs
 ly0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=jp59utgfg7BcBD4RiJuNr7SC9meFZCk4nKcHVjkdN50=;
 b=O46R+KursmCm01fB5ZczYnjp8rLyDjnFco5pymqSGm35ecKCnaw7yAP+iagIbuz+Aq
 D8Sei7g9cZ3mz2FoWtRSF2dGZtktaLtvmaIUGMqLidPSk3rquS6V3dERoqujIavOkITh
 JmJHp9JbmGhN2ZiexWddGSOWqJ5qpA80vOH+GYElQAbQnb4NCEc2Avzki/J3h/c8zrGL
 DJaX6Q5Yy1WYyVPTfQY3aJSUK92g4MgkW/IHGyylB4oSdge0uIGbXgLe/o5gIQJEe+QU
 YFZXfUM+g9Grin3zrQu0gpHcTms/4fWg5xbHvUxBxVz7wDBB3lYidQ6wiRBnUuXoA7dP
 w14Q==
X-Gm-Message-State: APjAAAUH25wPTXwhZ1F8kD0sNNi8NgRYDJzuW9nBnUiN+SKVExQN+QBj
 tOpl1l68tCLOp4ug26pyZj4=
X-Google-Smtp-Source: APXvYqxfA48ICMaI6cFaxqrBbC/3SJLNyp1g5yxBCFl4kmx+9vVWLt/xQF5pq0bUfYNL7YVOdhIbPg==
X-Received: by 2002:a17:906:55c1:: with SMTP id
 z1mr790598ejp.288.1582754909801; 
 Wed, 26 Feb 2020 14:08:29 -0800 (PST)
Received: from smtp.gmail.com ([2001:818:e238:a000:51c6:2c09:a768:9c37])
 by smtp.gmail.com with ESMTPSA id q7sm232033edr.34.2020.02.26.14.08.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Feb 2020 14:08:29 -0800 (PST)
Date: Wed, 26 Feb 2020 19:08:22 -0300
From: Melissa Wen <melissa.srw@gmail.com>
To: Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Christian Konig <christian.koenig@amd.com>,
 David Zhou <David1.Zhou@amd.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>,
 Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>
Subject: [PATCH 2/2] drm/amd/display: dc_link: code clean up on detect_dp
 function
Message-ID: <9961afca2cf831ac688025a63b7cd35dd0908fac.1582752490.git.melissa.srw@gmail.com>
References: <cover.1582752490.git.melissa.srw@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <cover.1582752490.git.melissa.srw@gmail.com>
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

Removes codestyle issues on detect_dp function as suggested by
checkpatch.pl.

CHECK: Lines should not end with a '('
WARNING: Missing a blank line after declarations
WARNING: line over 80 characters
CHECK: Alignment should match open parenthesis

Signed-off-by: Melissa Wen <melissa.srw@gmail.com>
---
 drivers/gpu/drm/amd/display/dc/core/dc_link.c | 35 +++++++++----------
 1 file changed, 16 insertions(+), 19 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/core/dc_link.c b/drivers/gpu/drm/amd/display/dc/core/dc_link.c
index 0f28b5694144..adb717f02c9c 100644
--- a/drivers/gpu/drm/amd/display/dc/core/dc_link.c
+++ b/drivers/gpu/drm/amd/display/dc/core/dc_link.c
@@ -585,14 +585,14 @@ static void read_current_link_settings_on_detect(struct dc_link *link)
 		LINK_SPREAD_05_DOWNSPREAD_30KHZ : LINK_SPREAD_DISABLED;
 }
 
-static bool detect_dp(
-	struct dc_link *link,
-	struct display_sink_capability *sink_caps,
-	bool *converter_disable_audio,
-	struct audio_support *audio_support,
-	enum dc_detect_reason reason)
+static bool detect_dp(struct dc_link *link,
+		      struct display_sink_capability *sink_caps,
+		      bool *converter_disable_audio,
+		      struct audio_support *audio_support,
+		      enum dc_detect_reason reason)
 {
 	bool boot = false;
+
 	sink_caps->signal = link_detect_sink(link, reason);
 	sink_caps->transaction_type =
 		get_ddc_transaction_type(sink_caps->signal);
@@ -606,9 +606,8 @@ static bool detect_dp(
 			sink_caps->signal = SIGNAL_TYPE_DISPLAY_PORT_MST;
 			link->type = dc_connection_mst_branch;
 
-			dal_ddc_service_set_transaction_type(
-							link->ddc,
-							sink_caps->transaction_type);
+			dal_ddc_service_set_transaction_type(link->ddc,
+							     sink_caps->transaction_type);
 
 			/*
 			 * This call will initiate MST topology discovery. Which
@@ -637,13 +636,10 @@ static bool detect_dp(
 			if (reason == DETECT_REASON_BOOT)
 				boot = true;
 
-			dm_helpers_dp_update_branch_info(
-				link->ctx,
-				link);
+			dm_helpers_dp_update_branch_info(link->ctx, link);
 
-			if (!dm_helpers_dp_mst_start_top_mgr(
-				link->ctx,
-				link, boot)) {
+			if (!dm_helpers_dp_mst_start_top_mgr(link->ctx,
+							     link, boot)) {
 				/* MST not supported */
 				link->type = dc_connection_single;
 				sink_caps->signal = SIGNAL_TYPE_DISPLAY_PORT;
@@ -651,7 +647,7 @@ static bool detect_dp(
 		}
 
 		if (link->type != dc_connection_mst_branch &&
-			is_dp_active_dongle(link)) {
+		    is_dp_active_dongle(link)) {
 			/* DP active dongles */
 			link->type = dc_connection_active_dongle;
 			if (!link->dpcd_caps.sink_count.bits.SINK_COUNT) {
@@ -662,14 +658,15 @@ static bool detect_dp(
 				return true;
 			}
 
-			if (link->dpcd_caps.dongle_type != DISPLAY_DONGLE_DP_HDMI_CONVERTER)
+			if (link->dpcd_caps.dongle_type !=
+			    DISPLAY_DONGLE_DP_HDMI_CONVERTER)
 				*converter_disable_audio = true;
 		}
 	} else {
 		/* DP passive dongles */
 		sink_caps->signal = dp_passive_dongle_detection(link->ddc,
-				sink_caps,
-				audio_support);
+								sink_caps,
+								audio_support);
 	}
 
 	return true;
-- 
2.25.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
