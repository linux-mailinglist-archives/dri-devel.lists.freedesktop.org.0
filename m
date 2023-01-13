Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5568A668E2C
	for <lists+dri-devel@lfdr.de>; Fri, 13 Jan 2023 07:41:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C768B10E992;
	Fri, 13 Jan 2023 06:41:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:3::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA17810E992
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Jan 2023 06:41:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=v/GT59MkBIStouZ5bA5ISsCi2iWAi8szvTx0tj4+hnE=; b=u46K34HSQykmz5ADBnh7XhiyLl
 CHm6l4VLByZQ7/AFNniSg7YA/7YYjApUmgoePYCPHUzAOt42W5p2Za5CgxiLQFit+nF/Qk1nYxCAV
 v3QvD7SB8GcNrGIzMVdQwI1fhcAbHHw9jV9WnxqExJL5T12sH0cQamk2QJjcDlShsQNFpxGwuJkF2
 nZKMGKJh5vzdTO1nCHPeclhsqMCKyd20eMXnSfXdDORoqSHfw4WhZWuae21MmlBt+a75qRhGkz63H
 6xkLIKaiBeP0/NfICbbxStr6D7fl0mecpLCq4zPIMMOwJsJOJYgp35YdwRiGvXnM+2iUP9unSiJzJ
 yhwwe1Hg==;
Received: from [2601:1c2:d80:3110::9307] (helo=bombadil.infradead.org)
 by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1pGDkd-000qs4-Kc; Fri, 13 Jan 2023 06:41:19 +0000
From: Randy Dunlap <rdunlap@infradead.org>
To: linux-kernel@vger.kernel.org
Subject: [PATCH] backlight: sky81452: fix sky81452_bl_platform_data kernel-doc
Date: Thu, 12 Jan 2023 22:41:18 -0800
Message-Id: <20230113064118.30169-1-rdunlap@infradead.org>
X-Mailer: git-send-email 2.39.0
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
Cc: Daniel Thompson <daniel.thompson@linaro.org>, Lee Jones <lee@kernel.org>,
 Jingoo Han <jingoohan1@gmail.com>, Helge Deller <deller@gmx.de>,
 Randy Dunlap <rdunlap@infradead.org>, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Correct the struct name and add a short struct description to fix the
kernel-doc notation.

Prevents this kernel-doc warning:
drivers/video/backlight/sky81452-backlight.c:64: warning: expecting prototype for struct sky81452_platform_data. Prototype was for struct sky81452_bl_platform_data instead

Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Cc: Lee Jones <lee@kernel.org>
Cc: Daniel Thompson <daniel.thompson@linaro.org>
Cc: Jingoo Han <jingoohan1@gmail.com>
Cc: Helge Deller <deller@gmx.de>
Cc: dri-devel@lists.freedesktop.org
Cc: linux-fbdev@vger.kernel.org
---
 drivers/video/backlight/sky81452-backlight.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff -- a/drivers/video/backlight/sky81452-backlight.c b/drivers/video/backlight/sky81452-backlight.c
--- a/drivers/video/backlight/sky81452-backlight.c
+++ b/drivers/video/backlight/sky81452-backlight.c
@@ -41,7 +41,7 @@
 #define SKY81452_MAX_BRIGHTNESS	(SKY81452_CS + 1)
 
 /**
- * struct sky81452_platform_data
+ * struct sky81452_bl_platform_data - backlight platform data
  * @name:	backlight driver name.
  *		If it is not defined, default name is lcd-backlight.
  * @gpiod_enable:GPIO descriptor which control EN pin
