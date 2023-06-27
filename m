Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B59F573FE78
	for <lists+dri-devel@lfdr.de>; Tue, 27 Jun 2023 16:40:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D16310E2FF;
	Tue, 27 Jun 2023 14:40:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
 by gabe.freedesktop.org (Postfix) with ESMTP id 6F86F10E2FF
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Jun 2023 14:40:35 +0000 (UTC)
Received: from loongson.cn (unknown [10.20.42.43])
 by gateway (Coremail) with SMTP id _____8AxS8bi9Jpk+ycDAA--.4922S3;
 Tue, 27 Jun 2023 22:40:34 +0800 (CST)
Received: from [10.20.42.43] (unknown [10.20.42.43])
 by localhost.localdomain (Coremail) with SMTP id
 AQAAf8DxfSPh9JpkKGIMAA--.406S3; 
 Tue, 27 Jun 2023 22:40:33 +0800 (CST)
Message-ID: <07531bb9-c12b-a9b6-ad96-be4557e2c041@loongson.cn>
Date: Tue, 27 Jun 2023 22:40:33 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [27/39] drm: renesas: shmobile: Rename shmob_drm_plane.plane
Content-Language: en-US
To: Geert Uytterhoeven <geert+renesas@glider.be>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Thomas Zimmermann <tzimmermann@suse.de>, Magnus Damm <magnus.damm@gmail.com>
References: <ecd392c966c967ac6826e20f8888e10161c9cbf7.1687423204.git.geert+renesas@glider.be>
From: Sui Jingfeng <suijingfeng@loongson.cn>
Organization: Loongson
In-Reply-To: <ecd392c966c967ac6826e20f8888e10161c9cbf7.1687423204.git.geert+renesas@glider.be>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID: AQAAf8DxfSPh9JpkKGIMAA--.406S3
X-CM-SenderInfo: xvxlyxpqjiv03j6o00pqjv00gofq/
X-Coremail-Antispam: 1Uk129KBj93XoW7Ary8ZFyxZr1kKF1kJFy5GFX_yoW8KryfpF
 48Aa4YkF4jqrWDKryUAa10vFZxZ3WfKryI9FyUJwsxKr4jq347Ar15JF9xCrsxJrWj9w42
 qFnIkr4kCF1jyrXCm3ZEXasCq-sJn29KB7ZKAUJUUUUr529EdanIXcx71UUUUU7KY7ZEXa
 sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
 0xBIdaVrnRJUUUBmb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
 IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
 e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
 0_Cr0_Gr1UM28EF7xvwVC2z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIEc7CjxVAF
 wI0_Cr1j6rxdM2kKe7AKxVWUXVWUAwAS0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07
 AIYIkI8VC2zVCFFI0UMc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWU
 tVWrXwAv7VC2z280aVAFwI0_Gr1j6F4UJwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64
 vIr41lc7I2V7IY0VAS07AlzVAYIcxG8wCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkE
 bVWUJVW8JwCFI7km07C267AKxVW8ZVWrXwC20s026c02F40E14v26r1j6r18MI8I3I0E74
 80Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0
 I7IYx2IY67AKxVW5JVW7JwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Cr0_Gr1UMIIF0xvE42
 xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVW8Jr0_Cr1UMIIF0xvEx4A2jsIE
 c7CjxVAFwI0_Gr1j6F4UJbIYCTnIWIevJa73UjIFyTuYvjxUc8sgUUUUU
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
Cc: linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 2023/6/22 17:21, Geert Uytterhoeven wrote:
> Rename the "plane" member of the shmob_drm_plane subclass structure to
> "base", to improve readability.
>
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

Reviewed-by: Sui Jingfeng <suijingfeng@loongson.cn>

> ---
>   drivers/gpu/drm/renesas/shmobile/shmob_drm_plane.c | 10 +++++-----
>   1 file changed, 5 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/gpu/drm/renesas/shmobile/shmob_drm_plane.c b/drivers/gpu/drm/renesas/shmobile/shmob_drm_plane.c
> index 63886015baaebfc0..e300e5c0de70a9b1 100644
> --- a/drivers/gpu/drm/renesas/shmobile/shmob_drm_plane.c
> +++ b/drivers/gpu/drm/renesas/shmobile/shmob_drm_plane.c
> @@ -20,7 +20,7 @@
>   #include "shmob_drm_regs.h"
>   
>   struct shmob_drm_plane {
> -	struct drm_plane plane;
> +	struct drm_plane base;
>   	unsigned int index;
>   	unsigned int alpha;
>   
> @@ -37,7 +37,7 @@ struct shmob_drm_plane {
>   
>   static inline struct shmob_drm_plane *to_shmob_plane(struct drm_plane *plane)
>   {
> -	return container_of(plane, struct shmob_drm_plane, plane);
> +	return container_of(plane, struct shmob_drm_plane, base);
>   }
>   
>   static void shmob_drm_plane_compute_base(struct shmob_drm_plane *splane,
> @@ -64,7 +64,7 @@ static void shmob_drm_plane_compute_base(struct shmob_drm_plane *splane,
>   static void __shmob_drm_plane_setup(struct shmob_drm_plane *splane,
>   				    struct drm_framebuffer *fb)
>   {
> -	struct shmob_drm_device *sdev = to_shmob_device(splane->plane.dev);
> +	struct shmob_drm_device *sdev = to_shmob_device(splane->base.dev);
>   	unsigned int ovl_idx = splane->index - 1;
>   	u32 format;
>   
> @@ -221,7 +221,7 @@ struct drm_plane *shmob_drm_plane_create(struct shmob_drm_device *sdev,
>   	}
>   
>   	splane = drmm_universal_plane_alloc(&sdev->ddev,
> -					    struct shmob_drm_plane, plane, 1,
> +					    struct shmob_drm_plane, base, 1,
>   					    funcs, formats,
>   					    ARRAY_SIZE(formats),  NULL, type,
>   					    NULL);
> @@ -231,5 +231,5 @@ struct drm_plane *shmob_drm_plane_create(struct shmob_drm_device *sdev,
>   	splane->index = index;
>   	splane->alpha = 255;
>   
> -	return &splane->plane;
> +	return &splane->base;
>   }

-- 
Jingfeng

