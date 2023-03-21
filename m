Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C7F46C36D5
	for <lists+dri-devel@lfdr.de>; Tue, 21 Mar 2023 17:22:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D795E10E2DA;
	Tue, 21 Mar 2023 16:22:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from loongson.cn (mail.loongson.cn [114.242.206.163])
 by gabe.freedesktop.org (Postfix) with ESMTP id 66D3210E2DA
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Mar 2023 16:22:27 +0000 (UTC)
Received: from loongson.cn (unknown [10.20.42.133])
 by gateway (Coremail) with SMTP id _____8Axz__B2RlksIEPAA--.23344S3;
 Wed, 22 Mar 2023 00:22:25 +0800 (CST)
Received: from [10.20.42.133] (unknown [10.20.42.133])
 by localhost.localdomain (Coremail) with SMTP id
 AQAAf8AxIL_B2RlkcMQIAA--.35925S3; 
 Wed, 22 Mar 2023 00:22:25 +0800 (CST)
Message-ID: <93c89ccc-8c32-586b-ea90-a99de495b358@loongson.cn>
Date: Wed, 22 Mar 2023 00:22:25 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [v2,7/8] drm/fb-helper: Consolidate
 CONFIG_DRM_FBDEV_LEAK_PHYS_SMEM
Content-Language: en-US
To: Thomas Zimmermann <tzimmermann@suse.de>, javierm@redhat.com,
 daniel@ffwll.ch, airlied@gmail.com, mripard@kernel.org,
 maarten.lankhorst@linux.intel.com, zackr@vmware.com, kraxel@redhat.com,
 dri-devel@lists.freedesktop.org, virtualization@lists.linux-foundation.org,
 linux-graphics-maintainer@vmware.com
References: <20230320150751.20399-8-tzimmermann@suse.de>
From: Sui jingfeng <suijingfeng@loongson.cn>
In-Reply-To: <20230320150751.20399-8-tzimmermann@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID: AQAAf8AxIL_B2RlkcMQIAA--.35925S3
X-CM-SenderInfo: xvxlyxpqjiv03j6o00pqjv00gofq/
X-Coremail-Antispam: 1Uk129KBjvJXoWxCF1xuF4xZF47KryfCr48JFb_yoW7JrWUpF
 Z3CFW7Krnrta1Fkrs7Cw1Dua4fKan7AFy8WFs5G3yfAr1jyr1I9Fn8A3WruFWrJrWxJr1f
 Xrnxua17u3ZFka7anT9S1TB71UUUUUDqnTZGkaVYY2UrUUUUj1kv1TuYvTs0mT0YCTnIWj
 qI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUIcSsGvfJTRUUU
 bxkYFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I6I8E6xAIw20EY4v20xvaj40_Wr0E3s
 1l1IIY67AEw4v_Jrv_JF1l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxSw2x7M28EF7xv
 wVC0I7IYx2IY67AKxVWUJVWUCwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwA2z4
 x0Y4vEx4A2jsIE14v26r4j6F4UM28EF7xvwVC2z280aVCY1x0267AKxVW8JVW8Jr1le2I2
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

Tested-by: Sui Jingfeng<suijingfeng@loongson.cn>

