Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A7C9634A5A6
	for <lists+dri-devel@lfdr.de>; Fri, 26 Mar 2021 11:32:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F2786F3BE;
	Fri, 26 Mar 2021 10:32:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A1EC06F3B5
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Mar 2021 10:32:25 +0000 (UTC)
Received: from guri.fritz.box (unknown
 [IPv6:2a02:810a:880:f54:c9ad:9cf9:303d:3688])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: dafna)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id F411F1F46CDD;
 Fri, 26 Mar 2021 10:32:23 +0000 (GMT)
From: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 2/2] drm/bridge: fix typo in Kconfig
Date: Fri, 26 Mar 2021 11:32:16 +0100
Message-Id: <20210326103216.7918-2-dafna.hirschfeld@collabora.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210326103216.7918-1-dafna.hirschfeld@collabora.com>
References: <20210326103216.7918-1-dafna.hirschfeld@collabora.com>
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
Cc: dafna.hirschfeld@collabora.com, airlied@linux.ie, dafna3@gmail.com,
 laurent.pinchart@ideasonboard.com, tzimmermann@suse.de,
 enric.balletbo@collabora.com, kernel@collabora.com
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

fix 's/controller/controllers/'

in the sentence:
Most display controller handle display connectors...

Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
---
 drivers/gpu/drm/bridge/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/bridge/Kconfig b/drivers/gpu/drm/bridge/Kconfig
index e4110d6ca7b3..cc55915dd0eb 100644
--- a/drivers/gpu/drm/bridge/Kconfig
+++ b/drivers/gpu/drm/bridge/Kconfig
@@ -42,7 +42,7 @@ config DRM_DISPLAY_CONNECTOR
 	depends on OF
 	help
 	  Driver for display connectors with support for DDC and hot-plug
-	  detection. Most display controller handle display connectors
+	  detection. Most display controllers handle display connectors
 	  internally and don't need this driver, but the DRM subsystem is
 	  moving towards separating connector handling from display controllers
 	  on ARM-based platforms. Saying Y here when this driver is not needed
-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
