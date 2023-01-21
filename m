Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0433D6768F5
	for <lists+dri-devel@lfdr.de>; Sat, 21 Jan 2023 21:10:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 678B910E411;
	Sat, 21 Jan 2023 20:10:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 715E510E3D1
 for <dri-devel@lists.freedesktop.org>; Sat, 21 Jan 2023 20:07:58 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id 76DFBCE0923;
 Sat, 21 Jan 2023 20:07:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 04FE8C433AA;
 Sat, 21 Jan 2023 20:07:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1674331671;
 bh=hAxrk9UsJQtOO5XSk3/JHr9M5aYd8a0ea1f3DSjsbn0=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
 b=JRWqmNu8qMoWmiKURosTNHcEMOkh/a3MpOakzcF50b6WU5ix/Q2vSjya4CBgnO5Q5
 Q+n1fsoL/7aGJpX4nQ/q2shDcLplogxHxvR4qCWKcYG7dvLBriaNR33IXO9LuW4Rfg
 OFSuJS/ZAml1vyfvoJzvsOC83ec6VQSdYRtKokBkD3kyfmjEuPYYcgxAAnfuzb8SNx
 7sP5YX3VQ8ainu8PZBxr+dXGif5t6CnrbtrjcAUrHzzdOLoSeEkdWDiWzawrkyeg9k
 azGHpvCjAW5xm/9Q69r7zDwGIb93W+Lky99cZsmpz9Q1LaUjPqbf14uaTDm5+XotIv
 daBgZahX75lLA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by smtp.lore.kernel.org (Postfix) with ESMTP id EB6C6C54737;
 Sat, 21 Jan 2023 20:07:50 +0000 (UTC)
From: Sam Ravnborg via B4 Submission Endpoint
 <devnull+sam.ravnborg.org@kernel.org>
Date: Sat, 21 Jan 2023 21:07:50 +0100
Subject: [PATCH 12/86] drm/vc4: Direct include headers from drm_print
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230113-drm-include-v1-v1-12-c5cf72d8a5a2@ravnborg.org>
References: <20230113-drm-include-v1-v1-0-c5cf72d8a5a2@ravnborg.org>
In-Reply-To: <20230113-drm-include-v1-v1-0-c5cf72d8a5a2@ravnborg.org>
To: dri-devel@lists.freedesktop.org
X-Mailer: b4 0.12.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1674331666; l=666;
 i=sam@ravnborg.org; s=20230107; h=from:subject:message-id;
 bh=94GJRmVWzEzsZZMITso9w0Uzc/x2L+xwXvzK7NPyL1w=; =?utf-8?q?b=3DexCtbi9KUCPl?=
 =?utf-8?q?TeQoCl+on4kdUPWiU4Xt27B8mvSaTIoa66FXlgWpDHKOqB9xtS2zZMD4/gGjwZmV?=
 TS+0voshBH+auuvRDrZkADxngaKMu5bDf4x1HhU2gjH/M6DI5z9z
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
 drivers/gpu/drm/vc4/vc4_drv.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/vc4/vc4_drv.h b/drivers/gpu/drm/vc4/vc4_drv.h
index 95069bb16821..be2b3309c599 100644
--- a/drivers/gpu/drm/vc4/vc4_drv.h
+++ b/drivers/gpu/drm/vc4/vc4_drv.h
@@ -5,6 +5,7 @@
 #ifndef _VC4_DRV_H_
 #define _VC4_DRV_H_
 
+#include <linux/debugfs.h>
 #include <linux/delay.h>
 #include <linux/of.h>
 #include <linux/refcount.h>

-- 
2.34.1

