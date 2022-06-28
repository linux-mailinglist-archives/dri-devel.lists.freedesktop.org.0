Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 78CFD55BD9B
	for <lists+dri-devel@lfdr.de>; Tue, 28 Jun 2022 04:27:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF7BB10F2CB;
	Tue, 28 Jun 2022 02:27:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F29810F2CB
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Jun 2022 02:27:13 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 2F6F1B81C0B;
 Tue, 28 Jun 2022 02:27:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A26C1C34115;
 Tue, 28 Jun 2022 02:27:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1656383230;
 bh=lacPAtZsEPiZpm46yptQlJb7OhqxDdXtZKNT0DH6wYo=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=h9vFJ0m77ec6dtiszo8G/+JgQLwWen/gEQYLzOc69gIsFOiQbqODIQ2oSgIPRHQdA
 ECRAlFHto6ehvKyXJYTtKMLRoCCgo3etcJiKiJm4JleFb0tQUQtBN0kozug8n8oCc3
 oW7afg+MQSoaK66DOUeAQYiu+eJCObAgBqg++GyHZekZ2skNJ4J7XYfBHY3E3ZdDMo
 OyPsCQ/Fzg9oi40HyMKI2sTinqSp35lomzXnyUJ0ayv5u7yCDm1k7IrSXo8hMXsG78
 TRtRuKPjSJq1OtueuVW82VcmdLyKkt/npq2AvK6zv0UAxW02aGh6FtLlsXtCjwBWWX
 criFOEqYwAlLg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 4.9 05/13] video: fbdev: skeletonfb: Fix syntax errors
 in comments
Date: Mon, 27 Jun 2022 22:26:49 -0400
Message-Id: <20220628022657.597208-5-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220628022657.597208-1-sashal@kernel.org>
References: <20220628022657.597208-1-sashal@kernel.org>
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
 Xiang wangx <wangxiang@cdjrlc.com>, daniel.vetter@ffwll.ch,
 Helge Deller <deller@gmx.de>, dri-devel@lists.freedesktop.org,
 geert@linux-m68k.org, tzimmermann@suse.de, bhelgaas@google.com, cssk@net-c.es
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Xiang wangx <wangxiang@cdjrlc.com>

[ Upstream commit fc378794a2f7a19cf26010dc33b89ba608d4c70f ]

Delete the redundant word 'its'.

Signed-off-by: Xiang wangx <wangxiang@cdjrlc.com>
Signed-off-by: Helge Deller <deller@gmx.de>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/video/fbdev/skeletonfb.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/video/fbdev/skeletonfb.c b/drivers/video/fbdev/skeletonfb.c
index f948baa16d82..254bb6e2187c 100644
--- a/drivers/video/fbdev/skeletonfb.c
+++ b/drivers/video/fbdev/skeletonfb.c
@@ -96,7 +96,7 @@ static struct fb_fix_screeninfo xxxfb_fix = {
 
     /*
      * 	Modern graphical hardware not only supports pipelines but some 
-     *  also support multiple monitors where each display can have its  
+     *  also support multiple monitors where each display can have
      *  its own unique data. In this case each display could be  
      *  represented by a separate framebuffer device thus a separate 
      *  struct fb_info. Now the struct xxx_par represents the graphics
-- 
2.35.1

