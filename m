Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A481E75BCC8
	for <lists+dri-devel@lfdr.de>; Fri, 21 Jul 2023 05:27:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A6F6410E60F;
	Fri, 21 Jul 2023 03:27:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.208.org (unknown [183.242.55.162])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DDE1410E60F
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Jul 2023 03:27:23 +0000 (UTC)
Received: from mail.208.org (email.208.org [127.0.0.1])
 by mail.208.org (Postfix) with ESMTP id 4R6Zjy5VYQzBRDtH
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Jul 2023 11:27:18 +0800 (CST)
Authentication-Results: mail.208.org (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)" header.d=208.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=208.org; h=
 content-transfer-encoding:content-type:message-id:user-agent
 :references:in-reply-to:subject:to:from:date:mime-version; s=
 dkim; t=1689910038; x=1692502039; bh=GFS1RVSDskw7M+0vgWeM0LHygVB
 jO70fllpv2LJSd1k=; b=yXTCfkw3FIFTiJtmRfrphb0qpChmyyT/UXr6szwaRcb
 WVS+Q8RHbxpbJekhbcZ1KN6CQWuxSsgnSC2b7EqNgAQH3SxMKHkbj6fX1jChqBJu
 pdQfshkyvOqhGCSAeW2LMgOnwG+dLrx751wIAtkrCAdF7Ta5d7Z6IVgUnp4/MK+2
 Ssxb0citSIEOjRE/2wDu23VOF3aLIX5COjb/C8I5SAJOIzhcynSV5hJmvlyVMg+8
 mJmCu/+lhQ+vlnbo8ZkAqtO88E+WjTqKkpXz+LCEXDO1hqz9Bc2geYo2bnvrD9OV
 zK1gYQUKgUr1hXs5EIjU1CQPLKA4F3UqJywU0uO1ckA==
