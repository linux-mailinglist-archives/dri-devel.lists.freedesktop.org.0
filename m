Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E1FBA82A985
	for <lists+dri-devel@lfdr.de>; Thu, 11 Jan 2024 09:51:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 229ED10E840;
	Thu, 11 Jan 2024 08:50:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m16.mail.163.com (m15.mail.163.com [45.254.50.219])
 by gabe.freedesktop.org (Postfix) with ESMTP id E0FC310E03A;
 Thu, 11 Jan 2024 08:32:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=From:Subject:Date:Message-Id; bh=hIIhJMzptMNoGjn+eB
 6+tS402J6MeF/y18vxlmoiacU=; b=fw+AI9iVomMHhAjUctpac32C9CXrLB4EU/
 J7YOg3q4dr/uzgK7xlqI2+awoVzvYrIlt2xrxoHH95cHxrh9p3o4qGAOifuFwDJO
 gJtE9MgL+XgaN5NMscWCEe/rhYPp8Wm6NESaUhYbmrLVUwYYJyCTaUO/fjy7svM1
 hsMvKvP/Q=
Received: from localhost.localdomain (unknown [182.148.14.173])
 by gzga-smtp-mta-g0-5 (Coremail) with SMTP id _____wD3P2elp59lm66VAA--.22689S2;
 Thu, 11 Jan 2024 16:32:37 +0800 (CST)
From: GuoHua Chen <chenguohua_716@163.com>
To: daniel@ffwll.ch, Xinhui.Pan@amd.com, alexander.deucher@amd.com,
 airlied@gmail.com, christian.koenig@amd.com
Subject: [PATCH] drm/radeon: Clean up errors in radeon_audio.c
Date: Thu, 11 Jan 2024 08:32:35 +0000
Message-Id: <20240111083235.12152-1-chenguohua_716@163.com>
X-Mailer: git-send-email 2.17.1
X-CM-TRANSID: _____wD3P2elp59lm66VAA--.22689S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7tFy5Xry5ZFyxGr4UJryDtrb_yoW8tryrpa
 17ua9YyrZIk34DWryxAFZxJFWYgw1kJa1xZrWDuw1fG393tryDXa4aqryUCFyrJFyFgay7
 tr1kKw12v3Wvkr7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07UFdgAUUUUU=
X-Originating-IP: [182.148.14.173]
X-CM-SenderInfo: xfkh0w5xrk3tbbxrlqqrwthudrp/xtbBEg1i1mVOBk-vRgAAsg
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

ERROR: "foo* bar" should be "foo *bar"
ERROR: that open brace { should be on the previous line

Signed-off-by: GuoHua Chen <chenguohua_716@163.com>
---
 drivers/gpu/drm/radeon/radeon_audio.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/radeon/radeon_audio.c b/drivers/gpu/drm/radeon/radeon_audio.c
index 91b58fbc2be7..74753bb26d33 100644
--- a/drivers/gpu/drm/radeon/radeon_audio.c
+++ b/drivers/gpu/drm/radeon/radeon_audio.c
@@ -37,15 +37,14 @@
 
 void dce6_audio_enable(struct radeon_device *rdev, struct r600_audio_pin *pin,
 		u8 enable_mask);
-struct r600_audio_pin* r600_audio_get_pin(struct radeon_device *rdev);
-struct r600_audio_pin* dce6_audio_get_pin(struct radeon_device *rdev);
+struct r600_audio_pin *r600_audio_get_pin(struct radeon_device *rdev);
+struct r600_audio_pin *dce6_audio_get_pin(struct radeon_device *rdev);
 static void radeon_audio_hdmi_mode_set(struct drm_encoder *encoder,
 	struct drm_display_mode *mode);
 static void radeon_audio_dp_mode_set(struct drm_encoder *encoder,
 	struct drm_display_mode *mode);
 
-static const u32 pin_offsets[7] =
-{
+static const u32 pin_offsets[7] = {
 	(0x5e00 - 0x5e00),
 	(0x5e18 - 0x5e00),
 	(0x5e30 - 0x5e00),
@@ -361,7 +360,7 @@ static void radeon_audio_write_latency_fields(struct drm_encoder *encoder,
 		radeon_encoder->audio->write_latency_fields(encoder, connector, mode);
 }
 
-struct r600_audio_pin* radeon_audio_get_pin(struct drm_encoder *encoder)
+struct r600_audio_pin *radeon_audio_get_pin(struct drm_encoder *encoder)
 {
 	struct radeon_device *rdev = encoder->dev->dev_private;
 	struct radeon_encoder *radeon_encoder = to_radeon_encoder(encoder);
@@ -528,7 +527,7 @@ static void radeon_audio_calc_cts(unsigned int clock, int *CTS, int *N, int freq
 		*N, *CTS, freq);
 }
 
-static const struct radeon_hdmi_acr* radeon_audio_acr(unsigned int clock)
+static const struct radeon_hdmi_acr *radeon_audio_acr(unsigned int clock)
 {
 	static struct radeon_hdmi_acr res;
 	u8 i;
-- 
2.17.1

