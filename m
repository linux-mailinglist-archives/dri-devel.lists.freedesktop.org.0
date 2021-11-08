Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D34444A034
	for <lists+dri-devel@lfdr.de>; Tue,  9 Nov 2021 01:59:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2966889DE6;
	Tue,  9 Nov 2021 00:59:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB2DF89DE1
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Nov 2021 00:59:51 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 35A3F61208;
 Tue,  9 Nov 2021 00:59:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1636419591;
 bh=nSosOyqjZ5AqMs0T6sr0nJBrA4Lt2qn/AX2MCMDgxDM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=pg8tbjnrCBCbPsV5cHzbryhmQ6bszRg3FO8OihD6hKAaTrrJbGLWN3QJ8QZgka/fh
 y3nF3oWbmFB6xxsVEjlDbKUZNfUz9EAezQ5cOUTti3Nb3zQSkGXSRYvlRGKBstsbZt
 zCa7uMBZ0mHajgOn4v9T3Dg1WvD46uWTfwwJE0jTkPliwFvqt9bP6vIraofOs37/kc
 qQwlhu7FZGj9jTTBCHgot/ot0t97XdqyM/kDSI/pPWKRsbWhFx7I3U8MF6AWf6ScN4
 aeyW6cuBvdr6K7MNDvBqaHWCnejCLq4rItshN6zeiA3GVWKzB44kqkRRzyYKOsjInJ
 DpkLv9S46JLZg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.15 008/146] drm/panel-orientation-quirks: add Valve
 Steam Deck
Date: Mon,  8 Nov 2021 12:42:35 -0500
Message-Id: <20211108174453.1187052-8-sashal@kernel.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211108174453.1187052-1-sashal@kernel.org>
References: <20211108174453.1187052-1-sashal@kernel.org>
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
Cc: Sasha Levin <sashal@kernel.org>, tzimmermann@suse.de, airlied@linux.ie,
 Emil Velikov <emil.l.velikov@gmail.com>, Hans de Goede <hdegoede@redhat.com>,
 dri-devel@lists.freedesktop.org, Jared Baldridge <jrb@expunge.us>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Simon Ser <contact@emersion.fr>

[ Upstream commit 9eeb7b4e40bfd69d8aaa920c7e9df751c9e11dce ]

Valve's Steam Deck has a 800x1280 LCD screen.

Signed-off-by: Simon Ser <contact@emersion.fr>
Cc: Jared Baldridge <jrb@expunge.us>
Cc: Emil Velikov <emil.l.velikov@gmail.com>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: Hans de Goede <hdegoede@redhat.com>
Acked-by: Sam Ravnborg <sam@ravnborg.org>
Reviewed-by: Hans de Goede <hdegoede@redhat.com>
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
Link: https://patchwork.freedesktop.org/patch/msgid/20210911102430.253986-1-contact@emersion.fr
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/drm_panel_orientation_quirks.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/gpu/drm/drm_panel_orientation_quirks.c b/drivers/gpu/drm/drm_panel_orientation_quirks.c
index 926094b83e2f4..a950d5db211c5 100644
--- a/drivers/gpu/drm/drm_panel_orientation_quirks.c
+++ b/drivers/gpu/drm/drm_panel_orientation_quirks.c
@@ -261,6 +261,13 @@ static const struct dmi_system_id orientation_data[] = {
 		  DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "Galaxy Book 10.6"),
 		},
 		.driver_data = (void *)&lcd1280x1920_rightside_up,
+	}, {	/* Valve Steam Deck */
+		.matches = {
+		  DMI_EXACT_MATCH(DMI_SYS_VENDOR, "Valve"),
+		  DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "Jupiter"),
+		  DMI_EXACT_MATCH(DMI_PRODUCT_VERSION, "1"),
+		},
+		.driver_data = (void *)&lcd800x1280_rightside_up,
 	}, {	/* VIOS LTH17 */
 		.matches = {
 		  DMI_EXACT_MATCH(DMI_SYS_VENDOR, "VIOS"),
-- 
2.33.0

