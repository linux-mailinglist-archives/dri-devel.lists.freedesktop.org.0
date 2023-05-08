Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DEB646FA1A2
	for <lists+dri-devel@lfdr.de>; Mon,  8 May 2023 09:54:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 90A0F10E140;
	Mon,  8 May 2023 07:54:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0114410E146
 for <dri-devel@lists.freedesktop.org>; Mon,  8 May 2023 07:54:05 +0000 (UTC)
Received: from localhost.localdomain (unknown
 [IPv6:2a02:2f05:8115:9300:9eb6:d0ff:fe91:8037])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: mvlad)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id D90216603292;
 Mon,  8 May 2023 08:54:03 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1683532444;
 bh=7VsQdU5bz+yiUSRD3GWJUoPKbVsu2uauG6KZQB8tu8A=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=QrISE5IENE7ylIP9p0ykIdTDJQ2Z5AywYfskXsmsgeWg86pb7AI8ZSuGiUM2XcoI0
 fpV/9ZnXm0NmbY2O1mvDjASeYLNi1ypiegbFl6RvtfkEuT9MkNQySVLrrZWTzHQJ7z
 DGcfX/c2ULETiKXQYtrYDDyLqwRUeHyMCWyCRHMPAFfeGBC7vf3uNevIJsimX1TJRK
 KK0A51jGAA4eUiCaHN01KA7ma/zrdCXsA+C0TYZQpdyOwaTjmBSO2FpcUAkLkA8oep
 7L2zE4XGXB1ht0inhTSDGSp4srflsnyf5Bdq8UUPrMJQIcj/cl0IRwhw7yYXMqDYf2
 2vLw/UaKvltdw==
From: Marius Vlad <marius.vlad@collabora.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v5 4/4] Documentation/gpu/vkms.rst: Added a note about plane
 migration
Date: Mon,  8 May 2023 10:53:56 +0300
Message-Id: <20230508075356.6511-5-marius.vlad@collabora.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230508075356.6511-1-marius.vlad@collabora.com>
References: <20230508075356.6511-1-marius.vlad@collabora.com>
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
 jshargo@chromium.org, brpol@chromium.org, marius.vlad@collabora.com,
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
index 0f599c897614..5b5b20409e57 100644
--- a/Documentation/gpu/vkms.rst
+++ b/Documentation/gpu/vkms.rst
@@ -128,6 +128,8 @@ There's lots of plane features we could add support for:
 - Async updates (currently only possible on cursor plane using the legacy
   cursor api).
 
+- Overlay plane migration between CRTCs
+
 For all of these, we also want to review the igt test coverage and make sure
 all relevant igt testcases work on vkms. They are good options for internship
 project.
@@ -141,8 +143,7 @@ module. Use/Test-cases:
 - Hotplug/hotremove connectors on the fly (to be able to test DP MST handling
   of compositors).
 
-- Configure planes/crtcs/connectors (we'd need some code to have more than 1 of
-  them first).
+- Configure planes/crtcs/connectors
 
 - Change output configuration: Plug/unplug screens, change EDID, allow changing
   the refresh rate.
-- 
2.39.2

