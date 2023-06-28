Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E0CD77407A0
	for <lists+dri-devel@lfdr.de>; Wed, 28 Jun 2023 03:30:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB23310E0A1;
	Wed, 28 Jun 2023 01:30:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
 by gabe.freedesktop.org (Postfix) with ESMTP id 2EABA10E0A1
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Jun 2023 01:30:36 +0000 (UTC)
Received: from loongson.cn (unknown [10.20.42.43])
 by gateway (Coremail) with SMTP id _____8DxuMU7jZtkxk0DAA--.5286S3;
 Wed, 28 Jun 2023 09:30:35 +0800 (CST)
Received: from [10.20.42.43] (unknown [10.20.42.43])
 by localhost.localdomain (Coremail) with SMTP id
 AQAAf8CxriM7jZtkzU4NAA--.11230S3; 
 Wed, 28 Jun 2023 09:30:35 +0800 (CST)
Message-ID: <7ce46e54-2b78-8073-d892-ea107ec318c3@loongson.cn>
Date: Wed, 28 Jun 2023 09:30:35 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: drm/udl: Convert to drm_crtc_helper_atomic_check()
To: Geert Uytterhoeven <geert+renesas@glider.be>,
 Dave Airlie <airlied@redhat.com>, Sean Paul <sean@poorly.run>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
References: <336040bba05b019d629551b350b15bad2df2ba96.1687425928.git.geert+renesas@glider.be>
Content-Language: en-US
From: Sui Jingfeng <suijingfeng@loongson.cn>
Organization: Loongson
In-Reply-To: <336040bba05b019d629551b350b15bad2df2ba96.1687425928.git.geert+renesas@glider.be>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID: AQAAf8CxriM7jZtkzU4NAA--.11230S3
X-CM-SenderInfo: xvxlyxpqjiv03j6o00pqjv00gofq/
X-Coremail-Antispam: 1Uk129KBj93XoW7ZFWfAF1DGrWxXr45Ww1Dtwc_yoW8Zw18pa
 nrArZ0yr4YqF4DC39rJa1qy3W5ua1Yka4xJrWkGw1fu3Z7Kr15XF1rZr18WF15Xay7J3Wf
 ZrnFyFy5Z3WY9FcCm3ZEXasCq-sJn29KB7ZKAUJUUUU8529EdanIXcx71UUUUU7KY7ZEXa
 sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
 0xBIdaVrnRJUUUvYb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
 IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
 e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
 0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW8JVWxJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_
 Gr0_Gr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2x26I8E6xACxx1l5I
 8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1q6rW5McIj6I8E87Iv67AK
 xVW8JVWxJwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lc7I2V7IY0VAS07AlzV
 AYIcxG8wCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E
 14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_JF0_Jw1lIx
 kGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVW8JVW5JwCI42IY6xIIjxv20xvEc7CjxVAF
 wI0_Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r4j6F
 4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x07josjUU
 UUUU=
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

Yeah, the net result is same.


On 2023/6/22 17:27, Geert Uytterhoeven wrote:
> Use the drm_crtc_helper_atomic_check() helper instead of open-coding the
> same operation.
>
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>

Reviewed-by: Sui Jingfeng <suijingfeng@loongson.cn>

> ---
> Compile-tested only.
> ---
>   drivers/gpu/drm/udl/udl_modeset.c | 13 ++-----------
>   1 file changed, 2 insertions(+), 11 deletions(-)
>
> diff --git a/drivers/gpu/drm/udl/udl_modeset.c b/drivers/gpu/drm/udl/udl_modeset.c
> index aa02fd2789c3f885..40876bcdd79a47ac 100644
> --- a/drivers/gpu/drm/udl/udl_modeset.c
> +++ b/drivers/gpu/drm/udl/udl_modeset.c
> @@ -12,6 +12,7 @@
>   
>   #include <drm/drm_atomic.h>
>   #include <drm/drm_atomic_helper.h>
> +#include <drm/drm_crtc_helper.h>
>   #include <drm/drm_damage_helper.h>
>   #include <drm/drm_drv.h>
>   #include <drm/drm_edid.h>
> @@ -310,16 +311,6 @@ static const struct drm_plane_funcs udl_primary_plane_funcs = {
>    * CRTC
>    */
>   
> -static int udl_crtc_helper_atomic_check(struct drm_crtc *crtc, struct drm_atomic_state *state)
> -{
> -	struct drm_crtc_state *new_crtc_state = drm_atomic_get_new_crtc_state(state, crtc);
> -
> -	if (!new_crtc_state->enable)
> -		return 0;
> -
> -	return drm_atomic_helper_check_crtc_primary_plane(new_crtc_state);
> -}
> -
>   static void udl_crtc_helper_atomic_enable(struct drm_crtc *crtc, struct drm_atomic_state *state)
>   {
>   	struct drm_device *dev = crtc->dev;
> @@ -381,7 +372,7 @@ static void udl_crtc_helper_atomic_disable(struct drm_crtc *crtc, struct drm_ato
>   }
>   
>   static const struct drm_crtc_helper_funcs udl_crtc_helper_funcs = {
> -	.atomic_check = udl_crtc_helper_atomic_check,
> +	.atomic_check = drm_crtc_helper_atomic_check,
>   	.atomic_enable = udl_crtc_helper_atomic_enable,
>   	.atomic_disable = udl_crtc_helper_atomic_disable,
>   };

-- 
Jingfeng

