Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 075AE64BBC6
	for <lists+dri-devel@lfdr.de>; Tue, 13 Dec 2022 19:17:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DEC0889F41;
	Tue, 13 Dec 2022 18:17:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [IPv6:2a00:1450:4864:20::62e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3EB5889A5C
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Dec 2022 18:17:45 +0000 (UTC)
Received: by mail-ej1-x62e.google.com with SMTP id gh17so38600356ejb.6
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Dec 2022 10:17:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=5iyYLRPthNSFsoYbTc2B5h8D1K7TqaS0UoHMNQ7t7PA=;
 b=Yn3YmzKkJEW3Pt7safsi7cMyM8nHr+B/TVwnUEeefNaXbu2GMFD7N0BnejQxYRjmpz
 43ou1az5ZCYC+CIWnb0rtpsrXQvDrVFmicfndvYoDKW3hxWy6ZYMgqAXABwp4WF9Ek1o
 UtHxOdym1u5guUxf5peH9R31EsGBdewZhicA4GUsm5BbnGB6GGXc4+gLLJjQkjovofpC
 gq60Y21dwWuBJGuVi6mA43dPY1qdOeOib+kyTYNN3jK9nRTqgpZ3sP7AodU0fu4gxp1T
 KWmXhzKkjgKq+KS3sO/b/k8m4rtY8aBAhdbMJoQnRcc1hibpFxkixhkIG8iMlkx8pueW
 JUMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=5iyYLRPthNSFsoYbTc2B5h8D1K7TqaS0UoHMNQ7t7PA=;
 b=J4TQ3YXubT0bdJXk0gcKSE4JVPWm8WOEeowycEAgtBLhTYO4qdCr1NNKbNp9/tJP4r
 /9DODFORMRmYnPSJwWw6R5DODX/gBmjTc8uGBWS6j//AOQjgPu/+QveiEd4cvgGn3igJ
 uwgeHd/YxPHudgKRy+KBPa3jRSB7N91deR1efNEqHMa8XsMryZcq+5e5+xY2iVCEJMYj
 7XH8Qfa7XAZ9+zzaWrbErt9JOL3ZCIQVm/LmmKJwHs9Zh2ThThiMZ5X4nrPCdv546nns
 wetkAcb/OCZDImylgTgO3yKtWiXHCHQts0XOvFFz5/mFWPU5PX3/EVkLtvLwnP2LzvS5
 nxvw==
X-Gm-Message-State: ANoB5pkYl47xDnHYGpMfpkM7HTwAweTEFEUDPCX8t6zvqVv3XvPZ5SCJ
 NrIKsidy9gGBfmRD3uEc2nHjrdaXuCQ=
X-Google-Smtp-Source: AA0mqf62FZeyPO7dHFRk1Iie8OsSlS8zKPO/WUlLK8VrpDHEZRzftVfoAzPpp1hHVAPmB3HmHMxZbg==
X-Received: by 2002:a17:906:c014:b0:7ae:987d:d7f9 with SMTP id
 e20-20020a170906c01400b007ae987dd7f9mr18875595ejz.17.1670955463545; 
 Tue, 13 Dec 2022 10:17:43 -0800 (PST)
Received: from ?IPV6:2a02:908:1256:79a0:7cbb:3db7:e717:4eec?
 ([2a02:908:1256:79a0:7cbb:3db7:e717:4eec])
 by smtp.gmail.com with ESMTPSA id
 q5-20020a170906940500b0078c213ad441sm4800107ejx.101.2022.12.13.10.17.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 13 Dec 2022 10:17:42 -0800 (PST)
Message-ID: <ead9f3f0-a9fd-4889-d698-0c77c89bcbc3@gmail.com>
Date: Tue, 13 Dec 2022 19:17:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [Linaro-mm-sig] Re: [PATCH] dma-buf: fix dma_buf_export init
 order v2
Content-Language: en-US
To: Daniel Vetter <daniel@ffwll.ch>, Sumit Semwal <sumit.semwal@linaro.org>
References: <20221209071535.933698-1-christian.koenig@amd.com>
 <CAO_48GEQmsiJ96iu16UKg-QWJDNK=y-QTcDOKTMc3CMt+S993g@mail.gmail.com>
 <Y5ixrgOsWBTzonq9@phenom.ffwll.local>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
In-Reply-To: <Y5ixrgOsWBTzonq9@phenom.ffwll.local>
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
Cc: linaro-mm-sig@lists.linaro.org, quic_charante@quicinc.com,
 cuigaosheng1@huawei.com, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 13.12.22 um 18:09 schrieb Daniel Vetter:
> On Sat, Dec 10, 2022 at 08:43:47AM +0530, Sumit Semwal wrote:
>> Hi Christian,
>>
>> On Fri, 9 Dec 2022 at 12:45, Christian König
>> <ckoenig.leichtzumerken@gmail.com> wrote:
>>> The init order and resulting error handling in dma_buf_export
>>> was pretty messy.
>>>
>>> Subordinate objects like the file and the sysfs kernel objects
>>> were initializing and wiring itself up with the object in the
>>> wrong order resulting not only in complicating and partially
>>> incorrect error handling, but also in publishing only halve
>>> initialized DMA-buf objects.
>>>
>>> Clean this up thoughtfully by allocating the file independent
>>> of the DMA-buf object. Then allocate and initialize the DMA-buf
>>> object itself, before publishing it through sysfs. If everything
>>> works as expected the file is then connected with the DMA-buf
>>> object and publish it through debugfs.
>>>
>>> Also adds the missing dma_resv_fini() into the error handling.
>>>
>>> v2: add some missing changes to dma_bug_getfile() and a missing NULL
>>>      check in dma_buf_file_release()
>>>
>>> Signed-off-by: Christian König <christian.koenig@amd.com>
>> Thank you for this nice cleanup.
>> Acked-by: Sumit Semwal <sumit.semwal@linaro.org>
> For reasons that aren't clear to me this ended up in drm-misc-fixes, but
> doesn't have a Fixes: or cc: stable tag, and because it missed the merge
> window it now wont go into any stable releases.

Mhm, crap I was hoping I would get that in before the merge window.

Should I push it to drm-misc-next  with a CC: stable tag then?

It's more of a theoretical issues if we run into problems during sysfs 
creation.

> So either this isn't a fix and should have landed in drm-misc-next or so,
> or it was, and then it should have had Fixes: line (and cc: stable most
> likely too).
>
> I spotted this becaue it caused a conflict in drm-tip that was left behind
> unresovled. I fixed it up.

Well then there is something wrong with drm-tip, cause I've fixed that 
up before.

Regards,
Christian.

>
> Tsk :-)
> -Daniel
>
>> Best,
>> Sumit.
>>> ---
>>>   drivers/dma-buf/dma-buf-sysfs-stats.c |  7 +--
>>>   drivers/dma-buf/dma-buf-sysfs-stats.h |  4 +-
>>>   drivers/dma-buf/dma-buf.c             | 84 +++++++++++++--------------
>>>   3 files changed, 43 insertions(+), 52 deletions(-)
>>>
>>> diff --git a/drivers/dma-buf/dma-buf-sysfs-stats.c b/drivers/dma-buf/dma-buf-sysfs-stats.c
>>> index 2bba0babcb62..4b680e10c15a 100644
>>> --- a/drivers/dma-buf/dma-buf-sysfs-stats.c
>>> +++ b/drivers/dma-buf/dma-buf-sysfs-stats.c
>>> @@ -168,14 +168,11 @@ void dma_buf_uninit_sysfs_statistics(void)
>>>          kset_unregister(dma_buf_stats_kset);
>>>   }
>>>
>>> -int dma_buf_stats_setup(struct dma_buf *dmabuf)
>>> +int dma_buf_stats_setup(struct dma_buf *dmabuf, struct file *file)
>>>   {
>>>          struct dma_buf_sysfs_entry *sysfs_entry;
>>>          int ret;
>>>
>>> -       if (!dmabuf || !dmabuf->file)
>>> -               return -EINVAL;
>>> -
>>>          if (!dmabuf->exp_name) {
>>>                  pr_err("exporter name must not be empty if stats needed\n");
>>>                  return -EINVAL;
>>> @@ -192,7 +189,7 @@ int dma_buf_stats_setup(struct dma_buf *dmabuf)
>>>
>>>          /* create the directory for buffer stats */
>>>          ret = kobject_init_and_add(&sysfs_entry->kobj, &dma_buf_ktype, NULL,
>>> -                                  "%lu", file_inode(dmabuf->file)->i_ino);
>>> +                                  "%lu", file_inode(file)->i_ino);
>>>          if (ret)
>>>                  goto err_sysfs_dmabuf;
>>>
>>> diff --git a/drivers/dma-buf/dma-buf-sysfs-stats.h b/drivers/dma-buf/dma-buf-sysfs-stats.h
>>> index a49c6e2650cc..7a8a995b75ba 100644
>>> --- a/drivers/dma-buf/dma-buf-sysfs-stats.h
>>> +++ b/drivers/dma-buf/dma-buf-sysfs-stats.h
>>> @@ -13,7 +13,7 @@
>>>   int dma_buf_init_sysfs_statistics(void);
>>>   void dma_buf_uninit_sysfs_statistics(void);
>>>
>>> -int dma_buf_stats_setup(struct dma_buf *dmabuf);
>>> +int dma_buf_stats_setup(struct dma_buf *dmabuf, struct file *file);
>>>
>>>   void dma_buf_stats_teardown(struct dma_buf *dmabuf);
>>>   #else
>>> @@ -25,7 +25,7 @@ static inline int dma_buf_init_sysfs_statistics(void)
>>>
>>>   static inline void dma_buf_uninit_sysfs_statistics(void) {}
>>>
>>> -static inline int dma_buf_stats_setup(struct dma_buf *dmabuf)
>>> +static inline int dma_buf_stats_setup(struct dma_buf *dmabuf, struct file *file)
>>>   {
>>>          return 0;
>>>   }
>>> diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
>>> index e6f36c014c4c..eb6b59363c4f 100644
>>> --- a/drivers/dma-buf/dma-buf.c
>>> +++ b/drivers/dma-buf/dma-buf.c
>>> @@ -95,10 +95,11 @@ static int dma_buf_file_release(struct inode *inode, struct file *file)
>>>                  return -EINVAL;
>>>
>>>          dmabuf = file->private_data;
>>> -
>>> -       mutex_lock(&db_list.lock);
>>> -       list_del(&dmabuf->list_node);
>>> -       mutex_unlock(&db_list.lock);
>>> +       if (dmabuf) {
>>> +               mutex_lock(&db_list.lock);
>>> +               list_del(&dmabuf->list_node);
>>> +               mutex_unlock(&db_list.lock);
>>> +       }
>>>
>>>          return 0;
>>>   }
>>> @@ -523,17 +524,17 @@ static inline int is_dma_buf_file(struct file *file)
>>>          return file->f_op == &dma_buf_fops;
>>>   }
>>>
>>> -static struct file *dma_buf_getfile(struct dma_buf *dmabuf, int flags)
>>> +static struct file *dma_buf_getfile(size_t size, int flags)
>>>   {
>>>          static atomic64_t dmabuf_inode = ATOMIC64_INIT(0);
>>> -       struct file *file;
>>>          struct inode *inode = alloc_anon_inode(dma_buf_mnt->mnt_sb);
>>> +       struct file *file;
>>>
>>>          if (IS_ERR(inode))
>>>                  return ERR_CAST(inode);
>>>
>>> -       inode->i_size = dmabuf->size;
>>> -       inode_set_bytes(inode, dmabuf->size);
>>> +       inode->i_size = size;
>>> +       inode_set_bytes(inode, size);
>>>
>>>          /*
>>>           * The ->i_ino acquired from get_next_ino() is not unique thus
>>> @@ -547,8 +548,6 @@ static struct file *dma_buf_getfile(struct dma_buf *dmabuf, int flags)
>>>                                   flags, &dma_buf_fops);
>>>          if (IS_ERR(file))
>>>                  goto err_alloc_file;
>>> -       file->private_data = dmabuf;
>>> -       file->f_path.dentry->d_fsdata = dmabuf;
>>>
>>>          return file;
>>>
>>> @@ -614,19 +613,11 @@ struct dma_buf *dma_buf_export(const struct dma_buf_export_info *exp_info)
>>>          size_t alloc_size = sizeof(struct dma_buf);
>>>          int ret;
>>>
>>> -       if (!exp_info->resv)
>>> -               alloc_size += sizeof(struct dma_resv);
>>> -       else
>>> -               /* prevent &dma_buf[1] == dma_buf->resv */
>>> -               alloc_size += 1;
>>> -
>>> -       if (WARN_ON(!exp_info->priv
>>> -                         || !exp_info->ops
>>> -                         || !exp_info->ops->map_dma_buf
>>> -                         || !exp_info->ops->unmap_dma_buf
>>> -                         || !exp_info->ops->release)) {
>>> +       if (WARN_ON(!exp_info->priv || !exp_info->ops
>>> +                   || !exp_info->ops->map_dma_buf
>>> +                   || !exp_info->ops->unmap_dma_buf
>>> +                   || !exp_info->ops->release))
>>>                  return ERR_PTR(-EINVAL);
>>> -       }
>>>
>>>          if (WARN_ON(exp_info->ops->cache_sgt_mapping &&
>>>                      (exp_info->ops->pin || exp_info->ops->unpin)))
>>> @@ -638,10 +629,21 @@ struct dma_buf *dma_buf_export(const struct dma_buf_export_info *exp_info)
>>>          if (!try_module_get(exp_info->owner))
>>>                  return ERR_PTR(-ENOENT);
>>>
>>> +       file = dma_buf_getfile(exp_info->size, exp_info->flags);
>>> +       if (IS_ERR(file)) {
>>> +               ret = PTR_ERR(file);
>>> +               goto err_module;
>>> +       }
>>> +
>>> +       if (!exp_info->resv)
>>> +               alloc_size += sizeof(struct dma_resv);
>>> +       else
>>> +               /* prevent &dma_buf[1] == dma_buf->resv */
>>> +               alloc_size += 1;
>>>          dmabuf = kzalloc(alloc_size, GFP_KERNEL);
>>>          if (!dmabuf) {
>>>                  ret = -ENOMEM;
>>> -               goto err_module;
>>> +               goto err_file;
>>>          }
>>>
>>>          dmabuf->priv = exp_info->priv;
>>> @@ -653,44 +655,36 @@ struct dma_buf *dma_buf_export(const struct dma_buf_export_info *exp_info)
>>>          init_waitqueue_head(&dmabuf->poll);
>>>          dmabuf->cb_in.poll = dmabuf->cb_out.poll = &dmabuf->poll;
>>>          dmabuf->cb_in.active = dmabuf->cb_out.active = 0;
>>> +       mutex_init(&dmabuf->lock);
>>> +       INIT_LIST_HEAD(&dmabuf->attachments);
>>>
>>>          if (!resv) {
>>> -               resv = (struct dma_resv *)&dmabuf[1];
>>> -               dma_resv_init(resv);
>>> +               dmabuf->resv = (struct dma_resv *)&dmabuf[1];
>>> +               dma_resv_init(dmabuf->resv);
>>> +       } else {
>>> +               dmabuf->resv = resv;
>>>          }
>>> -       dmabuf->resv = resv;
>>>
>>> -       file = dma_buf_getfile(dmabuf, exp_info->flags);
>>> -       if (IS_ERR(file)) {
>>> -               ret = PTR_ERR(file);
>>> +       ret = dma_buf_stats_setup(dmabuf, file);
>>> +       if (ret)
>>>                  goto err_dmabuf;
>>> -       }
>>>
>>> +       file->private_data = dmabuf;
>>> +       file->f_path.dentry->d_fsdata = dmabuf;
>>>          dmabuf->file = file;
>>>
>>> -       mutex_init(&dmabuf->lock);
>>> -       INIT_LIST_HEAD(&dmabuf->attachments);
>>> -
>>>          mutex_lock(&db_list.lock);
>>>          list_add(&dmabuf->list_node, &db_list.head);
>>>          mutex_unlock(&db_list.lock);
>>>
>>> -       ret = dma_buf_stats_setup(dmabuf);
>>> -       if (ret)
>>> -               goto err_sysfs;
>>> -
>>>          return dmabuf;
>>>
>>> -err_sysfs:
>>> -       /*
>>> -        * Set file->f_path.dentry->d_fsdata to NULL so that when
>>> -        * dma_buf_release() gets invoked by dentry_ops, it exits
>>> -        * early before calling the release() dma_buf op.
>>> -        */
>>> -       file->f_path.dentry->d_fsdata = NULL;
>>> -       fput(file);
>>>   err_dmabuf:
>>> +       if (!resv)
>>> +               dma_resv_fini(dmabuf->resv);
>>>          kfree(dmabuf);
>>> +err_file:
>>> +       fput(file);
>>>   err_module:
>>>          module_put(exp_info->owner);
>>>          return ERR_PTR(ret);
>>> --
>>> 2.34.1
>>>
>>
>> -- 
>> Thanks and regards,
>>
>> Sumit Semwal (he / him)
>> Tech Lead - LCG, Vertical Technologies
>> Linaro.org │ Open source software for ARM SoCs
>> _______________________________________________
>> Linaro-mm-sig mailing list -- linaro-mm-sig@lists.linaro.org
>> To unsubscribe send an email to linaro-mm-sig-leave@lists.linaro.org

