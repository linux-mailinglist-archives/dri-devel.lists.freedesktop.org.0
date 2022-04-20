Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CC55508783
	for <lists+dri-devel@lfdr.de>; Wed, 20 Apr 2022 13:55:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D0A510F16E;
	Wed, 20 Apr 2022 11:55:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B6A810E2A4;
 Wed, 20 Apr 2022 11:55:42 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id p189so1025950wmp.3;
 Wed, 20 Apr 2022 04:55:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:in-reply-to;
 bh=A3aikK3emp74GAZ8IL4yMqpU8OSykkLwOCBNRMOUOJw=;
 b=iVCq3Tdxzge//vqOOSaBVDQjZgBvEEdFHhTP2ecivLnCMdrDhbSaL1zJetgAyGW9PG
 KjOa9p+OnO2tApa/rj8ou+NfQqJTEYOilguPgXzEwJJw5LboKHanGc3NoBCLp6K2p3OI
 jttr+q74WtalT7qbSm70c4FxgbC9ilMwc+rKMdvoSz1rusfZmf/bGjc9cDbgZI4actk5
 7yQ4Ia4W541JMpUNG6Xe8qIW4Xe3nWwCPPo/CQEmB43jQYfBIXBorLguNtOEEfEzLMA0
 uvUUiiEwpADj93/6eN4i9h+p+mra7gDuwoiZUjhjjOEUXyiHb+99Puh2N9xV7cU8nQxZ
 kSIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to;
 bh=A3aikK3emp74GAZ8IL4yMqpU8OSykkLwOCBNRMOUOJw=;
 b=kIRfOHGV4qb7RxEr688LAY0y3r/UDzrFFH4yRrld2oLKv1ZSdYB1YWPga//fMgmKBM
 uWunkxU7KGR5RRD/1En+2kdbSv6NX5X2GCMhfM4UPa9c0x+5OALsuZWlzl/KtOea0wMY
 xT/c+2lqABy38u/iFrtO1rpT4O+CKmoU35h7ThnQ78LOvciADX8JYy9lVdxTVxvDSXOl
 aWMQFLLom5Nmb2Raq3Vjo7Sv/bWCWFej7WthtOkUil5NYfBYKmndEf4VGnZtdSj4LDHj
 HW4zb8hiYY/FjsUVealcBHIe2jsanlalEP9MfwOl2IFPKPkuWBVthvyaKcjRM+l7ZkSK
 QmYQ==
X-Gm-Message-State: AOAM533qvs4etD3/ZIkXvEhn8XHvYDzL7frKv0qxyta0Ql4jDpwBvS/l
 HtcU/YU4832hIeglwUzR06s=
X-Google-Smtp-Source: ABdhPJz8vWEzq5vxmyYKluMHnLNTVbatgIuCIAT3HzWiJjYUKjn+UpbdvNZwh5KZa4QCIMAOOmMTjQ==
X-Received: by 2002:a05:600c:1e15:b0:38f:f556:9349 with SMTP id
 ay21-20020a05600c1e1500b0038ff5569349mr3198605wmb.3.1650455740762; 
 Wed, 20 Apr 2022 04:55:40 -0700 (PDT)
Received: from [192.168.178.21] (p57b0b9e1.dip0.t-ipconnect.de.
 [87.176.185.225]) by smtp.gmail.com with ESMTPSA id
 l8-20020a5d6d88000000b0020a98986534sm7217615wrs.43.2022.04.20.04.55.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 20 Apr 2022 04:55:40 -0700 (PDT)
Content-Type: multipart/alternative;
 boundary="------------LYBMs8nRMbqfj7bmHaOEGth3"
Message-ID: <572ed15c-b47e-e7b3-850a-cb0d5259af04@gmail.com>
Date: Wed, 20 Apr 2022 13:55:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH] drm/ttm: fix ttm tt init fail when size exceeds kmalloc
 limit
Content-Language: en-US
To: "Wang, Yang(Kevin)" <KevinYang.Wang@amd.com>,
 "Koenig, Christian" <Christian.Koenig@amd.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
