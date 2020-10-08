Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BA40F287163
	for <lists+dri-devel@lfdr.de>; Thu,  8 Oct 2020 11:25:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 968E56E0FE;
	Thu,  8 Oct 2020 09:25:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC3C56E0FE;
 Thu,  8 Oct 2020 09:25:16 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 522EEB237;
 Thu,  8 Oct 2020 09:25:15 +0000 (UTC)
Subject: Re: [PATCH v3 6/7] drm/fb_helper: Support framebuffers in I/O memory
To: Daniel Vetter <daniel@ffwll.ch>
References: <20200929151437.19717-1-tzimmermann@suse.de>
 <20200929151437.19717-7-tzimmermann@suse.de>
 <20201002180500.GM438822@phenom.ffwll.local>
 <CAKMK7uFVHrqBh1sqQHR56vp2JS77XoCs232B5mkJXXpLhgLW8Q@mail.gmail.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
Message-ID: <ffc4b2de-ff97-210f-0ae4-f2f85a27f59b@suse.de>
Date: Thu, 8 Oct 2020 11:25:13 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <CAKMK7uFVHrqBh1sqQHR56vp2JS77XoCs232B5mkJXXpLhgLW8Q@mail.gmail.com>
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
Cc: Luben Tuikov <luben.tuikov@amd.com>, Dave Airlie <airlied@linux.ie>,
 Nouveau Dev <nouveau@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, "Wilson,
 Chris" <chris@chris-wilson.co.uk>, Melissa Wen <melissa.srw@gmail.com>,
 Huang Rui <ray.huang@amd.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Sam Ravnborg <sam@ravnborg.org>, Emil Velikov <emil.velikov@collabora.com>,
 linux-samsung-soc <linux-samsung-soc@vger.kernel.org>,
 Joonyoung Shim <jy0922.shim@samsung.com>, lima@lists.freedesktop.org,
 Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
 Krzysztof Kozlowski <krzk@kernel.org>, Steven Price <steven.price@arm.com>,
 "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>,
 Kukjin Kim <kgene@kernel.org>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Russell King <linux+etnaviv@armlinux.org.uk>,
 "open list:DRM DRIVER FOR QXL VIRTUAL GPU" <spice-devel@lists.freedesktop.org>,
 Ben Skeggs <bskeggs@redhat.com>,
 The etnaviv authors <etnaviv@lists.freedesktop.org>,
 Hans de Goede <hdegoede@redhat.com>,
 "moderated list:DRM DRIVERS FOR XEN" <xen-devel@lists.xenproject.org>,
 "open list:VIRTIO CORE, NET..." <virtualization@lists.linux-foundation.org>,
 Sean Paul <sean@poorly.run>, apaneers@amd.com,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 Seung-Woo Kim <sw0312.kim@samsung.com>, Sandy Huang <hjc@rock-chips.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Qinglang Miao <miaoqinglang@huawei.com>, Qiang Yu <yuq825@gmail.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 "open list:DMA BUFFER SHARING FRAMEWORK" <linux-media@vger.kernel.org>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Content-Type: multipart/mixed; boundary="===============1300098971=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============1300098971==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="wSkQnhyu1s6mke5MwMEXxiMF0P61mkAgk"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--wSkQnhyu1s6mke5MwMEXxiMF0P61mkAgk
