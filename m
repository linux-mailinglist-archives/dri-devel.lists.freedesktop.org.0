Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5060F8D0BB9
	for <lists+dri-devel@lfdr.de>; Mon, 27 May 2024 21:12:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9948B10FC79;
	Mon, 27 May 2024 19:12:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="QaMmIqrx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C628010FC79
 for <dri-devel@lists.freedesktop.org>; Mon, 27 May 2024 19:12:18 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 5063E61BB2;
 Mon, 27 May 2024 19:12:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 85472C2BBFC;
 Mon, 27 May 2024 19:12:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1716837137;
 bh=SKzXpGwDw/Wsnk8n3O07xvh4RTKKDxP/3tzrIotizuE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=QaMmIqrxS01UjgaH4FzJ4gN8dtgI/GeNW7FXyFbLqa7HHbQOjLgqFMJYvCf0diKl4
 VJTopG1Pgm2O/x4t+YGtZYPzty5s/8zTaegEso8PWUtRuSC3vaoT0HXlFRzDIcm2Aq
 0pfS3aVOgTyIMz18EqFqYLCAFZQjRu3slwS3meLY=
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: stable@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, patches@lists.linux.dev,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Randy Dunlap <rdunlap@infradead.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Javier Martinez Canillas <javierm@redhat.com>,
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
 Sam Ravnborg <sam@ravnborg.org>, Helge Deller <deller@gmx.de>,
 linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Sasha Levin <sashal@kernel.org>
Subject: [PATCH 6.9 325/427] fbdev: sh7760fb: allow modular build
Date: Mon, 27 May 2024 20:56:12 +0200
Message-ID: <20240527185631.879632423@linuxfoundation.org>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20240527185601.713589927@linuxfoundation.org>
References: <20240527185601.713589927@linuxfoundation.org>
User-Agent: quilt/0.67
X-stable: review
X-Patchwork-Hint: ignore
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

6.9-stable review patch.  If anyone has any objections, please let me know.

------------------

From: Randy Dunlap <rdunlap@infradead.org>

[ Upstream commit 51084f89d687e14d96278241e5200cde4b0985c7 ]

There is no reason to prohibit sh7760fb from being built as a
loadable module as suggested by Geert, so change the config symbol
from bool to tristate to allow that and change the FB dependency as
needed.

Fixes: f75f71b2c418 ("fbdev/sh7760fb: Depend on FB=y")
Suggested-by: Geert Uytterhoeven <geert@linux-m68k.org>
Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Javier Martinez Canillas <javierm@redhat.com>
Cc: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Cc: Sam Ravnborg <sam@ravnborg.org>
Cc: Helge Deller <deller@gmx.de>
Cc: linux-fbdev@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org
Acked-by: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Acked-by: Javier Martinez Canillas <javierm@redhat.com>
Signed-off-by: Helge Deller <deller@gmx.de>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/video/fbdev/Kconfig | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/video/fbdev/Kconfig b/drivers/video/fbdev/Kconfig
index 197b6d5268e94..3f46663aa563d 100644
--- a/drivers/video/fbdev/Kconfig
+++ b/drivers/video/fbdev/Kconfig
@@ -1648,8 +1648,8 @@ config FB_COBALT
 	select FB_IOMEM_HELPERS
 
 config FB_SH7760
-	bool "SH7760/SH7763/SH7720/SH7721 LCDC support"
-	depends on FB=y && (CPU_SUBTYPE_SH7760 || CPU_SUBTYPE_SH7763 \
+	tristate "SH7760/SH7763/SH7720/SH7721 LCDC support"
+	depends on FB && (CPU_SUBTYPE_SH7760 || CPU_SUBTYPE_SH7763 \
 		|| CPU_SUBTYPE_SH7720 || CPU_SUBTYPE_SH7721)
 	select FB_IOMEM_HELPERS
 	help
-- 
2.43.0



