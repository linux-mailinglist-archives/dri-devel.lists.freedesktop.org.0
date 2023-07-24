Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B257A75E9ED
	for <lists+dri-devel@lfdr.de>; Mon, 24 Jul 2023 04:55:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3CBD110E26A;
	Mon, 24 Jul 2023 02:55:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.208.org (unknown [183.242.55.162])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9FFB210E26A
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jul 2023 02:55:48 +0000 (UTC)
Received: from mail.208.org (email.208.org [127.0.0.1])
 by mail.208.org (Postfix) with ESMTP id 4R8Pt76cF4zBRYmK
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jul 2023 10:55:43 +0800 (CST)
Authentication-Results: mail.208.org (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)" header.d=208.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=208.org; h=
 content-transfer-encoding:content-type:message-id:user-agent
 :references:in-reply-to:subject:to:from:date:mime-version; s=
 dkim; t=1690167343; x=1692759344; bh=vOOqPYdFYmEoI+f2kfyA+320Rn6
 n4FgX4tjYiSJKcDY=; b=L686CH+nJbFchQu9dOyMSCsv8uwd51KKLIZJjobvVBS
 1FiRuT1/toyLhpNDG+clh43SZJR+tWRg93wI7UIUkNcH2GMenET0NmH7WleQ52O9
 1ItMLYKsi7QhJXEyVk6ijE2mrUh5w3erWfKzFy/tP2TR4bl6ne8gk1H29NG1uM4b
 xgFGUKzsXqE5KvzzxoLx2TfkDLHqZod59iXq3hzXQ9DE+VEEOXlLZGhdzlUE6MFX
 vGUBQkfmC8AYZev6V9mNPMHSaBI+Sgf6jSmJV5Aq4ShroRjMLGFkCDtfccbJhxcf
 klBljSnYf7rM3hyPIDeGyJD41i/NdXQVyoSFnRraSSA==
