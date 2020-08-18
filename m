Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 408C624958D
	for <lists+dri-devel@lfdr.de>; Wed, 19 Aug 2020 08:57:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 623876E1C0;
	Wed, 19 Aug 2020 06:57:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout4.samsung.com (mailout4.samsung.com [203.254.224.34])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C141189DDD
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Aug 2020 07:52:09 +0000 (UTC)
Received: from epcas2p1.samsung.com (unknown [182.195.41.53])
 by mailout4.samsung.com (KnoxPortal) with ESMTP id
 20200818074554epoutp04c0d0336bfbec8b572fe6af41567cb4fa~sTR0L_NrX3248532485epoutp04E
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Aug 2020 07:45:54 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com
 20200818074554epoutp04c0d0336bfbec8b572fe6af41567cb4fa~sTR0L_NrX3248532485epoutp04E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1597736755;
 bh=WSuAFDWoURcxmiALpbK+J/YL247Y+9wNans04ihmNTY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=JIxK4juOdTwa+mcUtfqa4EmWuH8Vz6XU9olKFkfcAx+IJTAL11mDDb5xpUxwIQuaw
 IkOe7M9thqXne6IGJ6xhqKuxln/SY1HpUv4uCt3RcAHAG6wx9YEV2as2nYsddjfs9A
 /f9GtH6l5dAhAZIbxTZcxzhB1Dt3rdiRAxihPAvY=
Received: from epsnrtp1.localdomain (unknown [182.195.42.162]) by
 epcas2p1.samsung.com (KnoxPortal) with ESMTP id
 20200818074554epcas2p19f579b82774797c41f96c2c7fe4e9759~sTRzoJm6b0149301493epcas2p1z;
 Tue, 18 Aug 2020 07:45:54 +0000 (GMT)
Received: from epsmges2p2.samsung.com (unknown [182.195.40.190]) by
 epsnrtp1.localdomain (Postfix) with ESMTP id 4BW2yl1BvLzMqYlr; Tue, 18 Aug
 2020 07:45:51 +0000 (GMT)
Received: from epcas2p2.samsung.com ( [182.195.41.54]) by
 epsmges2p2.samsung.com (Symantec Messaging Gateway) with SMTP id
 69.10.18874.E278B3F5; Tue, 18 Aug 2020 16:45:50 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
 epcas2p1.samsung.com (KnoxPortal) with ESMTPA id
 20200818074550epcas2p1e12121bc6e38086277766f08a59767ff~sTRwKzPO62831228312epcas2p1h;
 Tue, 18 Aug 2020 07:45:50 +0000 (GMT)
Received: from epsmgms1p2.samsung.com (unknown [182.195.42.42]) by
 epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20200818074550epsmtrp1d20be4cab1f36e79e6f352e53dbf616f~sTRwJPPI82704027040epsmtrp1r;
 Tue, 18 Aug 2020 07:45:50 +0000 (GMT)
X-AuditID: b6c32a46-503ff700000049ba-82-5f3b872e2517
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
 epsmgms1p2.samsung.com (Symantec Messaging Gateway) with SMTP id
 F6.78.08303.E278B3F5; Tue, 18 Aug 2020 16:45:50 +0900 (KST)
Received: from Dabang.dsn.sec.samsung.com (unknown [12.36.155.59]) by
 epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20200818074550epsmtip2b83c1a5c64259b06e112df6e7747129b~sTRv4_JW_2522925229epsmtip2N;
 Tue, 18 Aug 2020 07:45:50 +0000 (GMT)
