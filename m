Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D977BA2D156
	for <lists+dri-devel@lfdr.de>; Sat,  8 Feb 2025 00:13:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E5BB510EA37;
	Fri,  7 Feb 2025 23:13:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=usp.br header.i=@usp.br header.b="s4yMxGTf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com
 [209.85.214.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 13C6910E334
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Feb 2025 23:12:28 +0000 (UTC)
Received: by mail-pl1-f170.google.com with SMTP id
 d9443c01a7336-21f61b01630so12179695ad.1
 for <dri-devel@lists.freedesktop.org>; Fri, 07 Feb 2025 15:12:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=usp.br; s=usp-google; t=1738969947; x=1739574747; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=7itLWNOOesTKf4Ww18TYb8sd6LtUmZCMFxKOUAFYSuE=;
 b=s4yMxGTfceXlAxZpGkLo5SX82lghnaZn41SG3FjTV0yjq7r547f4AjNeKBDeDAaulP
 o78eZKZ7oXfj85jbZMbXsfen7o/hyEdwy4z7nT0RTan5atnfFKh+9xyk9mdPYBiqZWxg
 LF7yVWI5EzENB8/kKuoanMLin23MyFHZZ/mOFCOKnfZ2NEyJpYBRh/nk/buahVDW5Sc1
 ZFZgDFppLdQHxYOZRBbilqlskTvy1FR9NotejNICHZQlWNAsP/15K3A1kJBQQaC6lZwN
 rE2J4Q3uzrH+9myf+KNAhMdrl3zSzjmvlVVlr5n6tU2PSqFLQaP1GoX1w+hdE+wR571c
 +A1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738969947; x=1739574747;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=7itLWNOOesTKf4Ww18TYb8sd6LtUmZCMFxKOUAFYSuE=;
 b=pZWeD9HIqMJ9c4PZ90YRq1qjimIc8/06mstLoESynvmEJE82yAWmKaD0P00leRbwWZ
 ew0b1fikOz4FvnFcKkPrmdpGOGl5SiKFGKCTy7AdJRcgcn97wgJ/UAY8JlqpuiNjnL3n
 HGmjT1fDF1s0O3QGibd1B/NmKvunfT6zktkRR0alXIBwhdYRwGDK2qW7afjOgg3+dsbO
 CKE2sVSc8DfC3k3qbHZ7EB1Wdkq+rnGYzzeFwFYYfvtK/JmK6E6SYRIRw04fOIXH4tes
 dsiKZ01PvsR6DQp+5wCSHFuRiJJMqj+/y7GFsTSgp2kaHiyx43QnmPGJuN66d5em5t+O
 h/uw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVG86lFmadPloWlQXle9Nmw/OlE4btSwzxM/VilKwC7gka1XlwhbGOIRBmhQAVXfBWEemUMmDxqQR4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzGCGKVXRffC11V69u+5eZrIjHproRW30swQDlK72SsCdJtjlBk
 IVyeWaMTBKd85HaNVEspZEcgT5m4lSsS3fzhMQ9YMuJ2Fa4SIkRHuSIcW1kyu1A=
X-Gm-Gg: ASbGncu1MCA37+X72UzNN4Hst2JgiEMFqnC9Z743t0W/cLFXpg0fkGt0IvO9uPkhTZA
 LvAiqi2StDSdv5Usd9BVaSqv6zUxtwVxKIhBzDduks6IsKKex0pXeYS+n2bwe695+Tk5cYF+0Gh
 9g896WTnMehdo6CXUX3KREFdVT5zIJx5Id/x64wFWrR/4WV+A7jWQzYJYJLAh7cJwYi5x3jJsfG
 jTLzlzh6W+rKYyLY6KILdH26yKivw2SdDHsPdAqeGudHUuzuwTPkf1e/AxcP9WbkwWevBZO07ne
 ocYhbfWRKJd1d/VwqJ5JipvClY7d
X-Google-Smtp-Source: AGHT+IFHRU9uWmP6GQODLfN1w0Kek9N5gPSw+acv4FAkcUDEtbC6b4WchAuYQieIdPyqDVhDZefdNw==
X-Received: by 2002:a05:6a20:ad0c:b0:1e1:a48f:1212 with SMTP id
 adf61e73a8af0-1ee0523b86bmr8790413637.4.1738969947491; 
 Fri, 07 Feb 2025 15:12:27 -0800 (PST)
Received: from luan-B550M-AORUS-ELITE.. ([191.185.78.175])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-73048a9d378sm3545649b3a.26.2025.02.07.15.12.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Feb 2025 15:12:27 -0800 (PST)
From: Luan Icaro Pinto Arcanjo <luanicaro@usp.br>
To: harry.wentland@amd.com, sunpeng.li@amd.com, Rodrigo.Siqueira@amd.com,
 alexander.deucher@amd.com, christian.koenig@amd.com, Xinhui.Pan@amd.com,
 airlied@gmail.com, daniel@ffwll.ch
Cc: Luan Arcanjo <luanicaro@usp.br>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Subject: [PATCH v3] drm/amd/display/dc: Refactor remove duplications on
 command_table files
Date: Fri,  7 Feb 2025 20:12:09 -0300
Message-ID: <20250207231219.10807-1-luanicaro@usp.br>
X-Mailer: git-send-email 2.43.0
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

From: Luan Arcanjo <luanicaro@usp.br>

All dce command_table_helper's shares a copy-pasted collection
of copy-pasted functions, which are: phy_id_to_atom,
clock_source_id_to_atom_phy_clk_src_id, and engine_bp_to_atom.

This patch removes the multiple copy-pasted by creating a
common command table and make the command_table_helper's calls
the functions implemented by the common instead.

The changes were not tested on actual hardware. I am only able
to verify that the changes keep the code compileable and do my
best to to look repeatedly if I am not actually changing any code.

This is the version 2 of the PATCH, fixed comments about
licence in the new files and the matches From email to
Signed-off-by email.

Signed-off-by: Luan Icaro Pinto Arcanjo <luanicaro@usp.br>
---
 drivers/gpu/drm/amd/display/dc/bios/Makefile  |   6 +
 .../bios/dce110/command_table_helper_dce110.c | 104 +----------------
 .../dce112/command_table_helper2_dce112.c     | 104 +----------------
 .../bios/dce112/command_table_helper_dce112.c | 104 +----------------
 .../bios/dce60/command_table_helper_dce60.c   | 106 +----------------
 .../bios/dce80/command_table_helper_dce80.c   | 106 +----------------
 .../command_table_helper_dce_common.c         | 110 ++++++++++++++++++
 .../command_table_helper_dce_common.h         |  14 +++
 8 files changed, 137 insertions(+), 517 deletions(-)
 create mode 100644 drivers/gpu/drm/amd/display/dc/bios/dce_common/command_table_helper_dce_common.c
 create mode 100644 drivers/gpu/drm/amd/display/dc/bios/dce_common/command_table_helper_dce_common.h

diff --git a/drivers/gpu/drm/amd/display/dc/bios/Makefile b/drivers/gpu/drm/amd/display/dc/bios/Makefile
index ed6b5e9763f6..0d2f7ca1d0c2 100644
--- a/drivers/gpu/drm/amd/display/dc/bios/Makefile
+++ b/drivers/gpu/drm/amd/display/dc/bios/Makefile
@@ -27,6 +27,7 @@ BIOS = bios_parser.o bios_parser_interface.o  bios_parser_helper.o command_table
 
 BIOS += command_table2.o command_table_helper2.o bios_parser2.o
 
+
 AMD_DAL_BIOS = $(addprefix $(AMDDALPATH)/dc/bios/,$(BIOS))
 
 AMD_DISPLAY_FILES += $(AMD_DAL_BIOS)
@@ -55,3 +56,8 @@ AMD_DISPLAY_FILES += $(AMDDALPATH)/dc/bios/dce110/command_table_helper_dce110.o
 AMD_DISPLAY_FILES += $(AMDDALPATH)/dc/bios/dce112/command_table_helper_dce112.o
 
 AMD_DISPLAY_FILES += $(AMDDALPATH)/dc/bios/dce112/command_table_helper2_dce112.o
+
+###############################################################################
+# DCE COMMON
+###############################################################################
+AMD_DISPLAY_FILES += $(AMDDALPATH)/dc/bios/dce_common/command_table_helper_dce_common.o
diff --git a/drivers/gpu/drm/amd/display/dc/bios/dce110/command_table_helper_dce110.c b/drivers/gpu/drm/amd/display/dc/bios/dce110/command_table_helper_dce110.c
index 11bf247bb180..6f8fec224b88 100644
--- a/drivers/gpu/drm/amd/display/dc/bios/dce110/command_table_helper_dce110.c
+++ b/drivers/gpu/drm/amd/display/dc/bios/dce110/command_table_helper_dce110.c
@@ -31,38 +31,7 @@
 
 #include "../command_table_helper.h"
 
-static uint8_t phy_id_to_atom(enum transmitter t)
-{
-	uint8_t atom_phy_id;
-
-	switch (t) {
-	case TRANSMITTER_UNIPHY_A:
-		atom_phy_id = ATOM_PHY_ID_UNIPHYA;
-		break;
-	case TRANSMITTER_UNIPHY_B:
-		atom_phy_id = ATOM_PHY_ID_UNIPHYB;
-		break;
-	case TRANSMITTER_UNIPHY_C:
-		atom_phy_id = ATOM_PHY_ID_UNIPHYC;
-		break;
-	case TRANSMITTER_UNIPHY_D:
-		atom_phy_id = ATOM_PHY_ID_UNIPHYD;
-		break;
-	case TRANSMITTER_UNIPHY_E:
-		atom_phy_id = ATOM_PHY_ID_UNIPHYE;
-		break;
-	case TRANSMITTER_UNIPHY_F:
-		atom_phy_id = ATOM_PHY_ID_UNIPHYF;
-		break;
-	case TRANSMITTER_UNIPHY_G:
-		atom_phy_id = ATOM_PHY_ID_UNIPHYG;
-		break;
-	default:
-		atom_phy_id = ATOM_PHY_ID_UNIPHYA;
-		break;
-	}
-	return atom_phy_id;
-}
+#include "../dce_common/command_table_helper_dce_common.h"
 
 static uint8_t signal_type_to_atom_dig_mode(enum signal_type s)
 {
@@ -94,32 +63,6 @@ static uint8_t signal_type_to_atom_dig_mode(enum signal_type s)
 	return atom_dig_mode;
 }
 
-static uint8_t clock_source_id_to_atom_phy_clk_src_id(
-		enum clock_source_id id)
-{
-	uint8_t atom_phy_clk_src_id = 0;
-
-	switch (id) {
-	case CLOCK_SOURCE_ID_PLL0:
-		atom_phy_clk_src_id = ATOM_TRANSMITTER_CONFIG_V5_P0PLL;
-		break;
-	case CLOCK_SOURCE_ID_PLL1:
-		atom_phy_clk_src_id = ATOM_TRANSMITTER_CONFIG_V5_P1PLL;
-		break;
-	case CLOCK_SOURCE_ID_PLL2:
-		atom_phy_clk_src_id = ATOM_TRANSMITTER_CONFIG_V5_P2PLL;
-		break;
-	case CLOCK_SOURCE_ID_EXTERNAL:
-		atom_phy_clk_src_id = ATOM_TRANSMITTER_CONFIG_V5_REFCLK_SRC_EXT;
-		break;
-	default:
-		atom_phy_clk_src_id = ATOM_TRANSMITTER_CONFIG_V5_P1PLL;
-		break;
-	}
-
-	return atom_phy_clk_src_id >> 2;
-}
-
 static uint8_t hpd_sel_to_atom(enum hpd_source_id id)
 {
 	uint8_t atom_hpd_sel = 0;
@@ -207,51 +150,6 @@ static bool clock_source_id_to_atom(
 	return result;
 }
 
-static bool engine_bp_to_atom(enum engine_id id, uint32_t *atom_engine_id)
-{
-	bool result = false;
-
-	if (atom_engine_id != NULL)
-		switch (id) {
-		case ENGINE_ID_DIGA:
-			*atom_engine_id = ASIC_INT_DIG1_ENCODER_ID;
-			result = true;
-			break;
-		case ENGINE_ID_DIGB:
-			*atom_engine_id = ASIC_INT_DIG2_ENCODER_ID;
-			result = true;
-			break;
-		case ENGINE_ID_DIGC:
-			*atom_engine_id = ASIC_INT_DIG3_ENCODER_ID;
-			result = true;
-			break;
-		case ENGINE_ID_DIGD:
-			*atom_engine_id = ASIC_INT_DIG4_ENCODER_ID;
-			result = true;
-			break;
-		case ENGINE_ID_DIGE:
-			*atom_engine_id = ASIC_INT_DIG5_ENCODER_ID;
-			result = true;
-			break;
-		case ENGINE_ID_DIGF:
-			*atom_engine_id = ASIC_INT_DIG6_ENCODER_ID;
-			result = true;
-			break;
-		case ENGINE_ID_DIGG:
-			*atom_engine_id = ASIC_INT_DIG7_ENCODER_ID;
-			result = true;
-			break;
-		case ENGINE_ID_DACA:
-			*atom_engine_id = ASIC_INT_DAC1_ENCODER_ID;
-			result = true;
-			break;
-		default:
-			break;
-		}
-
-	return result;
-}
-
 static uint8_t encoder_action_to_atom(enum bp_encoder_control_action action)
 {
 	uint8_t atom_action = 0;
diff --git a/drivers/gpu/drm/amd/display/dc/bios/dce112/command_table_helper2_dce112.c b/drivers/gpu/drm/amd/display/dc/bios/dce112/command_table_helper2_dce112.c
index 755b6e33140a..3392277ac3b6 100644
--- a/drivers/gpu/drm/amd/display/dc/bios/dce112/command_table_helper2_dce112.c
+++ b/drivers/gpu/drm/amd/display/dc/bios/dce112/command_table_helper2_dce112.c
@@ -31,38 +31,7 @@
 
 #include "../command_table_helper2.h"
 
-static uint8_t phy_id_to_atom(enum transmitter t)
-{
-	uint8_t atom_phy_id;
-
-	switch (t) {
-	case TRANSMITTER_UNIPHY_A:
-		atom_phy_id = ATOM_PHY_ID_UNIPHYA;
-		break;
-	case TRANSMITTER_UNIPHY_B:
-		atom_phy_id = ATOM_PHY_ID_UNIPHYB;
-		break;
-	case TRANSMITTER_UNIPHY_C:
-		atom_phy_id = ATOM_PHY_ID_UNIPHYC;
-		break;
-	case TRANSMITTER_UNIPHY_D:
-		atom_phy_id = ATOM_PHY_ID_UNIPHYD;
-		break;
-	case TRANSMITTER_UNIPHY_E:
-		atom_phy_id = ATOM_PHY_ID_UNIPHYE;
-		break;
-	case TRANSMITTER_UNIPHY_F:
-		atom_phy_id = ATOM_PHY_ID_UNIPHYF;
-		break;
-	case TRANSMITTER_UNIPHY_G:
-		atom_phy_id = ATOM_PHY_ID_UNIPHYG;
-		break;
-	default:
-		atom_phy_id = ATOM_PHY_ID_UNIPHYA;
-		break;
-	}
-	return atom_phy_id;
-}
+#include "../dce_common/command_table_helper_dce_common.h"
 
 static uint8_t signal_type_to_atom_dig_mode(enum signal_type s)
 {
@@ -91,32 +60,6 @@ static uint8_t signal_type_to_atom_dig_mode(enum signal_type s)
 	return atom_dig_mode;
 }
 
-static uint8_t clock_source_id_to_atom_phy_clk_src_id(
-		enum clock_source_id id)
-{
-	uint8_t atom_phy_clk_src_id = 0;
-
-	switch (id) {
-	case CLOCK_SOURCE_ID_PLL0:
-		atom_phy_clk_src_id = ATOM_TRANSMITTER_CONFIG_V5_P0PLL;
-		break;
-	case CLOCK_SOURCE_ID_PLL1:
-		atom_phy_clk_src_id = ATOM_TRANSMITTER_CONFIG_V5_P1PLL;
-		break;
-	case CLOCK_SOURCE_ID_PLL2:
-		atom_phy_clk_src_id = ATOM_TRANSMITTER_CONFIG_V5_P2PLL;
-		break;
-	case CLOCK_SOURCE_ID_EXTERNAL:
-		atom_phy_clk_src_id = ATOM_TRANSMITTER_CONFIG_V5_REFCLK_SRC_EXT;
-		break;
-	default:
-		atom_phy_clk_src_id = ATOM_TRANSMITTER_CONFIG_V5_P1PLL;
-		break;
-	}
-
-	return atom_phy_clk_src_id >> 2;
-}
-
 static uint8_t hpd_sel_to_atom(enum hpd_source_id id)
 {
 	uint8_t atom_hpd_sel = 0;
@@ -209,51 +152,6 @@ static bool clock_source_id_to_atom(
 	return result;
 }
 
-static bool engine_bp_to_atom(enum engine_id id, uint32_t *atom_engine_id)
-{
-	bool result = false;
-
-	if (atom_engine_id != NULL)
-		switch (id) {
-		case ENGINE_ID_DIGA:
-			*atom_engine_id = ASIC_INT_DIG1_ENCODER_ID;
-			result = true;
-			break;
-		case ENGINE_ID_DIGB:
-			*atom_engine_id = ASIC_INT_DIG2_ENCODER_ID;
-			result = true;
-			break;
-		case ENGINE_ID_DIGC:
-			*atom_engine_id = ASIC_INT_DIG3_ENCODER_ID;
-			result = true;
-			break;
-		case ENGINE_ID_DIGD:
-			*atom_engine_id = ASIC_INT_DIG4_ENCODER_ID;
-			result = true;
-			break;
-		case ENGINE_ID_DIGE:
-			*atom_engine_id = ASIC_INT_DIG5_ENCODER_ID;
-			result = true;
-			break;
-		case ENGINE_ID_DIGF:
-			*atom_engine_id = ASIC_INT_DIG6_ENCODER_ID;
-			result = true;
-			break;
-		case ENGINE_ID_DIGG:
-			*atom_engine_id = ASIC_INT_DIG7_ENCODER_ID;
-			result = true;
-			break;
-		case ENGINE_ID_DACA:
-			*atom_engine_id = ASIC_INT_DAC1_ENCODER_ID;
-			result = true;
-			break;
-		default:
-			break;
-		}
-
-	return result;
-}
-
 static uint8_t encoder_action_to_atom(enum bp_encoder_control_action action)
 {
 	uint8_t atom_action = 0;
diff --git a/drivers/gpu/drm/amd/display/dc/bios/dce112/command_table_helper_dce112.c b/drivers/gpu/drm/amd/display/dc/bios/dce112/command_table_helper_dce112.c
index 06b4f7fa4a50..39b199b388e4 100644
--- a/drivers/gpu/drm/amd/display/dc/bios/dce112/command_table_helper_dce112.c
+++ b/drivers/gpu/drm/amd/display/dc/bios/dce112/command_table_helper_dce112.c
@@ -31,38 +31,7 @@
 
 #include "../command_table_helper.h"
 
-static uint8_t phy_id_to_atom(enum transmitter t)
-{
-	uint8_t atom_phy_id;
-
-	switch (t) {
-	case TRANSMITTER_UNIPHY_A:
-		atom_phy_id = ATOM_PHY_ID_UNIPHYA;
-		break;
-	case TRANSMITTER_UNIPHY_B:
-		atom_phy_id = ATOM_PHY_ID_UNIPHYB;
-		break;
-	case TRANSMITTER_UNIPHY_C:
-		atom_phy_id = ATOM_PHY_ID_UNIPHYC;
-		break;
-	case TRANSMITTER_UNIPHY_D:
-		atom_phy_id = ATOM_PHY_ID_UNIPHYD;
-		break;
-	case TRANSMITTER_UNIPHY_E:
-		atom_phy_id = ATOM_PHY_ID_UNIPHYE;
-		break;
-	case TRANSMITTER_UNIPHY_F:
-		atom_phy_id = ATOM_PHY_ID_UNIPHYF;
-		break;
-	case TRANSMITTER_UNIPHY_G:
-		atom_phy_id = ATOM_PHY_ID_UNIPHYG;
-		break;
-	default:
-		atom_phy_id = ATOM_PHY_ID_UNIPHYA;
-		break;
-	}
-	return atom_phy_id;
-}
+#include "../dce_common/command_table_helper_dce_common.h"
 
 static uint8_t signal_type_to_atom_dig_mode(enum signal_type s)
 {
@@ -91,32 +60,6 @@ static uint8_t signal_type_to_atom_dig_mode(enum signal_type s)
 	return atom_dig_mode;
 }
 
-static uint8_t clock_source_id_to_atom_phy_clk_src_id(
-		enum clock_source_id id)
-{
-	uint8_t atom_phy_clk_src_id = 0;
-
-	switch (id) {
-	case CLOCK_SOURCE_ID_PLL0:
-		atom_phy_clk_src_id = ATOM_TRANSMITTER_CONFIG_V5_P0PLL;
-		break;
-	case CLOCK_SOURCE_ID_PLL1:
-		atom_phy_clk_src_id = ATOM_TRANSMITTER_CONFIG_V5_P1PLL;
-		break;
-	case CLOCK_SOURCE_ID_PLL2:
-		atom_phy_clk_src_id = ATOM_TRANSMITTER_CONFIG_V5_P2PLL;
-		break;
-	case CLOCK_SOURCE_ID_EXTERNAL:
-		atom_phy_clk_src_id = ATOM_TRANSMITTER_CONFIG_V5_REFCLK_SRC_EXT;
-		break;
-	default:
-		atom_phy_clk_src_id = ATOM_TRANSMITTER_CONFIG_V5_P1PLL;
-		break;
-	}
-
-	return atom_phy_clk_src_id >> 2;
-}
-
 static uint8_t hpd_sel_to_atom(enum hpd_source_id id)
 {
 	uint8_t atom_hpd_sel = 0;
@@ -209,51 +152,6 @@ static bool clock_source_id_to_atom(
 	return result;
 }
 
-static bool engine_bp_to_atom(enum engine_id id, uint32_t *atom_engine_id)
-{
-	bool result = false;
-
-	if (atom_engine_id != NULL)
-		switch (id) {
-		case ENGINE_ID_DIGA:
-			*atom_engine_id = ASIC_INT_DIG1_ENCODER_ID;
-			result = true;
-			break;
-		case ENGINE_ID_DIGB:
-			*atom_engine_id = ASIC_INT_DIG2_ENCODER_ID;
-			result = true;
-			break;
-		case ENGINE_ID_DIGC:
-			*atom_engine_id = ASIC_INT_DIG3_ENCODER_ID;
-			result = true;
-			break;
-		case ENGINE_ID_DIGD:
-			*atom_engine_id = ASIC_INT_DIG4_ENCODER_ID;
-			result = true;
-			break;
-		case ENGINE_ID_DIGE:
-			*atom_engine_id = ASIC_INT_DIG5_ENCODER_ID;
-			result = true;
-			break;
-		case ENGINE_ID_DIGF:
-			*atom_engine_id = ASIC_INT_DIG6_ENCODER_ID;
-			result = true;
-			break;
-		case ENGINE_ID_DIGG:
-			*atom_engine_id = ASIC_INT_DIG7_ENCODER_ID;
-			result = true;
-			break;
-		case ENGINE_ID_DACA:
-			*atom_engine_id = ASIC_INT_DAC1_ENCODER_ID;
-			result = true;
-			break;
-		default:
-			break;
-		}
-
-	return result;
-}
-
 static uint8_t encoder_action_to_atom(enum bp_encoder_control_action action)
 {
 	uint8_t atom_action = 0;
diff --git a/drivers/gpu/drm/amd/display/dc/bios/dce60/command_table_helper_dce60.c b/drivers/gpu/drm/amd/display/dc/bios/dce60/command_table_helper_dce60.c
index 710221b4f5c5..49b3c6fd648d 100644
--- a/drivers/gpu/drm/amd/display/dc/bios/dce60/command_table_helper_dce60.c
+++ b/drivers/gpu/drm/amd/display/dc/bios/dce60/command_table_helper_dce60.c
@@ -33,6 +33,8 @@
 
 #include "../command_table_helper.h"
 
+#include "../dce_common/command_table_helper_dce_common.h"
+
 static uint8_t encoder_action_to_atom(enum bp_encoder_control_action action)
 {
 	uint8_t atom_action = 0;
@@ -58,51 +60,6 @@ static uint8_t encoder_action_to_atom(enum bp_encoder_control_action action)
 	return atom_action;
 }
 
-static bool engine_bp_to_atom(enum engine_id id, uint32_t *atom_engine_id)
-{
-	bool result = false;
-
-	if (atom_engine_id != NULL)
-		switch (id) {
-		case ENGINE_ID_DIGA:
-			*atom_engine_id = ASIC_INT_DIG1_ENCODER_ID;
-			result = true;
-			break;
-		case ENGINE_ID_DIGB:
-			*atom_engine_id = ASIC_INT_DIG2_ENCODER_ID;
-			result = true;
-			break;
-		case ENGINE_ID_DIGC:
-			*atom_engine_id = ASIC_INT_DIG3_ENCODER_ID;
-			result = true;
-			break;
-		case ENGINE_ID_DIGD:
-			*atom_engine_id = ASIC_INT_DIG4_ENCODER_ID;
-			result = true;
-			break;
-		case ENGINE_ID_DIGE:
-			*atom_engine_id = ASIC_INT_DIG5_ENCODER_ID;
-			result = true;
-			break;
-		case ENGINE_ID_DIGF:
-			*atom_engine_id = ASIC_INT_DIG6_ENCODER_ID;
-			result = true;
-			break;
-		case ENGINE_ID_DIGG:
-			*atom_engine_id = ASIC_INT_DIG7_ENCODER_ID;
-			result = true;
-			break;
-		case ENGINE_ID_DACA:
-			*atom_engine_id = ASIC_INT_DAC1_ENCODER_ID;
-			result = true;
-			break;
-		default:
-			break;
-		}
-
-	return result;
-}
-
 static bool clock_source_id_to_atom(
 	enum clock_source_id id,
 	uint32_t *atom_pll_id)
@@ -149,32 +106,6 @@ static bool clock_source_id_to_atom(
 	return result;
 }
 
-static uint8_t clock_source_id_to_atom_phy_clk_src_id(
-		enum clock_source_id id)
-{
-	uint8_t atom_phy_clk_src_id = 0;
-
-	switch (id) {
-	case CLOCK_SOURCE_ID_PLL0:
-		atom_phy_clk_src_id = ATOM_TRANSMITTER_CONFIG_V5_P0PLL;
-		break;
-	case CLOCK_SOURCE_ID_PLL1:
-		atom_phy_clk_src_id = ATOM_TRANSMITTER_CONFIG_V5_P1PLL;
-		break;
-	case CLOCK_SOURCE_ID_PLL2:
-		atom_phy_clk_src_id = ATOM_TRANSMITTER_CONFIG_V5_P2PLL;
-		break;
-	case CLOCK_SOURCE_ID_EXTERNAL:
-		atom_phy_clk_src_id = ATOM_TRANSMITTER_CONFIG_V5_REFCLK_SRC_EXT;
-		break;
-	default:
-		atom_phy_clk_src_id = ATOM_TRANSMITTER_CONFIG_V5_P1PLL;
-		break;
-	}
-
-	return atom_phy_clk_src_id >> 2;
-}
-
 static uint8_t signal_type_to_atom_dig_mode(enum signal_type s)
 {
 	uint8_t atom_dig_mode = ATOM_TRANSMITTER_DIGMODE_V5_DP;
@@ -270,39 +201,6 @@ static uint8_t dig_encoder_sel_to_atom(enum engine_id id)
 	return atom_dig_encoder_sel;
 }
 
-static uint8_t phy_id_to_atom(enum transmitter t)
-{
-	uint8_t atom_phy_id;
-
-	switch (t) {
-	case TRANSMITTER_UNIPHY_A:
-		atom_phy_id = ATOM_PHY_ID_UNIPHYA;
-		break;
-	case TRANSMITTER_UNIPHY_B:
-		atom_phy_id = ATOM_PHY_ID_UNIPHYB;
-		break;
-	case TRANSMITTER_UNIPHY_C:
-		atom_phy_id = ATOM_PHY_ID_UNIPHYC;
-		break;
-	case TRANSMITTER_UNIPHY_D:
-		atom_phy_id = ATOM_PHY_ID_UNIPHYD;
-		break;
-	case TRANSMITTER_UNIPHY_E:
-		atom_phy_id = ATOM_PHY_ID_UNIPHYE;
-		break;
-	case TRANSMITTER_UNIPHY_F:
-		atom_phy_id = ATOM_PHY_ID_UNIPHYF;
-		break;
-	case TRANSMITTER_UNIPHY_G:
-		atom_phy_id = ATOM_PHY_ID_UNIPHYG;
-		break;
-	default:
-		atom_phy_id = ATOM_PHY_ID_UNIPHYA;
-		break;
-	}
-	return atom_phy_id;
-}
-
 static uint8_t disp_power_gating_action_to_atom(
 	enum bp_pipe_control_action action)
 {
diff --git a/drivers/gpu/drm/amd/display/dc/bios/dce80/command_table_helper_dce80.c b/drivers/gpu/drm/amd/display/dc/bios/dce80/command_table_helper_dce80.c
index 8b30b558cf1f..f8c66e3a8f08 100644
--- a/drivers/gpu/drm/amd/display/dc/bios/dce80/command_table_helper_dce80.c
+++ b/drivers/gpu/drm/amd/display/dc/bios/dce80/command_table_helper_dce80.c
@@ -33,6 +33,8 @@
 
 #include "../command_table_helper.h"
 
+#include "../dce_common/command_table_helper_dce_common.h"
+
 static uint8_t encoder_action_to_atom(enum bp_encoder_control_action action)
 {
 	uint8_t atom_action = 0;
@@ -58,51 +60,6 @@ static uint8_t encoder_action_to_atom(enum bp_encoder_control_action action)
 	return atom_action;
 }
 
-static bool engine_bp_to_atom(enum engine_id id, uint32_t *atom_engine_id)
-{
-	bool result = false;
-
-	if (atom_engine_id != NULL)
-		switch (id) {
-		case ENGINE_ID_DIGA:
-			*atom_engine_id = ASIC_INT_DIG1_ENCODER_ID;
-			result = true;
-			break;
-		case ENGINE_ID_DIGB:
-			*atom_engine_id = ASIC_INT_DIG2_ENCODER_ID;
-			result = true;
-			break;
-		case ENGINE_ID_DIGC:
-			*atom_engine_id = ASIC_INT_DIG3_ENCODER_ID;
-			result = true;
-			break;
-		case ENGINE_ID_DIGD:
-			*atom_engine_id = ASIC_INT_DIG4_ENCODER_ID;
-			result = true;
-			break;
-		case ENGINE_ID_DIGE:
-			*atom_engine_id = ASIC_INT_DIG5_ENCODER_ID;
-			result = true;
-			break;
-		case ENGINE_ID_DIGF:
-			*atom_engine_id = ASIC_INT_DIG6_ENCODER_ID;
-			result = true;
-			break;
-		case ENGINE_ID_DIGG:
-			*atom_engine_id = ASIC_INT_DIG7_ENCODER_ID;
-			result = true;
-			break;
-		case ENGINE_ID_DACA:
-			*atom_engine_id = ASIC_INT_DAC1_ENCODER_ID;
-			result = true;
-			break;
-		default:
-			break;
-		}
-
-	return result;
-}
-
 static bool clock_source_id_to_atom(
 	enum clock_source_id id,
 	uint32_t *atom_pll_id)
@@ -149,32 +106,6 @@ static bool clock_source_id_to_atom(
 	return result;
 }
 
-static uint8_t clock_source_id_to_atom_phy_clk_src_id(
-		enum clock_source_id id)
-{
-	uint8_t atom_phy_clk_src_id = 0;
-
-	switch (id) {
-	case CLOCK_SOURCE_ID_PLL0:
-		atom_phy_clk_src_id = ATOM_TRANSMITTER_CONFIG_V5_P0PLL;
-		break;
-	case CLOCK_SOURCE_ID_PLL1:
-		atom_phy_clk_src_id = ATOM_TRANSMITTER_CONFIG_V5_P1PLL;
-		break;
-	case CLOCK_SOURCE_ID_PLL2:
-		atom_phy_clk_src_id = ATOM_TRANSMITTER_CONFIG_V5_P2PLL;
-		break;
-	case CLOCK_SOURCE_ID_EXTERNAL:
-		atom_phy_clk_src_id = ATOM_TRANSMITTER_CONFIG_V5_REFCLK_SRC_EXT;
-		break;
-	default:
-		atom_phy_clk_src_id = ATOM_TRANSMITTER_CONFIG_V5_P1PLL;
-		break;
-	}
-
-	return atom_phy_clk_src_id >> 2;
-}
-
 static uint8_t signal_type_to_atom_dig_mode(enum signal_type s)
 {
 	uint8_t atom_dig_mode = ATOM_TRANSMITTER_DIGMODE_V5_DP;
@@ -270,39 +201,6 @@ static uint8_t dig_encoder_sel_to_atom(enum engine_id id)
 	return atom_dig_encoder_sel;
 }
 
-static uint8_t phy_id_to_atom(enum transmitter t)
-{
-	uint8_t atom_phy_id;
-
-	switch (t) {
-	case TRANSMITTER_UNIPHY_A:
-		atom_phy_id = ATOM_PHY_ID_UNIPHYA;
-		break;
-	case TRANSMITTER_UNIPHY_B:
-		atom_phy_id = ATOM_PHY_ID_UNIPHYB;
-		break;
-	case TRANSMITTER_UNIPHY_C:
-		atom_phy_id = ATOM_PHY_ID_UNIPHYC;
-		break;
-	case TRANSMITTER_UNIPHY_D:
-		atom_phy_id = ATOM_PHY_ID_UNIPHYD;
-		break;
-	case TRANSMITTER_UNIPHY_E:
-		atom_phy_id = ATOM_PHY_ID_UNIPHYE;
-		break;
-	case TRANSMITTER_UNIPHY_F:
-		atom_phy_id = ATOM_PHY_ID_UNIPHYF;
-		break;
-	case TRANSMITTER_UNIPHY_G:
-		atom_phy_id = ATOM_PHY_ID_UNIPHYG;
-		break;
-	default:
-		atom_phy_id = ATOM_PHY_ID_UNIPHYA;
-		break;
-	}
-	return atom_phy_id;
-}
-
 static uint8_t disp_power_gating_action_to_atom(
 	enum bp_pipe_control_action action)
 {
diff --git a/drivers/gpu/drm/amd/display/dc/bios/dce_common/command_table_helper_dce_common.c b/drivers/gpu/drm/amd/display/dc/bios/dce_common/command_table_helper_dce_common.c
new file mode 100644
index 000000000000..d715a2bb7710
--- /dev/null
+++ b/drivers/gpu/drm/amd/display/dc/bios/dce_common/command_table_helper_dce_common.c
@@ -0,0 +1,110 @@
+// SPDX-License-Identifier: MIT
+
+#include "dm_services.h"
+#include "atom.h"
+
+#include "command_table_helper_dce_common.h"
+
+uint8_t phy_id_to_atom(enum transmitter t)
+{
+	uint8_t atom_phy_id;
+
+	switch (t) {
+	case TRANSMITTER_UNIPHY_A:
+		atom_phy_id = ATOM_PHY_ID_UNIPHYA;
+		break;
+	case TRANSMITTER_UNIPHY_B:
+		atom_phy_id = ATOM_PHY_ID_UNIPHYB;
+		break;
+	case TRANSMITTER_UNIPHY_C:
+		atom_phy_id = ATOM_PHY_ID_UNIPHYC;
+		break;
+	case TRANSMITTER_UNIPHY_D:
+		atom_phy_id = ATOM_PHY_ID_UNIPHYD;
+		break;
+	case TRANSMITTER_UNIPHY_E:
+		atom_phy_id = ATOM_PHY_ID_UNIPHYE;
+		break;
+	case TRANSMITTER_UNIPHY_F:
+		atom_phy_id = ATOM_PHY_ID_UNIPHYF;
+		break;
+	case TRANSMITTER_UNIPHY_G:
+		atom_phy_id = ATOM_PHY_ID_UNIPHYG;
+		break;
+	default:
+		atom_phy_id = ATOM_PHY_ID_UNIPHYA;
+		break;
+	}
+	return atom_phy_id;
+}
+
+uint8_t clock_source_id_to_atom_phy_clk_src_id(
+		enum clock_source_id id)
+{
+	uint8_t atom_phy_clk_src_id = 0;
+
+	switch (id) {
+	case CLOCK_SOURCE_ID_PLL0:
+		atom_phy_clk_src_id = ATOM_TRANSMITTER_CONFIG_V5_P0PLL;
+		break;
+	case CLOCK_SOURCE_ID_PLL1:
+		atom_phy_clk_src_id = ATOM_TRANSMITTER_CONFIG_V5_P1PLL;
+		break;
+	case CLOCK_SOURCE_ID_PLL2:
+		atom_phy_clk_src_id = ATOM_TRANSMITTER_CONFIG_V5_P2PLL;
+		break;
+	case CLOCK_SOURCE_ID_EXTERNAL:
+		atom_phy_clk_src_id = ATOM_TRANSMITTER_CONFIG_V5_REFCLK_SRC_EXT;
+		break;
+	default:
+		atom_phy_clk_src_id = ATOM_TRANSMITTER_CONFIG_V5_P1PLL;
+		break;
+	}
+
+	return atom_phy_clk_src_id >> 2;
+}
+
+bool engine_bp_to_atom(enum engine_id id, uint32_t *atom_engine_id)
+{
+	bool result = false;
+
+	if (atom_engine_id != NULL)
+		switch (id) {
+		case ENGINE_ID_DIGA:
+			*atom_engine_id = ASIC_INT_DIG1_ENCODER_ID;
+			result = true;
+			break;
+		case ENGINE_ID_DIGB:
+			*atom_engine_id = ASIC_INT_DIG2_ENCODER_ID;
+			result = true;
+			break;
+		case ENGINE_ID_DIGC:
+			*atom_engine_id = ASIC_INT_DIG3_ENCODER_ID;
+			result = true;
+			break;
+		case ENGINE_ID_DIGD:
+			*atom_engine_id = ASIC_INT_DIG4_ENCODER_ID;
+			result = true;
+			break;
+		case ENGINE_ID_DIGE:
+			*atom_engine_id = ASIC_INT_DIG5_ENCODER_ID;
+			result = true;
+			break;
+		case ENGINE_ID_DIGF:
+			*atom_engine_id = ASIC_INT_DIG6_ENCODER_ID;
+			result = true;
+			break;
+		case ENGINE_ID_DIGG:
+			*atom_engine_id = ASIC_INT_DIG7_ENCODER_ID;
+			result = true;
+			break;
+		case ENGINE_ID_DACA:
+			*atom_engine_id = ASIC_INT_DAC1_ENCODER_ID;
+			result = true;
+			break;
+		default:
+			break;
+		}
+
+	return result;
+}
diff --git a/drivers/gpu/drm/amd/display/dc/bios/dce_common/command_table_helper_dce_common.h b/drivers/gpu/drm/amd/display/dc/bios/dce_common/command_table_helper_dce_common.h
new file mode 100644
index 000000000000..4e0ceb39b95f
--- /dev/null
+++ b/drivers/gpu/drm/amd/display/dc/bios/dce_common/command_table_helper_dce_common.h
@@ -0,0 +1,14 @@
+/* SPDX-License-Identifier: MIT */
+
+#ifndef __DAL_COMMAND_TABLE_HELPER_DCE_COMMON_H__
+#define __DAL_COMMAND_TABLE_HELPER_DCE_COMMON_H__
+
+
+uint8_t phy_id_to_atom(enum transmitter t);
+
+uint8_t clock_source_id_to_atom_phy_clk_src_id(
+		enum clock_source_id id);
+
+bool engine_bp_to_atom(enum engine_id id, uint32_t *atom_engine_id);
+
+#endif
-- 
2.43.0

