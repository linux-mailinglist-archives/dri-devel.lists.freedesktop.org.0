Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 386F94FC9E5
	for <lists+dri-devel@lfdr.de>; Tue, 12 Apr 2022 02:47:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0726310FAD7;
	Tue, 12 Apr 2022 00:47:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF21B10FAD5;
 Tue, 12 Apr 2022 00:47:36 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 7873CB8186F;
 Tue, 12 Apr 2022 00:47:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 70370C385A4;
 Tue, 12 Apr 2022 00:47:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1649724454;
 bh=LCkqVqIIGOi/CenhiiJdU9IaJN8JgKTltB9UEL1EcZQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=A7MTpMpD4FXybfjekWQmFoDzAr30X1gHa7mc9ewUpZx+hi3jTBNqjX10+03a0gJxx
 oUoniXeMsBqjtdDBW+9DZrXA8DAmJLs3zvX9oJri662jYtIWlsaRUfwbcIZXq9kH6I
 UFBg+baE5g+iLpvKIe/S9Dpg4XpJR2uqKAJycgLa3iq106Hm1pyN4T5i511sKcH4mr
 GSfdC4NKw0sPhpC3JPjcKcPNnKIPGgwzMEkAgf86JjqWDEgUcX4nIdBZSimIRDc6lT
 +mu6bicVrBaGVVbOhjQ7nVuKKP5CvMwx11L1NjZlWQ3VkzaCbk/ogrc4rQchmUVlms
 7eJARREyu2S/Q==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.15 08/41] drm/amd/display: Update VTEM Infopacket
 definition
Date: Mon, 11 Apr 2022 20:46:20 -0400
Message-Id: <20220412004656.350101-8-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220412004656.350101-1-sashal@kernel.org>
References: <20220412004656.350101-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
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
Cc: Sasha Levin <sashal@kernel.org>, Krunoslav.Kovac@amd.com,
 Chris Park <Chris.Park@amd.com>, Alex Hung <alex.hung@amd.com>,
 airlied@linux.ie, Xinhui.Pan@amd.com, Rodrigo.Siqueira@amd.com,
 amd-gfx@lists.freedesktop.org, sunpeng.li@amd.com,
 Daniel Wheeler <daniel.wheeler@amd.com>, Reza.Amini@amd.com,
 dri-devel@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 "Leo \(Hanghong\) Ma" <hanghong.ma@amd.com>, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: "Leo (Hanghong) Ma" <hanghong.ma@amd.com>

[ Upstream commit c9fbf6435162ed5fb7201d1d4adf6585c6a8c327 ]

[Why & How]
The latest HDMI SPEC has updated the VTEM packet structure,
so change the VTEM Infopacket defined in the driver side to align
with the SPEC.

Reviewed-by: Chris Park <Chris.Park@amd.com>
Acked-by: Alex Hung <alex.hung@amd.com>
Signed-off-by: Leo (Hanghong) Ma <hanghong.ma@amd.com>
Tested-by: Daniel Wheeler <daniel.wheeler@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 .../gpu/drm/amd/display/modules/info_packet/info_packet.c    | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/modules/info_packet/info_packet.c b/drivers/gpu/drm/amd/display/modules/info_packet/info_packet.c
index 57f198de5e2c..4e075b01d48b 100644
--- a/drivers/gpu/drm/amd/display/modules/info_packet/info_packet.c
+++ b/drivers/gpu/drm/amd/display/modules/info_packet/info_packet.c
@@ -100,7 +100,8 @@ enum vsc_packet_revision {
 //PB7 = MD0
 #define MASK_VTEM_MD0__VRR_EN         0x01
 #define MASK_VTEM_MD0__M_CONST        0x02
-#define MASK_VTEM_MD0__RESERVED2      0x0C
+#define MASK_VTEM_MD0__QMS_EN         0x04
+#define MASK_VTEM_MD0__RESERVED2      0x08
 #define MASK_VTEM_MD0__FVA_FACTOR_M1  0xF0
 
 //MD1
@@ -109,7 +110,7 @@ enum vsc_packet_revision {
 //MD2
 #define MASK_VTEM_MD2__BASE_REFRESH_RATE_98  0x03
 #define MASK_VTEM_MD2__RB                    0x04
-#define MASK_VTEM_MD2__RESERVED3             0xF8
+#define MASK_VTEM_MD2__NEXT_TFR              0xF8
 
 //MD3
 #define MASK_VTEM_MD3__BASE_REFRESH_RATE_07  0xFF
-- 
2.35.1

