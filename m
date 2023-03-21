Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 29CA96C3145
	for <lists+dri-devel@lfdr.de>; Tue, 21 Mar 2023 13:09:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 23AC410E750;
	Tue, 21 Mar 2023 12:09:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from loongson.cn (mail.loongson.cn [114.242.206.163])
 by gabe.freedesktop.org (Postfix) with ESMTP id D556C10E750
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Mar 2023 12:09:37 +0000 (UTC)
Received: from loongson.cn (unknown [10.20.42.133])
 by gateway (Coremail) with SMTP id _____8AxJAx_nhlk9WYPAA--.22625S3;
 Tue, 21 Mar 2023 20:09:35 +0800 (CST)
Received: from [10.20.42.133] (unknown [10.20.42.133])
 by localhost.localdomain (Coremail) with SMTP id
 AQAAf8CxLuR+nhlkspMIAA--.35904S3; 
 Tue, 21 Mar 2023 20:09:34 +0800 (CST)
Message-ID: <fcf01f46-1349-205a-f51f-a188670c5728@loongson.cn>
Date: Tue, 21 Mar 2023 20:09:34 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [v2,2/8] drm/fbdev-generic: Remove unused prefer_shadow_fbdev flag
Content-Language: en-US
To: Thomas Zimmermann <tzimmermann@suse.de>, javierm@redhat.com,
 daniel@ffwll.ch, airlied@gmail.com, mripard@kernel.org,
 maarten.lankhorst@linux.intel.com, zackr@vmware.com, kraxel@redhat.com,
 dri-devel@lists.freedesktop.org, virtualization@lists.linux-foundation.org,
 linux-graphics-maintainer@vmware.com
References: <20230320150751.20399-3-tzimmermann@suse.de>
From: Sui jingfeng <suijingfeng@loongson.cn>
In-Reply-To: <20230320150751.20399-3-tzimmermann@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID: AQAAf8CxLuR+nhlkspMIAA--.35904S3
X-CM-SenderInfo: xvxlyxpqjiv03j6o00pqjv00gofq/
X-Coremail-Antispam: 1Uk129KBjvJXoWxAFWrWw1kAryUCFW7GF13CFg_yoW5GryfpF
 W5JF45Kr12yas0yFy7CFWUWr15Zws7KFy2kF9rAwn3uanFyry29rn5Aw43Zry8WrZrAr45
 KrZ3uF4UGr12v3DanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUj1kv1TuYvTs0mT0YCTnIWj
 qI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUIcSsGvfJTRUUU
 bxxYFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I6I8E6xAIw20EY4v20xvaj40_Wr0E3s
 1l1IIY67AEw4v_JrI_Jryl8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxSw2x7M28EF7xv
 wVC0I7IYx2IY67AKxVWUCVW8JwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwA2z4
 x0Y4vEx4A2jsIE14v26F4UJVW0owA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_GcCE3s1le2I2
 62IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF0cIa020Ex4CE44I27wAqx4xG64xvF2IEw4
 CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_JrI_JrylYx0Ex4A2jsIE14v26r1j6r4UMcvj
 eVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwIxGrwCYjI0SjxkI62AI1cAE67vIY487MxAIw2
 8IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4l
 x2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrw
 CI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwCI
 42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z2
 80aVCY1x0267AKxVWUJVW8JbIYCTnIWIevJa73UjIFyTuYvjxUzZ2-UUUUU
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

Well, this patch looks good to me.

Tested-by: Sui Jingfeng <suijingfeng@loongson.cn>

On 2023/3/20 23:07, Thomas Zimmermann wrote:
> Remove the flag prefer_shadow_fbdev from struct drm_mode_config.
> Drivers set this flag to enable shadow buffering in the generic
> fbdev emulation. Such shadow buffering is now mandatory, so the
> flag is unused.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
> Reviewed-by: Zack Rusin <zackr@vmware.com>
> ---
>   drivers/gpu/drm/tiny/bochs.c        | 1 -
>   drivers/gpu/drm/vmwgfx/vmwgfx_kms.c | 1 -
>   include/drm/drm_mode_config.h       | 7 -------
>   3 files changed, 9 deletions(-)
>
> diff --git a/drivers/gpu/drm/tiny/bochs.c b/drivers/gpu/drm/tiny/bochs.c
> index 024346054c70..d254679a136e 100644
> --- a/drivers/gpu/drm/tiny/bochs.c
> +++ b/drivers/gpu/drm/tiny/bochs.c
> @@ -545,7 +545,6 @@ static int bochs_kms_init(struct bochs_device *bochs)
>   
>   	bochs->dev->mode_config.preferred_depth = 24;
>   	bochs->dev->mode_config.prefer_shadow = 0;
> -	bochs->dev->mode_config.prefer_shadow_fbdev = 1;
>   	bochs->dev->mode_config.quirk_addfb_prefer_host_byte_order = true;
>   
>   	bochs->dev->mode_config.funcs = &bochs_mode_funcs;
> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c b/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c
> index 84d6380b9895..5162a7a12792 100644
> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c
> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c
> @@ -2112,7 +2112,6 @@ int vmw_kms_init(struct vmw_private *dev_priv)
>   	dev->mode_config.max_width = dev_priv->texture_max_width;
>   	dev->mode_config.max_height = dev_priv->texture_max_height;
>   	dev->mode_config.preferred_depth = dev_priv->assume_16bpp ? 16 : 32;
> -	dev->mode_config.prefer_shadow_fbdev = !dev_priv->has_mob;
>   
>   	drm_mode_create_suggested_offset_properties(dev);
>   	vmw_kms_create_hotplug_mode_update_property(dev_priv);
> diff --git a/include/drm/drm_mode_config.h b/include/drm/drm_mode_config.h
> index e5b053001d22..973119a9176b 100644
> --- a/include/drm/drm_mode_config.h
> +++ b/include/drm/drm_mode_config.h
> @@ -890,13 +890,6 @@ struct drm_mode_config {
>   	/* dumb ioctl parameters */
>   	uint32_t preferred_depth, prefer_shadow;
>   
> -	/**
> -	 * @prefer_shadow_fbdev:
> -	 *
> -	 * Hint to framebuffer emulation to prefer shadow-fb rendering.
> -	 */
> -	bool prefer_shadow_fbdev;
> -
>   	/**
>   	 * @quirk_addfb_prefer_xbgr_30bpp:
>   	 *

