Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 65B13A922A8
	for <lists+dri-devel@lfdr.de>; Thu, 17 Apr 2025 18:27:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 92B3E10E168;
	Thu, 17 Apr 2025 16:27:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Dd3Rxq03";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com
 [209.85.128.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D23110E168
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Apr 2025 16:27:42 +0000 (UTC)
Received: by mail-wm1-f46.google.com with SMTP id
 5b1f17b1804b1-43cfba466b2so10456265e9.3
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Apr 2025 09:27:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1744907261; x=1745512061; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=GB37kMZvs0FEg/9iCSh3Qd53ghVH6b/CUXF0k0JMkaA=;
 b=Dd3Rxq03BeOFTbGNenP6sVujV64wTeRynLI6t9YpzN0FKA9qzhqVP6I1dBQ1UlTjF+
 /edv2DTz/3KeZ1PTqJLFT4a41ZVyqAWugw6XwU5gvIqelCkZP8Wl95ZrlCbYYiQDlWBi
 A0zvTDjrJ5iPHKcZLYKMxFsL22E8bwyqrmpu26DJjsx4L7rhPxon/4hBiIPsULBIvvfe
 RPbAPgHpec4pmzN2eDEdGL4FBJ3CCADPPe3cdtFINJc0i0LZPn95JIBETjQU5N5Mijvt
 uSwuW7640bOMvvvLOaEMFoqJgeheeFkDDf3taV5a3o1xGqqlhaQ6WWTSbbf5rM7azRiA
 lvJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744907261; x=1745512061;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=GB37kMZvs0FEg/9iCSh3Qd53ghVH6b/CUXF0k0JMkaA=;
 b=weTQTCHTeWFKTGarpX797HvDi+OCd67fYq73LuNFOsgO71bAXuXog2M/yl3Hce10rR
 DoriM1aQ7EKAXBMocR40LiC3k/Vyx3oSM/XlaiFIyAOtNHq/YZV/WTp/eLC7htLu5hMT
 dDlP09GlbuIBACfPbgwlIhDTrw3G7QnBEasbHjBwBMYUMCe1KhJgnSCjWVNtc2/zwigi
 doMzLPI3wD0ho/r2iGJ9623oSWV0xCdL78zzEwwVravRmbuYqKYVnKcEqV6Yx5SEXbRw
 /nMbilbZHk5T5QgJVtGnCnt4hEjgm8B6jZ+fJsokp263LMQFRSScLL0rOPkYiihimMnc
 105w==
X-Forwarded-Encrypted: i=1;
 AJvYcCV/oqkuoMTvKTCEWmiBdgRLQFHAT8wJ24Swg+qihYtC92QfDRCowOCuWkREBvptYT2JEerjOodKEH0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxP7bgvJZB7ErqXt5Io3lXa5exRXWu/f6eob2wf2ezoggUuZDZi
 q0Yas9zOX/w74WdAss2icAKx6od9OO0SPh3Si/aNx4hRWZnqs8Hy
X-Gm-Gg: ASbGncsLNxAcbbFNSLjsTolSXyTt4ot5FCg5As37XI6V7CCdGUAkhpC2rEP4XM3Tojv
 twsq7ASPvniknqE+vrkgzEQ0QID6FRvRbzC3wg0FRtG6mWmHFBMCHGoe3IG7Os3SqTwZnxGEbZL
 g4I+p12VosTReNUkwgBsopkuMtdySdmekTr+BntQL7gZXMwMGOl3gxlDur0W3/wTLIc9VbF2NBl
 jr0bc55wBJy+1jiWiB5Nb766ctCAZJ8x9O3SRGdPbZzdClAqRNSSA4O4w1lC0cdF3npAPY/eUqn
 O87CKT6vXre0IJh/OdEgcq6RhsVV/+wubTxMhSM/Hg==
X-Google-Smtp-Source: AGHT+IFXDNqqMl/zdyI+OeigjGP6jJlH4r0B2W1NnUiEK0FX6Olo5gOL6oxt3A2JU/Srkharlg+nDw==
X-Received: by 2002:a05:600c:46c6:b0:43d:1b74:e89a with SMTP id
 5b1f17b1804b1-4405d616abfmr65284125e9.9.1744907260862; 
 Thu, 17 Apr 2025 09:27:40 -0700 (PDT)
Received: from localhost ([194.120.133.58])
 by smtp.gmail.com with UTF8SMTPSA id
 5b1f17b1804b1-4405b4d127fsm61901965e9.12.2025.04.17.09.27.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Apr 2025 09:27:40 -0700 (PDT)
From: Colin Ian King <colin.i.king@gmail.com>
To: Ofir Bitton <obitton@habana.ai>, Tomer Tayar <ttayar@habana.ai>,
 Ohad Sharabi <osharabi@habana.ai>, Farah Kassabri <fkassabri@habana.ai>,
 dri-devel@lists.freedesktop.org
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH][next] accel/habanalabs: Make the read-only array
 edma_queues_id static const
Date: Thu, 17 Apr 2025 17:27:34 +0100
Message-ID: <20250417162734.491148-1-colin.i.king@gmail.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
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

Don't populate the read-only array edma_queues_id on the stack at run
time, instead make it static const.

Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
---
 drivers/accel/habanalabs/gaudi2/gaudi2.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/accel/habanalabs/gaudi2/gaudi2.c b/drivers/accel/habanalabs/gaudi2/gaudi2.c
index a38b88baadf2..1e401f42eef7 100644
--- a/drivers/accel/habanalabs/gaudi2/gaudi2.c
+++ b/drivers/accel/habanalabs/gaudi2/gaudi2.c
@@ -10304,10 +10304,12 @@ static int gaudi2_memset_memory_chunk_using_edma_qm(struct hl_device *hdev,
 
 static int gaudi2_memset_device_memory(struct hl_device *hdev, u64 addr, u64 size, u64 val)
 {
-	u32 edma_queues_id[] = {GAUDI2_QUEUE_ID_DCORE0_EDMA_0_0,
-					GAUDI2_QUEUE_ID_DCORE1_EDMA_0_0,
-					GAUDI2_QUEUE_ID_DCORE2_EDMA_0_0,
-					GAUDI2_QUEUE_ID_DCORE3_EDMA_0_0};
+	static const u32 edma_queues_id[] = {
+		GAUDI2_QUEUE_ID_DCORE0_EDMA_0_0,
+		GAUDI2_QUEUE_ID_DCORE1_EDMA_0_0,
+		GAUDI2_QUEUE_ID_DCORE2_EDMA_0_0,
+		GAUDI2_QUEUE_ID_DCORE3_EDMA_0_0
+	};
 	u32 chunk_size, dcore, edma_idx, sob_offset, sob_addr, comp_val,
 		old_mmubp, mmubp, num_of_pkts, busy, pkt_size, cb_len;
 	u64 comp_addr, cur_addr = addr, end_addr = addr + size;
-- 
2.49.0