From: Hyesoo Yu <hyesoo.yu@samsung.com>
To: sumit.semwal@linaro.org
Subject: [PATCH 1/3] dma-buf: add missing EXPORT_SYMBOL_GPL() for dma heaps
Date: Tue, 18 Aug 2020 17:04:13 +0900
Message-Id: <20200818080415.7531-2-hyesoo.yu@samsung.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200818080415.7531-1-hyesoo.yu@samsung.com>
MIME-Version: 1.0
X-Brightmail-Tracker: H4sIAAAAAAAAA02Te0xTVxzHc2577y2akmvFecQotY4tuPBot+IBYRJl5G4sER97hBDhDu5a
 XClNW2AwluEq5WVhjJcDQkkEBrXMyWuAjG0FAQER5CWbYAQxccJYQOaDIWspZvz3Ob/f95vv
 +f1ODo8jyCadedFKLatWMgoRsYXb1OHm7e6Zdijca+0UWujNJVHpZTOBvrb0Emi6dxCg+btX
 cWTsHMDRyPICgVYzBnFUk6Uj0JPyaQ7qX3FHNW1PMfR45B6GhltLCXT+x0YcTZnXcFR8fQxD
 VcsLJHph+A2g1J87SdQ7uUSivFvlBCo5mw0CdtKpt1YJ2lxmBvRwtgGjy+vi6DpTBkHXLX5L
 0pnzIxh9Z6yNoHsurHDpu1ndGP3HixkOvdA+StDZDSZA95d3knT37Z8weqlubwgVqvCTs0wU
 qxayysjYqGilzF8UfDL8aLjU20vsLvZBB0VCJRPD+osC3w9xD4pWWFchEsYzijhrKYTRaESe
 b/upY+O0rFAeq9H6i1hVlEIlFqs8NEyMJk4p84iMjfEVe3lJpFZlhEI+N2TGVNf4nz/vuoKn
 gGtbM4EDD1JvwdF7OiwTbOEJqGYAp7LmOPbDIoD5FdkbnSUAWwwGzktL11MTaWMB1QrgXEqg
 XfQEwLHaFMLWIKjXYU9DFbCxE7UbFlVX4zYRh6rhwrG829YGj7edCoZ1xngbcilXOJETYUM+
 5QO7h8T2KBeYWzK5LnagfOHsJR9bmU9tg9e/u8+1Mccq0TWWrN8ZUt87wNRFHWH3BsKUdttk
 Nt4O/+xuIO3sDB/m6Dc4Ad44N43bzecAHCoc3TC/CYsfpK0Hcyg3eLnV04aQ2g87f9/IdYTp
 HaukvcyH6XqB3bgf/lJVxrXzLjhdm4bbmYalS5WEfVEGACd/KATfAGHxpnGKN41T/H9wOeCY
 wCusShMjYzUSlWTz89aB9Y9xIKgZ5M//7WEBGA9YAORxRE78T3oOhgv4UUxiEquODVfHKViN
 BUitm87lOO+IjLX+LKU2XCyVeHt7+UiR1FuCRDv5X+0bPC2gZIyW/YxlVaz6pQ/jOTinYN4J
 zaY9k6Z/ZBHjl97piB5v0v1beb9A+Z5DhShDxeRIRWf21fehrTOO9fo0h6HW1oDn/TmnZ7sn
 dFUdLnj1tmJhwU39cNhRqeuJiy5hZc+aPhLcccz6MGQpaLyo+rHsuGNHYmLCF6VZgSXtVz1i
 5GEPfFrc2CPLa8cbTurmhMllYy6vjeTV7gIS9iiuDsiFeidT2RX3bNe9E/S7SW17gtM/PXax
 8NVj+LP8tBNTu4FFHPrI8JcfX75sNJ6ZHSiNP9VyKFl72PxGjfnszb4C+GWvMRMWTe6wkM3k
 4Rn9BzlM0uoFY/KvydrJh30fd+l8ByqII4/qQ6duJK40rjKVYedFXI2cER/gqDXMfxUIIF+h
 BAAA
X-Brightmail-Tracker: H4sIAAAAAAAAA02Re0hTYRjG+c7Ozo6L0XEaHY2MVhIuXGmGX2omBPWhFUVYUuBcedKVzrWl
 pgWpZZHmSgNn0/QYZbZml5PWqGU1ZzoRcTqj27xVhqGsMkuSLk4J+u/H83t4eOEleWI77k8q
 VUcYjUqRJiGE+P0WyZJg2ZlI+WrH7QDo7igVwKrbJgIWWDsIONzRDeD4wCM+rLF18aFz0k3A
 X2e7+fBG8UkC/mCHebBzOhjesExh8JtzCIO9D6sIeO5OEx/2m/7wocH+AoN1k24B/F3yDMDC
 xzYB7HBNCODFHpaAlfk6ELMQFfb8IpCp2gRQr64EQyyXiTjjWQJxX8sEqGjciaG3LywEaq+Y
 xtFAcRuG3vx+x0Pu5j4C6RqNAHWyNgFqe/kAQxNcwHZqjzAqmUlTZjGaVdFJwtQxhwlTt4qO
 /nx+l58HWucVAS+SpsLo51NGQREQkmLKDGiHrZ+YE360YcKOzbEPPXDKxp8rTQJabzDzPYKg
 VtDtjXXAw77UIlpfXz9b4lEtON1y6+XMEkn6UHE0V5PlQZwKpF+dT/KgiFpHtzlC5uaX0KWV
 LuCJvagI+sPNdZ5YPNMwW8yzF4gob9p+6T3uYd5M/WRTJe8CoAz/KcN/igWYEfgxam16Sro2
 RB2qYrJlWkW6NlOVItufkc6B2W9LpWZgMX6WWQFGAiugSZ7EV7SvPVwuFiUrcnIZTYZck5nG
 aK1gEYlLFoomDbWJYipFcYQ5xDBqRvPPYqSXfx5W8b6J3RwlKwXRmblcaIA0u098VP8tocA9
 mrMq0Nc2ryxx/xf0qqSwxmm/DLt1MKE8PuKq+fvNranjT/SIlYTv7D9W8CgqQ+pUy/3nC5c3
 GEZGwa7G6zVar/j1OSvX+JfuZg9M+y2OG3zWuznYO0E5v3pZc2zteNbd1k/ElbjEjF0Nrd7b
 ZAN9FWO6QP2WjVzxxM7BWz8PnvgY43sh4URP7TUy8bU0llDnlDF1eeuD7q09HuuSj/mEF486
 LkZyC3bkW/cMP3Vkn8ovjzocck3RkGRLUwYNdm3wGaosX+EaZgddyg1TMRHRotOgWpWNm78P
 xVsOWMHI3rA7lqUjmyS4NlURIuVptIq/Intb4VwDAAA=
