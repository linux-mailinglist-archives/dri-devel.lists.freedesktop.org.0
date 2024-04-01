Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C6CA894D1C
	for <lists+dri-devel@lfdr.de>; Tue,  2 Apr 2024 10:03:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F2C2510F2BE;
	Tue,  2 Apr 2024 08:02:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=toblux-com.20230601.gappssmtp.com header.i=@toblux-com.20230601.gappssmtp.com header.b="babbquku";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com
 [209.85.208.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7AE4510F5DB
 for <dri-devel@lists.freedesktop.org>; Mon,  1 Apr 2024 22:40:09 +0000 (UTC)
Received: by mail-ed1-f44.google.com with SMTP id
 4fb4d7f45d1cf-56de73d749fso17481a12.0
 for <dri-devel@lists.freedesktop.org>; Mon, 01 Apr 2024 15:40:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=toblux-com.20230601.gappssmtp.com; s=20230601; t=1712011207; x=1712616007;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Lm0/pyPQLpsucp7jeAp4DAwcuzeghtYOnq9ys62dZUg=;
 b=babbqukuS3ET4yQBWoibnild4coL3F+Rx+NoVsx4eHt57gaI56hkaD94FJFbcm0f56
 9dM9z3tEjFxEE7uFSxWSBX0dkMflN0U0RARKH0aZVsRnZiPpARZplHLfQ67XaBzcLnik
 QDTyWq/qKz/CHbn2qyPY8DiZZ+c4ApygxiQKQ7Zw00K8KlWSCkOq/qkAZTgp254ffrj5
 i3Nb6OI6LvDGVIOet4Uu8edf7dE7BTjekIGE8FbdDWbe/m3+iBHMcfMSypJYKKksMB7D
 qasvzLRDsNTdCOZooc9PshbONP7f0KdIxsz0KkzxAOK1Zc4nCvHr2iHggsZQHllX5CUu
 JkHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712011207; x=1712616007;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Lm0/pyPQLpsucp7jeAp4DAwcuzeghtYOnq9ys62dZUg=;
 b=tM3afdn8ADkGXIoPR5u6nyxKCLjtCC+Gb6bjKyvGJRlWhluyQcM0Xg/yGfeq0WxojA
 EcVxuGH9SsxHlHmYkJb3ZQ8A4f/MPomIOjxgDjMT3KND5dhga0fA5ZMC8wTvffgLbgGa
 NHlYMHZ+OYBZk4nNIt2bxAvHPT96C+8HTq+WFK0kbloVmeiEaeV6buNQC3saC19zyIOC
 7JmggGkJseqFonEAtagCmmNVv6j2u5AldHodeRRciMQgSEPRlNUdOJwqvOcLvIwXVOay
 w0rgRlwpxlaZTZavZSF3x3K2u8DNjvP16GAwGO3HQx4ZvWBxeEHGOu8qZy9NzdNqI9tX
 6h/Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCUpm93DfEUR2VpFmVp/bJVavyCHme5nm9jlIr8drGlY5B4/HNiaCbm4TErsXJxHgPgiPA/qSKDvkHATWfo3KlBxaQB5W5iKlIxidf46bMRA
X-Gm-Message-State: AOJu0YyHMh/2r+kPqFwdn+gGMJnoicl6l1ezMewbIdJSDNC2r7PBGfVl
 dCWUnu2sE8h8Ybx5b4xILDf2gKOrRGkyS7VGmraEJ9+ufbrQpvlpffARSjBa6sc=
X-Google-Smtp-Source: AGHT+IFoemV+XmEcu8XZvJ2xMiDzvl5gB/kFX12BcKB+LRgUfRDX4L91CSMW9sNNTnUkkHeM1Oqj/Q==
X-Received: by 2002:a50:d69a:0:b0:56b:b7f1:80a2 with SMTP id
 r26-20020a50d69a000000b0056bb7f180a2mr4785357edi.40.1712011207504; 
 Mon, 01 Apr 2024 15:40:07 -0700 (PDT)
Received: from fedora.fritz.box (aftr-82-135-80-212.dynamic.mnet-online.de.
 [82.135.80.212]) by smtp.gmail.com with ESMTPSA id
 z3-20020a50eb43000000b0056dc82d630csm2794763edp.31.2024.04.01.15.40.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Apr 2024 15:40:07 -0700 (PDT)
From: Thorsten Blum <thorsten.blum@toblux.com>
To: Oded Gabbay <ogabbay@kernel.org>, Ofir Bitton <obitton@habana.ai>,
 Tomer Tayar <ttayar@habana.ai>, Dani Liberman <dliberman@habana.ai>,
 Farah Kassabri <fkassabri@habana.ai>
Cc: Dafna Hirschfeld <dhirschfeld@habana.ai>,
 Moti Haimovski <mhaimovski@habana.ai>, Koby Elbaz <kelbaz@habana.ai>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Thorsten Blum <thorsten.blum@toblux.com>
Subject: [PATCH] accel/habanalabs/gaudi2: Use kvfree() for memory allocated
 with kvcalloc()
Date: Tue,  2 Apr 2024 00:38:17 +0200
Message-ID: <20240401223816.109036-2-thorsten.blum@toblux.com>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Tue, 02 Apr 2024 08:02:52 +0000
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

Fixes the following Coccinelle/coccicheck warning reported by
kfree_mismatch.cocci:

	WARNING kvmalloc is used to allocate this memory at line 10398

Signed-off-by: Thorsten Blum <thorsten.blum@toblux.com>
---
 drivers/accel/habanalabs/gaudi2/gaudi2.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/accel/habanalabs/gaudi2/gaudi2.c b/drivers/accel/habanalabs/gaudi2/gaudi2.c
index fa1c4feb9f89..8024047962ec 100644
--- a/drivers/accel/habanalabs/gaudi2/gaudi2.c
+++ b/drivers/accel/habanalabs/gaudi2/gaudi2.c
@@ -10489,7 +10489,7 @@ static int gaudi2_memset_device_memory(struct hl_device *hdev, u64 addr, u64 siz
 				(u64 *)(lin_dma_pkts_arr), DEBUGFS_WRITE64);
 	WREG32(sob_addr, 0);
 
-	kfree(lin_dma_pkts_arr);
+	kvfree(lin_dma_pkts_arr);
 
 	return rc;
 }
-- 
2.44.0

