Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 05802873951
	for <lists+dri-devel@lfdr.de>; Wed,  6 Mar 2024 15:37:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E219112D7B;
	Wed,  6 Mar 2024 14:37:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=wantyapps.xyz header.i=@wantyapps.xyz header.b="q4iGyh8j";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 331 seconds by postgrey-1.36 at gabe;
 Wed, 06 Mar 2024 08:53:01 UTC
Received: from mail.wantyapps.xyz (unknown [66.135.5.160])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 78912113004
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Mar 2024 08:53:01 +0000 (UTC)
Received: from multivac.localdomain (unknown [147.235.203.68])
 by mail.wantyapps.xyz (Postfix) with ESMTPSA id 2E9E27FB47;
 Wed,  6 Mar 2024 08:47:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=wantyapps.xyz;
 s=mail; t=1709714849;
 bh=Np/0KP1BeK6J09Yu1UgwTOMEwehRDZxUhITzaI18xp8=;
 h=From:To:Cc:Subject:Date:From;
 b=q4iGyh8jc0lHpKvIw6lzEvRwCGVo7aUD5721wc6SJiEaUzeJzRjcrRzwidCKlkVq+
 R8Jsvh5+valkrL/Z22Vzh2tqHZvtOuYqSMxxZVDedP75DF6lEXJgmoGZRCtM/ggtJR
 +EAebFmlDUJHYFL8kb3rvjaBLdiAOdq6vPf2rByCt3rVn4fZUjzp8OKbMtKOjnuit5
 2vpCCC1HGnOnCdx3qNTLUP6GQ5TsylegcyPE16xzZgwv9GXySHOQxGoLTIw2sD3vFn
 /FU2/KDVOCsXFeNgkzBx6Kb5s60tkNAJmgMGIUvwyXR/yQ0cEPHY4ec8H8khBFORH8
 VRlt0JNNVvgag==
From: me@wantyapps.xyz
To: 
Cc: me@wantyapps.xyz, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH] staging: fbtft: Fix space before parenthesis as per
 checkpatch.pl
Date: Wed,  6 Mar 2024 10:47:12 +0200
Message-ID: <20240306084720.1019604-1-me@wantyapps.xyz>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Wed, 06 Mar 2024 14:37:21 +0000
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

From: Uri Arev <me@wantyapps.xyz>

Errors reported by checkpatch.pl:

ERROR: space prohibited before that close parenthesis ')'
+define_fbtft_write_reg(fbtft_write_reg8_bus8, u8, u8, )

ERROR: space prohibited before that close parenthesis ')'
+define_fbtft_write_reg(fbtft_write_reg16_bus16, u16, u16, )

CHECK: Unnecessary parentheses around 'par->spi->bits_per_word == 8'
+       if (par->spi && (par->spi->bits_per_word == 8)) {

Signed-off-by: Uri Arev <me@wantyapps.xyz>
---
 drivers/staging/fbtft/fbtft-bus.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/fbtft/fbtft-bus.c b/drivers/staging/fbtft/fbtft-bus.c
index 3d422bc11641..02a16671f2a1 100644
--- a/drivers/staging/fbtft/fbtft-bus.c
+++ b/drivers/staging/fbtft/fbtft-bus.c
@@ -62,9 +62,9 @@ out:									      \
 }                                                                             \
 EXPORT_SYMBOL(func);
 
-define_fbtft_write_reg(fbtft_write_reg8_bus8, u8, u8, )
+define_fbtft_write_reg(fbtft_write_reg8_bus8, u8, u8)
 define_fbtft_write_reg(fbtft_write_reg16_bus8, __be16, u16, cpu_to_be16)
-define_fbtft_write_reg(fbtft_write_reg16_bus16, u16, u16, )
+define_fbtft_write_reg(fbtft_write_reg16_bus16, u16, u16)
 
 void fbtft_write_reg8_bus9(struct fbtft_par *par, int len, ...)
 {
-- 
2.44.0

