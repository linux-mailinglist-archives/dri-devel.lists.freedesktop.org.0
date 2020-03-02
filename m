Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 251D0176623
	for <lists+dri-devel@lfdr.de>; Mon,  2 Mar 2020 22:40:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F4A76E84D;
	Mon,  2 Mar 2020 21:40:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E58796E84D;
 Mon,  2 Mar 2020 21:40:43 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id a141so694650wme.2;
 Mon, 02 Mar 2020 13:40:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:mime-version:content-disposition;
 bh=EvaxHgYpXoDlneHBTnvp220zewZT/Dua7ByW1c58oMM=;
 b=S+vVLXOOCuXYWey7XAChOvwKwuJRQMnKENNTKM40Mj1Tg6UfXe34t/e6IvB+L+uSF7
 hTbyMvoov+1/O7AbN/vQKFMr1CqYqPYl3ex8zyQcLUz/gKD3pW905tV3Hf80KoC1y+Ew
 Wu6EbNmVvODGw+UUUlgSyiD9wA3KCEHzBXGu3k3+0S5u2AYzYwr0L8b9IiC/CZYe5lHZ
 DHId1NAtWgYwNQj/Z3TLCObVUo4gb4RExIT15PxXr4eVa/5G14SHAl/y4q5qF1ZjwP4j
 jGZoq2AtA+MFrCDdgQJWhvSNXOFl8OqATHEwoMdOqf2ZiDmT7ViMuIMIskuOtVtnTLS2
 525Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
 :content-disposition;
 bh=EvaxHgYpXoDlneHBTnvp220zewZT/Dua7ByW1c58oMM=;
 b=grvn8blw+/P8QOAXSRCf6hslVS4CAoy9cOzsb3whoYJC5ybyKuPvBGKKs8bxjRbDd/
 ZT7K5ntkZfDZmgVzOowezFm02f2TeLE/+n6PfeTspWmLeGmIU07iY6eu941HuhbGs2/G
 /86kEBboacgm98a2rMr0ArE6wpXE9xuJvJKObnhlhuNUMqI7buSdv1SSMYUvK0Q9N6ou
 A/ZIYzEYMzQrAJMBHcOKfz9bqkv5wWAY3XKGLLbE667vbO8mSFIoRb9e/R2gA9/yMvk0
 G0JU7RKwVcOwgfqVfZ6RoXL/PabWJorQCAg0wjmvFGQNg6HKFLSjo8UBzrqlf/n4rxvD
 L8gw==
X-Gm-Message-State: ANhLgQ29IGrmcyMGvBqBfsA641OIVxZtErBHCfoOI1YPfER5KCXIMeYS
 9Z6Mogcv5ReQozWlvf+FJ9c=
X-Google-Smtp-Source: ADFU+vtx+RNSkvUMoP7PTL0HRKKdFg14C8X9vKbHZNAxbT4QVdLB2v53LcbjfMxoYpRLPuT273yH4g==
X-Received: by 2002:a1c:155:: with SMTP id 82mr352841wmb.99.1583185242656;
 Mon, 02 Mar 2020 13:40:42 -0800 (PST)
Received: from smtp.gmail.com ([2001:818:e238:a000:51c6:2c09:a768:9c37])
 by smtp.gmail.com with ESMTPSA id s12sm349963wmj.39.2020.03.02.13.40.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Mar 2020 13:40:41 -0800 (PST)
Date: Mon, 2 Mar 2020 18:40:29 -0300
From: Melissa Wen <melissa.srw@gmail.com>
To: Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Christian Konig <christian.koenig@amd.com>,
 David Zhou <David1.Zhou@amd.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
Subject: [PATCH] drm/amd/display: dcn20: remove an unused function
Message-ID: <20200302214029.zxakr6il6f52yixb@smtp.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
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

The dpp2_get_optimal_number_of_taps function is never used. Removing just for
code cleaning up.

Signed-off-by: Melissa Wen <melissa.srw@gmail.com>
---
 .../gpu/drm/amd/display/dc/dcn20/dcn20_dpp.c  | 78 -------------------
 1 file changed, 78 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_dpp.c b/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_dpp.c
