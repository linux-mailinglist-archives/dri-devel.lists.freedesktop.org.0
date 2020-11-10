Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 932C12AE1B9
	for <lists+dri-devel@lfdr.de>; Tue, 10 Nov 2020 22:27:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD61C89CB5;
	Tue, 10 Nov 2020 21:27:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6964989CAF
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Nov 2020 21:27:30 +0000 (UTC)
IronPort-SDR: +d+I/nxm1anAmz23M5CBaITQArF8wFIk25QfTSY7En58ygrr1eGknJc6cikZFR5zgpOE+tSxTc
 QaePlP3qOK+Q==
X-IronPort-AV: E=McAfee;i="6000,8403,9801"; a="157060680"
X-IronPort-AV: E=Sophos;i="5.77,467,1596524400"; d="scan'208";a="157060680"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2020 13:27:29 -0800
IronPort-SDR: 0NS6aqzbuIqjlXBVxN7ajmtLstwKmkSe/I+jNmp4B05cgZBS6lE5JvIRmrlc7sL+cjw6uo8Fxq
 KGoGPbSHX2dA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,467,1596524400"; d="scan'208";a="541500552"
Received: from cst-dev.jf.intel.com ([10.23.221.69])
 by orsmga005.jf.intel.com with ESMTP; 10 Nov 2020 13:27:28 -0800
From: Jianxin Xiong <jianxin.xiong@intel.com>
To: linux-rdma@vger.kernel.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v10 6/6] dma-buf: Document that dma-buf size is fixed
Date: Tue, 10 Nov 2020 13:41:17 -0800
Message-Id: <1605044477-51833-7-git-send-email-jianxin.xiong@intel.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1605044477-51833-1-git-send-email-jianxin.xiong@intel.com>
References: <1605044477-51833-1-git-send-email-jianxin.xiong@intel.com>
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
Cc: Leon Romanovsky <leon@kernel.org>, Jason Gunthorpe <jgg@ziepe.ca>,
 Doug Ledford <dledford@redhat.com>, Daniel Vetter <daniel.vetter@intel.com>,
 Christian Koenig <christian.koenig@amd.com>,
 Jianxin Xiong <jianxin.xiong@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The fact that the size of dma-buf is invariant over the lifetime of the
buffer is mentioned in the comment of 'dma_buf_ops.mmap', but is not
documented at where the info is defined. Add the missing documentation.

Signed-off-by: Jianxin Xiong <jianxin.xiong@intel.com>
---
 include/linux/dma-buf.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/include/linux/dma-buf.h b/include/linux/dma-buf.h
index 9dcd569..92da98b 100644
--- a/include/linux/dma-buf.h
+++ b/include/linux/dma-buf.h
@@ -272,7 +272,7 @@ struct dma_buf_ops {
 
 /**
  * struct dma_buf - shared buffer object
- * @size: size of the buffer
+ * @size: size of the buffer; invariant over the lifetime of the buffer.
  * @file: file pointer used for sharing buffers across, and for refcounting.
  * @attachments: list of dma_buf_attachment that denotes all devices attached,
  *               protected by dma_resv lock.
@@ -404,7 +404,7 @@ struct dma_buf_attachment {
  * @exp_name:	name of the exporter - useful for debugging.
  * @owner:	pointer to exporter module - used for refcounting kernel module
  * @ops:	Attach allocator-defined dma buf ops to the new buffer
- * @size:	Size of the buffer
+ * @size:	Size of the buffer - invariant over the lifetime of the buffer
  * @flags:	mode flags for the file
  * @resv:	reservation-object, NULL to allocate default one
  * @priv:	Attach private data of allocator to this buffer
-- 
1.8.3.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
