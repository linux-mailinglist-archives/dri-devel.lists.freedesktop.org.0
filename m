Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F3D1370AA1D
	for <lists+dri-devel@lfdr.de>; Sat, 20 May 2023 20:24:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F71010E19C;
	Sat, 20 May 2023 18:24:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BED3910E19C
 for <dri-devel@lists.freedesktop.org>; Sat, 20 May 2023 18:24:43 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 322D560F92;
 Sat, 20 May 2023 18:24:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B298AC433D2;
 Sat, 20 May 2023 18:24:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1684607082;
 bh=QuWw6h2+wuFqCtgv/OCunMJsl837qsw/7hjOVEujlY4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=h8kgwd6Ef6aYZxJHKEkFReBCVJ8cigew90JLcrFISKzzXK8ktERPermUN+26KwY1g
 WVF25AXGBkSMZkwPIZ0eMp7HVps8LzPggm8RJ7Bq6lKdeMKhMZRIBupN7+vkKWRVyT
 5H5IS8ewxXjwBPVySMkgpuTd/shgaqp0k5RNmaHV9v/sAIbXIahNCH6yAtCgcsjMJy
 npizIFgLd/28oqxPcIBmTz9Nl9fDpQ/Wwv4fqzu/ixSG8GB1uAPy8Q9l6hFGKWdaYo
 21/4voJQBEgkMPzyz03KIJtoxWwX4Lw7XzfV60gJtFtlKGEuMBXz9PxB69CRyi6zhp
 4BAvcTQDq43zA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 4.14 2/4] fbdev: modedb: Add 1920x1080 at 60 Hz video
 mode
Date: Sat, 20 May 2023 14:24:27 -0400
Message-Id: <20230520182432.866012-2-sashal@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230520182432.866012-1-sashal@kernel.org>
References: <20230520182432.866012-1-sashal@kernel.org>
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
index a9d76e1b43781..d02712548a3e4 100644
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

