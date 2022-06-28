Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 901DF55BD43
	for <lists+dri-devel@lfdr.de>; Tue, 28 Jun 2022 04:20:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2060710EED8;
	Tue, 28 Jun 2022 02:20:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D38810EED8
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Jun 2022 02:20:08 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id A1CA0617CB;
 Tue, 28 Jun 2022 02:20:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CE655C341CA;
 Tue, 28 Jun 2022 02:20:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1656382807;
 bh=IUT6pKmVPJ2q3phpRNPVddGlPUiUqgs/H5gsyFOvhSY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=tXsx3J9Yvnl1CnZCy4mloqKO0HIFVE1tjILSzmNuJY0kSs2zkRwCF1IplQ0mmSt7o
 gWGzjylXeK3sKNqZe12tqikEE+uULHSFrICgf3LgvF+M9kh8eyfLGA7qwRAfCeGXNd
 7/oQmg+Aj3hYBHqX5zJ03jAZm8md3KjMkbFhUcWY7ECI2NnHgdP1reodBN3vEaXcJe
 Z9n3MMQrn0nrYWZUACTwJk48u9CZo7gaS4tz8CaGuE1mVV3Kw2rSnQJoNCoZi5Uhmd
 VH+VPjw/eQo4xJAghIdBl/dK4Usl0vpc6Xj14ge+xDmx3FqyVFL202KIw/zSZzBv7Z
 nXw0jRiNEJ1qQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.18 30/53] video: fbdev: skeletonfb: Fix syntax
 errors in comments
Date: Mon, 27 Jun 2022 22:18:16 -0400
Message-Id: <20220628021839.594423-30-sashal@kernel.org>
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
Cc: Sasha Levin <sashal@kernel.org>, linux-fbdev@vger.kernel.org,
 Xiang wangx <wangxiang@cdjrlc.com>, daniel.vetter@ffwll.ch,
 Helge Deller <deller@gmx.de>, dri-devel@lists.freedesktop.org, cssk@net-c.es,
 tzimmermann@suse.de, bhelgaas@google.com
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
index bcacfb6934fa..3d4d78362ede 100644
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

