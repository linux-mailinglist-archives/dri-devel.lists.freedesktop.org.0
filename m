Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C0A155BD41
	for <lists+dri-devel@lfdr.de>; Tue, 28 Jun 2022 04:20:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C090E10EECB;
	Tue, 28 Jun 2022 02:20:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C090E10EECB
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Jun 2022 02:20:00 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 2EF05617D1;
 Tue, 28 Jun 2022 02:20:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 88504C36AEF;
 Tue, 28 Jun 2022 02:19:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1656382800;
 bh=i1MqkCT0NLl9iJ1uNyGtqAn7ESc3mIGPD1O+e/eGeVo=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=JnlfJ4bkhA1DIQAynZABBlpOp+77wZt65WdJDa+1v34ksXmmjsjMPazcklbN0PRMQ
 tlSvjf70isQN7L8ZGs2OEC/uF9cH6x2PPfDrpH5Vw4fFAtfxM9H+S5atk6e6GVJdRt
 6bnYeIiITIkbIes+kgBavNtFWisyaU4xFFe33y4pRwdB0J5xbANi7jZpIESx5CbnOs
 JvzU0OW6hU7z7MCYYCPh5mh8i64fyXoOUTjLYV1QcrpHfB4941Uk/v3Sa/zeapS66L
 hn915ywx4RxJntfS8Mc15ba4cI2PZjSEUdHj/FIcphFt9vKk1KjoSmBdI1osxGBt+4
 S6WFXab1MfAfQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.18 27/53] drm: panel-orientation-quirks: Add quirk
 for Aya Neo Next
Date: Mon, 27 Jun 2022 22:18:13 -0400
Message-Id: <20220628021839.594423-27-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220628021839.594423-1-sashal@kernel.org>
References: <20220628021839.594423-1-sashal@kernel.org>
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
Cc: Sasha Levin <sashal@kernel.org>, airlied@linux.ie,
 Javier Martinez Canillas <javierm@redhat.com>,
 Hans de Goede <hdegoede@redhat.com>, dri-devel@lists.freedesktop.org,
 tzimmermann@suse.de, Maya Matuszczyk <maccraft123mc@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Maya Matuszczyk <maccraft123mc@gmail.com>

[ Upstream commit be33d52ef5b4bdfec04cfdad39368c343bac97a3 ]

The device is identified by "NEXT" in board name, however there are
different versions of it, "Next Advance" and "Next Pro", that have
different DMI board names.
Due to a production error a batch or two have their board names prefixed
by "AYANEO", this makes it 6 different DMI board names. To save some
space in final kernel image DMI_MATCH is used instead of
DMI_EXACT_MATCH.

Signed-off-by: Maya Matuszczyk <maccraft123mc@gmail.com>
Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
Reviewed-by: Hans de Goede <hdegoede@redhat.com>
Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
Link: https://patchwork.freedesktop.org/patch/msgid/20220619111952.8487-1-maccraft123mc@gmail.com
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/drm_panel_orientation_quirks.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/gpu/drm/drm_panel_orientation_quirks.c b/drivers/gpu/drm/drm_panel_orientation_quirks.c
index 4e853acfd1e8..df87ba99a87c 100644
--- a/drivers/gpu/drm/drm_panel_orientation_quirks.c
+++ b/drivers/gpu/drm/drm_panel_orientation_quirks.c
@@ -152,6 +152,12 @@ static const struct dmi_system_id orientation_data[] = {
 		  DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "AYA NEO 2021"),
 		},
 		.driver_data = (void *)&lcd800x1280_rightside_up,
+	}, {	/* AYA NEO NEXT */
+		.matches = {
+		  DMI_EXACT_MATCH(DMI_BOARD_VENDOR, "AYANEO"),
+		  DMI_MATCH(DMI_BOARD_NAME, "NEXT"),
+		},
+		.driver_data = (void *)&lcd800x1280_rightside_up,
 	}, {	/* Chuwi HiBook (CWI514) */
 		.matches = {
 			DMI_MATCH(DMI_BOARD_VENDOR, "Hampoo"),
-- 
2.35.1