index 13e057d7ee93..42bba7c9548b 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_dpp.c
+++ b/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_dpp.c
@@ -369,84 +369,6 @@ void dpp2_set_cursor_attributes(
 	}
 }
 
-#define IDENTITY_RATIO(ratio) (dc_fixpt_u3d19(ratio) == (1 << 19))
-
-bool dpp2_get_optimal_number_of_taps(
-		struct dpp *dpp,
-		struct scaler_data *scl_data,
-		const struct scaling_taps *in_taps)
-{
-	/* Some ASICs does not support  FP16 scaling, so we reject modes require this*/
-	if (scl_data->viewport.width  != scl_data->h_active &&
-		scl_data->viewport.height != scl_data->v_active &&
-		dpp->caps->dscl_data_proc_format == DSCL_DATA_PRCESSING_FIXED_FORMAT &&
-		scl_data->format == PIXEL_FORMAT_FP16)
-		return false;
-
-	if (scl_data->viewport.width > scl_data->h_active &&
-		dpp->ctx->dc->debug.max_downscale_src_width != 0 &&
-		scl_data->viewport.width > dpp->ctx->dc->debug.max_downscale_src_width)
-		return false;
-
-	/* TODO: add lb check */
-
-	/* No support for programming ratio of 8, drop to 7.99999.. */
-	if (scl_data->ratios.horz.value == (8ll << 32))
-		scl_data->ratios.horz.value--;
-	if (scl_data->ratios.vert.value == (8ll << 32))
-		scl_data->ratios.vert.value--;
-	if (scl_data->ratios.horz_c.value == (8ll << 32))
-		scl_data->ratios.horz_c.value--;
-	if (scl_data->ratios.vert_c.value == (8ll << 32))
-		scl_data->ratios.vert_c.value--;
-
-	/* Set default taps if none are provided */
-	if (in_taps->h_taps == 0) {
-		if (dc_fixpt_ceil(scl_data->ratios.horz) > 4)
-			scl_data->taps.h_taps = 8;
-		else
-			scl_data->taps.h_taps = 4;
-	} else
-		scl_data->taps.h_taps = in_taps->h_taps;
-	if (in_taps->v_taps == 0) {
-		if (dc_fixpt_ceil(scl_data->ratios.vert) > 4)
-			scl_data->taps.v_taps = 8;
-		else
-			scl_data->taps.v_taps = 4;
-	} else
-		scl_data->taps.v_taps = in_taps->v_taps;
-	if (in_taps->v_taps_c == 0) {
-		if (dc_fixpt_ceil(scl_data->ratios.vert_c) > 4)
-			scl_data->taps.v_taps_c = 4;
-		else
-			scl_data->taps.v_taps_c = 2;
-	} else
-		scl_data->taps.v_taps_c = in_taps->v_taps_c;
-	if (in_taps->h_taps_c == 0) {
-		if (dc_fixpt_ceil(scl_data->ratios.horz_c) > 4)
-			scl_data->taps.h_taps_c = 4;
-		else
-			scl_data->taps.h_taps_c = 2;
-	} else if ((in_taps->h_taps_c % 2) != 0 && in_taps->h_taps_c != 1)
-		/* Only 1 and even h_taps_c are supported by hw */
-		scl_data->taps.h_taps_c = in_taps->h_taps_c - 1;
-	else
-		scl_data->taps.h_taps_c = in_taps->h_taps_c;
-
-	if (!dpp->ctx->dc->debug.always_scale) {
-		if (IDENTITY_RATIO(scl_data->ratios.horz))
-			scl_data->taps.h_taps = 1;
-		if (IDENTITY_RATIO(scl_data->ratios.vert))
-			scl_data->taps.v_taps = 1;
-		if (IDENTITY_RATIO(scl_data->ratios.horz_c))
-			scl_data->taps.h_taps_c = 1;
-		if (IDENTITY_RATIO(scl_data->ratios.vert_c))
-			scl_data->taps.v_taps_c = 1;
-	}
-
-	return true;
-}
-
 void oppn20_dummy_program_regamma_pwl(
 		struct dpp *dpp,
 		const struct pwl_params *params,
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