On 2023/3/20 23:07, Thomas Zimmermann wrote:
> Consolidate all handling of CONFIG_DRM_FBDEV_LEAK_PHYS_SMEM by
> making the module parameter optional in drm_fb_helper.c.
>
> Without the config option, modules can set smem_start in struct
> fb_info for internal usage, but not export if to userspace. The
> address can only be exported by enabling the option and setting
> the module parameter. Also update the comment.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
> Acked-by: Zack Rusin <zackr@vmware.com>
> ---
>   drivers/gpu/drm/drm_fb_helper.c | 22 ++++++++--------------
>   drivers/gpu/drm/drm_fbdev_dma.c |  9 +--------
>   include/drm/drm_fb_helper.h     |  9 ---------
>   3 files changed, 9 insertions(+), 31 deletions(-)
>
> diff --git a/drivers/gpu/drm/drm_fb_helper.c b/drivers/gpu/drm/drm_fb_helper.c
> index bb0b25209b3e..63ec95e86d0e 100644
> --- a/drivers/gpu/drm/drm_fb_helper.c
> +++ b/drivers/gpu/drm/drm_fb_helper.c
> @@ -60,16 +60,17 @@ MODULE_PARM_DESC(drm_fbdev_overalloc,
>    * In order to keep user-space compatibility, we want in certain use-cases
>    * to keep leaking the fbdev physical address to the user-space program
>    * handling the fbdev buffer.
> - * This is a bad habit essentially kept into closed source opengl driver
> - * that should really be moved into open-source upstream projects instead
> - * of using legacy physical addresses in user space to communicate with
> - * other out-of-tree kernel modules.
> + *
> + * This is a bad habit, essentially kept to support closed-source OpenGL
> + * drivers that should really be moved into open-source upstream projects
> + * instead of using legacy physical addresses in user space to communicate
> + * with other out-of-tree kernel modules.
>    *
>    * This module_param *should* be removed as soon as possible and be
>    * considered as a broken and legacy behaviour from a modern fbdev device.
>    */
> -#if IS_ENABLED(CONFIG_DRM_FBDEV_LEAK_PHYS_SMEM)
>   static bool drm_leak_fbdev_smem;
> +#if IS_ENABLED(CONFIG_DRM_FBDEV_LEAK_PHYS_SMEM)
>   module_param_unsafe(drm_leak_fbdev_smem, bool, 0600);
>   MODULE_PARM_DESC(drm_leak_fbdev_smem,
>   		 "Allow unsafe leaking fbdev physical smem address [default=false]");
> @@ -1983,10 +1984,6 @@ static int drm_fb_helper_single_fb_probe(struct drm_fb_helper *fb_helper)
>   		return ret;
>   	}
>   
> -#if IS_ENABLED(CONFIG_DRM_FBDEV_LEAK_PHYS_SMEM)
> -	fb_helper->hint_leak_smem_start = drm_leak_fbdev_smem;
> -#endif
> -
>   	/* push down into drivers */
>   	ret = (*fb_helper->funcs->fb_probe)(fb_helper, &sizes);
>   	if (ret < 0)
> @@ -2185,11 +2182,8 @@ __drm_fb_helper_initial_config_and_unlock(struct drm_fb_helper *fb_helper)
>   
>   	info = fb_helper->info;
>   	info->var.pixclock = 0;
> -	/* Shamelessly allow physical address leaking to userspace */
> -#if IS_ENABLED(CONFIG_DRM_FBDEV_LEAK_PHYS_SMEM)
> -	if (!fb_helper->hint_leak_smem_start)
> -#endif
> -		/* don't leak any physical addresses to userspace */
> +
> +	if (!drm_leak_fbdev_smem)
>   		info->flags |= FBINFO_HIDE_SMEM_START;
>   
>   	/* Need to drop locks to avoid recursive deadlock in
> diff --git a/drivers/gpu/drm/drm_fbdev_dma.c b/drivers/gpu/drm/drm_fbdev_dma.c
> index cf553ac12a0f..728deffcc0d9 100644
> --- a/drivers/gpu/drm/drm_fbdev_dma.c
> +++ b/drivers/gpu/drm/drm_fbdev_dma.c
> @@ -136,16 +136,9 @@ static int drm_fbdev_dma_helper_fb_probe(struct drm_fb_helper *fb_helper,
>   		info->flags |= FBINFO_READS_FAST; /* signal caching */
>   	info->screen_size = sizes->surface_height * fb->pitches[0];
>   	info->screen_buffer = map.vaddr;
> +	info->fix.smem_start = page_to_phys(virt_to_page(info->screen_buffer));
>   	info->fix.smem_len = info->screen_size;
>   
> -#if IS_ENABLED(CONFIG_DRM_FBDEV_LEAK_PHYS_SMEM)
> -	/*
> -	 * Shamelessly leak the physical address to user-space.
> -	 */
> -	if (fb_helper->hint_leak_smem_start && !info->fix.smem_start)
> -		info->fix.smem_start = page_to_phys(virt_to_page(info->screen_buffer));
> -#endif
> -
>   	return 0;
>   
>   err_drm_client_buffer_vunmap:
> diff --git a/include/drm/drm_fb_helper.h b/include/drm/drm_fb_helper.h
> index c5822ec2fdd1..72032c354a30 100644
> --- a/include/drm/drm_fb_helper.h
> +++ b/include/drm/drm_fb_helper.h
> @@ -195,15 +195,6 @@ struct drm_fb_helper {
>   	 */
>   	int preferred_bpp;
>   
> -	/**
> -	 * @hint_leak_smem_start:
> -	 *
> -	 * Hint to the fbdev emulation to store the framebuffer's physical
> -	 * address in struct &fb_info.fix.smem_start. If the hint is unset,
> -	 * the smem_start field should always be cleared to zero.
> -	 */
> -	bool hint_leak_smem_start;
> -
>   #ifdef CONFIG_FB_DEFERRED_IO
>   	/**
>   	 * @fbdefio:

