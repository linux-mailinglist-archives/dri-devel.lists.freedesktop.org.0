Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CDF665B83FB
	for <lists+dri-devel@lfdr.de>; Wed, 14 Sep 2022 11:06:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C825210E8C7;
	Wed, 14 Sep 2022 09:06:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A005910E8C5
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Sep 2022 09:06:04 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 24AF9619FD;
 Wed, 14 Sep 2022 09:06:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 75C0EC433D6;
 Wed, 14 Sep 2022 09:06:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1663146363;
 bh=u+3MT7ydy3HfamCwr6YUjXHE0DkQuU8tO5TLlmkcP44=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=aBJDAsToXHggq0k+Va2Fc2abiV1Gpdh2e2NYcT+9gZugsHwSSeHe3yOgB9wT1nbrU
 2jW082bYjEFc+yba+G1og5HEHTdqQlZKKS+nwYWXWHzKl4InoZCkCt4GeIjnJoOlyE
 n2Mc5D2Tx3njKmsohIp/ry3pf0DAv68IOPdiSXOg1WBDLsMbheK61EWhWLDZcRYwoa
 VW+KEsKX9vyHm/wv3QSvFZHdIMT0a6iiSo8zv5GKWJNobpMepPQti50fKFvcpQuWFD
 Flg3OMAHtBRaeJMk6cNzBVM4hfEaS7giikRzU5BaH4v8uYimzk9X8nb9UF1xrbhdap
 8Mxnk9Rh/TQTQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 4.9 05/13] video: fbdev: skeletonfb: Fix syntax errors
 in comments
Date: Wed, 14 Sep 2022 05:05:32 -0400
Message-Id: <20220914090540.471725-5-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220914090540.471725-1-sashal@kernel.org>
References: <20220914090540.471725-1-sashal@kernel.org>
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
index f948baa16d829..254bb6e2187cd 100644
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

