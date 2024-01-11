Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E5C282A99A
	for <lists+dri-devel@lfdr.de>; Thu, 11 Jan 2024 09:52:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 08D3710E85A;
	Thu, 11 Jan 2024 08:50:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m16.mail.163.com (m15.mail.163.com [45.254.50.220])
 by gabe.freedesktop.org (Postfix) with ESMTP id 63DB310E7D7
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Jan 2024 07:23:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=From:Subject:Date:Message-Id; bh=9lukI8SBkQG9zpqO5L
 6Qao513Fv/h55G2lHZZ61xhh4=; b=W7p/7LNdekAnk7oAL+0y7h9tYwHFc5veLz
 IPl9BujWYYmwVYidH1Yi7+D6/ttxfIDhW1XBFqZzxDTtzErlIn9vgrgq3oLKihbr
 ez/Ae14VHFG1MM6t0VXcJkeeuj8VaT2xk47o+XBl2ejE8bTc4DGXrs4sB/mAEPLM
 Oj4BBg6Lg=
Received: from localhost.localdomain (unknown [182.148.14.173])
 by gzga-smtp-mta-g0-5 (Coremail) with SMTP id _____wDHT6hXl59lBIyRAA--.19755S2;
 Thu, 11 Jan 2024 15:23:03 +0800 (CST)
From: GuoHua Chen <chenguohua_716@163.com>
To: alexander.deucher@amd.com, Xinhui.Pan@amd.com, daniel@ffwll.ch,
 christian.koenig@amd.com, airlied@gmail.com
Subject: [PATCH] drm/radeon: Clean up errors in si_dpm.c
Date: Thu, 11 Jan 2024 07:23:01 +0000
Message-Id: <20240111072301.10229-1-chenguohua_716@163.com>
X-Mailer: git-send-email 2.17.1
X-CM-TRANSID: _____wDHT6hXl59lBIyRAA--.19755S2
X-Coremail-Antispam: 1Uf129KBjvAXoWfGF45WrWUJw18CF4DZFy3XFb_yoW8Xr4xKo
 WfJFy8Ja1rur1xZ34xXrnxJF4ava9Yy3Z5uwnrJws5u3W2qFWYkFy7Xws5A3W7W345Xw1a
 y3W7Kay3XrWrAay3n29KB7ZKAUJUUUU8529EdanIXcx71UUUUU7v73VFW2AGmfu7bjvjm3
 AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxU1T5lUUUUU
X-Originating-IP: [182.148.14.173]
X-CM-SenderInfo: xfkh0w5xrk3tbbxrlqqrwthudrp/1tbiqBxi1mVOBk8XmgAAsv
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
Cc: GuoHua Chen <chenguohua_716@163.com>, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fix the following errors reported by checkpatch:

