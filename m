Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 520A7736770
	for <lists+dri-devel@lfdr.de>; Tue, 20 Jun 2023 11:15:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 58BF110E297;
	Tue, 20 Jun 2023 09:15:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE6AA10E297;
 Tue, 20 Jun 2023 09:15:43 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-31121494630so5141575f8f.3; 
 Tue, 20 Jun 2023 02:15:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1687252542; x=1689844542;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=QoLjdcmtATlIxJ/j7hU+BqsFQqBE8XjEf1RqQqDsXmg=;
 b=pKbytuAmUv1kgC3ZLx2Y5MpvPFv0bBQFNagZoj48GBf6T8jpYCzmM812m4N8ug/zpt
 oo9GQgP62kOeTsC/DNWfc9Q+tNYRE/5fE39GQ/ww5szKX1km2xtfopjYPu4+2ZqMOSuH
 PahQjVERWsGEwwGxr64GEJnx8n4gP3v3kRP7TXoZyH2BfFN7y3L1GRaKO79XdAjB5P3W
 Ya8+K+3NNraT4VKN3LynSo+eg5TTNoBWioJmUyfEHNNEXu1m7TvOp1b3hmPF+MkwWu/r
 iDSc9WLM1Ykf20mSobfzxKQI1tSZeKEJNcEx6mf1VblqU+AG6qsK7E7LiYieCSI9OREJ
 HWvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687252542; x=1689844542;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=QoLjdcmtATlIxJ/j7hU+BqsFQqBE8XjEf1RqQqDsXmg=;
 b=l7eFwJBfXsilCuruQLdF1w0arahcislPKb6Tsxw6N7stDdmIktm13A9GpVOI3RduTR
 kEzBdgBPgDgJ8z0cn0LJnaDBTyKYCBhSfY21KbdgFJ24+PfUGVqxj2CNh2mmDjUdJcZ3
 vtNW5BMxD2P8x0sw2jEoQuxTMchbd+XswdbpKV7/6s1vmzPh30UTF3GvBhkQV/z7GRV9
 v0aOEOLSAmfvx8FvwtIWyGr9vgCzvJtkAkzUVWp7QAmWS6e4U4KDqPupJIZ14SCYmwJu
 CF2QVD/7BUxCMhFq+tj0KXvfjJtOyr60IoqEVmOKDnF2aluIkJxSS2kqZvlfToUWI2Va
 0ryQ==
X-Gm-Message-State: AC+VfDw3kIQ30bNKNgYPRuugK5o0bbRWUZMNK2FtEUXsvY0tCvhUq8MC
 f2gFTjQgiO3YC4w2E1ggZXU=
X-Google-Smtp-Source: ACHHUZ5OKa576Prx8+cpoQOO7gKnq9ocmDzz2Xee63wY88GSvxA9QCrNgHxExcT+MmtA+g7/mdeCdQ==
X-Received: by 2002:adf:f787:0:b0:311:f77:6a91 with SMTP id
 q7-20020adff787000000b003110f776a91mr9863720wrp.31.1687252541990; 
 Tue, 20 Jun 2023 02:15:41 -0700 (PDT)
Received: from ?IPV6:2a00:e180:154d:9c00:68d9:fc9c:8543:a6?
 ([2a00:e180:154d:9c00:68d9:fc9c:8543:a6])
 by smtp.gmail.com with ESMTPSA id
 k1-20020a5d66c1000000b003079c402762sm1561994wrw.19.2023.06.20.02.15.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 20 Jun 2023 02:15:41 -0700 (PDT)
Message-ID: <93f681ad-230a-8e66-2f86-5870d4c7eca3@gmail.com>
Date: Tue, 20 Jun 2023 11:15:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 08/13] drm/qxl: switch to using drm_exec
Content-Language: en-US
To: Thomas Zimmermann <tzimmermann@suse.de>, francois.dugast@intel.com,
 felix.kuehling@amd.com, arunpravin.paneerselvam@amd.com,
 thomas_os@shipmail.org, dakr@redhat.com, luben.tuikov@amd.com,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
References: <20230504115159.2245-1-christian.koenig@amd.com>
 <20230504115159.2245-9-christian.koenig@amd.com>
 <0eedce4a-bf11-e6ab-b49b-4d3cee049627@suse.de>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
