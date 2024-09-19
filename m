Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BF7597CD90
	for <lists+dri-devel@lfdr.de>; Thu, 19 Sep 2024 20:30:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0AC3610E749;
	Thu, 19 Sep 2024 18:30:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="WoAnK+p8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com
 [209.85.214.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA4B010E749;
 Thu, 19 Sep 2024 18:30:00 +0000 (UTC)
Received: by mail-pl1-f172.google.com with SMTP id
 d9443c01a7336-206f9b872b2so11066805ad.3; 
 Thu, 19 Sep 2024 11:30:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1726770600; x=1727375400; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=+KMrajb1zLurcFqyiwW/j9BszHT3k0A5x96qyT+yYNw=;
 b=WoAnK+p8PuNHa2DYpVyYCRPDFuAqcoBKobLt1mGzvIrvHZo3yN+PdytMfBUip4acGq
 sbyfO70VFt8JjGHNPtWQvOHti/UZm0LD3TncErPfXEHZBtn4pU5+1wo0etmsov53Is3C
 Q6hRDkH8D/5V7K3L6iKWpygzGsatEe+1g0y3Z3Xk5MkSbDbFfmGC3VF6P7+om4aGSd2F
 pV/Wk3HYLMfHgFh1ghBKYePiXvuXPADqYjIloPselCAZIzPeJt9dXMkdkK5GMLc3w5//
 vFuFLlrx80jt9SKb1124SCIkYVxUi60VksnDOXL+/ZJ+LcTqn90HpdKDMBmiXmLvdWC+
 tL0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726770600; x=1727375400;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=+KMrajb1zLurcFqyiwW/j9BszHT3k0A5x96qyT+yYNw=;
 b=MnBttA5lXT2OS+VF+MXYb1boxoScGIjN3xsTYG0DUG1pouxJiugcwtqN4be/ujgU7H
 fA+RHb7Ipl2XLUrsuVBs5YVXyPi3O7bHw7nARSfckki4GbYjZM9Ae0i2fiAOc62jfUy8
 JeovhDCswFknFTQi1MiRCzXn4Y7sBWZehKXUdeHuQaLYVA0VOURztcBLIb3BuCXaiOe0
 VsiOx18phDqCi6GwX5kQZyByErGVTfqYgrUwAQCCRvrFO99Umg5dyc9lBYn4YOL0++f1
 Ti8MMwbBN0HHCwJJ5/JSJUoL95B9GTPOolpNm+R/Tl3yU66WQajC3kZJ5Pl9dtqePLVP
 pnwQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUZMV+4kq4/JWsNvEcMM8Nd5y7VQqtnP9s2q7EJAv/BPEPQkzr1T9FILN5yLy/LfAZyTqM2rXIGNkk=@lists.freedesktop.org,
 AJvYcCVNhfA2AXSCdiIftQjBrPQ86Q3/gnasO9rz33n3e3tSrCFRUH0BlNX7WjDiC6jOXPo4JHfVq0HlUbqA@lists.freedesktop.org,
 AJvYcCXbcWTZei7SI+HHGAVDiEmIubaZ/j7up2qwf8aGdc9iAXWVkdBDvtXSyT44Ky1QutJjsFE7UmWajMc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxp65b/IArGSsviArG++qTtsvnvSdKLXLFVpZdHej/hO53xQKUV
 sg3TlCOfDiKsMDCYoGRHq8iDpQXCucEcJa/CSH47omU0yYefBSG6
X-Google-Smtp-Source: AGHT+IE/gUWsxkqc0ZEQJ/8L+xme7Oq1BXvLj6tIvEfVCrLPGjcgd7gcG3+9hX+uwwhCnZGK8WxBAA==
X-Received: by 2002:a17:903:2449:b0:205:4bc0:1993 with SMTP id
 d9443c01a7336-208d82fb42amr3255205ad.6.1726770599898; 
 Thu, 19 Sep 2024 11:29:59 -0700 (PDT)
Received: from fedora.. ([2405:201:d007:50c2:4888:86b4:6f32:9ae])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-20794735728sm83021645ad.271.2024.09.19.11.29.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Sep 2024 11:29:59 -0700 (PDT)
From: Vamsi Krishna Brahmajosyula <vamsikrishna.brahmajosyula@gmail.com>
To: gustavo.sousa@intel.com, jani.nikula@linux.intel.com,
 rodrigo.vivi@intel.com, joonas.lahtinen@linux.intel.com,
 tursulin@ursulin.net, airlied@gmail.com, daniel@ffwll.ch
Cc: skhan@linuxfoundation.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] drm/i915/cx0: Set power state to ready only on owned PHY lanes
Date: Thu, 19 Sep 2024 23:59:52 +0530
Message-ID: <20240919182952.51326-1-vamsikrishna.brahmajosyula@gmail.com>
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
Patch version removed so that patchwork would recognize the entry

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

