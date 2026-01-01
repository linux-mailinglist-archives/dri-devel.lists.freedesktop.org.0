Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B58C8CED1E2
	for <lists+dri-devel@lfdr.de>; Thu, 01 Jan 2026 16:25:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5BB7610E5B6;
	Thu,  1 Jan 2026 15:25:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="qOu9Gmw/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 157A110E5A5
 for <dri-devel@lists.freedesktop.org>; Thu,  1 Jan 2026 15:25:53 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 34AD060055;
 Thu,  1 Jan 2026 15:25:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 79926C16AAE;
 Thu,  1 Jan 2026 15:25:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1767281151;
 bh=/PRAWLk1+pSHIN+oE7HMAv23it2DWPyzsrdtDMwQB9k=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=qOu9Gmw/qz5EFdv+hSR2W3VzNET+Zfr9HOgruJn+ydot06HNKv1KjYj0nK9iXJxXV
 wwD5KcRv2Rqtc6QC9jEgrBbdYfwceeuu1ZHxoh+b834D3L79+ISb4o66mFXNU+Cvpo
 xcHJXmLnP9eQ8DIyZRP6OK3OaSLWI8xifV4Jfh2QrXGImjTloz0coBGdfInurVfr+Z
 N0tPNWZQteUmIjTK2ZZp86y6revzzXPOAZh18AfvVvd8f9ECw4gv52xMde02Xyz2Kc
 5PeflIPLRTu1H0d/XwHKIWZSddaa85PE74gpg82TYt9s+DzKS7hhKgjhmep8zPEVy3
 6XwsmoRhCvdJw==
From: Vincent Mailhol <mailhol@kernel.org>
Date: Thu, 01 Jan 2026 16:25:15 +0100
Subject: [PATCH v2 1/6] video/logo: remove orphan .pgm Makefile rule
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260101-custom-logo-v2-1-8eec06dfbf85@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=943; i=mailhol@kernel.org;
 h=from:subject:message-id; bh=/PRAWLk1+pSHIN+oE7HMAv23it2DWPyzsrdtDMwQB9k=;
 b=owGbwMvMwCV2McXO4Xp97WbG02pJDJlhE5977zg6YfvhbWbLtdZtERBYIBg/j6thn9ZBiahG7
 RvuQdF+HRNZGMS4GCzFFFmWlXNyK3QUeocd+msJM4eVCWSItEgDAxCwMPDlJuaVGukY6ZlqG+oZ
 GuoAmQxcnAIw1XbTGf4K3AxbusiD12/mu9OnN61UsdWJs13et83b+PCbzfczZY5eYvjDb3k9asl
 25Zt229nunuDbUqbqeeG1quaHoD3Oh7edFe9lAAA=
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

The kernel has no actual grey-scale logos. And looking at the git
history, it seems that there never was one (or maybe there was in the
pre-git history? I did not check that far…)

Remove the Makefile rule for the .pgm grey scale images.

Signed-off-by: Vincent Mailhol <mailhol@kernel.org>
---
 drivers/video/logo/Makefile | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/video/logo/Makefile b/drivers/video/logo/Makefile
index 895c60b8402e..8b67c4941a4c 100644
--- a/drivers/video/logo/Makefile
+++ b/drivers/video/logo/Makefile
@@ -30,8 +30,5 @@ $(obj)/%.c: $(src)/%.pbm $(obj)/pnmtologo FORCE
 $(obj)/%.c: $(src)/%.ppm $(obj)/pnmtologo FORCE
 	$(call if_changed,logo)
 
-$(obj)/%.c: $(src)/%.pgm $(obj)/pnmtologo FORCE
-	$(call if_changed,logo)
-
 # generated C files
-targets += *_mono.c *_vga16.c *_clut224.c *_gray256.c
+targets += *_mono.c *_vga16.c *_clut224.c

-- 
2.52.0