X-Virus-Scanned: amavisd-new at mail.208.org
Received: from mail.208.org ([127.0.0.1])
 by mail.208.org (mail.208.org [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id 6PccS8H3jIvw for <dri-devel@lists.freedesktop.org>;
 Mon, 24 Jul 2023 10:55:43 +0800 (CST)
Received: from localhost (email.208.org [127.0.0.1])
 by mail.208.org (Postfix) with ESMTPSA id 4R8Pt73d3nzBHYM0;
 Mon, 24 Jul 2023 10:55:43 +0800 (CST)
MIME-Version: 1.0
Date: Mon, 24 Jul 2023 10:55:43 +0800
From: sunran001@208suo.com
To: airlied@gmail.com, daniel@ffwll.ch, alexander.deucher@amd.com
Subject: [PATCH] drm/radeon/si_dpm: open brace '{' following struct go on the
 same line
In-Reply-To: <20230724025235.7416-1-xujianghui@cdjrlc.com>
References: <20230724025235.7416-1-xujianghui@cdjrlc.com>
User-Agent: Roundcube Webmail
Message-ID: <51039d36001a36bd132397164045d6c6@208suo.com>
X-Sender: sunran001@208suo.com
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
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
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

ERROR: open brace '{' following struct go on the same line

Signed-off-by: Ran Sun <sunran001@208suo.com>
---
  drivers/gpu/drm/radeon/sislands_smc.h | 51 +++++++++------------------
  1 file changed, 17 insertions(+), 34 deletions(-)

diff --git a/drivers/gpu/drm/radeon/sislands_smc.h 
b/drivers/gpu/drm/radeon/sislands_smc.h
index 4ea1cb2e45a3..4b7dee3cf58b 100644
--- a/drivers/gpu/drm/radeon/sislands_smc.h
+++ b/drivers/gpu/drm/radeon/sislands_smc.h
@@ -89,8 +89,7 @@ struct PP_SIslands_PAPMStatus
  };
  typedef struct PP_SIslands_PAPMStatus PP_SIslands_PAPMStatus;

-struct PP_SIslands_PAPMParameters
-{
+struct PP_SIslands_PAPMParameters {
      uint32_t    NearTDPLimitTherm;
      uint32_t    NearTDPLimitPAPM;
      uint32_t    PlatformPowerLimit;
@@ -100,8 +99,7 @@ struct PP_SIslands_PAPMParameters
  };
  typedef struct PP_SIslands_PAPMParameters PP_SIslands_PAPMParameters;

-struct SISLANDS_SMC_SCLK_VALUE
-{
+struct SISLANDS_SMC_SCLK_VALUE {
      uint32_t    vCG_SPLL_FUNC_CNTL;
      uint32_t    vCG_SPLL_FUNC_CNTL_2;
      uint32_t    vCG_SPLL_FUNC_CNTL_3;
@@ -113,8 +111,7 @@ struct SISLANDS_SMC_SCLK_VALUE

  typedef struct SISLANDS_SMC_SCLK_VALUE SISLANDS_SMC_SCLK_VALUE;

-struct SISLANDS_SMC_MCLK_VALUE
-{
+struct SISLANDS_SMC_MCLK_VALUE {
      uint32_t    vMPLL_FUNC_CNTL;
      uint32_t    vMPLL_FUNC_CNTL_1;
      uint32_t    vMPLL_FUNC_CNTL_2;
@@ -129,8 +126,7 @@ struct SISLANDS_SMC_MCLK_VALUE

  typedef struct SISLANDS_SMC_MCLK_VALUE SISLANDS_SMC_MCLK_VALUE;

-struct SISLANDS_SMC_VOLTAGE_VALUE
-{
+struct SISLANDS_SMC_VOLTAGE_VALUE {
      uint16_t    value;
      uint8_t     index;
      uint8_t     phase_settings;
@@ -138,8 +134,7 @@ struct SISLANDS_SMC_VOLTAGE_VALUE

  typedef struct SISLANDS_SMC_VOLTAGE_VALUE SISLANDS_SMC_VOLTAGE_VALUE;

-struct SISLANDS_SMC_HW_PERFORMANCE_LEVEL
-{
+struct SISLANDS_SMC_HW_PERFORMANCE_LEVEL {
      uint8_t                     ACIndex;
      uint8_t                     displayWatermark;
      uint8_t                     gen2PCIE;
@@ -180,8 +175,7 @@ struct SISLANDS_SMC_HW_PERFORMANCE_LEVEL

  typedef struct SISLANDS_SMC_HW_PERFORMANCE_LEVEL 
SISLANDS_SMC_HW_PERFORMANCE_LEVEL;

-struct SISLANDS_SMC_SWSTATE
-{
+struct SISLANDS_SMC_SWSTATE {
  	uint8_t                             flags;
  	uint8_t                             levelCount;
  	uint8_t                             padding2;
@@ -205,8 +199,7 @@ struct SISLANDS_SMC_SWSTATE_SINGLE {
  #define SISLANDS_SMC_VOLTAGEMASK_VDDC_PHASE_SHEDDING 3
  #define SISLANDS_SMC_VOLTAGEMASK_MAX   4

-struct SISLANDS_SMC_VOLTAGEMASKTABLE
-{
+struct SISLANDS_SMC_VOLTAGEMASKTABLE {
      uint32_t lowMask[SISLANDS_SMC_VOLTAGEMASK_MAX];
  };

@@ -214,8 +207,7 @@ typedef struct SISLANDS_SMC_VOLTAGEMASKTABLE 
SISLANDS_SMC_VOLTAGEMASKTABLE;

  #define SISLANDS_MAX_NO_VREG_STEPS 32

-struct SISLANDS_SMC_STATETABLE
-{
+struct SISLANDS_SMC_STATETABLE {
  	uint8_t					thermalProtectType;
  	uint8_t					systemFlags;
  	uint8_t					maxVDDCIndexInPPTable;
@@ -254,8 +246,7 @@ typedef struct SISLANDS_SMC_STATETABLE 
SISLANDS_SMC_STATETABLE;
  #define SI_SMC_SOFT_REGISTER_svi_rework_gpio_id_svd   0x11c
  #define SI_SMC_SOFT_REGISTER_svi_rework_gpio_id_svc   0x120

-struct PP_SIslands_FanTable
-{
+struct PP_SIslands_FanTable {
  	uint8_t  fdo_mode;
  	uint8_t  padding;
  	int16_t  temp_min;
@@ -285,8 +276,7 @@ typedef struct PP_SIslands_FanTable 
PP_SIslands_FanTable;
  #define SMC_SISLANDS_SCALE_I  7
  #define SMC_SISLANDS_SCALE_R 12

-struct PP_SIslands_CacConfig
-{
+struct PP_SIslands_CacConfig {
      uint16_t   
cac_lkge_lut[SMC_SISLANDS_LKGE_LUT_NUM_OF_TEMP_ENTRIES][SMC_SISLANDS_LKGE_LUT_NUM_OF_VOLT_ENTRIES];
      uint32_t   lkge_lut_V0;
      uint32_t   lkge_lut_Vstep;
@@ -308,23 +298,20 @@ typedef struct PP_SIslands_CacConfig 
PP_SIslands_CacConfig;
  #define SMC_SISLANDS_MC_REGISTER_ARRAY_SIZE 16
  #define SMC_SISLANDS_MC_REGISTER_ARRAY_SET_COUNT 20

-struct SMC_SIslands_MCRegisterAddress
-{
+struct SMC_SIslands_MCRegisterAddress {
      uint16_t s0;
      uint16_t s1;
  };

  typedef struct SMC_SIslands_MCRegisterAddress 
SMC_SIslands_MCRegisterAddress;

-struct SMC_SIslands_MCRegisterSet
-{
+struct SMC_SIslands_MCRegisterSet {
      uint32_t value[SMC_SISLANDS_MC_REGISTER_ARRAY_SIZE];
  };

  typedef struct SMC_SIslands_MCRegisterSet SMC_SIslands_MCRegisterSet;

-struct SMC_SIslands_MCRegisters
-{
+struct SMC_SIslands_MCRegisters {
      uint8_t                             last;
      uint8_t                             reserved[3];
      SMC_SIslands_MCRegisterAddress      
address[SMC_SISLANDS_MC_REGISTER_ARRAY_SIZE];
@@ -333,8 +320,7 @@ struct SMC_SIslands_MCRegisters

  typedef struct SMC_SIslands_MCRegisters SMC_SIslands_MCRegisters;

-struct SMC_SIslands_MCArbDramTimingRegisterSet
-{
+struct SMC_SIslands_MCArbDramTimingRegisterSet {
      uint32_t mc_arb_dram_timing;
      uint32_t mc_arb_dram_timing2;
      uint8_t  mc_arb_rfsh_rate;
@@ -344,8 +330,7 @@ struct SMC_SIslands_MCArbDramTimingRegisterSet

  typedef struct SMC_SIslands_MCArbDramTimingRegisterSet 
SMC_SIslands_MCArbDramTimingRegisterSet;

-struct SMC_SIslands_MCArbDramTimingRegisters
-{
+struct SMC_SIslands_MCArbDramTimingRegisters {
      uint8_t                                     arb_current;
      uint8_t                                     reserved[3];
      SMC_SIslands_MCArbDramTimingRegisterSet     data[16];
@@ -353,8 +338,7 @@ struct SMC_SIslands_MCArbDramTimingRegisters

  typedef struct SMC_SIslands_MCArbDramTimingRegisters 
SMC_SIslands_MCArbDramTimingRegisters;

-struct SMC_SISLANDS_SPLL_DIV_TABLE
-{
+struct SMC_SISLANDS_SPLL_DIV_TABLE {
      uint32_t    freq[256];
      uint32_t    ss[256];
  };
@@ -374,8 +358,7 @@ typedef struct SMC_SISLANDS_SPLL_DIV_TABLE 
SMC_SISLANDS_SPLL_DIV_TABLE;

  #define SMC_SISLANDS_DTE_MAX_TEMPERATURE_DEPENDENT_ARRAY_SIZE 16

-struct Smc_SIslands_DTE_Configuration
-{
+struct Smc_SIslands_DTE_Configuration {
      uint32_t tau[SMC_SISLANDS_DTE_MAX_FILTER_STAGES];
      uint32_t R[SMC_SISLANDS_DTE_MAX_FILTER_STAGES];
      uint32_t K;
