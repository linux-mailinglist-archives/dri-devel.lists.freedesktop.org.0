Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 277356EF247
	for <lists+dri-devel@lfdr.de>; Wed, 26 Apr 2023 12:41:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB5D710E91A;
	Wed, 26 Apr 2023 10:41:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 240D510E947
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Apr 2023 10:41:14 +0000 (UTC)
Received: from localhost.localdomain (unknown [109.100.38.211])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: mvlad)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 65D8466032AD;
 Wed, 26 Apr 2023 11:41:10 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1682505671;
 bh=N4/94JtOEZ4X/fOEEmtlia4gYzBnalJE25/8Ejbzfd0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=JQrzwh+QBe5WcIKZeSRZG4PDRREPwsvrOUj8ZL4XcUkmmNVLUSpX0IhS+EuaUAYiI
 QnE3wjITMkU+EslUm0TwGLs4LWK/PWAgATBYxDtA2eJZSBlwYEw0+RgHVFuHG5mdAu
 n6EomIfjJ26FJZSeSiLvaLfu50KSsk2JBdIAZT54MF95uv6TD7W766gS7N1oEE3Vkn
 CDeFpIz3PK4inW4NqEqTJKTpyveQyJKcykY0UJA3DrOLZ4hRMNRM5+twD4otFmKi8o
 F+WIqCeQvpV71AUAQtZ0Ee16Qfh9JxpHzOxeE+nUbRijxKm95XtIhvzsKIklXdzZym
 9A2oajVUd8IhA==
From: Marius Vlad <marius.vlad@collabora.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v4 3/3] Documentation/gpu/vkms.rst: Added a note about plane
 migration
Date: Wed, 26 Apr 2023 13:40:59 +0300
Message-Id: <20230426104059.28732-4-marius.vlad@collabora.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230426104059.28732-1-marius.vlad@collabora.com>
References: <20230426104059.28732-1-marius.vlad@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: mwen@igalia.com, tzimmermann@suse.de, rodrigosiqueiramelo@gmail.com,
 yixie@chromium.org, mcanal@igalia.com, melissa.srw@gmail.com,
 brpol@chromium.org, marius.vlad@collabora.com, igormtorrente@gmail.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

And remove the run-time configuration comment regarding needing first
more than 1 pipe.

Signed-off-by: Marius Vlad <marius.vlad@collabora.com>
---
 Documentation/gpu/vkms.rst | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/Documentation/gpu/vkms.rst b/Documentation/gpu/vkms.rst
index 49db221c0f52..cfb3406933c0 100644
--- a/Documentation/gpu/vkms.rst
+++ b/Documentation/gpu/vkms.rst
@@ -133,6 +133,8 @@ There's lots of plane features we could add support for:
 - Async updates (currently only possible on cursor plane using the legacy
   cursor api).
 
+- Overlay plane migration between CRTCs
+
 For all of these, we also want to review the igt test coverage and make sure
 all relevant igt testcases work on vkms. They are good options for internship
 project.
@@ -146,8 +148,7 @@ module. Use/Test-cases:
 - Hotplug/hotremove connectors on the fly (to be able to test DP MST handling
   of compositors).
 
-- Configure planes/crtcs/connectors (we'd need some code to have more than 1 of
-  them first).
+- Configure planes/crtcs/connectors
 
 - Change output configuration: Plug/unplug screens, change EDID, allow changing
   the refresh rate.
-- 
2.39.2

