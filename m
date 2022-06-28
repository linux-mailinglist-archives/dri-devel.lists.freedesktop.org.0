Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8741055BD89
	for <lists+dri-devel@lfdr.de>; Tue, 28 Jun 2022 04:25:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 64A2510F250;
	Tue, 28 Jun 2022 02:25:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD58910F247
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Jun 2022 02:25:43 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 68AA4618EC;
 Tue, 28 Jun 2022 02:25:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 75D61C341CB;
 Tue, 28 Jun 2022 02:25:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1656383142;
 bh=eeaBP9D5qgTi5VnY68Jlus768yL8BfTS3ziQKvcbdYA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=jnXEW+q7LSvA1Wp95CvZPt4Jnt0qgl7N2g4aa88uvJO7MMGOY3FPHQLR5RHXX7bRp
 FhD2Gq2Zli6haD0F7N9j+INQVinIuQM8ef7aI2HCUaw+eJSROWVEc8h/w0khyQJO7A
 uZouw8iOSpYPHqtc9wHUpJK2YdKR+XmNcYiy9DAU5/j4HwJI8nTQRvKyUub8emic9q
 QbNAZDJLd9XDQR75OgM5BkXQQGCkbeBJbVj3j8D2Dp/H72RunMNOqQ3t63ww+tgA2J
 2lUmwDeTeL/sGMt50Qx63h4o54M1Wc7bDnO3tBTaL5qRv6rR5SJslpB5lXMI1Llg6V
 lP1SJbltVOYMg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 4.19 09/22] video: fbdev: skeletonfb: Fix syntax
 errors in comments
Date: Mon, 27 Jun 2022 22:25:04 -0400
Message-Id: <20220628022518.596687-9-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220628022518.596687-1-sashal@kernel.org>
References: <20220628022518.596687-1-sashal@kernel.org>
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
 Helge Deller <deller@gmx.de>, dri-devel@lists.freedesktop.org, cssk@net-c.es,
 bhelgaas@google.com, geert@linux-m68k.org, svens@stackframe.org
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
index 812a36cb60c3..ac354909aecf 100644
--- a/drivers/video/fbdev/skeletonfb.c
+++ b/drivers/video/fbdev/skeletonfb.c
@@ -96,7 +96,7 @@ static const struct fb_fix_screeninfo xxxfb_fix = {
 
     /*
      * 	Modern graphical hardware not only supports pipelines but some 
-     *  also support multiple monitors where each display can have its  
+     *  also support multiple monitors where each display can have
      *  its own unique data. In this case each display could be  
      *  represented by a separate framebuffer device thus a separate 
      *  struct fb_info. Now the struct xxx_par represents the graphics
-- 
2.35.1

