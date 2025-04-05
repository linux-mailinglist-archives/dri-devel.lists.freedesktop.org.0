Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CCC88A7D6CD
	for <lists+dri-devel@lfdr.de>; Mon,  7 Apr 2025 09:52:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 77EBF10E082;
	Mon,  7 Apr 2025 07:52:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="HoD3Fwe5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com
 [209.85.214.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C30EF10E04F;
 Sat,  5 Apr 2025 03:13:08 +0000 (UTC)
Received: by mail-pl1-f181.google.com with SMTP id
 d9443c01a7336-22423adf751so27038175ad.2; 
 Fri, 04 Apr 2025 20:13:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1743822788; x=1744427588; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=drXA/ORq1/goPnK4FHQgOKB7BhpRoZK6LoRjQ5OhHHo=;
 b=HoD3Fwe5ydhVZvBtdANV1n/LM0ZEKvV/VKHvXlwziX+JXR+I2XJ25TO42QrjkHH5Kf
 SNwuh5Qm/YccVtRf3e0aIhLyHCvNqSX6R8b2ewmvdLNTFQeIrAnyiThVXUcy8emFL8Yo
 RbREYXnIlsvwf1LXdst921u2c8M4Fy3t0koBF5s5kLtG77PqyAw+/FYRxWGcoLwaZImN
 H1hU4k0SI19oc990fbir0oqxL0taAzmc+4I/PtsomNM4mmcSJp+QLzBRBldoqQFI6jKS
 Rr7oJix0nTV+cCCjLpnqk/eZuAPwNh0oWToNXMY94S8UjUrNnG4fKicy0wvzDkGf69+Q
 OFkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1743822788; x=1744427588;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=drXA/ORq1/goPnK4FHQgOKB7BhpRoZK6LoRjQ5OhHHo=;
 b=IzmMYjlce45HlHFFnQ70vcOd/qL2eEe2Q2IX2MxqwyFUHwcICF9l4J8Id71H45B7P9
 7dugHRK9D0vVcZfJ30dvttXWmN5nWgoHQJL4q1W2Y5hSNZpGoUgiAzRTysHuRVbc9F9x
 OFPCxl05JuBECSVZuEuxHf5nBsvqqsG7G3h0P4TBzqoJxkieU20hNauQQukXUtK8l/Qg
 i2h32UBCn1sd42ssFCm+byyAdfD+5oLZfxBeVn2rh6+wS2ziYCGZ4V9Vua6ODnCgAy50
 r28CK88ww23XoDLKtNJDA9xJ79hBBcgLqBPJoSIIYOCpm4baVohgfZ+9QDwRmTmN5wfh
 Tdcg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUrWn0iXy9r5dTx/XqO3y0u8KuyRca+huYiwG1RtENybIXpxHnDBhMcsx1QksKWt7IMv1n/iiCBxaE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzgB5AxGkQ/Appa0b0KELiorUsw8v2A5OBiT2e72kJNfogfteor
 tydw7k/kXT5gnSrwekBT3yRB9lziWzzvDtfxiRe/Cxzmw8qcpVdI
X-Gm-Gg: ASbGnctFmxzqg/TRnDoC6iCD297QkRgr/RuyRME86K3lD5ReDTYaH8gnYuSBbxF/itJ
 iZSXYBjsp0ITo29oyHsI+Io0qMmHbdJsKFV+BOgwL99+TmzWONAKwez47eRpo3E+Yu5S7oHoSNK
 L5ROB6SJGfEpsFMRHJ8FPkt18yeyMPNL5aLT5Sei3TgdB8hgQgyhC+a3qud+fYThlNp33HNpX4z
 RMJUU01w4VZVSiuW/yd2FFef0f5F3qt2mTnNBE0WgTo3253/KohGAX78wqzCgwxxA7WgEhBhQjB
 a50KzkLuRXraSqS1hFZv2VvkTf/RaBnqdktJePSfZxo/YgaDekdEMshIFKzvFQiJ
X-Google-Smtp-Source: AGHT+IE3iEB32WmiGNtkvgzjIzILnbvUYJ6xa15e+n+H/vT9fCrVReqQW9kxkhkIbU/RbmW5+vXFnA==
X-Received: by 2002:a17:903:1209:b0:224:76f:9e4a with SMTP id
 d9443c01a7336-22a8a05b5cdmr75324725ad.14.1743822788103; 
 Fri, 04 Apr 2025 20:13:08 -0700 (PDT)
Received: from localhost.localdomain ([2401:4900:60dc:5afc:cf4e:e4c3:6b7:3c11])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-229785ad8d6sm40514395ad.1.2025.04.04.20.13.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Apr 2025 20:13:07 -0700 (PDT)
From: Kevin Paul Reddy Janagari <kevinpaul468@gmail.com>
To: alexander.deucher@amd.com, christian.koenig@amd.com, airlied@gmail.com,
 simona@ffwll.ch, sunil.khatri@amd.com, mario.limonciello@amd.com,
 aurabindo.pillai@amd.com, boyuan.zhang@amd.com, sunpeng.li@amd.com,
 dominik.kaszewski@amd.com
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, skhan@linuxfoundation.org,
 Kevin Paul Reddy Janagari <kevinpaul468@gmail.com>
Subject: [PATCH] Fixed the warning at
 ./drivers/gpu/drm/amd/include/amd_shared.h:369
Date: Sat,  5 Apr 2025 08:42:42 +0530
Message-Id: <20250405031242.64373-1-kevinpaul468@gmail.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Mon, 07 Apr 2025 07:52:13 +0000
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

warning: Incorrect use of kernel-doc format:
* @DC_HDCP_LC_ENABLE_SW_FALLBACK If set, upon HDCP Locality Check FW

Signed-off-by: Kevin Paul Reddy Janagari <kevinpaul468@gmail.com>
---
 drivers/gpu/drm/amd/include/amd_shared.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/include/amd_shared.h b/drivers/gpu/drm/amd/include/amd_shared.h
index 4c95b885d1d0..c8eccee9b023 100644
--- a/drivers/gpu/drm/amd/include/amd_shared.h
+++ b/drivers/gpu/drm/amd/include/amd_shared.h
@@ -366,7 +366,7 @@ enum DC_DEBUG_MASK {
 	DC_HDCP_LC_FORCE_FW_ENABLE = 0x80000,
 
 	/**
-	 * @DC_HDCP_LC_ENABLE_SW_FALLBACK If set, upon HDCP Locality Check FW
+	 * @DC_HDCP_LC_ENABLE_SW_FALLBACK: If set, upon HDCP Locality Check FW
 	 * path failure, retry using legacy SW path.
 	 */
 	DC_HDCP_LC_ENABLE_SW_FALLBACK = 0x100000,
-- 
2.39.5