X-CMS-MailID: 20200818074550epcas2p1e12121bc6e38086277766f08a59767ff
X-Msg-Generator: CA
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20200818074550epcas2p1e12121bc6e38086277766f08a59767ff
References: <20200818080415.7531-1-hyesoo.yu@samsung.com>
 <CGME20200818074550epcas2p1e12121bc6e38086277766f08a59767ff@epcas2p1.samsung.com>
X-Mailman-Approved-At: Wed, 19 Aug 2020 06:56:51 +0000
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
Cc: dri-devel@lists.freedesktop.org, linux-mm@kvack.org,
 Hyesoo Yu <hyesoo.yu@samsung.com>, labbott@redhat.com,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org, robh+dt@kernel.org, pullip.cho@samsung.com,
 surenb@google.com, iamjoonsoo.kim@lge.com, vbabka@suse.cz,
 linux-kernel@vger.kernel.org, lmark@codeaurora.org, afd@ti.com,
 minchan@kernel.org, joaodias@google.com, akpm@linux-foundation.org,
 christian.koenig@amd.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The interface of dma heap is used from kernel module to
register dma heaps, otherwize we will get compile error.

Signed-off-by: Hyesoo Yu <hyesoo.yu@samsung.com>
---
 drivers/dma-buf/dma-heap.c           | 2 ++
 drivers/dma-buf/heaps/heap-helpers.c | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/drivers/dma-buf/dma-heap.c b/drivers/dma-buf/dma-heap.c
index afd22c9..cc6339c 100644
--- a/drivers/dma-buf/dma-heap.c
+++ b/drivers/dma-buf/dma-heap.c
@@ -189,6 +189,7 @@ void *dma_heap_get_drvdata(struct dma_heap *heap)
 {
 	return heap->priv;
 }
+EXPORT_SYMBOL_GPL(dma_heap_get_drvdata);
 
 struct dma_heap *dma_heap_add(const struct dma_heap_export_info *exp_info)
 {
@@ -272,6 +273,7 @@ struct dma_heap *dma_heap_add(const struct dma_heap_export_info *exp_info)
 	kfree(heap);
 	return err_ret;
 }
+EXPORT_SYMBOL_GPL(dma_heap_add);
 
 static char *dma_heap_devnode(struct device *dev, umode_t *mode)
 {
diff --git a/drivers/dma-buf/heaps/heap-helpers.c b/drivers/dma-buf/heaps/heap-helpers.c
index 9f964ca..741bae0 100644
--- a/drivers/dma-buf/heaps/heap-helpers.c
+++ b/drivers/dma-buf/heaps/heap-helpers.c
@@ -24,6 +24,7 @@ void init_heap_helper_buffer(struct heap_helper_buffer *buffer,
 	INIT_LIST_HEAD(&buffer->attachments);
 	buffer->free = free;
 }
+EXPORT_SYMBOL_GPL(init_heap_helper_buffer);
 
 struct dma_buf *heap_helper_export_dmabuf(struct heap_helper_buffer *buffer,
 					  int fd_flags)
@@ -37,6 +38,7 @@ struct dma_buf *heap_helper_export_dmabuf(struct heap_helper_buffer *buffer,
 
 	return dma_buf_export(&exp_info);
 }
+EXPORT_SYMBOL_GPL(heap_helper_export_dmabuf);
 
 static void *dma_heap_map_kernel(struct heap_helper_buffer *buffer)
 {
-- 
2.7.4

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
