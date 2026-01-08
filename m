Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 93230D05BC7
	for <lists+dri-devel@lfdr.de>; Thu, 08 Jan 2026 20:06:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E901F10E7B9;
	Thu,  8 Jan 2026 19:06:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="QsNSg27T";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BFB0810E7B9
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Jan 2026 19:06:29 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id A684F443B0;
 Thu,  8 Jan 2026 19:06:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2C3C4C2BCB0;
 Thu,  8 Jan 2026 19:06:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1767899189;
 bh=qg2e2Usx8Cl41wSYK/azjfp1gWl9UYs7OwucUlFA8gA=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=QsNSg27TFoBlkAJi4dxsfETT4aSYXsnD6YRoUNQyNhYblVejyp3WExiE3bN4l+/lQ
 9G+hkiFujwtTi6eAHIi46UJBCeL8UwbzWak4cUJybgzlZYkEIYZmoB2BJe9rGvqFEt
 9uNyNiG6OzvD5fYKhRCdxteGaX2gYnTkj4qCQRxrUz63f3t7pKuVMwQGZhALnZ/hS9
 C+yEE1g6c6Yc2eSb7G0nMI3qABGRfx6X0jRZzDx63LbaJ4s5EX1bgkRrn3xTz6a57E
 UWXyv9tXQhW29uHUzFf6kH1vVZikdpwQLSRvKz+E3CO2ScNBeuEXmlmQq+TXb1DYCK
 dRESuublD4XUQ==
From: Vincent Mailhol <mailhol@kernel.org>
Date: Thu, 08 Jan 2026 20:04:52 +0100
Subject: [PATCH v3 4/7] newport_con: depend on LOGO_LINUX_CLUT224 instead
 of LOGO_SGI_CLUT224
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260108-custom-logo-v3-4-5a7aada7a6d4@kernel.org>
References: <20260108-custom-logo-v3-0-5a7aada7a6d4@kernel.org>
In-Reply-To: <20260108-custom-logo-v3-0-5a7aada7a6d4@kernel.org>
To: Helge Deller <deller@gmx.de>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Yoshinori Sato <ysato@users.sourceforge.jp>, Rich Felker <dalias@libc.org>, 
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, linux-fbdev@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-sh@vger.kernel.org, linux-m68k@lists.linux-m68k.org, 
 Vincent Mailhol <mailhol@kernel.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1323; i=mailhol@kernel.org;
 h=from:subject:message-id; bh=qg2e2Usx8Cl41wSYK/azjfp1gWl9UYs7OwucUlFA8gA=;
 b=owGbwMvMwCV2McXO4Xp97WbG02pJDJkJDGJbLKe79Gstivg4787eg29LJr9ivsllH2217cHfA
 /d27T6Q0TGRhUGMi8FSTJFlWTknt0JHoXfYob+WMHNYmUCGSIs0MAABCwNfbmJeqZGOkZ6ptqGe
 oaEOkMnAxSkAU53AxvA/eu/x7i7NMq8/Rq/UZySfnHt0q0b7VzUjRuEXV07NuM9+kpHh9q3SB5I
 O2cz/or7wb/ePWbgrdJZpg9XifnEnrVxvU3EeAA==
X-Developer-Key: i=mailhol@kernel.org; a=openpgp;
 fpr=ED8F700574E67F20E574E8E2AB5FEB886DBB99C2
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

newport_show_logo() is only activated if CONFIG_LOGO_SGI_CLUT224 is
set (otherwise it is a NOP). This configuration item will be removed
in an upcoming change so instead, make it depend on LOGO_LINUX_CLUT224.

Signed-off-by: Vincent Mailhol <mailhol@kernel.org>
---
**Changelog**

v2 -> v3:

  - Typo fix in patch description:

      s/CCONFIG_LOGO_LINUX_CLUT224/CONFIG_LOGO_SGI_CLUT224/g
---
 drivers/video/console/newport_con.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/video/console/newport_con.c b/drivers/video/console/newport_con.c
index 242415366074..337e04236d6d 100644
--- a/drivers/video/console/newport_con.c
+++ b/drivers/video/console/newport_con.c
@@ -95,7 +95,7 @@ static inline void newport_init_cmap(void)
 
 static const struct linux_logo *newport_show_logo(void)
 {
-#ifdef CONFIG_LOGO_SGI_CLUT224
+#ifdef CONFIG_LOGO_LINUX_CLUT224
 	const struct linux_logo *logo = fb_find_logo(8);
 	const unsigned char *clut;
 	const unsigned char *data;
@@ -127,7 +127,7 @@ static const struct linux_logo *newport_show_logo(void)
 	return logo;
 #else
 	return NULL;
-#endif /* CONFIG_LOGO_SGI_CLUT224 */
+#endif /* CONFIG_LOGO_LINUX_CLUT224 */
 }
 
 static inline void newport_clear_screen(int xstart, int ystart, int xend,

-- 
2.52.0

