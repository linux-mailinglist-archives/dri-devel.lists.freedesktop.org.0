Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B57943D09AD
	for <lists+dri-devel@lfdr.de>; Wed, 21 Jul 2021 09:28:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E6F3E6E86D;
	Wed, 21 Jul 2021 07:28:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 410518931D
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Jul 2021 08:22:43 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id c12so7020406wrt.3
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Jul 2021 01:22:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=cwLXwsKnUrpqnQYIFqbFNVHpQGEC45Q8o4J8HH042aw=;
 b=l0I+XOP0VM6+7Kx9JgnemqNvnwB89mLhGkwKQt/2Y3b7ObTtgBV0qjf2JLTU0QJYL2
 n9+lytPNnmeG+D/DLuFYDYck1VSqJOn2kO8TXn3UMBHHzxUj6rg+tjv8uJWhfZ0z/BqK
 yGySrOpM7WMFb/1ZuD3WioxHwCNk2Qx4KXwXxtwpWbxxGBg1+u0/NlINnN90k4GO+Ujz
 2d90fhlgDxKbswLTK7lQpMsBXkBDBO9Zg/nY7SYzhoUB86TMWBnMU/WqCDwS+LlmlDOz
 nt4Em5SsVPiuVYSHuMWoQGTg9ChA3MJgtL1M1Hr/S4k9tk5YMmea4f4eiNdIEGYFvAd+
 7uZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=cwLXwsKnUrpqnQYIFqbFNVHpQGEC45Q8o4J8HH042aw=;
 b=GDx4SgHbZ3znvDrrrgbFdV7tYrhc5RXzKtkTYHPQ7qff5T5zhvKk3v0FpdTLJn3MKH
 XYk73LjXgD0Smd1WfxZveRsoeeA7+3WxD0+mcWVKY4njuGkGP0zMkHikJU4v0QdBkdFE
 4bxgP10CnmVmf3xmLv69NLXrUHOQeh6/DfC7SmW1tH1Nen1It5zgMQxLko5CHjNsuwF9
 ScN3BO9twarG4f8VE+eiGm2bvy93pPW5iW92XfzvedHYqWqVdQq6JZb7PH08ZSczDu3j
 0GRLAruc5mHtdn3d7AqyoBBj/hG6dEtpztzDwgFobnxw0yFmUrJDWsvncjO2bNJxtvUq
 ppMw==
X-Gm-Message-State: AOAM533ebyAyJXzPwqa+X9Ot7X89wWXTsPp7JdraH79JCHiq9NZFq/tT
 D9H9jHAoyy3NqvywNfzgFEE1hw==
X-Google-Smtp-Source: ABdhPJzmZ9aZaTGn9l89FKUNl8itiC2WQBcQS69WxDYkpwYVq/M9DtC0sSxdGNFSBj5Pl9OM+HoPTg==
X-Received: by 2002:adf:ce10:: with SMTP id p16mr34571643wrn.205.1626769361871; 
 Tue, 20 Jul 2021 01:22:41 -0700 (PDT)
