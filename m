Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5568F73CA39
	for <lists+dri-devel@lfdr.de>; Sat, 24 Jun 2023 11:33:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 80EAA10E19B;
	Sat, 24 Jun 2023 09:33:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
 by gabe.freedesktop.org (Postfix) with ESMTP id 8BCAB10E19B
 for <dri-devel@lists.freedesktop.org>; Sat, 24 Jun 2023 09:33:40 +0000 (UTC)
Received: from loongson.cn (unknown [10.20.42.43])
 by gateway (Coremail) with SMTP id _____8AxxcRwuJZkgSoBAA--.1835S3;
 Sat, 24 Jun 2023 17:33:36 +0800 (CST)
Received: from [10.20.42.43] (unknown [10.20.42.43])
 by localhost.localdomain (Coremail) with SMTP id
 AQAAf8BxrM5vuJZkHQEFAA--.25269S3; 
 Sat, 24 Jun 2023 17:33:35 +0800 (CST)
Message-ID: <97bc4380-1a2a-aec7-168e-04536fc74e37@loongson.cn>
Date: Sat, 24 Jun 2023 17:33:35 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [28/39] drm: renesas: shmobile: Use drm_crtc_handle_vblank()
To: Geert Uytterhoeven <geert+renesas@glider.be>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Thomas Zimmermann <tzimmermann@suse.de>, Magnus Damm <magnus.damm@gmail.com>
References: <7b6ffa43307522833103fe29ec6a084b7d621a16.1687423204.git.geert+renesas@glider.be>
Content-Language: en-US
From: Sui Jingfeng <suijingfeng@loongson.cn>
Organization: Loongson
In-Reply-To: <7b6ffa43307522833103fe29ec6a084b7d621a16.1687423204.git.geert+renesas@glider.be>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf8BxrM5vuJZkHQEFAA--.25269S3
X-CM-SenderInfo: xvxlyxpqjiv03j6o00pqjv00gofq/
X-Coremail-Antispam: 1Uk129KBj93XoWxAFyfGw4kZFWfuw1fWr4Dtrc_yoW5XF4Up3
 y7JryayFyjqFWFqwnrGFn7ur13u345Ga4fCrW8t345Aw4vqw1fJF1rAw13Kr45JF97ua1j
 qr43K3yrZF1UuFXCm3ZEXasCq-sJn29KB7ZKAUJUUUU8529EdanIXcx71UUUUU7KY7ZEXa
 sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
 0xBIdaVrnRJUUUv0b4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
 IYs7xG6rWj6s0DM7CIcVAFz4kK6r106r15M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
 e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Jr0_JF4l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
 0_Jr0_Gr1l84ACjcxK6I8E87Iv67AKxVW8JVWxJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_
 Gr0_Gr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2x26I8E6xACxx1l5I
 8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r106r15McIj6I8E87Iv67AK
 xVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lc7I2V7IY0VAS07AlzV
 AYIcxG8wCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E
 14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIx
 kGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAF
 wI0_Jr0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r
 4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Jr0_GrUvcSsGvfC2KfnxnUUI43ZEXa7IU1EksDUU
 UUU==
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

Hi,


I'm fine with this patch but I I don't see the benefit.

This reply is more about my personal question.


On 2023/6/22 17:21, Geert Uytterhoeven wrote:
> Replace the call to the legacy drm_handle_vblank() function with a call
> to the new drm_crtc_handle_vblank() helper.
>
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Reviewed-by: Sui Jingfeng <suijingfeng@loongson.cn>
> ---
>   drivers/gpu/drm/renesas/shmobile/shmob_drm_drv.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/renesas/shmobile/shmob_drm_drv.c b/drivers/gpu/drm/renesas/shmobile/shmob_drm_drv.c
> index c98e2bdd888c3274..6eaf2c5a104f451a 100644
> --- a/drivers/gpu/drm/renesas/shmobile/shmob_drm_drv.c
> +++ b/drivers/gpu/drm/renesas/shmobile/shmob_drm_drv.c
> @@ -86,7 +86,7 @@ static irqreturn_t shmob_drm_irq(int irq, void *arg)
>   	spin_unlock_irqrestore(&sdev->irq_lock, flags);
>   
>   	if (status & LDINTR_VES) {
> -		drm_handle_vblank(dev, 0);
> +		drm_crtc_handle_vblank(&sdev->crtc.base);


After switching to drm_crtc_handle_vblank(),

your driver need another deference to the pointer of 'struct drm_crtc' 
to get the pointer of 'struct drm_device';

Plus another call to get the index(display pipe) of the CRTC by calling 
drm_crtc_index(crtc).


Consider that shmob-drm support only one display pipe,

is it that the switching is less straight forward than the original 
implement ?


```

/**
  * drm_crtc_handle_vblank - handle a vblank event
  * @crtc: where this event occurred
  *
  * Drivers should call this routine in their vblank interrupt handlers to
  * update the vblank counter and send any signals that may be pending.
  *
  * This is the native KMS version of drm_handle_vblank().
  *
  * Note that for a given vblank counter value drm_crtc_handle_vblank()
  * and drm_crtc_vblank_count() or drm_crtc_vblank_count_and_time()
  * provide a barrier: Any writes done before calling
  * drm_crtc_handle_vblank() will be visible to callers of the later
  * functions, if the vblank count is the same or a later one.
  *
  * See also &drm_vblank_crtc.count.
  *
  * Returns:
  * True if the event was successfully handled, false on failure.
  */
bool drm_crtc_handle_vblank(struct drm_crtc *crtc)
{
     return drm_handle_vblank(crtc->dev, drm_crtc_index(crtc));
}

```

Is it that drm_crtc_handle_vblank() function is preferred over 
drm_handle_vblank() in the future?

I'm fine with this question answered.


>   		shmob_drm_crtc_finish_page_flip(&sdev->crtc);
>   	}
>   

-- 
Jingfeng

