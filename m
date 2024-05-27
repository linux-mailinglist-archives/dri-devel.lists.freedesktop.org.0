Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E91538D0E05
	for <lists+dri-devel@lfdr.de>; Mon, 27 May 2024 21:36:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8718310E041;
	Mon, 27 May 2024 19:36:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="QDFYxLtl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E241110E041
 for <dri-devel@lists.freedesktop.org>; Mon, 27 May 2024 19:36:01 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 91C88CE0EBE;
 Mon, 27 May 2024 19:35:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5E9A7C2BBFC;
 Mon, 27 May 2024 19:35:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1716838557;
 bh=RnQsE+g1WbsoIYd0GlNAqXRKKt0zYGbgChagRPzx2f8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=QDFYxLtlMMM/Kiva+32zRAY/H3v8IT268DronmdEEM32NIYmDxwHw3KCGuA7ZJiuY
 dNpBuMFHUl/OX8ir6P5tbEOJg/rBQxk++f6k3uHRiP3SpogDeSRS6xcLFu+kvJ4mQd
 mcha9L9o28E96x4V5t2RqiR9ofpIUG2o87FlsYtU=
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
Subject: [PATCH 6.8 399/493] fbdev: sh7760fb: allow modular build
Date: Mon, 27 May 2024 20:56:41 +0200
Message-ID: <20240527185643.328813921@linuxfoundation.org>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20240527185626.546110716@linuxfoundation.org>
References: <20240527185626.546110716@linuxfoundation.org>
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

6.8-stable review patch.  If anyone has any objections, please let me know.

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
index ba4ab33f6094b..411bf2b2c4d03 100644
--- a/drivers/video/fbdev/Kconfig
+++ b/drivers/video/fbdev/Kconfig
@@ -1680,8 +1680,8 @@ config FB_COBALT
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



