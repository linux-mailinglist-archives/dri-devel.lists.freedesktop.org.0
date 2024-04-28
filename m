Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E20738B4DF6
	for <lists+dri-devel@lfdr.de>; Sun, 28 Apr 2024 23:44:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 36737112A27;
	Sun, 28 Apr 2024 21:44:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=qq.com header.i=@qq.com header.b="ayQam/nL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out203-205-221-192.mail.qq.com (out203-205-221-192.mail.qq.com
 [203.205.221.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C8DF10E496
 for <dri-devel@lists.freedesktop.org>; Sun, 28 Apr 2024 12:32:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
 t=1714307545; bh=WhRK7c5VI5zG7dpXv/k2M42hjr8IyRYvYtQoYcJ0eOU=;
 h=From:To:Subject:Date;
 b=ayQam/nLt2FDlH16TSK1lgc2CoL/nYgXtdi4Z4c9h9jk7MAaWLta1X4UTmU/Dyjn5
 9HYs7gl3+nxLSj8nYe6cR01jbB1aTYOGZW1DoUViXi8/9Mf3j/0fEaAcggXsToWqVn
 2TfilTe9VQUR/1mgrku9e2JkBwOpnTBzrFtuS5v0=
Received: from pipishuo-OMEN-by-HP-Laptop-16-b0xxx.. ([123.115.148.131])
 by newxmesmtplogicsvrszb9-0.qq.com (NewEsmtp) with SMTP
 id 4C8B4CD2; Sun, 28 Apr 2024 20:19:08 +0800
X-QQ-mid: xmsmtpt1714306748t5cry6yph
Message-ID: <tencent_FDF9E162435F21368C39AB61255D2F2C8D08@qq.com>
X-QQ-XMAILINFO: MR/iVh5QLeiesT/qxp6yj39CByasNjpnL5Z9mIbo5D+NZ9po4qliBl7DIFt78D
 ITDjU605nzcmebLng8uzqyv7GojIslOw3SROUovLp80U7NtYgHQnx+0tG0sDkC4/pM60JQYKoO7t
 Sc+vbmlLFOlv7X0tMWf3+tqikoA56BEh+DMM5Dk1GSPcU9TD+GBbEd1roUWxE4AFFwgCR0iDXn8Z
 LaXMgDB6PqBeaz1v8uoeiG1eh5QLGos1LwTtyWf36ATlikbNTZIsVpx7vIVHcWrbXfismzSPwC0G
 +XCifmb0TFFO07iC2Lx9MyQjno6okveCNNfKqna0LEGzNp0oQ/GGvZiPpXQJAe/+dVs1Yz1zXVjl
 w0hKCqlP5nWcES09G7l18v93GFj85xB2QdzDiwhUc3cFs9gu1+w/yvaCVE8t0a9RHi/xmps0szop
 LN/43paZ/CXvrvxBV/VHobonLF1cePaUBzMk/ECZl5iPF+/d+0G1Uc7Yn77KUminZ091tYdvjEwt
 2fCPcK2cmxfhPXR2/zB3zArhQNnd2XtBJ50S5fP2MRvQhocC1n80yo0trCqnUgF/g20xmoWdrks6
 HLJYE0cjSdT+iEVS5YfFs6YPJoSYS6z5+AwZiaowHzc8U+3hXN8PYsYmWDFHERA20ph5hrKc/7Xv
 agjPWoZ6Z0jq/Nx0+EIFGTfUTkDocBNNuu8r7BXAixw9JmosQKKI1fYOsQftT+Tt5XanuVvw5msF
 URs7/MTpd7ccZ2Uy604K2VaoBx+w5YCUFzLDETlEkR1HCL+m/vWpCYMHimitSueAmWxL7U9vb2vK
 7BcryxX+D7XLOL7LVFFenBBKXXwDsCsRM6P/KOpR5gboNr2z4SvJDjgWI7Nloi3g6FyoyXc8VMtm
 jyq6qdeBlI8XArgDPCYq2PNXnDyuvB/V6QO0x5sEBxGdi+Lp7lU4lkbfms6e3HijM4uAUcb8aGAw
 us/kan5KW3wwyvPVYAEtBKLnJcWR/OY9UMG+5SYU7lU2/8AWvgsEg/VKHtMaSdtOJBEQWZSmrVXA
 YzeRrEoJ9G5TB+eSHCM9xEtP82Ca6j4UXkIpg0/Q==
X-QQ-XMRINFO: OD9hHCdaPRBwq3WW+NvGbIU=
From: pipishuo <1289151713@qq.com>
To: dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
 1289151713@qq.com
Subject: [PATCH] staging: fbtft:fixes unnecessary parentheses
Date: Sun, 28 Apr 2024 20:19:08 +0800
X-OQ-MSGID: <20240428121908.16060-1-1289151713@qq.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Sun, 28 Apr 2024 21:44:47 +0000
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

This patch fixes the checks reported by checkpatch.pl
for unnecessary parentheses

Signed-off-by: pipishuo <1289151713@qq.com>
---
 drivers/staging/fbtft/fb_ili9320.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/fbtft/fb_ili9320.c b/drivers/staging/fbtft/fb_ili9320.c
index 0be7c2d51548..045275a9bc0b 100644
--- a/drivers/staging/fbtft/fb_ili9320.c
+++ b/drivers/staging/fbtft/fb_ili9320.c
@@ -37,7 +37,8 @@ static int init_display(struct fbtft_par *par)
 	devcode = read_devicecode(par);
 	fbtft_par_dbg(DEBUG_INIT_DISPLAY, par, "Device code: 0x%04X\n",
 		      devcode);
-	if ((devcode != 0x0000) && (devcode != 0x9320))
+	if (devcode != 0x0000 &&
+	    devcode != 0x9320)
 		dev_warn(par->info->device,
 			 "Unrecognized Device code: 0x%04X (expected 0x9320)\n",
 			devcode);
-- 
2.34.1

