Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CD0A05A02D0
	for <lists+dri-devel@lfdr.de>; Wed, 24 Aug 2022 22:33:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3ABB68A594;
	Wed, 24 Aug 2022 20:33:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bg5.exmail.qq.com (bg4.exmail.qq.com [43.154.221.58])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AEA7E10E356
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Aug 2022 14:12:09 +0000 (UTC)
X-QQ-mid: bizesmtp89t1661263923tx83jlr4
Received: from localhost.localdomain ( [182.148.14.124])
 by bizesmtp.qq.com (ESMTP) with 
 id ; Tue, 23 Aug 2022 22:12:01 +0800 (CST)
X-QQ-SSF: 0100000000200040B000B00A0000000
X-QQ-FEAT: znfcQSa1hKYzzlmEkavydIuQBfcQG+Gw6Ff3QaZY4yoHaABX9TSRukEz/XikS
 xGfiPf5JhYBhXEDIkLKv/YfwsQsGkKpDhi+00nW2+GOCyBlJggUcu5I8EaM4Ckx0NQA4KUn
 1ym8Mdr5BCRKzVuskuqyycqjegswQu1VpvK7j2ZahEtwv/wCJNQ1Bj394wdkM6+s0IyhYVq
 f3st/RXI9Prm/Z56KnFiNK0TeY5ZxoVbz2vj2wGzMueWL7EktU1CMPkJ6+GD6rW7J74oQLB
 Vc2H2ZuWb0x24m+D7N6voZXYPO8mthvsNi1JbtiRxrvez/IKbqWiKwFG+TPqjn+aNNsZnJ/
 hbWSQEADMKjRyYMTAUrqkcRBChndtomxHXOW2pdiEAQL+MQ2SE=
X-QQ-GoodBg: 0
From: wangjianli <wangjianli@cdjrlc.com>
To: maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 irlied@linux.ie, daniel@ffwll.ch
Subject: [PATCH] gpu/drm: fix repeated words in comments
Date: Tue, 23 Aug 2022 22:11:54 +0800
Message-Id: <20220823141154.9956-1-wangjianli@cdjrlc.com>
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

 Delete the redundant word 'the'.

Signed-off-by: wangjianli <wangjianli@cdjrlc.com>
---
 drivers/gpu/drm/drm_mipi_dsi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_mipi_dsi.c b/drivers/gpu/drm/drm_mipi_dsi.c
index c40bde96cfdf..fd2790a5664d 100644
--- a/drivers/gpu/drm/drm_mipi_dsi.c
+++ b/drivers/gpu/drm/drm_mipi_dsi.c
@@ -606,7 +606,7 @@ EXPORT_SYMBOL(mipi_dsi_turn_on_peripheral);
 
 /*
  * mipi_dsi_set_maximum_return_packet_size() - specify the maximum size of the
- *    the payload in a long packet transmitted from the peripheral back to the
+ *    payload in a long packet transmitted from the peripheral back to the
  *    host processor
  * @dsi: DSI peripheral device
  * @value: the maximum size of the payload
-- 
2.36.1

