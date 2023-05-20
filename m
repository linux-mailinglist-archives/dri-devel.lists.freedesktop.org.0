Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E74770A9C2
	for <lists+dri-devel@lfdr.de>; Sat, 20 May 2023 20:20:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C711910E0FE;
	Sat, 20 May 2023 18:20:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4860E10E0FD
 for <dri-devel@lists.freedesktop.org>; Sat, 20 May 2023 18:20:27 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id C51B16069A;
 Sat, 20 May 2023 18:20:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4B071C433D2;
 Sat, 20 May 2023 18:20:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1684606826;
 bh=+c/hg+pn6YqJJKirv+KPqU8DGCISXulUy2B44R/iVk8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Lfojx4veXCMsuvpKINEDoVWS+Hl4u5/HIC3RQuoPx87vWm18OACYek66Qs+9rJUeT
 OheW6EWuwMWygPbIoiFtdyo4V0nNRkgakfPRbqzGkguzi8XzZSPjOBahDfEjMSzC6D
 RbKsITSJFHtS2aZTEkUb5TUwaJcKYFgn3prKmHVwHozzthpUu51PGx/ndP1GkaZ7uZ
 zFGD916Fc/sDvs999rxgHsHibNapJsn/f31ozUvGW4jgND/Fv94SY5/g6BkYrx+EiC
 R8hVpuy+baCwW6NlqvavPQs9Ctq8UNliaRDm8z0OAzW9UCmMBJGOiDm8zX0SwLuGxj
 LPnWA1VscrBFQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 6.3 15/18] fbdev: modedb: Add 1920x1080 at 60 Hz video
 mode
Date: Sat, 20 May 2023 14:17:47 -0400
Message-Id: <20230520181750.823365-15-sashal@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230520181750.823365-1-sashal@kernel.org>
References: <20230520181750.823365-1-sashal@kernel.org>
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
Cc: Sasha Levin <sashal@kernel.org>, linux-fbdev@vger.kernel.org,
 Helge Deller <deller@gmx.de>, javierm@redhat.com,
 dri-devel@lists.freedesktop.org, tzimmermann@suse.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Helge Deller <deller@gmx.de>

[ Upstream commit c8902258b2b8ecaa1b8d88c312853c5b14c2553d ]

Add typical resolution for Full-HD monitors.

Signed-off-by: Helge Deller <deller@gmx.de>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/video/fbdev/core/modedb.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/video/fbdev/core/modedb.c b/drivers/video/fbdev/core/modedb.c
index 6473e0dfe1464..e78ec7f728463 100644
--- a/drivers/video/fbdev/core/modedb.c
+++ b/drivers/video/fbdev/core/modedb.c
@@ -257,6 +257,11 @@ static const struct fb_videomode modedb[] = {
 	{ NULL, 72, 480, 300, 33386, 40, 24, 11, 19, 80, 3, 0,
 		FB_VMODE_DOUBLE },
 
+	/* 1920x1080 @ 60 Hz, 67.3 kHz hsync */
+	{ NULL, 60, 1920, 1080, 6734, 148, 88, 36, 4, 44, 5, 0,
+		FB_SYNC_HOR_HIGH_ACT | FB_SYNC_VERT_HIGH_ACT,
+		FB_VMODE_NONINTERLACED },
+
 	/* 1920x1200 @ 60 Hz, 74.5 Khz hsync */
 	{ NULL, 60, 1920, 1200, 5177, 128, 336, 1, 38, 208, 3,
 		FB_SYNC_HOR_HIGH_ACT | FB_SYNC_VERT_HIGH_ACT,
-- 
2.39.2

