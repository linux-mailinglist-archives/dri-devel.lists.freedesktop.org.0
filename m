Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D68354DACE
	for <lists+dri-devel@lfdr.de>; Thu, 16 Jun 2022 08:39:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF1BF10EC60;
	Thu, 16 Jun 2022 06:39:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out203-205-221-233.mail.qq.com (out203-205-221-233.mail.qq.com
 [203.205.221.233])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D045210EC60
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Jun 2022 06:39:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
 t=1655361546; bh=e7EthkRUT/+g8yJMCRnNRSxVxeGiT4zqA39Ymi2LnIo=;
 h=From:To:Cc:Subject:Date;
 b=Ab7rnMJhPeWk03mAR9Yet46Hmrw9ADZ4DdlPHUNI1+ChfO9r9kUgRpHSXcpWOpFIk
 k5ZoJzk+DVLfqp1jlu5ml4yUm+i5WZ+9JQaiv3pN+xlZAKWlhEXVTTowy7w9Ly5i7b
 OEVBTdobeX+9/ZHVwsZ2T42qRHBjGB2p6d8E4avo=
Received: from localhost.localdomain ([116.128.244.169])
 by newxmesmtplogicsvrsza7.qq.com (NewEsmtp) with SMTP
 id 978A1EB5; Thu, 16 Jun 2022 14:37:56 +0800
X-QQ-mid: xmsmtpt1655361476t5f2serze
Message-ID: <tencent_E27AB3C77389894903E12AD66F3299FAB40A@qq.com>
X-QQ-XMAILINFO: NVviswOLIctoSW/LkYn0fnOExVYB1BQNSZCBCdQXf7V9jSnnTUCZ51fOaqVvTT
 24Xnre7zytRjdcVChEEno40ktGoHnLlNQJYR8eN+NmCMvpKHAWvHcpJmW5fklP6Lqh8EYruBtDYs
 1mb0GxluhPUJJGd5QDGDYheSFJ6nXhyvPtFE1cHoIWsfvDOXHvICBsM73h5lQ+4CEC/PVVUILpl7
 xzn+T3mnXr92tyHRYCpnsUg4OzWRBDJKEkeHCFJFF3c1aTm04WU1L5EP93/UhyxYbWyMRy339zvi
 kYq1CHtT5WLr/2MnLP7ABdS8FP4np/EaUnx+pXLc5/A2XFdXyyhQ82iDwdTRpyxOfQf/IJ0Sykuw
 cJLuDbj/YqOGdPFhJ4ovxsjqjnvxCexcG8b8Rjw+0wnxVDTILSuTbSIur5FsWhVdt63vfNV4Da2P
 Mwzg/tqINPlfzB8yIWF91tJy79J8U7oq+qbrd5ZUpkwfeWQlN5aaDl2TXGFnn2BFrWXb9EtRycSz
 JH37dvWjmBYcRpSaPl/8CWG2lNF4RPjP1eUP9QTkFWB886U1GWNoG+QKS30atdaBBkKFh54GJwIm
 e15rcbGmZzjbIXCTq3ytQFlvbjbbs5+P+uocQyFwCjN8DypxAZ5fqwG6a12KnG+eWdZFqoU8in8K
 QKbVOiQz5Wb1wLrU0i2VUwtCLVL0gUG4HXyh3A89aJ0YKEwrtEeY0yGv49e6m4SjXbsVfqaocOZ7
 tsBKdz5VTtxJeq2kwvvl2BcyLvxuqNf4H+0ngK/DAMP3Acc6wa4PLyz657GJ6usOtANkQRhRUqcE
 4tvZBR9WTJFdZxpnXR+8EsUUwkfU5G26S1ZwTecNykDqgaiwUjW6kn3biLLwEPbR+vSP7XZY/U1w
 ==
From: 1064094935@qq.com
To: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
Subject: [PATCH] drm/gma500: Fix spelling typo in comment
Date: Thu, 16 Jun 2022 14:37:35 +0800
X-OQ-MSGID: <20220616063735.103952-1-1064094935@qq.com>
X-Mailer: git-send-email 2.25.1
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
Cc: David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, pengfuyuan <pengfuyuan@kylinos.cn>,
 k2ci <kernel-bot@kylinos.cn>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: pengfuyuan <pengfuyuan@kylinos.cn>

Fix spelling typo in comment.

Reported-by: k2ci <kernel-bot@kylinos.cn>
Signed-off-by: pengfuyuan <pengfuyuan@kylinos.cn>
---
 drivers/gpu/drm/gma500/psb_intel_sdvo_regs.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/gma500/psb_intel_sdvo_regs.h b/drivers/gpu/drm/gma500/psb_intel_sdvo_regs.h
index 600e79744d68..9554a61fdd57 100644
--- a/drivers/gpu/drm/gma500/psb_intel_sdvo_regs.h
+++ b/drivers/gpu/drm/gma500/psb_intel_sdvo_regs.h
@@ -371,7 +371,7 @@ struct psb_intel_sdvo_tv_format {
 
 #define SDVO_CMD_SET_TV_FORMAT				0x29
 
-/** Returns the resolutiosn that can be used with the given TV format */
+/* Returns the resolution that can be used with the given TV format */
 #define SDVO_CMD_GET_SDTV_RESOLUTION_SUPPORT		0x83
 struct psb_intel_sdvo_sdtv_resolution_request {
     unsigned int ntsc_m:1;
-- 
2.25.1


No virus found
		Checked by Hillstone Network AntiVirus