References: <20220420085612.1664787-1-KevinYang.Wang@amd.com>
 <00dfec71-cf38-d6d9-8775-0ae88f59224e@amd.com>
 <CO6PR12MB54733101E19842B59668482B82F59@CO6PR12MB5473.namprd12.prod.outlook.com>
 <65ef352b-59c8-e802-5285-afc59e56fa9b@amd.com>
 <CO6PR12MB547340CB065269B1731812B182F59@CO6PR12MB5473.namprd12.prod.outlook.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
In-Reply-To: <CO6PR12MB547340CB065269B1731812B182F59@CO6PR12MB5473.namprd12.prod.outlook.com>
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

This is a multi-part message in MIME format.
--------------LYBMs8nRMbqfj7bmHaOEGth3
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Kevin,

no, the test case should already fail in amdgpu_bo_validate_size().

If we have a system with 2TiB of memory where the test case could 
succeed then we should increase the requested size to something larger.

And if the underlying core Linux kernel functions don't allow 
allocations as large as the requested one we should *NEVER* ever add 
workarounds like this.

It is perfectly expected that this test case is not able to fulfill the 
desired allocation. That it fails during kvmalloc is unfortunate, but 
not a show stopper.

Regards,
Christian.


Am 20.04.22 um 13:32 schrieb Wang, Yang(Kevin):
>
> [AMD Official Use Only]
>
>
> Hi Chris,
>
> you misunderstood background about this case.
>
> although we expect this test case to fail, it should fail at the 
> location where the Bo actual memory is actually allocated. now the 
> code logic will cause the failure to allocate memory to store DMA address.
>
> e.g: the case is failed in 2TB system ram machine, it should be 
> allocated successful, but it is failed.
>
> allocate 1TB BO, the ttm should allocate 1TB/4k * 8 buffer to store 
> allocate result (page address), this should not be failed usually.
>
> There is a similar fix in upstream kernel 5.18, before this fix 
> entered the TTM code, this problem existed in TTM.
>
> kernel/git/torvalds/linux.git - Linux kernel source tree 
> <https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?h=v5.18-rc3&id=a421ef303008b0ceee2cfc625c3246fa7654b0ca>
> mm: allow !GFP_KERNEL allocations for kvmalloc
>
> Best Regards,
> Kevin
>
> ------------------------------------------------------------------------
> *From:* Koenig, Christian <Christian.Koenig@amd.com>
> *Sent:* Wednesday, April 20, 2022 6:53 PM
> *To:* Wang, Yang(Kevin) <KevinYang.Wang@amd.com>; 
> dri-devel@lists.freedesktop.org <dri-devel@lists.freedesktop.org>; 
> amd-gfx@lists.freedesktop.org <amd-gfx@lists.freedesktop.org>
> *Subject:* Re: [PATCH] drm/ttm: fix ttm tt init fail when size exceeds 
> kmalloc limit
> Am 20.04.22 um 11:07 schrieb Wang, Yang(Kevin):
>>
>> [AMD Official Use Only]
>>
>>
>>
>> ------------------------------------------------------------------------
>> *From:* Koenig, Christian <Christian.Koenig@amd.com> 
>> <mailto:Christian.Koenig@amd.com>
>> *Sent:* Wednesday, April 20, 2022 5:00 PM
>> *To:* Wang, Yang(Kevin) <KevinYang.Wang@amd.com> 
>> <mailto:KevinYang.Wang@amd.com>; dri-devel@lists.freedesktop.org 
>> <mailto:dri-devel@lists.freedesktop.org> 
>> <dri-devel@lists.freedesktop.org> 
>> <mailto:dri-devel@lists.freedesktop.org>; 
>> amd-gfx@lists.freedesktop.org <mailto:amd-gfx@lists.freedesktop.org> 
>> <amd-gfx@lists.freedesktop.org> <mailto:amd-gfx@lists.freedesktop.org>
>> *Subject:* Re: [PATCH] drm/ttm: fix ttm tt init fail when size 
>> exceeds kmalloc limit
>> Am 20.04.22 um 10:56 schrieb Yang Wang:
>> > if the __GFP_ZERO is set, the kvmalloc() can't fallback to use 
>> vmalloc()
>>
>> Hui what? Why should kvmalloc() not be able to fallback to vmalloc()
>> when __GFP_ZERO is set?
>>
>> And even that is really the case then that sounds like a bug in 
>> kvmalloc().
>>
>> Regards,
>> Christian.
>>
>> [kevin]:
>> it is really test case from libdrm amdgpu test, which try to allocate 
>> a big BO which will cause ttm tt init fail.
>
>
> LOL! Guys, this test case is intended to fail!
> *
> *The test consists of allocating a buffer so ridiculous large that it 
> should never succeed and be rejected by the kernel driver.
>
> This patch here is a really clear NAK.
>
> Regards,
> Christian.
>
>> it may be a kvmalloc() bug, and this patch can as a workaround 
>> in ttm before this issue fix.
>>
>> void *kvmalloc_node(size_t size, gfp_t flags, int node)
>> {
>> ...
>>         if ((flags & GFP_KERNEL) != GFP_KERNEL)
>>   return kmalloc_node(size, flags, node);
>> ...
>> }
>>
>> Best Regards,
>> Kevin
>>
>> > to allocate memory, when request size is exceeds kmalloc limit, it will
>> > cause allocate memory fail.
>> >
>> > e.g: when ttm want to create a BO with 1TB size, it maybe fail.
>> >
>> > Signed-off-by: Yang Wang <KevinYang.Wang@amd.com> 
>> <mailto:KevinYang.Wang@amd.com>
>> > ---
>> >   drivers/gpu/drm/ttm/ttm_tt.c | 14 +++++++++++---
>> >   1 file changed, 11 insertions(+), 3 deletions(-)
>> >
>> > diff --git a/drivers/gpu/drm/ttm/ttm_tt.c 
>> b/drivers/gpu/drm/ttm/ttm_tt.c
>> > index 79c870a3bef8..9f2f3e576b8d 100644
>> > --- a/drivers/gpu/drm/ttm/ttm_tt.c
>> > +++ b/drivers/gpu/drm/ttm/ttm_tt.c
>> > @@ -97,9 +97,12 @@ int ttm_tt_create(struct ttm_buffer_object *bo, 
>> bool zero_alloc)
>> >   static int ttm_tt_alloc_page_directory(struct ttm_tt *ttm)
>> >   {
>> >        ttm->pages = kvmalloc_array(ttm->num_pages, sizeof(void*),
>> > -                     GFP_KERNEL | __GFP_ZERO);
>> > + GFP_KERNEL);
>> >        if (!ttm->pages)
>> >                return -ENOMEM;
>> > +
>> > +     memset(ttm->pages, 0, ttm->num_pages * sizeof(void *));
>> > +
>> >        return 0;
>> >   }
>> >
>> > @@ -108,10 +111,12 @@ static int 
>> ttm_dma_tt_alloc_page_directory(struct ttm_tt *ttm)
>> >        ttm->pages = kvmalloc_array(ttm->num_pages,
>> > sizeof(*ttm->pages) +
>> > sizeof(*ttm->dma_address),
>> > -                                 GFP_KERNEL | __GFP_ZERO);
>> > + GFP_KERNEL);
>> >        if (!ttm->pages)
>> >                return -ENOMEM;
>> >
>> > +     memset(ttm->pages, 0, ttm->num_pages * (sizeof(*ttm->pages) + 
>> sizeof(*ttm->dma_address)));
>> > +
>> >        ttm->dma_address = (void *)(ttm->pages + ttm->num_pages);
>> >        return 0;
>> >   }
>> > @@ -120,9 +125,12 @@ static int 
>> ttm_sg_tt_alloc_page_directory(struct ttm_tt *ttm)
>> >   {
>> >        ttm->dma_address = kvmalloc_array(ttm->num_pages,
>> > sizeof(*ttm->dma_address),
>> > - GFP_KERNEL | __GFP_ZERO);
>> > + GFP_KERNEL);
>> >        if (!ttm->dma_address)
>> >                return -ENOMEM;
>> > +
>> > +     memset(ttm->dma_address, 0, ttm->num_pages * 
>> sizeof(*ttm->dma_address));
>> > +
>> >        return 0;
>> >   }
>> >
>>
>

