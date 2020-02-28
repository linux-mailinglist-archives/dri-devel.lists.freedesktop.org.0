Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B2DBB173D48
	for <lists+dri-devel@lfdr.de>; Fri, 28 Feb 2020 17:43:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CFD706E091;
	Fri, 28 Feb 2020 16:43:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x541.google.com (mail-ed1-x541.google.com
 [IPv6:2a00:1450:4864:20::541])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 586ED6E091;
 Fri, 28 Feb 2020 16:43:28 +0000 (UTC)
Received: by mail-ed1-x541.google.com with SMTP id dm3so4108569edb.1;
 Fri, 28 Feb 2020 08:43:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=10ldW0StfDF5LQn5px5zjojzk7W9mvvMvbddw+jgFsA=;
 b=XkgKXpMVRw195GbFLaoE1Lus3mosOPFgls1V02Wvy1Vj5vnwWa/HRfYURh8n8PZpaJ
 GkkkX3RdNYcvyJtM4AnWGWxiNk9HM4LBrUL9G2/xBYaUn4nNhl0jhV83HNR6fI2ajKQK
 /ETtlOkksDL/o5pz0bHC7Wi+BlJ3qRQlsiTOta/ifPscYgV+XNiDtrl/yZPGF4t75ctM
 hTdDnCOg8YNAMiVoC8iwHNfW0zk4ML4bSbxMwJV4BwBXuY7sdgvNCYaZG6l6vkc81t78
 6/ZYVosISVmDrBi4WrIDONYZVhLbUBgjnMstgqn+Q1pUDlwXXRVCti9+m6gKW29nAtsd
 wgNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=10ldW0StfDF5LQn5px5zjojzk7W9mvvMvbddw+jgFsA=;
 b=AWAGJiwHJMqXQIJsfJG/7dBdVo4BJcwfOwLPZyKd5Wpa09cA3IWPfrsbbTtipyBYGo
 sPaw6rG0X/dpgwZ3y5vfUVdyaO8ZUH0Q3C+9+BU5/MGqINMpDMR2uq1sJUbRS1GRMg9k
 nPvFkQGN58zT2eow3ETppNR5ikRvgJkDgrVTuj8sLmxxn9CkMTMk1sc7G2fyWpimXhkg
 TkZB1MInmp4qEwiaOFR5pcq/RPfcOjKYUhhOOX8Izu8yYZN0xg1Zn7V2OhI6v1S5OoZV
 O7GyCusIb4hZq7BR8HayjHkdUym6vzCkXDKtNJrayN4HJZUZKSy2B3fC5liZoeQ4L4aA
 SHZQ==
X-Gm-Message-State: APjAAAX1XRlMaWkvfkytaYY+UasavAfggi2aTg3suOM22U22+E24YFlJ
 Pzu2lc4qkHB7P1iORy/1Zj0=
X-Google-Smtp-Source: APXvYqxq6JyAJsx/ABxv5xVgyd+/eUW8LdQVVIyzQs61/8UwUjygLRJ5olX/k0a0wg+uYk8PR3GkRQ==
X-Received: by 2002:a50:eb04:: with SMTP id y4mr4879876edp.170.1582908207050; 
 Fri, 28 Feb 2020 08:43:27 -0800 (PST)
Received: from smtp.gmail.com (1.77.115.89.rev.vodafone.pt. [89.115.77.1])
 by smtp.gmail.com with ESMTPSA id g6sm318212edm.29.2020.02.28.08.43.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Feb 2020 08:43:26 -0800 (PST)
Date: Fri, 28 Feb 2020 13:43:19 -0300
From: Melissa Wen <melissa.srw@gmail.com>
To: Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Christian Konig <christian.koenig@amd.com>,
 David Zhou <David1.Zhou@amd.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
Subject: [PATCH v2 2/2] drm/amd/display: dc_link: code clean up on detect_dp
 function
Message-ID: <60bc9ed29e4136eedd3b92c9fd536310b6b9c00d.1582907436.git.melissa.srw@gmail.com>
References: <cover.1582907436.git.melissa.srw@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <cover.1582907436.git.melissa.srw@gmail.com>
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
index eb9894e416ed..549bea1d725c 100644
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
@@ -609,9 +609,8 @@ static bool detect_dp(
 			sink_caps->signal = SIGNAL_TYPE_DISPLAY_PORT_MST;
 			link->type = dc_connection_mst_branch;
 
-			dal_ddc_service_set_transaction_type(
-							link->ddc,
-							sink_caps->transaction_type);
+			dal_ddc_service_set_transaction_type(link->ddc,
+							     sink_caps->transaction_type);
 
 			/*
 			 * This call will initiate MST topology discovery. Which
@@ -640,13 +639,10 @@ static bool detect_dp(
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
@@ -654,7 +650,7 @@ static bool detect_dp(
 		}
 
 		if (link->type != dc_connection_mst_branch &&
-			is_dp_active_dongle(link)) {
+		    is_dp_active_dongle(link)) {
 			/* DP active dongles */
 			link->type = dc_connection_active_dongle;
 			if (!link->dpcd_caps.sink_count.bits.SINK_COUNT) {
@@ -665,14 +661,15 @@ static bool detect_dp(
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
