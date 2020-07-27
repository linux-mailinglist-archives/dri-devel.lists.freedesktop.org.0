Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C20A122F873
	for <lists+dri-devel@lfdr.de>; Mon, 27 Jul 2020 20:51:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 21852899C4;
	Mon, 27 Jul 2020 18:51:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from hqnvemgate25.nvidia.com (hqnvemgate25.nvidia.com
 [216.228.121.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E270899C4;
 Mon, 27 Jul 2020 18:51:05 +0000 (UTC)
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate25.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5f1f21ec0000>; Mon, 27 Jul 2020 11:50:20 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate101.nvidia.com (PGP Universal service);
 Mon, 27 Jul 2020 11:51:04 -0700
X-PGP-Universal: processed;
 by hqpgpgate101.nvidia.com on Mon, 27 Jul 2020 11:51:04 -0700
Received: from [172.20.40.79] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 27 Jul
 2020 18:51:04 +0000
Subject: Re: [Nouveau] [PATCH v2] drm/nouveau: Accept 'legacy' format modifiers
To: Ben Skeggs <skeggsb@gmail.com>
References: <20200718033352.1810-1-jajones@nvidia.com>
 <CACAvsv6a6Td=igGXwrpPUASMfYPCH9VvWdEY6PBaY+0cybJNxA@mail.gmail.com>
X-Nvconfidentiality: public
From: James Jones <jajones@nvidia.com>
Message-ID: <561f3a10-82af-cff5-b771-2e56b6eb973a@nvidia.com>
Date: Mon, 27 Jul 2020 11:51:04 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CACAvsv6a6Td=igGXwrpPUASMfYPCH9VvWdEY6PBaY+0cybJNxA@mail.gmail.com>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL101.nvidia.com (172.20.187.10) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Language: en-US
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1595875820; bh=7rubpag/+ge6m/px/IFHOXfbfDbUjH+NNfPAemKNo88=;
 h=X-PGP-Universal:Subject:To:CC:References:X-Nvconfidentiality:From:
 Message-ID:Date:User-Agent:MIME-Version:In-Reply-To:
 X-Originating-IP:X-ClientProxiedBy:Content-Type:Content-Language:
 Content-Transfer-Encoding;
 b=g7bjJ/EXWfnTrKwSfYIPsdKpYdHPAETkwViJuakGXD0FKFznluced5zr0wQkJIyVn
 e9ExkhLzK2zI+vaMc1KVcm7LnGbPRIsCaxFwVzkYE+/bIUzNl2u9fo+bNhYBpYLijm
 J+a9cYt5UQZ8Uz/hj46nykP/0l3VWuSosoe4YnJqbiUTEiLAPBYkp2Fu3sxLPuWOvu
 I87n9PNd1YyQU+QKoQCV/Qpw0WHnNxMY0HWNcgymSc+OQwMpZXInX9wzjVi3sd5W2J
 cqs3xTyZzpMYehrr68936hP7RX7h+nY33PmwceGU04zjMG7BhV8iH8WDV0G37sqGYF
 KJ4/GLa+RutIw==
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
Cc: Nouveau <nouveau@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, Ben Skeggs <bskeggs@redhat.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 "Kirill A . Shutemov" <kirill@shutemov.name>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 7/23/20 9:06 PM, Ben Skeggs wrote:
> On Sat, 18 Jul 2020 at 13:34, James Jones <jajones@nvidia.com> wrote:
>>
>> Accept the DRM_FORMAT_MOD_NVIDIA_16BX2_BLOCK()
>> family of modifiers to handle broken userspace
>> Xorg modesetting and Mesa drivers. Existing Mesa
>> drivers are still aware of only these older
>> format modifiers which do not differentiate
>> between different variations of the block linear
>> layout. When the format modifier support flag was
>> flipped in the nouveau kernel driver, the X.org
>> modesetting driver began attempting to use its
>> format modifier-enabled framebuffer path. Because
>> the set of format modifiers advertised by the
>> kernel prior to this change do not intersect with
>> the set of format modifiers advertised by Mesa,
>> allocating GBM buffers using format modifiers
>> fails and the modesetting driver falls back to
>> non-modifier allocation. However, it still later
>> queries the modifier of the GBM buffer when
>> creating its DRM-KMS framebuffer object, receives
>> the old-format modifier from Mesa, and attempts
>> to create a framebuffer with it. Since the kernel
>> is still not aware of these formats, this fails.
>>
>> Userspace should not be attempting to query format
>> modifiers of GBM buffers allocated with a non-
>> format-modifier-aware allocation path, but to
>> avoid breaking existing userspace behavior, this
>> change accepts the old-style format modifiers when
>> creating framebuffers and applying them to planes
>> by translating them to the equivalent new-style
>> modifier. To accomplish this, some layout
>> parameters must be assumed to match properties of
>> the device targeted by the relevant ioctls. To
>> avoid perpetuating misuse of the old-style
>> modifiers, this change does not advertise support
>> for them. Doing so would imply compatibility
>> between devices with incompatible memory layouts.
>>
>> Tested with Xorg 1.20 modesetting driver,
>> weston@c46c70dac84a4b3030cd05b380f9f410536690fc,
>> gnome & KDE wayland desktops from Ubuntu 18.04,
>> and sway 1.5
>>
>> Reported-by: Kirill A. Shutemov <kirill@shutemov.name>
>> Fixes: fa4f4c213f5f ("drm/nouveau/kms: Support NVIDIA format modifiers")
>> Link: https://lkml.org/lkml/2020/6/30/1251
>> Signed-off-by: James Jones <jajones@nvidia.com>
>> ---
>>   drivers/gpu/drm/nouveau/nouveau_display.c | 26 +++++++++++++++++++++--
>>   1 file changed, 24 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/nouveau/nouveau_display.c b/drivers/gpu/drm/nouveau/nouveau_display.c
>> index 496c4621cc78..31543086254b 100644
>> --- a/drivers/gpu/drm/nouveau/nouveau_display.c
>> +++ b/drivers/gpu/drm/nouveau/nouveau_display.c
>> @@ -191,8 +191,14 @@ nouveau_decode_mod(struct nouveau_drm *drm,
>>                     uint32_t *tile_mode,
>>                     uint8_t *kind)
>>   {
>> +       struct nouveau_display *disp = nouveau_display(drm->dev);
>>          BUG_ON(!tile_mode || !kind);
>>
>> +       if ((modifier & (0xffull << 12)) == 0ull) {
>> +               /* Legacy modifier.  Translate to this device's 'kind.' */
>> +               modifier |= disp->format_modifiers[0] & (0xffull << 12);
>> +       }
> I believe this should be moved into the != MOD_LINEAR case.

Yes, of course, thanks.  I need to re-evaluate my testing yet again to 
make sure I hit that case too.  Preparing a v3...

Thanks,
-James

>> +
>>          if (modifier == DRM_FORMAT_MOD_LINEAR) {
>>                  /* tile_mode will not be used in this case */
>>                  *tile_mode = 0;
>> @@ -227,6 +233,16 @@ nouveau_framebuffer_get_layout(struct drm_framebuffer *fb,
>>          }
>>   }
>>
>> +static const u64 legacy_modifiers[] = {
>> +       DRM_FORMAT_MOD_NVIDIA_16BX2_BLOCK(0),
>> +       DRM_FORMAT_MOD_NVIDIA_16BX2_BLOCK(1),
>> +       DRM_FORMAT_MOD_NVIDIA_16BX2_BLOCK(2),
>> +       DRM_FORMAT_MOD_NVIDIA_16BX2_BLOCK(3),
>> +       DRM_FORMAT_MOD_NVIDIA_16BX2_BLOCK(4),
>> +       DRM_FORMAT_MOD_NVIDIA_16BX2_BLOCK(5),
>> +       DRM_FORMAT_MOD_INVALID
>> +};
>> +
>>   static int
>>   nouveau_validate_decode_mod(struct nouveau_drm *drm,
>>                              uint64_t modifier,
>> @@ -247,8 +263,14 @@ nouveau_validate_decode_mod(struct nouveau_drm *drm,
>>               (disp->format_modifiers[mod] != modifier);
>>               mod++);
>>
>> -       if (disp->format_modifiers[mod] == DRM_FORMAT_MOD_INVALID)
>> -               return -EINVAL;
>> +       if (disp->format_modifiers[mod] == DRM_FORMAT_MOD_INVALID) {
>> +               for (mod = 0;
>> +                    (legacy_modifiers[mod] != DRM_FORMAT_MOD_INVALID) &&
>> +                    (legacy_modifiers[mod] != modifier);
>> +                    mod++);
>> +               if (legacy_modifiers[mod] == DRM_FORMAT_MOD_INVALID)
>> +                       return -EINVAL;
>> +       }
>>
>>          nouveau_decode_mod(drm, modifier, tile_mode, kind);
>>
>> --
>> 2.17.1
>>
>> _______________________________________________
>> Nouveau mailing list
>> Nouveau@lists.freedesktop.org
>> https://lists.freedesktop.org/mailman/listinfo/nouveau
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