In-Reply-To: <0eedce4a-bf11-e6ab-b49b-4d3cee049627@suse.de>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 20.06.23 um 11:13 schrieb Thomas Zimmermann:
> Hi
>
> Am 04.05.23 um 13:51 schrieb Christian König:
>> Just a straightforward conversion without any optimization.
>>
>> Only compile tested for now.
>>
>> Signed-off-by: Christian König <christian.koenig@amd.com>
>> ---
>>   drivers/gpu/drm/qxl/Kconfig       |  1 +
>>   drivers/gpu/drm/qxl/qxl_drv.h     |  7 ++--
>>   drivers/gpu/drm/qxl/qxl_release.c | 67 ++++++++++++++++---------------
>>   3 files changed, 39 insertions(+), 36 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/qxl/Kconfig b/drivers/gpu/drm/qxl/Kconfig
>> index ca3f51c2a8fe..9c8e433be33e 100644
>> --- a/drivers/gpu/drm/qxl/Kconfig
>> +++ b/drivers/gpu/drm/qxl/Kconfig
>> @@ -5,6 +5,7 @@ config DRM_QXL
>>       select DRM_KMS_HELPER
>>       select DRM_TTM
>>       select DRM_TTM_HELPER
>> +    select DRM_EXEC
>
> Just some nitpicking, but can we try to keep these select statements 
> sorted alphabetically?

Sure and good point, going to apply that to other drivers as well.

Christian.

