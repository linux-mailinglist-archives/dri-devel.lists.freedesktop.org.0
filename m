Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1881F82A9AC
	for <lists+dri-devel@lfdr.de>; Thu, 11 Jan 2024 09:52:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2734510E848;
	Thu, 11 Jan 2024 08:51:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m16.mail.163.com (m15.mail.163.com [45.254.50.219])
 by gabe.freedesktop.org (Postfix) with ESMTP id 29C4910E1A0;
 Thu, 11 Jan 2024 08:47:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=From:Subject:Date:Message-Id; bh=K5jkcFwfLSzHGD8i3r
 gXpJa3IpDSb25X30niYM6V+dU=; b=G3ht1Hrb6MQjvFAWak1VX81kWQnHU0dsXD
 Ejz74HdMXp/kuEHHpW+c4y9LeW8WO4qKB72N8zVwQVlGwKuqCq2NoYRTAi0kWC8L
 5y11Y0H8fxg7r2ztbKcuR5e0MVEUbJ7qnHdQ9kSY9gftY5Kqtd9vdEBdQ2wQu5Ts
 4k0ZuUVR0=
Received: from localhost.localdomain (unknown [182.148.14.173])
 by gzga-smtp-mta-g0-2 (Coremail) with SMTP id _____wD3XwHKqp9lkZiWAA--.65077S2;
 Thu, 11 Jan 2024 16:46:03 +0800 (CST)
From: GuoHua Chen <chenguohua_716@163.com>
To: daniel@ffwll.ch, Xinhui.Pan@amd.com, alexander.deucher@amd.com,
 airlied@gmail.com, christian.koenig@amd.com
Subject: [PATCH] drm/radeon: Clean up errors in rv770_smc.h
Date: Thu, 11 Jan 2024 08:46:00 +0000
Message-Id: <20240111084600.12587-1-chenguohua_716@163.com>
X-Mailer: git-send-email 2.17.1
X-CM-TRANSID: _____wD3XwHKqp9lkZiWAA--.65077S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxZF4rCw18Gw1xJr1DZw1UKFg_yoW5Cr47pw
 47Gas8Jr45ta4293Z7GFWUAr1YyF4DtF43uFyava43XFWjvr4jkFy0gF45AFyfGa47uFyf
 XrWDtryUZ3ZIyaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07UFdgAUUUUU=
X-Originating-IP: [182.148.14.173]
X-CM-SenderInfo: xfkh0w5xrk3tbbxrlqqrwthudrp/xtbBEA5i1mVOBlA7dAAAsY
X-Mailman-Approved-At: Thu, 11 Jan 2024 08:50:44 +0000
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
Cc: GuoHua Chen <chenguohua_716@163.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fix the following errors reported by checkpatch:

ERROR: open brace '{' following struct go on the same line
ERROR: open brace '{' following union go on the same line

Signed-off-by: GuoHua Chen <chenguohua_716@163.com>
---
 drivers/gpu/drm/radeon/rv770_smc.h | 27 +++++++++------------------
 1 file changed, 9 insertions(+), 18 deletions(-)

diff --git a/drivers/gpu/drm/radeon/rv770_smc.h b/drivers/gpu/drm/radeon/rv770_smc.h
index 3b2c963c4880..d8e8f70135f2 100644
--- a/drivers/gpu/drm/radeon/rv770_smc.h
+++ b/drivers/gpu/drm/radeon/rv770_smc.h
@@ -31,8 +31,7 @@
 
 #define RV770_SMC_PERFORMANCE_LEVELS_PER_SWSTATE    3
 
