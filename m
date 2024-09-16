Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E5CC97A71E
	for <lists+dri-devel@lfdr.de>; Mon, 16 Sep 2024 20:01:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B9D3F10E3C2;
	Mon, 16 Sep 2024 18:01:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Gu7bq1ly";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com
 [209.85.214.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B5FF910E3C2;
 Mon, 16 Sep 2024 18:01:45 +0000 (UTC)
Received: by mail-pl1-f180.google.com with SMTP id
 d9443c01a7336-2053a0bd0a6so49016065ad.3; 
 Mon, 16 Sep 2024 11:01:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1726509705; x=1727114505; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=HM7yZDstT32KnRF5TqsXhuhE8I3k19PJmZPriUtEwCM=;
 b=Gu7bq1lyJKPj2Z/oEgp0mNiDnQfY4fxzfPfS4k4Ioo8XCMHJk5KIdogz9K+/z8EPTj
 s7e8Yvv7eMzV5guUu7/qCFnZiL8dG17D/w2nuTuUjkOKiyZ2cpfmJb+s1nutL0w6hE8V
 psXDgytXMEFsMOzjUoEHxFrXCBytkXa8M2dpCt2d4XnupjumZsn3eM1L7TTy373niwUm
 wySLcUfm/K2UtRNMUqCfudrCYyvfmaviFL5wpJtkwTGAXLS7jyPjN0liBEvO/qw6iCo8
 mhIIk7muKAfrAFWHJWLEa1n9LzzPVe9BhNE8Vu3ry6fwwXOvi5ftZkBmOGPg2s14kFih
 vp8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726509705; x=1727114505;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=HM7yZDstT32KnRF5TqsXhuhE8I3k19PJmZPriUtEwCM=;
 b=qnfj9NCA6hDoCQewPKYU+6RUXF99LmfPxK/QhNJC7C5iLLrkzLQH4pphGxV7+ulasY
 1563MCPmqMkG0bzpuIvxFVUntaAeordOTaxe32jjmpfewi6wvqvjJtSY75QGZyAPdAZB
 DR1+sxxcJ1UFn7gmM4ozSuA+NZcMvHZzLdAU+fmTOEUTtKfKyEzIC7jRv7gCDqYX6bkY
 5lkztzdLaTb2NurI9Leg8SDUXJBC9ImCMvXrf4Rn88oEiVEKDDpJG6r82Bq+1kkmTEHD
 9IVVru4sCenWxKHTUfFSKHD84xvS8/4Ck4/0wYqukbIXL9jbgYWkCwT4y7MS0pQD/P9L
 uQBQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUDHZ6e7tS1kHY5sKwZHycOXjq8rkwZySvBqyLlDaVLtRa+0p5jDz/sdBmM9uiYC54rqwE7cnMV9bs=@lists.freedesktop.org,
 AJvYcCVBnx6/jFGdV2CshgmfZeCKiNohS/H/I2lQ13/IteCZAr+OkY8NikCgif6z2cQFsf2wBrgpmppi9sI=@lists.freedesktop.org,
 AJvYcCWukKy/qObBS0nr8Tqneca/CtebpB5nVtTpBDV5OGZ7jTadAz0Yyow5h/yUHjkcMRGTwIxNyLjHNp6x@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzTc00xYJqtxK6a5r2yiiljHPijj9uF0QVsTtEzpwaWI+I1qkDe
 qU30zBb43AV0YWVCvr6v4oeVIBGDUIwpvlFPDm4LuyTQvaqPecLD
X-Google-Smtp-Source: AGHT+IF/+A6mrgl6Ock23OiKbg4Cer/TYYH0w02Pdbq5FW/ya8TUeOPtqQhk7tXeYaNhDI1b5GUG3Q==
X-Received: by 2002:a17:902:face:b0:205:3e6d:9949 with SMTP id
 d9443c01a7336-2076e42e171mr181216255ad.52.1726509704832; 
 Mon, 16 Sep 2024 11:01:44 -0700 (PDT)
Received: from fedora.. ([2405:201:d007:50c2:4888:86b4:6f32:9ae])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-207945da788sm38868525ad.18.2024.09.16.11.01.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Sep 2024 11:01:44 -0700 (PDT)
From: Vamsi Krishna Brahmajosyula <vamsikrishna.brahmajosyula@gmail.com>
To: gustavo.sousa@intel.com, jani.nikula@linux.intel.com,
 rodrigo.vivi@intel.com, joonas.lahtinen@linux.intel.com,
 tursulin@ursulin.net, airlied@gmail.com, daniel@ffwll.ch
Cc: skhan@linuxfoundation.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v2] drm/i915/cx0: Set power state to ready only on owned PHY
 lanes
Date: Mon, 16 Sep 2024 23:31:37 +0530
Message-ID: <20240916180137.9203-1-vamsikrishna.brahmajosyula@gmail.com>
X-Mailer: git-send-email 2.46.0
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
by the display. intel_cx0pll_enable currently performs a power cycle
ready on both the lanes in all cases.

Address the todo to perfom power state ready on owned lanes.

Tested on Meteor Lake-P [Intel Arc Graphics] with DP alt mode.

v1 -> v2: Address comments from Gustavo Sousa

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

