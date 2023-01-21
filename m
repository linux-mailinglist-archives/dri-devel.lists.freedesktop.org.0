Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BA646768CE
	for <lists+dri-devel@lfdr.de>; Sat, 21 Jan 2023 21:09:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4493A10E3F6;
	Sat, 21 Jan 2023 20:09:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 72CEB10E3EB
 for <dri-devel@lists.freedesktop.org>; Sat, 21 Jan 2023 20:07:53 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id D3883B807E4;
 Sat, 21 Jan 2023 20:07:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 7DFB2C433EF;
 Sat, 21 Jan 2023 20:07:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1674331670;
 bh=GO6nBie9DpyE6O/+p1EvmvRONWTGqIMt2nb7ucMDrG0=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
 b=mTeSzTi5hLnVvi9Ar16DAuvKuRKJWWAFtGJGezFNVj4cM6onYOUU53zUJ1lYoUZXy
 d9R70cY0ure3dv59jxTjxlC9wdrFDQPTmJ124I+mrOHTgj2ZiwC6fT4R/UZGWBG4S3
 w3gOp94yf17wWg4XnkCS2C48KN1ZMocYAiYmSjUwAp84zGVmsWcwedFBUqmeoezDPo
 Pbbh+9+CGToBoaywAUflHCS3B53Rh1lZqLBu2KGgksxdydAXU8pNfIA7TUbEWoqyMF
 dtU1jvfolFnafBuaCptoBX8sA9sX/4Uvlg7NcvnronJerGFJ9uvGVMElLrcwdRSLOc
 bIZr0h/ZFU47A==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by smtp.lore.kernel.org (Postfix) with ESMTP id 63C72C52D77;
 Sat, 21 Jan 2023 20:07:50 +0000 (UTC)
From: Sam Ravnborg via B4 Submission Endpoint
 <devnull+sam.ravnborg.org@kernel.org>
Date: Sat, 21 Jan 2023 21:07:40 +0100
Subject: [PATCH 02/86] drm/bridge: ite-it6505: Direct include headers from
 drm_print
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230113-drm-include-v1-v1-2-c5cf72d8a5a2@ravnborg.org>
References: <20230113-drm-include-v1-v1-0-c5cf72d8a5a2@ravnborg.org>
In-Reply-To: <20230113-drm-include-v1-v1-0-c5cf72d8a5a2@ravnborg.org>
To: dri-devel@lists.freedesktop.org
X-Mailer: b4 0.12.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1674331666; l=955;
 i=sam@ravnborg.org; s=20230107; h=from:subject:message-id;
 bh=PXjFrIkPGFbhb6CLPdMJXmdce9NEOxxLArs7WJsY1U8=; =?utf-8?q?b=3DpWDFvd4ku/jt?=
 =?utf-8?q?9cUHFDNzIXfpBhAjRBHlKBzcLGf2ta31BsMn3JqQglFuThVsaM9sjGQxa3gtnQmL?=
 K8xz4zaxAw09hRcjFx+sDL2Rpi9mbaxFvghrzSeCXA5gSXvH5nZg
X-Developer-Key: i=sam@ravnborg.org; a=ed25519;
 pk=R0+pqV7BRYOAeOIGkyOrSNke7arx5y3LkEuNi37YEyU=
X-Endpoint-Received: by B4 Submission Endpoint for sam@ravnborg.org/20230107
 with auth_id=22
X-Original-From: Sam Ravnborg <sam@ravnborg.org>
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
Reply-To: sam@ravnborg.org
Cc: Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Sam Ravnborg <sam@ravnborg.org>

Direct include the headers that otherwise comes indirect from
drm_print.h, because drm_print.h will be reduced to
include only the minimal set of headers.

Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
---
 drivers/gpu/drm/bridge/ite-it6505.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/bridge/ite-it6505.c b/drivers/gpu/drm/bridge/ite-it6505.c
index bc451b2a77c2..ef42cd840958 100644
--- a/drivers/gpu/drm/bridge/ite-it6505.c
+++ b/drivers/gpu/drm/bridge/ite-it6505.c
@@ -3,6 +3,7 @@
  * Copyright (c) 2020, The Linux Foundation. All rights reserved.
  */
 #include <linux/bits.h>
+#include <linux/debugfs.h>
 #include <linux/delay.h>
 #include <linux/device.h>
 #include <linux/err.h>
@@ -16,6 +17,7 @@
 #include <linux/pm_runtime.h>
 #include <linux/regmap.h>
 #include <linux/regulator/consumer.h>
+#include <linux/seq_file.h>
 #include <linux/types.h>
 #include <linux/wait.h>
 

-- 
2.34.1

