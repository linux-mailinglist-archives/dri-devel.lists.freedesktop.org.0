Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2111B6768DE
	for <lists+dri-devel@lfdr.de>; Sat, 21 Jan 2023 21:10:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E7E5410E409;
	Sat, 21 Jan 2023 20:10:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F1E0C10E3DF
 for <dri-devel@lists.freedesktop.org>; Sat, 21 Jan 2023 20:07:52 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id CE4DF60B83;
 Sat, 21 Jan 2023 20:07:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 4ACE9C4339C;
 Sat, 21 Jan 2023 20:07:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1674331672;
 bh=HE7k7YiGgfOJdzepy5IjijsartNHU69IWdl1FXQdI0E=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
 b=JzLvbSKrgPan33TTfFxm7M5w/Pif+XvS3RNlK/YWQ7HguaJbCLDXv3AP2jhu9U1Pj
 Z1TzhB4JXjTZHo7+Azl4BpIW6ShC47hC/I9dbK9W1PViPKPf3SWrzMCEoMw/+pelRS
 NSfI9AbjUQuUtAoBHxnktgBZ8GLl7EOfr4n8ySfn3a0z/PFX2lJwRdbkvWbkNuGdQ/
 Ui1VcfTg/N3v9B0b6vcQ9cU8ZptYfZOVPG0gPRWSYh59/Qn1qXThjRIFrT8lSZKh1q
 gbUeBrioSj2rwQruPdkcp7kTXQP6fDJmJeMhAfVJeHE4QQ3x/5sHSbcrL2pTtR5yOP
 cWKkkCDJul2vg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by smtp.lore.kernel.org (Postfix) with ESMTP id 3B90CC38142;
 Sat, 21 Jan 2023 20:07:52 +0000 (UTC)
From: Sam Ravnborg via B4 Submission Endpoint
 <devnull+sam.ravnborg.org@kernel.org>
Date: Sat, 21 Jan 2023 21:08:17 +0100
Subject: [PATCH 39/86] drm/bridge: simple-bridge: Direct include headers
 from drm_atomic_helper
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230113-drm-include-v1-v1-39-c5cf72d8a5a2@ravnborg.org>
References: <20230113-drm-include-v1-v1-0-c5cf72d8a5a2@ravnborg.org>
In-Reply-To: <20230113-drm-include-v1-v1-0-c5cf72d8a5a2@ravnborg.org>
To: dri-devel@lists.freedesktop.org
X-Mailer: b4 0.12.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1674331667; l=894;
 i=sam@ravnborg.org; s=20230107; h=from:subject:message-id;
 bh=DJo7mOLTGgSvmLnDKIhWwVHh91Wv4tZ9ZoFB7YNWQXY=; =?utf-8?q?b=3DmK5OOjqcFTzU?=
 =?utf-8?q?eBQvIo52NmMzlNGxljik+rwjN5yrUhSjTIsYw0rCbBNnzOnGhcxCQqmmQi6qlQZs?=
 4HvUQle4BFicMQ7aanrReztHr6qmilws4CXPINNxZLoiLojLptq4
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
 drivers/gpu/drm/bridge/simple-bridge.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/bridge/simple-bridge.c b/drivers/gpu/drm/bridge/simple-bridge.c
index 2c5c5211bdab..7471dfef80d6 100644
--- a/drivers/gpu/drm/bridge/simple-bridge.c
+++ b/drivers/gpu/drm/bridge/simple-bridge.c
@@ -13,9 +13,11 @@
 #include <linux/regulator/consumer.h>
 
 #include <drm/drm_atomic_helper.h>
+#include <drm/drm_atomic_state_helper.h>
 #include <drm/drm_bridge.h>
 #include <drm/drm_crtc.h>
 #include <drm/drm_edid.h>
+#include <drm/drm_modeset_helper_vtables.h>
 #include <drm/drm_print.h>
 #include <drm/drm_probe_helper.h>
 

-- 
2.34.1

