Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B5028774E62
	for <lists+dri-devel@lfdr.de>; Wed,  9 Aug 2023 00:34:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C4FE610E227;
	Tue,  8 Aug 2023 22:34:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out-107.mta1.migadu.com (out-107.mta1.migadu.com
 [95.215.58.107])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D934C10E21F
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Aug 2023 22:34:41 +0000 (UTC)
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1691534080;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OARNfgYqqI88j77QXNxHtR+yC6FyBlqX15NF2v91/5s=;
 b=lozfXp23rVPsktvtX0gQPBInuNuig15+ZDtuPcOb13UrzI+pPqoY2CJAbTcGLRNR3hpifa
 Lk4NFkJOW+/QvdT7VW8ZrfhLaMqDztMIWavX2Oj+hUmGh41afMdVPFemFneKZ857g5VIxG
 EVKpXS7FQqH0cq3Yd+NENo3KiAtV904=
From: Sui Jingfeng <sui.jingfeng@linux.dev>
To: Bjorn Helgaas <bhelgaas@google.com>
Subject: [PATCH v2 09/11] PCI/VGA: Fix a typo to the comments in
 vga_str_to_iostate() function
Date: Wed,  9 Aug 2023 06:34:10 +0800
Message-Id: <20230808223412.1743176-10-sui.jingfeng@linux.dev>
In-Reply-To: <20230808223412.1743176-1-sui.jingfeng@linux.dev>
References: <20230808223412.1743176-1-sui.jingfeng@linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
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
Cc: Sui Jingfeng <suijingfeng@loongson.cn>, linux-pci@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Dave Airlie <airlied@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Sui Jingfeng <suijingfeng@loongson.cn>

s/chekcing/checking

While at it, convert the comments to the conventional multi-line style,
and rewrap to fill 78 columns.

Fixes: deb2d2ecd43d ("PCI/GPU: implement VGA arbitration on Linux")
Signed-off-by: Sui Jingfeng <suijingfeng@loongson.cn>
---
 drivers/pci/vgaarb.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/pci/vgaarb.c b/drivers/pci/vgaarb.c
index d80d92e8012b..9f5cf6a6e3a2 100644
--- a/drivers/pci/vgaarb.c
+++ b/drivers/pci/vgaarb.c
@@ -79,14 +79,16 @@ static const char *vga_iostate_to_str(unsigned int iostate)
 
 static int vga_str_to_iostate(char *buf, int str_size, unsigned int *io_state)
 {
-	/* we could in theory hand out locks on IO and mem
-	 * separately to userspace but it can cause deadlocks */
+	/*
+	 * In theory, we could hand out locks on IO and MEM separately to
+	 * userspace, but this can cause deadlocks.
+	 */
 	if (strncmp(buf, "none", 4) == 0) {
 		*io_state = VGA_RSRC_NONE;
 		return 1;
 	}
 
-	/* XXX We're not chekcing the str_size! */
+	/* XXX We're not checking the str_size! */
 	if (strncmp(buf, "io+mem", 6) == 0)
 		goto both;
 	else if (strncmp(buf, "io", 2) == 0)
-- 
2.34.1

