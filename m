Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CBC3AFA03C
	for <lists+dri-devel@lfdr.de>; Sat,  5 Jul 2025 15:21:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0BE2C10E22D;
	Sat,  5 Jul 2025 13:21:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 68038 seconds by postgrey-1.36 at gabe;
 Sat, 05 Jul 2025 02:15:04 UTC
Received: from mxhk.zte.com.cn (mxhk.zte.com.cn [160.30.148.35])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1FF1710E146
 for <dri-devel@lists.freedesktop.org>; Sat,  5 Jul 2025 02:15:04 +0000 (UTC)
Received: from mxct.zte.com.cn (unknown [192.168.251.13])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mxhk.zte.com.cn (FangMail) with ESMTPS id 4bYvGX20lCz8R03y
 for <dri-devel@lists.freedesktop.org>; Sat,  5 Jul 2025 10:15:00 +0800 (CST)
Received: from mse-fl2.zte.com.cn (unknown [10.5.228.133])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mxct.zte.com.cn (FangMail) with ESMTPS id 4bYvGS6g6rz4x5ql;
 Sat,  5 Jul 2025 10:14:56 +0800 (CST)
Received: from xaxapp01.zte.com.cn ([10.88.99.176])
 by mse-fl2.zte.com.cn with SMTP id 5652Esw6038063;
 Sat, 5 Jul 2025 10:14:54 +0800 (+08)
 (envelope-from jiang.peng9@zte.com.cn)
Received: from mapi (xaxapp05[null]) by mapi (Zmail) with MAPI id mid31;
 Sat, 5 Jul 2025 10:14:55 +0800 (CST)
Date: Sat, 5 Jul 2025 10:14:55 +0800 (CST)
X-Zmail-TransId: 2afc68688a9f1d0-59690
X-Mailer: Zmail v1.0
Message-ID: <20250705101455762ft5u2uZEb7wz0TROzD52R@zte.com.cn>
In-Reply-To: <879d1fa7-04a5-403c-8d23-76631a67f560@kernel.org>
References: 20250704152047205U11FdEih1MxrmcmAz0Xpp@zte.com.cn,
 879d1fa7-04a5-403c-8d23-76631a67f560@kernel.org
Mime-Version: 1.0
From: <jiang.peng9@zte.com.cn>
To: <krzk@kernel.org>
Cc: <jasowang@redhat.com>, <xuanzhuo@linux.alibaba.com>, <mst@redhat.com>,
 <eperezma@redhat.com>, <sumit.semwal@linaro.org>,
 <christian.koenig@amd.com>, <virtualization@lists.linux.dev>,
 <linux-kernel@vger.kernel.org>, <linux-media@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <linaro-mm-sig@lists.linaro.org>,
 <xu.xin16@zte.com.cn>, <yang.yang29@zte.com.cn>
Subject: =?UTF-8?B?UmU6IFtQQVRDSF0gdmlydGlvOiBBZGQgbWlzc2luZyBrZXJuZWxkb2MgZm9yIHZpcnRpb19kbWFfYnVmX2F0dGFjaA==?=
Content-Type: text/plain;
	charset="UTF-8"
X-MAIL: mse-fl2.zte.com.cn 5652Esw6038063
X-Fangmail-Anti-Spam-Filtered: true
X-Fangmail-MID-QID: 68688AA4.000/4bYvGX20lCz8R03y
X-Mailman-Approved-At: Sat, 05 Jul 2025 13:21:33 +0000
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

> > diff --git a/drivers/virtio/virtio_dma_buf.c b/drivers/virtio/> virtio_dma_buf.c
> > index 3fe1d03b0645..18d261ba5197 100644
> > --- a/drivers/virtio/virtio_dma_buf.c
> > +++ b/drivers/virtio/virtio_dma_buf.c
> > @@ -35,7 +35,16 @@ struct dma_buf *virtio_dma_buf_export
> >  EXPORT_SYMBOL(virtio_dma_buf_export);
> >
> >  /**
> > - * virtio_dma_buf_attach - mandatory attach callback for virtio dma-bufs
> > + * virtio_dma_buf_attach - Mandatory attach callback for virtio dma-bufs
>
> Read kernel-doc.rst. Missing ()
>
> > + * @dma_buf: Pointer to the shared dma-buf structure
> > + * @attach: Pointer to the newly created attachment metadata
> > + *
> > + * Description: Implements the standard dma-buf attach operation for > virtio devices.
>
> That's not kerneldoc. Which part of kernel-doc document documents such
> syntax?

Thanks so much for your time and feedback! I’ve made two specific fixes based on your notes:  

Added () to the function name in the kerneldoc comment (e.g., virtio_dma_buf_attach() instead of virtio_dma_buf_attach).
Removed the redundant "Description:" label and simplified the explanation. 

Let me know if you need anything else in the meantime!  

Best regards,
Peng
