Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 86B742B3B02
	for <lists+dri-devel@lfdr.de>; Mon, 16 Nov 2020 02:08:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 67B9E89DA7;
	Mon, 16 Nov 2020 01:07:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-xf42.google.com (mail-qv1-xf42.google.com
 [IPv6:2607:f8b0:4864:20::f42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C58CE6E959
 for <dri-devel@lists.freedesktop.org>; Sat, 14 Nov 2020 20:10:36 +0000 (UTC)
Received: by mail-qv1-xf42.google.com with SMTP id ek7so6744514qvb.6
 for <dri-devel@lists.freedesktop.org>; Sat, 14 Nov 2020 12:10:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=marek-ca.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=67JIrhUexBLk+euYcRPybCUujGZ256Wpe49XxF/Od8o=;
 b=itpMD3coD5rHj6pDvemIHpnPf4BB39MY7jtbuBua/ljNHEQhqlwauoK9p3NxrAmPlH
 tM1OmSMW5cPdEWV8j5GRMzgTXEvw7OF8+koGttFDhDJAEvy/nEVWtPGba1Pfxkf6rqQA
 xoh67VBTeWFhcjmWz6O70tbT6C91O+JHHO1RwL0HN1pYW2tm265UH57Gr2xCb7jwZ/MW
 91omkj8gLtx3SEJVzCYmCQ3uR6lAX5pD6eGbrv1MVSQZBhvUKuGwljJ4D0JvsGXAMN/I
 1Ogm4wRS+XrQ8Riey+hd9ziYiYF1dr7cWHeYsI40B5poW8sQE5wNRX4wp+ma3w9yVACI
 npZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=67JIrhUexBLk+euYcRPybCUujGZ256Wpe49XxF/Od8o=;
 b=Dnp3iisb9Co7W+nEOP1wb+U9s2O3cnwH67CowAqGQuDHKNE4hr7DYErzUwUkGaHZD6
 WS/ttx2A6fKav6nogEP2lz/8hHW8dGiot+f4TCOv+Pian0Rx0Qkalt1bkYKVkMFaF6Cv
 P6oIM1mgYq9lF++o0wmsBWj57LRRq+kP4c4KY64KLc9KDz+ElkZYfupjRRdQJakbsSuB
 NrWyT9uAbAZyq7jfgmNEFL+ReKs99tVy8FpCRahMVg0YNqo9sKYrNdTVRhMhlkIq6TCV
 d85hB6nVBvN612nUJIctD9+xwW0B6jXpPgPsRHjsF97WKPvdduLpCSC9g/EBJr9OZnud
 FZNQ==
X-Gm-Message-State: AOAM5319Nc2NMniYy2TF51Fv9kryWspIFKGXanDxsLoJA+yFmbfXcjcr
 nKzorPddx3+nlLXomNusCA+l1A==
X-Google-Smtp-Source: ABdhPJzft9OhFBtteOqZhLQn7egjWtZlERvOrzafk6j36LTCmNIxc3fnqX7jB1KikEADIQ4Qg6oRJA==
X-Received: by 2002:ad4:4bb2:: with SMTP id i18mr8530477qvw.52.1605384635788; 
 Sat, 14 Nov 2020 12:10:35 -0800 (PST)
Received: from [192.168.0.189] (modemcable068.184-131-66.mc.videotron.ca.
 [66.131.184.68])
 by smtp.gmail.com with ESMTPSA id k31sm8923935qtd.40.2020.11.14.12.10.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 14 Nov 2020 12:10:35 -0800 (PST)
Subject: Re: [RESEND PATCH v2 4/5] drm/msm: add DRM_MSM_GEM_SYNC_CACHE for
 non-coherent cache maintenance
To: Rob Clark <robdclark@gmail.com>
References: <20201114151717.5369-1-jonathan@marek.ca>
 <20201114151717.5369-5-jonathan@marek.ca> <20201114162406.GC24411@lst.de>
 <CAF6AEGvujttEkFuRqtt7i+0o7-=2spKXfAvJZrj96uWAFRLYuA@mail.gmail.com>
 <50ddcadb-c630-2ef6-cdc4-724d9823fba7@marek.ca>
 <CAF6AEGsH5Wk=J+HxHnRqTMLZscjErjKq2v0Rms7Td=W7icZ3sw@mail.gmail.com>
From: Jonathan Marek <jonathan@marek.ca>
Message-ID: <b6e4f167-871a-5f26-46bd-d914476af519@marek.ca>
Date: Sat, 14 Nov 2020 15:07:20 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <CAF6AEGsH5Wk=J+HxHnRqTMLZscjErjKq2v0Rms7Td=W7icZ3sw@mail.gmail.com>
Content-Language: en-US
X-Mailman-Approved-At: Mon, 16 Nov 2020 01:07:21 +0000
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
Cc: David Airlie <airlied@linux.ie>,
 freedreno <freedreno@lists.freedesktop.org>,
 open list <linux-kernel@vger.kernel.org>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <dri-devel@lists.freedesktop.org>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 Sean Paul <sean@poorly.run>, Christoph Hellwig <hch@lst.de>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 11/14/20 2:39 PM, Rob Clark wrote:
> On Sat, Nov 14, 2020 at 10:58 AM Jonathan Marek <jonathan@marek.ca> wrote:
>>
>> On 11/14/20 1:46 PM, Rob Clark wrote:
>>> On Sat, Nov 14, 2020 at 8:24 AM Christoph Hellwig <hch@lst.de> wrote:
>>>>
>>>> On Sat, Nov 14, 2020 at 10:17:12AM -0500, Jonathan Marek wrote:
>>>>> +void msm_gem_sync_cache(struct drm_gem_object *obj, uint32_t flags,
>>>>> +             size_t range_start, size_t range_end)
>>>>> +{
>>>>> +     struct msm_gem_object *msm_obj = to_msm_bo(obj);
>>>>> +     struct device *dev = msm_obj->base.dev->dev;
>>>>> +
>>>>> +     /* exit early if get_pages() hasn't been called yet */
>>>>> +     if (!msm_obj->pages)
>>>>> +             return;
>>>>> +
>>>>> +     /* TODO: sync only the specified range */
>>>>> +
>>>>> +     if (flags & MSM_GEM_SYNC_FOR_DEVICE) {
>>>>> +             dma_sync_sg_for_device(dev, msm_obj->sgt->sgl,
>>>>> +                             msm_obj->sgt->nents, DMA_TO_DEVICE);
>>>>> +     }
>>>>> +
>>>>> +     if (flags & MSM_GEM_SYNC_FOR_CPU) {
>>>>> +             dma_sync_sg_for_cpu(dev, msm_obj->sgt->sgl,
>>>>> +                             msm_obj->sgt->nents, DMA_FROM_DEVICE);
>>>>> +     }
>>>>
>>>> Splitting this helper from the only caller is rather strange, epecially
>>>> with the two unused arguments.  And I think the way this is specified
>>>> to take a range, but ignoring it is actively dangerous.  User space will
>>>> rely on it syncing everything sooner or later and then you are stuck.
>>>> So just define a sync all primitive for now, and if you really need a
>>>> range sync and have actually implemented it add a new ioctl for that.
>>>
>>> We do already have a split of ioctl "layer" which enforces valid ioctl
>>> params, etc, and gem (or other) module code which is called by the
>>> ioctl func.  So I think it is fine to keep this split here.  (Also, I
>>> think at some point there will be a uring type of ioctl alternative
>>> which would re-use the same gem func.)
>>>
>>> But I do agree that the range should be respected or added later..
>>> drm_ioctl() dispatch is well prepared for extending ioctls.
>>>
>>> And I assume there should be some validation that the range is aligned
>>> to cache-line?  Or can we flush a partial cache line?
>>>
>>
>> The range is intended to be "sync at least this range", so that
>> userspace doesn't have to worry about details like that.
>>
> 
> I don't think userspace can *not* worry about details like that.
> Consider a case where the cpu and gpu are simultaneously accessing
> different parts of a buffer (for ex, sub-allocation).  There needs to
> be cache-line separation between the two.
> 

Right.. and it also seems like we can't get away with just 
flushing/invalidating the whole thing.

qcom's vulkan driver has nonCoherentAtomSize=1, and it looks like 
dma_sync_single_for_cpu() does deal in some way with the partial cache 
line case, although I'm not sure that means we can have a 
nonCoherentAtomSize=1.

> BR,
> -R
> 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
