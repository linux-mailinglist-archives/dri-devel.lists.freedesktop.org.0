Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F3DA7532D1
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jul 2023 09:15:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F07B410E7DE;
	Fri, 14 Jul 2023 07:14:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.208.org (unknown [183.242.55.162])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE4D510E118
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jul 2023 05:24:36 +0000 (UTC)
Received: from mail.208.org (email.208.org [127.0.0.1])
 by mail.208.org (Postfix) with ESMTP id 4R2KfT3DljzBR9sQ
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jul 2023 13:24:33 +0800 (CST)
Authentication-Results: mail.208.org (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)" header.d=208.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=208.org; h=
 content-transfer-encoding:content-type:message-id:user-agent
 :references:in-reply-to:subject:to:from:date:mime-version; s=
 dkim; t=1689312273; x=1691904274; bh=MB2X2voEI1RI/eW6w5uT1Nbdk9m
 LRbF+U3iPFy4BcKM=; b=GY7MRzAKFT+97mwY35NHFtzSn9WVphyGH+hrUtrbLSq
 c2Jb751u1Z7UtLK3+WQFpjZmrxuTefy0/+39B4WuBn5ac+ZWt88fdtNqgtG2Sa55
 UB0jTGXraTNRWulIPKJcJKodgRX5QlLha/DfgpQxZjVZsWNS7XDMQgeP6GTSElPu
 QnCQhHDKwfkCY6166HsAGOfBAWU/Gv6CHt21RK27I5YXqQvj2O11rKlPd5P1CR+o
 etJZnApt82GuZG4dGQmqb50mo03lWsqz+7Pcy5KGbXLuIImxLnadALnrY+6XEJxS
 CEahcHGgmpCanhWb6GLBDlJ2XnoWNdSruRwvNdskYIA==
