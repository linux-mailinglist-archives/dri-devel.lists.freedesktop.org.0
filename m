Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C92979F1E9
	for <lists+dri-devel@lfdr.de>; Wed, 13 Sep 2023 21:22:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 52CDC10E025;
	Wed, 13 Sep 2023 19:22:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1862D10E025
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Sep 2023 19:22:14 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id CB7AEB82676;
 Wed, 13 Sep 2023 19:22:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 03282C433C7;
 Wed, 13 Sep 2023 19:22:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1694632931;
 bh=V6XopDdx2YZciTVr/tRBYYwDYQcLb+xyYUMeNtn89Fg=;
 h=Subject:To:Cc:From:Date:From;
 b=KM6UjumXGnIW34P6PqTj4N9RWtHur4JpW3gjP9m8erkUwtCAaC1fc+d/8b1neFzHK
 uWHuuSB6YYm9Vinv5T8K7eWBav5VloDa8R4Ritd27Xv429kuhiLNjnxSwC3/4QyVlJ
 BLsVUtTpuGJZ1jNOWvlvziSzYfwk71p1maR9/SVg=
Subject: Patch "drm/ast: Fix DRAM init on AST2200" has been added to the
 4.14-stable tree
To: airlied@redhat.com, dri-devel@lists.freedesktop.org,
 gregkh@linuxfoundation.org, jfalempe@redhat.com, suijingfeng@loongson.cn,
 tzimmermann@suse.de
From: <gregkh@linuxfoundation.org>
Date: Wed, 13 Sep 2023 21:21:53 +0200
Message-ID: <2023091352-ramrod-outboard-d8bf@gregkh>
MIME-Version: 1.0
Content-Type: text/plain; charset=ANSI_X3.4-1968
Content-Transfer-Encoding: 8bit
X-stable: commit
X-Patchwork-Hint: ignore
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
Cc: stable-commits@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


This is a note to let you know that I've just added the patch titled

    drm/ast: Fix DRAM init on AST2200

to the 4.14-stable tree which can be found at:
    http://www.kernel.org/git/?p=linux/kernel/git/stable/stable-queue.git;a=summary

The filename of the patch is:
     drm-ast-fix-dram-init-on-ast2200.patch
and it can be found in the queue-4.14 subdirectory.

If you, or anyone else, feels it should not be added to the stable tree,
please let <stable@vger.kernel.org> know about it.


From 4cfe75f0f14f044dae66ad0e6eea812d038465d9 Mon Sep 17 00:00:00 2001
From: Thomas Zimmermann <tzimmermann@suse.de>
Date: Wed, 21 Jun 2023 14:53:35 +0200
Subject: drm/ast: Fix DRAM init on AST2200

From: Thomas Zimmermann <tzimmermann@suse.de>

commit 4cfe75f0f14f044dae66ad0e6eea812d038465d9 upstream.

Fix the test for the AST2200 in the DRAM initialization. The value
in ast->chip has to be compared against an enum constant instead of
a numerical value.

This bug got introduced when the driver was first imported into the
kernel.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Fixes: 312fec1405dd ("drm: Initial KMS driver for AST (ASpeed Technologies) 2000 series (v2)")
Cc: Dave Airlie <airlied@redhat.com>
Cc: dri-devel@lists.freedesktop.org
Cc: <stable@vger.kernel.org> # v3.5+
Reviewed-by: Sui Jingfeng <suijingfeng@loongson.cn>
Reviewed-by: Jocelyn Falempe <jfalempe@redhat.com>
Tested-by: Jocelyn Falempe <jfalempe@redhat.com> # AST2600
Link: https://patchwork.freedesktop.org/patch/msgid/20230621130032.3568-2-tzimmermann@suse.de
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 drivers/gpu/drm/ast/ast_post.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

--- a/drivers/gpu/drm/ast/ast_post.c
+++ b/drivers/gpu/drm/ast/ast_post.c
@@ -291,7 +291,7 @@ static void ast_init_dram_reg(struct drm
 				;
 			} while (ast_read32(ast, 0x10100) != 0xa8);
 		} else {/* AST2100/1100 */
-			if (ast->chip == AST2100 || ast->chip == 2200)
+			if (ast->chip == AST2100 || ast->chip == AST2200)
 				dram_reg_info = ast2100_dram_table_data;
 			else
 				dram_reg_info = ast1100_dram_table_data;


Patches currently in stable-queue which might be from tzimmermann@suse.de are

queue-4.14/backlight-gpio_backlight-compare-against-struct-fb_info.device.patch
queue-4.14/fbdev-ep93xx-fb-do-not-assign-to-struct-fb_info.dev.patch
queue-4.14/backlight-lv5207lp-compare-against-struct-fb_info.device.patch
queue-4.14/backlight-bd6107-compare-against-struct-fb_info.device.patch
queue-4.14/drm-ast-fix-dram-init-on-ast2200.patch
