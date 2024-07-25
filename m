Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E13EF93BC5A
	for <lists+dri-devel@lfdr.de>; Thu, 25 Jul 2024 08:09:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E57810E676;
	Thu, 25 Jul 2024 06:09:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="aQbDEDqU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C258810E500
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Jul 2024 06:09:07 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id E3BFFCE1310;
 Thu, 25 Jul 2024 06:09:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 17D73C4AF0A;
 Thu, 25 Jul 2024 06:08:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1721887744;
 bh=DCAnvhO2woz54fWGjieozndx0YN3iV0+VayGAvgrFyo=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=aQbDEDqUSf+nM1MsCVi3gV8ufqZtnwptuhIK4uNDSzXf15TbVg0gyyMXerXExkTp4
 2DoyDZNSuSjNFL9wFT9OeO9q+EZrMTpJfebpEYIg82Rc8IrhJHaGC8O7umrJxhRiav
 p1anUMZRlY+4tZ2wD3h+qx5q9DgikcJlsqam9DUefulIilEsBYHs3XFx+qmzOF2yx0
 aGNBnJ8LUzG0BGRKveiD/X2BS+stMUP7GfP4Ykx5rc9QPsavvH+FS4RoLe1JLFRONc
 /V1x/6pWwrF81ad3gKqxUuBex70dTbEMR0e8JTFqX20LZgTGdBBG82haiiWGK2dkjE
 Ol20UPAibHZ3w==
Message-ID: <0f98db88-71d4-43a6-85f7-a9661c50a382@kernel.org>
Date: Thu, 25 Jul 2024 08:08:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] drm/tiny: Add driver for Sharp Memory LCD
To: Alex Lanzano <lanzano.alex@gmail.com>, mehdi.djait@bootlin.com,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20240725004734.644986-1-lanzano.alex@gmail.com>
 <20240725004734.644986-3-lanzano.alex@gmail.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 fv0=
In-Reply-To: <20240725004734.644986-3-lanzano.alex@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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

