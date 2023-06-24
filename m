Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E94F73CA4A
	for <lists+dri-devel@lfdr.de>; Sat, 24 Jun 2023 11:49:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 94D0A10E113;
	Sat, 24 Jun 2023 09:49:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
 by gabe.freedesktop.org (Postfix) with ESMTP id 6D84310E113
 for <dri-devel@lists.freedesktop.org>; Sat, 24 Jun 2023 09:49:26 +0000 (UTC)
Received: from loongson.cn (unknown [10.20.42.43])
 by gateway (Coremail) with SMTP id _____8BxV8UlvJZkYywBAA--.1956S3;
 Sat, 24 Jun 2023 17:49:25 +0800 (CST)
Received: from [10.20.42.43] (unknown [10.20.42.43])
 by localhost.localdomain (Coremail) with SMTP id
 AQAAf8CxvM4lvJZkqwYFAA--.25584S3; 
 Sat, 24 Jun 2023 17:49:25 +0800 (CST)
Message-ID: <1a85a81b-36d4-02c9-50c2-8a1988a4ef37@loongson.cn>
Date: Sat, 24 Jun 2023 17:49:25 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [20/39] drm: renesas: shmobile: Replace .dev_private with
 container_of()
To: Geert Uytterhoeven <geert+renesas@glider.be>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Thomas Zimmermann <tzimmermann@suse.de>, Magnus Damm <magnus.damm@gmail.com>
References: <48a0d1dcdf18ca07b97e2813ba26f9e52198a716.1687423204.git.geert+renesas@glider.be>
Content-Language: en-US
From: Sui Jingfeng <suijingfeng@loongson.cn>
Organization: Loongson
In-Reply-To: <48a0d1dcdf18ca07b97e2813ba26f9e52198a716.1687423204.git.geert+renesas@glider.be>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID: AQAAf8CxvM4lvJZkqwYFAA--.25584S3
X-CM-SenderInfo: xvxlyxpqjiv03j6o00pqjv00gofq/
X-Coremail-Antispam: 1Uk129KBj93XoWxtw45Xw43JF18Aw45XrW5urX_yoWfGF1xpF
 48AayYyFW0qrZ0gryUAFsruFnI9r13ta4fuFyUG3y3Kr4vq347J3WrJFnxCFWDJry7Ca13
 XrnIgF4rZr109rXCm3ZEXasCq-sJn29KB7ZKAUJUUUU8529EdanIXcx71UUUUU7KY7ZEXa
 sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
 0xBIdaVrnRJUUUvYb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
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
 4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x07URa0PU
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
Cc: linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On 2023/6/22 17:21, Geert Uytterhoeven wrote:
> Now that drm_device is embedded in shmob_drm_device, we can use
> a container_of()-based helper to get the shmob_drm_device pointer from
> the drm_device, instead of using the deprecated drm_device.dev_private
> field.
>
> While at it, restore reverse Xmas tree ordering of local variable
> declarations.
>
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

Reviewed-by: Sui Jingfeng <suijingfeng@loongson.cn>

