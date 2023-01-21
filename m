Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DD2F6768D1
	for <lists+dri-devel@lfdr.de>; Sat, 21 Jan 2023 21:09:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 37E6310E3FD;
	Sat, 21 Jan 2023 20:09:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A443210E3D7
 for <dri-devel@lists.freedesktop.org>; Sat, 21 Jan 2023 20:07:52 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 10DCC60B75;
 Sat, 21 Jan 2023 20:07:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 11702C433AF;
 Sat, 21 Jan 2023 20:07:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1674331671;
 bh=Jw60BFxBCLwrcuxa/BCRcL9MjoIZxaSJbDSTR3q4ye0=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
 b=dPgh4Tf2lO1Hoto3QUKfdIkIYp6t8o2czznevktETMnUGfwVa89aZWxmmJxDBsLSM
 bnjVWHp8FYGXFZIQtSHkoVNEGLZlM8yb2zozDroA9KiqVtBe4+z7E95wSF9Q9H1h7k
 qobHU33iT8conbxByTSt5r3FeqZkAQfAIZ+FWUMyHGlT3fBcYcVSnUhrKDf8Lq7nvC
 F/h+kvy2Hom10sZcA8GbeFgBOTBLtTsx3lGnEB0EuelV+voVayi2iuJ9osLGRBRVlP
 kr6g5ObKQi8IuiMtf/2LoObARES8BONASLtyNO/XmiIpENQvUutRIlnTNFUHo2LCQS
 BIdYeb09p5R1Q==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by smtp.lore.kernel.org (Postfix) with ESMTP id 016ABC54E94;
 Sat, 21 Jan 2023 20:07:51 +0000 (UTC)
From: Sam Ravnborg via B4 Submission Endpoint
 <devnull+sam.ravnborg.org@kernel.org>
Date: Sat, 21 Jan 2023 21:07:51 +0100
Subject: [PATCH 13/86] drm/drm_print: Direct include headers from drm_print
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230113-drm-include-v1-v1-13-c5cf72d8a5a2@ravnborg.org>
References: <20230113-drm-include-v1-v1-0-c5cf72d8a5a2@ravnborg.org>
In-Reply-To: <20230113-drm-include-v1-v1-0-c5cf72d8a5a2@ravnborg.org>
To: dri-devel@lists.freedesktop.org
X-Mailer: b4 0.12.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1674331666; l=651;
 i=sam@ravnborg.org; s=20230107; h=from:subject:message-id;
 bh=7KXJCWkFWKPNFIC79wR1Y8lPS/u8bCjQL7Q0+ubnegA=; =?utf-8?q?b=3DkjU66ZypyKPI?=
 =?utf-8?q?TP4o0jTtv9l9wj6ZVJCMBdZPN5g+FdbSs3MoUcgo0UXGI23VCRMuMwmyGGQ+xhQJ?=
 tWBjd3J3C/SZN5TNFZNdb7fJvaOs9AvCEKjT6SD6h2jkQ0w4llq6
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
 drivers/gpu/drm/drm_print.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/drm_print.c b/drivers/gpu/drm/drm_print.c
index 5b93c11895bb..c444fd9ea186 100644
--- a/drivers/gpu/drm/drm_print.c
+++ b/drivers/gpu/drm/drm_print.c
@@ -25,6 +25,7 @@
 
 #include <linux/stdarg.h>
 
+#include <linux/debugfs.h>
 #include <linux/io.h>
 #include <linux/moduleparam.h>
 #include <linux/seq_file.h>

-- 
2.34.1

