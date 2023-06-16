Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 057FD73359D
	for <lists+dri-devel@lfdr.de>; Fri, 16 Jun 2023 18:15:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E22E510E650;
	Fri, 16 Jun 2023 16:15:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
 by gabe.freedesktop.org (Postfix) with ESMTP id D6CAD10E650
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Jun 2023 16:15:19 +0000 (UTC)
Received: from loongson.cn (unknown [10.20.42.43])
 by gateway (Coremail) with SMTP id _____8Cx8OiWioxkFwgGAA--.10926S3;
 Sat, 17 Jun 2023 00:15:18 +0800 (CST)
Received: from [10.20.42.43] (unknown [10.20.42.43])
 by localhost.localdomain (Coremail) with SMTP id
 AQAAf8CxG8qUioxkI3EdAA--.9038S3; 
 Sat, 17 Jun 2023 00:15:16 +0800 (CST)
Message-ID: <4839a7e1-179f-02ab-0679-44aea09e1946@loongson.cn>
Date: Sat, 17 Jun 2023 00:15:16 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: drm/atomic-helper: Update reference to
 drm_crtc_force_disable_all()
To: Geert Uytterhoeven <geert+renesas@glider.be>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Sean Paul <sean@poorly.run>, Alex Deucher <alexander.deucher@amd.com>
References: <87ece3775c9491fb2173f3bbe96cbe407b8ae756.1686923622.git.geert+renesas@glider.be>
Content-Language: en-US
From: Sui Jingfeng <suijingfeng@loongson.cn>
Organization: Loongson
In-Reply-To: <87ece3775c9491fb2173f3bbe96cbe407b8ae756.1686923622.git.geert+renesas@glider.be>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID: AQAAf8CxG8qUioxkI3EdAA--.9038S3
X-CM-SenderInfo: xvxlyxpqjiv03j6o00pqjv00gofq/
X-Coremail-Antispam: 1Uk129KBj93XoW7WFyfKr1xuFy8KF1kWFWfJFc_yoW8Xry7pr
 W7AryUtF4Fqa1qqasrXan2q3W3Ga13Aa4Igr4kG3y3ZwsI9r97XF18Xw4FgF9rJr1UGr4f
 trnIy34Uur1jkFbCm3ZEXasCq-sJn29KB7ZKAUJUUUU7529EdanIXcx71UUUUU7KY7ZEXa
 sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
 0xBIdaVrnRJUUU9Eb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
 IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
 e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Jr0_JF4l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
 0_Jr0_Gr1l84ACjcxK6I8E87Iv67AKxVWUJVW8JwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_
 Jr0_Gr1ln4kS14v26r1Y6r17M2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2
 x26I8E6xACxx1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r126r1D
 McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lc7
 I2V7IY0VAS07AlzVAYIcxG8wCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8
 JwCFI7km07C267AKxVWUXVWUAwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14
 v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY
 67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr1lIxAIcVCF04k26cxKx2
 IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_
 Jr0_GrUvcSsGvfC2KfnxnUUI43ZEXa7IU8q2NtUUUUU==
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,


Nice patch!


By the way, thomas also fix a bug[1] by calling 
drm_helper_force_disable_all() function

So this function seems useful. It deserved learn for a while. :-)


[1] https://patchwork.freedesktop.org/patch/541906/?series=119144&rev=1


On 2023/6/16 21:54, Geert Uytterhoeven wrote:
> drm_crtc_force_disable_all() was renamed to
> drm_helper_force_disable_all(), but one reference was not updated.
>
> Fixes: c2d88e06bcb98540 ("drm: Move the legacy kms disable_all helper to crtc helpers")
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by Sui Jingfeng <suijingfeng@loongson.cn>

> ---
>   drivers/gpu/drm/drm_atomic_helper.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/drm_atomic_helper.c b/drivers/gpu/drm/drm_atomic_helper.c
> index 41b8066f61fff4be..292e38eb621806a0 100644
> --- a/drivers/gpu/drm/drm_atomic_helper.c
> +++ b/drivers/gpu/drm/drm_atomic_helper.c
> @@ -3332,7 +3332,7 @@ EXPORT_SYMBOL(drm_atomic_helper_disable_all);
>    * that also takes a snapshot of the modeset state to be restored on resume.
>    *
>    * This is just a convenience wrapper around drm_atomic_helper_disable_all(),
> - * and it is the atomic version of drm_crtc_force_disable_all().
> + * and it is the atomic version of drm_helper_force_disable_all().
>    */
>   void drm_atomic_helper_shutdown(struct drm_device *dev)
>   {

-- 
Jingfeng

