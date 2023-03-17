Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FA3B6BE308
	for <lists+dri-devel@lfdr.de>; Fri, 17 Mar 2023 09:22:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6FAB910E346;
	Fri, 17 Mar 2023 08:22:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF67510E344;
 Fri, 17 Mar 2023 08:22:21 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 28FA86222D;
 Fri, 17 Mar 2023 08:22:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 78B3BC4339C;
 Fri, 17 Mar 2023 08:22:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1679041341;
 bh=TfCb3mpgK92w4qveQROMcLLOHyHxIIuO1T+X3c8+2WM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=C3V5hKZ8yxClqUUmqB9GbZQXkjU+WxPT8eINXBN6T1RTrdVccRPxk7X9iXomfZ7wd
 69sGVLYm8T3KnI9DcISQ1Wwu8JTbC2mBYjX1VvuVdiQlxmpbTvCKF7gQdOA7tclFuB
 lFznjaX9201MF00ECDXGsOOTkWLA+oiVLOw3HtFtQlsHwb0eO7XAeAsEOX5wyDikUX
 5mbCnoM2nASvJ12rLkiz8o0ErpyhilM/8l7Pi0pSOwvZnbhNT0Swes8A3iQxiWvrir
 waxez3K1vxli5yhIvDrP/X50h+rbosv6OTL14keCogNW/0mMiHboxDXgUBTDC3C27c
 3BOu9BoOU7jEg==
From: Lee Jones <lee@kernel.org>
To: lee@kernel.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 01/37] drm/amd/display/dc/dc_hdmi_types: Move string
 definition to the only file it's used in
Date: Fri, 17 Mar 2023 08:16:42 +0000
Message-Id: <20230317081718.2650744-2-lee@kernel.org>
X-Mailer: git-send-email 2.40.0.rc1.284.g88254d51c5-goog
In-Reply-To: <20230317081718.2650744-1-lee@kernel.org>
References: <20230317081718.2650744-1-lee@kernel.org>
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
Cc: Leo Li <sunpeng.li@amd.com>, "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, Wenjing Liu <wenjing.liu@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fixes the following W=1 kernel build warning(s):

 drivers/gpu/drm/amd/amdgpu/../display/dc/dc_hdmi_types.h:53:22:
   warning: ‘dp_hdmi_dongle_signature_str’ defined but not used [-Wunused-const-variable=]

[snipped 400 similar lines for brevity]

Cc: Harry Wentland <harry.wentland@amd.com>
Cc: Leo Li <sunpeng.li@amd.com>
Cc: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: "Christian König" <christian.koenig@amd.com>
Cc: "Pan, Xinhui" <Xinhui.Pan@amd.com>
Cc: David Airlie <airlied@gmail.com>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: Wenjing Liu <wenjing.liu@amd.com>
Cc: amd-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org
Signed-off-by: Lee Jones <lee@kernel.org>
---
 drivers/gpu/drm/amd/display/dc/dc_hdmi_types.h       | 1 -
 drivers/gpu/drm/amd/display/dc/link/link_detection.c | 2 ++
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/display/dc/dc_hdmi_types.h b/drivers/gpu/drm/amd/display/dc/dc_hdmi_types.h
index c364744b4c835..b015e80672ec9 100644
--- a/drivers/gpu/drm/amd/display/dc/dc_hdmi_types.h
+++ b/drivers/gpu/drm/amd/display/dc/dc_hdmi_types.h
@@ -50,7 +50,6 @@ struct dp_hdmi_dongle_signature_data {
 
 /* DP-HDMI dongle slave address for retrieving dongle signature*/
 #define DP_HDMI_DONGLE_ADDRESS 0x40
-static const uint8_t dp_hdmi_dongle_signature_str[] = "DP-HDMI ADAPTOR";
 #define DP_HDMI_DONGLE_SIGNATURE_EOT 0x04
 
 
diff --git a/drivers/gpu/drm/amd/display/dc/link/link_detection.c b/drivers/gpu/drm/amd/display/dc/link/link_detection.c
index fee71ebdfc733..8cfeddfb65c89 100644
--- a/drivers/gpu/drm/amd/display/dc/link/link_detection.c
+++ b/drivers/gpu/drm/amd/display/dc/link/link_detection.c
@@ -60,6 +60,8 @@
  */
 #define LINK_TRAINING_MAX_VERIFY_RETRY 2
 
+static const uint8_t dp_hdmi_dongle_signature_str[] = "DP-HDMI ADAPTOR";
+
 static enum ddc_transaction_type get_ddc_transaction_type(enum signal_type sink_signal)
 {
 	enum ddc_transaction_type transaction_type = DDC_TRANSACTION_TYPE_NONE;
-- 
2.40.0.rc1.284.g88254d51c5-goog

