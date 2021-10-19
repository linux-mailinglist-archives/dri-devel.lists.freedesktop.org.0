Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 636E84333B7
	for <lists+dri-devel@lfdr.de>; Tue, 19 Oct 2021 12:40:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B2F76E241;
	Tue, 19 Oct 2021 10:40:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out30-57.freemail.mail.aliyun.com
 (out30-57.freemail.mail.aliyun.com [115.124.30.57])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D2BD6E241
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Oct 2021 10:40:47 +0000 (UTC)
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R141e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=e01e04423;
 MF=jiapeng.chong@linux.alibaba.com; NM=1; PH=DS; RN=7; SR=0;
 TI=SMTPD_---0Usvb6RI_1634640031; 
Received: from
 j63c13417.sqa.eu95.tbsite.net(mailfrom:jiapeng.chong@linux.alibaba.com
 fp:SMTPD_---0Usvb6RI_1634640031) by smtp.aliyun-inc.com(127.0.0.1);
 Tue, 19 Oct 2021 18:40:44 +0800
From: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
To: thierry.reding@gmail.com
Cc: sam@ravnborg.org, airlied@linux.ie, daniel@ffwll.ch,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 chongjiapeng <jiapeng.chong@linux.alibaba.com>
Subject: [PATCH] drm/panel: make sharp_ls055d1sx04 static
Date: Tue, 19 Oct 2021 18:40:29 +0800
Message-Id: <1634640029-12335-1-git-send-email-jiapeng.chong@linux.alibaba.com>
X-Mailer: git-send-email 1.8.3.1
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: chongjiapeng <jiapeng.chong@linux.alibaba.com>

This symbol is not used outside of panel-novatek-nt35950.c, so marks it
static.

Fixes the following sparse warning:

drivers/gpu/drm/panel/panel-novatek-nt35950.c:671:33: warning: symbol
'sharp_ls055d1sx04' was not declared. Should it be static?

Reported-by: Abaci Robot <abaci@linux.alibaba.com>
Fixes: 623a3531e9cf ("drm/panel: Add driver for Novatek NT35950 DSI DriverIC panels")
Signed-off-by: chongjiapeng <jiapeng.chong@linux.alibaba.com>
---
 drivers/gpu/drm/panel/panel-novatek-nt35950.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/panel/panel-novatek-nt35950.c b/drivers/gpu/drm/panel/panel-novatek-nt35950.c
index d42c7af0d75c..841c2320e439 100644
--- a/drivers/gpu/drm/panel/panel-novatek-nt35950.c
+++ b/drivers/gpu/drm/panel/panel-novatek-nt35950.c
@@ -668,7 +668,7 @@ static const struct nt35950_panel_mode sharp_ls055d1sx04_modes[] = {
 	/* TODO: Add 2160x3840 60Hz when DSC is supported */
 };
 
-const struct nt35950_panel_desc sharp_ls055d1sx04 = {
+static const struct nt35950_panel_desc sharp_ls055d1sx04 = {
 	.model_name = "Sharp LS055D1SX04",
 	.dsi_info = {
 		.type = "LS055D1SX04",
-- 
2.19.1.6.gb485710b