ERROR: that open brace { should be on the previous line

Signed-off-by: GuoHua Chen <chenguohua_716@163.com>
---
 drivers/gpu/drm/radeon/si_dpm.c | 132 +++++++++++---------------------
 1 file changed, 44 insertions(+), 88 deletions(-)

diff --git a/drivers/gpu/drm/radeon/si_dpm.c b/drivers/gpu/drm/radeon/si_dpm.c
index fbf968e3f6d7..9deb91970d4d 100644
--- a/drivers/gpu/drm/radeon/si_dpm.c
+++ b/drivers/gpu/drm/radeon/si_dpm.c
@@ -46,8 +46,7 @@
 
 #define SCLK_MIN_DEEPSLEEP_FREQ     1350
 
-static const struct si_cac_config_reg cac_weights_tahiti[] =
-{
+static const struct si_cac_config_reg cac_weights_tahiti[] = {
 	{ 0x0, 0x0000ffff, 0, 0xc, SISLANDS_CACCONFIG_CGIND },
 	{ 0x0, 0xffff0000, 16, 0x0, SISLANDS_CACCONFIG_CGIND },
 	{ 0x1, 0x0000ffff, 0, 0x101, SISLANDS_CACCONFIG_CGIND },
@@ -111,8 +110,7 @@ static const struct si_cac_config_reg cac_weights_tahiti[] =
 	{ 0xFFFFFFFF }
 };
 
-static const struct si_cac_config_reg lcac_tahiti[] =
-{
+static const struct si_cac_config_reg lcac_tahiti[] = {
 	{ 0x143, 0x0001fffe, 1, 0x3, SISLANDS_CACCONFIG_CGIND },
 	{ 0x143, 0x00000001, 0, 0x1, SISLANDS_CACCONFIG_CGIND },
 	{ 0x146, 0x0001fffe, 1, 0x3, SISLANDS_CACCONFIG_CGIND },
@@ -203,13 +201,11 @@ static const struct si_cac_config_reg lcac_tahiti[] =
 
 };
 
-static const struct si_cac_config_reg cac_override_tahiti[] =
-{
+static const struct si_cac_config_reg cac_override_tahiti[] = {
 	{ 0xFFFFFFFF }
 };
 
-static const struct si_powertune_data powertune_data_tahiti =
-{
+static const struct si_powertune_data powertune_data_tahiti = {
 	((1 << 16) | 27027),
 	6,
 	0,
@@ -239,8 +235,7 @@ static const struct si_powertune_data powertune_data_tahiti =
 	true
 };
 
-static const struct si_dte_data dte_data_tahiti =
-{
+static const struct si_dte_data dte_data_tahiti = {
 	{ 1159409, 0, 0, 0, 0 },
 	{ 777, 0, 0, 0, 0 },
 	2,
@@ -257,8 +252,7 @@ static const struct si_dte_data dte_data_tahiti =
 	false
 };
 
-static const struct si_dte_data dte_data_tahiti_pro =
-{
+static const struct si_dte_data dte_data_tahiti_pro = {
 	{ 0x1E8480, 0x3D0900, 0x989680, 0x2625A00, 0x0 },
 	{ 0x0, 0x0, 0x0, 0x0, 0x0 },
 	5,
@@ -275,8 +269,7 @@ static const struct si_dte_data dte_data_tahiti_pro =
 	true
 };
 
-static const struct si_dte_data dte_data_new_zealand =
-{
+static const struct si_dte_data dte_data_new_zealand = {
 	{ 0x1E8480, 0x3D0900, 0x989680, 0x2625A00, 0 },
 	{ 0x29B, 0x3E9, 0x537, 0x7D2, 0 },
 	0x5,
@@ -293,8 +286,7 @@ static const struct si_dte_data dte_data_new_zealand =
 	true
 };
 
-static const struct si_dte_data dte_data_aruba_pro =
-{
+static const struct si_dte_data dte_data_aruba_pro = {
 	{ 0x1E8480, 0x3D0900, 0x989680, 0x2625A00, 0x0 },
 	{ 0x0, 0x0, 0x0, 0x0, 0x0 },
 	5,
@@ -311,8 +303,7 @@ static const struct si_dte_data dte_data_aruba_pro =
 	true
 };
 
-static const struct si_dte_data dte_data_malta =
-{
+static const struct si_dte_data dte_data_malta = {
 	{ 0x1E8480, 0x3D0900, 0x989680, 0x2625A00, 0x0 },
 	{ 0x0, 0x0, 0x0, 0x0, 0x0 },
 	5,
@@ -329,8 +320,7 @@ static const struct si_dte_data dte_data_malta =
 	true
 };
 
-static struct si_cac_config_reg cac_weights_pitcairn[] =
-{
+static struct si_cac_config_reg cac_weights_pitcairn[] = {
 	{ 0x0, 0x0000ffff, 0, 0x8a, SISLANDS_CACCONFIG_CGIND },
 	{ 0x0, 0xffff0000, 16, 0x0, SISLANDS_CACCONFIG_CGIND },
 	{ 0x1, 0x0000ffff, 0, 0x0, SISLANDS_CACCONFIG_CGIND },
@@ -394,8 +384,7 @@ static struct si_cac_config_reg cac_weights_pitcairn[] =
 	{ 0xFFFFFFFF }
 };
 
-static const struct si_cac_config_reg lcac_pitcairn[] =
-{
+static const struct si_cac_config_reg lcac_pitcairn[] = {
 	{ 0x98, 0x0001fffe, 1, 0x2, SISLANDS_CACCONFIG_CGIND },
 	{ 0x98, 0x00000001, 0, 0x1, SISLANDS_CACCONFIG_CGIND },
 	{ 0x104, 0x0001fffe, 1, 0x2, SISLANDS_CACCONFIG_CGIND },
@@ -485,13 +474,11 @@ static const struct si_cac_config_reg lcac_pitcairn[] =
 	{ 0xFFFFFFFF }
 };
 
-static const struct si_cac_config_reg cac_override_pitcairn[] =
-{
+static const struct si_cac_config_reg cac_override_pitcairn[] = {
 	{ 0xFFFFFFFF }
 };
 
-static const struct si_powertune_data powertune_data_pitcairn =
-{
+static const struct si_powertune_data powertune_data_pitcairn = {
 	((1 << 16) | 27027),
 	5,
 	0,
@@ -521,8 +508,7 @@ static const struct si_powertune_data powertune_data_pitcairn =
 	true
 };
 
-static const struct si_dte_data dte_data_pitcairn =
-{
+static const struct si_dte_data dte_data_pitcairn = {
 	{ 0, 0, 0, 0, 0 },
 	{ 0, 0, 0, 0, 0 },
 	0,
@@ -539,8 +525,7 @@ static const struct si_dte_data dte_data_pitcairn =
 	false
 };
 
-static const struct si_dte_data dte_data_curacao_xt =
-{
+static const struct si_dte_data dte_data_curacao_xt = {
 	{ 0x1E8480, 0x3D0900, 0x989680, 0x2625A00, 0x0 },
 	{ 0x0, 0x0, 0x0, 0x0, 0x0 },
 	5,
@@ -557,8 +542,7 @@ static const struct si_dte_data dte_data_curacao_xt =
 	true
 };
 
-static const struct si_dte_data dte_data_curacao_pro =
-{
+static const struct si_dte_data dte_data_curacao_pro = {
 	{ 0x1E8480, 0x3D0900, 0x989680, 0x2625A00, 0x0 },
 	{ 0x0, 0x0, 0x0, 0x0, 0x0 },
 	5,
@@ -575,8 +559,7 @@ static const struct si_dte_data dte_data_curacao_pro =
 	true
 };
 
-static const struct si_dte_data dte_data_neptune_xt =
-{
+static const struct si_dte_data dte_data_neptune_xt = {
 	{ 0x1E8480, 0x3D0900, 0x989680, 0x2625A00, 0x0 },
 	{ 0x0, 0x0, 0x0, 0x0, 0x0 },
 	5,
@@ -593,8 +576,7 @@ static const struct si_dte_data dte_data_neptune_xt =
 	true
 };
 
-static const struct si_cac_config_reg cac_weights_chelsea_pro[] =
-{
+static const struct si_cac_config_reg cac_weights_chelsea_pro[] = {
 	{ 0x0, 0x0000ffff, 0, 0x82, SISLANDS_CACCONFIG_CGIND },
 	{ 0x0, 0xffff0000, 16, 0x4F, SISLANDS_CACCONFIG_CGIND },
 	{ 0x1, 0x0000ffff, 0, 0x153, SISLANDS_CACCONFIG_CGIND },
@@ -658,8 +640,7 @@ static const struct si_cac_config_reg cac_weights_chelsea_pro[] =
 	{ 0xFFFFFFFF }
 };
 
-static const struct si_cac_config_reg cac_weights_chelsea_xt[] =
-{
+static const struct si_cac_config_reg cac_weights_chelsea_xt[] = {
 	{ 0x0, 0x0000ffff, 0, 0x82, SISLANDS_CACCONFIG_CGIND },
 	{ 0x0, 0xffff0000, 16, 0x4F, SISLANDS_CACCONFIG_CGIND },
 	{ 0x1, 0x0000ffff, 0, 0x153, SISLANDS_CACCONFIG_CGIND },
@@ -723,8 +704,7 @@ static const struct si_cac_config_reg cac_weights_chelsea_xt[] =
 	{ 0xFFFFFFFF }
 };
 
-static const struct si_cac_config_reg cac_weights_heathrow[] =
-{
+static const struct si_cac_config_reg cac_weights_heathrow[] = {
 	{ 0x0, 0x0000ffff, 0, 0x82, SISLANDS_CACCONFIG_CGIND },
 	{ 0x0, 0xffff0000, 16, 0x4F, SISLANDS_CACCONFIG_CGIND },
 	{ 0x1, 0x0000ffff, 0, 0x153, SISLANDS_CACCONFIG_CGIND },
@@ -788,8 +768,7 @@ static const struct si_cac_config_reg cac_weights_heathrow[] =
 	{ 0xFFFFFFFF }
 };
 
-static const struct si_cac_config_reg cac_weights_cape_verde_pro[] =
-{
+static const struct si_cac_config_reg cac_weights_cape_verde_pro[] = {
 	{ 0x0, 0x0000ffff, 0, 0x82, SISLANDS_CACCONFIG_CGIND },
 	{ 0x0, 0xffff0000, 16, 0x4F, SISLANDS_CACCONFIG_CGIND },
 	{ 0x1, 0x0000ffff, 0, 0x153, SISLANDS_CACCONFIG_CGIND },
@@ -853,8 +832,7 @@ static const struct si_cac_config_reg cac_weights_cape_verde_pro[] =
 	{ 0xFFFFFFFF }
 };
 
-static const struct si_cac_config_reg cac_weights_cape_verde[] =
-{
+static const struct si_cac_config_reg cac_weights_cape_verde[] = {
 	{ 0x0, 0x0000ffff, 0, 0x82, SISLANDS_CACCONFIG_CGIND },
 	{ 0x0, 0xffff0000, 16, 0x4F, SISLANDS_CACCONFIG_CGIND },
 	{ 0x1, 0x0000ffff, 0, 0x153, SISLANDS_CACCONFIG_CGIND },
@@ -918,8 +896,7 @@ static const struct si_cac_config_reg cac_weights_cape_verde[] =
 	{ 0xFFFFFFFF }
 };
 
-static const struct si_cac_config_reg lcac_cape_verde[] =
-{
+static const struct si_cac_config_reg lcac_cape_verde[] = {
 	{ 0x98, 0x0001fffe, 1, 0x2, SISLANDS_CACCONFIG_CGIND },
 	{ 0x98, 0x00000001, 0, 0x1, SISLANDS_CACCONFIG_CGIND },
 	{ 0x104, 0x0001fffe, 1, 0x2, SISLANDS_CACCONFIG_CGIND },
@@ -977,13 +954,11 @@ static const struct si_cac_config_reg lcac_cape_verde[] =
 	{ 0xFFFFFFFF }
 };
 
-static const struct si_cac_config_reg cac_override_cape_verde[] =
-{
+static const struct si_cac_config_reg cac_override_cape_verde[] = {
 	{ 0xFFFFFFFF }
 };
 
-static const struct si_powertune_data powertune_data_cape_verde =
-{
+static const struct si_powertune_data powertune_data_cape_verde = {
 	((1 << 16) | 0x6993),
 	5,
 	0,
@@ -1013,8 +988,7 @@ static const struct si_powertune_data powertune_data_cape_verde =
 	true
 };
 
-static const struct si_dte_data dte_data_cape_verde =
-{
+static const struct si_dte_data dte_data_cape_verde = {
 	{ 0, 0, 0, 0, 0 },
 	{ 0, 0, 0, 0, 0 },
 	0,
@@ -1031,8 +1005,7 @@ static const struct si_dte_data dte_data_cape_verde =
 	false
 };
 
-static const struct si_dte_data dte_data_venus_xtx =
-{
+static const struct si_dte_data dte_data_venus_xtx = {
 	{ 0x1E8480, 0x3D0900, 0x989680, 0x2625A00, 0x0 },
 	{ 0x71C, 0xAAB, 0xE39, 0x11C7, 0x0 },
 	5,
@@ -1049,8 +1022,7 @@ static const struct si_dte_data dte_data_venus_xtx =
 	true
 };
 
-static const struct si_dte_data dte_data_venus_xt =
-{
+static const struct si_dte_data dte_data_venus_xt = {
 	{ 0x1E8480, 0x3D0900, 0x989680, 0x2625A00, 0x0 },
 	{ 0xBDA, 0x11C7, 0x17B4, 0x1DA1, 0x0 },
 	5,
@@ -1067,8 +1039,7 @@ static const struct si_dte_data dte_data_venus_xt =
 	true
 };
 
-static const struct si_dte_data dte_data_venus_pro =
-{
+static const struct si_dte_data dte_data_venus_pro = {
 	{  0x1E8480, 0x3D0900, 0x989680, 0x2625A00, 0x0 },
 	{ 0x11C7, 0x1AAB, 0x238E, 0x2C72, 0x0 },
 	5,
@@ -1085,8 +1056,7 @@ static const struct si_dte_data dte_data_venus_pro =
 	true
 };
 
-static struct si_cac_config_reg cac_weights_oland[] =
-{
+static struct si_cac_config_reg cac_weights_oland[] = {
 	{ 0x0, 0x0000ffff, 0, 0x82, SISLANDS_CACCONFIG_CGIND },
 	{ 0x0, 0xffff0000, 16, 0x4F, SISLANDS_CACCONFIG_CGIND },
 	{ 0x1, 0x0000ffff, 0, 0x153, SISLANDS_CACCONFIG_CGIND },
@@ -1150,8 +1120,7 @@ static struct si_cac_config_reg cac_weights_oland[] =
 	{ 0xFFFFFFFF }
 };
 
-static const struct si_cac_config_reg cac_weights_mars_pro[] =
-{
+static const struct si_cac_config_reg cac_weights_mars_pro[] = {
 	{ 0x0, 0x0000ffff, 0, 0x43, SISLANDS_CACCONFIG_CGIND },
 	{ 0x0, 0xffff0000, 16, 0x29, SISLANDS_CACCONFIG_CGIND },
 	{ 0x1, 0x0000ffff, 0, 0xAF, SISLANDS_CACCONFIG_CGIND },
@@ -1215,8 +1184,7 @@ static const struct si_cac_config_reg cac_weights_mars_pro[] =
 	{ 0xFFFFFFFF }
 };
 
-static const struct si_cac_config_reg cac_weights_mars_xt[] =
-{
+static const struct si_cac_config_reg cac_weights_mars_xt[] = {
 	{ 0x0, 0x0000ffff, 0, 0x43, SISLANDS_CACCONFIG_CGIND },
 	{ 0x0, 0xffff0000, 16, 0x29, SISLANDS_CACCONFIG_CGIND },
 	{ 0x1, 0x0000ffff, 0, 0xAF, SISLANDS_CACCONFIG_CGIND },
@@ -1280,8 +1248,7 @@ static const struct si_cac_config_reg cac_weights_mars_xt[] =
 	{ 0xFFFFFFFF }
 };
 
-static const struct si_cac_config_reg cac_weights_oland_pro[] =
-{
+static const struct si_cac_config_reg cac_weights_oland_pro[] = {
 	{ 0x0, 0x0000ffff, 0, 0x43, SISLANDS_CACCONFIG_CGIND },
 	{ 0x0, 0xffff0000, 16, 0x29, SISLANDS_CACCONFIG_CGIND },
 	{ 0x1, 0x0000ffff, 0, 0xAF, SISLANDS_CACCONFIG_CGIND },
@@ -1345,8 +1312,7 @@ static const struct si_cac_config_reg cac_weights_oland_pro[] =
 	{ 0xFFFFFFFF }
 };
 
-static const struct si_cac_config_reg cac_weights_oland_xt[] =
-{
+static const struct si_cac_config_reg cac_weights_oland_xt[] = {
 	{ 0x0, 0x0000ffff, 0, 0x43, SISLANDS_CACCONFIG_CGIND },
 	{ 0x0, 0xffff0000, 16, 0x29, SISLANDS_CACCONFIG_CGIND },
 	{ 0x1, 0x0000ffff, 0, 0xAF, SISLANDS_CACCONFIG_CGIND },
@@ -1410,8 +1376,7 @@ static const struct si_cac_config_reg cac_weights_oland_xt[] =
 	{ 0xFFFFFFFF }
 };
 
-static const struct si_cac_config_reg lcac_oland[] =
-{
+static const struct si_cac_config_reg lcac_oland[] = {
 	{ 0x98, 0x0001fffe, 1, 0x2, SISLANDS_CACCONFIG_CGIND },
 	{ 0x98, 0x00000001, 0, 0x1, SISLANDS_CACCONFIG_CGIND },
 	{ 0x104, 0x0001fffe, 1, 0x2, SISLANDS_CACCONFIG_CGIND },
@@ -1457,8 +1422,7 @@ static const struct si_cac_config_reg lcac_oland[] =
 	{ 0xFFFFFFFF }
 };
 
-static const struct si_cac_config_reg lcac_mars_pro[] =
-{
+static const struct si_cac_config_reg lcac_mars_pro[] = {
 	{ 0x98, 0x0001fffe, 1, 0x2, SISLANDS_CACCONFIG_CGIND },
 	{ 0x98, 0x00000001, 0, 0x1, SISLANDS_CACCONFIG_CGIND },
 	{ 0x104, 0x0001fffe, 1, 0x2, SISLANDS_CACCONFIG_CGIND },
@@ -1504,13 +1468,11 @@ static const struct si_cac_config_reg lcac_mars_pro[] =
 	{ 0xFFFFFFFF }
 };
 
-static const struct si_cac_config_reg cac_override_oland[] =
-{
+static const struct si_cac_config_reg cac_override_oland[] = {
 	{ 0xFFFFFFFF }
 };
 
-static const struct si_powertune_data powertune_data_oland =
-{
+static const struct si_powertune_data powertune_data_oland = {
 	((1 << 16) | 0x6993),
 	5,
 	0,
@@ -1540,8 +1502,7 @@ static const struct si_powertune_data powertune_data_oland =
 	true
 };
 
-static const struct si_powertune_data powertune_data_mars_pro =
-{
+static const struct si_powertune_data powertune_data_mars_pro = {
 	((1 << 16) | 0x6993),
 	5,
 	0,
@@ -1571,8 +1532,7 @@ static const struct si_powertune_data powertune_data_mars_pro =
 	true
 };
 
-static const struct si_dte_data dte_data_oland =
-{
+static const struct si_dte_data dte_data_oland = {
 	{ 0, 0, 0, 0, 0 },
 	{ 0, 0, 0, 0, 0 },
 	0,
@@ -1589,8 +1549,7 @@ static const struct si_dte_data dte_data_oland =
 	false
 };
 
-static const struct si_dte_data dte_data_mars_pro =
-{
+static const struct si_dte_data dte_data_mars_pro = {
 	{ 0x1E8480, 0x3D0900, 0x989680, 0x2625A00, 0x0 },
 	{ 0x0, 0x0, 0x0, 0x0, 0x0 },
 	5,
@@ -1607,8 +1566,7 @@ static const struct si_dte_data dte_data_mars_pro =
 	true
 };
 
-static const struct si_dte_data dte_data_sun_xt =
-{
+static const struct si_dte_data dte_data_sun_xt = {
 	{ 0x1E8480, 0x3D0900, 0x989680, 0x2625A00, 0x0 },
 	{ 0x0, 0x0, 0x0, 0x0, 0x0 },
 	5,
@@ -1626,8 +1584,7 @@ static const struct si_dte_data dte_data_sun_xt =
 };
 
 
-static const struct si_cac_config_reg cac_weights_hainan[] =
-{
+static const struct si_cac_config_reg cac_weights_hainan[] = {
 	{ 0x0, 0x0000ffff, 0, 0x2d9, SISLANDS_CACCONFIG_CGIND },
 	{ 0x0, 0xffff0000, 16, 0x22b, SISLANDS_CACCONFIG_CGIND },
 	{ 0x1, 0x0000ffff, 0, 0x21c, SISLANDS_CACCONFIG_CGIND },
@@ -1691,8 +1648,7 @@ static const struct si_cac_config_reg cac_weights_hainan[] =
 	{ 0xFFFFFFFF }
 };
 
-static const struct si_powertune_data powertune_data_hainan =
-{
+static const struct si_powertune_data powertune_data_hainan = {
 	((1 << 16) | 0x6993),
 	5,
 	0,
-- 
2.17.1

