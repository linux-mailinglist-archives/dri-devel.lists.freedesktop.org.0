Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B76B43F79A
	for <lists+dri-devel@lfdr.de>; Fri, 29 Oct 2021 09:03:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6DB066E9F2;
	Fri, 29 Oct 2021 07:03:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x52a.google.com (mail-pg1-x52a.google.com
 [IPv6:2607:f8b0:4864:20::52a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F6EC6E9F2
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Oct 2021 07:03:15 +0000 (UTC)
Received: by mail-pg1-x52a.google.com with SMTP id m21so8993426pgu.13
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Oct 2021 00:03:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=igel-co-jp.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=r3BsV1GTEqKXRyiYvYJGLvk2Pn1r3f4nsDFd9biBydc=;
 b=1miiAeJBD4YHde618x7VUYA3a8mA3M9i9cwKp+Hot/5+6jc/hdle2k/q2vrIoRW6pq
 jT1WM/yegfAfiaTwfqIrwef7lJ7qOke/IYttmFIK+ELo34L50cDydN0cGctNM7TdVUHU
 aeh98mybKRQ1WA/0B8kSHysJgPlyfYGJ4GBGP52iCTcRzswlgX1ERw2XKQq8a3ZErNeY
 RtzSMASWb1oVsKSwSsnYhei+Zc+ilVBUP65qwnB2Ja3n9+jfOLqIuTiK7I8UeFAw1ovF
 hWzC1RrYP7IkudA4rIHRJTisF5cILo9P/5CGMTnWtid4Dcq2i41os5gZWTx/azWf7UIc
 ZqCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=r3BsV1GTEqKXRyiYvYJGLvk2Pn1r3f4nsDFd9biBydc=;
 b=i9XtAE3cijcZOAPynm0IuiqCHo5Zi6m+qSsMJhu4hGITgYtKvkVneugCgDVJV9pYly
 LRL19McYTorVj0skIOG7RoMgmmCn3MC+KOnAFQKSlt3iHFP0Ncd6OBX9ydf4VwNjcd1+
 3u5m3Paa+sT8KTamiS2gXTp+uHkw70/PoWQsfQKmo47kukva/PXPzg5OaK6O4nCcIV25
 rbjXmVKh6nuySb+tMrErjrkBWSRmnoBsd2QzBzP5ecsJPdLJ/XBMWK8PJYtsHtcHeTaR
 v0OKRGgiJOOndxweROcK3XAvp6kzLBvMh8+LeGoCvZh3IsoV3ilVqnaxHqW4rcUVQOvA
 ihkQ==
X-Gm-Message-State: AOAM530quw2laf91b2uMfibhsbNS6ChWT/VNlxAzNsJlc8NL9TDz5HPY
 M6MpE/8E7IIyMLS3l7dkGlnKlw==
X-Google-Smtp-Source: ABdhPJyYm5rE0hVRGHglH0izEfcuNX4yWQ6QvHTkUa/fEf//YnbIBYTmnBZevBFErFa9RyNL+x1GTQ==
X-Received: by 2002:a05:6a00:1897:b0:47b:ff8c:3b05 with SMTP id
 x23-20020a056a00189700b0047bff8c3b05mr9180742pfh.37.1635490995256; 
 Fri, 29 Oct 2021 00:03:15 -0700 (PDT)
Received: from tyrell.hq.igel.co.jp (napt.igel.co.jp. [219.106.231.132])
 by smtp.gmail.com with ESMTPSA id p16sm6039787pfh.97.2021.10.29.00.03.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Oct 2021 00:03:14 -0700 (PDT)
From: Shunsuke Mie <mie@igel.co.jp>
To: Zhu Yanjun <zyjzyj2000@gmail.com>
Cc: Shunsuke Mie <mie@igel.co.jp>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, Doug Ledford <dledford@redhat.com>,
 Jason Gunthorpe <jgg@ziepe.ca>, Jianxin Xiong <jianxin.xiong@intel.com>,
 Leon Romanovsky <leon@kernel.org>, Maor Gottlieb <maorg@nvidia.com>,
 Sean Hefty <sean.hefty@intel.com>, Sumit Semwal <sumit.semwal@linaro.org>,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-rdma@vger.kernel.org, dhobsong@igel.co.jp, taki@igel.co.jp,
 etom@igel.co.jp
Subject: [RFC PATCH v3 1/2] RDMA/umem: Change for rdma devices has not dma
 device
Date: Fri, 29 Oct 2021 16:02:57 +0900
Message-Id: <20211029070258.59299-2-mie@igel.co.jp>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211029070258.59299-1-mie@igel.co.jp>
References: <20211029070258.59299-1-mie@igel.co.jp>
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

Current implementation requires a dma device for RDMA driver to use
dma-buf memory space as RDMA buffer. However, software RDMA drivers has
not dma device and copy RDMA data using CPU instead of hardware.

This patch changes to be hold a dma-buf on struct ib_umem_dmabuf. This
allows the software RDMA driver to map dma-buf memory for CPU memory
accessing.

Signed-off-by: Shunsuke Mie <mie@igel.co.jp>
---
 drivers/infiniband/core/umem_dmabuf.c | 20 ++++++++++++++++----
 include/rdma/ib_umem.h                |  1 +
 2 files changed, 17 insertions(+), 4 deletions(-)

diff --git a/drivers/infiniband/core/umem_dmabuf.c b/drivers/infiniband/core/umem_dmabuf.c
index e824baf4640d..ebbb0a259fd4 100644
--- a/drivers/infiniband/core/umem_dmabuf.c
+++ b/drivers/infiniband/core/umem_dmabuf.c
@@ -117,9 +117,6 @@ struct ib_umem_dmabuf *ib_umem_dmabuf_get(struct ib_device *device,
 	if (check_add_overflow(offset, (unsigned long)size, &end))
 		return ret;
 
-	if (unlikely(!ops || !ops->move_notify))
-		return ret;
-
 	dmabuf = dma_buf_get(fd);
 	if (IS_ERR(dmabuf))
 		return ERR_CAST(dmabuf);
@@ -133,6 +130,8 @@ struct ib_umem_dmabuf *ib_umem_dmabuf_get(struct ib_device *device,
 		goto out_release_dmabuf;
 	}
 
+	umem_dmabuf->dmabuf = dmabuf;
+
 	umem = &umem_dmabuf->umem;
 	umem->ibdev = device;
 	umem->length = size;
@@ -143,6 +142,13 @@ struct ib_umem_dmabuf *ib_umem_dmabuf_get(struct ib_device *device,
 	if (!ib_umem_num_pages(umem))
 		goto out_free_umem;
 
+	/* Software RDMA drivers has not dma device. Just get dmabuf from fd */
+	if (!device->dma_device)
+		goto done;
+
+	if (unlikely(!ops || !ops->move_notify))
+		goto out_free_umem;
+
 	umem_dmabuf->attach = dma_buf_dynamic_attach(
 					dmabuf,
 					device->dma_device,
@@ -152,6 +158,7 @@ struct ib_umem_dmabuf *ib_umem_dmabuf_get(struct ib_device *device,
 		ret = ERR_CAST(umem_dmabuf->attach);
 		goto out_free_umem;
 	}
+done:
 	return umem_dmabuf;
 
 out_free_umem:
@@ -165,13 +172,18 @@ EXPORT_SYMBOL(ib_umem_dmabuf_get);
 
 void ib_umem_dmabuf_release(struct ib_umem_dmabuf *umem_dmabuf)
 {
-	struct dma_buf *dmabuf = umem_dmabuf->attach->dmabuf;
+	struct dma_buf *dmabuf = umem_dmabuf->dmabuf;
+
+	if (!umem_dmabuf->attach)
+		goto free_dmabuf;
 
 	dma_resv_lock(dmabuf->resv, NULL);
 	ib_umem_dmabuf_unmap_pages(umem_dmabuf);
 	dma_resv_unlock(dmabuf->resv);
 
 	dma_buf_detach(dmabuf, umem_dmabuf->attach);
+
+free_dmabuf:
 	dma_buf_put(dmabuf);
 	kfree(umem_dmabuf);
 }
diff --git a/include/rdma/ib_umem.h b/include/rdma/ib_umem.h
index 5ae9dff74dac..11c0cf7e0dd8 100644
--- a/include/rdma/ib_umem.h
+++ b/include/rdma/ib_umem.h
@@ -32,6 +32,7 @@ struct ib_umem {
 struct ib_umem_dmabuf {
 	struct ib_umem umem;
 	struct dma_buf_attachment *attach;
+	struct dma_buf *dmabuf;
 	struct sg_table *sgt;
 	struct scatterlist *first_sg;
 	struct scatterlist *last_sg;
-- 
2.17.1

