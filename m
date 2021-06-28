Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DBBE83B5CC0
	for <lists+dri-devel@lfdr.de>; Mon, 28 Jun 2021 12:53:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D389C88E14;
	Mon, 28 Jun 2021 10:53:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [IPv6:2a00:1450:4864:20::62d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 414BD89356;
 Mon, 28 Jun 2021 10:53:52 +0000 (UTC)
Received: by mail-ej1-x62d.google.com with SMTP id gn32so29270738ejc.2;
 Mon, 28 Jun 2021 03:53:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=3Svg4KufCMlleknRn+roGXHhdXYCmQgMOGxfVQBcqsk=;
 b=FdL9PinA+EMwomx1qeVTKbZghLZHrs004PW1HUN5/75/45TLyQsgRTM8M3xT8nqRx9
 5VUpD3UPcdNyMzuEWObp0MYmfE6CcCqhSmLc50yBl83OTDK196HO66oBWo6QO6rC7cQi
 vD4E99b4Gb0E5WErLT3gzbk+wVl2FG2PJSofy9+8anJYf60Tf33Yd+GZwI1c2J6ChsCK
 Bm04ntyc4mOVa8uPH0Ak40YgLOuU8gqvwQGKt1twAmuflMMhAq3eFvv883tkfUwLbZfT
 Pw+DF340mfgx5kwuCVAxFp6kVbczCfRL5xCQXfa/TMgmNOs4u6+IBvHdtmp94CguXaTU
 JsLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=3Svg4KufCMlleknRn+roGXHhdXYCmQgMOGxfVQBcqsk=;
 b=ljk3nplrVfZMo21vj1ZVV4nqnPJ1+XkSL/3gGzNFiNOSOlk3NCqFJXP3bQ6tHlqRrR
 3ZjWWwPW9zTCj3mCE0cAWBzITdTUD10zIPRhyO09hqXDY2ZKathxTrgqeIkGbaoVFnqM
 /rruQX7xLHK9m23uUR98exy6rxeBqGrtc6APNFEIYG4D8/T8osBGu9gmUM3QtY/UJKVi
 qs6og7aQl9rcengw8PNpSMyZ0BaxKsitHfT15L8yjIf3IloKqsrzjviOamR1c8jOIWcf
 6ck+M2EPO/nNd9eY+4aAFlNBJNhjSSzyTcQ3p6XGbFnkk9QGCSwQJ08NbJM58EziiRkM
 BFZw==
X-Gm-Message-State: AOAM532MXW0MCynOJjQlskDV3USrKPBoUT5mH3UcN/T2HCEBtUmey139
 qTCe2P25mpUwHaEgaR85j3KlTRtLfy15lA==
X-Google-Smtp-Source: ABdhPJykEhM1KoD/Xx2epu5bd851AuS4I3TCanGsKJu1PbQUdIBjbiRWxevFAFxXbGLT3Dm0Ep/wew==
X-Received: by 2002:a17:906:c108:: with SMTP id
 do8mr23964506ejc.74.1624877630716; 
 Mon, 28 Jun 2021 03:53:50 -0700 (PDT)
Received: from felia.fritz.box ([2001:16b8:2dc2:cc00:2831:3317:971d:3f75])
 by smtp.gmail.com with ESMTPSA id o9sm4668875edc.91.2021.06.28.03.53.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Jun 2021 03:53:50 -0700 (PDT)
From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
To: John Clements <john.clements@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>
Subject: [PATCH] drm/amdgpu: rectify line endings in umc v8_7_0 IP headers
Date: Mon, 28 Jun 2021 12:53:34 +0200
Message-Id: <20210628105334.27559-1-lukas.bulwahn@gmail.com>
X-Mailer: git-send-email 2.17.1
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
Cc: Dwaipayan Ray <dwaipayanray1@gmail.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 Lukas Bulwahn <lukas.bulwahn@gmail.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Hawking Zhang <Hawking.Zhang@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Commit 6b36fa6143f6 ("drm/amdgpu: add umc v8_7_0 IP headers") adds the new
file ./drivers/gpu/drm/amd/include/asic_reg/umc/umc_8_7_0_sh_mask.h with
DOS line endings, which is very uncommon for the kernel repository.

Rectify the line endings in this file with dos2unix.

Identified by a checkpatch evaluation on the whole kernel repository and
spot-checking for really unexpected checkpatch rule violations.

Reported-by: Dwaipayan Ray <dwaipayanray1@gmail.com>
Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
---
 .../include/asic_reg/umc/umc_8_7_0_sh_mask.h  | 158 +++++++++---------
 1 file changed, 79 insertions(+), 79 deletions(-)

diff --git a/drivers/gpu/drm/amd/include/asic_reg/umc/umc_8_7_0_sh_mask.h b/drivers/gpu/drm/amd/include/asic_reg/umc/umc_8_7_0_sh_mask.h
index 4c5097fa0c09..d5ef91d3c391 100644
--- a/drivers/gpu/drm/amd/include/asic_reg/umc/umc_8_7_0_sh_mask.h
+++ b/drivers/gpu/drm/amd/include/asic_reg/umc/umc_8_7_0_sh_mask.h
@@ -1,79 +1,79 @@
-#ifndef _umc_8_7_0_SH_MASK_HEADER
-#define _umc_8_7_0_SH_MASK_HEADER
-
-//UMCCH0_0_GeccErrCntSel
-#define UMCCH0_0_GeccErrCntSel__GeccErrCntCsSel__SHIFT                                                        0x0
-#define UMCCH0_0_GeccErrCntSel__GeccErrInt__SHIFT                                                             0xc
-#define UMCCH0_0_GeccErrCntSel__GeccErrCntEn__SHIFT                                                           0xf
-#define UMCCH0_0_GeccErrCntSel__PoisonCntEn__SHIFT                                                            0x10
-#define UMCCH0_0_GeccErrCntSel__GeccErrCntCsSel_MASK                                                          0x0000000FL
-#define UMCCH0_0_GeccErrCntSel__GeccErrInt_MASK                                                               0x00003000L
-#define UMCCH0_0_GeccErrCntSel__GeccErrCntEn_MASK                                                             0x00008000L
-#define UMCCH0_0_GeccErrCntSel__PoisonCntEn_MASK                                                              0x00030000L
-//UMCCH0_0_GeccErrCnt
-#define UMCCH0_0_GeccErrCnt__GeccErrCnt__SHIFT                                                                0x0
-#define UMCCH0_0_GeccErrCnt__GeccUnCorrErrCnt__SHIFT                                                          0x10
-#define UMCCH0_0_GeccErrCnt__GeccErrCnt_MASK                                                                  0x0000FFFFL
-#define UMCCH0_0_GeccErrCnt__GeccUnCorrErrCnt_MASK                                                            0xFFFF0000L
-//MCA_UMC_UMC0_MCUMC_STATUST0
-#define MCA_UMC_UMC0_MCUMC_STATUST0__ErrorCode__SHIFT                                                         0x0
-#define MCA_UMC_UMC0_MCUMC_STATUST0__ErrorCodeExt__SHIFT                                                      0x10
-#define MCA_UMC_UMC0_MCUMC_STATUST0__RESERV22__SHIFT                                                          0x16
-#define MCA_UMC_UMC0_MCUMC_STATUST0__AddrLsb__SHIFT                                                           0x18
-#define MCA_UMC_UMC0_MCUMC_STATUST0__RESERV30__SHIFT                                                          0x1e
-#define MCA_UMC_UMC0_MCUMC_STATUST0__ErrCoreId__SHIFT                                                         0x20
-#define MCA_UMC_UMC0_MCUMC_STATUST0__RESERV38__SHIFT                                                          0x26
-#define MCA_UMC_UMC0_MCUMC_STATUST0__Scrub__SHIFT                                                             0x28
-#define MCA_UMC_UMC0_MCUMC_STATUST0__RESERV41__SHIFT                                                          0x29
-#define MCA_UMC_UMC0_MCUMC_STATUST0__Poison__SHIFT                                                            0x2b
-#define MCA_UMC_UMC0_MCUMC_STATUST0__Deferred__SHIFT                                                          0x2c
-#define MCA_UMC_UMC0_MCUMC_STATUST0__UECC__SHIFT                                                              0x2d
-#define MCA_UMC_UMC0_MCUMC_STATUST0__CECC__SHIFT                                                              0x2e
-#define MCA_UMC_UMC0_MCUMC_STATUST0__RESERV47__SHIFT                                                          0x2f
-#define MCA_UMC_UMC0_MCUMC_STATUST0__Transparent__SHIFT                                                       0x34
-#define MCA_UMC_UMC0_MCUMC_STATUST0__SyndV__SHIFT                                                             0x35
-#define MCA_UMC_UMC0_MCUMC_STATUST0__RESERV54__SHIFT                                                          0x36
-#define MCA_UMC_UMC0_MCUMC_STATUST0__TCC__SHIFT                                                               0x37
-#define MCA_UMC_UMC0_MCUMC_STATUST0__ErrCoreIdVal__SHIFT                                                      0x38
-#define MCA_UMC_UMC0_MCUMC_STATUST0__PCC__SHIFT                                                               0x39
-#define MCA_UMC_UMC0_MCUMC_STATUST0__AddrV__SHIFT                                                             0x3a
-#define MCA_UMC_UMC0_MCUMC_STATUST0__MiscV__SHIFT                                                             0x3b
-#define MCA_UMC_UMC0_MCUMC_STATUST0__En__SHIFT                                                                0x3c
-#define MCA_UMC_UMC0_MCUMC_STATUST0__UC__SHIFT                                                                0x3d
-#define MCA_UMC_UMC0_MCUMC_STATUST0__Overflow__SHIFT                                                          0x3e
-#define MCA_UMC_UMC0_MCUMC_STATUST0__Val__SHIFT                                                               0x3f
-#define MCA_UMC_UMC0_MCUMC_STATUST0__ErrorCode_MASK                                                           0x000000000000FFFFL
-#define MCA_UMC_UMC0_MCUMC_STATUST0__ErrorCodeExt_MASK                                                        0x00000000003F0000L
-#define MCA_UMC_UMC0_MCUMC_STATUST0__RESERV22_MASK                                                            0x0000000000C00000L
-#define MCA_UMC_UMC0_MCUMC_STATUST0__AddrLsb_MASK                                                             0x000000003F000000L
-#define MCA_UMC_UMC0_MCUMC_STATUST0__RESERV30_MASK                                                            0x00000000C0000000L
-#define MCA_UMC_UMC0_MCUMC_STATUST0__ErrCoreId_MASK                                                           0x0000003F00000000L
-#define MCA_UMC_UMC0_MCUMC_STATUST0__RESERV38_MASK                                                            0x000000C000000000L
-#define MCA_UMC_UMC0_MCUMC_STATUST0__Scrub_MASK                                                               0x0000010000000000L
-#define MCA_UMC_UMC0_MCUMC_STATUST0__RESERV41_MASK                                                            0x0000060000000000L
-#define MCA_UMC_UMC0_MCUMC_STATUST0__Poison_MASK                                                              0x0000080000000000L
-#define MCA_UMC_UMC0_MCUMC_STATUST0__Deferred_MASK                                                            0x0000100000000000L
-#define MCA_UMC_UMC0_MCUMC_STATUST0__UECC_MASK                                                                0x0000200000000000L
-#define MCA_UMC_UMC0_MCUMC_STATUST0__CECC_MASK                                                                0x0000400000000000L
-#define MCA_UMC_UMC0_MCUMC_STATUST0__RESERV47_MASK                                                            0x000F800000000000L
-#define MCA_UMC_UMC0_MCUMC_STATUST0__Transparent_MASK                                                         0x0010000000000000L
-#define MCA_UMC_UMC0_MCUMC_STATUST0__SyndV_MASK                                                               0x0020000000000000L
-#define MCA_UMC_UMC0_MCUMC_STATUST0__RESERV54_MASK                                                            0x0040000000000000L
-#define MCA_UMC_UMC0_MCUMC_STATUST0__TCC_MASK                                                                 0x0080000000000000L
-#define MCA_UMC_UMC0_MCUMC_STATUST0__ErrCoreIdVal_MASK                                                        0x0100000000000000L
-#define MCA_UMC_UMC0_MCUMC_STATUST0__PCC_MASK                                                                 0x0200000000000000L
-#define MCA_UMC_UMC0_MCUMC_STATUST0__AddrV_MASK                                                               0x0400000000000000L
-#define MCA_UMC_UMC0_MCUMC_STATUST0__MiscV_MASK                                                               0x0800000000000000L
-#define MCA_UMC_UMC0_MCUMC_STATUST0__En_MASK                                                                  0x1000000000000000L
-#define MCA_UMC_UMC0_MCUMC_STATUST0__UC_MASK                                                                  0x2000000000000000L
-#define MCA_UMC_UMC0_MCUMC_STATUST0__Overflow_MASK                                                            0x4000000000000000L
-#define MCA_UMC_UMC0_MCUMC_STATUST0__Val_MASK                                                                 0x8000000000000000L
-//MCA_UMC_UMC0_MCUMC_ADDRT0
-#define MCA_UMC_UMC0_MCUMC_ADDRT0__ErrorAddr__SHIFT                                                           0x0
-#define MCA_UMC_UMC0_MCUMC_ADDRT0__LSB__SHIFT                                                                 0x38
-#define MCA_UMC_UMC0_MCUMC_ADDRT0__Reserved__SHIFT                                                            0x3e
-#define MCA_UMC_UMC0_MCUMC_ADDRT0__ErrorAddr_MASK                                                             0x00FFFFFFFFFFFFFFL
-#define MCA_UMC_UMC0_MCUMC_ADDRT0__LSB_MASK                                                                   0x3F00000000000000L
-#define MCA_UMC_UMC0_MCUMC_ADDRT0__Reserved_MASK                                                              0xC000000000000000L
-
-#endif
+#ifndef _umc_8_7_0_SH_MASK_HEADER
+#define _umc_8_7_0_SH_MASK_HEADER
+
+//UMCCH0_0_GeccErrCntSel
+#define UMCCH0_0_GeccErrCntSel__GeccErrCntCsSel__SHIFT                                                        0x0
+#define UMCCH0_0_GeccErrCntSel__GeccErrInt__SHIFT                                                             0xc
+#define UMCCH0_0_GeccErrCntSel__GeccErrCntEn__SHIFT                                                           0xf
+#define UMCCH0_0_GeccErrCntSel__PoisonCntEn__SHIFT                                                            0x10
+#define UMCCH0_0_GeccErrCntSel__GeccErrCntCsSel_MASK                                                          0x0000000FL
+#define UMCCH0_0_GeccErrCntSel__GeccErrInt_MASK                                                               0x00003000L
+#define UMCCH0_0_GeccErrCntSel__GeccErrCntEn_MASK                                                             0x00008000L
+#define UMCCH0_0_GeccErrCntSel__PoisonCntEn_MASK                                                              0x00030000L
+//UMCCH0_0_GeccErrCnt
+#define UMCCH0_0_GeccErrCnt__GeccErrCnt__SHIFT                                                                0x0
+#define UMCCH0_0_GeccErrCnt__GeccUnCorrErrCnt__SHIFT                                                          0x10
+#define UMCCH0_0_GeccErrCnt__GeccErrCnt_MASK                                                                  0x0000FFFFL
+#define UMCCH0_0_GeccErrCnt__GeccUnCorrErrCnt_MASK                                                            0xFFFF0000L
+//MCA_UMC_UMC0_MCUMC_STATUST0
+#define MCA_UMC_UMC0_MCUMC_STATUST0__ErrorCode__SHIFT                                                         0x0
+#define MCA_UMC_UMC0_MCUMC_STATUST0__ErrorCodeExt__SHIFT                                                      0x10
+#define MCA_UMC_UMC0_MCUMC_STATUST0__RESERV22__SHIFT                                                          0x16
+#define MCA_UMC_UMC0_MCUMC_STATUST0__AddrLsb__SHIFT                                                           0x18
+#define MCA_UMC_UMC0_MCUMC_STATUST0__RESERV30__SHIFT                                                          0x1e
+#define MCA_UMC_UMC0_MCUMC_STATUST0__ErrCoreId__SHIFT                                                         0x20
+#define MCA_UMC_UMC0_MCUMC_STATUST0__RESERV38__SHIFT                                                          0x26
+#define MCA_UMC_UMC0_MCUMC_STATUST0__Scrub__SHIFT                                                             0x28
+#define MCA_UMC_UMC0_MCUMC_STATUST0__RESERV41__SHIFT                                                          0x29
+#define MCA_UMC_UMC0_MCUMC_STATUST0__Poison__SHIFT                                                            0x2b
+#define MCA_UMC_UMC0_MCUMC_STATUST0__Deferred__SHIFT                                                          0x2c
+#define MCA_UMC_UMC0_MCUMC_STATUST0__UECC__SHIFT                                                              0x2d
+#define MCA_UMC_UMC0_MCUMC_STATUST0__CECC__SHIFT                                                              0x2e
+#define MCA_UMC_UMC0_MCUMC_STATUST0__RESERV47__SHIFT                                                          0x2f
+#define MCA_UMC_UMC0_MCUMC_STATUST0__Transparent__SHIFT                                                       0x34
+#define MCA_UMC_UMC0_MCUMC_STATUST0__SyndV__SHIFT                                                             0x35
+#define MCA_UMC_UMC0_MCUMC_STATUST0__RESERV54__SHIFT                                                          0x36
+#define MCA_UMC_UMC0_MCUMC_STATUST0__TCC__SHIFT                                                               0x37
+#define MCA_UMC_UMC0_MCUMC_STATUST0__ErrCoreIdVal__SHIFT                                                      0x38
+#define MCA_UMC_UMC0_MCUMC_STATUST0__PCC__SHIFT                                                               0x39
+#define MCA_UMC_UMC0_MCUMC_STATUST0__AddrV__SHIFT                                                             0x3a
+#define MCA_UMC_UMC0_MCUMC_STATUST0__MiscV__SHIFT                                                             0x3b
+#define MCA_UMC_UMC0_MCUMC_STATUST0__En__SHIFT                                                                0x3c
+#define MCA_UMC_UMC0_MCUMC_STATUST0__UC__SHIFT                                                                0x3d
+#define MCA_UMC_UMC0_MCUMC_STATUST0__Overflow__SHIFT                                                          0x3e
+#define MCA_UMC_UMC0_MCUMC_STATUST0__Val__SHIFT                                                               0x3f
+#define MCA_UMC_UMC0_MCUMC_STATUST0__ErrorCode_MASK                                                           0x000000000000FFFFL
+#define MCA_UMC_UMC0_MCUMC_STATUST0__ErrorCodeExt_MASK                                                        0x00000000003F0000L
+#define MCA_UMC_UMC0_MCUMC_STATUST0__RESERV22_MASK                                                            0x0000000000C00000L
+#define MCA_UMC_UMC0_MCUMC_STATUST0__AddrLsb_MASK                                                             0x000000003F000000L
+#define MCA_UMC_UMC0_MCUMC_STATUST0__RESERV30_MASK                                                            0x00000000C0000000L
+#define MCA_UMC_UMC0_MCUMC_STATUST0__ErrCoreId_MASK                                                           0x0000003F00000000L
+#define MCA_UMC_UMC0_MCUMC_STATUST0__RESERV38_MASK                                                            0x000000C000000000L
+#define MCA_UMC_UMC0_MCUMC_STATUST0__Scrub_MASK                                                               0x0000010000000000L
+#define MCA_UMC_UMC0_MCUMC_STATUST0__RESERV41_MASK                                                            0x0000060000000000L
+#define MCA_UMC_UMC0_MCUMC_STATUST0__Poison_MASK                                                              0x0000080000000000L
+#define MCA_UMC_UMC0_MCUMC_STATUST0__Deferred_MASK                                                            0x0000100000000000L
+#define MCA_UMC_UMC0_MCUMC_STATUST0__UECC_MASK                                                                0x0000200000000000L
+#define MCA_UMC_UMC0_MCUMC_STATUST0__CECC_MASK                                                                0x0000400000000000L
+#define MCA_UMC_UMC0_MCUMC_STATUST0__RESERV47_MASK                                                            0x000F800000000000L
+#define MCA_UMC_UMC0_MCUMC_STATUST0__Transparent_MASK                                                         0x0010000000000000L
+#define MCA_UMC_UMC0_MCUMC_STATUST0__SyndV_MASK                                                               0x0020000000000000L
+#define MCA_UMC_UMC0_MCUMC_STATUST0__RESERV54_MASK                                                            0x0040000000000000L
+#define MCA_UMC_UMC0_MCUMC_STATUST0__TCC_MASK                                                                 0x0080000000000000L
+#define MCA_UMC_UMC0_MCUMC_STATUST0__ErrCoreIdVal_MASK                                                        0x0100000000000000L
+#define MCA_UMC_UMC0_MCUMC_STATUST0__PCC_MASK                                                                 0x0200000000000000L
+#define MCA_UMC_UMC0_MCUMC_STATUST0__AddrV_MASK                                                               0x0400000000000000L
+#define MCA_UMC_UMC0_MCUMC_STATUST0__MiscV_MASK                                                               0x0800000000000000L
+#define MCA_UMC_UMC0_MCUMC_STATUST0__En_MASK                                                                  0x1000000000000000L
+#define MCA_UMC_UMC0_MCUMC_STATUST0__UC_MASK                                                                  0x2000000000000000L
+#define MCA_UMC_UMC0_MCUMC_STATUST0__Overflow_MASK                                                            0x4000000000000000L
+#define MCA_UMC_UMC0_MCUMC_STATUST0__Val_MASK                                                                 0x8000000000000000L
+//MCA_UMC_UMC0_MCUMC_ADDRT0
+#define MCA_UMC_UMC0_MCUMC_ADDRT0__ErrorAddr__SHIFT                                                           0x0
+#define MCA_UMC_UMC0_MCUMC_ADDRT0__LSB__SHIFT                                                                 0x38
+#define MCA_UMC_UMC0_MCUMC_ADDRT0__Reserved__SHIFT                                                            0x3e
+#define MCA_UMC_UMC0_MCUMC_ADDRT0__ErrorAddr_MASK                                                             0x00FFFFFFFFFFFFFFL
+#define MCA_UMC_UMC0_MCUMC_ADDRT0__LSB_MASK                                                                   0x3F00000000000000L
+#define MCA_UMC_UMC0_MCUMC_ADDRT0__Reserved_MASK                                                              0xC000000000000000L
+
+#endif
-- 
2.17.1

