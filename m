Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 42F70310D8B
	for <lists+dri-devel@lfdr.de>; Fri,  5 Feb 2021 17:03:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 363E26F480;
	Fri,  5 Feb 2021 16:03:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B1B936F480
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Feb 2021 16:03:23 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id d16so8189658wro.11
 for <dri-devel@lists.freedesktop.org>; Fri, 05 Feb 2021 08:03:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=kQjmRCry687xJesE3htX7kfPImS2CrcXvvbgMFlka/M=;
 b=QIsh6RExDTBl+fSF+VjkNTdWY/E7wYpecdc9TiCol2cFMkVEml5iJ1+nNnbFaOZCpt
 i4LgKYMFxYPbF1endWloOvbPFKPxHC0zbdYl4A1rhUp81K/yBJsiJN2aUfdWEd8TN7eZ
 cdqOYN90+3Bxjda1lSjD9wjq9K/zCFaSh7xVA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=kQjmRCry687xJesE3htX7kfPImS2CrcXvvbgMFlka/M=;
 b=I/Vjl4I1gcASMveJEAR7pkIoyVLlAGYHTO+BnAvoG5/1Ms3J0PdQKtpg7ewdGczAGx
 18HJxGxlnSn5AHoCtOq0TOxDGPUNrhdhtlJmDc4GhTUgeZizb3sXarwdEkQL9GHGmtZL
 brjH+nEE2LWRvkacvz0Mpmmm4PwrrWkspYrzYiCkX2fnteuNdOQBcOyENjd7gWI1B3uY
 TnE7kaCQc1QGsvywEmfDMKvm4S4ITHf26vv8kQ/QvdRRzYrbENH2U1D5xyNbqzgC5eCu
 Vn++tOjWDjtCuMQM0usBIrapYa8GG9Z3Dy2WOyuOPq+eDDRgLdyRb3BcxUhHVXmIQGNm
 Yfog==
X-Gm-Message-State: AOAM530TrHIXI9r9cbs/L6lM20cblakBZgIsImanj6P/4jF+fOtKt5B3
 8TEdu+hD8/OKATBiQPSmdotGAw==
X-Google-Smtp-Source: ABdhPJyeeaeZuv+ahQJ9nesselCfSOvx6oXeiTrSzXXxRHOsddRhA+IXdxAItsmCOnViOqCZqM9FWA==
X-Received: by 2002:adf:f452:: with SMTP id f18mr5648414wrp.11.1612541002131; 
 Fri, 05 Feb 2021 08:03:22 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id z8sm12348056wrh.83.2021.02.05.08.03.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Feb 2021 08:03:21 -0800 (PST)
Date: Fri, 5 Feb 2021 17:03:19 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Vivek Kasireddy <vivek.kasireddy@intel.com>,
 Gerd Hoffmann <kraxel@redhat.com>
Subject: Re: [RFC v3 2/3] virtio: Introduce Vdmabuf driver
Message-ID: <YB1sRx1GrT8rATEg@phenom.ffwll.local>
References: <20210203073517.1908882-1-vivek.kasireddy@intel.com>
 <20210203073517.1908882-3-vivek.kasireddy@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210203073517.1908882-3-vivek.kasireddy@intel.com>
X-Operating-System: Linux phenom 5.7.0-1-amd64 
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
Cc: dongwon.kim@intel.com, christian.koenig@amd.com, daniel.vetter@ffwll.ch,
 dri-devel@lists.freedesktop.org, virtualization@lists.linux-foundation.org,
 kraxel@redhat.com, daniel.vetter@intel.com, linux-media@vger.kernel.org
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Feb 02, 2021 at 11:35:16PM -0800, Vivek Kasireddy wrote:
> This driver "transfers" a dmabuf created on the Guest to the Host.
> A common use-case for such a transfer includes sharing the scanout
> buffer created by a display server or a compositor running in the
> Guest with Qemu UI -- running on the Host.
> =

> The "transfer" is accomplished by sharing the PFNs of all the pages
> associated with the dmabuf and having a new dmabuf created on the
> Host that is backed up by the pages mapped from the Guest.
> =

> Signed-off-by: Dongwon Kim <dongwon.kim@intel.com>
> Signed-off-by: Vivek Kasireddy <vivek.kasireddy@intel.com>
> ---
>  drivers/virtio/Kconfig              |    8 +
>  drivers/virtio/Makefile             |    1 +
>  drivers/virtio/virtio_vdmabuf.c     | 1090 +++++++++++++++++++++++++++
>  include/linux/virtio_vdmabuf.h      |  271 +++++++
>  include/uapi/linux/virtio_ids.h     |    1 +
>  include/uapi/linux/virtio_vdmabuf.h |   99 +++
>  6 files changed, 1470 insertions(+)
>  create mode 100644 drivers/virtio/virtio_vdmabuf.c
>  create mode 100644 include/linux/virtio_vdmabuf.h
>  create mode 100644 include/uapi/linux/virtio_vdmabuf.h
> =

> diff --git a/drivers/virtio/Kconfig b/drivers/virtio/Kconfig
> index 7b41130d3f35..e563c12f711e 100644
> --- a/drivers/virtio/Kconfig
> +++ b/drivers/virtio/Kconfig
> @@ -139,4 +139,12 @@ config VIRTIO_DMA_SHARED_BUFFER
>  	 This option adds a flavor of dma buffers that are backed by
>  	 virtio resources.
>  =

