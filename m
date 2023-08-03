Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CDD1B76EC2B
	for <lists+dri-devel@lfdr.de>; Thu,  3 Aug 2023 16:18:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B6F2410E0CB;
	Thu,  3 Aug 2023 14:18:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 398 seconds by postgrey-1.36 at gabe;
 Thu, 03 Aug 2023 14:18:00 UTC
Received: from mx.swemel.ru (mx.swemel.ru [95.143.211.150])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D67510E0CB;
 Thu,  3 Aug 2023 14:18:00 +0000 (UTC)
From: Denis Arefev <arefev@swemel.ru>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=swemel.ru; s=mail;
 t=1691071876;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=Wwx6Ta6AHqq3TcGW8bDS4dyENTyGmjacKacctkGambU=;
 b=SVNHybaDXO7SxMWdFbZblKTdyyFkRoiYZQcaKlUxbxzbcVAdbKxYxPGC5CPwCH2clX7nhS
 picfAtFTw01T80c7e1s2RP/e1bbR16gQsGvSdfYdGy0sftTwtP4e8AsPCNdIbU0+FQsjGh
 ZnIjvQUSnrniQv3p+J8kgTlGv0ex0bs=
To: Harry Wentland <harry.wentland@amd.com>
Subject: [PATCH] drm/amd/display: Return value of function
Date: Thu,  3 Aug 2023 17:11:16 +0300
Message-Id: <20230803141116.58883-1-arefev@swemel.ru>
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
Cc: trufanov@swemel.ru, lvc-project@linuxtesting.org,
 Leo Li <sunpeng.li@amd.com>, Wenjing Liu <wenjing.liu@amd.com>, "Pan,
 Xinhui" <Xinhui.Pan@amd.com>, Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org, vfh@swemel.ru,
 dri-devel@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 Jun Lei <Jun.Lei@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Added return value check hpd_enable

Found by Linux Verification Center (linuxtesting.org) with SVACE.

Signed-off-by: Denis Arefev <arefev@swemel.ru>
---
 drivers/gpu/drm/amd/display/dc/dce/dce_link_encoder.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/display/dc/dce/dce_link_encoder.c b/drivers/gpu/drm/amd/display/dc/dce/dce_link_encoder.c
index fa314493ffc5..bf2f620aeb66 100644
--- a/drivers/gpu/drm/amd/display/dc/dce/dce_link_encoder.c
+++ b/drivers/gpu/drm/amd/display/dc/dce/dce_link_encoder.c
@@ -1645,7 +1645,7 @@ void dce110_link_encoder_enable_hpd(struct link_encoder *enc)
 	uint32_t hpd_enable = 0;
 	uint32_t value = dm_read_reg(ctx, addr);
 
-	get_reg_field_value(hpd_enable, DC_HPD_CONTROL, DC_HPD_EN);
+	hpd_enable = get_reg_field_value(hpd_enable, DC_HPD_CONTROL, DC_HPD_EN);
 
 	if (hpd_enable == 0)
 		set_reg_field_value(value, 1, DC_HPD_CONTROL, DC_HPD_EN);
-- 
2.25.1