-struct RV770_SMC_SCLK_VALUE
-{
+struct RV770_SMC_SCLK_VALUE {
     uint32_t        vCG_SPLL_FUNC_CNTL;
     uint32_t        vCG_SPLL_FUNC_CNTL_2;
     uint32_t        vCG_SPLL_FUNC_CNTL_3;
@@ -43,8 +42,7 @@ struct RV770_SMC_SCLK_VALUE
 
 typedef struct RV770_SMC_SCLK_VALUE RV770_SMC_SCLK_VALUE;
 
-struct RV770_SMC_MCLK_VALUE
-{
+struct RV770_SMC_MCLK_VALUE {
     uint32_t        vMPLL_AD_FUNC_CNTL;
     uint32_t        vMPLL_AD_FUNC_CNTL_2;
     uint32_t        vMPLL_DQ_FUNC_CNTL;
@@ -59,8 +57,7 @@ struct RV770_SMC_MCLK_VALUE
 typedef struct RV770_SMC_MCLK_VALUE RV770_SMC_MCLK_VALUE;
 
 
-struct RV730_SMC_MCLK_VALUE
-{
+struct RV730_SMC_MCLK_VALUE {
     uint32_t        vMCLK_PWRMGT_CNTL;
     uint32_t        vDLL_CNTL;
     uint32_t        vMPLL_FUNC_CNTL;
@@ -73,8 +70,7 @@ struct RV730_SMC_MCLK_VALUE
 
 typedef struct RV730_SMC_MCLK_VALUE RV730_SMC_MCLK_VALUE;
 
-struct RV770_SMC_VOLTAGE_VALUE
-{
+struct RV770_SMC_VOLTAGE_VALUE {
     uint16_t             value;
     uint8_t              index;
     uint8_t              padding;
@@ -82,16 +78,14 @@ struct RV770_SMC_VOLTAGE_VALUE
 
 typedef struct RV770_SMC_VOLTAGE_VALUE RV770_SMC_VOLTAGE_VALUE;
 
-union RV7XX_SMC_MCLK_VALUE
-{
+union RV7XX_SMC_MCLK_VALUE {
     RV770_SMC_MCLK_VALUE    mclk770;
     RV730_SMC_MCLK_VALUE    mclk730;
 };
 
 typedef union RV7XX_SMC_MCLK_VALUE RV7XX_SMC_MCLK_VALUE, *LPRV7XX_SMC_MCLK_VALUE;
 
-struct RV770_SMC_HW_PERFORMANCE_LEVEL
-{
+struct RV770_SMC_HW_PERFORMANCE_LEVEL {
     uint8_t                 arbValue;
     union{
         uint8_t             seqValue;
@@ -126,8 +120,7 @@ struct RV770_SMC_HW_PERFORMANCE_LEVEL
 
 typedef struct RV770_SMC_HW_PERFORMANCE_LEVEL RV770_SMC_HW_PERFORMANCE_LEVEL;
 
-struct RV770_SMC_SWSTATE
-{
+struct RV770_SMC_SWSTATE {
     uint8_t           flags;
     uint8_t           padding1;
     uint8_t           padding2;
@@ -142,8 +135,7 @@ typedef struct RV770_SMC_SWSTATE RV770_SMC_SWSTATE;
 #define RV770_SMC_VOLTAGEMASK_VDDCI 2
 #define RV770_SMC_VOLTAGEMASK_MAX  4
 
-struct RV770_SMC_VOLTAGEMASKTABLE
-{
+struct RV770_SMC_VOLTAGEMASKTABLE {
     uint8_t  highMask[RV770_SMC_VOLTAGEMASK_MAX];
     uint32_t lowMask[RV770_SMC_VOLTAGEMASK_MAX];
 };
@@ -152,8 +144,7 @@ typedef struct RV770_SMC_VOLTAGEMASKTABLE RV770_SMC_VOLTAGEMASKTABLE;
 
 #define MAX_NO_VREG_STEPS 32
 
-struct RV770_SMC_STATETABLE
-{
+struct RV770_SMC_STATETABLE {
     uint8_t             thermalProtectType;
     uint8_t             systemFlags;
     uint8_t             maxVDDCIndexInPPTable;
-- 
2.17.1

