Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 33B3CA63AC0
	for <lists+dri-devel@lfdr.de>; Mon, 17 Mar 2025 02:52:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B66F710E27A;
	Mon, 17 Mar 2025 01:52:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mxhk.zte.com.cn (mxhk.zte.com.cn [63.216.63.35])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D750F10E27A
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Mar 2025 01:52:45 +0000 (UTC)
Received: from mse-fl1.zte.com.cn (unknown [10.5.228.132])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mxhk.zte.com.cn (FangMail) with ESMTPS id 4ZGHzQ2Rphz5B1J4;
 Mon, 17 Mar 2025 09:52:34 +0800 (CST)
Received: from xaxapp01.zte.com.cn ([10.88.99.176])
 by mse-fl1.zte.com.cn with SMTP id 52H1qFfp073947;
 Mon, 17 Mar 2025 09:52:16 +0800 (+08)
 (envelope-from feng.wei8@zte.com.cn)
Received: from mapi (xaxapp05[null]) by mapi (Zmail) with MAPI id mid32;
 Mon, 17 Mar 2025 09:52:17 +0800 (CST)
Date: Mon, 17 Mar 2025 09:52:17 +0800 (CST)
X-Zmail-TransId: 2afc67d7805153c-f0bae
X-Mailer: Zmail v1.0
Message-ID: <20250317095217146xx5rleJV2hlI8ucSypghO@zte.com.cn>
Mime-Version: 1.0
From: <feng.wei8@zte.com.cn>
To: <sumit.semwal@linaro.org>
Cc: <benjamin.gaignard@collabora.com>, <brian.starkey@arm.com>,
 <jstultz@google.com>, <tjmercier@google.com>,
 <christian.koenig@amd.com>, <linux-media@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <linaro-mm-sig@lists.linaro.org>,
 <linux-kernel@vger.kernel.org>
Subject: =?UTF-8?B?W1BBVENIIHYyXSBkbWEtYnVmOiBoZWFwczogUmVwbGFjZSBuZXN0ZWQgbWF4KCkgd2l0aCBzaW5nbGUgbWF4Mygp?=
Content-Type: text/plain;
	charset="UTF-8"
X-MAIL: mse-fl1.zte.com.cn 52H1qFfp073947
X-Fangmail-Anti-Spam-Filtered: true
X-Fangmail-MID-QID: 67D78062.001/4ZGHzQ2Rphz5B1J4
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

From: FengWei <feng.wei8@zte.com.cn>

Use max3() macro instead of nesting max() to simplify the return
statement.

Signed-off-by: FengWei <feng.wei8@zte.com.cn>
---
v1 -> v2
perfect the prefix
drivers/dma-buf/dma-heap.c | 2 +-
1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/dma-buf/dma-heap.c b/drivers/dma-buf/dma-heap.c
index 3cbe87d4a464..96cb9ab5731a 100644
--- a/drivers/dma-buf/dma-heap.c
+++ b/drivers/dma-buf/dma-heap.c
@@ -147,7 +147,7 @@ static long dma_heap_ioctl(struct file *file, unsigned int ucmd,
in_size = 0;
if ((ucmd & kcmd & IOC_OUT) == 0)
out_size = 0;
- ksize = max(max(in_size, out_size), drv_size);
+ ksize = max3(in_size, out_size, drv_size);

/* If necessary, allocate buffer for ioctl argument */
if (ksize > sizeof(stack_kdata)) {
--
2.25.1
