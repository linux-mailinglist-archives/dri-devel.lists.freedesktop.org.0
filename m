Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 23B4B6C3700
	for <lists+dri-devel@lfdr.de>; Tue, 21 Mar 2023 17:34:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CAA0C10E7D9;
	Tue, 21 Mar 2023 16:34:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from loongson.cn (mail.loongson.cn [114.242.206.163])
 by gabe.freedesktop.org (Postfix) with ESMTP id 0146310E7D9
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Mar 2023 16:34:32 +0000 (UTC)
Received: from loongson.cn (unknown [10.20.42.133])
 by gateway (Coremail) with SMTP id _____8AxUU+X3Blk7YIPAA--.11498S3;
 Wed, 22 Mar 2023 00:34:31 +0800 (CST)
Received: from [10.20.42.133] (unknown [10.20.42.133])
 by localhost.localdomain (Coremail) with SMTP id
 AQAAf8AxHL6W3BlkWMYIAA--.990S3; 
 Wed, 22 Mar 2023 00:34:30 +0800 (CST)
Message-ID: <4bcaca91-5194-7005-a4cf-42b7e526cc79@loongson.cn>
Date: Wed, 22 Mar 2023 00:34:30 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [v2,3/8] drm/fb-helper: Export drm_fb_helper_release_info()
To: Thomas Zimmermann <tzimmermann@suse.de>, javierm@redhat.com,
 daniel@ffwll.ch, airlied@gmail.com, mripard@kernel.org,
 maarten.lankhorst@linux.intel.com, zackr@vmware.com, kraxel@redhat.com,
 dri-devel@lists.freedesktop.org, virtualization@lists.linux-foundation.org,
 linux-graphics-maintainer@vmware.com
