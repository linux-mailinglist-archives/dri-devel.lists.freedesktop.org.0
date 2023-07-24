Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3587075EEB9
	for <lists+dri-devel@lfdr.de>; Mon, 24 Jul 2023 11:08:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2DC7610E290;
	Mon, 24 Jul 2023 09:08:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.208.org (unknown [183.242.55.162])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D4E310E297
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jul 2023 09:08:22 +0000 (UTC)
Received: from mail.208.org (email.208.org [127.0.0.1])
 by mail.208.org (Postfix) with ESMTP id 4R8Z841pJBzBRx5C
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jul 2023 17:08:20 +0800 (CST)
Authentication-Results: mail.208.org (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)" header.d=208.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=208.org; h=
 content-transfer-encoding:content-type:message-id:user-agent
 :references:in-reply-to:subject:to:from:date:mime-version; s=
 dkim; t=1690189700; x=1692781701; bh=rd5XJCKeCCCstWQq8oezxVrRBtx
 3Uez3owR/99sLpv4=; b=djs+BG8BS/oEA3gUtU2Vs8S/t+VqReo+b8rt5yBVGHx
 iHxCPZTwbMxtdVlnciZDbAX0WGxJJt9Z3XMNzxub1ropHhojLDs0vLYXY+3Idc8x
 5ng32fdc0OGgXpcPVQndvxu6QxUnS1prKErEkwX3dzclqctXVIAmOVIeG0ypYi1f
 qag+sA+lq7T8Im1GVwjiKNN7RV5VG4e+TKF9n6Hf/7jCZ5n7HqGekoPNyKrd6rpP
 X3k/AmBehCd9O+yLWNB6Ucalj/GUo3b3GQw8rFsyQi96Gpr6g8TicvPfOlRUkrh6
 OnqZIRy+XJOPjz+bfjVbHSHWuUlJBrRZcL3kRZDO6Hw==
