Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B3D382A999
	for <lists+dri-devel@lfdr.de>; Thu, 11 Jan 2024 09:51:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E6A3510E859;
	Thu, 11 Jan 2024 08:50:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m16.mail.163.com (m15.mail.163.com [45.254.50.220])
 by gabe.freedesktop.org (Postfix) with ESMTP id 9EDD010E18A;
 Thu, 11 Jan 2024 08:24:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=From:Subject:Date:Message-Id; bh=6CAROB1lD1HLjhO4c1
 5hoRYXMOhnvVtgCZbVS+d/YhU=; b=lUOzuGBxHNPn6+7nV+zNlU8NYwUEJKXFm1
 K7pwUJ4Gf1fJPPncmxA2rFzDk8hifpRegxJE7VMOM5Sw2lE8c/nndw3UVuByDDcs
 wZT2a6RyISLg8wMYkflXbK5P1tgLU5C9H2bBfWtf7vym+zlOcBMp9ze7fjQq7Y8u
 tZTxzCUlY=
Received: from localhost.localdomain (unknown [182.148.14.173])
 by gzga-smtp-mta-g0-4 (Coremail) with SMTP id _____wDnT_OXpZ9l8XqUAA--.19048S2;
 Thu, 11 Jan 2024 16:23:51 +0800 (CST)
From: GuoHua Chen <chenguohua_716@163.com>
To: daniel@ffwll.ch, Xinhui.Pan@amd.com, alexander.deucher@amd.com,
 airlied@gmail.com, christian.koenig@amd.com
Subject: [PATCH] drm/radeon: Clean up errors in radeon_display.c
Date: Thu, 11 Jan 2024 08:23:49 +0000
Message-Id: <20240111082349.11806-1-chenguohua_716@163.com>
X-Mailer: git-send-email 2.17.1
X-CM-TRANSID: _____wDnT_OXpZ9l8XqUAA--.19048S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7uFWxtr18JFyrAr47Xr15twb_yoW8tF1DpF
 sxuw1vgw13tF4agryUJF4xuw1rua1kWaySkr17G39ruws0yrWxXFZIyFZFkw1rZry8GrW5
 tryxCw17WF40yrDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07UFdgAUUUUU=
X-Originating-IP: [182.148.14.173]
X-CM-SenderInfo: xfkh0w5xrk3tbbxrlqqrwthudrp/1tbiqBxi1mVOBlCRhgAAsq
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

ERROR: that open brace { should be on the previous line
ERROR: space prohibited before that ',' (ctx:WxW)

Signed-off-by: GuoHua Chen <chenguohua_716@163.com>
---
 drivers/gpu/drm/radeon/radeon_display.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/radeon/radeon_display.c b/drivers/gpu/drm/radeon/radeon_display.c
index a44f78bdd4e5..94dc4f92587f 100644
--- a/drivers/gpu/drm/radeon/radeon_display.c
+++ b/drivers/gpu/drm/radeon/radeon_display.c
@@ -1365,8 +1365,8 @@ static const struct drm_prop_enum_list radeon_tmds_pll_enum_list[] = {
 	{ 1, "bios" },
 };
 
-static const struct drm_prop_enum_list radeon_tv_std_enum_list[] =
-{	{ TV_STD_NTSC, "ntsc" },
+static const struct drm_prop_enum_list radeon_tv_std_enum_list[] = {
+	{ TV_STD_NTSC, "ntsc" },
 	{ TV_STD_PAL, "pal" },
 	{ TV_STD_PAL_M, "pal-m" },
 	{ TV_STD_PAL_60, "pal-60" },
@@ -1376,25 +1376,25 @@ static const struct drm_prop_enum_list radeon_tv_std_enum_list[] =
 	{ TV_STD_SECAM, "secam" },
 };
 
-static const struct drm_prop_enum_list radeon_underscan_enum_list[] ={
+static const struct drm_prop_enum_list radeon_underscan_enum_list[] = {
 	{ UNDERSCAN_OFF, "off" },
 	{ UNDERSCAN_ON, "on" },
 	{ UNDERSCAN_AUTO, "auto" },
 };
 
-static const struct drm_prop_enum_list radeon_audio_enum_list[] ={
+static const struct drm_prop_enum_list radeon_audio_enum_list[] = {
 	{ RADEON_AUDIO_DISABLE, "off" },
 	{ RADEON_AUDIO_ENABLE, "on" },
 	{ RADEON_AUDIO_AUTO, "auto" },
 };
 
 /* XXX support different dither options? spatial, temporal, both, etc. */
-static const struct drm_prop_enum_list radeon_dither_enum_list[] ={
+static const struct drm_prop_enum_list radeon_dither_enum_list[] = {
 	{ RADEON_FMT_DITHER_DISABLE, "off" },
 	{ RADEON_FMT_DITHER_ENABLE, "on" },
 };
 
-static const struct drm_prop_enum_list radeon_output_csc_enum_list[] ={
+static const struct drm_prop_enum_list radeon_output_csc_enum_list[] = {
 	{ RADEON_OUTPUT_CSC_BYPASS, "bypass" },
 	{ RADEON_OUTPUT_CSC_TVRGB, "tvrgb" },
 	{ RADEON_OUTPUT_CSC_YCBCR601, "ycbcr601" },
-- 
2.17.1