> ---
>   .../gpu/drm/renesas/shmobile/shmob_drm_crtc.c | 20 +++++++++----------
>   .../gpu/drm/renesas/shmobile/shmob_drm_drv.c  |  4 +---
>   .../gpu/drm/renesas/shmobile/shmob_drm_drv.h  |  5 +++++
>   .../drm/renesas/shmobile/shmob_drm_plane.c    |  6 +++---
>   4 files changed, 19 insertions(+), 16 deletions(-)
>
> diff --git a/drivers/gpu/drm/renesas/shmobile/shmob_drm_crtc.c b/drivers/gpu/drm/renesas/shmobile/shmob_drm_crtc.c
> index 40948b56017ff2df..291b3a5014c24f08 100644
> --- a/drivers/gpu/drm/renesas/shmobile/shmob_drm_crtc.c
> +++ b/drivers/gpu/drm/renesas/shmobile/shmob_drm_crtc.c
> @@ -63,7 +63,7 @@ static void shmob_drm_clk_off(struct shmob_drm_device *sdev)
>   static void shmob_drm_crtc_setup_geometry(struct shmob_drm_crtc *scrtc)
>   {
>   	struct drm_crtc *crtc = &scrtc->crtc;
> -	struct shmob_drm_device *sdev = crtc->dev->dev_private;
> +	struct shmob_drm_device *sdev = to_shmob_device(crtc->dev);
>   	const struct shmob_drm_interface_data *idata = &sdev->pdata->iface;
>   	const struct drm_display_mode *mode = &crtc->mode;
>   	u32 value;
> @@ -102,7 +102,7 @@ static void shmob_drm_crtc_setup_geometry(struct shmob_drm_crtc *scrtc)
>   
>   static void shmob_drm_crtc_start_stop(struct shmob_drm_crtc *scrtc, bool start)
>   {
> -	struct shmob_drm_device *sdev = scrtc->crtc.dev->dev_private;
> +	struct shmob_drm_device *sdev = to_shmob_device(scrtc->crtc.dev);
>   	u32 value;
>   
>   	value = lcdc_read(sdev, LDCNT2R);
> @@ -136,7 +136,7 @@ static void shmob_drm_crtc_start_stop(struct shmob_drm_crtc *scrtc, bool start)
>   static void shmob_drm_crtc_start(struct shmob_drm_crtc *scrtc)
>   {
>   	struct drm_crtc *crtc = &scrtc->crtc;
> -	struct shmob_drm_device *sdev = crtc->dev->dev_private;
> +	struct shmob_drm_device *sdev = to_shmob_device(crtc->dev);
>   	const struct shmob_drm_interface_data *idata = &sdev->pdata->iface;
>   	const struct shmob_drm_format_info *format;
>   	struct drm_device *dev = &sdev->ddev;
> @@ -223,7 +223,7 @@ static void shmob_drm_crtc_start(struct shmob_drm_crtc *scrtc)
>   static void shmob_drm_crtc_stop(struct shmob_drm_crtc *scrtc)
>   {
>   	struct drm_crtc *crtc = &scrtc->crtc;
> -	struct shmob_drm_device *sdev = crtc->dev->dev_private;
> +	struct shmob_drm_device *sdev = to_shmob_device(crtc->dev);
>   
>   	if (!scrtc->started)
>   		return;
> @@ -280,7 +280,7 @@ static void shmob_drm_crtc_compute_base(struct shmob_drm_crtc *scrtc,
>   static void shmob_drm_crtc_update_base(struct shmob_drm_crtc *scrtc)
>   {
>   	struct drm_crtc *crtc = &scrtc->crtc;
> -	struct shmob_drm_device *sdev = crtc->dev->dev_private;
> +	struct shmob_drm_device *sdev = to_shmob_device(crtc->dev);
>   
>   	shmob_drm_crtc_compute_base(scrtc, crtc->x, crtc->y);
>   
> @@ -322,8 +322,8 @@ static int shmob_drm_crtc_mode_set(struct drm_crtc *crtc,
>   				   int x, int y,
>   				   struct drm_framebuffer *old_fb)
>   {
> +	struct shmob_drm_device *sdev = to_shmob_device(crtc->dev);
>   	struct shmob_drm_crtc *scrtc = to_shmob_crtc(crtc);
> -	struct shmob_drm_device *sdev = crtc->dev->dev_private;
>   	const struct shmob_drm_format_info *format;
>   
>   	format = shmob_drm_format_info(crtc->primary->fb->format->format);
> @@ -428,7 +428,7 @@ static void shmob_drm_crtc_enable_vblank(struct shmob_drm_device *sdev,
>   
>   static int shmob_drm_enable_vblank(struct drm_crtc *crtc)
>   {
> -	struct shmob_drm_device *sdev = crtc->dev->dev_private;
> +	struct shmob_drm_device *sdev = to_shmob_device(crtc->dev);
>   
>   	shmob_drm_crtc_enable_vblank(sdev, true);
>   
> @@ -437,7 +437,7 @@ static int shmob_drm_enable_vblank(struct drm_crtc *crtc)
>   
>   static void shmob_drm_disable_vblank(struct drm_crtc *crtc)
>   {
> -	struct shmob_drm_device *sdev = crtc->dev->dev_private;
> +	struct shmob_drm_device *sdev = to_shmob_device(crtc->dev);
>   
>   	shmob_drm_crtc_enable_vblank(sdev, false);
>   }
> @@ -511,7 +511,7 @@ static bool shmob_drm_encoder_mode_fixup(struct drm_encoder *encoder,
>   					 struct drm_display_mode *adjusted_mode)
>   {
>   	struct drm_device *dev = encoder->dev;
> -	struct shmob_drm_device *sdev = dev->dev_private;
> +	struct shmob_drm_device *sdev = to_shmob_device(dev);
>   	struct drm_connector *connector = &sdev->connector.connector;
>   	const struct drm_display_mode *panel_mode;
>   
> @@ -581,7 +581,7 @@ static inline struct shmob_drm_connector *to_shmob_connector(struct drm_connecto
>   
>   static int shmob_drm_connector_get_modes(struct drm_connector *connector)
>   {
> -	struct shmob_drm_device *sdev = connector->dev->dev_private;
> +	struct shmob_drm_device *sdev = to_shmob_device(connector->dev);
>   	struct drm_display_mode *mode;
>   
>   	mode = drm_mode_create(connector->dev);
> diff --git a/drivers/gpu/drm/renesas/shmobile/shmob_drm_drv.c b/drivers/gpu/drm/renesas/shmobile/shmob_drm_drv.c
> index 2b77af3a8c97ef8c..1a1d66c6e817e227 100644
> --- a/drivers/gpu/drm/renesas/shmobile/shmob_drm_drv.c
> +++ b/drivers/gpu/drm/renesas/shmobile/shmob_drm_drv.c
> @@ -95,7 +95,7 @@ static int shmob_drm_setup_clocks(struct shmob_drm_device *sdev,
>   static irqreturn_t shmob_drm_irq(int irq, void *arg)
>   {
>   	struct drm_device *dev = arg;
> -	struct shmob_drm_device *sdev = dev->dev_private;
> +	struct shmob_drm_device *sdev = to_shmob_device(dev);
>   	unsigned long flags;
>   	u32 status;
>   
> @@ -217,8 +217,6 @@ static int shmob_drm_probe(struct platform_device *pdev)
>   	if (ret < 0)
>   		return ret;
>   
> -	ddev->dev_private = sdev;
> -
>   	ret = shmob_drm_modeset_init(sdev);
>   	if (ret < 0)
>   		return dev_err_probe(&pdev->dev, ret,
> diff --git a/drivers/gpu/drm/renesas/shmobile/shmob_drm_drv.h b/drivers/gpu/drm/renesas/shmobile/shmob_drm_drv.h
> index 77bb0da48f37ace8..5e55ba7a207865bd 100644
> --- a/drivers/gpu/drm/renesas/shmobile/shmob_drm_drv.h
> +++ b/drivers/gpu/drm/renesas/shmobile/shmob_drm_drv.h
> @@ -39,4 +39,9 @@ struct shmob_drm_device {
>   	struct shmob_drm_connector connector;
>   };
>   
> +static inline struct shmob_drm_device *to_shmob_device(struct drm_device *dev)
> +{
> +	return container_of(dev, struct shmob_drm_device, ddev);
> +}
> +
>   #endif /* __SHMOB_DRM_DRV_H__ */
> diff --git a/drivers/gpu/drm/renesas/shmobile/shmob_drm_plane.c b/drivers/gpu/drm/renesas/shmobile/shmob_drm_plane.c
> index 258288c80756bf16..c58b9dca34736342 100644
> --- a/drivers/gpu/drm/renesas/shmobile/shmob_drm_plane.c
> +++ b/drivers/gpu/drm/renesas/shmobile/shmob_drm_plane.c
> @@ -63,7 +63,7 @@ static void shmob_drm_plane_compute_base(struct shmob_drm_plane *splane,
>   static void __shmob_drm_plane_setup(struct shmob_drm_plane *splane,
>   				    struct drm_framebuffer *fb)
>   {
> -	struct shmob_drm_device *sdev = splane->plane.dev->dev_private;
> +	struct shmob_drm_device *sdev = to_shmob_device(splane->plane.dev);
>   	u32 format;
>   
>   	/* TODO: Support ROP3 mode */
> @@ -135,8 +135,8 @@ shmob_drm_plane_update(struct drm_plane *plane, struct drm_crtc *crtc,
>   		       uint32_t src_w, uint32_t src_h,
>   		       struct drm_modeset_acquire_ctx *ctx)
>   {
> +	struct shmob_drm_device *sdev = to_shmob_device(plane->dev);
>   	struct shmob_drm_plane *splane = to_shmob_plane(plane);
> -	struct shmob_drm_device *sdev = plane->dev->dev_private;
>   	const struct shmob_drm_format_info *format;
>   
>   	format = shmob_drm_format_info(fb->format->format);
> @@ -167,8 +167,8 @@ shmob_drm_plane_update(struct drm_plane *plane, struct drm_crtc *crtc,
>   static int shmob_drm_plane_disable(struct drm_plane *plane,
>   				   struct drm_modeset_acquire_ctx *ctx)
>   {
> +	struct shmob_drm_device *sdev = to_shmob_device(plane->dev);
>   	struct shmob_drm_plane *splane = to_shmob_plane(plane);
> -	struct shmob_drm_device *sdev = plane->dev->dev_private;
>   
>   	splane->format = NULL;
>   

-- 
Jingfeng

