Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 173E06768C2
	for <lists+dri-devel@lfdr.de>; Sat, 21 Jan 2023 21:08:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5253D10E3EC;
	Sat, 21 Jan 2023 20:08:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 850FD10E3DE
 for <dri-devel@lists.freedesktop.org>; Sat, 21 Jan 2023 20:07:56 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id CA8DCB80816;
 Sat, 21 Jan 2023 20:07:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 0B859C433A8;
 Sat, 21 Jan 2023 20:07:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1674331672;
 bh=kkfXKf7Ct4H06XMQiGajUIgm2hoGVGrH9BYhoW9fE9c=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
 b=R200U8DPuHLFFYnRMzKoYx6xJdAZ17I1K4YLAh2guuTg1NS8N0Ig39PnW30gMvH+f
 KscOKRd5fm1f7KvD2yXQ01PDW7i5qEiFDAHLvdYFXDv5G5cublVIPXTdaWZVdgAKj8
 glsDk1wPwkYbzqSc/Nz9OhHvIFLwxMHIqKRgGBEg438WBX+OMJi0rgeaiIgnJxk/6f
 ZeJ4fGb9wfIwatLX3Q/bIzWYaMFKeRrzFHBf21iSGDek0Y7I2Ihw81s6cUbyzZwc50
 BpfJA1yXfUG8uJTP0l9goqaRoI/cwVRDcWD6k2FutmqWoHVdK3hQC5Bkw0t7y/bH5/
 rtTY3w+aDrXrg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by smtp.lore.kernel.org (Postfix) with ESMTP id F0452C38159;
 Sat, 21 Jan 2023 20:07:51 +0000 (UTC)
From: Sam Ravnborg via B4 Submission Endpoint
 <devnull+sam.ravnborg.org@kernel.org>
Date: Sat, 21 Jan 2023 21:08:12 +0100
Subject: [PATCH 34/86] drm/bridge: lvds-codec: Direct include headers from
 drm_atomic_helper
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230113-drm-include-v1-v1-34-c5cf72d8a5a2@ravnborg.org>
References: <20230113-drm-include-v1-v1-0-c5cf72d8a5a2@ravnborg.org>
In-Reply-To: <20230113-drm-include-v1-v1-0-c5cf72d8a5a2@ravnborg.org>
To: dri-devel@lists.freedesktop.org
X-Mailer: b4 0.12.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1674331667; l=761;
 i=sam@ravnborg.org; s=20230107; h=from:subject:message-id;
 bh=swEth/xWgxR1qTykuur00/G4jmy/QvxeJrsO14iawik=; =?utf-8?q?b=3Dxzw6nlHMqxm5?=
 =?utf-8?q?/EGQDiVnpR8vWhy35GGX5rU1jI0lQre7V7mGTnBjNBBxUToZRUaapAuAfGAqAHLr?=
 i8zW0CUfCNgp0Eq18wKRL+mmwdTPk0sIfwGAsVBXkwKlFxQ+Sgbq
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
 drivers/gpu/drm/bridge/lvds-codec.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/bridge/lvds-codec.c b/drivers/gpu/drm/bridge/lvds-codec.c
index 39e7004de720..ea014e9011c9 100644
--- a/drivers/gpu/drm/bridge/lvds-codec.c
+++ b/drivers/gpu/drm/bridge/lvds-codec.c
@@ -13,6 +13,7 @@
 #include <linux/regulator/consumer.h>
 
 #include <drm/drm_atomic_helper.h>
+#include <drm/drm_atomic_state_helper.h>
 #include <drm/drm_bridge.h>
 #include <drm/drm_of.h>
 #include <drm/drm_panel.h>

-- 
2.34.1

