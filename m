Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 40E31ABA9DA
	for <lists+dri-devel@lfdr.de>; Sat, 17 May 2025 13:43:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE12210E165;
	Sat, 17 May 2025 11:43:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="YsuTB9Kj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com
 [209.85.160.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DDB8610E0F4;
 Sat, 17 May 2025 03:09:42 +0000 (UTC)
Received: by mail-qt1-f177.google.com with SMTP id
 d75a77b69052e-4769f3e19a9so19662771cf.0; 
 Fri, 16 May 2025 20:09:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1747451381; x=1748056181; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=ffCQ/OEpQBGYzhPI44r26h6E9XjNcAQxTXB2Nzg9x64=;
 b=YsuTB9KjD0ADUIjxaW0Kdrk5xhxnj8mQ5SDebyIwVDme/H/1Y17DVDzUdVWOoxLU4B
 9Zq40e8pNlW8lziFvH0F4VABggz0C7V7SbNZ/KlGGjui+Yu6zd9IsTuEZOl44QJNiCxr
 u7y+9v4eAvFcJTl5A7tkNqJUxH7F9Wu3SfcAtcyUiRpT6Qus9XcyOh7J0z4G0QXklZpK
 5T+6SzFYFVom3BxYGMj++y35mA/86JAupDTAQyvVdrQ3o8OL91k0IZ0I/nFkJPXhr3za
 3oMl8DXx+nkpaWfGB66n3EiFIFAEgkbSp9E5BiivUcYx4IPRbG4zueJHLX7UMTim8YRx
 DU8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747451381; x=1748056181;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ffCQ/OEpQBGYzhPI44r26h6E9XjNcAQxTXB2Nzg9x64=;
 b=Kag3fIW1Opw2JnMv932V7edkw2yjsW2C/Q84uqIxMh5xlHlkuoqBDpY3uNAqdzQ0Qt
 3ZspnbeiaVTXXU6Z2CzIMQhQu38NgzPADZWGoLvwvqsIYqkIg5Ou2v8XWlv//VGtmegg
 L7cPB0bXYsCQmHrF7rsONkzefuH1kX60K5oeJzFP4avo7ymBtE1gXP5ITxff4x6g5TaS
 Bt6Gn4o5tmKAWqm8RwBPxyivmAcbN0+W7DoNI+kSWaf7hLgicStNjWTR3GX2yEAHt8q/
 nnsYoTU4aSxrCGXvrQS84uF3hCOtgwtm0B2H6Df2CXJlafiWhp6KJ3HIHpXVSNVL2+h4
 BpLg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWi9TPlx1XPbd6hNnr9/eeL1MjUaKW5qE0bgTBTK0FaGobJDbske/yHR0ug6px2nsigorCcoC0V13M=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzWgDTVK/4gRKwwYCLeo1zCVk7oM1jkMFZ6FG1eVzVTi2t/ewEn
 WQjijKI27vVEiT0AXMpvtThpbuDG2td+tHznxGEYZeyjEGQN/dnK/Vo=
X-Gm-Gg: ASbGncuOHbjq3bKZjgsv09d8ELOgGTDVnzXTbN5lTiOCFrJ41Bc6ItZ0LAR/850Kzh1
 6hL+SDOo5UddiA+7f8J94Tv7zKl8Yj4ClDaMoqgntwUHf8XCk/m3r5n9wVagF6497HGSFT+LEcA
 w8O0urpdJb7LyArLoBNj4Ar2b0yMVIxTJd7f6QaPITgljbAgB85CsBkHWw1UY1ScDnLgYbMfg5w
 Tsfws5nLUMZavEVIIh7gW66pNEpWigid11a2GDZ6PGqbBPnHlPuBEzWOxPmTLZpGa5VdywQsMAC
 Q27YuwOXWXnSOYuzkufltk790D/WlH0P58RLks4wx7L/M8yKWDYDwp0PBZKIQy1M3ynDQ37Yquo
 A
X-Google-Smtp-Source: AGHT+IFAY96+ViAXpFtWvPTpkpmN/e9/h01C8VfuwPJZMxAbErTShgFH39ZlL3cy+dkElD1U1qsPfw==
X-Received: by 2002:ac8:5c95:0:b0:479:c1:6c21 with SMTP id
 d75a77b69052e-494ae3509eemr113366961cf.5.1747451381027; 
 Fri, 16 May 2025 20:09:41 -0700 (PDT)
Received: from localhost.localdomain
 ([2a0d:e487:156f:5546:ce07:3a5c:a2f1:3741])
 by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-494ae3f8f6fsm19165861cf.30.2025.05.16.20.09.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 May 2025 20:09:40 -0700 (PDT)
From: Jihed Chaibi <jihed.chaibi.dev@gmail.com>
To: alexander.deucher@amd.com, christian.koenig@amd.com, airlied@gmail.com,
 simona@ffwll.ch
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-kernel-mentees@lists.linux.dev,
 skhan@linuxfoundation.org, jihed.chaibi.dev@gmail.com
Subject: [PATCH 2/2] fixing typo in function name
Date: Sat, 17 May 2025 05:09:35 +0200
Message-Id: <20250517030935.823041-1-jihed.chaibi.dev@gmail.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Sat, 17 May 2025 11:43:17 +0000
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

"ENABLE" is currently misspelled in SYS_INFO_GPUCAPS__ENABEL_DFS_BYPASS

Signed-off-by: Jihed Chaibi <jihed.chaibi.dev@gmail.com>
---
 drivers/gpu/drm/radeon/atombios.h | 2 +-
 drivers/gpu/drm/radeon/kv_dpm.c   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/radeon/atombios.h b/drivers/gpu/drm/radeon/atombios.h
index 2db407892..b961096a4 100644
--- a/drivers/gpu/drm/radeon/atombios.h
+++ b/drivers/gpu/drm/radeon/atombios.h
@@ -5072,7 +5072,7 @@ typedef struct _ATOM_INTEGRATED_SYSTEM_INFO_V1_7
 #define SYS_INFO_GPUCAPS__TMDSHDMI_COHERENT_SINGLEPLL_MODE                0x01
 #define SYS_INFO_GPUCAPS__DP_SINGLEPLL_MODE                               0x02
 #define SYS_INFO_GPUCAPS__DISABLE_AUX_MODE_DETECT                         0x08
-#define SYS_INFO_GPUCAPS__ENABEL_DFS_BYPASS                               0x10
+#define SYS_INFO_GPUCAPS__ENABLE_DFS_BYPASS                               0x10
 
 /**********************************************************************************************************************
   ATOM_INTEGRATED_SYSTEM_INFO_V1_7 Description
diff --git a/drivers/gpu/drm/radeon/kv_dpm.c b/drivers/gpu/drm/radeon/kv_dpm.c
index 55dbf450b..4aa050385 100644
--- a/drivers/gpu/drm/radeon/kv_dpm.c
+++ b/drivers/gpu/drm/radeon/kv_dpm.c
@@ -2329,7 +2329,7 @@ static int kv_parse_sys_info_table(struct radeon_device *rdev)
 				le32_to_cpu(igp_info->info_8.ulNbpStateNClkFreq[i]);
 		}
 		if (le32_to_cpu(igp_info->info_8.ulGPUCapInfo) &
-		    SYS_INFO_GPUCAPS__ENABEL_DFS_BYPASS)
+		    SYS_INFO_GPUCAPS__ENABLE_DFS_BYPASS)
 			pi->caps_enable_dfs_bypass = true;
 
 		sumo_construct_sclk_voltage_mapping_table(rdev,
-- 
2.39.5

