Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 47F07BA919E
	for <lists+dri-devel@lfdr.de>; Mon, 29 Sep 2025 13:49:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B13010E22B;
	Mon, 29 Sep 2025 11:49:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="OWbZYNx1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4407A10E22B
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Sep 2025 11:49:08 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 647AC62489;
 Mon, 29 Sep 2025 11:49:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AD6B4C4CEF4;
 Mon, 29 Sep 2025 11:49:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1759146547;
 bh=vgCSpwhsjUBf1W/fReRIuOUrF5WdnUT+p2V895A0VJw=;
 h=Subject:To:Cc:From:Date:From;
 b=OWbZYNx1PuRcYzsRKg4JgWKpjStqwY23qbTxHKg272M+gCAD2uDf5/9UtIvi8YLnZ
 VY+6U047LCSd/u4cf1932BOh7iEGrSWmnKa+dEGBy1vzbMj2M3xq4VtYM0ADvI/TYR
 zdRnVjyQT3GP0LI7dE2QtTUJNo2G5LD2y3gfwJx4=
Subject: Patch "drm/ast: Use msleep instead of mdelay for edid read" has been
 added to the 6.16-stable tree
To: airlied@redhat.com, csoto@nvidia.com, dri-devel@lists.freedesktop.org,
 gregkh@linuxfoundation.org, jfalempe@redhat.com, kuohsiang_chou@aspeedtech.com,
 nirmoyd@nvidia.com, tzimmermann@suse.de
Cc: <stable-commits@vger.kernel.org>
From: <gregkh@linuxfoundation.org>
Date: Mon, 29 Sep 2025 13:48:26 +0200
Message-ID: <2025092925-superhero-chaos-f0b1@gregkh>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


This is a note to let you know that I've just added the patch titled

    drm/ast: Use msleep instead of mdelay for edid read

to the 6.16-stable tree which can be found at:
    http://www.kernel.org/git/?p=linux/kernel/git/stable/stable-queue.git;a=summary

The filename of the patch is:
     drm-ast-use-msleep-instead-of-mdelay-for-edid-read.patch
and it can be found in the queue-6.16 subdirectory.

If you, or anyone else, feels it should not be added to the stable tree,
please let <stable@vger.kernel.org> know about it.


From c7c31f8dc54aa3c9b2c994b5f1ff7e740a654e97 Mon Sep 17 00:00:00 2001
From: Nirmoy Das <nirmoyd@nvidia.com>
Date: Wed, 17 Sep 2025 12:43:46 -0700
Subject: drm/ast: Use msleep instead of mdelay for edid read

From: Nirmoy Das <nirmoyd@nvidia.com>

commit c7c31f8dc54aa3c9b2c994b5f1ff7e740a654e97 upstream.

The busy-waiting in `mdelay()` can cause CPU stalls and kernel timeouts
during boot.

Signed-off-by: Nirmoy Das <nirmoyd@nvidia.com>
Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
Tested-by: Carol L Soto csoto@nvidia.com<mailto:csoto@nvidia.com>
Fixes: 594e9c04b586 ("drm/ast: Create the driver for ASPEED proprietory Display-Port")
Cc: KuoHsiang Chou <kuohsiang_chou@aspeedtech.com>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Dave Airlie <airlied@redhat.com>
Cc: Jocelyn Falempe <jfalempe@redhat.com>
Cc: dri-devel@lists.freedesktop.org
Cc: <stable@vger.kernel.org> # v5.19+
Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Link: https://lore.kernel.org/r/20250917194346.2905522-1-nirmoyd@nvidia.com
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 drivers/gpu/drm/ast/ast_dp.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

--- a/drivers/gpu/drm/ast/ast_dp.c
+++ b/drivers/gpu/drm/ast/ast_dp.c
@@ -134,7 +134,7 @@ static int ast_astdp_read_edid_block(voi
 			 * 3. The Delays are often longer a lot when system resume from S3/S4.
 			 */
 			if (j)
-				mdelay(j + 1);
+				msleep(j + 1);
 
 			/* Wait for EDID offset to show up in mirror register */
 			vgacrd7 = ast_get_index_reg(ast, AST_IO_VGACRI, 0xd7);


Patches currently in stable-queue which might be from nirmoyd@nvidia.com are

queue-6.16/drm-ast-use-msleep-instead-of-mdelay-for-edid-read.patch
