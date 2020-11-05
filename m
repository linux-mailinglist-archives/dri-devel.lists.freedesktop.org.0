Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 18E862A7AFA
	for <lists+dri-devel@lfdr.de>; Thu,  5 Nov 2020 10:48:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CCE786E1C0;
	Thu,  5 Nov 2020 09:47:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from twspam01.aspeedtech.com (twspam01.aspeedtech.com
 [211.20.114.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A1E36E1C0
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Nov 2020 09:47:55 +0000 (UTC)
Received: from mail.aspeedtech.com ([192.168.0.24])
 by twspam01.aspeedtech.com with ESMTP id 0A59i9fV053765;
 Thu, 5 Nov 2020 17:44:09 +0800 (GMT-8)
 (envelope-from kuohsiang_chou@aspeedtech.com)
Received: from localhost.localdomain.com (192.168.2.206) by TWMBX02.aspeed.com
 (192.168.0.24) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Thu, 5 Nov 2020 17:47:46 +0800
From: KuoHsiang Chou <kuohsiang_chou@aspeedtech.com>
To: <dri-devel@lists.freedesktop.org>
Subject: [PATCH] drm/ast: Fixed 1920x1080 sync. polarity issue
Date: Thu, 5 Nov 2020 17:47:29 +0800
Message-ID: <20201105094729.106059-1-kuohsiang_chou@aspeedtech.com>
X-Mailer: git-send-email 2.18.4
MIME-Version: 1.0
X-Originating-IP: [192.168.2.206]
X-ClientProxiedBy: TWMBX02.aspeed.com (192.168.0.24) To TWMBX02.aspeed.com
 (192.168.0.24)
X-DNSRBL: 
X-MAIL: twspam01.aspeedtech.com 0A59i9fV053765
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
Cc: eich@suse.com, tommy_huang@aspeedtech.com, tzimmermann@suse.de,
 jenmin_yuan@aspeedtech.com, airlied@redhat.com, arc_sung@aspeedtech.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

[Bug] Change the vertical synchroous polary of 1920x1080 @60Hz
      from  Negtive to Positive

Signed-off-by: KuoHsiang Chou <kuohsiang_chou@aspeedtech.com>
---
 drivers/gpu/drm/ast/ast_tables.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/ast/ast_tables.h b/drivers/gpu/drm/ast/ast_tables.h
index 8414e543f260..51efc5b4a55c 100644
--- a/drivers/gpu/drm/ast/ast_tables.h
+++ b/drivers/gpu/drm/ast/ast_tables.h
@@ -295,10 +295,10 @@ static const struct ast_vbios_enhtable res_1600x900[] = {

 static const struct ast_vbios_enhtable res_1920x1080[] = {
 	{2200, 1920, 88, 44, 1125, 1080, 4, 5, VCLK148_5,	/* 60Hz */
-	 (SyncNP | Charx8Dot | LineCompareOff | WideScreenMode | NewModeInfo |
+	 (SyncPP | Charx8Dot | LineCompareOff | WideScreenMode | NewModeInfo |
 	  AST2500PreCatchCRT), 60, 1, 0x38 },
 	{2200, 1920, 88, 44, 1125, 1080, 4, 5, VCLK148_5,	/* 60Hz */
-	 (SyncNP | Charx8Dot | LineCompareOff | WideScreenMode | NewModeInfo |
+	 (SyncPP | Charx8Dot | LineCompareOff | WideScreenMode | NewModeInfo |
 	  AST2500PreCatchCRT), 0xFF, 1, 0x38 },
 };

--
2.18.4

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