On 25/07/2024 02:47, Alex Lanzano wrote:
> Add support for the monochrome Sharp Memory LCDs.
> 
> Signed-off-by: Alex Lanzano <lanzano.alex@gmail.com>
> ---
>  MAINTAINERS                         |   8 +
>  drivers/gpu/drm/tiny/Kconfig        |  20 +
>  drivers/gpu/drm/tiny/Makefile       |   1 +
>  drivers/gpu/drm/tiny/sharp-memory.c | 742 ++++++++++++++++++++++++++++
>  4 files changed, 771 insertions(+)
>  create mode 100644 drivers/gpu/drm/tiny/sharp-memory.c
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 71b739b40921..d19893d25913 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -7123,6 +7123,14 @@ S:	Maintained
>  F:	Documentation/devicetree/bindings/display/panel/samsung,s6d7aa0.yaml
>  F:	drivers/gpu/drm/panel/panel-samsung-s6d7aa0.c
>  
> +DRM DRIVER FOR SHARP MEMORY LCD
> +M:	Alex Lanzano <lanzano.alex@gmail.com>
> +S:	Maintained
> +T:	git git://anongit.freedesktop.org/drm/drm-misc
> +F:	Documentation/devicetree/bindings/display/sharp,sharp-memory.yaml
> +F:	drivers/gpu/drm/tiny/sharp-memory.c
> +F:	include/dt-bindings/display/sharp-memory.h
> +
>  DRM DRIVER FOR SITRONIX ST7586 PANELS
>  M:	David Lechner <david@lechnology.com>
>  S:	Maintained
> diff --git a/drivers/gpu/drm/tiny/Kconfig b/drivers/gpu/drm/tiny/Kconfig
> index f6889f649bc1..bc386954faa2 100644
> --- a/drivers/gpu/drm/tiny/Kconfig
> +++ b/drivers/gpu/drm/tiny/Kconfig
> @@ -186,6 +186,26 @@ config TINYDRM_REPAPER
>  
>  	  If M is selected the module will be called repaper.
>  
> +config TINYDRM_SHARP_MEMORY
> +	tristate "DRM support for Sharp Memory LCD panels"
> +	depends on DRM && SPI
> +	select DRM_GEM_DMA_HELPER
> +	select DRM_KMS_HELPER
> +	help
> +	  DRM Driver for the following Sharp Memory Panels:
> +	  * 1.00" Sharp Memory LCD (LS010B7DH04)
> +	  * 1.10" Sharp Memory LCD (LS011B7DH03)
> +	  * 1.20" Sharp Memory LCD (LS012B7DD01)
> +	  * 1.28" Sharp Memory LCD (LS013B7DH03)
> +	  * 1.26" Sharp Memory LCD (LS013B7DH05)
> +	  * 1.80" Sharp Memory LCD (LS018B7DH02)
> +	  * 2.70" Sharp Memory LCD (LS027B7DH01)
> +	  * 2.70" Sharp Memory LCD (LS027B7DH01A)
> +	  * 3.20" Sharp Memory LCD (LS032B7DD02)
> +	  * 4.40" Sharp Memory LCD (LS044Q7DH01)
> +
> +	  If M is selected the module will be called sharp_memory.
> +
>  config TINYDRM_ST7586
>  	tristate "DRM support for Sitronix ST7586 display panels"
>  	depends on DRM && SPI
> diff --git a/drivers/gpu/drm/tiny/Makefile b/drivers/gpu/drm/tiny/Makefile
> index 76dde89a044b..4aaf56f8707d 100644
> --- a/drivers/gpu/drm/tiny/Makefile
> +++ b/drivers/gpu/drm/tiny/Makefile
> @@ -14,5 +14,6 @@ obj-$(CONFIG_TINYDRM_ILI9341)		+= ili9341.o
>  obj-$(CONFIG_TINYDRM_ILI9486)		+= ili9486.o
>  obj-$(CONFIG_TINYDRM_MI0283QT)		+= mi0283qt.o
>  obj-$(CONFIG_TINYDRM_REPAPER)		+= repaper.o
> +obj-$(CONFIG_TINYDRM_SHARP_MEMORY)	+= sharp-memory.o
>  obj-$(CONFIG_TINYDRM_ST7586)		+= st7586.o
>  obj-$(CONFIG_TINYDRM_ST7735R)		+= st7735r.o
> diff --git a/drivers/gpu/drm/tiny/sharp-memory.c b/drivers/gpu/drm/tiny/sharp-memory.c
> new file mode 100644
> index 000000000000..5e61e348ce3a
> --- /dev/null
> +++ b/drivers/gpu/drm/tiny/sharp-memory.c
> @@ -0,0 +1,742 @@
> +// SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +
> +#include <linux/kernel.h>
> +#include <linux/module.h>
> +#include <linux/mod_devicetable.h>
> +#include <linux/spi/spi.h>
> +#include <linux/gpio/consumer.h>
> +#include <linux/delay.h>
> +#include <linux/kthread.h>
> +#include <linux/bitrev.h>
> +#include <linux/pwm.h>
> +#include <linux/mutex.h>
> +
> +#include <drm/drm_atomic.h>
> +#include <drm/drm_atomic_helper.h>
> +#include <drm/drm_connector.h>
> +#include <drm/drm_damage_helper.h>
> +#include <drm/drm_drv.h>
> +#include <drm/drm_fb_dma_helper.h>
> +#include <drm/drm_fbdev_dma.h>
> +#include <drm/drm_format_helper.h>
> +#include <drm/drm_framebuffer.h>
> +#include <drm/drm_gem_atomic_helper.h>
> +#include <drm/drm_gem_dma_helper.h>
> +#include <drm/drm_gem_framebuffer_helper.h>
> +#include <drm/drm_managed.h>
> +#include <drm/drm_modes.h>
> +#include <drm/drm_rect.h>
> +#include <drm/drm_probe_helper.h>
> +
> +#include <dt-bindings/display/sharp-memory.h>
> +
> +#define SHARP_MODE_PERIOD 8
> +#define SHARP_ADDR_PERIOD 8
> +#define SHARP_DUMMY_PERIOD 8
> +
> +#define SHARP_MEMORY_DISPLAY_MAINTAIN_MODE 0
> +#define SHARP_MEMORY_DISPLAY_UPDATE_MODE 1
> +#define SHARP_MEMORY_DISPLAY_CLEAR_MODE 4
> +
> +enum sharp_memory_model {
> +	LS010B7DH04 = 1,
> +	LS011B7DH03,
> +	LS012B7DD01,
> +	LS013B7DH03,
> +	LS013B7DH05,
> +	LS018B7DH02,
> +	LS027B7DH01,
> +	LS027B7DH01A,
> +	LS032B7DD02,
> +	LS044Q7DH01,
> +};
> +
> +struct sharp_memory_device {
> +	struct drm_device drm;
> +	struct spi_device *spi;
> +
> +	const struct drm_display_mode *mode;
> +
> +	struct drm_crtc crtc;
> +	struct drm_plane plane;
> +	struct drm_encoder encoder;
> +	struct drm_connector connector;
> +
> +	struct gpio_desc *enable_gpio;
> +
> +	struct task_struct *sw_vcom_signal;
> +	struct pwm_device *pwm_vcom_signal;
> +
> +	uint32_t vcom_mode;
> +	uint8_t vcom;
> +
> +	uint32_t pitch;
> +	uint32_t tx_buffer_size;
> +	uint8_t *tx_buffer;
> +	struct mutex tx_mutex;
> +};
> +
> +static inline int sharp_memory_spi_write(struct spi_device *spi, void *buf, size_t len)
> +{
> +	/* Reverse the bit order */
> +	for (uint8_t *b = buf; b < ((uint8_t *)buf) + len; ++b)
> +		*b = bitrev8(*b);
> +
> +	return spi_write(spi, buf, len);
> +}
> +
> +static inline struct sharp_memory_device *drm_to_sharp_memory_device(struct drm_device *drm)
> +{
> +	return container_of(drm, struct sharp_memory_device, drm);
> +}
> +
> +DEFINE_DRM_GEM_DMA_FOPS(sharp_memory_fops);
> +
> +static const struct drm_driver sharp_memory_drm_driver = {
> +	.driver_features	= DRIVER_GEM | DRIVER_MODESET | DRIVER_ATOMIC,
> +	.fops			= &sharp_memory_fops,
> +	DRM_GEM_DMA_DRIVER_OPS_VMAP,
> +	.name			= "sharp_memory_display",
> +	.desc			= "Sharp Display Memory LCD",
> +	.date			= "20231129",
> +	.major			= 1,
> +	.minor			= 0,
> +};
> +
> +static inline void sharp_memory_set_tx_buffer_mode(uint8_t *buffer, uint8_t mode, uint8_t vcom)
> +{
> +
> +	*buffer = mode | (vcom << 1);
> +}
> +
> +static inline void sharp_memory_set_tx_buffer_addresses(uint8_t *buffer,
> +							struct drm_rect clip,
> +							uint32_t pitch)
> +{
> +	for (uint32_t line = 0; line < clip.y2; ++line)
> +		buffer[line * pitch] = line + 1;
> +
> +}
> +
> +static void sharp_memory_set_tx_buffer_data(uint8_t *buffer,
> +					    struct drm_framebuffer *fb,
> +					    struct drm_rect clip,
> +					    uint32_t pitch,
> +					    struct drm_format_conv_state *fmtcnv_state)
> +{
> +	int ret;
> +	struct iosys_map dst, vmap;
> +	struct drm_gem_dma_object *dma_obj = drm_fb_dma_get_gem_obj(fb, 0);
> +
> +	ret = drm_gem_fb_begin_cpu_access(fb, DMA_FROM_DEVICE);
> +	if (ret)
> +		return;
> +
> +
> +	iosys_map_set_vaddr(&dst, buffer);
> +	iosys_map_set_vaddr(&vmap, dma_obj->vaddr);
> +
> +	drm_fb_xrgb8888_to_mono(&dst, &pitch, &vmap, fb, &clip, fmtcnv_state);
> +
> +	drm_gem_fb_end_cpu_access(fb, DMA_FROM_DEVICE);
> +}
> +
> +static int sharp_memory_update_display(struct sharp_memory_device *smd,
> +				       struct drm_framebuffer *fb,
> +				       struct drm_rect clip,
> +				       struct drm_format_conv_state *fmtcnv_state)
> +{
> +	int ret;
> +	uint32_t pitch = smd->pitch;
> +	uint8_t vcom = smd->vcom;
> +	uint8_t *tx_buffer = smd->tx_buffer;
> +	uint32_t tx_buffer_size = smd->tx_buffer_size;
> +
> +	mutex_lock(&smd->tx_mutex);
> +
> +	/* Populate the transmit buffer with frame data */
> +	sharp_memory_set_tx_buffer_mode(&tx_buffer[0],
> +					SHARP_MEMORY_DISPLAY_UPDATE_MODE, vcom);
> +	sharp_memory_set_tx_buffer_addresses(&tx_buffer[1], clip, pitch);
> +	sharp_memory_set_tx_buffer_data(&tx_buffer[2], fb, clip, pitch, fmtcnv_state);
> +
> +	ret = sharp_memory_spi_write(smd->spi, tx_buffer, tx_buffer_size);
> +
> +	mutex_unlock(&smd->tx_mutex);
> +
> +	return ret;
> +}
> +
> +static int sharp_memory_maintain_display(struct sharp_memory_device *smd)
> +{
> +	int ret;
> +	uint8_t vcom = smd->vcom;
> +	uint8_t *tx_buffer = smd->tx_buffer;
> +
> +	mutex_lock(&smd->tx_mutex);
> +
> +	sharp_memory_set_tx_buffer_mode(&tx_buffer[0], SHARP_MEMORY_DISPLAY_MAINTAIN_MODE, vcom);
> +	tx_buffer[1] = 0; // Write dummy data
> +	ret = sharp_memory_spi_write(smd->spi, tx_buffer, 2);
> +
> +	mutex_unlock(&smd->tx_mutex);
> +
> +	return ret;
> +}
> +
> +static int sharp_memory_clear_display(struct sharp_memory_device *smd)
> +{
> +	int ret;
> +	uint8_t vcom = smd->vcom;
> +	uint8_t *tx_buffer = smd->tx_buffer;
> +
> +	mutex_lock(&smd->tx_mutex);
> +
> +	sharp_memory_set_tx_buffer_mode(&tx_buffer[0], SHARP_MEMORY_DISPLAY_CLEAR_MODE, vcom);
> +	tx_buffer[1] = 0; // write dummy data
> +	ret = sharp_memory_spi_write(smd->spi, tx_buffer, 2);
> +
> +	mutex_unlock(&smd->tx_mutex);
> +
> +	return ret;
> +}
> +
> +static void sharp_memory_fb_dirty(struct drm_framebuffer *fb, struct drm_rect *rect,
> +				  struct drm_format_conv_state *fmtconv_state)
> +{
> +	struct drm_rect clip;
> +	struct sharp_memory_device *smd = drm_to_sharp_memory_device(fb->dev);
> +
> +	/* Always update a full line regardless of what is dirty */
> +	clip.x1 = 0;
> +	clip.x2 = fb->width;
> +	clip.y1 = rect->y1;
> +	clip.y2 = rect->y2;
> +
> +	sharp_memory_update_display(smd, fb, clip, fmtconv_state);
> +}
> +
> +static int sharp_memory_plane_atomic_check(struct drm_plane *plane,
> +					   struct drm_atomic_state *state)
> +{
> +	struct drm_plane_state *plane_state = drm_atomic_get_new_plane_state(state, plane);
> +	struct sharp_memory_device *smd;
> +	struct drm_crtc_state *crtc_state;
> +
> +	smd = container_of(plane, struct sharp_memory_device, plane);
> +	crtc_state = drm_atomic_get_new_crtc_state(state, &smd->crtc);
> +
> +	return drm_atomic_helper_check_plane_state(plane_state, crtc_state,
> +						   DRM_PLANE_NO_SCALING,
> +						   DRM_PLANE_NO_SCALING,
> +						   false, false);
> +}
> +
> +static void sharp_memory_plane_atomic_update(struct drm_plane *plane,
> +					     struct drm_atomic_state *state)
> +{
> +
> +	struct drm_plane_state *old_state = drm_atomic_get_old_plane_state(state, plane);
> +	struct drm_plane_state *plane_state = plane->state;
> +	struct drm_format_conv_state fmtcnv_state = DRM_FORMAT_CONV_STATE_INIT;
> +	struct sharp_memory_device *smd;
> +	struct drm_rect rect;
> +
> +	smd = container_of(plane, struct sharp_memory_device, plane);
> +	if (!smd->crtc.state->active)
> +		return;
> +
> +
> +	if (drm_atomic_helper_damage_merged(old_state, plane_state, &rect))
> +		sharp_memory_fb_dirty(plane_state->fb, &rect, &fmtcnv_state);
> +
> +	drm_format_conv_state_release(&fmtcnv_state);
> +}
> +
> +static const struct drm_plane_helper_funcs sharp_memory_plane_helper_funcs = {
> +	.prepare_fb = drm_gem_plane_helper_prepare_fb,
> +	.atomic_check = sharp_memory_plane_atomic_check,
> +	.atomic_update = sharp_memory_plane_atomic_update,
> +};
> +
> +static bool sharp_memory_format_mod_supported(struct drm_plane *plane,
> +					      uint32_t format,
> +					      uint64_t modifier)
> +{
> +	return modifier == DRM_FORMAT_MOD_LINEAR;
> +}
> +
> +static const struct drm_plane_funcs sharp_memory_plane_funcs = {
> +	.update_plane = drm_atomic_helper_update_plane,
> +	.disable_plane = drm_atomic_helper_disable_plane,
> +	.destroy = drm_plane_cleanup,
> +	.reset = drm_atomic_helper_plane_reset,
> +	.atomic_duplicate_state	= drm_atomic_helper_plane_duplicate_state,
> +	.atomic_destroy_state = drm_atomic_helper_plane_destroy_state,
> +	.format_mod_supported = sharp_memory_format_mod_supported,
> +};
> +
> +static enum drm_mode_status sharp_memory_crtc_mode_valid(struct drm_crtc *crtc,
> +							 const struct drm_display_mode *mode)
> +{
> +	struct sharp_memory_device *smd = drm_to_sharp_memory_device(crtc->dev);
> +
> +	return drm_crtc_helper_mode_valid_fixed(crtc, mode, smd->mode);
> +}
> +
> +static int sharp_memory_crtc_check(struct drm_crtc *crtc,
> +				   struct drm_atomic_state *state)
> +{
> +	struct drm_crtc_state *crtc_state = drm_atomic_get_new_crtc_state(state, crtc);
> +	int ret;
> +
> +	if (!crtc_state->enable)
> +		goto out;
> +
> +	ret = drm_atomic_helper_check_crtc_primary_plane(crtc_state);
> +	if (ret)
> +		return ret;
> +
> +out:
> +	return drm_atomic_add_affected_planes(state, crtc);
> +}
> +
> +static int sharp_memory_sw_vcom_signal_thread(void *data)
> +{
> +	struct sharp_memory_device *smd = data;
> +
> +	while (!kthread_should_stop()) {
> +		smd->vcom ^= 1; // Toggle vcom
> +		sharp_memory_maintain_display(smd);
> +		msleep(1000);
> +	}
> +
> +	return 0;
> +}
> +
> +static void sharp_memory_crtc_enable(struct drm_crtc *crtc,
> +				     struct drm_atomic_state *state)
> +{
> +	struct pwm_state pwm_state;
> +	struct sharp_memory_device *smd = drm_to_sharp_memory_device(crtc->dev);
> +
> +	sharp_memory_clear_display(smd);
> +
> +	if (smd->enable_gpio)
> +		gpiod_set_value(smd->enable_gpio, 1);
> +
> +
> +	switch (smd->vcom_mode) {
> +	case SHARP_MEMORY_SOFTWARE_VCOM:
> +		smd->sw_vcom_signal = kthread_run(sharp_memory_sw_vcom_signal_thread,
> +						  smd, "sw_vcom_signal");
> +		break;
> +
> +	case SHARP_MEMORY_EXTERNAL_VCOM:
> +		break;
> +
> +	case SHARP_MEMORY_PWM_VCOM:
> +		pwm_get_state(smd->pwm_vcom_signal, &pwm_state);
> +		pwm_state.period =    1000000000;
> +		pwm_state.duty_cycle = 100000000;
> +		pwm_state.enabled = true;
> +		pwm_apply_state(smd->pwm_vcom_signal, &pwm_state);
> +		break;
> +	}
> +}
> +
> +static void sharp_memory_crtc_disable(struct drm_crtc *crtc,
> +				      struct drm_atomic_state *state)
> +{
> +	struct sharp_memory_device *smd = drm_to_sharp_memory_device(crtc->dev);
> +
> +	sharp_memory_clear_display(smd);
> +
> +	if (smd->enable_gpio)
> +		gpiod_set_value(smd->enable_gpio, 0);
> +
> +
> +	switch (smd->vcom_mode) {
> +	case SHARP_MEMORY_SOFTWARE_VCOM:
> +		kthread_stop(smd->sw_vcom_signal);
> +		break;
> +
> +	case SHARP_MEMORY_EXTERNAL_VCOM:
> +		break;
> +
> +	case SHARP_MEMORY_PWM_VCOM:
> +		pwm_disable(smd->pwm_vcom_signal);
> +		break;
> +	}
> +}
> +
> +static const struct drm_crtc_helper_funcs sharp_memory_crtc_helper_funcs = {
> +	.mode_valid = sharp_memory_crtc_mode_valid,
> +	.atomic_check = sharp_memory_crtc_check,
> +	.atomic_enable = sharp_memory_crtc_enable,
> +	.atomic_disable = sharp_memory_crtc_disable,
> +};
> +
> +static const struct drm_crtc_funcs sharp_memory_crtc_funcs = {
> +	.reset = drm_atomic_helper_crtc_reset,
> +	.destroy = drm_crtc_cleanup,
> +	.set_config = drm_atomic_helper_set_config,
> +	.page_flip = drm_atomic_helper_page_flip,
> +	.atomic_duplicate_state = drm_atomic_helper_crtc_duplicate_state,
> +	.atomic_destroy_state = drm_atomic_helper_crtc_destroy_state,
> +};
> +
> +static const struct drm_encoder_funcs sharp_memory_encoder_funcs = {
> +	.destroy = drm_encoder_cleanup,
> +};
> +
> +static int sharp_memory_connector_get_modes(struct drm_connector *connector)
> +{
> +	struct sharp_memory_device *smd = drm_to_sharp_memory_device(connector->dev);
> +
> +	return drm_connector_helper_get_modes_fixed(connector, smd->mode);
> +}
> +
> +static const struct drm_connector_helper_funcs sharp_memory_connector_hfuncs = {
> +	.get_modes = sharp_memory_connector_get_modes,
> +};
> +
> +static const struct drm_connector_funcs sharp_memory_connector_funcs = {
> +	.reset = drm_atomic_helper_connector_reset,
> +	.fill_modes = drm_helper_probe_single_connector_modes,
> +	.destroy = drm_connector_cleanup,
> +	.atomic_duplicate_state = drm_atomic_helper_connector_duplicate_state,
> +	.atomic_destroy_state = drm_atomic_helper_connector_destroy_state,
> +
> +};
> +
> +static const struct drm_mode_config_funcs sharp_memory_mode_config_funcs = {
> +	.fb_create = drm_gem_fb_create_with_dirty,
> +	.atomic_check = drm_atomic_helper_check,
> +	.atomic_commit = drm_atomic_helper_commit,
> +};
> +
> +static const struct spi_device_id sharp_memory_ids[] = {
> +	{"ls010b7dh04", LS010B7DH04},
> +	{"ls011b7dh03", LS011B7DH03},
> +	{"ls012b7dd01", LS012B7DD01},
> +	{"ls013b7dh03", LS013B7DH03},
> +	{"ls013b7dh05", LS013B7DH05},
> +	{"ls018b7dh02", LS018B7DH02},
> +	{"ls027b7dh01", LS027B7DH01},
> +	{"ls027b7dh01a", LS027B7DH01A},
> +	{"ls032b7dd02", LS032B7DD02},
> +	{"ls044q7dh01", LS044Q7DH01},
> +	{},
> +};
> +MODULE_DEVICE_TABLE(spi, sharp_memory_ids);
> +
> +static const struct of_device_id sharp_memory_of_match[] = {
> +	{.compatible = "sharp,ls010b7dh04"},

Both ID tables should be in sync. See not-so-recent IIO discussions and
commits.

> +	{.compatible = "sharp,ls011b7dh03"},
> +	{.compatible = "sharp,ls012b7dd01"},
> +	{.compatible = "sharp,ls013b7dh03"},
> +	{.compatible = "sharp,ls013b7dh05"},
> +	{.compatible = "sharp,ls018b7dh02"},
> +	{.compatible = "sharp,ls027b7dh01"},
> +	{.compatible = "sharp,ls027b7dh01a"},
> +	{.compatible = "sharp,ls032b7dd02"},
> +	{.compatible = "sharp,ls044q7dh01"},
> +	{},
> +};
> +MODULE_DEVICE_TABLE(of, sharp_memory_of_match);
> +
> +static const struct drm_display_mode sharp_memory_ls010b7dh04_mode = {
> +	DRM_SIMPLE_MODE(128, 128, 18, 18),
> +};
> +
> +static const struct drm_display_mode sharp_memory_ls011b7dh03_mode = {
> +	DRM_SIMPLE_MODE(160, 68, 25, 10),
> +};
> +
> +static const struct drm_display_mode sharp_memory_ls012b7dd01_mode = {
> +	DRM_SIMPLE_MODE(184, 38, 29, 6),
> +};
> +
> +static const struct drm_display_mode sharp_memory_ls013b7dh03_mode = {
> +	DRM_SIMPLE_MODE(128, 128, 23, 23),
> +};
> +
> +static const struct drm_display_mode sharp_memory_ls013b7dh05_mode = {
> +	DRM_SIMPLE_MODE(144, 168, 20, 24),
> +};
> +
> +static const struct drm_display_mode sharp_memory_ls018b7dh02_mode = {
> +	DRM_SIMPLE_MODE(230, 303, 27, 36),
> +};
> +
> +static const struct drm_display_mode sharp_memory_ls027b7dh01_mode = {
> +	DRM_SIMPLE_MODE(400, 240, 58, 35),
> +};
> +
> +static const struct drm_display_mode sharp_memory_ls032b7dd02_mode = {
> +	DRM_SIMPLE_MODE(336, 536, 42, 68),
> +};
> +
> +static const struct drm_display_mode sharp_memory_ls044q7dh01_mode = {
> +	DRM_SIMPLE_MODE(320, 240, 89, 67),
> +};
> +
> +static const uint32_t sharp_memory_formats[] = {
> +	DRM_FORMAT_XRGB8888,
> +};
> +
> +static inline enum sharp_memory_model sharp_memory_model_from_device_id(struct spi_device *spi)
> +{
> +	const struct spi_device_id *spi_id = spi_get_device_id(spi);
> +
> +	return (enum sharp_memory_model)spi_id->driver_data;

No, use appropriate wrapper, do not re-implement spi_get_device_match_data.

> +}
> +
> +static int sharp_memory_pipe_init(struct drm_device *dev,
> +				  struct sharp_memory_device *smd,
> +				  const uint32_t *formats, unsigned int format_count,
> +				  const uint64_t *format_modifiers)
> +{



Best regards,
Krzysztof

