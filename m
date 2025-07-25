Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 725C5B117F6
	for <lists+dri-devel@lfdr.de>; Fri, 25 Jul 2025 07:31:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CFDC510E42E;
	Fri, 25 Jul 2025 05:31:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="uo5YIYbq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 98CCD10E42E
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Jul 2025 05:31:02 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id AEF23601DC;
 Fri, 25 Jul 2025 05:31:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 632DEC4CEE7;
 Fri, 25 Jul 2025 05:31:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1753421461;
 bh=QLEm3mGWlBu3c9Wu5ayDCuiDkfkThDB5veBBewlp+58=;
 h=From:Date:Subject:To:Cc:Reply-To:From;
 b=uo5YIYbqerFpk/0LG0DCk9zfRb5QPJsblghgmL1ykxwvim3GxWyqG1xc4/55W7PkE
 lWOU3/dlBvr4+fSeQWTvU35PwSDxYLSnpkuLbleExXOOmKGWS9cl87jlkD6eAmBibj
 djQjnXz7CCmj9WHnFAFlT8sIDVFyQIDNfAF9PYa5u227uTDRdwJ9DWQt81XoiNnTGm
 xim2fxvZImT7O4EMNIhaq4w1+T+bb6hrz3gk5Uq0nA/JeyLiOrjftIEUnRgDVtqqKT
 lpEF0Zxbx29oUAFQUuz6oJxK2xShkdlfbRiSRT5qdCHbHl+k1O3APcIdSCnXBKN1Mm
 zHDH8A66XTu6Q==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by smtp.lore.kernel.org (Postfix) with ESMTP id 5C37DC87FCA;
 Fri, 25 Jul 2025 05:31:01 +0000 (UTC)
From: Daniel Palmer via B4 Relay <devnull+daniel.palmer.sony.com@kernel.org>
Date: Fri, 25 Jul 2025 14:30:57 +0900
Subject: [PATCH] fbdev: Fix typo in Kconfig text for FB_DEVICE
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250725-fbdev-typo-v1-1-f9fd1418cb51@sony.com>
X-B4-Tracking: v=1; b=H4sIAJAWg2gC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDcyNT3bSklNQy3ZLKgnxdSwMDE9NkoyTDlORUJaCGgqLUtMwKsGHRsbW
 1AGLSkX1cAAAA
To: Simona Vetter <simona@ffwll.ch>, Helge Deller <deller@gmx.de>
Cc: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, Daniel Palmer <daniel.palmer@sony.com>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1753421457; l=983;
 i=daniel.palmer@sony.com; s=20250610; h=from:subject:message-id;
 bh=ExcVPhfNsQdjthV2mryqOJJS7Mv9bAw31RooTp1/9aE=;
 b=K1ZHosEZoz9tKEb4ZtvEiu5I9COHbZQUNZ1Ax+1a5WQiczG05QpKkNOLMfVNUM1Rnp9eQB2Jb
 JoGBo9hTltABbyO7ZRyv1Z6BAYpNMwHkC3qN2PPCiAON80fYIPGOBbE
X-Developer-Key: i=daniel.palmer@sony.com; a=ed25519;
 pk=dbwvNAF3zvjUZOTEPBh6uYWrBnOi7OPuXkoDcmmS8aY=
X-Endpoint-Received: by B4 Relay for daniel.palmer@sony.com/20250610 with
 auth_id=430
X-Original-From: Daniel Palmer <daniel.palmer@sony.com>
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
Reply-To: daniel.palmer@sony.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Daniel Palmer <daniel.palmer@sony.com>

Seems like someone hit 'c' when they meant to hit 'd'.

Signed-off-by: Daniel Palmer <daniel.palmer@sony.com>
---
 drivers/video/fbdev/core/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/video/fbdev/core/Kconfig b/drivers/video/fbdev/core/Kconfig
index 4abe12db7594..413cbfac569d 100644
--- a/drivers/video/fbdev/core/Kconfig
+++ b/drivers/video/fbdev/core/Kconfig
@@ -31,7 +31,7 @@ config FB_DEVICE
 	default FB
 	help
 	  Say Y here if you want the legacy /dev/fb* device file and
-	  interfaces within sysfs anc procfs. It is only required if you
+	  interfaces within sysfs and procfs. It is only required if you
 	  have userspace programs that depend on fbdev for graphics output.
 	  This does not affect the framebuffer console. If unsure, say N.
 

---
base-commit: e04c78d86a9699d136910cfc0bdcf01087e3267e
change-id: 20250725-fbdev-typo-90045c2b1dce

Best regards,
-- 
Daniel Palmer <daniel.palmer@sony.com>


