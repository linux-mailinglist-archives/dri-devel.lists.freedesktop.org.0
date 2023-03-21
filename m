Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C2496C358D
	for <lists+dri-devel@lfdr.de>; Tue, 21 Mar 2023 16:23:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 79EC310E0BE;
	Tue, 21 Mar 2023 15:23:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from loongson.cn (mail.loongson.cn [114.242.206.163])
 by gabe.freedesktop.org (Postfix) with ESMTP id 6072A10E216
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Mar 2023 15:23:04 +0000 (UTC)
Received: from loongson.cn (unknown [10.20.42.133])
 by gateway (Coremail) with SMTP id _____8CxC9rWyxlksHoPAA--.29225S3;
 Tue, 21 Mar 2023 23:23:02 +0800 (CST)
Received: from [10.20.42.133] (unknown [10.20.42.133])
 by localhost.localdomain (Coremail) with SMTP id
 AQAAf8Cxfb7VyxlkT7kIAA--.25921S3; 
 Tue, 21 Mar 2023 23:23:01 +0800 (CST)
Message-ID: <8dff5007-ecbe-ac4f-d063-a4d27c660212@loongson.cn>
Date: Tue, 21 Mar 2023 23:23:01 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [v2,1/8] drm/fbdev-generic: Always use shadow buffering
To: Thomas Zimmermann <tzimmermann@suse.de>, javierm@redhat.com,
 daniel@ffwll.ch, airlied@gmail.com, mripard@kernel.org,
 maarten.lankhorst@linux.intel.com, zackr@vmware.com, kraxel@redhat.com,
 dri-devel@lists.freedesktop.org, virtualization@lists.linux-foundation.org,
 linux-graphics-maintainer@vmware.com
References: <20230320150751.20399-2-tzimmermann@suse.de>
Content-Language: en-US
From: Sui jingfeng <suijingfeng@loongson.cn>
In-Reply-To: <20230320150751.20399-2-tzimmermann@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf8Cxfb7VyxlkT7kIAA--.25921S3
X-CM-SenderInfo: xvxlyxpqjiv03j6o00pqjv00gofq/
X-Coremail-Antispam: 1Uk129KBjvJXoW3ZFWkCF4rCw1fGF4UGFW5GFg_yoWkJrW3pF
 W5KFW7Krs8t3WkWw1UWw4qy3W3AwsrtFy8Krn5G3yFya1DJr929Fn8CFyF9FWrGrWxCryU
 Jr1Fk3W8CF1vka7anT9S1TB71UUUUUDqnTZGkaVYY2UrUUUUj1kv1TuYvTs0mT0YCTnIWj
 qI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUIcSsGvfJTRUUU
 bxkYFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I6I8E6xAIw20EY4v20xvaj40_Wr0E3s
 1l1IIY67AEw4v_Jrv_JF1l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxSw2x7M28EF7xv
 wVC0I7IYx2IY67AKxVWUJVWUCwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwA2z4
 x0Y4vEx4A2jsIE14v26F4UJVW0owA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_GcCE3s1le2I2
 62IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF0cIa020Ex4CE44I27wAqx4xG64xvF2IEw4
 CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jrv_JF1lYx0Ex4A2jsIE14v26r4j6F4UMcvj
 eVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwIxGrwCYjI0SjxkI62AI1cAE67vIY487MxAIw2
 8IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4l
 x2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrw
 CI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwCI
 42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Gr0_Cr1lIxAIcVC2z2
 80aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7IU8vApUUUUUU==
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


On 2023/3/20 23:07, Thomas Zimmermann wrote:
> Remove all codepaths that implement fbdev output directly on GEM
> buffers. Always allocate a shadow buffer in system memory and set
> up deferred I/O for mmap.
>
> The fbdev code that operated directly on GEM buffers was used by
> drivers based on GEM DMA helpers. Those drivers have been migrated
> to use fbdev-dma, a dedicated fbdev emulation for DMA memory. All
> remaining users of fbdev-generic require shadow buffering.
>
> Memory management of the remaining callers uses TTM, GEM SHMEM
> helpers or a variant of GEM DMA helpers that is incompatible with
> fbdev-dma. Therefore remove the unused codepaths from fbdev-generic
> and simplify the code.
>
> Using a shadow buffer with deferred I/O is probably the best case
> for most remaining callers. Some of the TTM-based drivers might
> benefit from a dedicated fbdev emulation that operates directly on
> the driver's video memory.

