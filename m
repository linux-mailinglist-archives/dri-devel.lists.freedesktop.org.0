Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3662197B050
	for <lists+dri-devel@lfdr.de>; Tue, 17 Sep 2024 14:45:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B363310E46C;
	Tue, 17 Sep 2024 12:44:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="OD8/CcQ9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com
 [209.85.210.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E819910E3CF;
 Tue, 17 Sep 2024 12:44:57 +0000 (UTC)
Received: by mail-pf1-f172.google.com with SMTP id
 d2e1a72fcca58-71971d20a95so706113b3a.3; 
 Tue, 17 Sep 2024 05:44:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1726577097; x=1727181897; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=PuR2oEx7UOd4jtIaDKowFjYpkaW0nFWhgHvIpNqBCnA=;
 b=OD8/CcQ9/OKsuHE0BeKboW0Ftw1sKJhOiAWEMG/xZ2l9MMuwbEPWRBrFli1sS7GcBe
 GjWZBwdByqJ0FysNx3NzVJba6x7QpxFfe7WmFGvP+vQ6uKS36gB7gWMJvJCGa5fNXzIr
 UZ5b+NuheLt+KztlEhLcmalAIzhob2fq/psJmA2ofFuFZVOR921UHexyIb2GD8Cxiimg
 DB9HA5Brk75IYL+EfcDzpi3N54CPZuxAZc14MXf6DG/+qT22VlnGzvMu/CRW/OuNZDCi
 im3DTajAbKUkUlQ/gkw44+N/hPVWnGQ9+KS1XDQMy18Dty3t1iSGf9hbmw2DAnUCrC9d
 BDOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726577097; x=1727181897;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=PuR2oEx7UOd4jtIaDKowFjYpkaW0nFWhgHvIpNqBCnA=;
 b=HKPglcKBnvPNnazZVPcA93gk+pxqiQBuRykNqQV0RDJGTWk9fw2ALCImhR8VzfucrQ
 perqoJQLaIP5YVAGF9K+1lKiuLuNsdNNFUMReiVI79f7bGK1c1eOVSXtw6ovvJXQbtx3
 YU5BudaPdK1NeGuTccc4cmrfsQOci38LrueUu8iLwFacxMovZBFgGCJn4+Hj504i8xDG
 5nmidjbrtJplT1cxV6tZvVRnr014zph2HGPsmQQQIeid2lsmBVcAGxtxDtOTO7PHUrRI
 f1Yqyi+Id8r6mAhgBIezIKr9Zonf9RSmkNj/CZwD+XsNLOualseaIBeAq8N8BqOKASXe
 plCw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWvW3SPf38+1463xLx04bu0La+D5pRIPVMNn+zXA5YRMMu7/eaWsRxsKERBxxFOnAgPMA2cxX8aXOg=@lists.freedesktop.org,
 AJvYcCX1YUxH8u4u1qFffc0Wa493pA/DUjMuRvcULyukF2sYmKUMPOHBb/IV2m5ZcMQRUTwgiJoN94dO1A4=@lists.freedesktop.org,
 AJvYcCX6ro5T2sQqDsBEBjJlX+krA720PnbOuKlhPgqM59vCkX5253A/XHHE4NNU/4nL72QV414klcgu2FIM@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxrGjwWQexYNpX3hlrtV0I5ECAOauxoPmMbpdDpieWlqFd6fMmu
 LyAQsrej3GFTSxOnkdJwJSAnGWd64JcbvpX3JirpUUgmPvyDCptw
X-Google-Smtp-Source: AGHT+IElrNVLMYeSdPugu8LX32nYuMCgAY1uSEYXmKx1Xd1xFBDpCzFzwKVITNzv1ITogJ2layOxZg==
X-Received: by 2002:a05:6a00:27a0:b0:714:20a8:d79f with SMTP id
 d2e1a72fcca58-71936a60409mr23039083b3a.14.1726577097122; 
 Tue, 17 Sep 2024 05:44:57 -0700 (PDT)
Received: from fedora.. ([2405:201:d007:50c2:4888:86b4:6f32:9ae])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-71944a973d7sm5117415b3a.6.2024.09.17.05.44.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Sep 2024 05:44:56 -0700 (PDT)
From: Vamsi Krishna Brahmajosyula <vamsikrishna.brahmajosyula@gmail.com>
To: gustavo.sousa@intel.com, jani.nikula@linux.intel.com,
 rodrigo.vivi@intel.com, joonas.lahtinen@linux.intel.com,
 tursulin@ursulin.net, airlied@gmail.com, daniel@ffwll.ch
Cc: skhan@linuxfoundation.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v3] drm/i915/cx0: Set power state to ready only on owned PHY
 lanes
Date: Tue, 17 Sep 2024 18:14:49 +0530
Message-ID: <20240917124449.223206-1-vamsikrishna.brahmajosyula@gmail.com>
X-Mailer: git-send-email 2.46.1
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

In DP alt mode, when pin assignment is D, only one PHY lane is owned
by the display. intel_cx0pll_enable currently performs a power state
ready on both the lanes in all cases.

Address the todo to perfom power state ready on owned lanes.

Tested on Meteor Lake-P [Intel Arc Graphics] with DP alt mode.

v2 -> v3:
- Fix changelog per Jani Nikula's feedback
v1 -> v2: Address Gustavo Sousa's feedback
- Use owned lanes mask to set Phy power state to Ready, instead of
  maxpclk_lane with DP alt mode check.
- Owned lanes are obtained from intel_cx0_get_owned_lane_mask().

Signed-off-by: Vamsi Krishna Brahmajosyula <vamsikrishna.brahmajosyula@gmail.com>
---
 drivers/gpu/drm/i915/display/intel_cx0_phy.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_cx0_phy.c b/drivers/gpu/drm/i915/display/intel_cx0_phy.c
index 4a6c3040ca15..cbed53d3b250 100644
--- a/drivers/gpu/drm/i915/display/intel_cx0_phy.c
+++ b/drivers/gpu/drm/i915/display/intel_cx0_phy.c
@@ -2934,6 +2934,7 @@ static void intel_cx0pll_enable(struct intel_encoder *encoder,
 	enum phy phy = intel_encoder_to_phy(encoder);
 	struct intel_digital_port *dig_port = enc_to_dig_port(encoder);
 	bool lane_reversal = dig_port->saved_port_bits & DDI_BUF_PORT_REVERSAL;
+	u8 owned_lane_mask = intel_cx0_get_owned_lane_mask(encoder);
 	u8 maxpclk_lane = lane_reversal ? INTEL_CX0_LANE1 :
 					  INTEL_CX0_LANE0;
 	intel_wakeref_t wakeref = intel_cx0_phy_transaction_begin(encoder);
@@ -2948,10 +2949,9 @@ static void intel_cx0pll_enable(struct intel_encoder *encoder,
 	intel_cx0_phy_lane_reset(encoder, lane_reversal);
 
 	/*
-	 * 3. Change Phy power state to Ready.
-	 * TODO: For DP alt mode use only one lane.
+	 * 3. Change Phy power state to Ready on owned lanes.
 	 */
-	intel_cx0_powerdown_change_sequence(encoder, INTEL_CX0_BOTH_LANES,
+	intel_cx0_powerdown_change_sequence(encoder, owned_lane_mask,
 					    CX0_P2_STATE_READY);
 
 	/*

base-commit: ad060dbbcfcfcba624ef1a75e1d71365a98b86d8
-- 
2.46.0

