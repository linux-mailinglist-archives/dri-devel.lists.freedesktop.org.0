Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B4F22487526
	for <lists+dri-devel@lfdr.de>; Fri,  7 Jan 2022 11:03:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B2A2611B917;
	Fri,  7 Jan 2022 10:03:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nksmu.kylinos.cn (mailgw.kylinos.cn [123.150.8.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BEAE611B917;
 Fri,  7 Jan 2022 10:03:11 +0000 (UTC)
X-UUID: 8e3757b0c058452db7c778104a764110-20220107
X-CPASD-INFO: 4612c612bc964f4e962476339ee023a7@fYZrUpBoX2KOg3uCg6l_n1lnYmRnYlO
 Ce5-FYGBjjVeVhH5xTWJsXVKBfG5QZWNdYVN_eGpQYl9gZFB5i3-XblBgXoZgUZB3g3hrUpNkYQ==
X-CPASD-FEATURE: 0.0
X-CLOUD-ID: 4612c612bc964f4e962476339ee023a7
X-CPASD-SUMMARY: SIP:-1, APTIP:-2.0, KEY:0.0, FROMBLOCK:1, EXT:0.0, OB:0.0,
 URL:-5, T
 VAL:181.0, ESV:0.0, ECOM:-5.0, ML:0.0, FD:0.0, CUTS:477.0, IP:-2.0, MAL:0.0,
 ATTNUM:0
 .0, PHF:-5.0, PHC:-5.0, SPF:4.0, EDMS:-3, IPLABEL:4480.0, FROMTO:0, AD:0,
 FFOB:0.0, CF
 OB:0.0, SPC:0.0, SIG:-5, AUF:14, DUF:29772, ACD:157, DCD:259, SL:0, AG:0,
 CFC:0.199, CF SR:0.184,UAT:0,RAF:0,VERSION:2.3.4
X-CPASD-ID: 8e3757b0c058452db7c778104a764110-20220107
X-CPASD-BLOCK: 1000
X-CPASD-STAGE: 1, 1
X-UUID: 8e3757b0c058452db7c778104a764110-20220107
X-User: lizhenneng@kylinos.cn
Received: from localhost.localdomain [(116.128.244.169)] by nksmu.kylinos.cn
 (envelope-from <lizhenneng@kylinos.cn>) (Generic MTA)
 with ESMTP id 724892482; Fri, 07 Jan 2022 18:11:05 +0800
From: Zhenneng Li <lizhenneng@kylinos.cn>
To: Alex Deucher <alexander.deucher@amd.com>
Subject: [PATCH 1/2] drm/amdgpu: fix compile error for dcn on arm64
Date: Fri,  7 Jan 2022 17:57:31 +0800
Message-Id: <20220107095732.982194-2-lizhenneng@kylinos.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220107095732.982194-1-lizhenneng@kylinos.cn>
References: <20220107095732.982194-1-lizhenneng@kylinos.cn>
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
Cc: David Airlie <airlied@linux.ie>, Xinhui.Pan@amd.com,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, Zhenneng Li <lizhenneng@kylinos.cn>,
 Leo Li <sunpeng.li@amd.com>, dri-devel@lists.freedesktop.org,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

For adapting radeon rx6600 xt on arm64,
I enabled dcn on arm64 platform, compiler
report not compatible with -mgeneral-regs-only
and -mhard-float when compiling some source file.

Signed-off-by: Zhenneng Li <lizhenneng@kylinos.cn>
---
 drivers/gpu/drm/amd/display/dc/calcs/Makefile |  6 +++++
 .../gpu/drm/amd/display/dc/clk_mgr/Makefile   |  7 ++++++
 drivers/gpu/drm/amd/display/dc/dcn10/Makefile |  4 +++
 drivers/gpu/drm/amd/display/dc/dcn20/Makefile |  4 +++
 .../gpu/drm/amd/display/dc/dcn201/Makefile    |  6 +++++
 drivers/gpu/drm/amd/display/dc/dcn21/Makefile |  4 +++
 drivers/gpu/drm/amd/display/dc/dcn30/Makefile |  6 +++++
 .../gpu/drm/amd/display/dc/dcn302/Makefile    |  6 +++++
 .../gpu/drm/amd/display/dc/dcn303/Makefile    |  6 +++++
 drivers/gpu/drm/amd/display/dc/dcn31/Makefile |  6 +++++
 drivers/gpu/drm/amd/display/dc/dml/Makefile   | 25 +++++++++++++++++++
 drivers/gpu/drm/amd/display/dc/dsc/Makefile   |  7 ++++++
 12 files changed, 87 insertions(+)

diff --git a/drivers/gpu/drm/amd/display/dc/calcs/Makefile b/drivers/gpu/drm/amd/display/dc/calcs/Makefile
index f3c00f479e1c..1cb9925d9949 100644
--- a/drivers/gpu/drm/amd/display/dc/calcs/Makefile
+++ b/drivers/gpu/drm/amd/display/dc/calcs/Makefile
@@ -57,6 +57,12 @@ CFLAGS_REMOVE_$(AMDDALPATH)/dc/calcs/dcn_calcs.o := $(calcs_rcflags)
 CFLAGS_REMOVE_$(AMDDALPATH)/dc/calcs/dcn_calc_auto.o := $(calcs_rcflags)
 CFLAGS_REMOVE_$(AMDDALPATH)/dc/calcs/dcn_calc_math.o := $(calcs_rcflags)
 
+ifdef CONFIG_ARM64
+CFLAGS_REMOVE_$(AMDDALPATH)/dc/calcs/dcn_calcs.o += -mgeneral-regs-only
+CFLAGS_REMOVE_$(AMDDALPATH)/dc/calcs/dcn_calc_auto.o += -mgeneral-regs-only
+CFLAGS_REMOVE_$(AMDDALPATH)/dc/calcs/dcn_calc_math.o += -mgeneral-regs-only
+endif
+
 BW_CALCS = dce_calcs.o bw_fixed.o custom_float.o
 
 ifdef CONFIG_DRM_AMD_DC_DCN
diff --git a/drivers/gpu/drm/amd/display/dc/clk_mgr/Makefile b/drivers/gpu/drm/amd/display/dc/clk_mgr/Makefile
index 6bd73e49a6d2..6779c236ea30 100644
--- a/drivers/gpu/drm/amd/display/dc/clk_mgr/Makefile
+++ b/drivers/gpu/drm/amd/display/dc/clk_mgr/Makefile
@@ -145,6 +145,13 @@ AMD_DAL_CLK_MGR_DCN301 = $(addprefix $(AMDDALPATH)/dc/clk_mgr/dcn301/,$(CLK_MGR_
 
 AMD_DISPLAY_FILES += $(AMD_DAL_CLK_MGR_DCN301)
 
+ifdef CONFIG_ARM64
+CFLAGS_REMOVE_$(AMDDALPATH)/dc/clk_mgr/dcn21/rn_clk_mgr.o += -mgeneral-regs-only
+CFLAGS_REMOVE_$(AMDDALPATH)/dc/clk_mgr/dcn301/dcn30_clk_mgr.o += -mgeneral-regs-only
+CFLAGS_REMOVE_$(AMDDALPATH)/dc/clk_mgr/dcn301/vg_clk_mgr.o += -mgeneral-regs-only
+CFLAGS_REMOVE_$(AMDDALPATH)/dc/clk_mgr/dcn30/dcn30_clk_mgr.o += -mgeneral-regs-only
+endif
+
 ###############################################################################
 # DCN31
 ###############################################################################
diff --git a/drivers/gpu/drm/amd/display/dc/dcn10/Makefile b/drivers/gpu/drm/amd/display/dc/dcn10/Makefile
index 62ad1a11bff9..5dc61ea5070c 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn10/Makefile
+++ b/drivers/gpu/drm/amd/display/dc/dcn10/Makefile
@@ -29,6 +29,10 @@ DCN10 = dcn10_init.o dcn10_resource.o dcn10_ipp.o dcn10_hw_sequencer.o \
 		dcn10_dpp_dscl.o dcn10_dpp_cm.o dcn10_cm_common.o \
 		dcn10_hubbub.o dcn10_stream_encoder.o dcn10_link_encoder.o
 
+ifdef CONFIG_ARM64
+CFLAGS_REMOVE_$(AMDDALPATH)/dc/dcn10/dcn10_resource.o += -mgeneral-regs-only
+endif
+
 AMD_DAL_DCN10 = $(addprefix $(AMDDALPATH)/dc/dcn10/,$(DCN10))
 
 AMD_DISPLAY_FILES += $(AMD_DAL_DCN10)
diff --git a/drivers/gpu/drm/amd/display/dc/dcn20/Makefile b/drivers/gpu/drm/amd/display/dc/dcn20/Makefile
index 5fcaf78334ff..88c35a24e0cf 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn20/Makefile
+++ b/drivers/gpu/drm/amd/display/dc/dcn20/Makefile
@@ -17,6 +17,10 @@ ifdef CONFIG_PPC64
 CFLAGS_$(AMDDALPATH)/dc/dcn20/dcn20_resource.o := -mhard-float -maltivec
 endif
 
+ifdef CONFIG_ARM64
+CFLAGS_REMOVE_$(AMDDALPATH)/dc/dcn20/dcn20_resource.o += -mgeneral-regs-only
+endif
+
 ifdef CONFIG_CC_IS_GCC
 ifeq ($(call cc-ifversion, -lt, 0701, y), y)
 IS_OLD_GCC = 1
diff --git a/drivers/gpu/drm/amd/display/dc/dcn201/Makefile b/drivers/gpu/drm/amd/display/dc/dcn201/Makefile
index f68038ceb1b1..2124414d629f 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn201/Makefile
+++ b/drivers/gpu/drm/amd/display/dc/dcn201/Makefile
@@ -14,12 +14,18 @@ ifdef CONFIG_PPC64
 CFLAGS_$(AMDDALPATH)/dc/dcn201/dcn201_resource.o := -mhard-float -maltivec
 endif
 
+ifdef CONFIG_ARM64
+CFLAGS_REMOVE_$(AMDDALPATH)/dc/dcn201/dcn201_resource.o += -mgeneral-regs-only
+endif
+
 ifdef CONFIG_CC_IS_GCC
 ifeq ($(call cc-ifversion, -lt, 0701, y), y)
 IS_OLD_GCC = 1
 endif
+ifndef CONFIG_ARM64
 CFLAGS_$(AMDDALPATH)/dc/dcn201/dcn201_resource.o += -mhard-float
 endif
+endif
 
 ifdef CONFIG_X86
 ifdef IS_OLD_GCC
diff --git a/drivers/gpu/drm/amd/display/dc/dcn21/Makefile b/drivers/gpu/drm/amd/display/dc/dcn21/Makefile
index bb8c95141082..df8ed3401b7f 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn21/Makefile
+++ b/drivers/gpu/drm/amd/display/dc/dcn21/Makefile
@@ -30,6 +30,10 @@ CFLAGS_$(AMDDALPATH)/dc/dcn21/dcn21_resource.o += -msse2
 endif
 endif
 
+ifdef CONFIG_ARM64
+CFLAGS_REMOVE_$(AMDDALPATH)/dc/dcn21/dcn21_resource.o += -mgeneral-regs-only
+endif
+
 AMD_DAL_DCN21 = $(addprefix $(AMDDALPATH)/dc/dcn21/,$(DCN21))
 
 AMD_DISPLAY_FILES += $(AMD_DAL_DCN21)
diff --git a/drivers/gpu/drm/amd/display/dc/dcn30/Makefile b/drivers/gpu/drm/amd/display/dc/dcn30/Makefile
index dfd77b3cc84d..e52d10626dcc 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn30/Makefile
+++ b/drivers/gpu/drm/amd/display/dc/dcn30/Makefile
@@ -45,9 +45,11 @@ ifdef CONFIG_CC_IS_GCC
 ifeq ($(call cc-ifversion, -lt, 0701, y), y)
 IS_OLD_GCC = 1
 endif
+ifndef CONFIG_ARM64
 CFLAGS_$(AMDDALPATH)/dc/dcn30/dcn30_resource.o += -mhard-float
 CFLAGS_$(AMDDALPATH)/dc/dcn30/dcn30_optc.o += -mhard-float
 endif
+endif
 
 ifdef CONFIG_X86
 ifdef IS_OLD_GCC
@@ -62,6 +64,10 @@ CFLAGS_$(AMDDALPATH)/dc/dcn30/dcn30_optc.o += -msse2
 endif
 endif
 
+ifdef CONFIG_ARM64
+CFLAGS_REMOVE_$(AMDDALPATH)/dc/dcn30/dcn30_resource.o += -mgeneral-regs-only
+endif
+
 AMD_DAL_DCN30 = $(addprefix $(AMDDALPATH)/dc/dcn30/,$(DCN30))
 
 AMD_DISPLAY_FILES += $(AMD_DAL_DCN30)
diff --git a/drivers/gpu/drm/amd/display/dc/dcn302/Makefile b/drivers/gpu/drm/amd/display/dc/dcn302/Makefile
index 101620a8867a..ac8faaf24e21 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn302/Makefile
+++ b/drivers/gpu/drm/amd/display/dc/dcn302/Makefile
@@ -24,8 +24,10 @@ ifdef CONFIG_CC_IS_GCC
 ifeq ($(call cc-ifversion, -lt, 0701, y), y)
 IS_OLD_GCC = 1
 endif
+ifndef CONFIG_ARM64
 CFLAGS_$(AMDDALPATH)/dc/dcn302/dcn302_resource.o += -mhard-float
 endif
+endif
 
 ifdef CONFIG_X86
 ifdef IS_OLD_GCC
@@ -38,6 +40,10 @@ CFLAGS_$(AMDDALPATH)/dc/dcn302/dcn302_resource.o += -msse2
 endif
 endif
 
+ifdef CONFIG_ARM64
+CFLAGS_REMOVE_$(AMDDALPATH)/dc/dcn302/dcn302_resource.o += -mgeneral-regs-only
+endif
+
 AMD_DAL_DCN3_02 = $(addprefix $(AMDDALPATH)/dc/dcn302/,$(DCN3_02))
 
 AMD_DISPLAY_FILES += $(AMD_DAL_DCN3_02)
diff --git a/drivers/gpu/drm/amd/display/dc/dcn303/Makefile b/drivers/gpu/drm/amd/display/dc/dcn303/Makefile
index 6f7a1f2b49f0..2fb3a1f88f1e 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn303/Makefile
+++ b/drivers/gpu/drm/amd/display/dc/dcn303/Makefile
@@ -20,8 +20,10 @@ ifdef CONFIG_CC_IS_GCC
 ifeq ($(call cc-ifversion, -lt, 0701, y), y)
 IS_OLD_GCC = 1
 endif
+ifndef CONFIG_ARM64
 CFLAGS_$(AMDDALPATH)/dc/dcn303/dcn303_resource.o += -mhard-float
 endif
+endif
 
 ifdef CONFIG_X86
 ifdef IS_OLD_GCC
@@ -34,6 +36,10 @@ CFLAGS_$(AMDDALPATH)/dc/dcn303/dcn303_resource.o += -msse2
 endif
 endif
 
+ifdef CONFIG_ARM64
+CFLAGS_REMOVE_$(AMDDALPATH)/dc/dcn303/dcn303_resource.o += -mgeneral-regs-only
+endif
+
 AMD_DAL_DCN3_03 = $(addprefix $(AMDDALPATH)/dc/dcn303/,$(DCN3_03))
 
 AMD_DISPLAY_FILES += $(AMD_DAL_DCN3_03)
diff --git a/drivers/gpu/drm/amd/display/dc/dcn31/Makefile b/drivers/gpu/drm/amd/display/dc/dcn31/Makefile
index d20e3b8ccc30..c19669fe5996 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn31/Makefile
+++ b/drivers/gpu/drm/amd/display/dc/dcn31/Makefile
@@ -27,8 +27,10 @@ ifdef CONFIG_CC_IS_GCC
 ifeq ($(call cc-ifversion, -lt, 0701, y), y)
 IS_OLD_GCC = 1
 endif
+ifndef CONFIG_ARM64
 CFLAGS_$(AMDDALPATH)/dc/dcn31/dcn31_resource.o += -mhard-float
 endif
+endif
 
 ifdef CONFIG_X86
 ifdef IS_OLD_GCC
@@ -41,6 +43,10 @@ CFLAGS_$(AMDDALPATH)/dc/dcn31/dcn31_resource.o += -msse2
 endif
 endif
 
+ifdef CONFIG_ARM64
+CFLAGS_REMOVE_$(AMDDALPATH)/dc/dcn31/dcn31_resource.o += -mgeneral-regs-only
+endif
+
 AMD_DAL_DCN31 = $(addprefix $(AMDDALPATH)/dc/dcn31/,$(DCN31))
 
 AMD_DISPLAY_FILES += $(AMD_DAL_DCN31)
diff --git a/drivers/gpu/drm/amd/display/dc/dml/Makefile b/drivers/gpu/drm/amd/display/dc/dml/Makefile
index eee6672bd32d..dfce2af4f3b7 100644
--- a/drivers/gpu/drm/amd/display/dc/dml/Makefile
+++ b/drivers/gpu/drm/amd/display/dc/dml/Makefile
@@ -94,6 +94,31 @@ CFLAGS_$(AMDDALPATH)/dc/dml/display_rq_dlg_helpers.o := $(dml_ccflags)
 CFLAGS_REMOVE_$(AMDDALPATH)/dc/dml/dml1_display_rq_dlg_calc.o := $(dml_rcflags)
 CFLAGS_REMOVE_$(AMDDALPATH)/dc/dml/display_rq_dlg_helpers.o := $(dml_rcflags)
 
+ifdef CONFIG_ARM64
+ifdef CONFIG_DRM_AMD_DC_DCN
+CFLAGS_REMOVE_$(AMDDALPATH)/dc/dml/dcn20/display_mode_vba_20.o += -mgeneral-regs-only
+CFLAGS_REMOVE_$(AMDDALPATH)/dc/dml/dcn20/display_rq_dlg_calc_20.o += -mgeneral-regs-only
+CFLAGS_REMOVE_$(AMDDALPATH)/dc/dml/dcn20/display_mode_vba_20v2.o += -mgeneral-regs-only
+CFLAGS_REMOVE_$(AMDDALPATH)/dc/dml/dcn20/display_rq_dlg_calc_20v2.o += -mgeneral-regs-only
+CFLAGS_REMOVE_$(AMDDALPATH)/dc/dml/dcn20/dcn20_fpu.o += -mgeneral-regs-only
+CFLAGS_REMOVE_$(AMDDALPATH)/dc/dml/dcn21/display_mode_vba_21.o += -mgeneral-regs-only
+CFLAGS_REMOVE_$(AMDDALPATH)/dc/dml/dcn21/display_rq_dlg_calc_21.o += -mgeneral-regs-only
+CFLAGS_REMOVE_$(AMDDALPATH)/dc/dml/dcn30/display_mode_vga_30.o += -mgeneral-regs-only
+CFLAGS_REMOVE_$(AMDDALPATH)/dc/dml/dcn30/display_mode_vga_30.o += -mgeneral-regs-only
+CFLAGS_REMOVE_$(AMDDALPATH)/dc/dml/dcn30/display_mode_vba_30.o += -mgeneral-regs-only
+CFLAGS_REMOVE_$(AMDDALPATH)/dc/dml/dcn30/display_rq_dlg_calc_30.o += -mgeneral-regs-only
+CFLAGS_REMOVE_$(AMDDALPATH)/dc/dml/dcn31/display_mode_vba_31.o += -mgeneral-regs-only
+CFLAGS_REMOVE_$(AMDDALPATH)/dc/dml/dcn31/display_rq_dlg_calc_31.o += -mgeneral-regs-only
+CFLAGS_REMOVE_$(AMDDALPATH)/dc/dml/dcn301/dcn301_fpu.o += -mgeneral-regs-only
+endif
+CFLAGS_REMOVE_$(AMDDALPATH)/dc/dml/display_mode_lib.o += -mgeneral-regs-only
+CFLAGS_REMOVE_$(AMDDALPATH)/dc/dml/display_mode_vba.o += -mgeneral-regs-only
+CFLAGS_REMOVE_$(AMDDALPATH)/dc/dml/dsc/rc_calc_fpu.o += -mgeneral-regs-only
+CFLAGS_REMOVE_$(AMDDALPATH)/dc/dml/dml1_display_rq_dlg_calc.o += -mgeneral-regs-only
+CFLAGS_REMOVE_$(AMDDALPATH)/dc/dml/display_rq_dlg_helpers.o += -mgeneral-regs-only
+CFLAGS_REMOVE_$(AMDDALPATH)/dc/dml/dml_common_defs.o += -mgeneral-regs-only
+endif
+
 DML = display_mode_lib.o display_rq_dlg_helpers.o dml1_display_rq_dlg_calc.o \
 
 ifdef CONFIG_DRM_AMD_DC_DCN
diff --git a/drivers/gpu/drm/amd/display/dc/dsc/Makefile b/drivers/gpu/drm/amd/display/dc/dsc/Makefile
index a2537229ee88..b783523ee5c9 100644
--- a/drivers/gpu/drm/amd/display/dc/dsc/Makefile
+++ b/drivers/gpu/drm/amd/display/dc/dsc/Makefile
@@ -1,6 +1,13 @@
 # SPDX-License-Identifier: MIT
 #
 # Makefile for the 'dsc' sub-component of DAL.
+
+ifdef CONFIG_ARM64
+CFLAGS_REMOVE_$(AMDDALPATH)/dc/dsc/rc_calc.o += -mgeneral-regs-only
+CFLAGS_REMOVE_$(AMDDALPATH)/dc/dsc/rc_calc_dpi.o += -mgeneral-regs-only
+CFLAGS_REMOVE_$(AMDDALPATH)/dc/dsc/dc_dsc.o += -mgeneral-regs-only
+endif
+
 DSC = dc_dsc.o rc_calc.o rc_calc_dpi.o
 
 AMD_DAL_DSC = $(addprefix $(AMDDALPATH)/dc/dsc/,$(DSC))
-- 
2.25.1


No virus found
		Checked by Hillstone Network AntiVirus
