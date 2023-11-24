Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 96AD07F796F
	for <lists+dri-devel@lfdr.de>; Fri, 24 Nov 2023 17:39:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 57CEA10E0D7;
	Fri, 24 Nov 2023 16:39:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F7BC10E0D7
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Nov 2023 16:39:20 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-332cb136335so1389816f8f.0
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Nov 2023 08:39:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1700843959; x=1701448759; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=jHTMENAVi47XR6rxLgnHilsaqtzEhcUlvrvQs0OyJoU=;
 b=SAxnrxxsUaEhnclA6XDHGIyFWeu7Tjpn33qJ/sHu8huWgzb84HGbejp6+/WRC1j9Ho
 KalgeH9zvkb249ulP4qeOIh6prkw+SSPsmYsBPoLleVGGZiiNTPc2SCnnk2H9+pGFglB
 ppp9XC+QmuwtuEQlcS2VR+NBhaboNTZdi5tSaJA1Jkm+MsvD6tfEApU+Vcw7xqHo6aHu
 l4/ne+Kis1V0r+H88SbTqx0dEgCBJbFKVtiB48d8TFCFXFvhb8rWmpkjpAfyivhiUciA
 OhfZ3eCQfbTOBLu1XJS9CetQ/cZEqtvDuDpf5ZaOOm+3iB2Ln0GPCxBm6FwXba2FDf0I
 flMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700843959; x=1701448759;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=jHTMENAVi47XR6rxLgnHilsaqtzEhcUlvrvQs0OyJoU=;
 b=TEGzJTHPLsw/rLvJvNN+Ecb9cTxDYAdyXB9FcbSO8Wnj80162n+Qjw6W913lJApJ91
 JcyMJc99kj5vcd9tBW3yLCgiE//bK1bpReMK/2pX6UdMY0e81Zmi0GORy39nGzE0LZnM
 YInj7UivJw2jp6ppmjJQgfZzxvchzXveHJ4ENwmEKYh9eErPl4j3o/5l5q3+mOZYjSwt
 jkM3JBYvS0+90J7J4sXU3J+sd7P9shr63IkiWwzMFley1kk59NZ1h6wqgwMwVoSBkis4
 nHmetiZrpLdCBYfc1mudwaLRLHgacPV3jE97ValPht8AyGABMue7ItOMcSaHyAZR++7M
 lHNQ==
X-Gm-Message-State: AOJu0Yx4+1uTrmJcSb1HvpfxSzp4vhMKxzvf7yPrhNnPXP6YsL/imavD
 dhK0HhXY4tBzQKUBN1ByP2U=
X-Google-Smtp-Source: AGHT+IHgvt3JEGuFmzPkYjDljN5d22OqpBBoT+phXZicmhBss5j/DMGuOvopUBPJTeMCd+p8/KjybQ==
X-Received: by 2002:a5d:5267:0:b0:332:d1cc:6374 with SMTP id
 l7-20020a5d5267000000b00332d1cc6374mr3108691wrc.47.1700843958487; 
 Fri, 24 Nov 2023 08:39:18 -0800 (PST)
Received: from localhost (cpc154979-craw9-2-0-cust193.16-3.cable.virginm.net.
 [80.193.200.194]) by smtp.gmail.com with ESMTPSA id
 s15-20020adf978f000000b00332d41f0798sm4747110wrb.29.2023.11.24.08.39.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Nov 2023 08:39:17 -0800 (PST)
From: Colin Ian King <colin.i.king@gmail.com>
To: Frank Binns <frank.binns@imgtec.com>,
 Donald Robson <donald.robson@imgtec.com>,
 Matt Coster <matt.coster@imgtec.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org
Subject: [PATCH][next] drm/imagination: Fix a couple of spelling mistakes in
 literal strings
Date: Fri, 24 Nov 2023 16:39:17 +0000
Message-Id: <20231124163917.300685-1-colin.i.king@gmail.com>
X-Mailer: git-send-email 2.39.2
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
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

There are a couple of spelling mistakes in literal strings in the
stid_fmts array. Fix these.

Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
---
 drivers/gpu/drm/imagination/pvr_rogue_fwif_sf.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/imagination/pvr_rogue_fwif_sf.h b/drivers/gpu/drm/imagination/pvr_rogue_fwif_sf.h
index 571954182f33..56e11009e123 100644
--- a/drivers/gpu/drm/imagination/pvr_rogue_fwif_sf.h
+++ b/drivers/gpu/drm/imagination/pvr_rogue_fwif_sf.h
@@ -497,7 +497,7 @@ static const struct rogue_km_stid_fmt stid_fmts[] = {
 	{ ROGUE_FW_LOG_CREATESFID(213, ROGUE_FW_GROUP_MAIN, 1),
 	  "Safety Watchdog threshold period set to 0x%x clock cycles" },
 	{ ROGUE_FW_LOG_CREATESFID(214, ROGUE_FW_GROUP_MAIN, 0),
-	  "MTS Safety Event trigged by the safety watchdog." },
+	  "MTS Safety Event triggered by the safety watchdog." },
 	{ ROGUE_FW_LOG_CREATESFID(215, ROGUE_FW_GROUP_MAIN, 3),
 	  "DM%d USC tasks range limit 0 - %d, stride %d" },
 	{ ROGUE_FW_LOG_CREATESFID(216, ROGUE_FW_GROUP_MAIN, 1),
@@ -1114,7 +1114,7 @@ static const struct rogue_km_stid_fmt stid_fmts[] = {
 	{ ROGUE_FW_LOG_CREATESFID(39, ROGUE_FW_GROUP_SPM, 2),
 	  "3DMemFree matches freelist 0x%08x (FL type = %u)" },
 	{ ROGUE_FW_LOG_CREATESFID(40, ROGUE_FW_GROUP_SPM, 0),
-	  "Raise the 3DMemFreeDedected flag" },
+	  "Raise the 3DMemFreeDetected flag" },
 	{ ROGUE_FW_LOG_CREATESFID(41, ROGUE_FW_GROUP_SPM, 1),
 	  "Wait for pending grow on Freelist 0x%08x" },
 	{ ROGUE_FW_LOG_CREATESFID(42, ROGUE_FW_GROUP_SPM, 1),
-- 
2.39.2