Received: from [10.1.4.104]
 (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id j3sm15533718wms.30.2021.07.20.01.22.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 20 Jul 2021 01:22:41 -0700 (PDT)
Subject: Re: [RFC PATCH 1/4] Add a RPMSG driver for the APU in the mt8183
To: Mathieu Poirier <mathieu.poirier@linaro.org>
References: <20200930115350.5272-1-abailon@baylibre.com>
 <20200930115350.5272-2-abailon@baylibre.com> <20201014225534.GA1416674@xps15>
 <20201015163303.GC1450102@xps15>
From: Alexandre Bailon <abailon@baylibre.com>
Message-ID: <18dc7298-3e48-2254-81df-492205124902@baylibre.com>
Date: Tue, 20 Jul 2021 10:24:09 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20201015163303.GC1450102@xps15>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Mailman-Approved-At: Wed, 21 Jul 2021 07:27:54 +0000
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
Cc: ohad@wizery.com, gpain@baylibre.com, stephane.leprovost@mediatek.com,
 jstephan@baylibre.com, linux-remoteproc@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, mturquette@baylibre.com,
 bjorn.andersson@linaro.org, christian.koenig@amd.com,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Mathieu,

> On Wed, Oct 14, 2020 at 04:55:34PM -0600, Mathieu Poirier wrote:
>> Hi Alexandre,
>>
>> On Wed, Sep 30, 2020 at 01:53:47PM +0200, Alexandre Bailon wrote:
>>> This adds a driver to communicate with the APU available
>>> in the mt8183. The driver is generic and could be used for other APU.
>>> It mostly provides a userspace interface to send messages and
>>> and share big buffers with the APU.
>>>
>>> Signed-off-by: Alexandre Bailon <abailon@baylibre.com>
>>> ---
>>>   drivers/rpmsg/Kconfig          |   9 +
>>>   drivers/rpmsg/Makefile         |   1 +
>>>   drivers/rpmsg/apu_rpmsg.c      | 606 +++++++++++++++++++++++++++++++++
>>>   drivers/rpmsg/apu_rpmsg.h      |  52 +++
>>>   include/uapi/linux/apu_rpmsg.h |  36 ++
>>>   5 files changed, 704 insertions(+)
>>>   create mode 100644 drivers/rpmsg/apu_rpmsg.c
>>>   create mode 100644 drivers/rpmsg/apu_rpmsg.h
>>>   create mode 100644 include/uapi/linux/apu_rpmsg.h
>>>
>>> diff --git a/drivers/rpmsg/Kconfig b/drivers/rpmsg/Kconfig
>>> index f96716893c2a..3437c6fc8647 100644
>>> --- a/drivers/rpmsg/Kconfig
>>> +++ b/drivers/rpmsg/Kconfig
>>> @@ -64,4 +64,13 @@ config RPMSG_VIRTIO
>>>   	select RPMSG
>>>   	select VIRTIO
>>>   
>>> +config RPMSG_APU
>>> +	tristate "APU RPMSG driver"
>>> +	help
>>> +	  This provides a RPMSG driver that provides some facilities to
>>> +	  communicate with an accelerated processing unit (APU).
>>> +	  This creates one or more char files that could be used by userspace
>>> +	  to send a message to an APU. In addition, this also take care of
>>> +	  sharing the memory buffer with the APU.
>>> +
>>>   endmenu
>>> diff --git a/drivers/rpmsg/Makefile b/drivers/rpmsg/Makefile
>>> index ffe932ef6050..93e0f3de99c9 100644
>>> --- a/drivers/rpmsg/Makefile
>>> +++ b/drivers/rpmsg/Makefile
>>> @@ -8,3 +8,4 @@ obj-$(CONFIG_RPMSG_QCOM_GLINK_RPM) += qcom_glink_rpm.o
>>>   obj-$(CONFIG_RPMSG_QCOM_GLINK_SMEM) += qcom_glink_smem.o
>>>   obj-$(CONFIG_RPMSG_QCOM_SMD)	+= qcom_smd.o
>>>   obj-$(CONFIG_RPMSG_VIRTIO)	+= virtio_rpmsg_bus.o
>>> +obj-$(CONFIG_RPMSG_APU)		+= apu_rpmsg.o
>>> diff --git a/drivers/rpmsg/apu_rpmsg.c b/drivers/rpmsg/apu_rpmsg.c
>>> new file mode 100644
>>> index 000000000000..5131b8b8e1f2
>>> --- /dev/null
>>> +++ b/drivers/rpmsg/apu_rpmsg.c
>>> @@ -0,0 +1,606 @@
>>> +// SPDX-License-Identifier: GPL-2.0
>>> +//
>>> +// Copyright 2020 BayLibre SAS
>>> +
>>> +#include <linux/cdev.h>
>>> +#include <linux/dma-buf.h>
>>> +#include <linux/iommu.h>
>>> +#include <linux/iova.h>
>>> +#include <linux/types.h>
>>> +#include <linux/module.h>
>>> +#include <linux/slab.h>
>>> +#include <linux/remoteproc.h>
>>> +#include <linux/rpmsg.h>
>>> +#include <linux/of.h>
>>> +#include <linux/platform_device.h>
>>> +#include "rpmsg_internal.h"
>>> +
>>> +#include <uapi/linux/apu_rpmsg.h>
>>> +
>>> +#include "apu_rpmsg.h"
>>> +
>>> +/* Maximum of APU devices supported */
>>> +#define APU_DEV_MAX 2
>>> +
>>> +#define dev_to_apu(dev) container_of(dev, struct rpmsg_apu, dev)
>>> +#define cdev_to_apu(i_cdev) container_of(i_cdev, struct rpmsg_apu, cdev)
>>> +
>>> +struct rpmsg_apu {
>>> +	struct rpmsg_device *rpdev;
>>> +	struct cdev cdev;
>>> +	struct device dev;
>>> +
>>> +	struct rproc *rproc;
>>> +	struct iommu_domain *domain;
>>> +	struct iova_domain *iovad;
>>> +	int iova_limit_pfn;
>>> +};
>>> +
>>> +struct rpmsg_request {
>>> +	struct completion completion;
>>> +	struct list_head node;
>>> +	void *req;
>>> +};
>>> +
>>> +struct apu_buffer {
>>> +	int fd;
>>> +	struct dma_buf *dma_buf;
>>> +	struct dma_buf_attachment *attachment;
>>> +	struct sg_table *sg_table;
>>> +	u32 iova;
>>> +};
>>> +
>>> +/*
>>> + * Shared IOVA domain.
>>> + * The MT8183 has two VP6 core but they are sharing the IOVA.
>>> + * They could be used alone, or together. In order to avoid conflict,
>>> + * create an IOVA domain that could be shared by those two core.
>>> + * @iovad: The IOVA domain to share between the APU cores
>>> + * @refcount: Allow to automatically release the IOVA domain once all the APU
>>> + *            cores has been stopped
>>> + */
>>> +struct apu_iova_domain {
>>> +	struct iova_domain iovad;
>>> +	struct kref refcount;
>>> +};
>>> +
>>> +static dev_t rpmsg_major;
>>> +static DEFINE_IDA(rpmsg_ctrl_ida);
>>> +static DEFINE_IDA(rpmsg_minor_ida);
>>> +static DEFINE_IDA(req_ida);
>>> +static LIST_HEAD(requests);
>>> +static struct apu_iova_domain *apu_iovad;
>>> +
>>> +static int apu_rpmsg_callback(struct rpmsg_device *dev, void *data, int count,
>>> +			      void *priv, u32 addr)
>>> +{
>>> +	struct rpmsg_request *rpmsg_req;
>>> +	struct apu_dev_request *hdr = data;
>>> +
>>> +	list_for_each_entry(rpmsg_req, &requests, node) {
>>> +		struct apu_dev_request *tmp_hdr = rpmsg_req->req;
>>> +
>>> +		if (hdr->id == tmp_hdr->id) {
>>> +			memcpy(rpmsg_req->req, data, count);
>>> +			complete(&rpmsg_req->completion);
>>> +
>>> +			return 0;
>>> +		}
>>> +	}
>>> +
>>> +	return 0;
>>> +}
>>> +
>>> +static int apu_device_memory_map(struct rpmsg_apu *apu,
>>> +				 struct apu_buffer *buffer)
>>> +{
>>> +	struct rpmsg_device *rpdev = apu->rpdev;
>>> +	phys_addr_t phys;
>>> +	int total_buf_space;
>>> +	int iova_pfn;
>>> +	int ret;
>>> +
>>> +	if (!buffer->fd)
>>> +		return 0;
>>> +
>>> +	buffer->dma_buf = dma_buf_get(buffer->fd);
>>> +	if (IS_ERR(buffer->dma_buf)) {
>>> +		dev_err(&rpdev->dev, "Failed to get dma_buf from fd: %ld\n",
>>> +			PTR_ERR(buffer->dma_buf));
>>> +		return PTR_ERR(buffer->dma_buf);
>>> +	}
>>> +
>>> +	buffer->attachment = dma_buf_attach(buffer->dma_buf, &rpdev->dev);
>>> +	if (IS_ERR(buffer->attachment)) {
>>> +		dev_err(&rpdev->dev, "Failed to attach dma_buf\n");
>>> +		ret = PTR_ERR(buffer->attachment);
>>> +		goto err_dma_buf_put;
>>> +	}
>>> +
>>> +	buffer->sg_table = dma_buf_map_attachment(buffer->attachment,
>>> +						   DMA_BIDIRECTIONAL);
>>> +	if (IS_ERR(buffer->sg_table)) {
>>> +		dev_err(&rpdev->dev, "Failed to map attachment\n");
>>> +		ret = PTR_ERR(buffer->sg_table);
>>> +		goto err_dma_buf_detach;
>>> +	}
>>> +	phys = page_to_phys(sg_page(buffer->sg_table->sgl));
>>> +	total_buf_space = sg_dma_len(buffer->sg_table->sgl);
>>> +
>>> +	iova_pfn = alloc_iova_fast(apu->iovad, total_buf_space >> PAGE_SHIFT,
>>> +				   apu->iova_limit_pfn, true);
>>> +	if (!iova_pfn) {
>>> +		dev_err(&rpdev->dev, "Failed to allocate iova address\n");
>>> +		ret = -ENOMEM;
>>> +		goto err_dma_unmap_attachment;
>>> +	}
>>> +
>>> +	buffer->iova = PFN_PHYS(iova_pfn);
>>> +	ret = iommu_map(apu->rproc->domain, buffer->iova, phys, total_buf_space,
>>> +			IOMMU_READ | IOMMU_WRITE | IOMMU_CACHE);
>>> +	if (ret) {
>>> +		dev_err(&rpdev->dev, "Failed to iommu map\n");
>>> +		goto err_free_iova;
>>> +	}
>>> +
>>> +	return 0;
>>> +
>>> +err_free_iova:
>>> +	free_iova(apu->iovad, iova_pfn);
>>> +err_dma_unmap_attachment:
>>> +	dma_buf_unmap_attachment(buffer->attachment,
>>> +				 buffer->sg_table,
>>> +				 DMA_BIDIRECTIONAL);
>>> +err_dma_buf_detach:
>>> +	dma_buf_detach(buffer->dma_buf, buffer->attachment);
>>> +err_dma_buf_put:
>>> +	dma_buf_put(buffer->dma_buf);
>>> +
>>> +	return ret;
>>> +}
>>> +
>>> +static void apu_device_memory_unmap(struct rpmsg_apu *apu,
>>> +				    struct apu_buffer *buffer)
>>> +{
>>> +	int total_buf_space;
>>> +
>>> +	if (!buffer->fd)
>>> +		return;
>>> +
>>> +	total_buf_space = sg_dma_len(buffer->sg_table->sgl);
>>> +	iommu_unmap(apu->rproc->domain, buffer->iova, total_buf_space);
>>> +	free_iova(apu->iovad, PHYS_PFN(buffer->iova));
>>> +	dma_buf_unmap_attachment(buffer->attachment,
>>> +				 buffer->sg_table,
>>> +				 DMA_BIDIRECTIONAL);
>>> +	dma_buf_detach(buffer->dma_buf, buffer->attachment);
>>> +	dma_buf_put(buffer->dma_buf);
>>> +}
>>> +
>>> +static int _apu_send_request(struct rpmsg_apu *apu,
>>> +			     struct rpmsg_device *rpdev,
>>> +			     struct apu_dev_request *req, int len)
>>> +{
>>> +
>>> +	struct rpmsg_request *rpmsg_req;
>>> +	int ret = 0;
>>> +
>>> +	req->id = ida_simple_get(&req_ida, 0, 0xffff, GFP_KERNEL);
>>> +	if (req->id < 0)
>>> +		return ret;
>>> +
>>> +	rpmsg_req = kzalloc(sizeof(*rpmsg_req), GFP_KERNEL);
>>> +	if (!rpmsg_req)
>>> +		return -ENOMEM;
>>> +
>>> +	rpmsg_req->req = req;
>>> +	init_completion(&rpmsg_req->completion);
>>> +	list_add(&rpmsg_req->node, &requests);
>>> +
>>> +	ret = rpmsg_send(rpdev->ept, req, len);
>>> +	if (ret)
>>> +		goto free_req;
>>> +
>>> +	/* be careful with race here between timeout and callback*/
>>> +	ret = wait_for_completion_timeout(&rpmsg_req->completion,
>>> +					  msecs_to_jiffies(1000));
>>> +	if (!ret)
>>> +		ret = -ETIMEDOUT;
>>> +	else
>>> +		ret = 0;
>>> +
>>> +	ida_simple_remove(&req_ida, req->id);
>>> +
>>> +free_req:
>>> +
>>> +	list_del(&rpmsg_req->node);
>>> +	kfree(rpmsg_req);
>>> +
>>> +	return ret;
>>> +}
>>> +
>>> +static int apu_send_request(struct rpmsg_apu *apu,
>>> +			    struct apu_request *req)
>>> +{
>>> +	int ret;
>>> +	struct rpmsg_device *rpdev = apu->rpdev;
>>> +	struct apu_dev_request *dev_req;
>>> +	struct apu_buffer *buffer;
>>> +
>>> +	int size = req->size_in + req->size_out +
>>> +		sizeof(u32) * req->count * 2 + sizeof(*dev_req);
>>> +	u32 *fd = (u32 *)(req->data + req->size_in + req->size_out);
>>> +	u32 *buffer_size = (u32 *)(fd + req->count);
>>> +	u32 *dev_req_da;
>>> +	u32 *dev_req_buffer_size;
>>> +	int i;
>>> +
>>> +	dev_req = kmalloc(size, GFP_KERNEL);
>>> +	if (!dev_req)
>>> +		return -ENOMEM;
>>> +
>>> +	dev_req->cmd = req->cmd;
>>> +	dev_req->size_in = req->size_in;
>>> +	dev_req->size_out = req->size_out;
>>> +	dev_req->count = req->count;
>>> +	dev_req_da = (u32 *)(dev_req->data + req->size_in + req->size_out);
>> I have started to review this set but it will take me more time to wrap my head
>> around what you are doing (the overall lack of comments in the code doesn't
>> help).
>>
>> In the mean time the "dev_req->data" above is very puzzling to me - did you mean
>> to write "req-data"?  Otherwise I don't know how this can work since
>> dev_req->data is not initalised after the kmalloc().
Data is declared as an array in struct apu_dev_request so we don't have 
to initialize its address.
This is working correctly but I think this would deserve much more 
documentation.
I will do it for the rewritten driver.
> I haven't received an answer to the above question nor any feedback from the
> comments I made on your previous set.  As such I will halt the revision of
> this set until I hear back from you.
My apologize, I have been focused on the driver rewriting, to use DRM 
framework instead of
managing the memory directly in the driver.

Thanks,
Alexandre

>
>> More comments will come tomorrow.
>>
>> Thanks,
>> Mathieu
>>
>>> +	dev_req_buffer_size = (u32 *)(dev_req_da + dev_req->count);
>>> +	memcpy(dev_req->data, req->data, req->size_in);
>>> +
>>> +	buffer = kmalloc_array(req->count, sizeof(*buffer), GFP_KERNEL);
>>> +	for (i = 0; i < req->count; i++) {
>>> +		buffer[i].fd = fd[i];
>>> +		ret = apu_device_memory_map(apu, &buffer[i]);
>>> +		if (ret)
>>> +			goto err_free_memory;
>>> +		dev_req_da[i] = buffer[i].iova;
>>> +		dev_req_buffer_size[i] = buffer_size[i];
>>> +	}
>>> +
>>> +	ret = _apu_send_request(apu, rpdev, dev_req, size);
>>> +
>>> +err_free_memory:
>>> +	for (i--; i >= 0; i--)
>>> +		apu_device_memory_unmap(apu, &buffer[i]);
>>> +
>>> +	req->result = dev_req->result;
>>> +	req->size_in = dev_req->size_in;
>>> +	req->size_out = dev_req->size_out;
>>> +	memcpy(req->data, dev_req->data, dev_req->size_in + dev_req->size_out +
>>> +	       sizeof(u32) * req->count);
>>> +
>>> +	kfree(buffer);
>>> +	kfree(dev_req);
>>> +
>>> +	return ret;
>>> +}
>>> +
>>> +
>>> +static long rpmsg_eptdev_ioctl(struct file *fp, unsigned int cmd,
>>> +			       unsigned long arg)
>>> +{
>>> +	struct rpmsg_apu *apu = fp->private_data;
>>> +	struct apu_request apu_req;
>>> +	struct apu_request *apu_req_full;
>>> +	void __user *argp = (void __user *)arg;
>>> +	int len;
>>> +	int ret;
>>> +
>>> +	switch (cmd) {
>>> +	case APU_SEND_REQ_IOCTL:
>>> +		/* Get the header */
>>> +		if (copy_from_user(&apu_req, argp,
>>> +				   sizeof(apu_req)))
>>> +			return -EFAULT;
>>> +
>>> +		len = sizeof(*apu_req_full) + apu_req.size_in +
>>> +			apu_req.size_out + apu_req.count * sizeof(u32) * 2;
>>> +		apu_req_full = kzalloc(len, GFP_KERNEL);
>>> +		if (!apu_req_full)
>>> +			return -ENOMEM;
>>> +
>>> +		/* Get the whole request */
>>> +		if (copy_from_user(apu_req_full, argp, len)) {
>>> +			kfree(apu_req_full);
>>> +			return -EFAULT;
>>> +		}
>>> +
>>> +		ret = apu_send_request(apu, apu_req_full);
>>> +		if (ret) {
>>> +			kfree(apu_req_full);
>>> +			return ret;
>>> +		}
>>> +
>>> +		if (copy_to_user(argp, apu_req_full, sizeof(apu_req) +
>>> +				 sizeof(u32) * apu_req_full->count +
>>> +				 apu_req_full->size_in + apu_req_full->size_out))
>>> +			ret = -EFAULT;
>>> +
>>> +		kfree(apu_req_full);
>>> +		return ret;
>>> +
>>> +	default:
>>> +		return -EINVAL;
>>> +	}
>>> +
>>> +	return 0;
>>> +}
>>> +
>>> +static int rpmsg_eptdev_open(struct inode *inode, struct file *filp)
>>> +{
>>> +	struct rpmsg_apu *apu = cdev_to_apu(inode->i_cdev);
>>> +
>>> +	get_device(&apu->dev);
>>> +	filp->private_data = apu;
>>> +
>>> +	return 0;
>>> +}
>>> +
>>> +static int rpmsg_eptdev_release(struct inode *inode, struct file *filp)
>>> +{
>>> +	struct rpmsg_apu *apu = cdev_to_apu(inode->i_cdev);
>>> +
>>> +	put_device(&apu->dev);
>>> +
>>> +	return 0;
>>> +}
>>> +
>>> +static const struct file_operations rpmsg_eptdev_fops = {
>>> +	.owner = THIS_MODULE,
>>> +	.open = rpmsg_eptdev_open,
>>> +	.release = rpmsg_eptdev_release,
>>> +	.unlocked_ioctl = rpmsg_eptdev_ioctl,
>>> +	.compat_ioctl = rpmsg_eptdev_ioctl,
>>> +};
>>> +
>>> +static void iova_domain_release(struct kref *ref)
>>> +{
>>> +	put_iova_domain(&apu_iovad->iovad);
>>> +	kfree(apu_iovad);
>>> +	apu_iovad = NULL;
>>> +}
>>> +
>>> +static struct fw_rsc_iova *apu_find_rcs_iova(struct rpmsg_apu *apu)
>>> +{
>>> +	struct rproc *rproc = apu->rproc;
>>> +	struct resource_table *table;
>>> +	struct fw_rsc_iova *rsc;
>>> +	int i;
>>> +
>>> +	table = rproc->table_ptr;
>>> +	for (i = 0; i < table->num; i++) {
>>> +		int offset = table->offset[i];
>>> +		struct fw_rsc_hdr *hdr = (void *)table + offset;
>>> +
>>> +		switch (hdr->type) {
>>> +		case RSC_VENDOR_IOVA:
>>> +			rsc = (void *)hdr + sizeof(*hdr);
>>> +				return rsc;
>>> +			break;
>>> +		default:
>>> +			continue;
>>> +		}
>>> +	}
>>> +
>>> +	return NULL;
>>> +}
>>> +
>>> +static int apu_reserve_iova(struct rpmsg_apu *apu, struct iova_domain *iovad)
>>> +{
>>> +	struct rproc *rproc = apu->rproc;
>>> +	struct resource_table *table;
>>> +	struct fw_rsc_carveout *rsc;
>>> +	int i;
>>> +
>>> +	table = rproc->table_ptr;
>>> +	for (i = 0; i < table->num; i++) {
>>> +		int offset = table->offset[i];
>>> +		struct fw_rsc_hdr *hdr = (void *)table + offset;
>>> +
>>> +		if (hdr->type == RSC_CARVEOUT) {
>>> +			struct iova *iova;
>>> +
>>> +			rsc = (void *)hdr + sizeof(*hdr);
>>> +			iova = reserve_iova(iovad, PHYS_PFN(rsc->da),
>>> +					    PHYS_PFN(rsc->da + rsc->len));
>>> +			if (!iova) {
>>> +				dev_err(&apu->dev, "failed to reserve iova\n");
>>> +				return -ENOMEM;
>>> +			}
>>> +			dev_dbg(&apu->dev, "Reserve: %x - %x\n",
>>> +				rsc->da, rsc->da + rsc->len);
>>> +		}
>>> +	}
>>> +
>>> +	return 0;
>>> +}
>>> +
>>> +static int apu_init_iovad(struct rpmsg_apu *apu)
>>> +{
>>> +	struct fw_rsc_iova *rsc;
>>> +
>>> +	if (!apu->rproc->table_ptr) {
>>> +		dev_err(&apu->dev,
>>> +			"No resource_table: has the firmware been loaded ?\n");
>>> +		return -ENODEV;
>>> +	}
>>> +
>>> +	rsc = apu_find_rcs_iova(apu);
>>> +	if (!rsc) {
>>> +		dev_err(&apu->dev, "No iova range defined in resource_table\n");
>>> +		return -ENOMEM;
>>> +	}
>>> +
>>> +	if (!apu_iovad) {
>>> +		apu_iovad = kzalloc(sizeof(*apu_iovad), GFP_KERNEL);
>>> +		if (!apu_iovad)
>>> +			return -ENOMEM;
>>> +
>>> +		init_iova_domain(&apu_iovad->iovad, PAGE_SIZE,
>>> +				 PHYS_PFN(rsc->da));
>>> +		apu_reserve_iova(apu, &apu_iovad->iovad);
>>> +		kref_init(&apu_iovad->refcount);
>>> +	} else
>>> +		kref_get(&apu_iovad->refcount);
>>> +
>>> +	apu->iovad = &apu_iovad->iovad;
>>> +	apu->iova_limit_pfn = PHYS_PFN(rsc->da + rsc->len) - 1;
>>> +
>>> +	return 0;
>>> +}
>>> +
>>> +static struct rproc *apu_get_rproc(struct rpmsg_device *rpdev)
>>> +{
>>> +	/*
>>> +	 * To work, the APU RPMsg driver need to get the rproc device.
>>> +	 * Currently, we only use virtio so we could use that to find the
>>> +	 * remoteproc parent.
>>> +	 */
>>> +	if (!rpdev->dev.parent && rpdev->dev.parent->bus) {
>>> +		dev_err(&rpdev->dev, "invalid rpmsg device\n");
>>> +		return ERR_PTR(-EINVAL);
>>> +	}
>>> +
>>> +	if (strcmp(rpdev->dev.parent->bus->name, "virtio")) {
>>> +		dev_err(&rpdev->dev, "unsupported bus\n");
>>> +		return ERR_PTR(-EINVAL);
>>> +	}
>>> +
>>> +	return vdev_to_rproc(dev_to_virtio(rpdev->dev.parent));
>>> +}
>>> +
>>> +static void rpmsg_apu_release_device(struct device *dev)
>>> +{
>>> +	struct rpmsg_apu *apu = dev_to_apu(dev);
>>> +
>>> +	ida_simple_remove(&rpmsg_ctrl_ida, dev->id);
>>> +	ida_simple_remove(&rpmsg_minor_ida, MINOR(dev->devt));
>>> +	cdev_del(&apu->cdev);
>>> +	kfree(apu);
>>> +}
>>> +
>>> +static int apu_rpmsg_probe(struct rpmsg_device *rpdev)
>>> +{
>>> +	struct rpmsg_apu *apu;
>>> +	struct device *dev;
>>> +	int ret;
>>> +
>>> +	apu = devm_kzalloc(&rpdev->dev, sizeof(*apu), GFP_KERNEL);
>>> +	if (!apu)
>>> +		return -ENOMEM;
>>> +	apu->rpdev = rpdev;
>>> +
>>> +	apu->rproc = apu_get_rproc(rpdev);
>>> +	if (IS_ERR_OR_NULL(apu->rproc))
>>> +		return PTR_ERR(apu->rproc);
>>> +
>>> +	dev = &apu->dev;
>>> +	device_initialize(dev);
>>> +	dev->parent = &rpdev->dev;
>>> +
>>> +	cdev_init(&apu->cdev, &rpmsg_eptdev_fops);
>>> +	apu->cdev.owner = THIS_MODULE;
>>> +
>>> +	ret = ida_simple_get(&rpmsg_minor_ida, 0, APU_DEV_MAX, GFP_KERNEL);
>>> +	if (ret < 0)
>>> +		goto free_apu;
>>> +	dev->devt = MKDEV(MAJOR(rpmsg_major), ret);
>>> +
>>> +	ret = ida_simple_get(&rpmsg_ctrl_ida, 0, 0, GFP_KERNEL);
>>> +	if (ret < 0)
>>> +		goto free_minor_ida;
>>> +	dev->id = ret;
>>> +	dev_set_name(&apu->dev, "apu%d", ret);
>>> +
>>> +	ret = cdev_add(&apu->cdev, dev->devt, 1);
>>> +	if (ret)
>>> +		goto free_ctrl_ida;
>>> +
>>> +	/* We can now rely on the release function for cleanup */
>>> +	dev->release = rpmsg_apu_release_device;
>>> +
>>> +	ret = device_add(dev);
>>> +	if (ret) {
>>> +		dev_err(&rpdev->dev, "device_add failed: %d\n", ret);
>>> +		put_device(dev);
>>> +	}
>>> +
>>> +	/* Make device dma capable by inheriting from parent's capabilities */
>>> +	set_dma_ops(&rpdev->dev, get_dma_ops(apu->rproc->dev.parent));
>>> +
>>> +	ret = dma_coerce_mask_and_coherent(&rpdev->dev,
>>> +					   dma_get_mask(apu->rproc->dev.parent));
>>> +	if (ret)
>>> +		goto err_put_device;
>>> +
>>> +	rpdev->dev.iommu_group = apu->rproc->dev.parent->iommu_group;
>>> +
>>> +	ret = apu_init_iovad(apu);
>>> +
>>> +	dev_set_drvdata(&rpdev->dev, apu);
>>> +
>>> +	return ret;
>>> +
>>> +err_put_device:
>>> +	put_device(dev);
>>> +free_ctrl_ida:
>>> +	ida_simple_remove(&rpmsg_ctrl_ida, dev->id);
>>> +free_minor_ida:
>>> +	ida_simple_remove(&rpmsg_minor_ida, MINOR(dev->devt));
>>> +free_apu:
>>> +	put_device(dev);
>>> +	kfree(apu);
>>> +
>>> +	return ret;
>>> +}
>>> +
>>> +static void apu_rpmsg_remove(struct rpmsg_device *rpdev)
>>> +{
>>> +	struct rpmsg_apu *apu = dev_get_drvdata(&rpdev->dev);
>>> +
>>> +	if (apu_iovad)
>>> +		kref_put(&apu_iovad->refcount, iova_domain_release);
>>> +
>>> +	device_del(&apu->dev);
>>> +	put_device(&apu->dev);
>>> +	kfree(apu);
>>> +}
>>> +
>>> +static const struct rpmsg_device_id apu_rpmsg_match[] = {
>>> +	{ APU_RPMSG_SERVICE_MT8183 },
>>> +	{}
>>> +};
>>> +
>>> +static struct rpmsg_driver apu_rpmsg_driver = {
>>> +	.probe = apu_rpmsg_probe,
>>> +	.remove = apu_rpmsg_remove,
>>> +	.callback = apu_rpmsg_callback,
>>> +	.id_table = apu_rpmsg_match,
>>> +	.drv  = {
>>> +		.name  = "apu_rpmsg",
>>> +	},
>>> +};
>>> +
>>> +static int __init apu_rpmsg_init(void)
>>> +{
>>> +	int ret;
>>> +
>>> +	ret = alloc_chrdev_region(&rpmsg_major, 0, APU_DEV_MAX, "apu");
>>> +	if (ret < 0) {
>>> +		pr_err("apu: failed to allocate char dev region\n");
>>> +		return ret;
>>> +	}
>>> +
>>> +	return register_rpmsg_driver(&apu_rpmsg_driver);
>>> +}
>>> +arch_initcall(apu_rpmsg_init);
>>> +
>>> +static void __exit apu_rpmsg_exit(void)
>>> +{
>>> +	unregister_rpmsg_driver(&apu_rpmsg_driver);
>>> +}
>>> +module_exit(apu_rpmsg_exit);
>>> +
>>> +
>>> +MODULE_LICENSE("GPL");
>>> +MODULE_DESCRIPTION("APU RPMSG driver");
>>> diff --git a/drivers/rpmsg/apu_rpmsg.h b/drivers/rpmsg/apu_rpmsg.h
>>> new file mode 100644
>>> index 000000000000..54b5b7880750
>>> --- /dev/null
>>> +++ b/drivers/rpmsg/apu_rpmsg.h
>>> @@ -0,0 +1,52 @@
>>> +/* SPDX-License-Identifier: GPL-2.0
>>> + *
>>> + * Copyright 2020 BayLibre SAS
>>> + */
>>> +
>>> +#ifndef __APU_RPMSG_H__
>>> +#define __APU_RPMSG_H__
>>> +
>>> +/*
>>> + * Firmware request, must be aligned with the one defined in firmware.
>>> + * @id: Request id, used in the case of reply, to find the pending request
>>> + * @cmd: The command id to execute in the firmware
>>> + * @result: The result of the command executed on the firmware
>>> + * @size: The size of the data available in this request
>>> + * @count: The number of shared buffer
>>> + * @data: Contains the data attached with the request if size is greater than
>>> + *        zero, and the addresses of shared buffers if count is greater than
>>> + *        zero. Both the data and the shared buffer could be read and write
>>> + *        by the APU.
>>> + */
>>> +struct  apu_dev_request {
>>> +	u16 id;
>>> +	u16 cmd;
>>> +	u16 result;
>>> +	u16 size_in;
>>> +	u16 size_out;
>>> +	u16 count;
>>> +	u8 data[0];
>>> +} __packed;
>>> +
>>> +#define APU_RPMSG_SERVICE_MT8183 "rpmsg-mt8183-apu0"
>>> +#define APU_CTRL_SRC 1
>>> +#define APU_CTRL_DST 1
>>> +
>>> +/* Vendor specific resource table entry */
>>> +#define RSC_VENDOR_IOVA 128
>>> +
>>> +/*
>>> + * Firmware IOVA resource table entry
>>> + * Define a range of virtual device address that could mapped using the IOMMU.
>>> + * @da: Start virtual device address
>>> + * @len: Length of the virtual device address
>>> + * @name: name of the resource
>>> + */
>>> +struct fw_rsc_iova {
>>> +	u32 da;
>>> +	u32 len;
>>> +	u32 reserved;
>>> +	u8 name[32];
>>> +} __packed;
>>> +
>>> +#endif /* __APU_RPMSG_H__ */
>>> diff --git a/include/uapi/linux/apu_rpmsg.h b/include/uapi/linux/apu_rpmsg.h
>>> new file mode 100644
>>> index 000000000000..81c9e4af9a94
>>> --- /dev/null
>>> +++ b/include/uapi/linux/apu_rpmsg.h
>>> @@ -0,0 +1,36 @@
>>> +/* SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note */
>>> +/*
>>> + * Copyright (c) 2020 BayLibre
>>> + */
>>> +
>>> +#ifndef _UAPI_RPMSG_APU_H_
>>> +#define _UAPI_RPMSG_APU_H_
>>> +
>>> +#include <linux/ioctl.h>
>>> +#include <linux/types.h>
>>> +
>>> +/*
>>> + * Structure containing the APU request from userspace application
>>> + * @cmd: The id of the command to execute on the APU
>>> + * @result: The result of the command executed on the APU
>>> + * @size: The size of the data available in this request
>>> + * @count: The number of shared buffer
>>> + * @data: Contains the data attached with the request if size is greater than
>>> + *        zero, and the files descriptors of shared buffers if count is greater
>>> + *        than zero. Both the data and the shared buffer could be read and write
>>> + *        by the APU.
>>> + */
>>> +struct apu_request {
>>> +	__u16 cmd;
>>> +	__u16 result;
>>> +	__u16 size_in;
>>> +	__u16 size_out;
>>> +	__u16 count;
>>> +	__u16 reserved;
>>> +	__u8 data[0];
>>> +};
>>> +
>>> +/* Send synchronous request to an APU */
>>> +#define APU_SEND_REQ_IOCTL	_IOWR(0xb7, 0x2, struct apu_request)
>>> +
>>> +#endif
>>> -- 
>>> 2.26.2
>>>