X-Virus-Scanned: amavisd-new at mail.208.org
Received: from mail.208.org ([127.0.0.1])
 by mail.208.org (mail.208.org [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id JyChrvnuzW0T for <dri-devel@lists.freedesktop.org>;
 Mon, 24 Jul 2023 17:08:20 +0800 (CST)
Received: from localhost (email.208.org [127.0.0.1])
 by mail.208.org (Postfix) with ESMTPSA id 4R8Z836nC2zBKnld;
 Mon, 24 Jul 2023 17:08:19 +0800 (CST)
MIME-Version: 1.0
Date: Mon, 24 Jul 2023 17:08:19 +0800
From: sunran001@208suo.com
To: alexander.deucher@amd.com
Subject: [PATCH] drm/amd/pm: open brace '{' following struct go on the same
 line
In-Reply-To: <20230724090624.9699-1-xujianghui@cdjrlc.com>
References: <20230724090624.9699-1-xujianghui@cdjrlc.com>
User-Agent: Roundcube Webmail
Message-ID: <5ce64e06635dbf038d73452098fd0163@208suo.com>
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
  .../amd/pm/swsmu/inc/smu_v13_0_7_pptable.h    | 21 +++++++------------
  1 file changed, 7 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/amd/pm/swsmu/inc/smu_v13_0_7_pptable.h 
b/drivers/gpu/drm/amd/pm/swsmu/inc/smu_v13_0_7_pptable.h
index eadbe0149cae..eb694f9f556d 100644
--- a/drivers/gpu/drm/amd/pm/swsmu/inc/smu_v13_0_7_pptable.h
+++ b/drivers/gpu/drm/amd/pm/swsmu/inc/smu_v13_0_7_pptable.h
@@ -41,8 +41,7 @@
  #define SMU_13_0_7_PP_OVERDRIVE_VERSION 0x83        // OverDrive 8 
Table Version 0.2
  #define SMU_13_0_7_PP_POWERSAVINGCLOCK_VERSION 0x01 // Power Saving 
Clock Table Version 1.00

-enum SMU_13_0_7_ODFEATURE_CAP
-{
+enum SMU_13_0_7_ODFEATURE_CAP {
      SMU_13_0_7_ODCAP_GFXCLK_LIMITS = 0,
      SMU_13_0_7_ODCAP_UCLK_LIMITS,
      SMU_13_0_7_ODCAP_POWER_LIMIT,
@@ -62,8 +61,7 @@ enum SMU_13_0_7_ODFEATURE_CAP
      SMU_13_0_7_ODCAP_COUNT,
  };

-enum SMU_13_0_7_ODFEATURE_ID
-{
+enum SMU_13_0_7_ODFEATURE_ID {
      SMU_13_0_7_ODFEATURE_GFXCLK_LIMITS           = 1 << 
SMU_13_0_7_ODCAP_GFXCLK_LIMITS,           //GFXCLK Limit feature
      SMU_13_0_7_ODFEATURE_UCLK_LIMITS             = 1 << 
SMU_13_0_7_ODCAP_UCLK_LIMITS,             //UCLK Limit feature
      SMU_13_0_7_ODFEATURE_POWER_LIMIT             = 1 << 
SMU_13_0_7_ODCAP_POWER_LIMIT,             //Power Limit feature
@@ -85,8 +83,7 @@ enum SMU_13_0_7_ODFEATURE_ID

  #define SMU_13_0_7_MAX_ODFEATURE 32 //Maximum Number of OD Features

-enum SMU_13_0_7_ODSETTING_ID
-{
+enum SMU_13_0_7_ODSETTING_ID {
      SMU_13_0_7_ODSETTING_GFXCLKFMAX = 0,
      SMU_13_0_7_ODSETTING_GFXCLKFMIN,
      SMU_13_0_7_ODSETTING_UCLKFMIN,
@@ -123,8 +120,7 @@ enum SMU_13_0_7_ODSETTING_ID
  };
  #define SMU_13_0_7_MAX_ODSETTING 64 //Maximum Number of ODSettings

-enum SMU_13_0_7_PWRMODE_SETTING
-{
+enum SMU_13_0_7_PWRMODE_SETTING {
      SMU_13_0_7_PMSETTING_POWER_LIMIT_QUIET = 0,
      SMU_13_0_7_PMSETTING_POWER_LIMIT_BALANCE,
      SMU_13_0_7_PMSETTING_POWER_LIMIT_TURBO,
@@ -144,8 +140,7 @@ enum SMU_13_0_7_PWRMODE_SETTING
  };
  #define SMU_13_0_7_MAX_PMSETTING 32 //Maximum Number of PowerMode 
Settings

-struct smu_13_0_7_overdrive_table
-{
+struct smu_13_0_7_overdrive_table {
      uint8_t revision;                             //Revision = 
SMU_13_0_7_PP_OVERDRIVE_VERSION
      uint8_t reserve[3];                           //Zero filled field 
reserved for future use
      uint32_t feature_count;                       //Total number of 
supported features
@@ -156,8 +151,7 @@ struct smu_13_0_7_overdrive_table
      int16_t pm_setting[SMU_13_0_7_MAX_PMSETTING]; //Optimized power 
mode feature settings
  };

-enum SMU_13_0_7_PPCLOCK_ID
-{
+enum SMU_13_0_7_PPCLOCK_ID {
      SMU_13_0_7_PPCLOCK_GFXCLK = 0,
      SMU_13_0_7_PPCLOCK_SOCCLK,
      SMU_13_0_7_PPCLOCK_UCLK,
@@ -175,8 +169,7 @@ enum SMU_13_0_7_PPCLOCK_ID
  };
  #define SMU_13_0_7_MAX_PPCLOCK 16 //Maximum Number of PP Clocks

-struct smu_13_0_7_powerplay_table
-{
+struct smu_13_0_7_powerplay_table {
      struct atom_common_table_header header; //For PLUM_BONITO, 
header.format_revision = 15, header.content_revision = 0
      uint8_t table_revision;                 //For PLUM_BONITO, 
table_revision = 2
      uint8_t padding;