Content-Type: multipart/mixed; boundary="9SInwHdMlT9HJ8SWW0YhlKXr6GBVVNNex";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Daniel Vetter <daniel@ffwll.ch>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Dave Airlie <airlied@linux.ie>,
 Sam Ravnborg <sam@ravnborg.org>, Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Lucas Stach <l.stach@pengutronix.de>,
 Russell King <linux+etnaviv@armlinux.org.uk>,
 Christian Gmeiner <christian.gmeiner@gmail.com>,
 Inki Dae <inki.dae@samsung.com>, Joonyoung Shim <jy0922.shim@samsung.com>,
 Seung-Woo Kim <sw0312.kim@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>, Kukjin Kim <kgene@kernel.org>,
 Krzysztof Kozlowski <krzk@kernel.org>, Qiang Yu <yuq825@gmail.com>,
 Ben Skeggs <bskeggs@redhat.com>, Rob Herring <robh@kernel.org>,
 Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 Steven Price <steven.price@arm.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Sandy Huang <hjc@rock-chips.com>, =?UTF-8?Q?Heiko_St=c3=bcbner?=
 <heiko@sntech.de>, Hans de Goede <hdegoede@redhat.com>,
 Sean Paul <sean@poorly.run>, "Anholt, Eric" <eric@anholt.net>,
 Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
 Huang Rui <ray.huang@amd.com>, Sumit Semwal <sumit.semwal@linaro.org>,
 Emil Velikov <emil.velikov@collabora.com>,
 Luben Tuikov <luben.tuikov@amd.com>, apaneers@amd.com,
 Linus Walleij <linus.walleij@linaro.org>, Melissa Wen
 <melissa.srw@gmail.com>, "Wilson, Chris" <chris@chris-wilson.co.uk>,
 Qinglang Miao <miaoqinglang@huawei.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 "open list:VIRTIO CORE, NET..." <virtualization@lists.linux-foundation.org>,
 The etnaviv authors <etnaviv@lists.freedesktop.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 linux-samsung-soc <linux-samsung-soc@vger.kernel.org>,
 lima@lists.freedesktop.org, Nouveau Dev <nouveau@lists.freedesktop.org>,
 "open list:DRM DRIVER FOR QXL VIRTUAL GPU"
 <spice-devel@lists.freedesktop.org>,
 "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>,
 "moderated list:DRM DRIVERS FOR XEN" <xen-devel@lists.xenproject.org>,
 "open list:DMA BUFFER SHARING FRAMEWORK" <linux-media@vger.kernel.org>,
 "moderated list:DMA BUFFER SHARING FRAMEWORK"
 <linaro-mm-sig@lists.linaro.org>
Message-ID: <ffc4b2de-ff97-210f-0ae4-f2f85a27f59b@suse.de>
Subject: Re: [PATCH v3 6/7] drm/fb_helper: Support framebuffers in I/O memory
References: <20200929151437.19717-1-tzimmermann@suse.de>
 <20200929151437.19717-7-tzimmermann@suse.de>
 <20201002180500.GM438822@phenom.ffwll.local>
 <CAKMK7uFVHrqBh1sqQHR56vp2JS77XoCs232B5mkJXXpLhgLW8Q@mail.gmail.com>
In-Reply-To: <CAKMK7uFVHrqBh1sqQHR56vp2JS77XoCs232B5mkJXXpLhgLW8Q@mail.gmail.com>

--9SInwHdMlT9HJ8SWW0YhlKXr6GBVVNNex
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi

Am 02.10.20 um 20:44 schrieb Daniel Vetter:
> On Fri, Oct 2, 2020 at 8:05 PM Daniel Vetter <daniel@ffwll.ch> wrote:
>>
>> On Tue, Sep 29, 2020 at 05:14:36PM +0200, Thomas Zimmermann wrote:
>>> At least sparc64 requires I/O-specific access to framebuffers. This
>>> patch updates the fbdev console accordingly.
>>>
>>> For drivers with direct access to the framebuffer memory, the callbac=
k
>>> functions in struct fb_ops test for the type of memory and call the r=
sp
>>> fb_sys_ of fb_cfb_ functions.
>>>
>>> For drivers that employ a shadow buffer, fbdev's blit function retrie=
ves
>>> the framebuffer address as struct dma_buf_map, and uses dma_buf_map
>>> interfaces to access the buffer.
>>>
>>> The bochs driver on sparc64 uses a workaround to flag the framebuffer=
 as
