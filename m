Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 62B17158619
	for <lists+dri-devel@lfdr.de>; Tue, 11 Feb 2020 00:17:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 93FE76ED79;
	Mon, 10 Feb 2020 23:17:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from hqnvemgate25.nvidia.com (hqnvemgate25.nvidia.com
 [216.228.121.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 28AD56ED74;
 Mon, 10 Feb 2020 23:17:32 +0000 (UTC)
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate25.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5e41e4700000>; Mon, 10 Feb 2020 15:17:04 -0800
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate102.nvidia.com (PGP Universal service);
 Mon, 10 Feb 2020 15:17:31 -0800
X-PGP-Universal: processed;
 by hqpgpgate102.nvidia.com on Mon, 10 Feb 2020 15:17:31 -0800
Received: from [172.20.40.96] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 10 Feb
 2020 23:17:31 +0000
Subject: Re: [Nouveau] [PATCH 4/4] drm/nouveau: Remove struct
 nouveau_framebuffer
To: Thomas Zimmermann <tzimmermann@suse.de>, Ben Skeggs <skeggsb@gmail.com>
References: <20200206101942.1412-1-tzimmermann@suse.de>
 <20200206101942.1412-5-tzimmermann@suse.de>
 <616dead7-030a-b678-3040-9e317549812e@nvidia.com>
 <5d0bc649-9d82-295e-fe00-58e9350f6d94@suse.de>
 <5d18f259-9d1c-2b83-428d-6e21b6cf779c@nvidia.com>
 <9695f3cf-076a-de49-53c9-75944bb4fb8b@nvidia.com>
 <CACAvsv6tVhmHFR=T=L5SyjO3u6-U6_x2pEdHzR+03LZY8NNEkw@mail.gmail.com>
 <9a310fff-4b01-b215-5553-acebd8d2d8e8@suse.de>
X-Nvconfidentiality: public
From: James Jones <jajones@nvidia.com>
Message-ID: <85b64078-706a-e12e-6ced-3c8566ddc2bd@nvidia.com>
Date: Mon, 10 Feb 2020 15:18:34 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <9a310fff-4b01-b215-5553-acebd8d2d8e8@suse.de>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL105.nvidia.com (172.20.187.12) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Language: en-US
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1581376624; bh=xf/no9AVx/bQT6IWg8kTwAJjeClpEDaCqSqqNHS7PWU=;
 h=X-PGP-Universal:Subject:To:CC:References:X-Nvconfidentiality:From:
 Message-ID:Date:User-Agent:MIME-Version:In-Reply-To:
 X-Originating-IP:X-ClientProxiedBy:Content-Type:Content-Language:
 Content-Transfer-Encoding;
 b=dfniWbjOGIj08CaWa8lhLh1cmEk+Tlv79cDBW4fA4sSZWjlWkjawpOJovnQXrz3uX
 IVM1PAIemMz2abWuOT4nUkZLqMhRC1HATQlKYw8hTb6wVVhR/NLzN7uKT2XVVrAV6q
 F4A4jsyKh3fcyLcIVy+GIpCyCXrGmITB+gxG9Df+uMaIEaW9cpWKAKAiff6Wg6e6cr
 vK4GvpOYV8C1Nl58PyjkfFPoMAtKEkkHfFMneRqAPqWAkKWr/JeJDqCRZj76YWBxhI
 kP2/sNzg+jtXTRem/VwWZVXCpApB12LfiE50ecpWNxupfg/yIEG4l6uxl+Cdh+aMPS
 EvjJwGRzTx7Ag==
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
Cc: Dave Airlie <airlied@linux.ie>, ML nouveau <nouveau@lists.freedesktop.org>,
 ML dri-devel <dri-devel@lists.freedesktop.org>,
 Ben Skeggs <bskeggs@redhat.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2/10/20 12:25 AM, Thomas Zimmermann wrote:
> Hi
> 
> Am 10.02.20 um 09:20 schrieb Ben Skeggs:
>> On Sat, 8 Feb 2020 at 07:10, James Jones <jajones@nvidia.com> wrote:
>>>
>>> I've sent out a v4 version of the format modifier patches which avoid
>>> caching values in the nouveau_framebuffer struct.  It will have a few
>>> trivial conflicts with your series, but should make them structurally
>>> compatible.
>>>
>>> I'm fine with either v3 or v4 of my series personally, but if these
>>> cleanup patches are taken, only v4 will work.
>> I've taken Tomas' cleanup patches in my tree, and will take James'
>> also once they've been fixed up to work on top of the cleanup.
> 
> Thanks!

After applying this series locally, I'm hitting a NULL deref loading the 
nouveau module with fbconsole caused by patch 3/4.  I've sent out a 
trivial fix for review separately.  Please have a look, and Ben, feel 
free to squash it with Thomas's original patch if you prefer.

>>
>> James, are you happy for me to take the drm_fourcc.h patch that's on
>> dri-devel through my tree for the next merge window too?

Yes, that would be great.  I couldn't find a public version of your tree 
with Thomas's patches applied, but I pulled them in locally and rebased 
my series on top of that as v5, resolving all the remaining trivial 
conflicts.  Appologies for all the patch spam this generated.

Thanks,
-James

>> Ben.
>>
>>>
>>> Thanks,
>>> -James
>>>
>>> On 2/6/20 8:45 AM, James Jones wrote:
>>>> Yes, that's certainly viable.  If that's the general preference in
>>>> direction, I'll rework that patches to do so.
>>>>
>>>> Thanks,
>>>> -James
>>>>
>>>> On 2/6/20 7:49 AM, Thomas Zimmermann wrote:
>>>>> Hi James
>>>>>
>>>>> Am 06.02.20 um 16:17 schrieb James Jones:
>>>>>> Note I'm adding some fields to nouveau_framebuffer in the series
>>>>>> "drm/nouveau: Support NVIDIA format modifiers."  I sent out v3 of that
>>>>>> yesterday.  It would probably still be possible to avoid them by
>>>>>> re-extracting the relevant data from the format modifier on the fly when
>>>>>> needed, but it is simpler and likely less error-prone with the wrapper
>>>>>> struct.
>>>>>
>>>>> Thanks for the note.
>>>>>
>>>>> I just took a look at your patchset. I think struct nouveau_framebuffer
>>>>> should not store tile_mode and kind. AFAICT there are only two trivial
>>>>> places where these values are used and they can be extracted from the
>>>>> framebuffer at any time.
>>>>>
>>>>> I'd suggest to expand nouveau_decode_mod() to take a drm_framebuffer and
>>>>> return the correct values. Kind of what you do in
>>>>> nouveau_framebuffer_new() near line 330.
>>>>>
>>>>> Thoughts?
>>>>>
>>>>> Best regards
>>>>> Thomas
>>>>>
>>>>> [1] https://patchwork.freedesktop.org/series/70786/#rev3
>>>>>
>>>>>>
>>>>>> Thanks,
>>>>>> -James
>>>>>>
>>>>>> On 2/6/20 2:19 AM, Thomas Zimmermann wrote:
>>>>>>> After its cleanup, struct nouveau_framebuffer is only a wrapper around
>>>>>>> struct drm_framebuffer. Use the latter directly.
>>>>>>>
>>>>>>> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
>>>>>>> ---
>>>>>>>     drivers/gpu/drm/nouveau/dispnv50/wndw.c   | 26
>>>>>>> +++++++++++------------
>>>>>>>     drivers/gpu/drm/nouveau/nouveau_display.c | 14 ++++++------
>>>>>>>     drivers/gpu/drm/nouveau/nouveau_display.h | 12 +----------
>>>>>>>     drivers/gpu/drm/nouveau/nouveau_fbcon.c   | 14 ++++++------
>>>>>>>     4 files changed, 28 insertions(+), 38 deletions(-)
>>>>>>>
>>>>>>> diff --git a/drivers/gpu/drm/nouveau/dispnv50/wndw.c
>>>>>>> b/drivers/gpu/drm/nouveau/dispnv50/wndw.c
>>>>>>> index ba1399965a1c..4a67a656e007 100644
>>>>>>> --- a/drivers/gpu/drm/nouveau/dispnv50/wndw.c
>>>>>>> +++ b/drivers/gpu/drm/nouveau/dispnv50/wndw.c
>>>>>>> @@ -40,11 +40,11 @@ nv50_wndw_ctxdma_del(struct nv50_wndw_ctxdma
>>>>>>> *ctxdma)
>>>>>>>     }
>>>>>>>       static struct nv50_wndw_ctxdma *
>>>>>>> -nv50_wndw_ctxdma_new(struct nv50_wndw *wndw, struct
>>>>>>> nouveau_framebuffer *fb)
>>>>>>> +nv50_wndw_ctxdma_new(struct nv50_wndw *wndw, struct drm_framebuffer
>>>>>>> *fb)
>>>>>>>     {
>>>>>>> -    struct nouveau_drm *drm = nouveau_drm(fb->base.dev);
>>>>>>> +    struct nouveau_drm *drm = nouveau_drm(fb->dev);
>>>>>>>         struct nv50_wndw_ctxdma *ctxdma;
>>>>>>> -    struct nouveau_bo *nvbo = nouveau_gem_object(fb->base.obj[0]);
>>>>>>> +    struct nouveau_bo *nvbo = nouveau_gem_object(fb->obj[0]);
>>>>>>>         const u8    kind = nvbo->kind;
>>>>>>>         const u32 handle = 0xfb000000 | kind;
>>>>>>>         struct {
>>>>>>> @@ -236,16 +236,16 @@ nv50_wndw_atomic_check_acquire(struct nv50_wndw
>>>>>>> *wndw, bool modeset,
>>>>>>>                        struct nv50_wndw_atom *asyw,
>>>>>>>                        struct nv50_head_atom *asyh)
>>>>>>>     {
>>>>>>> -    struct nouveau_framebuffer *fb =
>>>>>>> nouveau_framebuffer(asyw->state.fb);
>>>>>>> +    struct drm_framebuffer *fb = asyw->state.fb;
>>>>>>>         struct nouveau_drm *drm = nouveau_drm(wndw->plane.dev);
>>>>>>> -    struct nouveau_bo *nvbo = nouveau_gem_object(fb->base.obj[0]);
>>>>>>> +    struct nouveau_bo *nvbo = nouveau_gem_object(fb->obj[0]);
>>>>>>>         int ret;
>>>>>>>           NV_ATOMIC(drm, "%s acquire\n", wndw->plane.name);
>>>>>>>     -    if (asyw->state.fb != armw->state.fb || !armw->visible ||
>>>>>>> modeset) {
>>>>>>> -        asyw->image.w = fb->base.width;
>>>>>>> -        asyw->image.h = fb->base.height;
>>>>>>> +    if (fb != armw->state.fb || !armw->visible || modeset) {
>>>>>>> +        asyw->image.w = fb->width;
>>>>>>> +        asyw->image.h = fb->height;
>>>>>>>             asyw->image.kind = nvbo->kind;
>>>>>>>               ret = nv50_wndw_atomic_check_acquire_rgb(asyw);
>>>>>>> @@ -261,13 +261,13 @@ nv50_wndw_atomic_check_acquire(struct nv50_wndw
>>>>>>> *wndw, bool modeset,
>>>>>>>                     asyw->image.blockh = nvbo->mode >> 4;
>>>>>>>                 else
>>>>>>>                     asyw->image.blockh = nvbo->mode;
>>>>>>> -            asyw->image.blocks[0] = fb->base.pitches[0] / 64;
>>>>>>> +            asyw->image.blocks[0] = fb->pitches[0] / 64;
>>>>>>>                 asyw->image.pitch[0] = 0;
>>>>>>>             } else {
>>>>>>>                 asyw->image.layout = 1;
>>>>>>>                 asyw->image.blockh = 0;
>>>>>>>                 asyw->image.blocks[0] = 0;
>>>>>>> -            asyw->image.pitch[0] = fb->base.pitches[0];
>>>>>>> +            asyw->image.pitch[0] = fb->pitches[0];
>>>>>>>             }
>>>>>>>               if (!asyh->state.async_flip)
>>>>>>> @@ -486,16 +486,16 @@ nv50_wndw_cleanup_fb(struct drm_plane *plane,
>>>>>>> struct drm_plane_state *old_state)
>>>>>>>     static int
>>>>>>>     nv50_wndw_prepare_fb(struct drm_plane *plane, struct drm_plane_state
>>>>>>> *state)
>>>>>>>     {
>>>>>>> -    struct nouveau_framebuffer *fb = nouveau_framebuffer(state->fb);
>>>>>>> +    struct drm_framebuffer *fb = state->fb;
>>>>>>>         struct nouveau_drm *drm = nouveau_drm(plane->dev);
>>>>>>>         struct nv50_wndw *wndw = nv50_wndw(plane);
>>>>>>>         struct nv50_wndw_atom *asyw = nv50_wndw_atom(state);
>>>>>>> -    struct nouveau_bo *nvbo = nouveau_gem_object(state->fb->obj[0]);
>>>>>>> +    struct nouveau_bo *nvbo = nouveau_gem_object(fb->obj[0]);
>>>>>>>         struct nv50_head_atom *asyh;
>>>>>>>         struct nv50_wndw_ctxdma *ctxdma;
>>>>>>>         int ret;
>>>>>>>     -    NV_ATOMIC(drm, "%s prepare: %p\n", plane->name, state->fb);
>>>>>>> +    NV_ATOMIC(drm, "%s prepare: %p\n", plane->name, fb);
>>>>>>>         if (!asyw->state.fb)
>>>>>>>             return 0;
>>>>>>>     diff --git a/drivers/gpu/drm/nouveau/nouveau_display.c
>>>>>>> b/drivers/gpu/drm/nouveau/nouveau_display.c
>>>>>>> index bbbff55eb5d5..94f7fd48e1cf 100644
>>>>>>> --- a/drivers/gpu/drm/nouveau/nouveau_display.c
>>>>>>> +++ b/drivers/gpu/drm/nouveau/nouveau_display.c
>>>>>>> @@ -207,10 +207,10 @@ int
>>>>>>>     nouveau_framebuffer_new(struct drm_device *dev,
>>>>>>>                 const struct drm_mode_fb_cmd2 *mode_cmd,
>>>>>>>                 struct drm_gem_object *gem,
>>>>>>> -            struct nouveau_framebuffer **pfb)
>>>>>>> +            struct drm_framebuffer **pfb)
>>>>>>>     {
>>>>>>>         struct nouveau_drm *drm = nouveau_drm(dev);
>>>>>>> -    struct nouveau_framebuffer *fb;
>>>>>>> +    struct drm_framebuffer *fb;
>>>>>>>         int ret;
>>>>>>>               /* YUV overlays have special requirements pre-NV50 */
>>>>>>> @@ -236,10 +236,10 @@ nouveau_framebuffer_new(struct drm_device *dev,
>>>>>>>         if (!(fb = *pfb = kzalloc(sizeof(*fb), GFP_KERNEL)))
>>>>>>>             return -ENOMEM;
>>>>>>>     -    drm_helper_mode_fill_fb_struct(dev, &fb->base, mode_cmd);
>>>>>>> -    fb->base.obj[0] = gem;
>>>>>>> +    drm_helper_mode_fill_fb_struct(dev, fb, mode_cmd);
>>>>>>> +    fb->obj[0] = gem;
>>>>>>>     -    ret = drm_framebuffer_init(dev, &fb->base,
>>>>>>> &nouveau_framebuffer_funcs);
>>>>>>> +    ret = drm_framebuffer_init(dev, fb, &nouveau_framebuffer_funcs);
>>>>>>>         if (ret)
>>>>>>>             kfree(fb);
>>>>>>>         return ret;
>>>>>>> @@ -250,7 +250,7 @@ nouveau_user_framebuffer_create(struct drm_device
>>>>>>> *dev,
>>>>>>>                     struct drm_file *file_priv,
>>>>>>>                     const struct drm_mode_fb_cmd2 *mode_cmd)
>>>>>>>     {
>>>>>>> -    struct nouveau_framebuffer *fb;
>>>>>>> +    struct drm_framebuffer *fb;
>>>>>>>         struct drm_gem_object *gem;
>>>>>>>         int ret;
>>>>>>>     @@ -260,7 +260,7 @@ nouveau_user_framebuffer_create(struct
>>>>>>> drm_device *dev,
>>>>>>>           ret = nouveau_framebuffer_new(dev, mode_cmd, gem, &fb);
>>>>>>>         if (ret == 0)
>>>>>>> -        return &fb->base;
>>>>>>> +        return fb;
>>>>>>>           drm_gem_object_put_unlocked(gem);
>>>>>>>         return ERR_PTR(ret);
>>>>>>> diff --git a/drivers/gpu/drm/nouveau/nouveau_display.h
>>>>>>> b/drivers/gpu/drm/nouveau/nouveau_display.h
>>>>>>> index 56c1dec8fc28..082bb067d575 100644
>>>>>>> --- a/drivers/gpu/drm/nouveau/nouveau_display.h
>>>>>>> +++ b/drivers/gpu/drm/nouveau/nouveau_display.h
>>>>>>> @@ -8,21 +8,11 @@
>>>>>>>       #include <drm/drm_framebuffer.h>
>>>>>>>     -struct nouveau_framebuffer {
>>>>>>> -    struct drm_framebuffer base;
>>>>>>> -};
>>>>>>> -
>>>>>>> -static inline struct nouveau_framebuffer *
>>>>>>> -nouveau_framebuffer(struct drm_framebuffer *fb)
>>>>>>> -{
>>>>>>> -    return container_of(fb, struct nouveau_framebuffer, base);
>>>>>>> -}
>>>>>>> -
>>>>>>>     int
>>>>>>>     nouveau_framebuffer_new(struct drm_device *dev,
>>>>>>>                 const struct drm_mode_fb_cmd2 *mode_cmd,
>>>>>>>                 struct drm_gem_object *gem,
>>>>>>> -            struct nouveau_framebuffer **pfb);
>>>>>>> +            struct drm_framebuffer **pfb);
>>>>>>>       struct nouveau_display {
>>>>>>>         void *priv;
>>>>>>> diff --git a/drivers/gpu/drm/nouveau/nouveau_fbcon.c
>>>>>>> b/drivers/gpu/drm/nouveau/nouveau_fbcon.c
>>>>>>> index 02b36b44409c..d78bc03ad3b8 100644
>>>>>>> --- a/drivers/gpu/drm/nouveau/nouveau_fbcon.c
>>>>>>> +++ b/drivers/gpu/drm/nouveau/nouveau_fbcon.c
>>>>>>> @@ -312,7 +312,7 @@ nouveau_fbcon_create(struct drm_fb_helper *helper,
>>>>>>>         struct nouveau_drm *drm = nouveau_drm(dev);
>>>>>>>         struct nvif_device *device = &drm->client.device;
>>>>>>>         struct fb_info *info;
>>>>>>> -    struct nouveau_framebuffer *fb;
>>>>>>> +    struct drm_framebuffer *fb;
>>>>>>>         struct nouveau_channel *chan;
>>>>>>>         struct nouveau_bo *nvbo;
>>>>>>>         struct drm_mode_fb_cmd2 mode_cmd;
>>>>>>> @@ -367,7 +367,7 @@ nouveau_fbcon_create(struct drm_fb_helper *helper,
>>>>>>>         }
>>>>>>>           /* setup helper */
>>>>>>> -    fbcon->helper.fb = &fb->base;
>>>>>>> +    fbcon->helper.fb = fb;
>>>>>>>           if (!chan)
>>>>>>>             info->flags = FBINFO_HWACCEL_DISABLED;
>>>>>>> @@ -393,7 +393,7 @@ nouveau_fbcon_create(struct drm_fb_helper *helper,
>>>>>>>           /* To allow resizeing without swapping buffers */
>>>>>>>         NV_INFO(drm, "allocated %dx%d fb: 0x%llx, bo %p\n",
>>>>>>> -        fb->base.width, fb->base.height, nvbo->bo.offset, nvbo);
>>>>>>> +        fb->width, fb->height, nvbo->bo.offset, nvbo);
>>>>>>>           vga_switcheroo_client_fb_set(dev->pdev, info);
>>>>>>>         return 0;
>>>>>>> @@ -413,18 +413,18 @@ nouveau_fbcon_create(struct drm_fb_helper
>>>>>>> *helper,
>>>>>>>     static int
>>>>>>>     nouveau_fbcon_destroy(struct drm_device *dev, struct nouveau_fbdev
>>>>>>> *fbcon)
>>>>>>>     {
>>>>>>> -    struct nouveau_framebuffer *nouveau_fb =
>>>>>>> nouveau_framebuffer(fbcon->helper.fb);
>>>>>>> +    struct drm_framebuffer *fb = fbcon->helper.fb;
>>>>>>>         struct nouveau_bo *nvbo;
>>>>>>>           drm_fb_helper_unregister_fbi(&fbcon->helper);
>>>>>>>         drm_fb_helper_fini(&fbcon->helper);
>>>>>>>     -    if (nouveau_fb && nouveau_fb->base.obj[0]) {
>>>>>>> -        nvbo = nouveau_gem_object(nouveau_fb->base.obj[0]);
>>>>>>> +    if (fb && fb->obj[0]) {
>>>>>>> +        nvbo = nouveau_gem_object(fb->obj[0]);
>>>>>>>             nouveau_vma_del(&fbcon->vma);
>>>>>>>             nouveau_bo_unmap(nvbo);
>>>>>>>             nouveau_bo_unpin(nvbo);
>>>>>>> -        drm_framebuffer_put(&nouveau_fb->base);
>>>>>>> +        drm_framebuffer_put(fb);
>>>>>>>         }
>>>>>>>           return 0;
>>>>>>>
>>>>>> _______________________________________________
>>>>>> dri-devel mailing list
>>>>>> dri-devel@lists.freedesktop.org
>>>>>> https://lists.freedesktop.org/mailman/listinfo/dri-devel
>>>>>
>>>> _______________________________________________
>>>> dri-devel mailing list
>>>> dri-devel@lists.freedesktop.org
>>>> https://lists.freedesktop.org/mailman/listinfo/dri-devel
>>> _______________________________________________
>>> dri-devel mailing list
>>> dri-devel@lists.freedesktop.org
>>> https://lists.freedesktop.org/mailman/listinfo/dri-devel
> 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