References: <20230320150751.20399-4-tzimmermann@suse.de>
Content-Language: en-US
From: Sui jingfeng <suijingfeng@loongson.cn>
In-Reply-To: <20230320150751.20399-4-tzimmermann@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID: AQAAf8AxHL6W3BlkWMYIAA--.990S3
X-CM-SenderInfo: xvxlyxpqjiv03j6o00pqjv00gofq/
X-Coremail-Antispam: 1Uk129KBjvJXoWxArW5Jw43GrWfGw48GFyDJrb_yoW5Kry8pF
 W3GFW5Kw4UtF45Gw17Wa1qy34fJws7Cr18Xrn7Gw4Syr1Utr929F1DCr1kuFW5Jr48Jr1Y
 yw1akF1UuF18Ca7anT9S1TB71UUUUUDqnTZGkaVYY2UrUUUUj1kv1TuYvTs0mT0YCTnIWj
 qI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUIcSsGvfJTRUUU
 bxkYFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I6I8E6xAIw20EY4v20xvaj40_Wr0E3s
 1l1IIY67AEw4v_Jrv_JF1l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxSw2x7M28EF7xv
 wVC0I7IYx2IY67AKxVW8JVW5JwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwA2z4
 x0Y4vEx4A2jsIE14v26r4j6F4UM28EF7xvwVC2z280aVCY1x0267AKxVW8JVW8Jr1le2I2
 62IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF0cIa020Ex4CE44I27wAqx4xG64xvF2IEw4
 CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jw0_WrylYx0Ex4A2jsIE14v26r4j6F4UMcvj
 eVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwIxGrwCYjI0SjxkI62AI1cAE67vIY487MxAIw2
 8IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4l
 x2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrw
 CI42IY6xIIjxv20xvE14v26r4j6ryUMIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI
 42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Gr0_Cr1lIxAIcVC2z2
 80aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7IU8l38UUUUUU==
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
> Export the fb_info release code as drm_fb_helper_release_info(). Will
> help with cleaning up failed fbdev probing.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
> Acked-by: Zack Rusin <zackr@vmware.com>
> ---
>   drivers/gpu/drm/drm_fb_helper.c | 33 ++++++++++++++++++++++++---------
>   include/drm/drm_fb_helper.h     |  5 +++++
>   2 files changed, 29 insertions(+), 9 deletions(-)
>
> diff --git a/drivers/gpu/drm/drm_fb_helper.c b/drivers/gpu/drm/drm_fb_helper.c
> index a39998047f8a..7e96ed9efdb5 100644
> --- a/drivers/gpu/drm/drm_fb_helper.c
> +++ b/drivers/gpu/drm/drm_fb_helper.c
> @@ -538,6 +538,29 @@ struct fb_info *drm_fb_helper_alloc_info(struct drm_fb_helper *fb_helper)
>   }
>   EXPORT_SYMBOL(drm_fb_helper_alloc_info);
>   
> +/**
> + * drm_fb_helper_release_info - release fb_info and its members
> + * @fb_helper: driver-allocated fbdev helper
> + *
> + * A helper to release fb_info and the member cmap.  Drivers do not
> + * need to release the allocated fb_info structure themselves, this is
> + * automatically done when calling drm_fb_helper_fini().
> + */
> +void drm_fb_helper_release_info(struct drm_fb_helper *fb_helper)
> +{
> +	struct fb_info *info = fb_helper->info;
> +
> +	if (!info)
> +		return;
> +
> +	fb_helper->info = NULL;
> +
> +	if (info->cmap.len)
> +		fb_dealloc_cmap(&info->cmap);
> +	framebuffer_release(info);
> +}
> +EXPORT_SYMBOL(drm_fb_helper_release_info);
> +
>   /**
>    * drm_fb_helper_unregister_info - unregister fb_info framebuffer device
>    * @fb_helper: driver-allocated fbdev helper, can be NULL
> @@ -561,8 +584,6 @@ EXPORT_SYMBOL(drm_fb_helper_unregister_info);
>    */
>   void drm_fb_helper_fini(struct drm_fb_helper *fb_helper)
>   {
> -	struct fb_info *info;
> -
>   	if (!fb_helper)
>   		return;
>   
> @@ -574,13 +595,7 @@ void drm_fb_helper_fini(struct drm_fb_helper *fb_helper)
>   	cancel_work_sync(&fb_helper->resume_work);
>   	cancel_work_sync(&fb_helper->damage_work);
>   
> -	info = fb_helper->info;
> -	if (info) {
> -		if (info->cmap.len)
> -			fb_dealloc_cmap(&info->cmap);
> -		framebuffer_release(info);
> -	}
> -	fb_helper->info = NULL;
> +	drm_fb_helper_release_info(fb_helper);
>   
>   	mutex_lock(&kernel_fb_helper_lock);
>   	if (!list_empty(&fb_helper->kernel_fb_list)) {
> diff --git a/include/drm/drm_fb_helper.h b/include/drm/drm_fb_helper.h
> index 013654de3fc5..c5822ec2fdd1 100644
> --- a/include/drm/drm_fb_helper.h
> +++ b/include/drm/drm_fb_helper.h
> @@ -256,6 +256,7 @@ int drm_fb_helper_check_var(struct fb_var_screeninfo *var,
>   int drm_fb_helper_restore_fbdev_mode_unlocked(struct drm_fb_helper *fb_helper);
>   
>   struct fb_info *drm_fb_helper_alloc_info(struct drm_fb_helper *fb_helper);
> +void drm_fb_helper_release_info(struct drm_fb_helper *fb_helper);
>   void drm_fb_helper_unregister_info(struct drm_fb_helper *fb_helper);
>   void drm_fb_helper_fill_info(struct fb_info *info,
>   			     struct drm_fb_helper *fb_helper,
> @@ -365,6 +366,10 @@ drm_fb_helper_alloc_info(struct drm_fb_helper *fb_helper)
>   	return NULL;
>   }
>   
> +static inline void drm_fb_helper_release_info(struct drm_fb_helper *fb_helper)
> +{
> +}
> +
>   static inline void drm_fb_helper_unregister_info(struct drm_fb_helper *fb_helper)
>   {
>   }