> +config VIRTIO_VDMABUF
> +	bool "Enables Vdmabuf driver in guest os"
> +	default n
> +	depends on VIRTIO
> +	help
> +	 This driver provides a way to share the dmabufs created in
> +	 the Guest with the Host.
> +
>  endif # VIRTIO_MENU
> diff --git a/drivers/virtio/Makefile b/drivers/virtio/Makefile
> index 591e6f72aa54..b4bb0738009c 100644
> --- a/drivers/virtio/Makefile
> +++ b/drivers/virtio/Makefile
> @@ -9,3 +9,4 @@ obj-$(CONFIG_VIRTIO_INPUT) +=3D virtio_input.o
>  obj-$(CONFIG_VIRTIO_VDPA) +=3D virtio_vdpa.o
>  obj-$(CONFIG_VIRTIO_MEM) +=3D virtio_mem.o
>  obj-$(CONFIG_VIRTIO_DMA_SHARED_BUFFER) +=3D virtio_dma_buf.o
> +obj-$(CONFIG_VIRTIO_VDMABUF) +=3D virtio_vdmabuf.o
> diff --git a/drivers/virtio/virtio_vdmabuf.c b/drivers/virtio/virtio_vdma=
buf.c
> new file mode 100644
> index 000000000000..c28f144eb126
> --- /dev/null
> +++ b/drivers/virtio/virtio_vdmabuf.c
> @@ -0,0 +1,1090 @@
> +// SPDX-License-Identifier: (MIT OR GPL-2.0)
> +
> +/*
> + * Copyright =A9 2021 Intel Corporation
> + *
> + * Permission is hereby granted, free of charge, to any person obtaining=
 a
> + * copy of this software and associated documentation files (the "Softwa=
re"),
> + * to deal in the Software without restriction, including without limita=
tion
> + * the rights to use, copy, modify, merge, publish, distribute, sublicen=
se,
> + * and/or sell copies of the Software, and to permit persons to whom the
> + * Software is furnished to do so, subject to the following conditions:
> + *
> + * The above copyright notice and this permission notice (including the =
next
> + * paragraph) shall be included in all copies or substantial portions of=
 the
> + * Software.
> + *
> + * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRE=
SS OR
> + * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILI=
TY,
> + * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SH=
ALL
> + * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR =
OTHER
> + * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISI=
NG
> + * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER D=
EALINGS
> + * IN THE SOFTWARE.
> + *
> + * Authors:
> + *    Dongwon Kim <dongwon.kim@intel.com>
> + *    Mateusz Polrola <mateusz.polrola@gmail.com>
> + *    Vivek Kasireddy <vivek.kasireddy@intel.com>
> + */
> +
> +#include <linux/init.h>
> +#include <linux/kernel.h>
> +#include <linux/errno.h>
> +#include <linux/module.h>
> +#include <linux/device.h>
> +#include <linux/uaccess.h>
> +#include <linux/miscdevice.h>
> +#include <linux/delay.h>
> +#include <linux/random.h>
> +#include <linux/poll.h>
> +#include <linux/spinlock.h>
> +#include <linux/dma-buf.h>
> +#include <linux/virtio.h>
> +#include <linux/virtio_ids.h>
> +#include <linux/virtio_config.h>
> +#include <linux/virtio_vdmabuf.h>
> +
> +#define VIRTIO_VDMABUF_MAX_ID INT_MAX
> +#define REFS_PER_PAGE (PAGE_SIZE/sizeof(long))
> +#define NEW_BUF_ID_GEN(vmid, cnt) (((vmid & 0xFFFFFFFF) << 32) | \
> +				    ((cnt) & 0xFFFFFFFF))
> +
> +/* one global drv object */
> +static struct virtio_vdmabuf_info *drv_info;
> +
> +struct virtio_vdmabuf {
> +	/* virtio device structure */
> +	struct virtio_device *vdev;
> +
> +	/* virtual queue array */
> +	struct virtqueue *vqs[VDMABUF_VQ_MAX];
> +
> +	/* ID of guest OS */
> +	u64 vmid;
> +
> +	/* spin lock that needs to be acquired before accessing
> +	 * virtual queue
> +	 */
> +	spinlock_t vq_lock;
> +	struct mutex recv_lock;
> +	struct mutex send_lock;
> +
> +	struct list_head msg_list;
> +
> +	/* workqueue */
> +	struct workqueue_struct *wq;
> +	struct work_struct recv_work;
> +	struct work_struct send_work;
> +	struct work_struct send_msg_work;
> +
> +	struct virtio_vdmabuf_event_queue *evq;
> +};
> +
> +static virtio_vdmabuf_buf_id_t get_buf_id(struct virtio_vdmabuf *vdmabuf)
> +{
> +	virtio_vdmabuf_buf_id_t buf_id =3D {0, {0, 0} };
> +	static int count =3D 0;
> +
> +	count =3D count < VIRTIO_VDMABUF_MAX_ID ? count + 1 : 0;
> +	buf_id.id =3D NEW_BUF_ID_GEN(vdmabuf->vmid, count);
> +
> +	/* random data embedded in the id for security */
> +	get_random_bytes(&buf_id.rng_key[0], 8);
> +
> +	return buf_id;
> +}
> +
> +/* sharing pages for original DMABUF with Host */
> +static struct virtio_vdmabuf_shared_pages
> +*virtio_vdmabuf_share_buf(struct page **pages, int nents,
> +			  int first_ofst, int last_len)
> +{
> +	struct virtio_vdmabuf_shared_pages *pages_info;
> +	int i;
> +	int n_l2refs =3D nents/REFS_PER_PAGE +
> +		       ((nents % REFS_PER_PAGE) ? 1 : 0);
> +
> +	pages_info =3D kvcalloc(1, sizeof(*pages_info), GFP_KERNEL);
> +	if (!pages_info)
> +		return NULL;
> +
> +	pages_info->pages =3D pages;
> +	pages_info->nents =3D nents;
> +	pages_info->first_ofst =3D first_ofst;
> +	pages_info->last_len =3D last_len;
> +	pages_info->l3refs =3D (gpa_t *)__get_free_page(GFP_KERNEL);
> +
> +	if (!pages_info->l3refs) {
> +		kvfree(pages_info);
> +		return NULL;
> +	}
> +
> +	pages_info->l2refs =3D (gpa_t **)__get_free_pages(GFP_KERNEL,
> +					get_order(n_l2refs * PAGE_SIZE));
> +
> +	if (!pages_info->l2refs) {
> +		free_page((gpa_t)pages_info->l3refs);
> +		kvfree(pages_info);
> +		return NULL;
> +	}
> +
> +	/* Share physical address of pages */
> +	for (i =3D 0; i < nents; i++)
> +		pages_info->l2refs[i] =3D (gpa_t *)page_to_phys(pages[i]);
> +
> +	for (i =3D 0; i < n_l2refs; i++)
> +		pages_info->l3refs[i] =3D
> +			virt_to_phys((void *)pages_info->l2refs +
> +				     i * PAGE_SIZE);
> +
> +	pages_info->ref =3D (gpa_t)virt_to_phys(pages_info->l3refs);
> +
> +	return pages_info;
> +}
> +
> +/* stop sharing pages */
> +static void
> +virtio_vdmabuf_free_buf(struct virtio_vdmabuf_shared_pages *pages_info)
> +{
> +	int n_l2refs =3D (pages_info->nents/REFS_PER_PAGE +
> +		       ((pages_info->nents % REFS_PER_PAGE) ? 1 : 0));
> +
> +	free_pages((gpa_t)pages_info->l2refs, get_order(n_l2refs * PAGE_SIZE));
> +	free_page((gpa_t)pages_info->l3refs);
> +
> +	kvfree(pages_info);
> +}
> +
> +static int send_msg_to_host(enum virtio_vdmabuf_cmd cmd, int *op)
> +{
> +	struct virtio_vdmabuf *vdmabuf =3D drv_info->priv;
> +	struct virtio_vdmabuf_msg *msg;
> +	int i;
> +
> +	switch (cmd) {
> +	case VIRTIO_VDMABUF_CMD_NEED_VMID:
> +		msg =3D kvcalloc(1, sizeof(struct virtio_vdmabuf_msg),
> +			       GFP_KERNEL);
> +		if (!msg)
> +			return -ENOMEM;
> +
> +		if (op)
> +			for (i =3D 0; i < 4; i++)
> +				msg->op[i] =3D op[i];
> +		break;
> +
> +	case VIRTIO_VDMABUF_CMD_EXPORT:
> +		msg =3D kvcalloc(1, sizeof(struct virtio_vdmabuf_msg),
> +			       GFP_KERNEL);
> +		if (!msg)
> +			return -ENOMEM;
> +
> +		memcpy(&msg->op[0], &op[0], 9 * sizeof(int) + op[9]);
> +		break;
> +
> +	default:
> +		/* no command found */
> +		return -EINVAL;
> +	}
> +
> +	msg->cmd =3D cmd;
> +	list_add_tail(&msg->list, &vdmabuf->msg_list);
> +	queue_work(vdmabuf->wq, &vdmabuf->send_msg_work);
> +
> +	return 0;
> +}
> +
> +static int add_event_buf_rel(struct virtio_vdmabuf_buf *buf_info)
> +{
> +	struct virtio_vdmabuf *vdmabuf =3D drv_info->priv;
> +	struct virtio_vdmabuf_event *e_oldest, *e_new;
> +	struct virtio_vdmabuf_event_queue *eq =3D vdmabuf->evq;
> +	unsigned long irqflags;
> +
> +	e_new =3D kvzalloc(sizeof(*e_new), GFP_KERNEL);
> +	if (!e_new)
> +		return -ENOMEM;
> +
> +	e_new->e_data.hdr.buf_id =3D buf_info->buf_id;
> +	e_new->e_data.data =3D (void *)buf_info->priv;
> +	e_new->e_data.hdr.size =3D buf_info->sz_priv;
> +
> +	spin_lock_irqsave(&eq->e_lock, irqflags);
> +
> +	/* check current number of events and if it hits the max num (32)
> +	 * then remove the oldest event in the list
> +	 */
> +	if (eq->pending > 31) {
> +		e_oldest =3D list_first_entry(&eq->e_list,
> +					    struct virtio_vdmabuf_event, link);
> +		list_del(&e_oldest->link);
> +		eq->pending--;
> +		kvfree(e_oldest);
> +	}
> +
> +	list_add_tail(&e_new->link, &eq->e_list);
> +
> +	eq->pending++;
> +
> +	wake_up_interruptible(&eq->e_wait);
> +	spin_unlock_irqrestore(&eq->e_lock, irqflags);
> +
> +	return 0;
> +}
> +
> +static void virtio_vdmabuf_clear_buf(struct virtio_vdmabuf_buf *exp)
> +{
> +	/* Start cleanup of buffer in reverse order to exporting */
> +	virtio_vdmabuf_free_buf(exp->pages_info);
> +
> +	dma_buf_unmap_attachment(exp->attach, exp->sgt,
> +				 DMA_BIDIRECTIONAL);
> +
> +	if (exp->dma_buf) {
> +		dma_buf_detach(exp->dma_buf, exp->attach);
> +		/* close connection to dma-buf completely */
> +		dma_buf_put(exp->dma_buf);
> +		exp->dma_buf =3D NULL;
> +	}
> +}
> +
> +static int remove_buf(struct virtio_vdmabuf *vdmabuf,
> +		      struct virtio_vdmabuf_buf *exp)
> +{
> +	int ret;
> +
> +	ret =3D add_event_buf_rel(exp);
> +	if (ret)
> +		return ret;
> +
> +	virtio_vdmabuf_clear_buf(exp);
> +
> +	ret =3D virtio_vdmabuf_del_buf(drv_info, &exp->buf_id);
> +	if (ret)
> +		return ret;
> +
> +	if (exp->sz_priv > 0 && !exp->priv)
> +		kvfree(exp->priv);
> +
> +	kvfree(exp);
> +	return 0;
> +}
> +
> +static int parse_msg_from_host(struct virtio_vdmabuf *vdmabuf,
> +		     	       struct virtio_vdmabuf_msg *msg)
> +{
> +	struct virtio_vdmabuf_buf *exp;
> +	virtio_vdmabuf_buf_id_t buf_id;
> +	int ret;
> +
> +	switch (msg->cmd) {
> +	case VIRTIO_VDMABUF_CMD_NEED_VMID:
> +		vdmabuf->vmid =3D msg->op[0];
> +
> +		break;
> +	case VIRTIO_VDMABUF_CMD_DMABUF_REL:
> +		memcpy(&buf_id, msg->op, sizeof(buf_id));
> +
> +		exp =3D virtio_vdmabuf_find_buf(drv_info, &buf_id);
> +		if (!exp) {
> +			dev_err(drv_info->dev, "can't find buffer\n");
> +			return -EINVAL;
> +		}
> +
> +		ret =3D remove_buf(vdmabuf, exp);
> +		if (ret)
> +			return ret;
> +
> +		break;
> +	case VIRTIO_VDMABUF_CMD_EXPORT:
> +		break;
> +	default:
> +		dev_err(drv_info->dev, "empty cmd\n");
> +		return -EINVAL;
> +	}
> +
> +	return 0;
> +}
> +
> +static void virtio_vdmabuf_recv_work(struct work_struct *work)
> +{
> +	struct virtio_vdmabuf *vdmabuf =3D
> +		container_of(work, struct virtio_vdmabuf, recv_work);
> +	struct virtqueue *vq =3D vdmabuf->vqs[VDMABUF_VQ_RECV];
> +	struct virtio_vdmabuf_msg *msg;
> +	int sz;
> +
> +	mutex_lock(&vdmabuf->recv_lock);
> +
> +	do {
> +		virtqueue_disable_cb(vq);
> +		for (;;) {
> +			msg =3D virtqueue_get_buf(vq, &sz);
> +			if (!msg)
> +				break;
> +
> +			/* valid size */
> +			if (sz =3D=3D sizeof(struct virtio_vdmabuf_msg)) {
> +				if (parse_msg_from_host(vdmabuf, msg))
> +					dev_err(drv_info->dev,
> +						"msg parse error\n");
> +
> +				kvfree(msg);
> +			} else {
> +				dev_err(drv_info->dev,
> +					"received malformed message\n");
> +			}
> +		}
> +	} while (!virtqueue_enable_cb(vq));
> +
> +	mutex_unlock(&vdmabuf->recv_lock);
> +}
> +
> +static void virtio_vdmabuf_fill_recv_msg(struct virtio_vdmabuf *vdmabuf)
> +{
> +	struct virtqueue *vq =3D vdmabuf->vqs[VDMABUF_VQ_RECV];
> +	struct scatterlist sg;
> +	struct virtio_vdmabuf_msg *msg;
> +	int ret;
> +
> +	msg =3D kvzalloc(sizeof(*msg), GFP_KERNEL);
> +	if (!msg)
> +		return;
> +
> +	sg_init_one(&sg, msg, sizeof(struct virtio_vdmabuf_msg));
> +	ret =3D virtqueue_add_inbuf(vq, &sg, 1, msg, GFP_KERNEL);
> +	if (ret)
> +		return;
> +
> +	virtqueue_kick(vq);
> +}
> +
> +static void virtio_vdmabuf_send_msg_work(struct work_struct *work)
> +{
> +	struct virtio_vdmabuf *vdmabuf =3D
> +		container_of(work, struct virtio_vdmabuf, send_msg_work);
> +	struct virtqueue *vq =3D vdmabuf->vqs[VDMABUF_VQ_SEND];
> +	struct scatterlist sg;
> +	struct virtio_vdmabuf_msg *msg;
> +	bool added =3D false;
> +	int ret;
> +
> +	mutex_lock(&vdmabuf->send_lock);
> +
> +	for (;;) {
> +		if (list_empty(&vdmabuf->msg_list))
> +			break;
> +
> +		virtio_vdmabuf_fill_recv_msg(vdmabuf);
> +
> +		msg =3D list_first_entry(&vdmabuf->msg_list,
> +				       struct virtio_vdmabuf_msg, list);
> +		list_del_init(&msg->list);
> +
> +		sg_init_one(&sg, msg, sizeof(struct virtio_vdmabuf_msg));
> +		ret =3D virtqueue_add_outbuf(vq, &sg, 1, msg, GFP_KERNEL);
> +		if (ret < 0) {
> +			dev_err(drv_info->dev,
> +				"failed to add msg to vq\n");
> +			break;
> +		}
> +
> +		added =3D true;	=

> +	}
> +
> +	if (added)
> +		virtqueue_kick(vq);
> +
> +	mutex_unlock(&vdmabuf->send_lock);
> +}
> +
> +static void virtio_vdmabuf_send_work(struct work_struct *work)
> +{
> +	struct virtio_vdmabuf *vdmabuf =3D
> +		container_of(work, struct virtio_vdmabuf, send_work);
> +	struct virtqueue *vq =3D vdmabuf->vqs[VDMABUF_VQ_SEND];
> +	struct virtio_vdmabuf_msg *msg;
> +	unsigned int sz;
> +	bool added =3D false;
> +
> +	mutex_lock(&vdmabuf->send_lock);
> +
> +	do {
> +		virtqueue_disable_cb(vq);
> +
> +		for (;;) {
> +			msg =3D virtqueue_get_buf(vq, &sz);
> +			if (!msg)
> +				break;
> +
> +			if (parse_msg_from_host(vdmabuf, msg))
> +				dev_err(drv_info->dev,
> +					"msg parse error\n");
> +
> +			kvfree(msg);
> +			added =3D true;
> +		}
> +	} while (!virtqueue_enable_cb(vq));
> +
> +	mutex_unlock(&vdmabuf->send_lock);
> +
> +	if (added)
> +		queue_work(vdmabuf->wq, &vdmabuf->send_msg_work);
> +}
> +
> +static void virtio_vdmabuf_recv_cb(struct virtqueue *vq)
> +{
> +	struct virtio_vdmabuf *vdmabuf =3D vq->vdev->priv;
> +
> +	if (!vdmabuf)
> +		return;
> +
> +	queue_work(vdmabuf->wq, &vdmabuf->recv_work);
> +}
> +
> +static void virtio_vdmabuf_send_cb(struct virtqueue *vq)
> +{
> +	struct virtio_vdmabuf *vdmabuf =3D vq->vdev->priv;
> +
> +	if (!vdmabuf)
> +		return;
> +
> +	queue_work(vdmabuf->wq, &vdmabuf->send_work);
> +}
> +
> +static int remove_all_bufs(struct virtio_vdmabuf *vdmabuf)
> +{
> +	struct virtio_vdmabuf_buf *found;
> +	struct hlist_node *tmp;
> +	int bkt;
> +	int ret;
> +
> +	hash_for_each_safe(drv_info->buf_list, bkt, tmp, found, node) {
> +		ret =3D remove_buf(vdmabuf, found);
> +		if (ret)
> +			return ret;
> +	}
> +
> +	return 0;
> +}
> +
> +static int virtio_vdmabuf_open(struct inode *inode, struct file *filp)
> +{
> +	int ret;
> +
> +	if (!drv_info) {
> +		pr_err("virtio vdmabuf driver is not ready\n");
> +		return -EINVAL;
> +	}
> +
> +	ret =3D send_msg_to_host(VIRTIO_VDMABUF_CMD_NEED_VMID, 0);
> +	if (ret < 0)
> +		dev_err(drv_info->dev, "fail to receive vmid\n");
> +
> +	filp->private_data =3D drv_info->priv;
> +
> +	return 0;
> +}
> +
> +static int virtio_vdmabuf_release(struct inode *inode, struct file *filp)
> +{
> +	return 0;
> +}
> +
> +/* Notify Host about the new vdmabuf */
> +static int export_notify(struct virtio_vdmabuf_buf *exp, struct page **p=
ages)
> +{
> +	int *op;
> +	int ret;
> +
> +	op =3D kvcalloc(1, sizeof(int) * 65, GFP_KERNEL);
> +	if (!op)
> +		return -ENOMEM;
> +
> +	memcpy(op, &exp->buf_id, sizeof(exp->buf_id));
> +
> +	/* if new pages are to be shared */
> +	if (pages) {
> +		op[4] =3D exp->pages_info->nents;
> +		op[5] =3D exp->pages_info->first_ofst;
> +		op[6] =3D exp->pages_info->last_len;
> +
> +		memcpy(&op[7], &exp->pages_info->ref, sizeof(gpa_t));
> +	}
> +
> +	op[9] =3D exp->sz_priv;
> +
> +	/* driver/application specific private info */
> +	memcpy(&op[10], exp->priv, op[9]);
> +
> +	ret =3D send_msg_to_host(VIRTIO_VDMABUF_CMD_EXPORT, op);
> +
> +	kvfree(op);
> +	return ret;
> +}
> +
> +/* return total number of pages referenced by a sgt
> + * for pre-calculation of # of pages behind a given sgt
> + */
> +static int num_pgs(struct sg_table *sgt)
> +{
> +	struct scatterlist *sgl;
> +	int len, i;
> +	/* at least one page */
> +	int n_pgs =3D 1;
> +
> +	sgl =3D sgt->sgl;
> +
> +	len =3D sgl->length - PAGE_SIZE + sgl->offset;
> +
> +	/* round-up */
> +	n_pgs +=3D ((len + PAGE_SIZE - 1)/PAGE_SIZE);
> +
> +	for (i =3D 1; i < sgt->nents; i++) {
> +		sgl =3D sg_next(sgl);
> +
> +		/* round-up */
> +		n_pgs +=3D ((sgl->length + PAGE_SIZE - 1) /
> +			  PAGE_SIZE); /* round-up */
> +	}
> +
> +	return n_pgs;
> +}
> +
> +/* extract pages referenced by sgt */
> +static struct page **extr_pgs(struct sg_table *sgt, int *nents, int *las=
t_len)