>
>>       select CRC32
>>       help
>>         QXL virtual GPU for Spice virtualization desktop integration.
>> diff --git a/drivers/gpu/drm/qxl/qxl_drv.h 
>> b/drivers/gpu/drm/qxl/qxl_drv.h
>> index ea993d7162e8..3e732648b332 100644
>> --- a/drivers/gpu/drm/qxl/qxl_drv.h
>> +++ b/drivers/gpu/drm/qxl/qxl_drv.h
>> @@ -38,12 +38,12 @@
>>     #include <drm/drm_crtc.h>
>>   #include <drm/drm_encoder.h>
>> +#include <drm/drm_exec.h>
>>   #include <drm/drm_gem_ttm_helper.h>
>>   #include <drm/drm_ioctl.h>
>>   #include <drm/drm_gem.h>
>>   #include <drm/qxl_drm.h>
>>   #include <drm/ttm/ttm_bo.h>
>> -#include <drm/ttm/ttm_execbuf_util.h>
>>   #include <drm/ttm/ttm_placement.h>
>>     #include "qxl_dev.h"
>> @@ -101,7 +101,8 @@ struct qxl_gem {
>>   };
>>     struct qxl_bo_list {
>> -    struct ttm_validate_buffer tv;
>> +    struct qxl_bo        *bo;
>> +    struct list_head    list;
>>   };
>>     struct qxl_crtc {
>> @@ -151,7 +152,7 @@ struct qxl_release {
>>       struct qxl_bo *release_bo;
>>       uint32_t release_offset;
>>       uint32_t surface_release_id;
>> -    struct ww_acquire_ctx ticket;
>> +    struct drm_exec    exec;
>>       struct list_head bos;
>>   };
>>   diff --git a/drivers/gpu/drm/qxl/qxl_release.c 
>> b/drivers/gpu/drm/qxl/qxl_release.c
>> index 368d26da0d6a..da7cd9cd58f9 100644
>> --- a/drivers/gpu/drm/qxl/qxl_release.c
>> +++ b/drivers/gpu/drm/qxl/qxl_release.c
>> @@ -121,13 +121,11 @@ qxl_release_free_list(struct qxl_release *release)
>>   {
>>       while (!list_empty(&release->bos)) {
>>           struct qxl_bo_list *entry;
>> -        struct qxl_bo *bo;
>>             entry = container_of(release->bos.next,
>> -                     struct qxl_bo_list, tv.head);
>> -        bo = to_qxl_bo(entry->tv.bo);
>> -        qxl_bo_unref(&bo);
>> -        list_del(&entry->tv.head);
>> +                     struct qxl_bo_list, list);
>> +        qxl_bo_unref(&entry->bo);
>> +        list_del(&entry->list);
>>           kfree(entry);
>>       }
>>       release->release_bo = NULL;
>> @@ -172,8 +170,8 @@ int qxl_release_list_add(struct qxl_release 
>> *release, struct qxl_bo *bo)
>>   {
>>       struct qxl_bo_list *entry;
>>   -    list_for_each_entry(entry, &release->bos, tv.head) {
>> -        if (entry->tv.bo == &bo->tbo)
>> +    list_for_each_entry(entry, &release->bos, list) {
>> +        if (entry->bo == bo)
>>               return 0;
>>       }
>>   @@ -182,9 +180,8 @@ int qxl_release_list_add(struct qxl_release 
>> *release, struct qxl_bo *bo)
>>           return -ENOMEM;
>>         qxl_bo_ref(bo);
>> -    entry->tv.bo = &bo->tbo;
>> -    entry->tv.num_shared = 0;
>> -    list_add_tail(&entry->tv.head, &release->bos);
>> +    entry->bo = bo;
>> +    list_add_tail(&entry->list, &release->bos);
>>       return 0;
>>   }
>>   @@ -221,21 +218,27 @@ int qxl_release_reserve_list(struct 
>> qxl_release *release, bool no_intr)
>>       if (list_is_singular(&release->bos))
>>           return 0;
>>   -    ret = ttm_eu_reserve_buffers(&release->ticket, &release->bos,
>> -                     !no_intr, NULL);
>> -    if (ret)
>> -        return ret;
>> -
>> -    list_for_each_entry(entry, &release->bos, tv.head) {
>> -        struct qxl_bo *bo = to_qxl_bo(entry->tv.bo);
>> -
>> -        ret = qxl_release_validate_bo(bo);
>> -        if (ret) {
>> -            ttm_eu_backoff_reservation(&release->ticket, 
>> &release->bos);
>> -            return ret;
>> +    drm_exec_init(&release->exec, !no_intr);
>> +    drm_exec_while_not_all_locked(&release->exec) {
>> +        list_for_each_entry(entry, &release->bos, list) {
>> +            ret = drm_exec_prepare_obj(&release->exec,
>> +                           &entry->bo->tbo.base,
>> +                           1);
>> + drm_exec_break_on_contention(&release->exec);
>> +            if (ret)
>> +                goto error;
>>           }
>>       }
>> +
>> +    list_for_each_entry(entry, &release->bos, list) {
>> +        ret = qxl_release_validate_bo(entry->bo);
>> +        if (ret)
>> +            goto error;
>> +    }
>>       return 0;
>> +error:
>> +    drm_exec_fini(&release->exec);
>> +    return ret;
>>   }
>>     void qxl_release_backoff_reserve_list(struct qxl_release *release)
>> @@ -245,7 +248,7 @@ void qxl_release_backoff_reserve_list(struct 
>> qxl_release *release)
>>       if (list_is_singular(&release->bos))
>>           return;
>>   -    ttm_eu_backoff_reservation(&release->ticket, &release->bos);
>> +    drm_exec_fini(&release->exec);
>>   }
>>     int qxl_alloc_surface_release_reserved(struct qxl_device *qdev,
>> @@ -404,18 +407,18 @@ void qxl_release_unmap(struct qxl_device *qdev,
>>     void qxl_release_fence_buffer_objects(struct qxl_release *release)
>>   {
>> -    struct ttm_buffer_object *bo;
>>       struct ttm_device *bdev;
>> -    struct ttm_validate_buffer *entry;
>> +    struct qxl_bo_list *entry;
>>       struct qxl_device *qdev;
>> +    struct qxl_bo *bo;
>>         /* if only one object on the release its the release itself
>>          since these objects are pinned no need to reserve */
>>       if (list_is_singular(&release->bos) || list_empty(&release->bos))
>>           return;
>>   -    bo = list_first_entry(&release->bos, struct 
>> ttm_validate_buffer, head)->bo;
>> -    bdev = bo->bdev;
>> +    bo = list_first_entry(&release->bos, struct qxl_bo_list, list)->bo;
>> +    bdev = bo->tbo.bdev;
>>       qdev = container_of(bdev, struct qxl_device, mman.bdev);
>>         /*
>> @@ -426,14 +429,12 @@ void qxl_release_fence_buffer_objects(struct 
>> qxl_release *release)
>>                  release->id | 0xf0000000, release->base.seqno);
>>       trace_dma_fence_emit(&release->base);
>>   -    list_for_each_entry(entry, &release->bos, head) {
>> +    list_for_each_entry(entry, &release->bos, list) {
>>           bo = entry->bo;
>>   -        dma_resv_add_fence(bo->base.resv, &release->base,
>> +        dma_resv_add_fence(bo->tbo.base.resv, &release->base,
>>                      DMA_RESV_USAGE_READ);
>> -        ttm_bo_move_to_lru_tail_unlocked(bo);
>> -        dma_resv_unlock(bo->base.resv);
>> +        ttm_bo_move_to_lru_tail_unlocked(&bo->tbo);
>>       }
>> -    ww_acquire_fini(&release->ticket);
>> +    drm_exec_fini(&release->exec);
>>   }
>> -
>

