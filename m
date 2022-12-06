Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D17F644AFD
	for <lists+dri-devel@lfdr.de>; Tue,  6 Dec 2022 19:17:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A65AC10E33B;
	Tue,  6 Dec 2022 18:17:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [IPv6:2a00:1450:4864:20::532])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 097B710E33B
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Dec 2022 18:17:22 +0000 (UTC)
Received: by mail-ed1-x532.google.com with SMTP id d20so21538161edn.0
 for <dri-devel@lists.freedesktop.org>; Tue, 06 Dec 2022 10:17:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=7vtB1k1E12/Qe5MgbChmK5o0Viuvz+G0q4nlKw8ldAc=;
 b=JOt5sl3NlVw3zEko+QR9FYDFsdGhhR1+AZLE+M13jISuMq9oNkTnkFgXbzOhovPuJK
 JB2JL0L4OMhuLiEgHNnBHjBzy7vQO3Ba4/P7VqZAH1fD5srTl0ou+CbeAr8atTfEC9+Q
 h/Lv//kEh3iC7qmqQ3sEVqDApiBCh/pwWW3MsYeXMbnVYtz4qeXJR5mO+3znLhN7OWqN
 BJd3Al3jRq9kgvoFSZU0gDMZBvqAWOn8+ZeUx1xL4CJC4muM/yBjruLF5t7If7d4VraT
 hpeJtdxkdjdJLxvLaHPWTSoCRYbI5J0KIWW6AS8iRtTa0tMB3CmsqFmT+XKCWR02kTtd
 7UXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=7vtB1k1E12/Qe5MgbChmK5o0Viuvz+G0q4nlKw8ldAc=;
 b=zECfIQ5jhznXHNFFXnjMfPBijqTXCSSNCjC+2VjwdDYjI/8vWMljfLotKsguEmt4Wn
 Xs6zZINLJZb8XhmhyYk2pKcDXjbZWDz4J3V95B8ZBnroCegySBgAnUovjyqk+x1PbRbm
 U+/drrhpS1DqxcJI9yTTGxszgET/6Vg/dczRbMfJsZbX2BwNEQjAXR9olcYm8DqQqQKU
 SumfD+qfsZiBQkK8KHwFEJx7VLyQ7syTYL5tack7vlxAh0Wx9Xto3XG6FCOQXNrYPq+d
 3p0DeZNEZEZQtZcUrTx+IRudE5jvW32roX7s2HgAvAAR5JXw/JF3KVyDl8qVvY+1FHeo
 x/WA==
X-Gm-Message-State: ANoB5pkH7S5sXf+NAHeldk5D5RG7SEe9GH/ftgx22nAy8VT+4o1H3wnf
 dAgpjDPBs62tuvWgeDHxW5o=
X-Google-Smtp-Source: AA0mqf6RdIuR2ZSd6whmHf4DjhAn+d+r9tStiV/oTM2gTheg5zX+OFsnkNnLTSKy3DC6aQW+P01BuQ==
X-Received: by 2002:a05:6402:5299:b0:461:7291:79c1 with SMTP id
 en25-20020a056402529900b00461729179c1mr70361891edb.68.1670350640573; 
 Tue, 06 Dec 2022 10:17:20 -0800 (PST)
Received: from ?IPV6:2a02:908:1256:79a0:f31f:ea10:880e:c031?
 ([2a02:908:1256:79a0:f31f:ea10:880e:c031])
 by smtp.gmail.com with ESMTPSA id
 cn14-20020a0564020cae00b00458b41d9460sm1238631edb.92.2022.12.06.10.17.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 06 Dec 2022 10:17:20 -0800 (PST)
Message-ID: <8c3960e5-ef35-1029-1b37-1029d2b71cc3@gmail.com>
Date: Tue, 6 Dec 2022 19:17:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH] dma-buf: fix dma_buf_export init order
Content-Language: en-US
To: "Ruhl, Michael J" <michael.j.ruhl@intel.com>,
 "quic_charante@quicinc.com" <quic_charante@quicinc.com>,
 "cuigaosheng1@huawei.com" <cuigaosheng1@huawei.com>,
 "tjmercier@google.com" <tjmercier@google.com>,
 "sumit.semwal@linaro.org" <sumit.semwal@linaro.org>
References: <20221206151207.8801-1-christian.koenig@amd.com>
 <DM5PR11MB1324F5F49A28EFDA67B1C258C11B9@DM5PR11MB1324.namprd11.prod.outlook.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