--------------LYBMs8nRMbqfj7bmHaOEGth3
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    Hi Kevin,<br>
    <br>
    no, the test case should already fail in amdgpu_bo_validate_size().<br>
    <br>
    If we have a system with 2TiB of memory where the test case could
    succeed then we should increase the requested size to something
    larger.<br>
    <br>
    And if the underlying core Linux kernel functions don't allow
    allocations as large as the requested one we should *NEVER* ever add
    workarounds like this.<br>
    <br>
    It is perfectly expected that this test case is not able to fulfill
    the desired allocation. That it fails during kvmalloc is
    unfortunate, but not a show stopper.<br>
    <br>
    Regards,<br>
    Christian.<br>
    <br>
    <br>
    <div class="moz-cite-prefix">Am 20.04.22 um 13:32 schrieb Wang,
      Yang(Kevin):<br>
    </div>
    <blockquote type="cite"
cite="mid:CO6PR12MB547340CB065269B1731812B182F59@CO6PR12MB5473.namprd12.prod.outlook.com">
      <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
      <style type="text/css" style="display:none;">P {margin-top:0;margin-bottom:0;}</style>
      <p
        style="font-family:Arial;font-size:10pt;color:#0000FF;margin:5pt;"
        align="Left">
        [AMD Official Use Only]<br>
      </p>
      <br>
      <div>
        <div style="font-family: Calibri, Arial, Helvetica, sans-serif;
          font-size: 12pt; color: rgb(0, 0, 0);" class="elementToProof">
          <span style="font-family: Calibri, Arial, Helvetica,
            sans-serif; font-size: 12pt; color: rgb(0, 0, 0);
            background-color: rgba(0, 0, 0, 0);">Hi Chris,</span></div>
        <div style="font-family: Calibri, Arial, Helvetica, sans-serif;
          font-size: 12pt; color: rgb(0, 0, 0);" class="elementToProof">
          <br>
        </div>
        <div style="font-family: Calibri, Arial, Helvetica, sans-serif;
          font-size: 12pt; color: rgb(0, 0, 0);" class="elementToProof">
          <span style="font-family: Calibri, Arial, Helvetica,
            sans-serif; font-size: 12pt; color: rgb(0, 0, 0);
            background-color: rgba(0, 0, 0, 0);">you misunderstood
            background about this case.</span></div>
        <div style="font-family: Calibri, Arial, Helvetica, sans-serif;
          font-size: 12pt; color: rgb(0, 0, 0);" class="elementToProof">
          <span style="font-family: Calibri, Arial, Helvetica,
            sans-serif; font-size: 12pt; color: rgb(0, 0, 0);
            background-color: rgba(0, 0, 0, 0);"><br>
          </span></div>
        <div style="font-family: Calibri, Arial, Helvetica, sans-serif;
          font-size: 12pt; color: rgb(0, 0, 0);" class="elementToProof">
          <span style="font-family: Calibri, Arial, Helvetica,
            sans-serif; font-size: 12pt; color: rgb(0, 0, 0);
            background-color: rgba(0, 0, 0, 0);">a</span><span
            style="color: rgb(0, 0, 0); font-family: Calibri, Arial,
            Helvetica, sans-serif; font-size: 12pt; background-color:
            rgba(0, 0, 0, 0);">lthough we expect this test case to fail,
            it should fail at the location where the Bo actual memory is
            actually allocated. now the code logic will cause the
            failure to allocate memory to store DMA address.</span></div>
        <div style="font-family: Calibri, Arial, Helvetica, sans-serif;
          font-size: 12pt; color: rgb(0, 0, 0);" class="elementToProof">
          <span style="color: rgb(0, 0, 0); font-family: Calibri, Arial,
            Helvetica, sans-serif; font-size: 12pt; background-color:
            rgba(0, 0, 0, 0);"><br>
          </span></div>
        <div style="font-family: Calibri, Arial, Helvetica, sans-serif;
          font-size: 12pt; color: rgb(0, 0, 0);" class="elementToProof">
          <span style="color: rgb(0, 0, 0); font-family: Calibri, Arial,
            Helvetica, sans-serif; font-size: 12pt; background-color:
            rgba(0, 0, 0, 0);"><span style="background-color:rgb(255,
              255, 255);display:inline !important">e.g: </span>the case
            is failed in 2TB system ram machine, it should be allocated
            successful, but it is failed.</span></div>
        <div style="font-family: Calibri, Arial, Helvetica, sans-serif;
          font-size: 12pt; color: rgb(0, 0, 0);" class="elementToProof">
          <span style="color: rgb(0, 0, 0); font-family: Calibri, Arial,
            Helvetica, sans-serif; font-size: 12pt;"><br>
          </span></div>
        <div style="font-family: Calibri, Arial, Helvetica, sans-serif;
          font-size: 12pt; color: rgb(0, 0, 0);" class="elementToProof">
          <span style="color: rgb(0, 0, 0); font-family: Calibri, Arial,
            Helvetica, sans-serif; font-size: 12pt; background-color:
            rgba(0, 0, 0, 0);">allocate 1TB BO, the ttm should allocate
            1TB/4k * 8 buffer to store allocate result (page address),
            this should not be failed usually.</span></div>
        <div style="font-family: Calibri, Arial, Helvetica, sans-serif;
          font-size: 12pt; color: rgb(0, 0, 0);" class="elementToProof">
          <span style="color: rgb(0, 0, 0); font-size: 12pt;
            background-color: rgba(0, 0, 0, 0); font-family: Calibri,
            Arial, Helvetica, sans-serif;"><br>
          </span></div>
        <div style="font-family: Calibri, Arial, Helvetica, sans-serif;
          font-size: 12pt; color: rgb(0, 0, 0);" class="elementToProof">
          <span style="color: rgb(0, 0, 0); font-size: 12pt;
            background-color: rgba(0, 0, 0, 0); font-family: Calibri,
            Arial, Helvetica, sans-serif;">There is a similar fix in
            upstream kernel 5.18, b</span><span style="color: rgb(0, 0,
            0); font-size: 12pt; background-color: rgba(0, 0, 0, 0);
            font-family: Calibri, Arial, Helvetica, sans-serif;">efore
            this fix entered the TTM code, this problem existed in TTM.</span></div>
        <div style="font-family: Calibri, Arial, Helvetica, sans-serif;
          font-size: 12pt; color: rgb(0, 0, 0);" class="elementToProof">
          <span style="color: rgb(0, 0, 0); font-size: 12pt;
            background-color: rgba(0, 0, 0, 0); font-family: Calibri,
            Arial, Helvetica, sans-serif;"><br>
          </span></div>
        <div style="font-family: Calibri, Arial, Helvetica, sans-serif;
          font-size: 12pt; color: rgb(0, 0, 0);" class="elementToProof">
          <span style="color: rgb(0, 0, 0); font-size: 12pt;
            background-color: rgba(0, 0, 0, 0); font-family: Calibri,
            Arial, Helvetica, sans-serif;"><a
