Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 54AA872E2DD
	for <lists+dri-devel@lfdr.de>; Tue, 13 Jun 2023 14:27:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C2FB10E10C;
	Tue, 13 Jun 2023 12:27:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
 by gabe.freedesktop.org (Postfix) with ESMTP id 43E4B10E10C
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Jun 2023 12:27:19 +0000 (UTC)
Received: from loongson.cn (unknown [10.20.42.43])
 by gateway (Coremail) with SMTP id _____8CxvOqlYIhktqMEAA--.9827S3;
 Tue, 13 Jun 2023 20:27:17 +0800 (CST)
Received: from [10.20.42.43] (unknown [10.20.42.43])
 by localhost.localdomain (Coremail) with SMTP id
 AQAAf8AxauWjYIhkrCQZAA--.6498S3; 
 Tue, 13 Jun 2023 20:27:16 +0800 (CST)
Message-ID: <fc64ebf4-b8ff-5497-cb30-33ef293b62f0@loongson.cn>
Date: Tue, 13 Jun 2023 20:27:15 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH] drm: gem: add an option for supporting the dma-coherent
 hardware.
To: Paul Cercueil <paul@crapouillou.net>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
References: <20230607053053.345101-1-suijingfeng@loongson.cn>
 <d4378aad1cf179d308068ef6072c5c7ff2bf2502.camel@crapouillou.net>
 <6db23d14-652e-4b13-24cb-bfb92fa3faed@loongson.cn>
 <e9714a0c29b1c4268081827571ad2545b0e6d5ec.camel@crapouillou.net>
 <d5494751-0af0-42f6-bcad-f75415e4a6bd@loongson.cn>
 <2dd4c870a5605a79105fb621c97a5f59a18c8c24.camel@crapouillou.net>
