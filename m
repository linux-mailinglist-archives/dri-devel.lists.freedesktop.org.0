Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 64AA217A3DA
	for <lists+dri-devel@lfdr.de>; Thu,  5 Mar 2020 12:16:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 74AA96E1CE;
	Thu,  5 Mar 2020 11:16:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 1227 seconds by postgrey-1.36 at gabe;
 Thu, 05 Mar 2020 11:16:07 UTC
Received: from gateway32.websitewelcome.com (gateway32.websitewelcome.com
 [192.185.145.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BAF036E1F1
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Mar 2020 11:16:07 +0000 (UTC)
Received: from cm10.websitewelcome.com (cm10.websitewelcome.com [100.42.49.4])
 by gateway32.websitewelcome.com (Postfix) with ESMTP id C03FA1D54A
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Mar 2020 04:55:39 -0600 (CST)
Received: from gator4166.hostgator.com ([108.167.133.22]) by cmsmtp with SMTP
 id 9oAFjLE9sEfyq9oAFjP3DI; Thu, 05 Mar 2020 04:55:39 -0600
X-Authority-Reason: nr=8
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=embeddedor.com; s=default; h=Content-Type:MIME-Version:Message-ID:Subject:
 Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=2UNPPtItSNUQGmDGD44ZlASeILkN2vjqOxop8DEMi3I=; b=ePP0Qx2DvBLNe4AQoXUT8cIsrT
 1wWKKFCyoG8MG8QLfyS76UkF3oIPLr3OFYtfoAVNatsKSe5ncEPtd9S5v3Rqr+lvyg3Wf7Tom2/vA
 ooiuLUBIiTeF6PPezqVSm0O+9SzuK/5cOW5tya6sF8awIB0czN9mFi4PrOC3S2WdRTm2xY+Fonx29
 JqUrU+HDw7xvMlLGpMh9DHdKJZf14fS2gF6TzSfZSvrbSSxKID4dx7VPrIOv3s/VOABN3lD6IevWE
 nCYq9h4ZLFBs1lPdympnWoPZxJnS55cGtdBuEmTNzSPHPbKjitkInnzvUNNNqXiSU/968+QeodiEG
 5P9J65FQ==;
Received: from [201.166.169.220] (port=12523 helo=embeddedor)
 by gator4166.hostgator.com with esmtpa (Exim 4.92)
 (envelope-from <gustavo@embeddedor.com>)
 id 1j9oAD-003hIb-4N; Thu, 05 Mar 2020 04:55:37 -0600
Date: Thu, 5 Mar 2020 04:58:42 -0600
From: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
To: VMware Graphics <linux-graphics-maintainer@vmware.com>,
 Thomas Hellstrom <thellstrom@vmware.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH][next] drm/vmwgfx: Replace zero-length array with
 flexible-array member
Message-ID: <20200305105842.GA20860@embeddedor>
MIME-Version: 1.0
Content-Disposition: inline
User-Agent: Mutt/1.9.4 (2018-02-28)
X-AntiAbuse: This header was added to track abuse,
 please include it with any abuse report
X-AntiAbuse: Primary Hostname - gator4166.hostgator.com
X-AntiAbuse: Original Domain - lists.freedesktop.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - embeddedor.com
X-BWhitelist: no
X-Source-IP: 201.166.169.220
X-Source-L: No
X-Exim-ID: 1j9oAD-003hIb-4N
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: (embeddedor) [201.166.169.220]:12523
X-Source-Auth: gustavo@embeddedor.com
X-Email-Count: 36
X-Source-Cap: Z3V6aWRpbmU7Z3V6aWRpbmU7Z2F0b3I0MTY2Lmhvc3RnYXRvci5jb20=
X-Local-Domain: yes
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 "Gustavo A. R. Silva" <gustavo@embeddedor.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The current codebase makes use of the zero-length array language
extension to the C90 standard, but the preferred mechanism to declare
variable-length types such as these ones is a flexible array member[1][2],
introduced in C99:

struct foo {
        int stuff;
        struct boo array[];
};

By making use of the mechanism above, we will get a compiler warning
in case the flexible array does not occur last in the structure, which
will help us prevent some kind of undefined behavior bugs from being
inadvertently introduced[3] to the codebase from now on.

Also, notice that, dynamic memory allocations won't be affected by
this change:

"Flexible array members have incomplete type, and so the sizeof operator
may not be applied. As a quirk of the original implementation of
zero-length arrays, sizeof evaluates to zero."[1]

This issue was found with the help of Coccinelle.

[1] https://gcc.gnu.org/onlinedocs/gcc/Zero-Length.html
[2] https://github.com/KSPP/linux/issues/21
[3] commit 76497732932f ("cxgb3/l2t: Fix undefined behaviour")

Signed-off-by: Gustavo A. R. Silva <gustavo@embeddedor.com>
---
 drivers/gpu/drm/vmwgfx/vmwgfx_page_dirty.c | 2 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_surface.c    | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_page_dirty.c b/drivers/gpu/drm/vmwgfx/vmwgfx_page_dirty.c
index f07aa857587c..60cfbfadd3f2 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_page_dirty.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_page_dirty.c
@@ -69,7 +69,7 @@ struct vmw_bo_dirty {
 	unsigned int ref_count;
 	unsigned long bitmap_size;
 	size_t size;
-	unsigned long bitmap[0];
+	unsigned long bitmap[];
 };
 
 /**
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_surface.c b/drivers/gpu/drm/vmwgfx/vmwgfx_surface.c
index 3ce630aa4fde..ec893cd17b50 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_surface.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_surface.c
@@ -79,7 +79,7 @@ struct vmw_surface_dirty {
 	struct svga3dsurface_cache cache;
 	size_t size;
 	u32 num_subres;
-	SVGA3dBox boxes[0];
+	SVGA3dBox boxes[];
 };
 
 static void vmw_user_surface_free(struct vmw_resource *res);
-- 
2.25.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