In-Reply-To: <DM5PR11MB1324F5F49A28EFDA67B1C258C11B9@DM5PR11MB1324.namprd11.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Cc: "linaro-mm-sig@lists.linaro.org" <linaro-mm-sig@lists.linaro.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 06.12.22 um 17:20 schrieb Ruhl, Michael J:
>> -----Original Message-----
>> From: dri-devel <dri-devel-bounces@lists.freedesktop.org> On Behalf Of
>> Christian König
>> Sent: Tuesday, December 6, 2022 10:12 AM
>> To: quic_charante@quicinc.com; cuigaosheng1@huawei.com;
>> tjmercier@google.com; sumit.semwal@linaro.org
>> Cc: linaro-mm-sig@lists.linaro.org; dri-devel@lists.freedesktop.org; linux-
>> media@vger.kernel.org
>> Subject: [PATCH] dma-buf: fix dma_buf_export init order
>>
>> The init order and resulting error handling in dma_buf_export
>> was pretty messy.
>>
>> Subordinate objects like the file and the sysfs kernel objects
>> were initializing and wiring itself up with the object in the
>> wrong order resulting not only in complicating and partially
>> incorrect error handling, but also in publishing only halve
>> initialized DMA-buf objects.
>>
>> Clean this up thoughtfully by allocating the file independent
>> of the DMA-buf object. Then allocate and initialize the DMA-buf
>> object itself, before publishing it through sysfs. If everything
>> works as expected the file is then connected with the DMA-buf
>> object and publish it through debugfs.
>>
>> Also adds the missing dma_resv_fini() into the error handling.
>>
>> Signed-off-by: Christian König <christian.koenig@amd.com>
>> ---
>> drivers/dma-buf/dma-buf-sysfs-stats.c |  7 +--
>> drivers/dma-buf/dma-buf-sysfs-stats.h |  4 +-
>> drivers/dma-buf/dma-buf.c             | 65 +++++++++++++--------------
>> 3 files changed, 34 insertions(+), 42 deletions(-)
>>
>> diff --git a/drivers/dma-buf/dma-buf-sysfs-stats.c b/drivers/dma-buf/dma-
>> buf-sysfs-stats.c
>> index 2bba0babcb62..4b680e10c15a 100644
>> --- a/drivers/dma-buf/dma-buf-sysfs-stats.c
>> +++ b/drivers/dma-buf/dma-buf-sysfs-stats.c
>> @@ -168,14 +168,11 @@ void dma_buf_uninit_sysfs_statistics(void)
>> 	kset_unregister(dma_buf_stats_kset);
>> }
>>
>> -int dma_buf_stats_setup(struct dma_buf *dmabuf)
>> +int dma_buf_stats_setup(struct dma_buf *dmabuf, struct file *file)
>> {
>> 	struct dma_buf_sysfs_entry *sysfs_entry;
>> 	int ret;
>>
>> -	if (!dmabuf || !dmabuf->file)
>> -		return -EINVAL;
>> -
>> 	if (!dmabuf->exp_name) {
>> 		pr_err("exporter name must not be empty if stats
>> needed\n");
>> 		return -EINVAL;
>> @@ -192,7 +189,7 @@ int dma_buf_stats_setup(struct dma_buf *dmabuf)
>>
>> 	/* create the directory for buffer stats */
>> 	ret = kobject_init_and_add(&sysfs_entry->kobj, &dma_buf_ktype,
>> NULL,
>> -				   "%lu", file_inode(dmabuf->file)->i_ino);
>> +				   "%lu", file_inode(file)->i_ino);
>> 	if (ret)
>> 		goto err_sysfs_dmabuf;
>>
>> diff --git a/drivers/dma-buf/dma-buf-sysfs-stats.h b/drivers/dma-buf/dma-
>> buf-sysfs-stats.h
>> index a49c6e2650cc..7a8a995b75ba 100644
>> --- a/drivers/dma-buf/dma-buf-sysfs-stats.h
>> +++ b/drivers/dma-buf/dma-buf-sysfs-stats.h
>> @@ -13,7 +13,7 @@
>> int dma_buf_init_sysfs_statistics(void);
>> void dma_buf_uninit_sysfs_statistics(void);
>>
>> -int dma_buf_stats_setup(struct dma_buf *dmabuf);
>> +int dma_buf_stats_setup(struct dma_buf *dmabuf, struct file *file);
>>
>> void dma_buf_stats_teardown(struct dma_buf *dmabuf);
>> #else
>> @@ -25,7 +25,7 @@ static inline int dma_buf_init_sysfs_statistics(void)
>>
>> static inline void dma_buf_uninit_sysfs_statistics(void) {}
>>
>> -static inline int dma_buf_stats_setup(struct dma_buf *dmabuf)
>> +static inline int dma_buf_stats_setup(struct dma_buf *dmabuf, struct file
>> *file)
>> {
>> 	return 0;
>> }
>> diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
>> index e6f36c014c4c..ea08049b70ae 100644
>> --- a/drivers/dma-buf/dma-buf.c
>> +++ b/drivers/dma-buf/dma-buf.c
>> @@ -614,19 +614,11 @@ struct dma_buf *dma_buf_export(const struct
>> dma_buf_export_info *exp_info)
>> 	size_t alloc_size = sizeof(struct dma_buf);
>> 	int ret;
>>
>> -	if (!exp_info->resv)
>> -		alloc_size += sizeof(struct dma_resv);
>> -	else
>> -		/* prevent &dma_buf[1] == dma_buf->resv */
>> -		alloc_size += 1;
>> -
>> -	if (WARN_ON(!exp_info->priv
>> -			  || !exp_info->ops
>> -			  || !exp_info->ops->map_dma_buf
>> -			  || !exp_info->ops->unmap_dma_buf
>> -			  || !exp_info->ops->release)) {
>> +	if (WARN_ON(!exp_info->priv || !exp_info->ops
>> +		    || !exp_info->ops->map_dma_buf
>> +		    || !exp_info->ops->unmap_dma_buf
>> +		    || !exp_info->ops->release))
>> 		return ERR_PTR(-EINVAL);
>> -	}
>>
>> 	if (WARN_ON(exp_info->ops->cache_sgt_mapping &&
>> 		    (exp_info->ops->pin || exp_info->ops->unpin)))
>> @@ -638,10 +630,21 @@ struct dma_buf *dma_buf_export(const struct
>> dma_buf_export_info *exp_info)
>> 	if (!try_module_get(exp_info->owner))
>> 		return ERR_PTR(-ENOENT);
>>
>> +	file = dma_buf_getfile(exp_info->size, exp_info->flags);
> Hi Christian,
>
> dma_buf_getfile takes a dmabuf, here you have a size?
>
> Did you change this function somewhere?

Ups forgot to add that change to the patch. I shouldn't code when I'm in 
a hurry.

Addressed this and Charans comment in v2.

Thanks,
Christian.

>
> with that addressed....
>
> This cleanup makes sense to me.
>
> Reviewed-by: Michael J. Ruhl <michael.j.ruhl@intel.com>
>
> M
>
>> +	if (IS_ERR(file)) {
>> +		ret = PTR_ERR(file);
>> +		goto err_module;
>> +	}
>> +
>> +	if (!exp_info->resv)
>> +		alloc_size += sizeof(struct dma_resv);
>> +	else
>> +		/* prevent &dma_buf[1] == dma_buf->resv */
>> +		alloc_size += 1;
>> 	dmabuf = kzalloc(alloc_size, GFP_KERNEL);
>> 	if (!dmabuf) {
>> 		ret = -ENOMEM;
>> -		goto err_module;
>> +		goto err_file;
>> 	}
>>
>> 	dmabuf->priv = exp_info->priv;
>> @@ -653,44 +656,36 @@ struct dma_buf *dma_buf_export(const struct
>> dma_buf_export_info *exp_info)
>> 	init_waitqueue_head(&dmabuf->poll);
>> 	dmabuf->cb_in.poll = dmabuf->cb_out.poll = &dmabuf->poll;
>> 	dmabuf->cb_in.active = dmabuf->cb_out.active = 0;
>> +	mutex_init(&dmabuf->lock);
>> +	INIT_LIST_HEAD(&dmabuf->attachments);
>>
>> 	if (!resv) {
>> -		resv = (struct dma_resv *)&dmabuf[1];
>> -		dma_resv_init(resv);
>> +		dmabuf->resv = (struct dma_resv *)&dmabuf[1];
>> +		dma_resv_init(dmabuf->resv);
>> +	} else {
>> +		dmabuf->resv = resv;
>> 	}
>> -	dmabuf->resv = resv;
>>
>> -	file = dma_buf_getfile(dmabuf, exp_info->flags);
>> -	if (IS_ERR(file)) {
>> -		ret = PTR_ERR(file);
>> +	ret = dma_buf_stats_setup(dmabuf, file);
>> +	if (ret)
>> 		goto err_dmabuf;
>> -	}
>>
>> +	file->private_data = dmabuf;
>> +	file->f_path.dentry->d_fsdata = dmabuf;
>> 	dmabuf->file = file;
>>
>> -	mutex_init(&dmabuf->lock);
>> -	INIT_LIST_HEAD(&dmabuf->attachments);
>> -
>> 	mutex_lock(&db_list.lock);
>> 	list_add(&dmabuf->list_node, &db_list.head);
>> 	mutex_unlock(&db_list.lock);
>>
>> -	ret = dma_buf_stats_setup(dmabuf);
>> -	if (ret)
>> -		goto err_sysfs;
>> -
>> 	return dmabuf;
>>
>> -err_sysfs:
>> -	/*
>> -	 * Set file->f_path.dentry->d_fsdata to NULL so that when
>> -	 * dma_buf_release() gets invoked by dentry_ops, it exits
>> -	 * early before calling the release() dma_buf op.
>> -	 */
>> -	file->f_path.dentry->d_fsdata = NULL;
>> -	fput(file);
>> err_dmabuf:
>> +	if (!resv)
>> +		dma_resv_fini(dmabuf->resv);
>> 	kfree(dmabuf);
>> +err_file:
>> +	fput(file);
>> err_module:
>> 	module_put(exp_info->owner);
>> 	return ERR_PTR(ret);
>> --
>> 2.34.1

