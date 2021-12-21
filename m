Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E78447BC97
	for <lists+dri-devel@lfdr.de>; Tue, 21 Dec 2021 10:10:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E839810F0EE;
	Tue, 21 Dec 2021 09:09:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 68F4410E2CC
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Dec 2021 00:42:49 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id g132so5143030wmg.2
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Dec 2021 16:42:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Puo2oNvsoRrnpQH+n5NLnmsOFgzm1Lgnbw19SNKWiaE=;
 b=Yba/NrOEC10S1hJBj0eFz30kKNmKLgaqv31/VG2P2JWZnd8YevofZq00lN4ZZYpVxm
 424ZLUH3eISz79/DXuMlNABq2nJjRWi0U3qlqC0Ll0pdrG249cCdq1fldf+sfZLYJfp3
 SfvRJQ81dRqJWIgcol2ywuZPcNG/V9KSsxq/WzXgqiuvsreUmO/bqMDWn5dk++kSE2P8
 bhRTTaZlcSwDGERXwXT3Pu4x3FAUkCtiZMpRMLdZVbbgvH2n/Ig86m7v5im/IK6u90Dj
 HMMdvnjekcWiWtdcwBM/YA8aYQYu2jElTpI6eBO6nrBiXQBcGel+xWf40iMX5Y1Nw9zy
 lxDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Puo2oNvsoRrnpQH+n5NLnmsOFgzm1Lgnbw19SNKWiaE=;
 b=QG7LjSHJ1ortadvsRsuRSRfmWOQ7Teino5XUEx2/Bk+yYi62n1V35wWtexOtlaxghw
 N8owehVopQGJA5LGCAoTkbxMaWv+guUapTRcV6mlZ3RNZTSJW2vZ5qgaPDRqTNwGqHTs
 bC4OXneKZXGFvp47rOq65Suv2VfhUAa4t1ZcHFu1xA2BsO+DJ8zuArHW5XtyiW+GtVrj
 HuVmgHAjRUmFFT5cCqKPd105tkwGAilJ8zHVF2e53GCVLBSJ0QJOasR+wJtLX41H67DO
 +N7Oe9H9IRBCVHH6onKaZYBX4kc8USFIKCY0EpLcH6cJtih2cEEtZz4rVpeqwflgg2JH
 sq1A==
X-Gm-Message-State: AOAM53304+iuSXlz0ngFeR8bEXLvTxf7RQSyxGR3ZRwYRMOpePxAwN1K
 L+Bzcw926U+FfZP4fNmZBB4ix+7qGydbhFVbVGid/g==
X-Google-Smtp-Source: ABdhPJzjBBPLhk7+kN3XdBeElOx6r0VuLj7K389GxHsxIkT+d5ia1DNpdzu60cAWnGs3oVVdDE0kHw==
X-Received: by 2002:a05:600c:2f01:: with SMTP id
 r1mr409570wmn.153.1640047367820; 
 Mon, 20 Dec 2021 16:42:47 -0800 (PST)
Received: from localhost (cpc154979-craw9-2-0-cust193.16-3.cable.virginm.net.
 [80.193.200.194])
 by smtp.gmail.com with ESMTPSA id h2sm16176319wrz.23.2021.12.20.16.42.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Dec 2021 16:42:47 -0800 (PST)
From: Colin Ian King <colin.i.king@gmail.com>
To: dri-devel@lists.freedesktop.org,
	linux-fbdev@vger.kernel.org
Subject: [PATCH] video: fbdev: mb862xx: remove redundant assignment to pointer
 ptr
Date: Tue, 21 Dec 2021 00:42:46 +0000
Message-Id: <20211221004246.213203-1-colin.i.king@gmail.com>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Tue, 21 Dec 2021 09:09:51 +0000
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
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The pointer ptr is being assigned a value that is never read. The
pointer is being re-assigned later in a loop. The assignment is
redundant and can be removed.

Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
---
 drivers/video/fbdev/mb862xx/mb862xxfb_accel.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/video/fbdev/mb862xx/mb862xxfb_accel.c b/drivers/video/fbdev/mb862xx/mb862xxfb_accel.c
index d40b806461ca..61aed7fc0b8d 100644
--- a/drivers/video/fbdev/mb862xx/mb862xxfb_accel.c
+++ b/drivers/video/fbdev/mb862xx/mb862xxfb_accel.c
@@ -132,7 +132,7 @@ static void mb86290fb_imageblit8(u32 *cmd, u16 step, u16 dx, u16 dy,
 	cmd[2] = (height << 16) | width;
 
 	i = 0;
-	line = ptr = image->data;
+	line = image->data;
 	bytes = image->width;
 
 	while (i < height) {
-- 
2.32.0

