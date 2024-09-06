Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 869D796FE91
	for <lists+dri-devel@lfdr.de>; Sat,  7 Sep 2024 01:45:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B03DB10EB11;
	Fri,  6 Sep 2024 23:45:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="nO4Npbpc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com
 [209.85.215.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 90B4C10EAB2;
 Fri,  6 Sep 2024 17:46:11 +0000 (UTC)
Received: by mail-pg1-f172.google.com with SMTP id
 41be03b00d2f7-7c1324be8easo2439435a12.1; 
 Fri, 06 Sep 2024 10:46:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1725644770; x=1726249570; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=//GMh5wcWPuvbL5byVeOpp7gx8/ceI9tmF4jI5oBjrY=;
 b=nO4NpbpcTbWi0zmIFsKTd7vsqKyz+dk81jitwd+Xta1JCfYpKg3VeJpA9b+ZrYEznc
 pHjxNkqbnc2BosjYzfS9D8tU+TZNDb2VF4STbF6xGVstUNeun57PuY/KsGMxX9qSFA6n
 IcShQC+lONSZC89W/gaUPp+Ai1ot/wgeQ+bS3sZYM7ynAj+NFHZQBrRj+hOs/TQMj3vF
 uTvFWFJ9HQy77vAPbcI/NCdJPn1tau28HW9UQfXBLdQ1bpiaGef+VsSgWBddkGRWZWQY
 j2Q/7goeUVZU8qUR8ss7CyZmHHzMySggDiZJ3S9XnCMCpSHNZHvIw8ICtYNkQuBu/M4b
 hm2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725644770; x=1726249570;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=//GMh5wcWPuvbL5byVeOpp7gx8/ceI9tmF4jI5oBjrY=;
 b=kfZAvPhVdEXdrzMTTxKoDhr0IDd8EvmRZIs1UEdRQON+zWmpXisCKyK5RFw3b2Lrh2
 a53TkgsUSUE1Du22TTCjMKXIasG7pL2CIUR8HFnA1RUTbN6fKmg0c7fzO6ElhX56Vw4r
 EIVPcAiKC2QX9aHgrmMkKMIf60gRNPdMEi5riYtXiLmKL66x00OesXVhbxmq3synKDwG
 t3luFQHgxRSJKKkElmKSQ/F4ez0SvzFsFSP5ncOPAb0NH8pdWwAHmTHLFiPzv8QUHEWo
 /jR2yFfc2yrXEJc6PAuS17AccpAEzqf/8LhmBy0Bbn2qACsmq7U8ojFwHA8TNm8uPNG4
 Lz9w==
X-Forwarded-Encrypted: i=1;
 AJvYcCW/f7ExC6aTILLYvug0S+jRJkeXRmpzL6VeP74eNEMnO13zR5iN+U2l/X5gm+0N8EXNzwtxjFSnG2Y=@lists.freedesktop.org,
 AJvYcCXn50zW6CeqkcaxYeKNwIQ91NINnaZ9jyGAewcFIPo0sWwRcvFjn1iY4whruotCGPvQA4YKi+GSDMc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yyqo3OG2ZOW9YkfA7w2GSw+zdpkXSqiZbNV66Y5Uxn3SGm24wkA
 tus4Tiklh2yTaIIm9wDqCa2e9B3/loRd2xM79cdN7Pt48l9wX65ZLd5R6Zpi1fNaIQ==
X-Google-Smtp-Source: AGHT+IHl1QwGj6f27gy0SNNX8R4uHPJcDOIVI4Q+cvPI+qzi59HzqJAavBhcgc+seszYKXg3rYCwsg==
X-Received: by 2002:a17:90b:4c42:b0:2c9:7343:71f1 with SMTP id
 98e67ed59e1d1-2dad511c22fmr5252445a91.14.1725644769664; 
 Fri, 06 Sep 2024 10:46:09 -0700 (PDT)
Received: from fedora.. ([2405:201:d007:50c2:4888:86b4:6f32:9ae])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2dab6e5dc04sm1466452a91.1.2024.09.06.10.46.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Sep 2024 10:46:09 -0700 (PDT)
From: Vamsi Krishna Brahmajosyula <vamsikrishna.brahmajosyula@gmail.com>
To: dri-devel@lists.freedesktop.org
Cc: jani.nikula@linux.intel.com, rodrigo.vivi@intel.com,
 joonas.lahtinen@linux.intel.com, tursulin@ursulin.net, airlied@gmail.com,
 daniel@ffwll.ch, skhan@linuxfoundation.org,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] drm/i915/cx0: Use one lane to set power state to ready in DP
 alt mode
Date: Fri,  6 Sep 2024 23:16:01 +0530
Message-ID: <20240906174601.9271-1-vamsikrishna.brahmajosyula@gmail.com>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Fri, 06 Sep 2024 23:45:00 +0000
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

In DP alt mode one lane is owned by display and the other by usb
intel_cx0pll_enable currently performs a power cycle ready on both
the lanes in all cases.

Address the todo to perfom power state ready only on the display lane
when DP alt mode is enabled.

Tested on Meteor Lake-P [Intel Arc Graphics] with DP alt mode.

Signed-off-by: Vamsi Krishna Brahmajosyula <vamsikrishna.brahmajosyula@gmail.com>
---
 drivers/gpu/drm/i915/display/intel_cx0_phy.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_cx0_phy.c b/drivers/gpu/drm/i915/display/intel_cx0_phy.c
index 4a6c3040ca15..47aa0418379c 100644
--- a/drivers/gpu/drm/i915/display/intel_cx0_phy.c
+++ b/drivers/gpu/drm/i915/display/intel_cx0_phy.c
@@ -2949,9 +2949,13 @@ static void intel_cx0pll_enable(struct intel_encoder *encoder,
 
 	/*
 	 * 3. Change Phy power state to Ready.
-	 * TODO: For DP alt mode use only one lane.
+	 * For DP alt mode use only one lane.
 	 */
-	intel_cx0_powerdown_change_sequence(encoder, INTEL_CX0_BOTH_LANES,
+	if (intel_tc_port_in_dp_alt_mode(dig_port))
+		intel_cx0_powerdown_change_sequence(encoder, maxpclk_lane,
+					    CX0_P2_STATE_READY);
+	else
+		intel_cx0_powerdown_change_sequence(encoder, INTEL_CX0_BOTH_LANES,
 					    CX0_P2_STATE_READY);
 
 	/*

base-commit: b831f83e40a24f07c8dcba5be408d93beedc820f
-- 
2.46.0

