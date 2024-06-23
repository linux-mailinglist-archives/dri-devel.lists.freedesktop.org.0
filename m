Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EBCD913AF6
	for <lists+dri-devel@lfdr.de>; Sun, 23 Jun 2024 15:45:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4155F10E1BF;
	Sun, 23 Jun 2024 13:45:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="MPEcG3vK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B60210E1BF
 for <dri-devel@lists.freedesktop.org>; Sun, 23 Jun 2024 13:45:12 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 0E33BCE0EB5;
 Sun, 23 Jun 2024 13:45:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6D1D6C32781;
 Sun, 23 Jun 2024 13:45:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1719150309;
 bh=4nkdyw11JFFQf6jwYWNjBj2N7W+HZsqxpLYv6cEgvGA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=MPEcG3vKgufaqQ4nauVUasp+8bKunM6BKpPM5CCc8WJWaxJe+Kkb+QAlLPKDd+rlf
 Mm3ulDNWTiwgVr9FwxTmfnH7Xo10r34GsKPoXK1u5qhzdXTYpw2rdDkhYpm5/Yvxv5
 W/Mwq6kzvhLITwod+n2hPXTcym4fIc3qE71Sdv7qFVwsobWhxSiBCNJpu9ovmYqXlb
 ljP4ACvpnLfjR0DuKEkm62q8HAfTPB1ryMABK8iNG4ufe76fqqc9ExDz6v9zhIk/q9
 4ilP3NsD1m69Gu6dpt4ydYCEzW7ySn4qReNmqzO3GikZfI+vdRh8wb5JGEomkzevEo
 aMHkxLboOAqWg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>,
 Hans de Goede <hdegoede@redhat.com>, Sasha Levin <sashal@kernel.org>,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, daniel@ffwll.ch, dri-devel@lists.freedesktop.org
Subject: [PATCH AUTOSEL 6.6 13/16] drm: panel-orientation-quirks: Add quirk
 for Aya Neo KUN
Date: Sun, 23 Jun 2024 09:44:42 -0400
Message-ID: <20240623134448.809470-13-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240623134448.809470-1-sashal@kernel.org>
References: <20240623134448.809470-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.6.35
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>

[ Upstream commit f74fb5df429ebc6a614dc5aa9e44d7194d402e5a ]

Similar to the other Aya Neo devices this one features
again a portrait screen, here with a native resolution
of 1600x2560.

Signed-off-by: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
Reviewed-by: Hans de Goede <hdegoede@redhat.com>
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
Link: https://patchwork.freedesktop.org/patch/msgid/20240310220401.895591-1-tjakobi@math.uni-bielefeld.de
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/drm_panel_orientation_quirks.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/gpu/drm/drm_panel_orientation_quirks.c b/drivers/gpu/drm/drm_panel_orientation_quirks.c
index aa93129c3397e..2166208a961d6 100644
--- a/drivers/gpu/drm/drm_panel_orientation_quirks.c
+++ b/drivers/gpu/drm/drm_panel_orientation_quirks.c
@@ -202,6 +202,12 @@ static const struct dmi_system_id orientation_data[] = {
 		  DMI_MATCH(DMI_BOARD_NAME, "NEXT"),
 		},
 		.driver_data = (void *)&lcd800x1280_rightside_up,
+	}, {	/* AYA NEO KUN */
+		.matches = {
+		  DMI_EXACT_MATCH(DMI_BOARD_VENDOR, "AYANEO"),
+		  DMI_MATCH(DMI_BOARD_NAME, "KUN"),
+		},
+		.driver_data = (void *)&lcd1600x2560_rightside_up,
 	}, {	/* Chuwi HiBook (CWI514) */
 		.matches = {
 			DMI_MATCH(DMI_BOARD_VENDOR, "Hampoo"),
-- 
2.43.0

