Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BF82FCED1F1
	for <lists+dri-devel@lfdr.de>; Thu, 01 Jan 2026 16:26:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 24F7B10E5A5;
	Thu,  1 Jan 2026 15:26:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="INc/V7iI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B0DA310E5A5
 for <dri-devel@lists.freedesktop.org>; Thu,  1 Jan 2026 15:26:01 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 99F7A443A0;
 Thu,  1 Jan 2026 15:26:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CC566C16AAE;
 Thu,  1 Jan 2026 15:25:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1767281161;
 bh=DavTlH0i9MWegO1iqCZhDEQs4kTEOYsr1j0ik1iUucI=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=INc/V7iIyFxHMxq3DVYPQ0wfABOKnmNuMRBJx3qFcam1sPuVHc6h12n4bCOt5oX9Q
 0PIq05cyfqUzmhQgrSSTkvhrW7HASy7krE3OMjGLFuVA6+5EdHJ2MCUHgzQlV/kPT3
 YhH8o3AxYyTty5ctPmvUCvTUMHGS+b5Svmd0i3/GCcAoBy2kQgW6VQDwGx0ndUDdpL
 BxbOeQqF2Zdkq+V/HpzxheCaHVizWonZLAmZ6dTKvXHDCa/QWqLRW8JaLQHJFkip9b
 877gfJLLzq7BZvGMMogAgRm4FLc/KTqIf8QWqvRv/5NR9FgsLW9y+XOjC9hzxxQNMY
 dhL5cv9wMU/Ow==
From: Vincent Mailhol <mailhol@kernel.org>
Date: Thu, 01 Jan 2026 16:25:18 +0100
Subject: [PATCH v2 4/6] newport_con: depend on LOGO_LINUX_CLUT224 instead
 of LOGO_SGI_CLUT224
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260101-custom-logo-v2-4-8eec06dfbf85@kernel.org>
References: <20260101-custom-logo-v2-0-8eec06dfbf85@kernel.org>
In-Reply-To: <20260101-custom-logo-v2-0-8eec06dfbf85@kernel.org>
To: Helge Deller <deller@gmx.de>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Yoshinori Sato <ysato@users.sourceforge.jp>, Rich Felker <dalias@libc.org>, 
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Cc: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, linux-sh@vger.kernel.org, 
 Vincent Mailhol <mailhol@kernel.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1191; i=mailhol@kernel.org;
 h=from:subject:message-id; bh=DavTlH0i9MWegO1iqCZhDEQs4kTEOYsr1j0ik1iUucI=;
 b=owGbwMvMwCV2McXO4Xp97WbG02pJDJlhEz9cjl3OeEkz/9eu7TazfnUwHDTm7Gh/pcstWL7V9
 saGDWI2HRNZGMS4GCzFFFmWlXNyK3QUeocd+msJM4eVCWSItEgDAxCwMPDlJuaVGukY6ZlqG+oZ
 GuoAmQxcnAIw1VcSGRlaIg+Y96rZNBhzqV299lfK7XZn0cxvnxhfOMzUPhXIrZHEyHBTOeSu69F
 A6eXOytuu9Xd2W9kZyS9V/Wj7af5WV7XCzzwA
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

newport_show_logo() is only activated if CONFIG_LOGO_LINUX_CLUT224 is
set (otherwise it is a NOP). This configuration value will be removed
in an upcoming change so instead, make it depend on LOGO_LINUX_CLUT224.

Signed-off-by: Vincent Mailhol <mailhol@kernel.org>
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