Nack, this doesn't work on dma-buf. And it'll blow up at runtime when you
enable the very recently merged CONFIG_DMABUF_DEBUG (would be good to test
with that, just to make sure).

Aside from this, for virtio/kvm use-cases we've already merged the udmabuf
driver. Does this not work for your usecase?

Adding Gerd as the subject expert for this area.

Thanks, Daniel

> +{
> +	struct scatterlist *sgl;
> +	struct page **pages;
> +	struct page **temp_pgs;
> +	int i, j;
> +	int len;
> +
> +	*nents =3D num_pgs(sgt);
> +	pages =3D	kvmalloc_array(*nents, sizeof(struct page *), GFP_KERNEL);
> +	if (!pages)
> +		return NULL;
> +
> +	sgl =3D sgt->sgl;
> +
> +	temp_pgs =3D pages;
> +	*temp_pgs++ =3D sg_page(sgl);
> +	len =3D sgl->length - PAGE_SIZE + sgl->offset;
> +
> +	i =3D 1;
> +	while (len > 0) {
> +		*temp_pgs++ =3D nth_page(sg_page(sgl), i++);
> +		len -=3D PAGE_SIZE;
> +	}
> +
> +	for (i =3D 1; i < sgt->nents; i++) {
> +		sgl =3D sg_next(sgl);
> +		*temp_pgs++ =3D sg_page(sgl);
> +		len =3D sgl->length - PAGE_SIZE;
> +		j =3D 1;
> +
> +		while (len > 0) {
> +			*temp_pgs++ =3D nth_page(sg_page(sgl), j++);
> +			len -=3D PAGE_SIZE;
> +		}
> +	}
> +
> +	*last_len =3D len + PAGE_SIZE;
> +
> +	return pages;
> +}
> +
> +/* ioctl - exporting new vdmabuf
> + *
> + *	 int dmabuf_fd - File handle of original DMABUF
> + *	 virtio_vdmabuf_buf_id_t buf_id - returned vdmabuf ID
> + *	 int sz_priv - size of private data from userspace
> + *	 char *priv - buffer of user private data
> + *
> + */
> +static int export_ioctl(struct file *filp, void *data)
> +{
> +	struct virtio_vdmabuf *vdmabuf =3D drv_info->priv;
> +	struct virtio_vdmabuf_export *attr =3D data;
> +	struct dma_buf *dmabuf;
> +	struct dma_buf_attachment *attach;
> +	struct sg_table *sgt;
> +	struct virtio_vdmabuf_buf *exp;
> +	struct page **pages;
> +	int nents, last_len;
> +	virtio_vdmabuf_buf_id_t buf_id;
> +	int ret =3D 0;
> +
> +	if (vdmabuf->vmid <=3D 0)
> +		return -EINVAL;
> +
> +	dmabuf =3D dma_buf_get(attr->fd);
> +	if (IS_ERR(dmabuf))
> +		return PTR_ERR(dmabuf);
> +
> +	mutex_lock(&drv_info->g_mutex);
> +
> +	buf_id =3D get_buf_id(vdmabuf);
> +
> +	attach =3D dma_buf_attach(dmabuf, drv_info->dev);
> +	if (IS_ERR(attach)) {
> +		ret =3D PTR_ERR(attach);
> +		goto fail_attach;
> +	}
> +
> +	sgt =3D dma_buf_map_attachment(attach, DMA_BIDIRECTIONAL);
> +	if (IS_ERR(sgt)) {
> +		ret =3D PTR_ERR(sgt);
> +		goto fail_map_attachment;
> +	}
> +
> +	/* allocate a new exp */
> +	exp =3D kvcalloc(1, sizeof(*exp), GFP_KERNEL);
> +	if (!exp) {
> +		ret =3D -ENOMEM;
> +		goto fail_sgt_info_creation;
> +	}
> +
> +	/* possible truncation */
> +	if (attr->sz_priv > MAX_SIZE_PRIV_DATA)
> +		exp->sz_priv =3D MAX_SIZE_PRIV_DATA;
> +	else
> +		exp->sz_priv =3D attr->sz_priv;
> +
> +	/* creating buffer for private data */
> +	if (exp->sz_priv !=3D 0) {
> +		exp->priv =3D kvcalloc(1, exp->sz_priv, GFP_KERNEL);
> +		if (!exp->priv) {
> +			ret =3D -ENOMEM;
> +			goto fail_priv_creation;
> +		}
> +	}
> +
> +	exp->buf_id =3D buf_id;
> +	exp->attach =3D attach;
> +	exp->sgt =3D sgt;
> +	exp->dma_buf =3D dmabuf;
> +	exp->valid =3D 1;
> +
> +	if (exp->sz_priv) {
> +		/* copy private data to sgt_info */
> +		ret =3D copy_from_user(exp->priv, attr->priv, exp->sz_priv);
> +		if (ret) {
> +			ret =3D -EINVAL;
> +			goto fail_exp;
> +		}
> +	}
> +
> +	pages =3D extr_pgs(sgt, &nents, &last_len);
> +	if (pages =3D=3D NULL) {
> +		ret =3D -ENOMEM;
> +		goto fail_exp;
> +	}
> +
> +	exp->pages_info =3D virtio_vdmabuf_share_buf(pages, nents,
> +						   sgt->sgl->offset,
> +					 	   last_len);
> +	if (!exp->pages_info) {
> +		ret =3D -ENOMEM;
> +		goto fail_create_pages_info;
> +	}
> +
> +	attr->buf_id =3D exp->buf_id;
> +	ret =3D export_notify(exp, pages);
> +	if (ret < 0)
> +		goto fail_send_request;
> +
> +	/* now register it to the export list */
> +	virtio_vdmabuf_add_buf(drv_info, exp);
> +
> +	exp->filp =3D filp;
> +
> +	mutex_unlock(&drv_info->g_mutex);
> +
> +	return ret;
> +
> +/* Clean-up if error occurs */
> +fail_send_request:
> +	virtio_vdmabuf_free_buf(exp->pages_info);
> +
> +fail_create_pages_info:
> +	kvfree(pages);
> +
> +fail_exp:
> +	kvfree(exp->priv);
> +
> +fail_priv_creation:
> +	kvfree(exp);
> +
> +fail_sgt_info_creation:
> +	dma_buf_unmap_attachment(attach, sgt,
> +				 DMA_BIDIRECTIONAL);
> +
> +fail_map_attachment:
> +	dma_buf_detach(dmabuf, attach);
> +
> +fail_attach:
> +	dma_buf_put(dmabuf);
> +
> +	mutex_unlock(&drv_info->g_mutex);
> +
> +	return ret;
> +}
> +
> +static const struct virtio_vdmabuf_ioctl_desc virtio_vdmabuf_ioctls[] =
=3D {
> +	VIRTIO_VDMABUF_IOCTL_DEF(VIRTIO_VDMABUF_IOCTL_EXPORT, export_ioctl, 0),
> +};
> +
> +static long virtio_vdmabuf_ioctl(struct file *filp, unsigned int cmd,
> +		       		 unsigned long param)
> +{
> +	const struct virtio_vdmabuf_ioctl_desc *ioctl =3D NULL;
> +	unsigned int nr =3D _IOC_NR(cmd);
> +	int ret;
> +	virtio_vdmabuf_ioctl_t func;
> +	char *kdata;
> +
> +	if (nr >=3D ARRAY_SIZE(virtio_vdmabuf_ioctls)) {
> +		dev_err(drv_info->dev, "invalid ioctl\n");
> +		return -EINVAL;
> +	}
> +
> +	ioctl =3D &virtio_vdmabuf_ioctls[nr];
> +
> +	func =3D ioctl->func;
> +
> +	if (unlikely(!func)) {
> +		dev_err(drv_info->dev, "no function\n");
> +		return -EINVAL;
> +	}
> +
> +	kdata =3D kvmalloc(_IOC_SIZE(cmd), GFP_KERNEL);
> +	if (!kdata)
> +		return -ENOMEM;
> +
> +	if (copy_from_user(kdata, (void __user *)param,
> +			   _IOC_SIZE(cmd)) !=3D 0) {
> +		dev_err(drv_info->dev,
> +			"failed to copy from user arguments\n");
> +		ret =3D -EFAULT;
> +		goto ioctl_error;
> +	}
> +
> +	ret =3D func(filp, kdata);
> +
> +	if (copy_to_user((void __user *)param, kdata,
> +			 _IOC_SIZE(cmd)) !=3D 0) {
> +		dev_err(drv_info->dev,
> +			"failed to copy to user arguments\n");
> +		ret =3D -EFAULT;
> +		goto ioctl_error;
> +	}
> +
> +ioctl_error:
> +	kvfree(kdata);
> +	return ret;
> +}
> +
> +static unsigned int virtio_vdmabuf_event_poll(struct file *filp,
> +			    	    	      struct poll_table_struct *wait)
> +{
> +	struct virtio_vdmabuf *vdmabuf =3D filp->private_data;
> +
> +	poll_wait(filp, &vdmabuf->evq->e_wait, wait);
> +
> +	if (!list_empty(&vdmabuf->evq->e_list))
> +		return POLLIN | POLLRDNORM;
> +
> +	return 0;
> +}
> +
> +static ssize_t virtio_vdmabuf_event_read(struct file *filp, char __user =
*buf,
> +			       		 size_t cnt, loff_t *ofst)
> +{
> +	struct virtio_vdmabuf *vdmabuf =3D filp->private_data;
> +	int ret;
> +
> +	/* make sure user buffer can be written */
> +	if (!access_ok(buf, sizeof (*buf))) {
> +		dev_err(drv_info->dev, "user buffer can't be written.\n");
> +		return -EINVAL;
> +	}
> +
> +	ret =3D mutex_lock_interruptible(&vdmabuf->evq->e_readlock);
> +	if (ret)
> +		return ret;
> +
> +	for (;;) {
> +		struct virtio_vdmabuf_event *e =3D NULL;
> +
> +		spin_lock_irq(&vdmabuf->evq->e_lock);
> +		if (!list_empty(&vdmabuf->evq->e_list)) {
> +			e =3D list_first_entry(&vdmabuf->evq->e_list,
> +					     struct virtio_vdmabuf_event, link);
> +			list_del(&e->link);
> +		}
> +		spin_unlock_irq(&vdmabuf->evq->e_lock);
> +
> +		if (!e) {
> +			if (ret)
> +				break;
> +
> +			if (filp->f_flags & O_NONBLOCK) {
> +				ret =3D -EAGAIN;
> +				break;
> +			}
> +
> +			mutex_unlock(&vdmabuf->evq->e_readlock);
> +			ret =3D wait_event_interruptible(vdmabuf->evq->e_wait,
> +					!list_empty(&vdmabuf->evq->e_list));
> +
> +			if (ret =3D=3D 0)
> +				ret =3D mutex_lock_interruptible(
> +						&vdmabuf->evq->e_readlock);
> +
> +			if (ret)
> +				return ret;
> +		} else {
> +			unsigned int len =3D (sizeof(e->e_data.hdr) +
> +					    e->e_data.hdr.size);
> +
> +			if (len > cnt - ret) {
> +put_back_event:
> +				spin_lock_irq(&vdmabuf->evq->e_lock);
> +				list_add(&e->link, &vdmabuf->evq->e_list);
> +				spin_unlock_irq(&vdmabuf->evq->e_lock);
> +				break;
> +			}
> +
> +			if (copy_to_user(buf + ret, &e->e_data.hdr,
> +					 sizeof(e->e_data.hdr))) {
> +				if (ret =3D=3D 0)
> +					ret =3D -EFAULT;
> +
> +				goto put_back_event;
> +			}
> +
> +			ret +=3D sizeof(e->e_data.hdr);
> +
> +			if (copy_to_user(buf + ret, e->e_data.data,
> +					 e->e_data.hdr.size)) {
> +				/* error while copying void *data */
> +
> +				struct virtio_vdmabuf_e_hdr dummy_hdr =3D {0};
> +
> +				ret -=3D sizeof(e->e_data.hdr);
> +
> +				/* nullifying hdr of the event in user buffer */
> +				if (copy_to_user(buf + ret, &dummy_hdr,
> +						 sizeof(dummy_hdr)))
> +					dev_err(drv_info->dev,
> +					   "fail to nullify invalid hdr\n");
> +
> +				ret =3D -EFAULT;
> +
> +				goto put_back_event;
> +			}
> +
> +			ret +=3D e->e_data.hdr.size;
> +			vdmabuf->evq->pending--;
> +			kvfree(e);
> +		}
> +	}
> +
> +	mutex_unlock(&vdmabuf->evq->e_readlock);
> +
> +	return ret;
> +}
> +
> +static const struct file_operations virtio_vdmabuf_fops =3D {
> +	.owner =3D THIS_MODULE,
> +	.open =3D virtio_vdmabuf_open,
> +	.release =3D virtio_vdmabuf_release,
> +	.read =3D virtio_vdmabuf_event_read,
> +	.poll =3D virtio_vdmabuf_event_poll,
> +	.unlocked_ioctl =3D virtio_vdmabuf_ioctl,
> +};
> +
> +static struct miscdevice virtio_vdmabuf_miscdev =3D {
> +	.minor =3D MISC_DYNAMIC_MINOR,
> +	.name =3D "virtio-vdmabuf",
> +	.fops =3D &virtio_vdmabuf_fops,
> +};
> +
> +static int virtio_vdmabuf_probe(struct virtio_device *vdev)
> +{
> +	vq_callback_t *cbs[] =3D {
> +		virtio_vdmabuf_recv_cb,
> +		virtio_vdmabuf_send_cb,
> +	};
> +	static const char *const names[] =3D {
> +		"recv",
> +		"send",
> +	};
> +	struct virtio_vdmabuf *vdmabuf;
> +	int ret =3D 0;
> +
> +	if (!drv_info)
> +		return -EINVAL;
> +
> +	vdmabuf =3D drv_info->priv;
> +
> +	if (!vdmabuf)
> +		return -EINVAL;
> +
> +	vdmabuf->vdev =3D vdev;
> +	vdev->priv =3D vdmabuf;
> +
> +	/* initialize spinlock for synchronizing virtqueue accesses */
> +	spin_lock_init(&vdmabuf->vq_lock);
> +
> +	ret =3D virtio_find_vqs(vdmabuf->vdev, VDMABUF_VQ_MAX, vdmabuf->vqs,
> +			      cbs, names, NULL);
> +	if (ret) {
> +		dev_err(drv_info->dev, "Cannot find any vqs\n");
> +		return ret;
> +	}
> +
> +	INIT_LIST_HEAD(&vdmabuf->msg_list);
> +	INIT_WORK(&vdmabuf->recv_work, virtio_vdmabuf_recv_work);
> +	INIT_WORK(&vdmabuf->send_work, virtio_vdmabuf_send_work);
> +	INIT_WORK(&vdmabuf->send_msg_work, virtio_vdmabuf_send_msg_work);
> +
> +	return ret;
> +}
> +
> +static void virtio_vdmabuf_remove(struct virtio_device *vdev)
> +{
> +	struct virtio_vdmabuf *vdmabuf;
> +
> +	if (!drv_info)
> +		return;
> +
> +	vdmabuf =3D drv_info->priv;
> +	flush_work(&vdmabuf->recv_work);
> +	flush_work(&vdmabuf->send_work);
> +	flush_work(&vdmabuf->send_msg_work);
> +
> +	vdev->config->reset(vdev);
> +	vdev->config->del_vqs(vdev);
> +}
> +
> +static struct virtio_device_id id_table[] =3D {
> +	{ VIRTIO_ID_VDMABUF, VIRTIO_DEV_ANY_ID },
> +	{ 0 },
> +};
> +
> +static struct virtio_driver virtio_vdmabuf_vdev_drv =3D {
> +	.driver.name =3D  KBUILD_MODNAME,
> +	.driver.owner =3D THIS_MODULE,
> +	.id_table =3D     id_table,
> +	.probe =3D        virtio_vdmabuf_probe,
> +	.remove =3D       virtio_vdmabuf_remove,
> +};
> +
> +static int __init virtio_vdmabuf_init(void)
> +{
> +	struct virtio_vdmabuf *vdmabuf;
> +	int ret =3D 0;
> +
> +	drv_info =3D NULL;
> +
> +	ret =3D misc_register(&virtio_vdmabuf_miscdev);
> +	if (ret) {
> +		pr_err("virtio-vdmabuf misc driver can't be registered\n");
> +		return ret;
> +	}
> +
> +	ret =3D dma_set_mask_and_coherent(virtio_vdmabuf_miscdev.this_device,
> +					DMA_BIT_MASK(64));
> +	if (ret < 0) {
> +		misc_deregister(&virtio_vdmabuf_miscdev);
> +		return -EINVAL;
> +	}
> +
> +	drv_info =3D kvcalloc(1, sizeof(*drv_info), GFP_KERNEL);
> +	if (!drv_info) {
> +		misc_deregister(&virtio_vdmabuf_miscdev);
> +		return -ENOMEM;
> +	}
> +
> +	vdmabuf =3D kvcalloc(1, sizeof(*vdmabuf), GFP_KERNEL);
> +	if (!vdmabuf) {
> +		kvfree(drv_info);
> +		misc_deregister(&virtio_vdmabuf_miscdev);
> +		return -ENOMEM;
> +	}
> +
> +	vdmabuf->evq =3D kvcalloc(1, sizeof(*(vdmabuf->evq)), GFP_KERNEL);
> +	if (!vdmabuf->evq) {
> +		kvfree(drv_info);
> +		kvfree(vdmabuf);
> +		misc_deregister(&virtio_vdmabuf_miscdev);
> +		return -ENOMEM;
> +	}
> +
> +	drv_info->priv =3D (void *)vdmabuf;
> +	drv_info->dev =3D virtio_vdmabuf_miscdev.this_device;
> +
> +	mutex_init(&drv_info->g_mutex);
> +
> +	mutex_init(&vdmabuf->evq->e_readlock);
> +	spin_lock_init(&vdmabuf->evq->e_lock);
> +
> +	INIT_LIST_HEAD(&vdmabuf->evq->e_list);
> +	init_waitqueue_head(&vdmabuf->evq->e_wait);
> +	hash_init(drv_info->buf_list);
> +
> +	vdmabuf->evq->pending =3D 0;
> +	vdmabuf->wq =3D create_workqueue("virtio_vdmabuf_wq");
> +
> +	ret =3D register_virtio_driver(&virtio_vdmabuf_vdev_drv);
> +	if (ret) {
> +		dev_err(drv_info->dev, "vdmabuf driver can't be registered\n");
> +		misc_deregister(&virtio_vdmabuf_miscdev);
> +		kvfree(vdmabuf);
> +		kvfree(drv_info);
> +		return -EFAULT;
> +	}
> +
> +	return 0;
> +}
> +
> +static void __exit virtio_vdmabuf_deinit(void)
> +{
> +	struct virtio_vdmabuf *vdmabuf =3D drv_info->priv;
> +	struct virtio_vdmabuf_event *e, *et;
> +	unsigned long irqflags;
> +
> +	misc_deregister(&virtio_vdmabuf_miscdev);
> +	unregister_virtio_driver(&virtio_vdmabuf_vdev_drv);
> +
> +	if (vdmabuf->wq)
> +		destroy_workqueue(vdmabuf->wq);
> +
> +	spin_lock_irqsave(&vdmabuf->evq->e_lock, irqflags);
> +
> +	list_for_each_entry_safe(e, et, &vdmabuf->evq->e_list,
> +				 link) {
> +		list_del(&e->link);
> +		kvfree(e);
> +		vdmabuf->evq->pending--;
> +	}
> +
> +	spin_unlock_irqrestore(&vdmabuf->evq->e_lock, irqflags);
> +
> +	/* freeing all exported buffers */
> +	remove_all_bufs(vdmabuf);
> +
> +	kvfree(vdmabuf->evq);
> +	kvfree(vdmabuf);
> +	kvfree(drv_info);
> +}
> +
> +module_init(virtio_vdmabuf_init);
> +module_exit(virtio_vdmabuf_deinit);
> +
> +MODULE_DEVICE_TABLE(virtio, virtio_vdmabuf_id_table);
> +MODULE_DESCRIPTION("Virtio Vdmabuf frontend driver");
> +MODULE_LICENSE("GPL and additional rights");
> diff --git a/include/linux/virtio_vdmabuf.h b/include/linux/virtio_vdmabu=
f.h
> new file mode 100644
> index 000000000000..9500bf4a54ac
> --- /dev/null
> +++ b/include/linux/virtio_vdmabuf.h
> @@ -0,0 +1,271 @@
> +/* SPDX-License-Identifier: (MIT OR GPL-2.0) */
> +
> +/*
> + * Copyright =A9 2021 Intel Corporation
> + *
> + * Permission is hereby granted, free of charge, to any person obtaining=
 a
> + * copy of this software and associated documentation files (the "Softwa=
re"),
> + * to deal in the Software without restriction, including without limita=
tion
> + * the rights to use, copy, modify, merge, publish, distribute, sublicen=
se,
> + * and/or sell copies of the Software, and to permit persons to whom the
> + * Software is furnished to do so, subject to the following conditions:
> + *
> + * The above copyright notice and this permission notice (including the =
next
> + * paragraph) shall be included in all copies or substantial portions of=
 the
> + * Software.
> + *
> + * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRE=
SS OR
> + * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILI=
TY,
> + * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SH=
ALL
> + * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR =
OTHER
> + * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISI=
NG
> + * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER D=
EALINGS
> + * IN THE SOFTWARE.
> + *
> + */
> +
> +#ifndef _LINUX_VIRTIO_VDMABUF_H =

