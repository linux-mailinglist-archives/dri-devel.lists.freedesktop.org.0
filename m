Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 32E916E8D00
	for <lists+dri-devel@lfdr.de>; Thu, 20 Apr 2023 10:42:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC7C710EBE2;
	Thu, 20 Apr 2023 08:41:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8CDAB10EBDF
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Apr 2023 08:41:56 +0000 (UTC)
Received: from localhost.localdomain (unknown
 [IPv6:2a02:2f08:4a06:df00:9eb6:d0ff:fe91:8037])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: mvlad)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 78D636603260;
 Thu, 20 Apr 2023 09:41:53 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1681980114;
 bh=N4/94JtOEZ4X/fOEEmtlia4gYzBnalJE25/8Ejbzfd0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=ZbjZMEyREloGmuclFaO0+QQW6KdReNSJ50IIn3hVShWayPdejg4jD7ze4vNplj/OO
 LP6MGopi/l30BwCCDp1PRzDWfcb51Y/9+L3UtXLYuim9B6jTC6KbX9qxmr6hVpKXph
 vq68riO6m0cShjNb6Yz+1aCwGp2vQ1DzMwqPaLWUbuuK1z+MPOKgh5KCyaLJcSwNUw
 9J41VdnDZBPuZ/EALHk1oJblLGhCHiq1ZxTTMHAArbeBOYCdt7RbBt6iKjjQOe5mls
 SzcCN+2QFL1Zz03K9e/gtfz6h0TY+09d91wdLvGGYpGQEkfE3qBPLizfHW2855n1zG
 7RIjWa0WeF7Fg==
From: Marius Vlad <marius.vlad@collabora.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v3 3/3] Documentation/gpu/vkms.rst: Added a note about plane
 migration
Date: Thu, 20 Apr 2023 11:41:47 +0300
Message-Id: <20230420084147.19042-4-marius.vlad@collabora.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230420084147.19042-1-marius.vlad@collabora.com>
References: <20230420084147.19042-1-marius.vlad@collabora.com>
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
 mcanal@igalia.com, melissa.srw@gmail.com, marius.vlad@collabora.com,
 igormtorrente@gmail.com
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

