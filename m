Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 179D1D1CC9E
	for <lists+dri-devel@lfdr.de>; Wed, 14 Jan 2026 08:17:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 959A110E58D;
	Wed, 14 Jan 2026 07:17:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Rlh+Q39i";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com
 [209.85.221.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB5FF10E58D
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Jan 2026 07:17:28 +0000 (UTC)
Received: by mail-wr1-f44.google.com with SMTP id
 ffacd0b85a97d-432d2c7dd52so4444739f8f.2
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Jan 2026 23:17:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1768375047; x=1768979847; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=xA5tkXPwJ+IVwjKrklmdYs8DlcTIGu8re6dxA5ARadM=;
 b=Rlh+Q39i8krjByXFSrvkARxkqJ5BWD8CibUd/AlvIbj1lclM/syyZzIPqepWNsXKGm
 RApHks1b67bPCxbZKixfK7gxNCkFOoy1FNrGkW9ZUAkN8QV1rSRDZaM+o9fNNfKURPDU
 BTEWw5Vjg+21pW4HQmkm4IPE9FjaNgvrN6BP4qFeFk2Qwq86MGlcd3N2Vl9tdE8KFQ9m
 50hdV5uogDnDPutAn0/cjqThrY9C0WeVvX5i/TRojSGJAsoUmwORk6MmW8D7H81N063o
 5lVKYmhw1tL1J6Dy+v46fslL4wCy/y31HWmA2mIZamJ4oFru/GpXHRtV3W9Q87vwIpwD
 87hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768375047; x=1768979847;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=xA5tkXPwJ+IVwjKrklmdYs8DlcTIGu8re6dxA5ARadM=;
 b=ajXNVrI4hyxG6DM5Q81amEXa1zAYZ6h6fydy8IAQfpQZOm4rj+dlArbCek/H/U7Ym6
 l3ytmB0DWtsPMPI1WuV7kMBBpkwt+VDIGnBmsBEP/RNttKjRcJ/6OF4G9NBu1JegOCzd
 cf1+17ObCjb5NCJvwap+yOgK4SyjbMZYVsm5o+yx/J5IZ5TVvSq4aVN98G2QdaGJRGiO
 Zg7u8PC4Ti3V+SZReO9tpk1fEsce9MHdBvu7neZXc/Mak2JKqsxysPWZCPlgtklwqQRR
 qY9Wepf+I7qW2snBOA/6tdjDF06jMAm0dgFU8s9tAnc8PNVZitdgEY6AHgwMPVkd062l
 kkdA==
X-Gm-Message-State: AOJu0YxwFeo6MAmXDPr95N6/dU1uLgN46fB8sUCCbkCWEMzSl4XeUEm8
 Y/Ti9i8tN8rN1WzR+oqJmrQMIp4QwIIhyedgiC61ymqhZlLv3oCEkttc/wrO/A==
X-Gm-Gg: AY/fxX5aeKk926lWcdBdz4oc5W/JXc4EarBrVM2K+KwngqOwHYdj/SHsjeDB4OxRpHx
 hAg31bhtwYeQ6/ZbPI/QhgNsJObrTia3TloCKYnqK14rehF4Bs+rVhDa1sde+Ns9tBJ43+CIq+4
 o5uhJ9sYilS2+hVfLnFgoOqv/5nRCeptMd4SpJbgIE3+/4CdvVjmwzejcF6263af7hIGc192WUq
 jwekGErtP3QfDZCo0ZAf0ngY4FmJrNaRZKsSCfDFTqq3NjpG+J4m1m7wJ0NiCkF90in494toYrJ
 7gLU1FbCXQZmqo2mLGWWpbpo10qu5T4JRx4DqtQbX6OkLEWkjkkFi4a4ibePwCsIo1lXvgLpO02
 woJ7JL1+qToZfPFG6AEhVhL/I8dzu2ruikBTctyD6D79+yhK6B52DhiLHq20zvvIufZQPxh5Dn5
 KC4sOy1wT53bmEiN5B6JGd0y5I8/sGqA==
X-Received: by 2002:a05:6000:26c2:b0:432:7068:17d with SMTP id
 ffacd0b85a97d-4342c5011c2mr1666283f8f.20.1768375046718; 
 Tue, 13 Jan 2026 23:17:26 -0800 (PST)
Received: from oscar.. (125.65.3.89.rev.sfr.net. [89.3.65.125])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-432d286cdecsm34820551f8f.7.2026.01.13.23.17.26
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Jan 2026 23:17:26 -0800 (PST)
From: Jerome Tollet <jerome.tollet@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2] drm/i915/hdmi: Add SCDC processing delay for scrambling
 setup