Content-Language: en-US
From: Sui Jingfeng <suijingfeng@loongson.cn>
Organization: Loongson
In-Reply-To: <2dd4c870a5605a79105fb621c97a5f59a18c8c24.camel@crapouillou.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf8AxauWjYIhkrCQZAA--.6498S3
X-CM-SenderInfo: xvxlyxpqjiv03j6o00pqjv00gofq/
X-Coremail-Antispam: 1Uk129KBj9fXoWfXw4DKF1fGw1UXFWfJF4fJFc_yoW8Kr48uo
 WUKr13Ja1rJr1UWr1UAw1UJry5Xw1DGrnrJryUJr13Ar1jq3WUJ34UJryUJ3y7Jr18Gr47
 GryUtF15ZFyUJF1rl-sFpf9Il3svdjkaLaAFLSUrUUUU8b8apTn2vfkv8UJUUUU8wcxFpf
 9Il3svdxBIdaVrn0xqx4xG64xvF2IEw4CE5I8CrVC2j2Jv73VFW2AGmfu7bjvjm3AaLaJ3
 UjIYCTnIWjp_UUUOY7kC6x804xWl14x267AKxVWUJVW8JwAFc2x0x2IEx4CE42xK8VAvwI
 8IcIk0rVWrJVCq3wAFIxvE14AKwVWUXVWUAwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xG
 Y2AK021l84ACjcxK6xIIjxv20xvE14v26r4j6ryUM28EF7xvwVC0I7IYx2IY6xkF7I0E14
 v26r4j6F4UM28EF7xvwVC2z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIEc7CjxVAF
 wI0_Cr1j6rxdM2kKe7AKxVWUXVWUAwAS0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07
 AIYIkI8VC2zVCFFI0UMc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWU
 AVWUtwAv7VC2z280aVAFwI0_Gr1j6F4UJwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64
 vIr41lc7I2V7IY0VAS07AlzVAYIcxG8wCY1x0262kKe7AKxVWUAVWUtwCF04k20xvY0x0E
 wIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwCFI7km07C267AKxVWUXVWUAwC20s026c02F4
 0E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFyl
 IxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxV
 AFwI0_Jr0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26F4j
 6r4UJwCI42IY6I8E87Iv6xkF7I0E14v26r4UJVWxJrUvcSsGvfC2KfnxnUUI43ZEXa7IU8
 9SdDUUUUU==
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
Cc: linux-renesas-soc@vger.kernel.org, loongson-kernel@lists.loongnix.cn,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-mips@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On 2023/6/8 00:12, Paul Cercueil wrote:
> Hi Sui,
>
> Le mercredi 07 juin 2023 à 22:38 +0800, Sui Jingfeng a écrit :
>> Hi,  welcome to discussion.
>>
>>
>> I have limited skills in manipulating English.
>>
>> It may not express what I'm really means in the short time.
>>
>> Part of word in the sentence may not as accurate as your.
>>
>> Well, please don't misunderstand, I'm not doing the rude to you.
> No problem.
>
>> I will explain it with more details.
>>
>> See below:
>>
>>
>> On 2023/6/7 20:09, Paul Cercueil wrote:
>>> Hi Sui,
>>>
>>> Le mercredi 07 juin 2023 à 18:30 +0800, Sui Jingfeng a écrit :
>>>> Hi,
>>>>
>>>>
>>>> On 2023/6/7 17:36, Paul Cercueil wrote:
>>>>> Hi Sui,
>>>>>
>>>>> Le mercredi 07 juin 2023 à 13:30 +0800, Sui Jingfeng a écrit :
>>>>>> The single map_noncoherent member of struct
>>>>>> drm_gem_dma_object
>>>>>> may
>>>>>> not
>>>>>> sufficient for describing the backing memory of the GEM
>>>>>> buffer
>>>>>> object.
>>>>>>
>>>>>> Especially on dma-coherent systems, the backing memory is
>>>>>> both
>>>>>> cached
>>>>>> coherent for multi-core CPUs and dma-coherent for peripheral
>>>>>> device.
>>>>>> Say architectures like X86-64, LoongArch64, Loongson Mips64,
>>>>>> etc.
>>>>>>
>>>>>> Whether a peripheral device is dma-coherent or not can be
>>>>>> implementation-dependent. The single map_noncoherent option
>>>>>> is
>>>>>> not
>>>>>> enough
>>>>>> to reflect real hardware anymore. For example, the Loongson
>>>>>> LS3A4000
>>>>>> CPU
>>>>>> and LS2K2000/LS2K1000 SoC, peripheral device of such hardware
>>>>>> platform
>>>>>> allways snoop CPU's cache. Doing the allocation with
>>>>>> dma_alloc_coherent
>>>>>> function is preferred. The return buffer is cached, it should
>>>>>> not
>>>>>> using
>>>>>> the default write-combine mapping. While with the current
>>>>>> implement,
>>>>>> there
>>>>>> no way to tell the drm core to reflect this.
>>>>>>
>>>>>> This patch adds cached and coherent members to struct
>>>>>> drm_gem_dma_object.
>>>>>> which allow driver implements to inform the core. Introducing
>>>>>> new
>>>>>> mappings
>>>>>> while keeping the original default behavior unchanged.
>>>>> Did you try to simply set the "dma-coherent" property to the
>>>>> device's
>>>>> node?
>>>> But this approach can only be applied for the device driver with
>>>> DT
>>>> support.
>>>>
>>>> X86-64, Loongson ls3a4000 mips64, Loongson ls3a5000 CPU typically
>>>> do
>>>> not
>>>> have DT support.
>>>>
>>>> They using ACPI to pass parameter from the firmware to Linux
>>>> kernel.
>>>>
>>>> You approach will lost the effectiveness on such a case.
>>> Well, I don't really know how ACPI handles it - but it should just
>>> be a
>>> matter of setting dev->dma_coherent. That's basically what the DT
>>> code
>>> does.
>>>
>>> Some MIPS boards set it in their setup code for instance.
>>>
>> This is a *strategy*, not a *mechanism*.
>>
>> In this case, DT is just used to describing the hardware.
>>
>> (It is actually a hardware feature describing language, the
>> granularity
>> is large)
>>
>> It does not changing the state of the hardware.
>>
>> It's your platform firmware or kernel setting up code who actually do
>> such a things.
>>
>>
>> It's just that it works on *one* platform, it does not guarantee it
>> will
>> works on others.
> If you add the "dma-coherent" property in a device node in DT, you
> effectively specify that the device is DMA-coherent; so you describe
> the hardware, which is what DT is for, and you are not changing the
> state of the hardware.
>
> Note that some MIPS platforms (arch/mips/alchemy/common/setup.c)
> default to DMA-coherent mapping; I believe you could do something
> similar with your Loongson LS3A4000 CPU and LS2K2000/LS2K1000 SoC.
>
>
>> While my patch is trying to create a *mechanism* which could probably
>>
>> works on all platform.
>>
>>
>> It is based the patch you have already commuted.
>>
>> Thanks for your excellent contribution.
>>
>>
>>>>>    From what I understand if you add that property then Linux
>>>>> will
>>>>> use DMA
>>>>> coherent memory even though you use dma_alloc_noncoherent() and
>>>>> the
>>>>> sync_single_for_cpu() / sync_single_for_device() are then NOPs.
>>>> Please do not mitigate the problems with confusing method.
>>>>
>>>>
>>>> This approach not only tend to generate confusion but also
>>>> implement-dependent
>>>>
>>>> and arch-dependent. It's definitely problematic.
>>>>
>>>>
>>>> How does the dma_alloc_coherent/dma_alloc_noncoherent is a ARCH
>>>> specific
>>>> thing.
>>>>
>>>> Dependent on how does the arch_dma_ops is implemented.
>>>>
>>>>
>>>> The definition of the coherent on different ARCH has different
>>>> meanings.
>>>>
>>>> The definition of the wirte-combine on different ARCH has
>>>> different
>>>> meanings.
>>>>
>>>>
>>>> The wirte-combine(uncache acceleration) on mips is non dma-
>>>> coherent.
>>> It is dma-coherent on Ingenic SoCs.
>>>
>>>
>> It is dma-coherent ? How does it achieve it?
>>
>>
>> As far as I know,  there is a write buffer within the mips cpu.
>>
>> typically 64 byte,  but it is not cache. It will gather the CPU write
>> access,
>>
>> When a peripheral device do the DMA, how does you platform guarantee
>>
>> the data in the CPU write buffer has been already arrived at (or
>> flushed
>> out to)
>>
>> the system RAM?
>>
>>
>> Does the  peripheral device snoop the CPU's write buffer,
>>
>> or it need manually flush the write buffer with SYNC instruction?
> I believe the DMA flushes the write buffer? I don't actually know the
> details, it would be something to ask to Ingenic.
>
>>>> But on arm, It seem that wirte-combine is coherent. (guaranteed
>>>> by
>>>> arch
>>>> implement).
>>>>
>>>>
>>>> I also heard using dma_alloc_coherent  to allocation the buffer
>>>> for
>>>> the
>>>> non-coherent doesn't hurt, but the reverse is not true.
>>>>
>>>>
>>>> But please do not create confusion.
>>>>
>>>> software composite is faster because better cacheusing rate and
>>>>
>>>> cache is faster to read.
>>>>
>>>> It is faster because it is cached, not because it is non-
>>>> coherent.
>>>>
>>>> non-coherent is arch thing and/or driver-side thing,
>>>>
>>>> it is a side effect of  using the cached mapping.
>>> Yes, I know that.
>>>
>>>> It should left to driver to handle such a side effect. The device
>>>> driver
>>>>
>>>> know their device, so its the device driver's responsibility to
>>>> maintain
>>>> the coherency.  On loongson platform, we don't need to call
>>>> drm_fb_dma_sync_non_coherent() function, Its already guaranteed
>>>> by
>>>> hardware.
>>> I understand. What I'm saying, is that you should be able to set
>>> dma_obj->map_noncoherent (which would arguably be better named
>>> "map_cached",
>> My point is that the word *cached* reflect the nature,
>>
>> dma-coherent or dma-noncoherent is secondary.
>>
>> We are all on the way to pursue the performance.
>>
>> In the end, it is the cache give us the speed.
>>
>>
>> Why not we credit the cache hardware inside of the CPU?
> dma_alloc_noncoherent() gives you *cached* memory.
>
> Therefore, if you want *cached* memory, you should set
> gem->map_noncoherent.
>
> I understand your confusion; it would be easier to understand if this
> function was called dma_alloc_cached().
>
> Then, if the memory is actually DMA-coherent for the device (dev-
>> dma_coherent == true), the drm_fb_dma_sync_non_coherent() function is
> a no-op.
>
> But in both cases (DMA-coherent device, non DMA-coherent device), if
> you want cached buffers, you should call dma_alloc_noncoherent().
>
>
>>> but that's a different problem). Then the GEM code would
>>> end up calling dma_alloc_noncoherent(), which will give you
>>> *cached*
>>> memory. Then as long as dev->dma_coherent = true,
>>> drm_fb_dma_sync_non_coherent() should be a NOP - so you wouldn't
>>> pointlessly sync/invalidate the caches.
>>>
>>> And I disagree with you, the driver shouldn't handle such things.
>> You already handle the side effect of such things, See below:
>>
>>
>> ```
>>
>>      if (ingenic_drm_map_noncoherent(ipu->master))
>>           drm_fb_dma_sync_non_coherent(ipu->drm, oldstate, newstate);
>>
>> ```
>>
>> By the way,  Ingenic is the only driver in the drivers/gpu/drm/ that
>> handle such things
>>
>> so far.
> Yes; and now I think that this was a bad idea (for the reasons Maxime
> listed in his email).
>
>>>    The
>>> fact that it is better to use cached memory or uncached with write-
>>> combine really is platform-specific and not something that the
>>> driver
>>> should be aware of.
>> But the fact is that,  It is drm/ingenic tell the drm core,  some SoC
>> is
>> prefer cached,
>>
>> but unable to enforce the coherent. So that it need  flush the cache
>> manually.
>>
>> What do you meant by saying that the driver should not be aware of ?
> Ideally, the driver should just call a function "dma_alloc_buffer",
> which would return cached memory when it makes sense, otherwise a
> uncached buffer with the write-combine attribute.
>
> Then the arch code (or DT) can decide what's the best setting, and not
> the driver.
>
> In the meantime, you should use gem->dma_noncoherent like the ingenic-
> drm driver does - until somebody (probably me) refactor things.

ingenic-drm using fbdev-generic, while fbdev-generic allocate a shadow 
buffer in the system

RAM, it will copy the damaged area from the system RAM to the real 
framebuffer at a regular

interval. But fbdev-generic does not flush the cached when doing the 
dirty update.


Now that ingenic display controller is not hardware maintained cache 
coherency,

in this case, I think there will some framebuffer data stall in the 
hardware cache,

there will be artificial visible because lost of consistency when switch 
to the

virtual terminal(using fbcon).  Am I right ?


Paul,  can you confirm that?

> Cheers,
> -Paul
>
>>> Cheers,
>>> -Paul
>>>
>>>>> Cheers,
>>>>> -Paul
>>>>>
>>>>>> Signed-off-by: Sui Jingfeng <suijingfeng@loongson.cn>
>>>>>> ---
>>>>>>     drivers/gpu/drm/drm_fb_dma_helper.c       | 11 +++++------
>>>>>>     drivers/gpu/drm/drm_fbdev_dma.c           |  2 +-
>>>>>>     drivers/gpu/drm/drm_gem_dma_helper.c      | 20
>>>>>> ++++++++++++++++----
>>>>>>     drivers/gpu/drm/ingenic/ingenic-drm-drv.c |  5 ++++-
>>>>>>     drivers/gpu/drm/rcar-du/Kconfig           |  2 --
>>>>>>     drivers/gpu/drm/rcar-du/rcar_du_kms.c     |  4 +++-
>>>>>>     include/drm/drm_gem_dma_helper.h          |  7 +++++--
>>>>>>     7 files changed, 34 insertions(+), 17 deletions(-)
>>>>>>
>>>>>> diff --git a/drivers/gpu/drm/drm_fb_dma_helper.c
>>>>>> b/drivers/gpu/drm/drm_fb_dma_helper.c
>>>>>> index 3b535ad1b07c..93ff05041192 100644
>>>>>> --- a/drivers/gpu/drm/drm_fb_dma_helper.c
>>>>>> +++ b/drivers/gpu/drm/drm_fb_dma_helper.c
>>>>>> @@ -106,16 +106,15 @@ dma_addr_t
>>>>>> drm_fb_dma_get_gem_addr(struct
>>>>>> drm_framebuffer *fb,
>>>>>>     EXPORT_SYMBOL_GPL(drm_fb_dma_get_gem_addr);
>>>>>>     
>>>>>>     /**
>>>>>> - * drm_fb_dma_sync_non_coherent - Sync GEM object to non-
>>>>>> coherent
>>>>>> backing
>>>>>> - *     memory
>>>>>> + * drm_fb_dma_sync_non_coherent - Sync GEM object to cached
>>>>>> backing
>>>>>> memory
>>>>>>      * @drm: DRM device
>>>>>>      * @old_state: Old plane state
>>>>>>      * @state: New plane state
>>>>>>      *
>>>>>>      * This function can be used by drivers that use damage
>>>>>> clips
>>>>>> and
>>>>>> have
>>>>>> - * DMA GEM objects backed by non-coherent memory. Calling
>>>>>> this
>>>>>> function
>>>>>> - * in a plane's .atomic_update ensures that all the data in
>>>>>> the
>>>>>> backing
>>>>>> - * memory have been written to RAM.
>>>>>> + * DMA GEM objects backed by cached memory. Calling this
>>>>>> function in
>>>>>> a
>>>>>> + * plane's .atomic_update ensures that all the data in the
>>>>>> backing
>>>>>> memory
>>>>>> + * have been written to RAM.
>>>>>>      */
>>>>>>     void drm_fb_dma_sync_non_coherent(struct drm_device *drm,
>>>>>>                                      struct drm_plane_state
>>>>>> *old_state,
>>>>>> @@ -131,7 +130,7 @@ void drm_fb_dma_sync_non_coherent(struct
>>>>>> drm_device *drm,
>>>>>>     
>>>>>>            for (i = 0; i < finfo->num_planes; i++) {
>>>>>>                    dma_obj = drm_fb_dma_get_gem_obj(state->fb,
>>>>>> i);
>>>>>> -               if (!dma_obj->map_noncoherent)
>>>>>> +               if (dma_obj->cached && dma_obj->coherent)
>>>>>>                            continue;
>>>>>>     
>>>>>>                    daddr = drm_fb_dma_get_gem_addr(state->fb,
>>>>>> state, i);
>>>>>> diff --git a/drivers/gpu/drm/drm_fbdev_dma.c
>>>>>> b/drivers/gpu/drm/drm_fbdev_dma.c
>>>>>> index d86773fa8ab0..49fe9b284cc8 100644
>>>>>> --- a/drivers/gpu/drm/drm_fbdev_dma.c
>>>>>> +++ b/drivers/gpu/drm/drm_fbdev_dma.c
>>>>>> @@ -131,7 +131,7 @@ static int
>>>>>> drm_fbdev_dma_helper_fb_probe(struct
>>>>>> drm_fb_helper *fb_helper,
>>>>>>     
>>>>>>            /* screen */
>>>>>>            info->flags |= FBINFO_VIRTFB; /* system memory */
>>>>>> -       if (dma_obj->map_noncoherent)
>>>>>> +       if (dma_obj->cached)
>>>>>>                    info->flags |= FBINFO_READS_FAST; /* signal
>>>>>> caching
>>>>>> */
>>>>>>            info->screen_size = sizes->surface_height * fb-
>>>>>>> pitches[0];
>>>>>>            info->screen_buffer = map.vaddr;
>>>>>> diff --git a/drivers/gpu/drm/drm_gem_dma_helper.c
>>>>>> b/drivers/gpu/drm/drm_gem_dma_helper.c
>>>>>> index 870b90b78bc4..dec1d512bdf1 100644
>>>>>> --- a/drivers/gpu/drm/drm_gem_dma_helper.c
>>>>>> +++ b/drivers/gpu/drm/drm_gem_dma_helper.c
>>>>>> @@ -93,7 +93,11 @@ __drm_gem_dma_create(struct drm_device
>>>>>> *drm,
>>>>>> size_t size, bool private)
>>>>>>                    drm_gem_private_object_init(drm, gem_obj,
>>>>>> size);
>>>>>>     
>>>>>>                    /* Always use writecombine for dma-buf
>>>>>> mappings
>>>>>> */
>>>>>> -               dma_obj->map_noncoherent = false;
>>>>>> +               /* FIXME: This is not always true, on some
>>>>>> dma
>>>>>> coherent system,
>>>>>> +                * cached mappings should be preferred over
>>>>>> writecombine
>>>>>> +                */
>>>>>> +               dma_obj->cached = false;
>>>>>> +               dma_obj->coherent = false;
>>>>>>            } else {
>>>>>>                    ret = drm_gem_object_init(drm, gem_obj,
>>>>>> size);
>>>>>>            }
>>>>>> @@ -143,7 +147,11 @@ struct drm_gem_dma_object
>>>>>> *drm_gem_dma_create(struct drm_device *drm,
>>>>>>            if (IS_ERR(dma_obj))
>>>>>>                    return dma_obj;
>>>>>>     
>>>>>> -       if (dma_obj->map_noncoherent) {
>>>>>> +       if (dma_obj->cached && dma_obj->coherent) {
>>>>>> +               dma_obj->vaddr = dma_alloc_coherent(drm->dev,
>>>>>> size,
>>>>>> +                                                   &dma_obj-
>>>>>>> dma_addr,
>>>>>> +
>>>>>> GFP_KERNEL |
>>>>>> __GFP_NOWARN);
>>>>>> +       } else if (dma_obj->cached && !dma_obj->coherent) {
>>>>>>                    dma_obj->vaddr = dma_alloc_noncoherent(drm-
>>>>>>> dev,
>>>>>> size,
>>>>>>                                                          
>>>>>> &dma_obj-
>>>>>>> dma_addr,
>>>>>>                                                          
>>>>>> DMA_TO_DEVICE,
>>>>>> @@ -153,6 +161,7 @@ struct drm_gem_dma_object
>>>>>> *drm_gem_dma_create(struct drm_device *drm,
>>>>>>                                                  &dma_obj-
>>>>>>> dma_addr,
>>>>>>                                                  GFP_KERNEL |
>>>>>> __GFP_NOWARN);
>>>>>>            }
>>>>>> +
>>>>>>            if (!dma_obj->vaddr) {
>>>>>>                    drm_dbg(drm, "failed to allocate buffer
>>>>>> with
>>>>>> size
>>>>>> %zu\n",
>>>>>>                             size);
>>>>>> @@ -233,7 +242,10 @@ void drm_gem_dma_free(struct
>>>>>> drm_gem_dma_object
>>>>>> *dma_obj)
>>>>>>                            dma_buf_vunmap_unlocked(gem_obj-
>>>>>>> import_attach->dmabuf, &map);
>>>>>>                    drm_prime_gem_destroy(gem_obj, dma_obj-
>>>>>>> sgt);
>>>>>>            } else if (dma_obj->vaddr) {
>>>>>> -               if (dma_obj->map_noncoherent)
>>>>>> +               if (dma_obj->cached && dma_obj->coherent)
>>>>>> +                       dma_free_coherent(gem_obj->dev->dev,
>>>>>> dma_obj-
>>>>>>> base.size,
>>>>>> +                                         dma_obj->vaddr,
>>>>>> dma_obj-
>>>>>>> dma_addr);
>>>>>> +               else if (dma_obj->cached && !dma_obj-
>>>>>>> coherent)
>>>>>>                            dma_free_noncoherent(gem_obj->dev-
>>>>>>> dev,
>>>>>> dma_obj->base.size,
>>>>>>                                                 dma_obj-
>>>>>>> vaddr,
>>>>>> dma_obj-
>>>>>>> dma_addr,
>>>>>>                                                
>>>>>> DMA_TO_DEVICE);
>>>>>> @@ -532,7 +544,7 @@ int drm_gem_dma_mmap(struct
>>>>>> drm_gem_dma_object
>>>>>> *dma_obj, struct vm_area_struct *
>>>>>>            vma->vm_pgoff -= drm_vma_node_start(&obj-
>>>>>>> vma_node);
>>>>>>            vm_flags_mod(vma, VM_DONTEXPAND, VM_PFNMAP);
>>>>>>     
>>>>>> -       if (dma_obj->map_noncoherent) {
>>>>>> +       if (dma_obj->cached) {
>>>>>>                    vma->vm_page_prot = vm_get_page_prot(vma-
>>>>>>> vm_flags);
>>>>>>     
>>>>>>                    ret = dma_mmap_pages(dma_obj->base.dev-
>>>>>>> dev,
>>>>>> diff --git a/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
>>>>>> b/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
>>>>>> index 5ec75e9ba499..a3df2f99a757 100644
>>>>>> --- a/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
>>>>>> +++ b/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
>>>>>> @@ -919,7 +919,10 @@ ingenic_drm_gem_create_object(struct
>>>>>> drm_device
>>>>>> *drm, size_t size)
>>>>>>            if (!obj)
>>>>>>                    return ERR_PTR(-ENOMEM);
>>>>>>     
>>>>>> -       obj->map_noncoherent = priv->soc_info-
>>>>>>> map_noncoherent;
>>>>>> +       if (priv->soc_info->map_noncoherent) {
>>>>>> +               obj->cached = true;
>>>>>> +               obj->coherent = false;
>>>>>> +       }
>>>>>>     
>>>>>>            return &obj->base;
>>>>>>     }
>>>>>> diff --git a/drivers/gpu/drm/rcar-du/Kconfig
>>>>>> b/drivers/gpu/drm/rcar-
>>>>>> du/Kconfig
>>>>>> index 53c356aed5d5..dddc70c08bdc 100644
>>>>>> --- a/drivers/gpu/drm/rcar-du/Kconfig
>>>>>> +++ b/drivers/gpu/drm/rcar-du/Kconfig
>>>>>> @@ -2,8 +2,6 @@
>>>>>>     config DRM_RCAR_DU
>>>>>>            tristate "DRM Support for R-Car Display Unit"
>>>>>>            depends on DRM && OF
>>>>>> -       depends on ARM || ARM64
>>>>>> -       depends on ARCH_RENESAS || COMPILE_TEST
>>>>>>            select DRM_KMS_HELPER
>>>>>>            select DRM_GEM_DMA_HELPER
>>>>>>            select VIDEOMODE_HELPERS
>>>>>> diff --git a/drivers/gpu/drm/rcar-du/rcar_du_kms.c
>>>>>> b/drivers/gpu/drm/rcar-du/rcar_du_kms.c
>>>>>> index adfb36b0e815..1142d51473e6 100644
>>>>>> --- a/drivers/gpu/drm/rcar-du/rcar_du_kms.c
>>>>>> +++ b/drivers/gpu/drm/rcar-du/rcar_du_kms.c
>>>>>> @@ -386,7 +386,9 @@ struct drm_gem_object
>>>>>> *rcar_du_gem_prime_import_sg_table(struct drm_device *dev,
>>>>>>            gem_obj->funcs = &rcar_du_gem_funcs;
>>>>>>     
>>>>>>            drm_gem_private_object_init(dev, gem_obj, attach-
>>>>>>> dmabuf-
>>>>>>> size);
>>>>>> -       dma_obj->map_noncoherent = false;
>>>>>> +
>>>>>> +       dma_obj->cached = false;
>>>>>> +       dma_obj->coherent = false;
>>>>>>     
>>>>>>            ret = drm_gem_create_mmap_offset(gem_obj);
>>>>>>            if (ret) {
>>>>>> diff --git a/include/drm/drm_gem_dma_helper.h
>>>>>> b/include/drm/drm_gem_dma_helper.h
>>>>>> index 8a043235dad8..585ce3d4d1eb 100644
>>>>>> --- a/include/drm/drm_gem_dma_helper.h
>>>>>> +++ b/include/drm/drm_gem_dma_helper.h
>>>>>> @@ -16,7 +16,9 @@ struct drm_mode_create_dumb;
>>>>>>      *       more than one entry but they are guaranteed to
>>>>>> have
>>>>>> contiguous
>>>>>>      *       DMA addresses.
>>>>>>      * @vaddr: kernel virtual address of the backing memory
>>>>>> - * @map_noncoherent: if true, the GEM object is backed by
>>>>>> non-
>>>>>> coherent memory
>>>>>> + * @cached: if true, the GEM object is backed by cached
>>>>>> memory
>>>>>> + * @coherent: This option only meaningful when a GEM object
>>>>>> is
>>>>>> cached.
>>>>>> + *            If true, Sync the GEM object for DMA access is
>>>>>> not
>>>>>> required.
>>>>>>      */
>>>>>>     struct drm_gem_dma_object {
>>>>>>            struct drm_gem_object base;
>>>>>> @@ -26,7 +28,8 @@ struct drm_gem_dma_object {
>>>>>>            /* For objects with DMA memory allocated by GEM DMA
>>>>>> */
>>>>>>            void *vaddr;
>>>>>>     
>>>>>> -       bool map_noncoherent;
>>>>>> +       bool cached;
>>>>>> +       bool coherent;
>>>>>>     };
>>>>>>     
>>>>>>     #define to_drm_gem_dma_obj(gem_obj) \

-- 
Jingfeng