>>> I/O memory and avoid a HW exception. With the introduction of struct
>>> dma_buf_map, this is not required any longer. The patch removes the r=
sp
>>> code from both, bochs and fbdev.
>>>
>>> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
>=20
> Argh, I accidentally hit send before finishing this ...
>=20
>>> ---
>>>  drivers/gpu/drm/bochs/bochs_kms.c |   1 -
>>>  drivers/gpu/drm/drm_fb_helper.c   | 217 ++++++++++++++++++++++++++++=
--
>>>  include/drm/drm_mode_config.h     |  12 --
>>>  include/linux/dma-buf-map.h       |  72 ++++++++--
>>>  4 files changed, 265 insertions(+), 37 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/bochs/bochs_kms.c b/drivers/gpu/drm/boch=
s/bochs_kms.c
>>> index 13d0d04c4457..853081d186d5 100644
>>> --- a/drivers/gpu/drm/bochs/bochs_kms.c
>>> +++ b/drivers/gpu/drm/bochs/bochs_kms.c
>>> @@ -151,7 +151,6 @@ int bochs_kms_init(struct bochs_device *bochs)
>>>       bochs->dev->mode_config.preferred_depth =3D 24;
>>>       bochs->dev->mode_config.prefer_shadow =3D 0;
>>>       bochs->dev->mode_config.prefer_shadow_fbdev =3D 1;
>>> -     bochs->dev->mode_config.fbdev_use_iomem =3D true;
>>>       bochs->dev->mode_config.quirk_addfb_prefer_host_byte_order =3D =
true;
>>>
>>>       bochs->dev->mode_config.funcs =3D &bochs_mode_funcs;
>>> diff --git a/drivers/gpu/drm/drm_fb_helper.c b/drivers/gpu/drm/drm_fb=
_helper.c
>>> index 343a292f2c7c..f345a314a437 100644
>>> --- a/drivers/gpu/drm/drm_fb_helper.c
>>> +++ b/drivers/gpu/drm/drm_fb_helper.c
>>> @@ -388,24 +388,22 @@ static void drm_fb_helper_resume_worker(struct =
work_struct *work)
>>>  }
>>>
>>>  static void drm_fb_helper_dirty_blit_real(struct drm_fb_helper *fb_h=
elper,
>>> -                                       struct drm_clip_rect *clip)
>>> +                                       struct drm_clip_rect *clip,
>>> +                                       struct dma_buf_map *dst)
>>>  {
>>>       struct drm_framebuffer *fb =3D fb_helper->fb;
>>>       unsigned int cpp =3D fb->format->cpp[0];
>>>       size_t offset =3D clip->y1 * fb->pitches[0] + clip->x1 * cpp;
>>>       void *src =3D fb_helper->fbdev->screen_buffer + offset;
>>> -     void *dst =3D fb_helper->buffer->map.vaddr + offset;
>>>       size_t len =3D (clip->x2 - clip->x1) * cpp;
>>>       unsigned int y;
>>>
>>> -     for (y =3D clip->y1; y < clip->y2; y++) {
>>> -             if (!fb_helper->dev->mode_config.fbdev_use_iomem)
>>> -                     memcpy(dst, src, len);
>>> -             else
>>> -                     memcpy_toio((void __iomem *)dst, src, len);
>>> +     dma_buf_map_incr(dst, offset); /* go to first pixel within clip=
 rect */
>>>
>>> +     for (y =3D clip->y1; y < clip->y2; y++) {
>>> +             dma_buf_map_memcpy_to(dst, src, len);
>>> +             dma_buf_map_incr(dst, fb->pitches[0]);
>>>               src +=3D fb->pitches[0];
>>> -             dst +=3D fb->pitches[0];
>>>       }
>>>  }
>>>
>>> @@ -433,8 +431,9 @@ static void drm_fb_helper_dirty_work(struct work_=
struct *work)
>>>                       ret =3D drm_client_buffer_vmap(helper->buffer, =
&map);
>>>                       if (ret)
>>>                               return;
>>> -                     drm_fb_helper_dirty_blit_real(helper, &clip_cop=
y);
>>> +                     drm_fb_helper_dirty_blit_real(helper, &clip_cop=
y, &map);
>>>               }
>>> +
>>>               if (helper->fb->funcs->dirty)
>>>                       helper->fb->funcs->dirty(helper->fb, NULL, 0, 0=
,
>>>                                                &clip_copy, 1);
>>> @@ -771,6 +770,136 @@ void drm_fb_helper_sys_imageblit(struct fb_info=
 *info,
>>>  }
>>>  EXPORT_SYMBOL(drm_fb_helper_sys_imageblit);
>>>
>>> +static ssize_t drm_fb_helper_cfb_read(struct fb_info *info, char __u=
ser *buf,
>>> +                                   size_t count, loff_t *ppos)
>>> +{
>>> +     unsigned long p =3D *ppos;
>>> +     u8 *dst;
>>> +     u8 __iomem *src;
>>> +     int c, err =3D 0;
>>> +     unsigned long total_size;
>>> +     unsigned long alloc_size;
>>> +     ssize_t ret =3D 0;
>>> +
>>> +     if (info->state !=3D FBINFO_STATE_RUNNING)
>>> +             return -EPERM;
>>> +
>>> +     total_size =3D info->screen_size;
>>> +
>>> +     if (total_size =3D=3D 0)
>>> +             total_size =3D info->fix.smem_len;
>>> +
>>> +     if (p >=3D total_size)
>>> +             return 0;
>>> +
>>> +     if (count >=3D total_size)
>>> +             count =3D total_size;
>>> +
>>> +     if (count + p > total_size)
>>> +             count =3D total_size - p;
>>> +
>>> +     src =3D (u8 __iomem *)(info->screen_base + p);
>>> +
>>> +     alloc_size =3D min(count, PAGE_SIZE);
>>> +
>>> +     dst =3D kmalloc(alloc_size, GFP_KERNEL);
>>> +     if (!dst)
>>> +             return -ENOMEM;
>>> +
>>> +     while (count) {
>>> +             c =3D min(count, alloc_size);
>>> +
>>> +             memcpy_fromio(dst, src, c);
>>> +             if (copy_to_user(buf, dst, c)) {
>>> +                     err =3D -EFAULT;
>>> +                     break;
>>> +             }
>>> +
>>> +             src +=3D c;
>>> +             *ppos +=3D c;
>>> +             buf +=3D c;
>>> +             ret +=3D c;
>>> +             count -=3D c;
>>> +     }
>>> +
>>> +     kfree(dst);
>>> +
>>> +     if (err)
>>> +             return err;
>>> +
>>> +     return ret;
>>> +}
>>> +
>>> +static ssize_t drm_fb_helper_cfb_write(struct fb_info *info, const c=
har __user *buf,
>>> +                                    size_t count, loff_t *ppos)
>>> +{
>>> +     unsigned long p =3D *ppos;
>>> +     u8 *src;
>>> +     u8 __iomem *dst;
>>> +     int c, err =3D 0;
>>> +     unsigned long total_size;
>>> +     unsigned long alloc_size;
>>> +     ssize_t ret =3D 0;
>>> +
>>> +     if (info->state !=3D FBINFO_STATE_RUNNING)
>>> +             return -EPERM;
>>> +
>>> +     total_size =3D info->screen_size;
>>> +
>>> +     if (total_size =3D=3D 0)
>>> +             total_size =3D info->fix.smem_len;
>>> +
>>> +     if (p > total_size)
>>> +             return -EFBIG;
>>> +
>>> +     if (count > total_size) {
>>> +             err =3D -EFBIG;
>>> +             count =3D total_size;
>>> +     }
>>> +
>>> +     if (count + p > total_size) {
>>> +             /*
>>> +              * The framebuffer is too small. We do the
>>> +              * copy operation, but return an error code
>>> +              * afterwards. Taken from fbdev.
>>> +              */
>>> +             if (!err)
>>> +                     err =3D -ENOSPC;
>>> +             count =3D total_size - p;
>>> +     }
>>> +
>>> +     alloc_size =3D min(count, PAGE_SIZE);
>>> +
>>> +     src =3D kmalloc(alloc_size, GFP_KERNEL);
>>> +     if (!src)
>>> +             return -ENOMEM;
>>> +
>>> +     dst =3D (u8 __iomem *)(info->screen_base + p);
>>> +
>>> +     while (count) {
>>> +             c =3D min(count, alloc_size);
>>> +
>>> +             if (copy_from_user(src, buf, c)) {
>>> +                     err =3D -EFAULT;
>>> +                     break;
>>> +             }
>>> +             memcpy_toio(dst, src, c);
>>> +
>>> +             dst +=3D c;
>>> +             *ppos +=3D c;
>>> +             buf +=3D c;
>>> +             ret +=3D c;
>>> +             count -=3D c;
>>> +     }
>>> +
>>> +     kfree(src);
>>> +
>>> +     if (err)
>>> +             return err;
>>> +
>>> +     return ret;
>>> +}
>=20
> The duplication is a bit annoying here, but can't really be avoided. I
> do think though we should maybe go a bit further, and have drm
> implementations of this stuff instead of following fbdev concepts as
> closely as possible. So here roughly:
>=20
> - if we have a shadow fb, construct a dma_buf_map for that, otherwise
> take the one from the driver
> - have a full generic implementation using that one directly (and
> checking size limits against the underlying gem buffer)
> - ideally also with some testcases in the fbdev testcase we have (very
> bare-bones right now) in igt
>=20
> But I'm not really sure whether that's worth all the trouble. It's
> just that the fbdev-ness here in this copied code sticks out a lot :-)
>=20
>>> +
>>>  /**
>>>   * drm_fb_helper_cfb_fillrect - wrapper around cfb_fillrect
>>>   * @info: fbdev registered by the helper
>>> @@ -2043,6 +2172,66 @@ static int drm_fbdev_fb_mmap(struct fb_info *i=
nfo, struct vm_area_struct *vma)
>>>               return -ENODEV;
>>>  }
>>>
>>> +static ssize_t drm_fbdev_fb_read(struct fb_info *info, char __user *=
buf,
>>> +                              size_t count, loff_t *ppos)
>>> +{
>>> +     struct drm_fb_helper *fb_helper =3D info->par;
>>> +     struct drm_client_buffer *buffer =3D fb_helper->buffer;
>>> +
>>> +     if (drm_fbdev_use_shadow_fb(fb_helper) || !buffer->map.is_iomem=
)
>>> +             return drm_fb_helper_sys_read(info, buf, count, ppos);
>>> +     else
>>> +             return drm_fb_helper_cfb_read(info, buf, count, ppos);
>>> +}
>>> +
>>> +static ssize_t drm_fbdev_fb_write(struct fb_info *info, const char _=
_user *buf,
>>> +                               size_t count, loff_t *ppos)
>>> +{
>>> +     struct drm_fb_helper *fb_helper =3D info->par;
>>> +     struct drm_client_buffer *buffer =3D fb_helper->buffer;
>>> +
>>> +     if (drm_fbdev_use_shadow_fb(fb_helper) || !buffer->map.is_iomem=
)
>>> +             return drm_fb_helper_sys_write(info, buf, count, ppos);=

>>> +     else
>>> +             return drm_fb_helper_cfb_write(info, buf, count, ppos);=

>>> +}
>>> +
>>> +static void drm_fbdev_fb_fillrect(struct fb_info *info,
>>> +                               const struct fb_fillrect *rect)
>>> +{
>>> +     struct drm_fb_helper *fb_helper =3D info->par;
>>> +     struct drm_client_buffer *buffer =3D fb_helper->buffer;
>>> +
>>> +     if (drm_fbdev_use_shadow_fb(fb_helper) || !buffer->map.is_iomem=
)
>>> +             drm_fb_helper_sys_fillrect(info, rect);
>>> +     else
>>> +             drm_fb_helper_cfb_fillrect(info, rect);
>>> +}
>>> +
>>> +static void drm_fbdev_fb_copyarea(struct fb_info *info,
>>> +                               const struct fb_copyarea *area)
>>> +{
>>> +     struct drm_fb_helper *fb_helper =3D info->par;
>>> +     struct drm_client_buffer *buffer =3D fb_helper->buffer;
>>> +
>>> +     if (drm_fbdev_use_shadow_fb(fb_helper) || !buffer->map.is_iomem=
)
>>> +             drm_fb_helper_sys_copyarea(info, area);
>>> +     else
>>> +             drm_fb_helper_cfb_copyarea(info, area);
>>> +}
>>> +
>>> +static void drm_fbdev_fb_imageblit(struct fb_info *info,
>>> +                                const struct fb_image *image)
>>> +{
>>> +     struct drm_fb_helper *fb_helper =3D info->par;
>>> +     struct drm_client_buffer *buffer =3D fb_helper->buffer;
>>> +
>>> +     if (drm_fbdev_use_shadow_fb(fb_helper) || !buffer->map.is_iomem=
)
>>> +             drm_fb_helper_sys_imageblit(info, image);
>>> +     else
>>> +             drm_fb_helper_cfb_imageblit(info, image);
>>> +}
>=20
> I think a todo.rst entry to make the new generic functions the real one=
s, and
> drivers not using the sys/cfb ones anymore would be a good addition.
> It's kinda covered by the move to the generic helpers, but maybe we
> can convert a few more drivers over to these here. Would also allow us
> to maybe flatten the code a bit and use more of the dma_buf_map stuff
> directly (instead of reusing crusty fbdev code written 20 years ago or
> so).

I wouldn't mind doing our own thing, but dma_buf_map is not a good fit
here. Mostly because the _cfb_ code first does a reads from I/O to
system memory, and then copies to userspace. The _sys_ functions copy
directly to userspace. (Same for write, but in the other direction.)

There's some code at the top and bottom of these functions that could be
shared. If we want to share the copy loops, we'd probably end up with
additional memcpys in the _sys_ case.

Best regards
Thomas

>=20
>>> +
>>>  static const struct fb_ops drm_fbdev_fb_ops =3D {
>>>       .owner          =3D THIS_MODULE,
>>>       DRM_FB_HELPER_DEFAULT_OPS,
>>> @@ -2050,11 +2239,11 @@ static const struct fb_ops drm_fbdev_fb_ops =3D=
 {
>>>       .fb_release     =3D drm_fbdev_fb_release,
>>>       .fb_destroy     =3D drm_fbdev_fb_destroy,
>>>       .fb_mmap        =3D drm_fbdev_fb_mmap,
>>> -     .fb_read        =3D drm_fb_helper_sys_read,
>>> -     .fb_write       =3D drm_fb_helper_sys_write,
>>> -     .fb_fillrect    =3D drm_fb_helper_sys_fillrect,
>>> -     .fb_copyarea    =3D drm_fb_helper_sys_copyarea,
>>> -     .fb_imageblit   =3D drm_fb_helper_sys_imageblit,
>>> +     .fb_read        =3D drm_fbdev_fb_read,
>>> +     .fb_write       =3D drm_fbdev_fb_write,
>>> +     .fb_fillrect    =3D drm_fbdev_fb_fillrect,
>>> +     .fb_copyarea    =3D drm_fbdev_fb_copyarea,
>>> +     .fb_imageblit   =3D drm_fbdev_fb_imageblit,
>>>  };
>>>
>>>  static struct fb_deferred_io drm_fbdev_defio =3D {
>>> diff --git a/include/drm/drm_mode_config.h b/include/drm/drm_mode_con=
fig.h
>>> index 5ffbb4ed5b35..ab424ddd7665 100644
>>> --- a/include/drm/drm_mode_config.h
>>> +++ b/include/drm/drm_mode_config.h
>>> @@ -877,18 +877,6 @@ struct drm_mode_config {
>>>        */
>>>       bool prefer_shadow_fbdev;
>>>
>>> -     /**
>>> -      * @fbdev_use_iomem:
>>> -      *
>>> -      * Set to true if framebuffer reside in iomem.
>>> -      * When set to true memcpy_toio() is used when copying the fram=
ebuffer in
>>> -      * drm_fb_helper.drm_fb_helper_dirty_blit_real().
>>> -      *
>>> -      * FIXME: This should be replaced with a per-mapping is_iomem
>>> -      * flag (like ttm does), and then used everywhere in fbdev code=
=2E
>>> -      */
>>> -     bool fbdev_use_iomem;
>>> -
>>>       /**
>>>        * @quirk_addfb_prefer_xbgr_30bpp:
>>>        *
>>> diff --git a/include/linux/dma-buf-map.h b/include/linux/dma-buf-map.=
h
>=20
> I think the below should be split out as a prep patch.
>=20
>>> index 2e8bbecb5091..6ca0f304dda2 100644
>>> --- a/include/linux/dma-buf-map.h
>>> +++ b/include/linux/dma-buf-map.h
>>> @@ -32,6 +32,14 @@
>>>   * accessing the buffer. Use the returned instance and the helper fu=
nctions
>>>   * to access the buffer's memory in the correct way.
>>>   *
>>> + * The type :c:type:`struct dma_buf_map <dma_buf_map>` and its helpe=
rs are
>>> + * actually independent from the dma-buf infrastructure. When sharin=
g buffers
>>> + * among devices, drivers have to know the location of the memory to=
 access
>>> + * the buffers in a safe way. :c:type:`struct dma_buf_map <dma_buf_m=
ap>`
>>> + * solves this problem for dma-buf and its users. If other drivers o=
r
>>> + * sub-systems require similar functionality, the type could be gene=
ralized
>>> + * and moved to a more prominent header file.
>>> + *
>>>   * Open-coding access to :c:type:`struct dma_buf_map <dma_buf_map>` =
is
>>>   * considered bad style. Rather then accessing its fields directly, =
use one
>>>   * of the provided helper functions, or implement your own. For exam=
ple,
>>> @@ -51,6 +59,14 @@
>>>   *
>>>   *   dma_buf_map_set_vaddr_iomem(&map. 0xdeadbeaf);
>>>   *
>>> + * Instances of struct dma_buf_map do not have to be cleaned up, but=

>>> + * can be cleared to NULL with dma_buf_map_clear(). Cleared mappings=

>>> + * always refer to system memory.
>>> + *
>>> + * .. code-block:: c
>>> + *
>>> + *   dma_buf_map_clear(&map);
>>> + *
>>>   * Test if a mapping is valid with either dma_buf_map_is_set() or
>>>   * dma_buf_map_is_null().
>>>   *
>>> @@ -73,17 +89,19 @@
>>>   *   if (dma_buf_map_is_equal(&sys_map, &io_map))
>>>   *           // always false
>>>   *
>>> - * Instances of struct dma_buf_map do not have to be cleaned up, but=

>>> - * can be cleared to NULL with dma_buf_map_clear(). Cleared mappings=

>>> - * always refer to system memory.
>>> + * A set up instance of struct dma_buf_map can be used to access or =
manipulate
>>> + * the buffer memory. Depending on the location of the memory, the p=
rovided
>>> + * helpers will pick the correct operations. Data can be copied into=
 the memory
>>> + * with dma_buf_map_memcpy_to(). The address can be manipulated with=

>>> + * dma_buf_map_incr().
>>>   *
>>> - * The type :c:type:`struct dma_buf_map <dma_buf_map>` and its helpe=
rs are
>>> - * actually independent from the dma-buf infrastructure. When sharin=
g buffers
>>> - * among devices, drivers have to know the location of the memory to=
 access
>>> - * the buffers in a safe way. :c:type:`struct dma_buf_map <dma_buf_m=
ap>`
>>> - * solves this problem for dma-buf and its users. If other drivers o=
r
>>> - * sub-systems require similar functionality, the type could be gene=
ralized
>>> - * and moved to a more prominent header file.
>>> + * .. code-block:: c
>>> + *
>>> + *   const void *src =3D ...; // source buffer
>>> + *   size_t len =3D ...; // length of src
>>> + *
>>> + *   dma_buf_map_memcpy_to(&map, src, len);
>>> + *   dma_buf_map_incr(&map, len); // go to first byte after the memc=
py
>>>   */
>>>
>>>  /**
>>> @@ -210,4 +228,38 @@ static inline void dma_buf_map_clear(struct dma_=
buf_map *map)
>>>       }
>>>  }
>>>
>>> +/**
>>> + * dma_buf_map_memcpy_to - Memcpy into dma-buf mapping
>>> + * @dst:     The dma-buf mapping structure
>>> + * @src:     The source buffer
>>> + * @len:     The number of byte in src
>>> + *
>>> + * Copies data into a dma-buf mapping. The source buffer is in syste=
m
>>> + * memory. Depending on the buffer's location, the helper picks the =
correct
>>> + * method of accessing the memory.
>>> + */
>>> +static inline void dma_buf_map_memcpy_to(struct dma_buf_map *dst, co=
nst void *src, size_t len)
>>> +{
>>> +     if (dst->is_iomem)
>>> +             memcpy_toio(dst->vaddr_iomem, src, len);
>>> +     else
>>> +             memcpy(dst->vaddr, src, len);
>>> +}
>>> +
>>> +/**
>>> + * dma_buf_map_incr - Increments the address stored in a dma-buf map=
ping
>>> + * @map:     The dma-buf mapping structure
>>> + * @incr:    The number of bytes to increment
>>> + *
>>> + * Increments the address stored in a dma-buf mapping. Depending on =
the
>>> + * buffer's location, the correct value will be updated.
>>> + */
>>> +static inline void dma_buf_map_incr(struct dma_buf_map *map, size_t =
incr)
>>> +{
>>> +     if (map->is_iomem)
>>> +             map->vaddr_iomem +=3D incr;
>>> +     else
>>> +             map->vaddr +=3D incr;
>>> +}
>>> +
>>>  #endif /* __DMA_BUF_MAP_H__ */
>>> --
>>> 2.28.0
>=20
> Aside from the details I think looks all reasonable.
> -Daniel
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--9SInwHdMlT9HJ8SWW0YhlKXr6GBVVNNex--

