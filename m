Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 972B544FEAE
	for <lists+dri-devel@lfdr.de>; Mon, 15 Nov 2021 07:33:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 40475898EA;
	Mon, 15 Nov 2021 06:33:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DCA5E898EA
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Nov 2021 06:33:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=h5X8gcsyL1WxSZzJUqESom9+PnxuV9JPbXOEEk5fPhs=; b=uWgnClOH7zriUsMz06ItcAyvnn
 fp6rtbr2KqzYV84LtRji4VAhAO9pMCwi2d/Oenphzj8GT82m3GRPf2SWXyQ0hpXJMXI1QZc61h3+/
 dHRYQ6lU2eWVMJ8RLjYMABFF9PoluQREcsn9Evl95AP+pbT6FEwjl0osYnkxVgiP+w6N5TumIxp0Z
 RYUsB8rlv7xgN6Ae/6+t3FLQUNjGRyNTkp30SHzqoAANvzbUOhsfvYb9QmxeuKrNSS/cQ+13y490z
 oiYmyVKlQpf9YoG7ypO1xaBsUre4GilNoMbwYTKcAndrhDL/yhVxXWgIimvOnv/7QA0wt/lCjkEDa
 b5taH/Kw==;
Received: from [2601:1c0:6280:3f0::aa0b] (helo=bombadil.infradead.org)
 by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mmVY3-00ESW0-32; Mon, 15 Nov 2021 06:32:59 +0000
From: Randy Dunlap <rdunlap@infradead.org>
To: linux-kernel@vger.kernel.org
Subject: [PATCH] fbdev: sh7760fb: document fallthrough cases
Date: Sun, 14 Nov 2021 22:32:57 -0800
Message-Id: <20211115063257.14369-1-rdunlap@infradead.org>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
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
Cc: linux-fbdev@vger.kernel.org, Rich Felker <dalias@libc.org>,
 Nobuhiro Iwamatsu <iwamatsu.nobuhiro@renesas.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>, linux-sh@vger.kernel.org,
 Manuel Lauss <mano@roarinelk.homelinux.net>,
 Randy Dunlap <rdunlap@infradead.org>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fix fallthrough warnings in sh776fb.c:

../drivers/video/fbdev/sh7760fb.c: In function 'sh7760fb_get_color_info':
../drivers/video/fbdev/sh7760fb.c:138:23: warning: this statement may fall through [-Wimplicit-fallthrough=]
  138 |                 lgray = 1;
../drivers/video/fbdev/sh7760fb.c:143:23: warning: this statement may fall through [-Wimplicit-fallthrough=]
  143 |                 lgray = 1;

Just document the current state of code execution/flow.

Fixes: 4a25e41831ee ("video: sh7760fb: SH7760/SH7763 LCDC framebuffer driver")
Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Cc: "Gustavo A. R. Silva" <gustavoars@kernel.org>
Cc: Nobuhiro Iwamatsu <iwamatsu.nobuhiro@renesas.com>
Cc: Manuel Lauss <mano@roarinelk.homelinux.net>
Cc: Yoshinori Sato <ysato@users.sourceforge.jp>
Cc: Rich Felker <dalias@libc.org>
Cc: linux-sh@vger.kernel.org
Cc: linux-fbdev@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org
---
 drivers/video/fbdev/sh7760fb.c |    2 ++
 1 file changed, 2 insertions(+)

--- linux-next-20211112.orig/drivers/video/fbdev/sh7760fb.c
+++ linux-next-20211112/drivers/video/fbdev/sh7760fb.c
@@ -136,11 +136,13 @@ static int sh7760fb_get_color_info(struc
 		break;
 	case LDDFR_4BPP_MONO:
 		lgray = 1;
+		fallthrough;
 	case LDDFR_4BPP:
 		lbpp = 4;
 		break;
 	case LDDFR_6BPP_MONO:
 		lgray = 1;
+		fallthrough;
 	case LDDFR_8BPP:
 		lbpp = 8;
 		break;