href="https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?h=v5.18-rc3&amp;id=a421ef303008b0ceee2cfc625c3246fa7654b0ca"
              id="LPlnk660272" moz-do-not-send="true">kernel/git/torvalds/linux.git
              - Linux kernel source tree</a><br>
          </span></div>
        <div style="font-family: Calibri, Arial, Helvetica, sans-serif;
          font-size: 12pt; color: rgb(0, 0, 0);" class="elementToProof">
          <span class="commit-subject" style="font-size: 12pt; margin:
            1.5em 0em 0.5em; padding: 0em; color: rgb(0, 0, 0);
            font-family: Calibri, Arial, Helvetica, sans-serif;
            background-color: rgb(255, 255, 255);">mm: allow !GFP_KERNEL
            allocations for kvmalloc</span><br>
        </div>
        <div style="font-family: Calibri, Arial, Helvetica, sans-serif;
          font-size: 12pt; color: rgb(0, 0, 0);" class="elementToProof">
          <div><br>
          </div>
          <span style="font-family: Calibri, Arial, Helvetica,
            sans-serif; font-size: 12pt; color: rgb(0, 0, 0);
            background-color: rgba(0, 0, 0, 0);">Best Regards,</span></div>
        <div style="font-family: Calibri, Arial, Helvetica, sans-serif;
          font-size: 12pt; color: rgb(0, 0, 0);" class="elementToProof">
          <span style="font-family: Calibri, Arial, Helvetica,
            sans-serif; font-size: 12pt; color: rgb(0, 0, 0);
            background-color: rgba(0, 0, 0, 0);">Kevin</span><br>
          <div><br>
          </div>
        </div>
        <hr tabindex="-1" style="display:inline-block; width:98%">
        <div id="divRplyFwdMsg" dir="ltr"><font style="font-size:11pt"
            face="Calibri, sans-serif" color="#000000"><b>From:</b>
            Koenig, Christian <a class="moz-txt-link-rfc2396E" href="mailto:Christian.Koenig@amd.com">&lt;Christian.Koenig@amd.com&gt;</a><br>
            <b>Sent:</b> Wednesday, April 20, 2022 6:53 PM<br>
            <b>To:</b> Wang, Yang(Kevin) <a class="moz-txt-link-rfc2396E" href="mailto:KevinYang.Wang@amd.com">&lt;KevinYang.Wang@amd.com&gt;</a>;
            <a class="moz-txt-link-abbreviated" href="mailto:dri-devel@lists.freedesktop.org">dri-devel@lists.freedesktop.org</a>
            <a class="moz-txt-link-rfc2396E" href="mailto:dri-devel@lists.freedesktop.org">&lt;dri-devel@lists.freedesktop.org&gt;</a>;
            <a class="moz-txt-link-abbreviated" href="mailto:amd-gfx@lists.freedesktop.org">amd-gfx@lists.freedesktop.org</a>
            <a class="moz-txt-link-rfc2396E" href="mailto:amd-gfx@lists.freedesktop.org">&lt;amd-gfx@lists.freedesktop.org&gt;</a><br>
            <b>Subject:</b> Re: [PATCH] drm/ttm: fix ttm tt init fail
            when size exceeds kmalloc limit</font>
          <div> </div>
        </div>
        <div>Am 20.04.22 um 11:07 schrieb Wang, Yang(Kevin):<br>
          <blockquote type="cite">
            <p style="margin-top: 0px; margin-bottom:
              0px;font-family:Arial; font-size:10pt; color:#0000FF;
              margin:5pt" align="Left">
              [AMD Official Use Only]<br>
            </p>
            <br>
            <div>
              <div
                style="font-family:Calibri,Arial,Helvetica,sans-serif;
                font-size:12pt; color:rgb(0,0,0)">
                <br>
              </div>
              <hr tabindex="-1" style="display:inline-block; width:98%">
              <div id="x_divRplyFwdMsg" dir="ltr"><font
                  style="font-size:11pt" face="Calibri, sans-serif"
                  color="#000000"><b>From:</b> Koenig, Christian
                  <a href="mailto:Christian.Koenig@amd.com"
                    data-auth="NotApplicable"
                    class="x_moz-txt-link-rfc2396E"
                    moz-do-not-send="true">
                    &lt;Christian.Koenig@amd.com&gt;</a><br>
                  <b>Sent:</b> Wednesday, April 20, 2022 5:00 PM<br>
                  <b>To:</b> Wang, Yang(Kevin) <a
                    href="mailto:KevinYang.Wang@amd.com"
                    data-auth="NotApplicable"
                    class="x_moz-txt-link-rfc2396E"
                    moz-do-not-send="true">
                    &lt;KevinYang.Wang@amd.com&gt;</a>; <a
                    href="mailto:dri-devel@lists.freedesktop.org"
                    data-auth="NotApplicable"
                    class="x_moz-txt-link-abbreviated
                    moz-txt-link-freetext" moz-do-not-send="true">
                    dri-devel@lists.freedesktop.org</a> <a
                    href="mailto:dri-devel@lists.freedesktop.org"
                    data-auth="NotApplicable"
                    class="x_moz-txt-link-rfc2396E"
                    moz-do-not-send="true">
                    &lt;dri-devel@lists.freedesktop.org&gt;</a>; <a
                    href="mailto:amd-gfx@lists.freedesktop.org"
                    data-auth="NotApplicable"
                    class="x_moz-txt-link-abbreviated
                    moz-txt-link-freetext" moz-do-not-send="true">
                    amd-gfx@lists.freedesktop.org</a> <a
                    href="mailto:amd-gfx@lists.freedesktop.org"
                    data-auth="NotApplicable"
                    class="x_moz-txt-link-rfc2396E"
                    moz-do-not-send="true">
                    &lt;amd-gfx@lists.freedesktop.org&gt;</a><br>
                  <b>Subject:</b> Re: [PATCH] drm/ttm: fix ttm tt init
                  fail when size exceeds kmalloc limit</font>
                <div> </div>
              </div>
              <div class="x_BodyFragment"><font size="2"><span
                    style="font-size:11pt">
                    <div class="x_PlainText x_elementToProof">Am
                      20.04.22 um 10:56 schrieb Yang Wang:<br>
                      &gt; if the __GFP_ZERO is set, the kvmalloc()
                      can't fallback to use vmalloc()<br>
                      <br>
                      Hui what? Why should kvmalloc() not be able to
                      fallback to vmalloc() <br>
                      when __GFP_ZERO is set?<br>
                      <br>
                      And even that is really the case then that sounds
                      like a bug in kvmalloc().</div>
                    <div class="x_PlainText x_elementToProof"><br>
                      Regards,<br>
                      Christian.</div>
                    <div class="x_PlainText x_elementToProof"><br>
                      <div class="x_PlainText" style="margin:0px;
                        background-color:rgb(255,255,255)">[kevin]:</div>
                    </div>
                    <div class="x_PlainText x_elementToProof"><span
                        class="x_PlainText" style="margin:0px;
                        background-color:rgb(255,255,255)">it is really
                        test case from libdrm amdgpu test, which try to
                        allocate a big BO which will cause ttm tt init
                        fail.</span><br>
                    </div>
                  </span></font></div>
            </div>
          </blockquote>
          <br>
          <br>
          LOL! Guys, this test case is intended to fail!<br>
          <b><br>
          </b>The test consists of allocating a buffer so ridiculous
          large that it should never succeed and be rejected by the
          kernel driver.<br>
          <br>
          This patch here is a really clear NAK.<br>
          <br>
          Regards,<br>
          Christian.<br>
          <br>
          <blockquote type="cite">
            <div>
              <div class="x_BodyFragment"><font size="2"><span
                    style="font-size:11pt">
                    <div class="x_PlainText x_elementToProof"><span
                        class="x_PlainText" style="margin:0px;
                        background-color:rgb(255,255,255)">it may be a
                        kvmalloc() bug, and this patch can as a
                        workaround in<span
                          style="background-color:rgb(255,255,255);
                          display:inline!important"> ttm</span> before
                        this issue fix.</span></div>
                    <div class="x_PlainText x_elementToProof"><span
                        class="x_PlainText" style="margin:0px;
                        background-color:rgb(255,255,255)"><br>
                      </span></div>
                    <div class="x_PlainText x_elementToProof"><span
                        class="x_PlainText" style="margin:0px;
                        background-color:rgb(255,255,255)">void
                        *kvmalloc_node(size_t size, gfp_t flags, int
                        node) <br>
                      </span></div>
                    <div class="x_PlainText x_elementToProof"><span
                        class="x_PlainText" style="margin:0px;
                        background-color:rgb(255,255,255)">{</span></div>
                    <div class="x_PlainText x_elementToProof"><span
                        class="x_PlainText" style="margin:0px;
                        background-color:rgb(255,255,255)">...</span></div>
                    <div class="x_PlainText x_elementToProof"><span
                        class="x_PlainText" style="margin:0px;
                        background-color:rgb(255,255,255)">        if
                        ((flags &amp; GFP_KERNEL) != GFP_KERNEL)<br>
                      </span></div>
                    <div class="x_PlainText x_elementToProof"><span
                        class="x_PlainText" style="margin:0px;
                        background-color:rgb(255,255,255)">             
                          return kmalloc_node(size, flags, node);<br>
                      </span></div>
                    <div class="x_PlainText x_elementToProof"><span
                        class="x_PlainText" style="margin:0px;
                        background-color:rgb(255,255,255)">...</span></div>
                    <div class="x_PlainText x_elementToProof"><span
                        class="x_PlainText" style="margin:0px;
                        background-color:rgb(255,255,255)">}</span></div>
                    <div class="x_PlainText x_elementToProof"><br>
                    </div>
                    <div class="x_PlainText x_elementToProof">Best
                      Regards,</div>
                    <div class="x_PlainText x_elementToProof">Kevin<br>
                      <br>
                      &gt; to allocate memory, when request size is
                      exceeds kmalloc limit, it will<br>
                      &gt; cause allocate memory fail.<br>
                      &gt;<br>
                      &gt; e.g: when ttm want to create a BO with 1TB
                      size, it maybe fail.<br>
                      &gt;<br>
                      &gt; Signed-off-by: Yang Wang <a
                        href="mailto:KevinYang.Wang@amd.com"
                        data-auth="NotApplicable"
                        class="x_moz-txt-link-rfc2396E"
                        moz-do-not-send="true">
                        &lt;KevinYang.Wang@amd.com&gt;</a><br>
                      &gt; ---<br>
                      &gt;   drivers/gpu/drm/ttm/ttm_tt.c | 14
                      +++++++++++---<br>
                      &gt;   1 file changed, 11 insertions(+), 3
                      deletions(-)<br>
                      &gt;<br>
                      &gt; diff --git a/drivers/gpu/drm/ttm/ttm_tt.c
                      b/drivers/gpu/drm/ttm/ttm_tt.c<br>
                      &gt; index 79c870a3bef8..9f2f3e576b8d 100644<br>
                      &gt; --- a/drivers/gpu/drm/ttm/ttm_tt.c<br>
                      &gt; +++ b/drivers/gpu/drm/ttm/ttm_tt.c<br>
                      &gt; @@ -97,9 +97,12 @@ int ttm_tt_create(struct
                      ttm_buffer_object *bo, bool zero_alloc)<br>
                      &gt;   static int
                      ttm_tt_alloc_page_directory(struct ttm_tt *ttm)<br>
                      &gt;   {<br>
                      &gt;        ttm-&gt;pages =
                      kvmalloc_array(ttm-&gt;num_pages, sizeof(void*),<br>
                      &gt; -                     GFP_KERNEL |
                      __GFP_ZERO);<br>
                      &gt; +                                
                      GFP_KERNEL);<br>
                      &gt;        if (!ttm-&gt;pages)<br>
                      &gt;                return -ENOMEM;<br>
                      &gt; +<br>
                      &gt; +     memset(ttm-&gt;pages, 0,
                      ttm-&gt;num_pages * sizeof(void *));<br>
                      &gt; +<br>
                      &gt;        return 0;<br>
                      &gt;   }<br>
                      &gt;   <br>
                      &gt; @@ -108,10 +111,12 @@ static int
                      ttm_dma_tt_alloc_page_directory(struct ttm_tt
                      *ttm)<br>
                      &gt;        ttm-&gt;pages =
                      kvmalloc_array(ttm-&gt;num_pages,<br>
                      &gt;                                   
                      sizeof(*ttm-&gt;pages) +<br>
                      &gt;                                   
                      sizeof(*ttm-&gt;dma_address),<br>
                      &gt; -                                 GFP_KERNEL
                      | __GFP_ZERO);<br>
                      &gt; +                                
                      GFP_KERNEL);<br>
                      &gt;        if (!ttm-&gt;pages)<br>
                      &gt;                return -ENOMEM;<br>
                      &gt;   <br>
                      &gt; +     memset(ttm-&gt;pages, 0,
                      ttm-&gt;num_pages * (sizeof(*ttm-&gt;pages) +
                      sizeof(*ttm-&gt;dma_address)));<br>
                      &gt; +<br>
                      &gt;        ttm-&gt;dma_address = (void
                      *)(ttm-&gt;pages + ttm-&gt;num_pages);<br>
                      &gt;        return 0;<br>
                      &gt;   }<br>
                      &gt; @@ -120,9 +125,12 @@ static int
                      ttm_sg_tt_alloc_page_directory(struct ttm_tt *ttm)<br>
                      &gt;   {<br>
                      &gt;        ttm-&gt;dma_address =
                      kvmalloc_array(ttm-&gt;num_pages,<br>
                      &gt;                                         
                      sizeof(*ttm-&gt;dma_address),<br>
                      &gt; -                                      
                      GFP_KERNEL | __GFP_ZERO);<br>
                      &gt; +                                      
                      GFP_KERNEL);<br>
                      &gt;        if (!ttm-&gt;dma_address)<br>
                      &gt;                return -ENOMEM;<br>
                      &gt; +<br>
                      &gt; +     memset(ttm-&gt;dma_address, 0,
                      ttm-&gt;num_pages * sizeof(*ttm-&gt;dma_address));<br>
                      &gt; +<br>
                      &gt;        return 0;<br>
                      &gt;   }<br>
                      &gt;   <br>
                      <br>
                    </div>
                  </span></font></div>
            </div>
          </blockquote>
          <br>
        </div>
      </div>
    </blockquote>
    <br>
  </body>
</html>

--------------LYBMs8nRMbqfj7bmHaOEGth3--
