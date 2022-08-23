Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C0B1059F439
	for <lists+dri-devel@lfdr.de>; Wed, 24 Aug 2022 09:28:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 12C1610E2ED;
	Wed, 24 Aug 2022 07:28:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bg5.exmail.qq.com (bg4.exmail.qq.com [43.154.221.58])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8414C1120F6
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Aug 2022 14:10:46 +0000 (UTC)
X-QQ-mid: bizesmtp80t1661263838ta9jzgkz
Received: from localhost.localdomain ( [182.148.14.124])
 by bizesmtp.qq.com (ESMTP) with 
 id ; Tue, 23 Aug 2022 22:10:37 +0800 (CST)
X-QQ-SSF: 0100000000200040B000B00A0000000
X-QQ-FEAT: znfcQSa1hKb69ljbhEMCIyJVqJcyVDLGX2/wMAZJUY1itMbUtF3rvuqdmNYTv
 dH2/ZQcgOvUGUQ7+ffjWegXeRgahSEt5NOMaSUu/aYxKiH86qIeHHEKCMHSara3mHa3VWo1
 AmclRh24J4xbRqdasWerfW4sPvDCnvjBT+5v8qYmJTbgmS3UQ86EnDPFs6SamykoJU0Scfh
 SDiRAOEsN/np2wJqk1C3cFL51HfQPUU5FdHf8H1fszzHuoTn6b23Q3347h/lvEvKcSqoYOO
 yrFMclAcPxF0n+Kshj6NDeixVHmC/wjwYyQst7DhKCimsf25tA0yjnYGYdTr3D2e8WT6ZQn
 Pp4y4jLFcRHCiGTpBMOt3ftcvmEz2Zkz/hw0sUzkMJpZH6Qu8dZgnPxHUepCQ==
X-QQ-GoodBg: 0
From: wangjianli <wangjianli@cdjrlc.com>
To: zackr@vmware.com, linux-graphics-maintainer@vmware.com, airlied@linux.ie,
 daniel@ffwll.ch
Subject: [PATCH] drm/vmwgfx: fix repeated words in comments
Date: Tue, 23 Aug 2022 22:10:30 +0800
Message-Id: <20220823141030.9078-1-wangjianli@cdjrlc.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:cdjrlc.com:qybglogicsvr:qybglogicsvr7
X-Mailman-Approved-At: Wed, 24 Aug 2022 07:28:14 +0000
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
index d49de4905efa..23e773222019 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c
@@ -381,7 +381,7 @@ static int vmw_execbuf_res_noctx_val_add(struct vmw_sw_context *sw_context,
 }
 
 /**
- * vmw_view_res_val_add - Add a view and the surface it's pointing to to the
+ * vmw_view_res_val_add - Add a view and the surface it's pointing to the
  * validation list
  *
  * @sw_context: The software context holding the validation list.
-- 
2.36.1

