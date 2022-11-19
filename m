Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F6B36309B2
	for <lists+dri-devel@lfdr.de>; Sat, 19 Nov 2022 03:16:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E878310E831;
	Sat, 19 Nov 2022 02:16:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B9F7210E831
 for <dri-devel@lists.freedesktop.org>; Sat, 19 Nov 2022 02:16:21 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 5B387B8267B;
 Sat, 19 Nov 2022 02:16:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E63DAC433B5;
 Sat, 19 Nov 2022 02:16:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1668824180;
 bh=/6xSMD6UHdU98GX4NucIayPDS4nBVFCfSm/TkkM5y+4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=h9G5jV138EgQvM+VIlFwJ20e3i/8MaLwLBwrScLuhRFcPGV6XTCt7b6eKXKpoSKuo
 fuWfkW31t6cpOXpSvksd2XxIckSgXJKGMAKyGPWLSP4I4UW4Tax48PGbiJ2n27fID/
 mbMhavGNb6y+Vci37NNPpf5VoLjzLynzdGFLQK/bbJYiZ3VJ8WvOafaTHl1hBDuBuW
 HI0ozrGxYVCGzuVp7ctQlEUbEzR5hSWnmMX7Ivk8y5sxVuNm7nrmMta+rxcbyM+v8L
 HoOeymyffofHTU814+jozbRth2vrcoQu1SW6iR2cWkiWvnynQhUbacljzGl53kcxb+
 3xrkGPEHb/Xpw==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 4.19 6/8] drm: panel-orientation-quirks: Add quirk for
 Acer Switch V 10 (SW5-017)
Date: Fri, 18 Nov 2022 21:16:07 -0500
Message-Id: <20221119021610.1775469-6-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221119021610.1775469-1-sashal@kernel.org>
References: <20221119021610.1775469-1-sashal@kernel.org>
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
Cc: Sasha Levin <sashal@kernel.org>, Hans de Goede <hdegoede@redhat.com>,
 Rudolf Polzer <rpolzer@google.com>, dri-devel@lists.freedesktop.org,
 tzimmermann@suse.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Hans de Goede <hdegoede@redhat.com>

[ Upstream commit 653f2d94fcda200b02bd79cea2e0307b26c1b747 ]

Like the Acer Switch One 10 S1003, for which there already is a quirk,
the Acer Switch V 10 (SW5-017) has a 800x1280 portrait screen mounted
in the tablet part of a landscape oriented 2-in-1. Add a quirk for this.

Cc: Rudolf Polzer <rpolzer@google.com>
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
Acked-by: Simon Ser <contact@emersion.fr>
Link: https://patchwork.freedesktop.org/patch/msgid/20221106215052.66995-1-hdegoede@redhat.com
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/drm_panel_orientation_quirks.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/gpu/drm/drm_panel_orientation_quirks.c b/drivers/gpu/drm/drm_panel_orientation_quirks.c
index bea1d3e7e964..7a2a148b8ec6 100644
--- a/drivers/gpu/drm/drm_panel_orientation_quirks.c
+++ b/drivers/gpu/drm/drm_panel_orientation_quirks.c
@@ -95,6 +95,12 @@ static const struct dmi_system_id orientation_data[] = {
 		  DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "One S1003"),
 		},
 		.driver_data = (void *)&lcd800x1280_rightside_up,
+	}, {	/* Acer Switch V 10 (SW5-017) */
+		.matches = {
+		  DMI_EXACT_MATCH(DMI_SYS_VENDOR, "Acer"),
+		  DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "SW5-017"),
+		},
+		.driver_data = (void *)&lcd800x1280_rightside_up,
 	}, {	/* Anbernic Win600 */
 		.matches = {
 		  DMI_EXACT_MATCH(DMI_BOARD_VENDOR, "Anbernic"),
-- 
2.35.1

