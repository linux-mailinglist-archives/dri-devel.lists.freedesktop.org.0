Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E5FD66EDC9A
	for <lists+dri-devel@lfdr.de>; Tue, 25 Apr 2023 09:30:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6138F10E6B0;
	Tue, 25 Apr 2023 07:30:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 71CA610E6A6
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Apr 2023 07:30:21 +0000 (UTC)
Received: from localhost.localdomain (unknown [109.100.38.211])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: mvlad)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 9318B660329C;
 Tue, 25 Apr 2023 08:30:19 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1682407820;
 bh=N4/94JtOEZ4X/fOEEmtlia4gYzBnalJE25/8Ejbzfd0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=ULX/QYbgKTNJuGJDRP4SWEP7vmQyRWSgxQt4mQoy5VmHYe1IaDHqJZHmL2fuCg7ow
 7qq4J1ZMpuKXbFDDUHZWNED38WRKgD+51Gouhj6+HupngqQ7i9viPZvYRdSfDMEvhF
 8/6NbF+qw3eA2AmQckrCf5H1xHEMn5Mgmc1v0BooSVYuOYWmcDkDAbpDN+ocY6GVIP
 0WpArReN9ZZUHwY2Jjn1p3n+fZD9Zq79gBsF5TIsPkoaP8wP7f4i/0eG999PN+OwKa
 r5AtJzHebqcinlnge/EUPml8RL6ZTkLWaT7gCAQvtlNNuAgf/ATPoYLDEka/cnijKh
 wH2pQVGbbMyjw==
From: Marius Vlad <marius.vlad@collabora.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v3 3/3] Documentation/gpu/vkms.rst: Added a note about plane
 migration
Date: Tue, 25 Apr 2023 10:30:12 +0300
Message-Id: <20230425073012.11036-4-marius.vlad@collabora.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230425073012.11036-1-marius.vlad@collabora.com>
References: <20230425073012.11036-1-marius.vlad@collabora.com>
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

