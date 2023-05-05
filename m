Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D3C66F7AE0
	for <lists+dri-devel@lfdr.de>; Fri,  5 May 2023 04:25:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0EC3110E14D;
	Fri,  5 May 2023 02:25:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 330 seconds by postgrey-1.36 at gabe;
 Fri, 05 May 2023 02:24:57 UTC
Received: from mxct.zte.com.cn (mxct.zte.com.cn [58.251.27.85])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E02AF10E14D
 for <dri-devel@lists.freedesktop.org>; Fri,  5 May 2023 02:24:57 +0000 (UTC)
Received: from mxde.zte.com.cn (unknown [10.35.20.165])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mxct.zte.com.cn (FangMail) with ESMTPS id 4QCDs803vfzCcNk
 for <dri-devel@lists.freedesktop.org>; Fri,  5 May 2023 10:19:24 +0800 (CST)
Received: from mxus.zte.com.cn (unknown [10.36.20.94])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mxde.zte.com.cn (FangMail) with ESMTPS id 4QCDrm1v4rz54hx6
 for <dri-devel@lists.freedesktop.org>; Fri,  5 May 2023 10:19:04 +0800 (CST)
Received: from mxhk.zte.com.cn (unknown [192.168.250.137])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mxus.zte.com.cn (FangMail) with ESMTPS id 4QCDrj3vPjzB6Gqs
 for <dri-devel@lists.freedesktop.org>; Fri,  5 May 2023 10:19:01 +0800 (CST)
Received: from mse-fl1.zte.com.cn (unknown [10.5.228.132])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mxhk.zte.com.cn (FangMail) with ESMTPS id 4QCDrc3Hn0z8RTWm;
 Fri,  5 May 2023 10:18:56 +0800 (CST)
Received: from xaxapp02.zte.com.cn ([10.88.97.241])
 by mse-fl1.zte.com.cn with SMTP id 3452IkoU063354;
 Fri, 5 May 2023 10:18:46 +0800 (+08)
 (envelope-from ye.xingchen@zte.com.cn)
Received: from mapi (xaxapp02[null]) by mapi (Zmail) with MAPI id mid31;
 Fri, 5 May 2023 10:18:47 +0800 (CST)
Date: Fri, 5 May 2023 10:18:47 +0800 (CST)
X-Zmail-TransId: 2afa645467877be-c82af
X-Mailer: Zmail v1.0
Message-ID: <202305051018472856954@zte.com.cn>
Mime-Version: 1.0
From: <ye.xingchen@zte.com.cn>
To: <sumit.semwal@linaro.org>
Subject: =?UTF-8?B?W1BBVENIXSBkbWEtYnVmOiBVc2UgZmRnZXQoKQ==?=
Content-Type: text/plain;
	charset="UTF-8"
X-MAIL: mse-fl1.zte.com.cn 3452IkoU063354
X-FangMail-Miltered: at esgde01-1.novalocal with ID 64546797.000 by FangMail
 milter!
X-FangMail-Envelope: 1683253144/4QCDrm1v4rz54hx6/64546797.000/10.36.20.94/[10.36.20.94]/mxus.zte.com.cn/<ye.xingchen@zte.com.cn>
X-Fangmail-Gw-Spam-Type: 0
X-Fangmail-Anti-Spam-Filtered: true
X-Fangmail-MID-QID: 645467AA.000/4QCDs803vfzCcNk
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
Cc: linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org,
 christian.koenig@amd.com, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Ye Xingchen <ye.xingchen@zte.com.cn>

convert the fget() use to fdget().

Signed-off-by: Ye Xingchen <ye.xingchen@zte.com.cn>
---
 drivers/dma-buf/dma-buf.c | 12 +++++-------
 1 file changed, 5 insertions(+), 7 deletions(-)

diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
index aa4ea8530cb3..bf4980b6f80c 100644
--- a/drivers/dma-buf/dma-buf.c
+++ b/drivers/dma-buf/dma-buf.c
@@ -729,19 +729,17 @@ EXPORT_SYMBOL_NS_GPL(dma_buf_fd, DMA_BUF);
  */
 struct dma_buf *dma_buf_get(int fd)
 {
-	struct file *file;
-
-	file = fget(fd);
+	struct fd f = fdget(fd);

-	if (!file)
+	if (!f.file)
 		return ERR_PTR(-EBADF);

-	if (!is_dma_buf_file(file)) {
-		fput(file);
+	if (!is_dma_buf_file(f.file)) {
+		fdput(f);
 		return ERR_PTR(-EINVAL);
 	}

-	return file->private_data;
+	return f.file->private_data;
 }
 EXPORT_SYMBOL_NS_GPL(dma_buf_get, DMA_BUF);

-- 
2.25.
