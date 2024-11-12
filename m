Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 364EF9C583C
	for <lists+dri-devel@lfdr.de>; Tue, 12 Nov 2024 13:49:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9AE4B10E0F7;
	Tue, 12 Nov 2024 12:49:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="UGGPTzom";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com
 [209.85.216.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 34FAE10E0F7;
 Tue, 12 Nov 2024 12:49:01 +0000 (UTC)
Received: by mail-pj1-f43.google.com with SMTP id
 98e67ed59e1d1-2e91403950dso4226832a91.3; 
 Tue, 12 Nov 2024 04:49:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1731415741; x=1732020541; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=uyDbG8WmlHUfOOwJXFgUm11idSuEHNxJbOFfw4uInpo=;
 b=UGGPTzombk+XqGYv+YNkKKXN6y1ef78s3TGNB3BkdGeK+ldvo2qKZRMfjW9KIuKkh5
 5qwNPARBNUgUvzR7Wjr5IPLR0s+sD54ZPmetMTGlDmM6VO0drpiFTgtSAE4R6P30eDQH
 OTDOjtRAagiDHuuGkYqY1XVes4A5GTF785qV/YTDvuBzYmnjFxA/jNWxQ3Qcm23Xcq/Q
 vm+qpLQy0UJDr6reK0cqe+faRUveaLWA3WqKjUUYxSG1L8odPBZdLFcnheDvBGn7Savp
 C4oW/yau43UifabIu3Vhk2Vwx98Zq0lLoCj5vLUSsWx7nJPmpgkt220HOlCxSGr12r3B
 vJIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1731415741; x=1732020541;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=uyDbG8WmlHUfOOwJXFgUm11idSuEHNxJbOFfw4uInpo=;
 b=SkEsX5IkVPYnW/izOnvVPz2Q0swgxasLT8kEI/9QR/z8o8iarmByHiDImisdrxILnN
 qKVmPmWZf4cIcogJdWXwuw1XuZgP7iTL4hGrmQIPeNIYmKb+bw+qAJZn0qWEI8kh4Q3w
 VJVHp2iXSiPPmNy87Ecc4shaX4QTFuL/RqIIbuQ0WQC5IfI/RiocpUeuC8My0vSmOxwP
 2IZBIjy6DhRvxM/B7cp0SQi1J3lfEZiB/ZBzo5l+JsDCzbu7rANFEXFj6E+stf7e447j
 MWpwQgvGbh1+CZKuB1ZjBLjO/rJkVDijncMygjtTw52ZtAIA2LZiGcrxfgQp1v5SOj5E
 3qdg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVt8Qx6xQ6Z9no9Pa9Err4YgQpDuQP8wCMQf5xrETN+svxlIkVMRcbU7w/w9sF2wyUCiIPgdKCaeUQ=@lists.freedesktop.org,
 AJvYcCW3QPzh3eDB/0DVSBJjUvdhAc4ZIXE+7+kkCtCBONFEzJ7x4tWEixeQiU+dZfVsmbSgAoFZUrXICA8=@lists.freedesktop.org,
 AJvYcCWUfnPXolkL8ZMxJvqI1mxruegzAWLyZuTPQMLnW3xe0ubIBp+YhsKQNoW0nPebtur8vslLeNS4ZgpZ@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxDg0UYREXbsPlNjVYVZjPjmKyIDEJZ8AeLzi/WCmAJkrWkFBX7
 j7PtXA/W16Kbnkly5NFApqK9gPDzeVoINwWG7goc5rMSYtG8m/3w
X-Google-Smtp-Source: AGHT+IHpwK0BSIgTdysN3cqOYSyVo/pFhuw+GU8ilXyR4z3p4poQm1CADIm8AMOz1aERTBgxtDNSGQ==
X-Received: by 2002:a17:90b:2ecb:b0:2e5:5ab5:ba52 with SMTP id
 98e67ed59e1d1-2e9b173f1ddmr21641830a91.20.1731415740429; 
 Tue, 12 Nov 2024 04:49:00 -0800 (PST)
Received: from fedora.. ([2405:201:d007:50c2:b7e7:6df3:9958:a45d])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2e9e9b55935sm779521a91.1.2024.11.12.04.48.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Nov 2024 04:48:59 -0800 (PST)
From: Vamsi Krishna Brahmajosyula <vamsikrishna.brahmajosyula@gmail.com>
To: gustavo.sousa@intel.com, jani.nikula@linux.intel.com,
 rodrigo.vivi@intel.com, joonas.lahtinen@linux.intel.com,
 tursulin@ursulin.net, airlied@gmail.com, simona@ffwll.ch
Cc: skhan@linuxfoundation.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v4] drm/i915/cx0: Set power state to ready only on owned PHY
 lanes
Date: Tue, 12 Nov 2024 18:18:52 +0530
Message-ID: <20241112124852.6940-1-vamsikrishna.brahmajosyula@gmail.com>
X-Mailer: git-send-email 2.47.0
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

Address the following todo to perfom power state ready on owned lanes.
    TODO: For DP alt mode use only one lane.

Tested on Meteor Lake-P [Intel Arc Graphics] with DP alt mode.

Signed-off-by: Vamsi Krishna Brahmajosyula <vamsikrishna.brahmajosyula@gmail.com>
---
v3 -> v4:
- Rebase code
- Include exact TODO to the commit message
v2 -> v3:
- Fix changelog per Jani Nikula's feedback
v1 -> v2: Address Gustavo Sousa's feedback
- Use owned lanes mask to set Phy power state to Ready, instead of
  maxpclk_lane with DP alt mode check.
- Owned lanes are obtained from intel_cx0_get_owned_lane_mask().
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

base-commit: 2d5404caa8c7bb5c4e0435f94b28834ae5456623
-- 
2.47.0