--wSkQnhyu1s6mke5MwMEXxiMF0P61mkAgk
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQFIBAEBCAAyFiEEchf7rIzpz2NEoWjlaA3BHVMLeiMFAl9+2vkUHHR6aW1tZXJt
YW5uQHN1c2UuZGUACgkQaA3BHVMLeiMmeAgAqwVo45DghrkjdBwYPmX4OVZnRERj
XUMMDFUfWoPmn1NUUVpBZmoS1/yVaB9U2asvyKAzBbPlcOgc+rk0jDE2LamWDzJH
jai4oxop9bFlBbyU70iWTvtfaJ8mNDCw9TB+jxY9hl4ikbxvs1eqEmHfHl5BkbK4
UM2tr+YOafQimRZqkLEA38LXzzpOlDfuO5LGot4VjyJ0TBL4W1/ph4sq8riK6ion
Rs7v9ywaMnDsNgCQ+yqK1SB+rDNUWc8SdOlal/y21OpyOz2b/zSyFAHE+Hqu5WSk
PtIQE26Mf0QpKSucONsOKip49UzGa5cdbdzNqDOl4inpYHbyEF30+l6c9A==
=so2q
-----END PGP SIGNATURE-----

--wSkQnhyu1s6mke5MwMEXxiMF0P61mkAgk--

--===============1300098971==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1300098971==--
