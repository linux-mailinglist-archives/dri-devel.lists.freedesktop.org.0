Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 976C020EF70
	for <lists+dri-devel@lfdr.de>; Tue, 30 Jun 2020 09:35:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2BA0E89CCB;
	Tue, 30 Jun 2020 07:34:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from crapouillou.net (outils.crapouillou.net [89.234.176.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB0ED89D2F
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Jun 2020 23:52:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
 s=mail; t=1593474742; h=from:from:sender:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=A8Wh99asMaI00AHjqm706gvL6rNORhOoja23j4oKsAo=;
 b=il+yGkZgHNh6rtNCrG4aS+PcNaoRo/xkJmtNUn+YCpzNxwOC4IuLEX3UFhd0VmUMZZOQmd
 cYApnOib/cvCR2OyTXXqMaUabLXLeHPboB+8Boyh7ZaBC28ZB9NUVcesYS23NQaaUAZeTz
 fz/ze0QOmHLUeWvoBWkJn1+EXOiVNTw=
From: Paul Cercueil <paul@crapouillou.net>
To: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>
Subject: [PATCH v2 03/10] drm/ingenic: Rename ingenic-drm.c to
 ingenic-drm-drv.c
Date: Tue, 30 Jun 2020 01:52:03 +0200
Message-Id: <20200629235210.441709-3-paul@crapouillou.net>
In-Reply-To: <20200629235210.441709-1-paul@crapouillou.net>
References: <20200629235210.441709-1-paul@crapouillou.net>
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 30 Jun 2020 07:34:53 +0000
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
Cc: devicetree@vger.kernel.org, linux-mips@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Paul Cercueil <paul@crapouillou.net>, od@zcrc.me
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Full rename without any modification, except to the Makefile.

Renaming ingenic-drm.c to ingenic-drm-drv.c allow to decouple the module
name from the source file name in the Makefile. This will be useful
later when more source files are added.

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
---

Notes:
    v2: New patch

 drivers/gpu/drm/ingenic/Makefile                             | 1 +
 drivers/gpu/drm/ingenic/{ingenic-drm.c => ingenic-drm-drv.c} | 0
 2 files changed, 1 insertion(+)
 rename drivers/gpu/drm/ingenic/{ingenic-drm.c => ingenic-drm-drv.c} (100%)

diff --git a/drivers/gpu/drm/ingenic/Makefile b/drivers/gpu/drm/ingenic/Makefile
index 11cac42ce0bb..9875628dd8bc 100644
--- a/drivers/gpu/drm/ingenic/Makefile
+++ b/drivers/gpu/drm/ingenic/Makefile
@@ -1 +1,2 @@
 obj-$(CONFIG_DRM_INGENIC) += ingenic-drm.o
+ingenic-drm-y += ingenic-drm-drv.o
diff --git a/drivers/gpu/drm/ingenic/ingenic-drm.c b/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
similarity index 100%
rename from drivers/gpu/drm/ingenic/ingenic-drm.c
rename to drivers/gpu/drm/ingenic/ingenic-drm-drv.c
-- 
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
