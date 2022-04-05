Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 751FD4F24B0
	for <lists+dri-devel@lfdr.de>; Tue,  5 Apr 2022 09:26:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C8F9510EEE3;
	Tue,  5 Apr 2022 07:26:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [IPv6:2a00:1450:4864:20::634])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6FCC410EEE2;
 Tue,  5 Apr 2022 07:25:59 +0000 (UTC)
Received: by mail-ej1-x634.google.com with SMTP id bq8so24734161ejb.10;
 Tue, 05 Apr 2022 00:25:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=3NJs3TJQkDKHjsGpm5fK36QM+EjCa9yPVHi4w1j6TIM=;
 b=EDIFosjFuzTfFaQTcs7VOeyPm632EBUUkn27uNm35fMklHHNxkTwm3Ku1jRafdagB4
 mdihxCCNZemb/kS6c8T9uIkYlYdKPP+/PhkN4Msn0tZ37cWK0arGGcjlbA+QhO0VfJwP
 Ca9X6kZWoqdZdEbchGp5ppOg+TCMgnX8W5Mp97Pkh7JMXQ6mIHSCWIiesiX5/YlXyRB3
 Uptb8tbOhn6gf+JDQOiIL5Jocw9iLq3qZsENNq7pCYHNT4Ogq8qK+g5PqrLb9b7tEJB+
 ATmNuG6clceAvFjae137WN0ozpkNQqX6l/e1wDwIk2ANV2kDZDDfTxKMceF0gT3H3HH5
 f4tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=3NJs3TJQkDKHjsGpm5fK36QM+EjCa9yPVHi4w1j6TIM=;
 b=jrzP7BBuPiSDYDF35IdvSyRGkUws4kSg9VPIdFf13oslTRuRVjY7C6vaxpehYx55/n
 x7JMUkVi6fC5z+OJUFHpxCMSGA+t0QMbRM5trgthVgwSHTx1PCOOhQatSShOAw0o0B4U
 +RG7fIs8DZ0beOY4heyyewwa26poyQhEE1nbWbqaWoL8N4BAlvcUpuUYTyPEK579AlVn
 CYlLnxw17ZsO34brCJekOKEDEmNwUi1va8nV6YmFmKOdCDr0FCXYn8Wh2zZeIeE15nxs
 kyCG+oujOCtXhOB2+pjyrNOPBs6WDgJEeQaHZHC/fpCJp1pne/HY4J7Zrylg/UXiMsCG
 olOg==
X-Gm-Message-State: AOAM530+MxdicL3Q7r2ZtK4EWFw9AZy/YZwnOZslxhnEikAVUA6K1zGd
 6z+BqOGX/WO171Fmur7mtQM=
X-Google-Smtp-Source: ABdhPJwi6D5AH7obqmIABOGtSwk/H4uki4N9XPDglhCsrEF3w6AGcefZwAXj9HmvyXSo8T5mTpdsmQ==
X-Received: by 2002:a17:906:3a04:b0:6d0:8d78:2758 with SMTP id
 z4-20020a1709063a0400b006d08d782758mr2131462eje.685.1649143557804; 
 Tue, 05 Apr 2022 00:25:57 -0700 (PDT)
Received: from [192.168.178.21] (p5b0eab60.dip0.t-ipconnect.de. [91.14.171.96])
 by smtp.gmail.com with ESMTPSA id
 j21-20020a170906255500b006e08c4862ccsm5268902ejb.96.2022.04.05.00.25.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 05 Apr 2022 00:25:56 -0700 (PDT)
Message-ID: <2a95c60e-a455-c721-f9d2-280505cb0061@gmail.com>
Date: Tue, 5 Apr 2022 09:25:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH 06/23] drm/nouveau: stop using dma_resv_excl_fence
Content-Language: en-US
To: Karol Herbst <kherbst@redhat.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
References: <20220321135856.1331-1-christian.koenig@amd.com>
 <20220321135856.1331-6-christian.koenig@amd.com>
 <b9eb079c-3ec3-6095-92ab-5dbfab88d327@amd.com>
 <CACO55ttbz2vtr_3F=koenYW0S_238_FHXZ_w=r+i_X49ke+BYg@mail.gmail.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
In-Reply-To: <CACO55ttbz2vtr_3F=koenYW0S_238_FHXZ_w=r+i_X49ke+BYg@mail.gmail.com>
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
Cc: nouveau <nouveau@lists.freedesktop.org>, Ben Skeggs <bskeggs@redhat.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Daniel Vetter <daniel.vetter@ffwll.ch>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 04.04.22 um 13:47 schrieb Karol Herbst:
> On Sun, Apr 3, 2022 at 5:59 PM Christian König <christian.koenig@amd.com> wrote:
>> Just a gentle ping to the nouveau guys.
>>
>> Any more comments on this? Otherwise I'm pushing that with Daniels rb.
>>
> It looks fine, but given that this area broke in the past I will try
> to do some testing either before or after you push it. As long as we
> do so before 5.19 it should be okay I think.

Ok that's sounds good enough to me. Going to push it to drm-misc-next now.

Thanks,
Christian.

>
> Unless somebody knowing more about this code has anything else to say.
>
>> Thanks,
>> Christian.
>>
>> Am 21.03.22 um 14:58 schrieb Christian König:
>>> Instead use the new dma_resv_get_singleton function.
>>>
>>> Signed-off-by: Christian König <christian.koenig@amd.com>
>>> Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
>>> Cc: Ben Skeggs <bskeggs@redhat.com>
>>> Cc: Karol Herbst <kherbst@redhat.com>
>>> Cc: Lyude Paul <lyude@redhat.com>
>>> Cc: nouveau@lists.freedesktop.org
>>> ---
>>>    drivers/gpu/drm/nouveau/nouveau_bo.c | 9 ++++++++-
>>>    1 file changed, 8 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/gpu/drm/nouveau/nouveau_bo.c b/drivers/gpu/drm/nouveau/nouveau_bo.c
>>> index fa73fe57f97b..74f8652d2bd3 100644
>>> --- a/drivers/gpu/drm/nouveau/nouveau_bo.c
>>> +++ b/drivers/gpu/drm/nouveau/nouveau_bo.c
>>> @@ -959,7 +959,14 @@ nouveau_bo_vm_cleanup(struct ttm_buffer_object *bo,
>>>    {
>>>        struct nouveau_drm *drm = nouveau_bdev(bo->bdev);
>>>        struct drm_device *dev = drm->dev;
>>> -     struct dma_fence *fence = dma_resv_excl_fence(bo->base.resv);
>>> +     struct dma_fence *fence;
>>> +     int ret;
>>> +
>>> +     /* TODO: This is actually a memory management dependency */
>>> +     ret = dma_resv_get_singleton(bo->base.resv, false, &fence);
>>> +     if (ret)
>>> +             dma_resv_wait_timeout(bo->base.resv, false, false,
>>> +                                   MAX_SCHEDULE_TIMEOUT);
>>>
>>>        nv10_bo_put_tile_region(dev, *old_tile, fence);
>>>        *old_tile = new_tile;

