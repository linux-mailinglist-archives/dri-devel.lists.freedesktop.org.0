Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2706D6A3752
	for <lists+dri-devel@lfdr.de>; Mon, 27 Feb 2023 03:08:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3451810E31C;
	Mon, 27 Feb 2023 02:08:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2780A10E31C
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Feb 2023 02:08:33 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id A4EBC60DB5;
 Mon, 27 Feb 2023 02:08:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0DB19C4339C;
 Mon, 27 Feb 2023 02:08:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1677463712;
 bh=0l4N7S53WkVsQu+vyKBe7/w86lYZhEOdb25e8I7JgTQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=jwXhfJ0jKvkEVv9wyAk5qOpYEF+LTn4+EhQd7VT6bgZrx86ZlTpV5EnjdnY48eGs7
 MbUswQREQt+sDYrL09IqYEGcON9swzt34x+67hkDb8Q2dMuoxehNEJpewS4Xe5uFpg
 +XcgZArLzKQjBrQHPgyA+odBsyGArQVj/6RXvtIIyf/xwG0fbQ5uJC0C9dhKR5f6bc
 GbaUfIrgS1uzwSEvpaSjbZAkE9fLyz7B8NwtGbJ+208ty9W8/jQclc3mPQBJQgRp1y
 567UgeJAwpaHSeMuv5P4h23fUcV1Pe84y0TXYyvq2QW3NU55a7fbvHDAyg3SrJZEZy
 QRhdPE8wxASVw==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 6.1 51/58] drm: panel-orientation-quirks: Add quirk
 for Lenovo IdeaPad Duet 3 10IGL5
Date: Sun, 26 Feb 2023 21:04:49 -0500
Message-Id: <20230227020457.1048737-51-sashal@kernel.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230227020457.1048737-1-sashal@kernel.org>
References: <20230227020457.1048737-1-sashal@kernel.org>
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
Cc: Darrell Kavanagh <darrell.kavanagh@gmail.com>,
 Sasha Levin <sashal@kernel.org>, Hans de Goede <hdegoede@redhat.com>,
 dri-devel@lists.freedesktop.org, tzimmermann@suse.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Darrell Kavanagh <darrell.kavanagh@gmail.com>

[ Upstream commit 38b2d8efd03d2e56431b611e3523f0158306451d ]

Another Lenovo convertable where the panel is installed landscape but is
reported to the kernel as portrait.

Signed-off-by: Darrell Kavanagh <darrell.kavanagh@gmail.com>
Reviewed-by: Hans de Goede <hdegoede@redhat.com>
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
Link: https://patchwork.freedesktop.org/patch/msgid/20230214164659.3583-1-darrell.kavanagh@gmail.com
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/drm_panel_orientation_quirks.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/gpu/drm/drm_panel_orientation_quirks.c b/drivers/gpu/drm/drm_panel_orientation_quirks.c
index b409fe256fd0a..5522d610c5cfd 100644
--- a/drivers/gpu/drm/drm_panel_orientation_quirks.c
+++ b/drivers/gpu/drm/drm_panel_orientation_quirks.c
@@ -322,6 +322,12 @@ static const struct dmi_system_id orientation_data[] = {
 		  DMI_EXACT_MATCH(DMI_PRODUCT_VERSION, "Lenovo ideapad D330-10IGL"),
 		},
 		.driver_data = (void *)&lcd800x1280_rightside_up,
+	}, {	/* Lenovo IdeaPad Duet 3 10IGL5 */
+		.matches = {
+		  DMI_EXACT_MATCH(DMI_SYS_VENDOR, "LENOVO"),
+		  DMI_EXACT_MATCH(DMI_PRODUCT_VERSION, "IdeaPad Duet 3 10IGL5"),
+		},
+		.driver_data = (void *)&lcd1200x1920_rightside_up,
 	}, {	/* Lenovo Yoga Book X90F / X91F / X91L */
 		.matches = {
 		  /* Non exact match to match all versions */
-- 
2.39.0