X-Virus-Scanned: amavisd-new at mail.208.org
Received: from mail.208.org ([127.0.0.1])
 by mail.208.org (mail.208.org [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id Xto3UiXTl1CF for <dri-devel@lists.freedesktop.org>;
 Fri, 14 Jul 2023 13:24:33 +0800 (CST)
Received: from localhost (email.208.org [127.0.0.1])
 by mail.208.org (Postfix) with ESMTPSA id 4R2KfS6qSWzBR5C9;
 Fri, 14 Jul 2023 13:24:32 +0800 (CST)
MIME-Version: 1.0
Date: Fri, 14 Jul 2023 13:24:32 +0800
From: shijie001@208suo.com
To: alexander.deucher@amd.com, christian.koenig@amd.com, Xinhui.Pan@amd.com,
 airlied@gmail.com, daniel@ffwll.ch
Subject: [PATCH] drm/radeon: ERROR: open brace '{' following struct go on the
 same line
In-Reply-To: <tencent_1C2FF78DB4C3129E02E585FC536F6FB07809@qq.com>
References: <tencent_1C2FF78DB4C3129E02E585FC536F6FB07809@qq.com>
User-Agent: Roundcube Webmail
Message-ID: <f4a5c6ecc5679fb82df04eb0a06d04b8@208suo.com>
X-Sender: shijie001@208suo.com
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Fri, 14 Jul 2023 07:14:54 +0000
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

Fix seventeen occurrences of the checkpatch.pl error:
ERROR: open brace '{' following struct go on the same line

Signed-off-by: Jie Shi <shijie001@208suo.com>
---
  drivers/gpu/drm/radeon/smu7_discrete.h | 51 +++++++++-----------------
  1 file changed, 17 insertions(+), 34 deletions(-)

diff --git a/drivers/gpu/drm/radeon/smu7_discrete.h 
b/drivers/gpu/drm/radeon/smu7_discrete.h
index 0b0b404ff091..1f63cbbd6515 100644
--- a/drivers/gpu/drm/radeon/smu7_discrete.h
+++ b/drivers/gpu/drm/radeon/smu7_discrete.h
@@ -35,8 +35,7 @@
  #define SMU7_NUM_GPU_TES 1
  #define SMU7_NUM_NON_TES 2

-struct SMU7_SoftRegisters
-{
+struct SMU7_SoftRegisters {
      uint32_t        RefClockFrequency;
      uint32_t        PmTimerP;
      uint32_t        FeatureEnables;
@@ -89,8 +88,7 @@ struct SMU7_SoftRegisters

  typedef struct SMU7_SoftRegisters SMU7_SoftRegisters;

-struct SMU7_Discrete_VoltageLevel
-{
+struct SMU7_Discrete_VoltageLevel {
      uint16_t    Voltage;
      uint16_t    StdVoltageHiSidd;
      uint16_t    StdVoltageLoSidd;
@@ -100,8 +98,7 @@ struct SMU7_Discrete_VoltageLevel

  typedef struct SMU7_Discrete_VoltageLevel SMU7_Discrete_VoltageLevel;

-struct SMU7_Discrete_GraphicsLevel
-{
+struct SMU7_Discrete_GraphicsLevel {
      uint32_t    Flags;
      uint32_t    MinVddc;
      uint32_t    MinVddcPhases;
@@ -131,8 +128,7 @@ struct SMU7_Discrete_GraphicsLevel

  typedef struct SMU7_Discrete_GraphicsLevel SMU7_Discrete_GraphicsLevel;

-struct SMU7_Discrete_ACPILevel
-{
+struct SMU7_Discrete_ACPILevel {
      uint32_t    Flags;
      uint32_t    MinVddc;
      uint32_t    MinVddcPhases;
@@ -153,8 +149,7 @@ struct SMU7_Discrete_ACPILevel

  typedef struct SMU7_Discrete_ACPILevel SMU7_Discrete_ACPILevel;

-struct SMU7_Discrete_Ulv
-{
+struct SMU7_Discrete_Ulv {
      uint32_t    CcPwrDynRm;
      uint32_t    CcPwrDynRm1;
      uint16_t    VddcOffset;
@@ -165,8 +160,7 @@ struct SMU7_Discrete_Ulv

  typedef struct SMU7_Discrete_Ulv SMU7_Discrete_Ulv;

-struct SMU7_Discrete_MemoryLevel
-{
+struct SMU7_Discrete_MemoryLevel {
      uint32_t    MinVddc;
      uint32_t    MinVddcPhases;
      uint32_t    MinVddci;
@@ -206,8 +200,7 @@ struct SMU7_Discrete_MemoryLevel

  typedef struct SMU7_Discrete_MemoryLevel SMU7_Discrete_MemoryLevel;

-struct SMU7_Discrete_LinkLevel
-{
+struct SMU7_Discrete_LinkLevel {
      uint8_t     PcieGenSpeed;
      uint8_t     PcieLaneCount;
      uint8_t     EnabledForActivity;
@@ -220,8 +213,7 @@ struct SMU7_Discrete_LinkLevel
  typedef struct SMU7_Discrete_LinkLevel SMU7_Discrete_LinkLevel;

-struct SMU7_Discrete_MCArbDramTimingTableEntry
-{
+struct SMU7_Discrete_MCArbDramTimingTableEntry {
      uint32_t McArbDramTiming;
      uint32_t McArbDramTiming2;
      uint8_t  McArbBurstTime;
@@ -230,15 +222,13 @@ struct SMU7_Discrete_MCArbDramTimingTableEntry

  typedef struct SMU7_Discrete_MCArbDramTimingTableEntry 
SMU7_Discrete_MCArbDramTimingTableEntry;

-struct SMU7_Discrete_MCArbDramTimingTable
-{
+struct SMU7_Discrete_MCArbDramTimingTable {
      SMU7_Discrete_MCArbDramTimingTableEntry 
entries[SMU__NUM_SCLK_DPM_STATE][SMU__NUM_MCLK_DPM_LEVELS];
  };

  typedef struct SMU7_Discrete_MCArbDramTimingTable 
SMU7_Discrete_MCArbDramTimingTable;

-struct SMU7_Discrete_UvdLevel
-{
+struct SMU7_Discrete_UvdLevel {
      uint32_t VclkFrequency;
      uint32_t DclkFrequency;
      uint16_t MinVddc;
@@ -250,8 +240,7 @@ struct SMU7_Discrete_UvdLevel

  typedef struct SMU7_Discrete_UvdLevel SMU7_Discrete_UvdLevel;

-struct SMU7_Discrete_ExtClkLevel
-{
+struct SMU7_Discrete_ExtClkLevel {
      uint32_t Frequency;
      uint16_t MinVoltage;
      uint8_t  MinPhases;
@@ -260,8 +249,7 @@ struct SMU7_Discrete_ExtClkLevel

  typedef struct SMU7_Discrete_ExtClkLevel SMU7_Discrete_ExtClkLevel;

-struct SMU7_Discrete_StateInfo
-{
+struct SMU7_Discrete_StateInfo {
      uint32_t SclkFrequency;
      uint32_t MclkFrequency;
      uint32_t VclkFrequency;
@@ -285,8 +273,7 @@ struct SMU7_Discrete_StateInfo
  typedef struct SMU7_Discrete_StateInfo SMU7_Discrete_StateInfo;

-struct SMU7_Discrete_DpmTable
-{
+struct SMU7_Discrete_DpmTable {
      SMU7_PIDController                  GraphicsPIDController;
      SMU7_PIDController                  MemoryPIDController;
      SMU7_PIDController                  LinkPIDController;
@@ -406,23 +393,20 @@ typedef struct SMU7_Discrete_DpmTable 
SMU7_Discrete_DpmTable;
  #define SMU7_DISCRETE_MC_REGISTER_ARRAY_SIZE 16
  #define SMU7_DISCRETE_MC_REGISTER_ARRAY_SET_COUNT 
SMU7_MAX_LEVELS_MEMORY

-struct SMU7_Discrete_MCRegisterAddress
-{
+struct SMU7_Discrete_MCRegisterAddress {
      uint16_t s0;
      uint16_t s1;
  };

  typedef struct SMU7_Discrete_MCRegisterAddress 
SMU7_Discrete_MCRegisterAddress;

-struct SMU7_Discrete_MCRegisterSet
-{
+struct SMU7_Discrete_MCRegisterSet {
      uint32_t value[SMU7_DISCRETE_MC_REGISTER_ARRAY_SIZE];
  };

  typedef struct SMU7_Discrete_MCRegisterSet SMU7_Discrete_MCRegisterSet;

-struct SMU7_Discrete_MCRegisters
-{
+struct SMU7_Discrete_MCRegisters {
      uint8_t                             last;
      uint8_t                             reserved[3];
      SMU7_Discrete_MCRegisterAddress     
address[SMU7_DISCRETE_MC_REGISTER_ARRAY_SIZE];
@@ -431,8 +415,7 @@ struct SMU7_Discrete_MCRegisters

  typedef struct SMU7_Discrete_MCRegisters SMU7_Discrete_MCRegisters;

-struct SMU7_Discrete_FanTable
-{
+struct SMU7_Discrete_FanTable {
      uint16_t FdoMode;
      int16_t  TempMin;
      int16_t  TempMed;