I don't understand here,  the TTM-based drivers should have equivalent 
performance

with you implement. Because device memory typically very slow for cpu 
read, at least

this is true for Mips and loongarch architecture.  TTM-based drivers for 
those platform

is also prefer to render to system ram first(for fast reading and 
compositing) and then

blit to the real framebuffer pinned to VRAM.


In turn, I think shmem helper based drivers might benefit from a 
dedicated fbdev emulation.

Because you are blit to the shadow of the video memory for shmem helper 
based driver. The

driver may need another blit to the ultimate framebuffer.  Using a 
shadow buffer is still acceptable

though, but why  do you say "the TTM-based drivers might benefit from a 
dedicated fbdev emulation" ?

>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
> Acked-by: Zack Rusin <zackr@vmware.com>
> ---
>   drivers/gpu/drm/drm_fbdev_generic.c | 184 +++++-----------------------
>   1 file changed, 30 insertions(+), 154 deletions(-)
>
> diff --git a/drivers/gpu/drm/drm_fbdev_generic.c b/drivers/gpu/drm/drm_fbdev_generic.c
> index 4d6325e91565..e48a8e82378d 100644
> --- a/drivers/gpu/drm/drm_fbdev_generic.c
> +++ b/drivers/gpu/drm/drm_fbdev_generic.c
> @@ -11,16 +11,6 @@
>   
>   #include <drm/drm_fbdev_generic.h>
>   
> -static bool drm_fbdev_use_shadow_fb(struct drm_fb_helper *fb_helper)
> -{
> -	struct drm_device *dev = fb_helper->dev;
> -	struct drm_framebuffer *fb = fb_helper->fb;
> -
> -	return dev->mode_config.prefer_shadow_fbdev ||
> -	       dev->mode_config.prefer_shadow ||
> -	       fb->funcs->dirty;
> -}
> -
>   /* @user: 1=userspace, 0=fbcon */
>   static int drm_fbdev_fb_open(struct fb_info *info, int user)
>   {
> @@ -46,115 +36,33 @@ static int drm_fbdev_fb_release(struct fb_info *info, int user)
>   static void drm_fbdev_fb_destroy(struct fb_info *info)
>   {
>   	struct drm_fb_helper *fb_helper = info->par;
> -	void *shadow = NULL;
> +	void *shadow = info->screen_buffer;
>   
>   	if (!fb_helper->dev)
>   		return;
>   
> -	if (info->fbdefio)
> -		fb_deferred_io_cleanup(info);
> -	if (drm_fbdev_use_shadow_fb(fb_helper))
> -		shadow = info->screen_buffer;
> -
> +	fb_deferred_io_cleanup(info);
>   	drm_fb_helper_fini(fb_helper);
> -
> -	if (shadow)
> -		vfree(shadow);
> -	else if (fb_helper->buffer)
> -		drm_client_buffer_vunmap(fb_helper->buffer);
> -
> +	vfree(shadow);
>   	drm_client_framebuffer_delete(fb_helper->buffer);
> -	drm_client_release(&fb_helper->client);
>   
> +	drm_client_release(&fb_helper->client);
>   	drm_fb_helper_unprepare(fb_helper);
>   	kfree(fb_helper);
>   }
>   
> -static int drm_fbdev_fb_mmap(struct fb_info *info, struct vm_area_struct *vma)
> -{
> -	struct drm_fb_helper *fb_helper = info->par;
> -
> -	if (drm_fbdev_use_shadow_fb(fb_helper))
> -		return fb_deferred_io_mmap(info, vma);
> -	else if (fb_helper->dev->driver->gem_prime_mmap)
> -		return fb_helper->dev->driver->gem_prime_mmap(fb_helper->buffer->gem, vma);
> -	else
> -		return -ENODEV;
> -}
> -
> -static bool drm_fbdev_use_iomem(struct fb_info *info)
> -{
> -	struct drm_fb_helper *fb_helper = info->par;
> -	struct drm_client_buffer *buffer = fb_helper->buffer;
> -
> -	return !drm_fbdev_use_shadow_fb(fb_helper) && buffer->map.is_iomem;
> -}
> -
> -static ssize_t drm_fbdev_fb_read(struct fb_info *info, char __user *buf,
> -				 size_t count, loff_t *ppos)
> -{
> -	ssize_t ret;
> -
> -	if (drm_fbdev_use_iomem(info))
> -		ret = drm_fb_helper_cfb_read(info, buf, count, ppos);
> -	else
> -		ret = drm_fb_helper_sys_read(info, buf, count, ppos);
> -
> -	return ret;
> -}
> -
> -static ssize_t drm_fbdev_fb_write(struct fb_info *info, const char __user *buf,
> -				  size_t count, loff_t *ppos)
> -{
> -	ssize_t ret;
> -
> -	if (drm_fbdev_use_iomem(info))
> -		ret = drm_fb_helper_cfb_write(info, buf, count, ppos);
> -	else
> -		ret = drm_fb_helper_sys_write(info, buf, count, ppos);
> -
> -	return ret;
> -}
> -
> -static void drm_fbdev_fb_fillrect(struct fb_info *info,
> -				  const struct fb_fillrect *rect)
> -{
> -	if (drm_fbdev_use_iomem(info))
> -		drm_fb_helper_cfb_fillrect(info, rect);
> -	else
> -		drm_fb_helper_sys_fillrect(info, rect);
> -}
> -
> -static void drm_fbdev_fb_copyarea(struct fb_info *info,
> -				  const struct fb_copyarea *area)
> -{
> -	if (drm_fbdev_use_iomem(info))
> -		drm_fb_helper_cfb_copyarea(info, area);
> -	else
> -		drm_fb_helper_sys_copyarea(info, area);
> -}
> -
> -static void drm_fbdev_fb_imageblit(struct fb_info *info,
> -				   const struct fb_image *image)
> -{
> -	if (drm_fbdev_use_iomem(info))
> -		drm_fb_helper_cfb_imageblit(info, image);
> -	else
> -		drm_fb_helper_sys_imageblit(info, image);
> -}
> -
>   static const struct fb_ops drm_fbdev_fb_ops = {
>   	.owner		= THIS_MODULE,
> -	DRM_FB_HELPER_DEFAULT_OPS,
>   	.fb_open	= drm_fbdev_fb_open,
>   	.fb_release	= drm_fbdev_fb_release,
> +	.fb_read	= drm_fb_helper_sys_read,
> +	.fb_write	= drm_fb_helper_sys_write,
> +	DRM_FB_HELPER_DEFAULT_OPS,
> +	.fb_fillrect	= drm_fb_helper_sys_fillrect,
> +	.fb_copyarea	= drm_fb_helper_sys_copyarea,
> +	.fb_imageblit	= drm_fb_helper_sys_imageblit,
> +	.fb_mmap	= fb_deferred_io_mmap,
>   	.fb_destroy	= drm_fbdev_fb_destroy,
> -	.fb_mmap	= drm_fbdev_fb_mmap,
> -	.fb_read	= drm_fbdev_fb_read,
> -	.fb_write	= drm_fbdev_fb_write,
> -	.fb_fillrect	= drm_fbdev_fb_fillrect,
> -	.fb_copyarea	= drm_fbdev_fb_copyarea,
> -	.fb_imageblit	= drm_fbdev_fb_imageblit,
>   };
>   
>   /*
> @@ -169,7 +77,6 @@ static int drm_fbdev_fb_probe(struct drm_fb_helper *fb_helper,
>   	struct drm_framebuffer *fb;
>   	struct fb_info *info;
>   	u32 format;
> -	struct iosys_map map;
>   	int ret;
>   
>   	drm_dbg_kms(dev, "surface width(%d), height(%d) and bpp(%d)\n",
> @@ -197,44 +104,21 @@ static int drm_fbdev_fb_probe(struct drm_fb_helper *fb_helper,
>   
>   	drm_fb_helper_fill_info(info, fb_helper, sizes);
>   
> -	if (drm_fbdev_use_shadow_fb(fb_helper)) {
> -		info->screen_buffer = vzalloc(info->screen_size);
> -		if (!info->screen_buffer)
> -			return -ENOMEM;
> -		info->flags |= FBINFO_VIRTFB | FBINFO_READS_FAST;
> +	info->screen_buffer = vzalloc(info->screen_size);
> +	if (!info->screen_buffer)
> +		return -ENOMEM;
> +	info->flags |= FBINFO_VIRTFB | FBINFO_READS_FAST;
>   
> -		/* Set a default deferred I/O handler */
> -		fb_helper->fbdefio.delay = HZ / 20;
> -		fb_helper->fbdefio.deferred_io = drm_fb_helper_deferred_io;
> +	info->fix.smem_start = page_to_phys(vmalloc_to_page(info->screen_buffer));

Why  simply use  screen_buffer instead of info->screen_buffer here ?

info->fix.smem_start = page_to_phys(vmalloc_to_page(screen_buffer));

I'm asking because I see you use vfree(screen_buffer) below the err_vfree label in this function.


I also want to ask another question here:
I heard,//the/ /memory/ /allocated/ /by//*//vzalloc//*//is/ /not/ /physically/ /contiguous/. /Why such a virtual address can convert to physical address by//page_to_phys(vmalloc_to_page())?//Does it legal for a GPU without MMU accessing such a physical address leaked to user-space?

> -		info->fbdefio = &fb_helper->fbdefio;
> -		ret = fb_deferred_io_init(info);
> -		if (ret)
> -			return ret;
> -	} else {
> -		/* buffer is mapped for HW framebuffer */
> -		ret = drm_client_buffer_vmap(fb_helper->buffer, &map);
> -		if (ret)
> -			return ret;
> -		if (map.is_iomem) {
> -			info->screen_base = map.vaddr_iomem;
> -		} else {
> -			info->screen_buffer = map.vaddr;
> -			info->flags |= FBINFO_VIRTFB;
> -		}
> -
> -		/*
> -		 * Shamelessly leak the physical address to user-space. As
> -		 * page_to_phys() is undefined for I/O memory, warn in this
> -		 * case.
> -		 */
> -#if IS_ENABLED(CONFIG_DRM_FBDEV_LEAK_PHYS_SMEM)
> -		if (fb_helper->hint_leak_smem_start && info->fix.smem_start == 0 &&
> -		    !drm_WARN_ON_ONCE(dev, map.is_iomem))
> -			info->fix.smem_start =
> -				page_to_phys(virt_to_page(info->screen_buffer));
> -#endif
> -	}
> +	/* Set a default deferred I/O handler */
> +	fb_helper->fbdefio.delay = HZ / 20;
> +	fb_helper->fbdefio.deferred_io = drm_fb_helper_deferred_io;
> +
> +	info->fbdefio = &fb_helper->fbdefio;
> +	ret = fb_deferred_io_init(info);
> +	if (ret)
> +		return ret;
>   
>   	return 0;
>   }
> @@ -318,18 +202,13 @@ static int drm_fbdev_fb_dirty(struct drm_fb_helper *helper, struct drm_clip_rect
>   	struct drm_device *dev = helper->dev;
>   	int ret;
>   
> -	if (!drm_fbdev_use_shadow_fb(helper))
> -		return 0;
> -
>   	/* Call damage handlers only if necessary */
>   	if (!(clip->x1 < clip->x2 && clip->y1 < clip->y2))
>   		return 0;
>   
> -	if (helper->buffer) {
> -		ret = drm_fbdev_damage_blit(helper, clip);
> -		if (drm_WARN_ONCE(dev, ret, "Damage blitter failed: ret=%d\n", ret))
> -			return ret;
> -	}
> +	ret = drm_fbdev_damage_blit(helper, clip);
> +	if (drm_WARN_ONCE(dev, ret, "Damage blitter failed: ret=%d\n", ret))
> +		return ret;
>   
>   	if (helper->fb->funcs->dirty) {
>   		ret = helper->fb->funcs->dirty(helper->fb, NULL, 0, 0, clip, 1);
> @@ -415,12 +294,9 @@ static const struct drm_client_funcs drm_fbdev_client_funcs = {
>    * suspend/resume need to call drm_fb_helper_set_suspend_unlocked() themselves.
>    * Simple drivers might use drm_mode_config_helper_suspend().
>    *
> - * Drivers that set the dirty callback on their framebuffer will get a shadow
> - * fbdev buffer that is blitted onto the real buffer. This is done in order to
> - * make deferred I/O work with all kinds of buffers. A shadow buffer can be
> - * requested explicitly by setting struct drm_mode_config.prefer_shadow or
> - * struct drm_mode_config.prefer_shadow_fbdev to true beforehand. This is
> - * required to use generic fbdev emulation with SHMEM helpers.
> + * In order to provide fixed mmap-able memory ranges,

I don't understand here, what do you mean about *fixed*?

fixed relative to what? Can you say more?