X-Virus-Scanned: amavisd-new at mail.208.org
Received: from mail.208.org ([127.0.0.1])
 by mail.208.org (mail.208.org [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id 6nlKmvEdntym for <dri-devel@lists.freedesktop.org>;
 Fri, 21 Jul 2023 11:27:18 +0800 (CST)
Received: from localhost (email.208.org [127.0.0.1])
 by mail.208.org (Postfix) with ESMTPSA id 4R6Zjy2tzYzBRDrd;
 Fri, 21 Jul 2023 11:27:18 +0800 (CST)
MIME-Version: 1.0
Date: Fri, 21 Jul 2023 11:27:18 +0800
From: sunran001@208suo.com
To: alexander.deucher@amd.com, airlied@gmail.com, daniel@ffwll.ch
Subject: [PATCH] drm/amd/pm: open brace '{' following struct go on the same
 line
In-Reply-To: <20230721032537.4727-1-xujianghui@cdjrlc.com>
References: <20230721032537.4727-1-xujianghui@cdjrlc.com>
User-Agent: Roundcube Webmail
Message-ID: <9bb658b64109e1e60afdf82906ae3e03@208suo.com>
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
  .../gpu/drm/amd/pm/inc/smu_v13_0_0_pptable.h  | 21 +++++++------------
  1 file changed, 7 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/amd/pm/inc/smu_v13_0_0_pptable.h 
b/drivers/gpu/drm/amd/pm/inc/smu_v13_0_0_pptable.h
index 1dc7a065a6d4..251ed011b3b0 100644
--- a/drivers/gpu/drm/amd/pm/inc/smu_v13_0_0_pptable.h
+++ b/drivers/gpu/drm/amd/pm/inc/smu_v13_0_0_pptable.h
@@ -41,8 +41,7 @@
  #define SMU_13_0_0_PP_OVERDRIVE_VERSION 0x83        // OverDrive 8 
Table Version 0.2
  #define SMU_13_0_0_PP_POWERSAVINGCLOCK_VERSION 0x01 // Power Saving 
Clock Table Version 1.00

-enum SMU_13_0_0_ODFEATURE_CAP
-{
+enum SMU_13_0_0_ODFEATURE_CAP {
      SMU_13_0_0_ODCAP_GFXCLK_LIMITS = 0,
      SMU_13_0_0_ODCAP_UCLK_LIMITS,
      SMU_13_0_0_ODCAP_POWER_LIMIT,
@@ -62,8 +61,7 @@ enum SMU_13_0_0_ODFEATURE_CAP
      SMU_13_0_0_ODCAP_COUNT,
  };

-enum SMU_13_0_0_ODFEATURE_ID
-{
+enum SMU_13_0_0_ODFEATURE_ID {
      SMU_13_0_0_ODFEATURE_GFXCLK_LIMITS           = 1 << 
SMU_13_0_0_ODCAP_GFXCLK_LIMITS,           //GFXCLK Limit feature
      SMU_13_0_0_ODFEATURE_UCLK_LIMITS             = 1 << 
SMU_13_0_0_ODCAP_UCLK_LIMITS,             //UCLK Limit feature
      SMU_13_0_0_ODFEATURE_POWER_LIMIT             = 1 << 
SMU_13_0_0_ODCAP_POWER_LIMIT,             //Power Limit feature
@@ -85,8 +83,7 @@ enum SMU_13_0_0_ODFEATURE_ID

  #define SMU_13_0_0_MAX_ODFEATURE 32 //Maximum Number of OD Features

-enum SMU_13_0_0_ODSETTING_ID
-{
+enum SMU_13_0_0_ODSETTING_ID {
      SMU_13_0_0_ODSETTING_GFXCLKFMAX = 0,
      SMU_13_0_0_ODSETTING_GFXCLKFMIN,
      SMU_13_0_0_ODSETTING_UCLKFMIN,
@@ -123,8 +120,7 @@ enum SMU_13_0_0_ODSETTING_ID
  };
  #define SMU_13_0_0_MAX_ODSETTING 64 //Maximum Number of ODSettings

-enum SMU_13_0_0_PWRMODE_SETTING
-{
+enum SMU_13_0_0_PWRMODE_SETTING {
      SMU_13_0_0_PMSETTING_POWER_LIMIT_QUIET = 0,
      SMU_13_0_0_PMSETTING_POWER_LIMIT_BALANCE,
      SMU_13_0_0_PMSETTING_POWER_LIMIT_TURBO,
@@ -144,8 +140,7 @@ enum SMU_13_0_0_PWRMODE_SETTING
  };
  #define SMU_13_0_0_MAX_PMSETTING 32 //Maximum Number of PowerMode 
Settings

-struct smu_13_0_0_overdrive_table
-{
+struct smu_13_0_0_overdrive_table {
      uint8_t revision;                             //Revision = 
SMU_13_0_0_PP_OVERDRIVE_VERSION
      uint8_t reserve[3];                           //Zero filled field 
reserved for future use
      uint32_t feature_count;                       //Total number of 
supported features
@@ -156,8 +151,7 @@ struct smu_13_0_0_overdrive_table
      int16_t pm_setting[SMU_13_0_0_MAX_PMSETTING]; //Optimized power 
mode feature settings
  };

-enum SMU_13_0_0_PPCLOCK_ID
-{
+enum SMU_13_0_0_PPCLOCK_ID {
      SMU_13_0_0_PPCLOCK_GFXCLK = 0,
      SMU_13_0_0_PPCLOCK_SOCCLK,
      SMU_13_0_0_PPCLOCK_UCLK,
@@ -175,8 +169,7 @@ enum SMU_13_0_0_PPCLOCK_ID
  };
  #define SMU_13_0_0_MAX_PPCLOCK 16 //Maximum Number of PP Clocks

-struct smu_13_0_0_powerplay_table
-{
+struct smu_13_0_0_powerplay_table {
      struct atom_common_table_header header; //For SMU13, 
header.format_revision = 15, header.content_revision = 0
      uint8_t table_revision;                 //For SMU13, table_revision 
= 2
      uint8_t padding;
