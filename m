Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EDB7073FE6D
	for <lists+dri-devel@lfdr.de>; Tue, 27 Jun 2023 16:39:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 71E6810E2F9;
	Tue, 27 Jun 2023 14:39:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
 by gabe.freedesktop.org (Postfix) with ESMTP id 5F4E110E318
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Jun 2023 14:39:00 +0000 (UTC)
Received: from loongson.cn (unknown [10.20.42.43])
 by gateway (Coremail) with SMTP id _____8AxxvCC9Jpk3ycDAA--.4981S3;
 Tue, 27 Jun 2023 22:38:58 +0800 (CST)
Received: from [10.20.42.43] (unknown [10.20.42.43])
 by localhost.localdomain (Coremail) with SMTP id
 AQAAf8DxJ82B9JpkWmEMAA--.47779S3; 
 Tue, 27 Jun 2023 22:38:57 +0800 (CST)
Message-ID: <494efbf8-b6b6-7e34-3fb4-950080f60a0d@loongson.cn>
Date: Tue, 27 Jun 2023 22:38:57 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [25/39] drm: renesas: shmobile: Rename shmob_drm_crtc.crtc
To: Geert Uytterhoeven <geert+renesas@glider.be>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Thomas Zimmermann <tzimmermann@suse.de>, Magnus Damm <magnus.damm@gmail.com>
References: <b3daca80f82625ba14e3aeaf2fca6dcefa056e47.1687423204.git.geert+renesas@glider.be>
Content-Language: en-US
From: Sui Jingfeng <suijingfeng@loongson.cn>
Organization: Loongson
In-Reply-To: <b3daca80f82625ba14e3aeaf2fca6dcefa056e47.1687423204.git.geert+renesas@glider.be>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID: AQAAf8DxJ82B9JpkWmEMAA--.47779S3
X-CM-SenderInfo: xvxlyxpqjiv03j6o00pqjv00gofq/
X-Coremail-Antispam: 1Uk129KBj93XoWxtw17AF43CryrCw13Gw1ktFc_yoW7KFy5pF
 48Aay3tF4FqFs0g343AFs2vF9xur15tas7CryUJ34akF1vqa47JF1fAFnxAF1UXry7Ca13
 ZrsxKF4rAr48u3gCm3ZEXasCq-sJn29KB7ZKAUJUUUUr529EdanIXcx71UUUUU7KY7ZEXa
 sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
 0xBIdaVrnRJUUUBqb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
 IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
 e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
 0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AK
 xVWxJr0_GcWln4kS14v26r1Y6r17M2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12
 xvs2x26I8E6xACxx1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1q
 6rW5McIj6I8E87Iv67AKxVW8Jr0_Cr1UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwI
 xGrwCYjI0SjxkI62AI1cAE67vIY487MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY
 6r1j6r4UMxCIbckI1I0E14v26r1Y6r17MI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7
 xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xII
 jxv20xvE14v26r4j6ryUMIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAIw2
 0EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Gr1j6F4UJwCI42IY6I8E87Iv6xkF
 7I0E14v26r4UJVWxJrUvcSsGvfC2KfnxnUUI43ZEXa7IU8q0PDUUUUU==
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
> Rename the "crtc" member of the shmob_drm_crtc subclass structure to
> "base", to improve readability.
>
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>


Reviewed-by: Sui Jingfeng <suijingfeng@loongson.cn>

