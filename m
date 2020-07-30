Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E388233A46
	for <lists+dri-devel@lfdr.de>; Thu, 30 Jul 2020 23:06:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 621CF6E5BE;
	Thu, 30 Jul 2020 21:06:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from hqnvemgate26.nvidia.com (hqnvemgate26.nvidia.com
 [216.228.121.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AAA446E40B;
 Thu, 30 Jul 2020 21:06:36 +0000 (UTC)
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate26.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5f23364e0001>; Thu, 30 Jul 2020 14:06:23 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate101.nvidia.com (PGP Universal service);
 Thu, 30 Jul 2020 14:06:36 -0700
X-PGP-Universal: processed;
 by hqpgpgate101.nvidia.com on Thu, 30 Jul 2020 14:06:36 -0700
Received: from [172.20.40.56] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 30 Jul
 2020 21:06:35 +0000
Subject: Re: [Nouveau] [PATCH v2] drm/nouveau: Accept 'legacy' format modifiers
To: "Kirill A. Shutemov" <kirill@shutemov.name>, Ben Skeggs <skeggsb@gmail.com>
References: <20200718033352.1810-1-jajones@nvidia.com>
 <CACAvsv6a6Td=igGXwrpPUASMfYPCH9VvWdEY6PBaY+0cybJNxA@mail.gmail.com>
 <561f3a10-82af-cff5-b771-2e56b6eb973a@nvidia.com>
 <CAPM=9twQfg6QiiL2fn=qaBRrWCsnoByoch+1vAN94ZwqzYDFxg@mail.gmail.com>
 <CACAvsv6_h95a-Gpd-=YxW0d8CoOHvO2OLCsoDpJvUx=MWzdFzw@mail.gmail.com>
 <20200729144746.jwyhwnp2fwat34hc@box>
X-Nvconfidentiality: public
From: James Jones <jajones@nvidia.com>
Message-ID: <c3e344e0-931f-81e0-44cc-c72f7bae73a1@nvidia.com>
Date: Thu, 30 Jul 2020 14:06:31 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200729144746.jwyhwnp2fwat34hc@box>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL105.nvidia.com (172.20.187.12) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Language: en-US
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1596143183; bh=RbpUwALqT5o19ACZYw6UwNFHAe1UP3Je8wcDj7LABbs=;
 h=X-PGP-Universal:Subject:To:CC:References:X-Nvconfidentiality:From:
 Message-ID:Date:User-Agent:MIME-Version:In-Reply-To:
 X-Originating-IP:X-ClientProxiedBy:Content-Type:Content-Language:
 Content-Transfer-Encoding;
 b=ry/F8FREytolSXw7WFHbIAiZhA03BD7GpPoKbszXPmYcwX2o15jO53OByxYv4Qgbq
 vJS2uLsW8YQEV85N3LfrRMfz4OAD7Q+Y7A4Yhp4CGK4iYolC6I060mvmYHiln/qy8r
 9sFs1rzclt/74FHjtpqR+gtPO9/lGqG3jB6/cBkzC+lORLZv4vFuk7JU24nVV067IA
 81pTV6eaVLE9+AtBKXaEl0SSnnfIlr9J+USTKHm9EPHqAV+BxnO1xpBf4rgr1WY4HK
 +x+t1AYdkIJzGLW55VID4fzr/b9IFRzveMYSKsCPqH3ReLDD14Ng4qecANMPLm1j/U
 V2b8Zm6K1pNUw==
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, Ben Skeggs <bskeggs@redhat.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Nouveau <nouveau@lists.freedesktop.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 7/29/20 7:47 AM, Kirill A. Shutemov wrote:
> On Wed, Jul 29, 2020 at 01:40:13PM +1000, Ben Skeggs wrote:
>> On Wed, 29 Jul 2020 at 12:48, Dave Airlie <airlied@gmail.com> wrote:
>>>
>>> On Tue, 28 Jul 2020 at 04:51, James Jones <jajones@nvidia.com> wrote:
>>>>
>>>> On 7/23/20 9:06 PM, Ben Skeggs wrote:
>>>>> On Sat, 18 Jul 2020 at 13:34, James Jones <jajones@nvidia.com> wrote:
>>>>>>
>>>>>> Accept the DRM_FORMAT_MOD_NVIDIA_16BX2_BLOCK()
>>>>>> family of modifiers to handle broken userspace
>>>>>> Xorg modesetting and Mesa drivers. Existing Mesa
>>>>>> drivers are still aware of only these older
>>>>>> format modifiers which do not differentiate
>>>>>> between different variations of the block linear
>>>>>> layout. When the format modifier support flag was
>>>>>> flipped in the nouveau kernel driver, the X.org
>>>>>> modesetting driver began attempting to use its
>>>>>> format modifier-enabled framebuffer path. Because
>>>>>> the set of format modifiers advertised by the
>>>>>> kernel prior to this change do not intersect with
>>>>>> the set of format modifiers advertised by Mesa,
>>>>>> allocating GBM buffers using format modifiers
>>>>>> fails and the modesetting driver falls back to
>>>>>> non-modifier allocation. However, it still later
>>>>>> queries the modifier of the GBM buffer when
>>>>>> creating its DRM-KMS framebuffer object, receives
>>>>>> the old-format modifier from Mesa, and attempts
>>>>>> to create a framebuffer with it. Since the kernel
>>>>>> is still not aware of these formats, this fails.
>>>>>>
>>>>>> Userspace should not be attempting to query format
>>>>>> modifiers of GBM buffers allocated with a non-
>>>>>> format-modifier-aware allocation path, but to
>>>>>> avoid breaking existing userspace behavior, this
>>>>>> change accepts the old-style format modifiers when
>>>>>> creating framebuffers and applying them to planes
>>>>>> by translating them to the equivalent new-style
>>>>>> modifier. To accomplish this, some layout
>>>>>> parameters must be assumed to match properties of
>>>>>> the device targeted by the relevant ioctls. To
>>>>>> avoid perpetuating misuse of the old-style
>>>>>> modifiers, this change does not advertise support
>>>>>> for them. Doing so would imply compatibility
>>>>>> between devices with incompatible memory layouts.
>>>>>>
>>>>>> Tested with Xorg 1.20 modesetting driver,
>>>>>> weston@c46c70dac84a4b3030cd05b380f9f410536690fc,
>>>>>> gnome & KDE wayland desktops from Ubuntu 18.04,
>>>>>> and sway 1.5
>>>>>>
>>>>>> Reported-by: Kirill A. Shutemov <kirill@shutemov.name>
>>>>>> Fixes: fa4f4c213f5f ("drm/nouveau/kms: Support NVIDIA format modifiers")
>>>>>> Link: https://lkml.org/lkml/2020/6/30/1251
>>>>>> Signed-off-by: James Jones <jajones@nvidia.com>
>>>>>> ---
>>>>>>    drivers/gpu/drm/nouveau/nouveau_display.c | 26 +++++++++++++++++++++--
>>>>>>    1 file changed, 24 insertions(+), 2 deletions(-)
>>>>>>
>>>>>> diff --git a/drivers/gpu/drm/nouveau/nouveau_display.c b/drivers/gpu/drm/nouveau/nouveau_display.c
>>>>>> index 496c4621cc78..31543086254b 100644
>>>>>> --- a/drivers/gpu/drm/nouveau/nouveau_display.c
>>>>>> +++ b/drivers/gpu/drm/nouveau/nouveau_display.c
>>>>>> @@ -191,8 +191,14 @@ nouveau_decode_mod(struct nouveau_drm *drm,
>>>>>>                      uint32_t *tile_mode,
>>>>>>                      uint8_t *kind)
>>>>>>    {
>>>>>> +       struct nouveau_display *disp = nouveau_display(drm->dev);
>>>>>>           BUG_ON(!tile_mode || !kind);
>>>>>>
>>>>>> +       if ((modifier & (0xffull << 12)) == 0ull) {
>>>>>> +               /* Legacy modifier.  Translate to this device's 'kind.' */
>>>>>> +               modifier |= disp->format_modifiers[0] & (0xffull << 12);
>>>>>> +       }
>>>>> I believe this should be moved into the != MOD_LINEAR case.
>>>>
>>>> Yes, of course, thanks.  I need to re-evaluate my testing yet again to
>>>> make sure I hit that case too.  Preparing a v3...
>>>
>>> Going to need something here in the next day, two max.
>>>
>>> Linus may wait for another week, but it's not guaranteed.
>> I tested a whole bunch of GPUs before sending nouveau's -next tree,
>> and with the change I suggested to this patch + the other stuff I sent
>> through -fixes already, things seemed to be in OK shape.
> 
> JFYI, the adjusted (moved into != MOD_LINEAR case) patch works fine for me
> on top of drm-fixes-2020-07-29.

Sorry again for the delays (life is terrible lately), but the signed-off 
version with Ben's suggestion went out this morning, and I specifically 
tested linear modifiers in addition to retesting all the other test 
cases mentioned in the patch.

Thanks,
-James
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
