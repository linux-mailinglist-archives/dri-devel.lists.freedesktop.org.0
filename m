Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 850DC6768F6
	for <lists+dri-devel@lfdr.de>; Sat, 21 Jan 2023 21:10:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E3A5810E427;
	Sat, 21 Jan 2023 20:10:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA3A310E3DD
 for <dri-devel@lists.freedesktop.org>; Sat, 21 Jan 2023 20:07:52 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id C8D9B60B84;
 Sat, 21 Jan 2023 20:07:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 29ADAC433EF;
 Sat, 21 Jan 2023 20:07:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1674331672;
 bh=us6bPEgx3Z6vH87z9rkas4e5Z/njYwIxlhy1s6W1Jgk=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
 b=qpf3tyVJeeS6cBvhXwp7nJEn6CtyIHFPCSWQEEorfck9X0S8d7ja21yRCfANmKU7I
 WqYxtgujuOJRfA7xu25SOZVWTLxWL/4iRwvV4LCnFu/5r0l5htjlraEQrHVq/xfgl0
 TDCsw4L9dJNsfajd9QavHMhlwSBRctomStDUFy7iEYJrK1i3eFUcjmh5Z8/M8cCaIS
 xtqfibwfXWWXCoNc2wJ58qQ+sbD9ZUlrRTNslaORVqpL+4dfTKdiseTubJpx3VewhU
 lxKi17mAkTXWJWMHGR26dLWWVTKzf2W2gkfJhXAKWklk1UV7fHLG9Zi9vixaQIKyX+
 szoZXgJEZ8Ktg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by smtp.lore.kernel.org (Postfix) with ESMTP id 19EF7C54E94;
 Sat, 21 Jan 2023 20:07:52 +0000 (UTC)
From: Sam Ravnborg via B4 Submission Endpoint
 <devnull+sam.ravnborg.org@kernel.org>
Date: Sat, 21 Jan 2023 21:08:15 +0100
Subject: [PATCH 37/86] drm/bridge: panel: Direct include headers from
 drm_atomic_helper
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230113-drm-include-v1-v1-37-c5cf72d8a5a2@ravnborg.org>
References: <20230113-drm-include-v1-v1-0-c5cf72d8a5a2@ravnborg.org>
In-Reply-To: <20230113-drm-include-v1-v1-0-c5cf72d8a5a2@ravnborg.org>
To: dri-devel@lists.freedesktop.org
X-Mailer: b4 0.12.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1674331667; l=732;
 i=sam@ravnborg.org; s=20230107; h=from:subject:message-id;
 bh=YwNw0L75DwZlB9qXJ3fFWDB9pVTmtS3UB0gjGTSftOQ=; =?utf-8?q?b=3DvkyTyeSN2nuQ?=
 =?utf-8?q?agMfUv4DbHfC96aBiiiq0AxccX3uj7Vmc/UQFvbviN6S/Vip1IiNeTI/AOtUHRHR?=
 N4qvxjlzDOyKumG0a6BwhpgrLgmX5pHp7U4T7GkJwF+6oQ+Qyatv
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
drm_atomic_helper, because drm_atomic_helper will be reduced to
include only the minimal set of headers.

Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
---
 drivers/gpu/drm/bridge/panel.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/bridge/panel.c b/drivers/gpu/drm/bridge/panel.c
index 97c305978f9b..91e6d4bc03b1 100644
--- a/drivers/gpu/drm/bridge/panel.c
+++ b/drivers/gpu/drm/bridge/panel.c
@@ -7,6 +7,7 @@
 #include <linux/debugfs.h>
 
 #include <drm/drm_atomic_helper.h>
+#include <drm/drm_atomic_state_helper.h>
 #include <drm/drm_bridge.h>
 #include <drm/drm_connector.h>
 #include <drm/drm_encoder.h>

-- 
2.34.1