> +#define _LINUX_VIRTIO_VDMABUF_H =

> +
> +#include <uapi/linux/virtio_vdmabuf.h>
> +#include <linux/hashtable.h>
> +#include <linux/kvm_types.h>
> +
> +struct virtio_vdmabuf_shared_pages {
> +	/* cross-VM ref addr for the buffer */
> +	gpa_t ref;
> +
> +	/* page array */
> +	struct page **pages;
> +	gpa_t **l2refs;
> +	gpa_t *l3refs;
> +
> +	/* data offset in the first page
> +	 * and data length in the last page
> +	 */
> +	int first_ofst;
> +	int last_len;
> +
> +	/* number of shared pages */
> +	int nents;
> +};
> +
> +struct virtio_vdmabuf_buf {
> +	virtio_vdmabuf_buf_id_t buf_id;
> +
> +	struct dma_buf_attachment *attach;
> +	struct dma_buf *dma_buf;
> +	struct sg_table *sgt;
> +	struct virtio_vdmabuf_shared_pages *pages_info;
> +	int vmid;
> +
> +	/* validity of the buffer */
> +	bool valid;
> +
> +	/* set if the buffer is imported via import_ioctl */
> +	bool imported;
> +
> +	/* size of private */
> +	size_t sz_priv;
> +	/* private data associated with the exported buffer */
> +	void *priv;
> +
> +	struct file *filp;
> +	struct hlist_node node;
> +};
> +
> +struct virtio_vdmabuf_event {
> +	struct virtio_vdmabuf_e_data e_data;
> +	struct list_head link;
> +};
> +
> +struct virtio_vdmabuf_event_queue {
> +	wait_queue_head_t e_wait;
> +	struct list_head e_list;
> +
> +	spinlock_t e_lock;
> +	struct mutex e_readlock;
> +
> +	/* # of pending events */
> +	int pending;
> +};
> +
> +/* driver information */
> +struct virtio_vdmabuf_info {
> +	struct device *dev;
> +
> +	struct list_head head_vdmabuf_list;
> +	struct list_head kvm_instances;
> +
> +	DECLARE_HASHTABLE(buf_list, 7);
> +
> +	void *priv;
> +	struct mutex g_mutex;
> +	struct notifier_block kvm_notifier;
> +};
> +
> +/* IOCTL definitions
> + */
> +typedef int (*virtio_vdmabuf_ioctl_t)(struct file *filp, void *data);
> +
> +struct virtio_vdmabuf_ioctl_desc {
> +	unsigned int cmd;
> +	int flags;
> +	virtio_vdmabuf_ioctl_t func;
> +	const char *name;
> +};
> +
> +#define VIRTIO_VDMABUF_IOCTL_DEF(ioctl, _func, _flags)	\
> +	[_IOC_NR(ioctl)] =3D {			\
> +			.cmd =3D ioctl,		\
> +			.func =3D _func,		\
> +			.flags =3D _flags,	\
> +			.name =3D #ioctl		\
> +}
> +
> +#define VIRTIO_VDMABUF_VMID(buf_id) ((((buf_id).id) >> 32) & 0xFFFFFFFF)
> +
> +/* Messages between Host and Guest */
> +
> +/* List of commands from Guest to Host:
> + *
> + * ------------------------------------------------------------------
> + * A. NEED_VMID
> + *
> + *  guest asks the host to provide its vmid
> + *
> + * req:
> + *
> + * cmd: VIRTIO_VDMABUF_NEED_VMID
> + *
> + * ack:
> + *
> + * cmd: same as req
> + * op[0] : vmid of guest
> + *
> + * ------------------------------------------------------------------
> + * B. EXPORT
> + *
> + *  export dmabuf to host
> + *
> + * req:
> + *
> + * cmd: VIRTIO_VDMABUF_CMD_EXPORT
> + * op0~op3 : HDMABUF ID
> + * op4 : number of pages to be shared
> + * op5 : offset of data in the first page
> + * op6 : length of data in the last page
> + * op7 : upper 32 bit of top-level ref of shared buf
> + * op8 : lower 32 bit of top-level ref of shared buf
> + * op9 : size of private data
> + * op10 ~ op64: User private date associated with the buffer
> + *	        (e.g. graphic buffer's meta info)
> + *
> + * ------------------------------------------------------------------
> + *
> + * List of commands from Host to Guest
> + *
> + * ------------------------------------------------------------------
> + * A. RELEASE
> + *
> + *  notifying guest that the shared buffer is released by an importer
> + *
> + * req:
> + *
> + * cmd: VIRTIO_VDMABUF_CMD_DMABUF_REL
> + * op0~op3 : VDMABUF ID
> + *
> + * ------------------------------------------------------------------
> + */
> +
> +/* msg structures */
> +struct virtio_vdmabuf_msg {
> +	struct list_head list;
> +	unsigned int cmd;
> +	unsigned int op[64];
> +};
> +
> +enum {
> +	VDMABUF_VQ_RECV =3D 0,
> +	VDMABUF_VQ_SEND =3D 1,
> +	VDMABUF_VQ_MAX  =3D 2,
> +};
> +
> +enum virtio_vdmabuf_cmd {
> +	VIRTIO_VDMABUF_CMD_NEED_VMID,
> +	VIRTIO_VDMABUF_CMD_EXPORT =3D 0x10,
> +	VIRTIO_VDMABUF_CMD_DMABUF_REL
> +};
> +
> +enum virtio_vdmabuf_ops {
> +	VIRTIO_VDMABUF_HDMABUF_ID_ID =3D 0,
> +	VIRTIO_VDMABUF_HDMABUF_ID_RNG_KEY0,
> +	VIRTIO_VDMABUF_HDMABUF_ID_RNG_KEY1,
> +	VIRTIO_VDMABUF_NUM_PAGES_SHARED =3D 4,
> +	VIRTIO_VDMABUF_FIRST_PAGE_DATA_OFFSET,
> +	VIRTIO_VDMABUF_LAST_PAGE_DATA_LENGTH,
> +	VIRTIO_VDMABUF_REF_ADDR_UPPER_32BIT,
> +	VIRTIO_VDMABUF_REF_ADDR_LOWER_32BIT,
> +	VIRTIO_VDMABUF_PRIVATE_DATA_SIZE,
> +	VIRTIO_VDMABUF_PRIVATE_DATA_START
> +};
> +
> +/* adding exported/imported vdmabuf info to hash */
> +static inline int
> +virtio_vdmabuf_add_buf(struct virtio_vdmabuf_info *info,
> +                       struct virtio_vdmabuf_buf *new)
> +{
> +	hash_add(info->buf_list, &new->node, new->buf_id.id);
> +	return 0;
> +}
> +
> +/* comparing two vdmabuf IDs */
> +static inline bool
> +is_same_buf(virtio_vdmabuf_buf_id_t a,
> +            virtio_vdmabuf_buf_id_t b)
> +{
> +	int i;
> +
> +	if (a.id !=3D b.id)
> +		return 1;
> +
> +	/* compare keys */
> +	for (i =3D 0; i < 2; i++) {
> +		if (a.rng_key[i] !=3D b.rng_key[i])
> +			return false;
> +	}
> +
> +	return true;
> +}
> +
> +/* find buf for given vdmabuf ID */
> +static inline struct virtio_vdmabuf_buf
> +*virtio_vdmabuf_find_buf(struct virtio_vdmabuf_info *info,
> +			 virtio_vdmabuf_buf_id_t *buf_id)
> +{
> +	struct virtio_vdmabuf_buf *found;
> +
> +	hash_for_each_possible(info->buf_list, found, node, buf_id->id)
> +		if (is_same_buf(found->buf_id, *buf_id))
> +			return found;
> +
> +	return NULL;
> +}
> +
> +/* delete buf from hash */
> +static inline int
> +virtio_vdmabuf_del_buf(struct virtio_vdmabuf_info *info,
> +                       virtio_vdmabuf_buf_id_t *buf_id)
> +{
> +	struct virtio_vdmabuf_buf *found;
> +
> +	found =3D virtio_vdmabuf_find_buf(info, buf_id);
> +	if (!found)
> +		return -ENOENT;
> +
> +	hash_del(&found->node);
> +
> +	return 0;
> +}
> +
> +#endif
> diff --git a/include/uapi/linux/virtio_ids.h b/include/uapi/linux/virtio_=
ids.h
> index bc1c0621f5ed..39c94637ddee 100644
> --- a/include/uapi/linux/virtio_ids.h
> +++ b/include/uapi/linux/virtio_ids.h
> @@ -54,5 +54,6 @@
>  #define VIRTIO_ID_FS			26 /* virtio filesystem */
>  #define VIRTIO_ID_PMEM			27 /* virtio pmem */
>  #define VIRTIO_ID_MAC80211_HWSIM	29 /* virtio mac80211-hwsim */
> +#define VIRTIO_ID_VDMABUF          	40 /* virtio vdmabuf */
>  =

