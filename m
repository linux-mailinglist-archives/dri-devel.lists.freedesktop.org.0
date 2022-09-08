Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F1835B2EA7
	for <lists+dri-devel@lfdr.de>; Fri,  9 Sep 2022 08:19:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A14EC10EBD3;
	Fri,  9 Sep 2022 06:19:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bg4.exmail.qq.com (bg4.exmail.qq.com [43.154.221.58])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DBA96886A4
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Sep 2022 13:15:56 +0000 (UTC)
X-QQ-mid: bizesmtp67t1662642949t2a4ccnm
Received: from localhost.localdomain ( [182.148.14.0])
 by bizesmtp.qq.com (ESMTP) with 
 id ; Thu, 08 Sep 2022 21:15:47 +0800 (CST)
X-QQ-SSF: 01000000002000B0C000B00A0000000
X-QQ-FEAT: 6PjtIMncaizf42yjCOhu+mxafHk4OiQ2WtfpKV4H3SgD63l8fS7p7pKQgnZBV
 nA1CdkYyrZlEFzJxPalVFQBBvqGu+cbDZMeCnTy/T8naZohEF6zADOtBg1hTnBQhZ+tH/YS
 mSkWcFm37vTdH8VCxj7G0M8dTND/EnjKGgPPADdCADLmSGH+JIvkbdTB6mw2txMJcdg+pYS
 xhOQGopcQVVoxGAGe1xGo7ujg4017EpP4WIDeFyFJDmDYF6BtJ2yyPyoLDLEJhWYlr3k2P+
 4DD4leOkpwVV2mqYwJtwD5xd6D9d1jWV+sGnsEXMq1IO2Y7TgszcaEH2IjVtXVPeKBKpBIv
 416ph02yklgwPu1CKHLzXOc059NQiwbrTOaM/laL4mLhrTiCok3QfDk4b6GlA==
X-QQ-GoodBg: 0
From: wangjianli <wangjianli@cdjrlc.com>
To: zackr@vmware.com,
	airlied@linux.ie,
	daniel@ffwll.ch
Subject: [PATCH] drm/vmwgfx: fix repeated words in comments
Date: Thu,  8 Sep 2022 21:15:41 +0800
Message-Id: <20220908131541.39684-1-wangjianli@cdjrlc.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:cdjrlc.com:qybglogicsvr:qybglogicsvr7
X-Mailman-Approved-At: Fri, 09 Sep 2022 06:19:19 +0000
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
Cc: wangjianli <wangjianli@cdjrlc.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Delete the redundant word 'to'.

Signed-off-by: wangjianli <wangjianli@cdjrlc.com>
---
 drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c b/drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c
index f085dbd4736d..7677475b5d93 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c
@@ -409,7 +409,7 @@ static int vmw_view_res_val_add(struct vmw_sw_context *sw_context,
 
 /**
  * vmw_view_id_val_add - Look up a view and add it and the surface it's pointing
- * to to the validation list.
+ * to the validation list.
  *
  * @sw_context: The software context holding the validation list.
  * @view_type: The view type to look up.
-- 
2.36.1