Date: Wed, 14 Jan 2026 08:17:25 +0100
Message-ID: <20260114071725.5608-1-jerome.tollet@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <aWa7jjtOWnSd_JIp@intel.com>
References: <aWa7jjtOWnSd_JIp@intel.com>
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

Some HDMI 2.0 monitors require additional time to process SCDC
configuration before PHY initialization begins. Without this delay,
certain monitors (e.g., Cisco Desk Pro) fail to detect the scrambled
signal at 4K@60Hz and report format detection errors, despite
successful SCDC I2C transactions.

Testing with multiple delay positions in the modeset sequence revealed
that the timing is not tied to any specific PHY/DDI operation. The
monitor simply needs ~150ms after SCDC configuration to prepare its
scrambling detection logic before subsequent operations begin.

The delay is placed immediately after intel_hdmi_handle_sink_scrambling()
to make the code intent clear: we're giving the monitor time to process
SCDC configuration. This placement also allows subsequent PHY operations
to benefit from the monitor's preparation time.

The 150ms value was determined through systematic testing and aligns
with HDMI 2.0 spec section 10.4.1.7, which mentions monitors can
disable scrambling if they don't detect a scrambled signal within 100ms.
Some monitors appear to need additional margin for SCDC processing.

Testing methodology:
Created 4 test patches, progressively moving the delay earlier in the
intel_ddi_enable_hdmi() sequence:
- Test 1: Before intel_ddi_buf_enable() (line ~3504) - SUCCESS
- Test 2: Before intel_ddi_power_up_lanes() (line ~3466) - SUCCESS
- Test 3: After set_signal_levels() (line ~3429) - SUCCESS
- Test 4: After hsw_prepare_hdmi_ddi_buffers() (line ~3424) - SUCCESS

All tests succeeded, confirming the delay works at any position after
SCDC configuration. The earliest position (immediately after SCDC config)
was chosen for code clarity and maintainability.

Changes in v2:
- Moved delay to immediately after SCDC configuration (was at end of
  modeset sequence in v1)
- Added detailed testing results showing delay works at any position
- Improved comment explaining the root cause and placement rationale
- Based on feedback from Ville Syrjälä suggesting to identify the
  exact operation requiring the delay

Tested-by: Jerome Tollet <jerome.tollet@gmail.com>
Suggested-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
Signed-off-by: Jerome Tollet <jerome.tollet@gmail.com>
---
 drivers/gpu/drm/i915/display/intel_ddi.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_ddi.c b/drivers/gpu/drm/i915/display/intel_ddi.c
index 3de3e9167..328884efa 100644
--- a/drivers/gpu/drm/i915/display/intel_ddi.c
+++ b/drivers/gpu/drm/i915/display/intel_ddi.c
@@ -3419,6 +3419,20 @@ static void intel_ddi_enable_hdmi(struct intel_atomic_state *state,
 		drm_dbg_kms(display->drm,
 			    "[CONNECTOR:%d:%s] Failed to configure sink scrambling/TMDS bit clock ratio\n",
 			    connector->base.id, connector->name);
+	/*
+	 * HDMI 2.0 spec section 10.4.1.7: Some monitors need time to process
+	 * the SCDC configuration before PHY initialization begins. Testing
+	 * shows the delay can be placed anywhere in the modeset sequence after
+	 * SCDC config, but placing it here (immediately after) makes the code
+	 * intent clear and allows subsequent PHY operations to benefit from
+	 * the monitor preparation time.
+	 *
+	 * Without this delay, certain monitors (e.g., Cisco Desk Pro) fail to
+	 * detect the scrambled signal and report format detection errors despite
+	 * proper SCDC configuration.
+	 */
+	if (crtc_state->hdmi_scrambling)
+		msleep(150);
 
 	if (has_buf_trans_select(display))
 		hsw_prepare_hdmi_ddi_buffers(encoder, crtc_state);
-- 
2.43.0