> ---
>   .../gpu/drm/renesas/shmobile/shmob_drm_crtc.c | 26 +++++++++----------
>   .../gpu/drm/renesas/shmobile/shmob_drm_crtc.h |  2 +-
>   2 files changed, 14 insertions(+), 14 deletions(-)
>
> diff --git a/drivers/gpu/drm/renesas/shmobile/shmob_drm_crtc.c b/drivers/gpu/drm/renesas/shmobile/shmob_drm_crtc.c
> index 3f6af12f45988124..3f0b71253ed929c9 100644
> --- a/drivers/gpu/drm/renesas/shmobile/shmob_drm_crtc.c
> +++ b/drivers/gpu/drm/renesas/shmobile/shmob_drm_crtc.c
> @@ -64,7 +64,7 @@ static void shmob_drm_clk_off(struct shmob_drm_device *sdev)
>   
>   static void shmob_drm_crtc_setup_geometry(struct shmob_drm_crtc *scrtc)
>   {
> -	struct drm_crtc *crtc = &scrtc->crtc;
> +	struct drm_crtc *crtc = &scrtc->base;
>   	struct shmob_drm_device *sdev = to_shmob_device(crtc->dev);
>   	const struct drm_display_info *info = &sdev->connector->display_info;
>   	const struct drm_display_mode *mode = &crtc->mode;
> @@ -152,7 +152,7 @@ static void shmob_drm_crtc_setup_geometry(struct shmob_drm_crtc *scrtc)
>   
>   static void shmob_drm_crtc_start_stop(struct shmob_drm_crtc *scrtc, bool start)
>   {
> -	struct shmob_drm_device *sdev = to_shmob_device(scrtc->crtc.dev);
> +	struct shmob_drm_device *sdev = to_shmob_device(scrtc->base.dev);
>   	u32 value;
>   
>   	value = lcdc_read(sdev, LDCNT2R);
> @@ -185,7 +185,7 @@ static void shmob_drm_crtc_start_stop(struct shmob_drm_crtc *scrtc, bool start)
>    */
>   static void shmob_drm_crtc_start(struct shmob_drm_crtc *scrtc)
>   {
> -	struct drm_crtc *crtc = &scrtc->crtc;
> +	struct drm_crtc *crtc = &scrtc->base;
>   	struct shmob_drm_device *sdev = to_shmob_device(crtc->dev);
>   	const struct shmob_drm_interface_data *idata = &sdev->pdata->iface;
>   	const struct shmob_drm_format_info *format;
> @@ -272,7 +272,7 @@ static void shmob_drm_crtc_start(struct shmob_drm_crtc *scrtc)
>   
>   static void shmob_drm_crtc_stop(struct shmob_drm_crtc *scrtc)
>   {
> -	struct drm_crtc *crtc = &scrtc->crtc;
> +	struct drm_crtc *crtc = &scrtc->base;
>   	struct shmob_drm_device *sdev = to_shmob_device(crtc->dev);
>   
>   	if (!scrtc->started)
> @@ -308,7 +308,7 @@ void shmob_drm_crtc_resume(struct shmob_drm_crtc *scrtc)
>   static void shmob_drm_crtc_compute_base(struct shmob_drm_crtc *scrtc,
>   					int x, int y)
>   {
> -	struct drm_crtc *crtc = &scrtc->crtc;
> +	struct drm_crtc *crtc = &scrtc->base;
>   	struct drm_framebuffer *fb = crtc->primary->fb;
>   	struct drm_gem_dma_object *gem;
>   	unsigned int bpp;
> @@ -329,7 +329,7 @@ static void shmob_drm_crtc_compute_base(struct shmob_drm_crtc *scrtc,
>   
>   static void shmob_drm_crtc_update_base(struct shmob_drm_crtc *scrtc)
>   {
> -	struct drm_crtc *crtc = &scrtc->crtc;
> +	struct drm_crtc *crtc = &scrtc->base;
>   	struct shmob_drm_device *sdev = to_shmob_device(crtc->dev);
>   
>   	shmob_drm_crtc_compute_base(scrtc, crtc->x, crtc->y);
> @@ -343,7 +343,7 @@ static void shmob_drm_crtc_update_base(struct shmob_drm_crtc *scrtc)
>   
>   static inline struct shmob_drm_crtc *to_shmob_crtc(struct drm_crtc *crtc)
>   {
> -	return container_of(crtc, struct shmob_drm_crtc, crtc);
> +	return container_of(crtc, struct shmob_drm_crtc, base);
>   }
>   
>   static void shmob_drm_crtc_dpms(struct drm_crtc *crtc, int mode)
> @@ -415,15 +415,15 @@ static const struct drm_crtc_helper_funcs crtc_helper_funcs = {
>   void shmob_drm_crtc_finish_page_flip(struct shmob_drm_crtc *scrtc)
>   {
>   	struct drm_pending_vblank_event *event;
> -	struct drm_device *dev = scrtc->crtc.dev;
> +	struct drm_device *dev = scrtc->base.dev;
>   	unsigned long flags;
>   
>   	spin_lock_irqsave(&dev->event_lock, flags);
>   	event = scrtc->event;
>   	scrtc->event = NULL;
>   	if (event) {
> -		drm_crtc_send_vblank_event(&scrtc->crtc, event);
> -		drm_crtc_vblank_put(&scrtc->crtc);
> +		drm_crtc_send_vblank_event(&scrtc->base, event);
> +		drm_crtc_vblank_put(&scrtc->base);
>   	}
>   	spin_unlock_irqrestore(&dev->event_lock, flags);
>   }
> @@ -435,7 +435,7 @@ static int shmob_drm_crtc_page_flip(struct drm_crtc *crtc,
>   				    struct drm_modeset_acquire_ctx *ctx)
>   {
>   	struct shmob_drm_crtc *scrtc = to_shmob_crtc(crtc);
> -	struct drm_device *dev = scrtc->crtc.dev;
> +	struct drm_device *dev = scrtc->base.dev;
>   	unsigned long flags;
>   
>   	spin_lock_irqsave(&dev->event_lock, flags);
> @@ -450,7 +450,7 @@ static int shmob_drm_crtc_page_flip(struct drm_crtc *crtc,
>   
>   	if (event) {
>   		event->pipe = 0;
> -		drm_crtc_vblank_get(&scrtc->crtc);
> +		drm_crtc_vblank_get(&scrtc->base);
>   		spin_lock_irqsave(&dev->event_lock, flags);
>   		scrtc->event = event;
>   		spin_unlock_irqrestore(&dev->event_lock, flags);
> @@ -502,7 +502,7 @@ static const struct drm_crtc_funcs crtc_funcs = {
>   
>   int shmob_drm_crtc_create(struct shmob_drm_device *sdev)
>   {
> -	struct drm_crtc *crtc = &sdev->crtc.crtc;
> +	struct drm_crtc *crtc = &sdev->crtc.base;
>   	struct drm_plane *primary, *plane;
>   	unsigned int i;
>   	int ret;
> diff --git a/drivers/gpu/drm/renesas/shmobile/shmob_drm_crtc.h b/drivers/gpu/drm/renesas/shmobile/shmob_drm_crtc.h
> index f507eaf912e16a22..79cce0a0ada4cfce 100644
> --- a/drivers/gpu/drm/renesas/shmobile/shmob_drm_crtc.h
> +++ b/drivers/gpu/drm/renesas/shmobile/shmob_drm_crtc.h
> @@ -21,7 +21,7 @@ struct shmob_drm_device;
>   struct shmob_drm_format_info;
>   
>   struct shmob_drm_crtc {
> -	struct drm_crtc crtc;
> +	struct drm_crtc base;
>   
>   	struct drm_pending_vblank_event *event;
>   	int dpms;

-- 
Jingfeng