>  #endif /* _LINUX_VIRTIO_IDS_H */
> diff --git a/include/uapi/linux/virtio_vdmabuf.h b/include/uapi/linux/vir=
tio_vdmabuf.h
> new file mode 100644
> index 000000000000..7bddaa04ddd6
> --- /dev/null
> +++ b/include/uapi/linux/virtio_vdmabuf.h
> @@ -0,0 +1,99 @@
> +// SPDX-License-Identifier: (MIT OR GPL-2.0)
> +
> +/*
> + * Copyright =A9 2021 Intel Corporation
> + *
> + * Permission is hereby granted, free of charge, to any person obtaining=
 a
> + * copy of this software and associated documentation files (the "Softwa=
re"),
> + * to deal in the Software without restriction, including without limita=
tion
> + * the rights to use, copy, modify, merge, publish, distribute, sublicen=
se,
> + * and/or sell copies of the Software, and to permit persons to whom the
> + * Software is furnished to do so, subject to the following conditions:
> + *
> + * The above copyright notice and this permission notice (including the =
next
> + * paragraph) shall be included in all copies or substantial portions of=
 the
> + * Software.
> + *
> + * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRE=
SS OR
> + * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILI=
TY,
> + * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SH=
ALL
> + * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR =
OTHER
> + * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISI=
NG
> + * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER D=
EALINGS
> + * IN THE SOFTWARE.
> + *
> + */
> +
> +#ifndef _UAPI_LINUX_VIRTIO_VDMABUF_H
> +#define _UAPI_LINUX_VIRTIO_VDMABUF_H
> +
> +#define MAX_SIZE_PRIV_DATA 192
> +
> +typedef struct {
> +	__u64 id;
> +	/* 8B long Random number */
> +	int rng_key[2];
> +} virtio_vdmabuf_buf_id_t;
> +
> +struct virtio_vdmabuf_e_hdr {
> +	/* buf_id of new buf */
> +	virtio_vdmabuf_buf_id_t buf_id;
> +	/* size of private data */
> +	int size;
> +};
> +
> +struct virtio_vdmabuf_e_data {
> +	struct virtio_vdmabuf_e_hdr hdr;
> +	/* ptr to private data */
> +	void __user *data;
> +};
> +
> +#define VIRTIO_VDMABUF_IOCTL_IMPORT \
> +_IOC(_IOC_NONE, 'G', 2, sizeof(struct virtio_vdmabuf_import))
> +#define VIRTIO_VDMABUF_IOCTL_RELEASE \
> +_IOC(_IOC_NONE, 'G', 3, sizeof(struct virtio_vdmabuf_import))
> +struct virtio_vdmabuf_import {
> +	/* IN parameters */
> +	/* ahdb buf id to be imported */
> +	virtio_vdmabuf_buf_id_t buf_id;
> +	/* flags */
> +	int flags;
> +	/* OUT parameters */
> +	/* exported dma buf fd */
> +	int fd;
> +};
> +
> +#define VIRTIO_VDMABUF_IOCTL_EXPORT \
> +_IOC(_IOC_NONE, 'G', 4, sizeof(struct virtio_vdmabuf_export))
> +struct virtio_vdmabuf_export {
> +	/* IN parameters */
> +	/* DMA buf fd to be exported */
> +	int fd;
> +	/* exported dma buf id */
> +	virtio_vdmabuf_buf_id_t buf_id;
> +	int sz_priv;
> +	char *priv;
> +};
> +
> +#define VIRTIO_VDMABUF_IOCTL_QUERY \
> +_IOC(_IOC_NONE, 'G', 5, sizeof(struct virtio_vdmabuf_query))
> +struct virtio_vdmabuf_query {
> +	/* in parameters */
> +	/* id of buf to be queried */
> +	virtio_vdmabuf_buf_id_t buf_id;
> +	/* item to be queried */
> +	int item;
> +	/* OUT parameters */
> +	/* Value of queried item */
> +	unsigned long info;
> +};
> +
> +/* DMABUF query */
> +enum virtio_vdmabuf_query_cmd {
> +	VIRTIO_VDMABUF_QUERY_SIZE =3D 0x10,
> +	VIRTIO_VDMABUF_QUERY_BUSY,
> +	VIRTIO_VDMABUF_QUERY_PRIV_INFO_SIZE,
> +	VIRTIO_VDMABUF_QUERY_PRIV_INFO,
> +};
> +
> +#endif
> -- =

> 2.26.2
> =


-- =

Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
