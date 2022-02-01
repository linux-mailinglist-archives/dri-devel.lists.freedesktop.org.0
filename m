Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 412F54A5CBA
	for <lists+dri-devel@lfdr.de>; Tue,  1 Feb 2022 14:02:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C3BB910E220;
	Tue,  1 Feb 2022 13:02:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 09FD110E1A9
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Feb 2022 13:02:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643720524;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rk5pSndda/+fZUusLWBT7zpDvxTDuUVELXuYZMoKsZI=;
 b=aI/ej7Fs1a23ebDsA3hiErrkvvwJeqzRWHKGizoRME3GZfezCWYrjA8zozfvTwAsTDZ4zd
 f8uNlrl34UFyyUYu5+f4Wuh6zxWqsdsedZBmcbY36zTSNEWc/dwUDnk4YedXvMiIa+xYr8
 8mwwuP5o1Z7rcrOb8XkJpQetNdeNiFM=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-655-TW_ftYAhN-OL6cpFMpHOiA-1; Tue, 01 Feb 2022 08:01:58 -0500
X-MC-Unique: TW_ftYAhN-OL6cpFMpHOiA-1
Received: by mail-wr1-f69.google.com with SMTP id
 l22-20020adfa396000000b001d8e6467fe8so388399wrb.6
 for <dri-devel@lists.freedesktop.org>; Tue, 01 Feb 2022 05:01:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=rk5pSndda/+fZUusLWBT7zpDvxTDuUVELXuYZMoKsZI=;
 b=Cny9Wy+7bnDNmWaDZ9/M2OInA7VWA9XfP/2drMYTx1agX0rVz88okMskNjOhGmrRwa
 +Of2G/1+2ujQIvBA7Gu55M1lJz/Ib+Kmf28Q6QJyzNOJJ8LT+T0dMZo4/SgxCl8CIpm0
 GMMXiBNu7vALBRiBzrEg4K3uMJ8BxnorBD1bL1EURzx1T4B2kFWt7ChczpRZui5DD2s9
 hairc1ey9hdX6NJnPDuGGHOvc6wmjLwT4/dWUHU+CGf9DqJtW9JvUQQJjIbBI3rpyXLR
 M0QIZHR1H4CpKWvXqgHkO4HNaQt1vpv0gGzfKbF21CYMMjzHzey5MthaYvPIqapdwmVN
 BvMw==
X-Gm-Message-State: AOAM5318G6aF0ZS0069PdoXcRdnu+EwREzXP3gFJy2WYxNrs7wyJ/2E8
 pZ8sWUMQy87io0XqSMGEiNcsXZMO2/0oFU/TfeOFMqVSJByBB47WHnUToSPRB5Hjgz3l7REltzc
 dAm0hkdZC/NurzmwaFgmC/x+l4uKo
X-Received: by 2002:a05:600c:5118:: with SMTP id
 o24mr1733323wms.153.1643720517472; 
 Tue, 01 Feb 2022 05:01:57 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwjUjpKyZFdDwkR0534UGvhD3J00uObcn9sowFdLXJ6+4tj7xOYbW6/WxePpdJiDrislSPqjg==
X-Received: by 2002:a05:600c:5118:: with SMTP id
 o24mr1733302wms.153.1643720517130; 
 Tue, 01 Feb 2022 05:01:57 -0800 (PST)
Received: from [192.168.1.102] ([92.176.231.205])
 by smtp.gmail.com with ESMTPSA id u17sm2204104wmq.41.2022.02.01.05.01.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 01 Feb 2022 05:01:56 -0800 (PST)
Message-ID: <73dbc5c7-b9e2-a260-49a6-0b96f342391e@redhat.com>
Date: Tue, 1 Feb 2022 14:01:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 3/4] drm/tiny: Add driver for Solomon SSD1307 OLED displays
To: Thomas Zimmermann <tzimmermann@suse.de>, linux-kernel@vger.kernel.org
References: <20220131202916.2374502-1-javierm@redhat.com>
 <cc093cd5-fba1-5d84-5894-81a6e1d039ff@suse.de>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <cc093cd5-fba1-5d84-5894-81a6e1d039ff@suse.de>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=javierm@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
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
Cc: linux-fbdev@vger.kernel.org, Daniel Vetter <daniel.vetter@ffwll.ch>,
 dri-devel@lists.freedesktop.org,
 =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>, Maxime Ripard <maxime@cerno.tech>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2/1/22 10:33, Thomas Zimmermann wrote:
> Hi Javier,
> 
> please see comments and questions below.
>

Thanks again for your comments.

[snip] 

>>   
>> +config TINYDRM_SSD1307
> 
> TINYDRM is so 2010's. Just call it DRM.
>

Haha, Ok. I just followed what other drivers did and thought was a convention.
 
> Some of the drivers use TINY for historical reasons. Simple pipe and 
> mipi helpers originated from here IIRC. And now it's just regular DRM 
> drivers.
> 
>> +	tristate "DRM support for Solomon SSD1307 OLED displays"
>> +	depends on DRM && I2C
>> +	select DRM_KMS_HELPER
>> +	select DRM_GEM_SHMEM_HELPER
>> +	select BACKLIGHT_CLASS_DEVICE
> 
> Alphabetical order please.
>

Ok.

[snip]

>>   obj-$(CONFIG_TINYDRM_REPAPER)		+= repaper.o
>> +obj-$(CONFIG_TINYDRM_SSD1307)		+= ssd1307.o
> 
> Maybe call it ssd130x
>

Yes, that's what I had in my RFC posted yesterday but then Andy asked if it
could use the old driver name. But now it seems he also agrees with us that
ssd130x would be better. I'll change it again.
 
[snip]

>> +};
>> +
>> +struct ssd1307_array {
>> +	u8	type;
> 
> 'cmd'?
>

Sure.
 
>> +	u8	data[];
>> +};
> 
> The name 'array' is misleading. At first I thought that it's a C array 
> type. But it's actually an element of the adapter's i2c protocol. Is 
> there a better name that makes this more obvious? ssd130x_i2c_cmd?
>

Indeed. I took the name from the old driver but I agree with you that's
confusing. It's called array because ssd1307_update_display() writes an
array of SSD1307_DATA commands to update all the needed screen pages.

> If this common enough that it could be part of some kind of i2c helper 
> library?
>

That's a good question. There are some other DRM drivers doing I2C read/writes
so there may be some room for consolidation in helper functions. But I would
do it as a follow-up since it seems out of scope for this series.

>> +
>> +static inline struct ssd1307_device *drm_to_ssd1307(struct drm_device *drm)
>> +{
>> +	return container_of(drm, struct ssd1307_device, drm);
>> +}
>> +
>> +static struct ssd1307_array *ssd1307_alloc_array(u32 len, u8 type)
>> +{
>> +	struct ssd1307_array *array;
>> +
>> +	array = kzalloc(sizeof(struct ssd1307_array) + len, GFP_KERNEL);
> 
> sizeof(*array) is slighly more reliable. But wasn't there even a macro 
> for such allocations (struct + length)?
>

Agree on the sizeof(*foo) and will change to use that instead.

Thanks, I leared now about the struct_size() and flex_array_size() macros.

>> +	if (!array)
>> +		return NULL;
> 
> Personally I prefer pointer-encoded errors instead of NULL. But I don't 
> thing there's a strict rule about it.
>

Usually my rule of thumb is whether is necessary to encode different errno
codes. But in this particular case the only possible error is in kzalloc()
so I thought that is safe to assume in the caller that NULL is -ENOMEM.

>> +
>> +	array->type = type;
>> +
>> +	return array;
>> +}
>> +
>> +static int ssd1307_write_array(struct i2c_client *client,
>> +			       struct ssd1307_array *array, u32 len)
>> +{
>> +	int ret;
>> +
>> +	len += sizeof(struct ssd1307_array);
> 
> Same thing about sizeof: sizeof(var) is better than sizeof(type);
>

Agreed.
 
> Since you're using a separate array structure anyway, wouldn't it make 
> sense to store
>

Indeed.

[snip]

>> +{
>> +	u8 col_end = col_start + cols - 1;
>> +	int ret;
>> +
>> +	if (col_start == ssd1307->col_start && col_end == ssd1307->col_end)
>> +		return 0;
>> +
>> +	ret = ssd1307_write_cmd(ssd1307->client, SSD1307_SET_COL_RANGE);
>> +	if (ret < 0)
>> +		return ret;
>> +
>> +	ret = ssd1307_write_cmd(ssd1307->client, col_start);
>> +	if (ret < 0)
>> +		return ret;
>> +
>> +	ret = ssd1307_write_cmd(ssd1307->client, col_end);
>> +	if (ret < 0)
>> +		return ret;
> 
> Can you write these cmds in one step, such as setting up an array and 
> sending it with ssd1307_write_array?
>

I don't think so because the commands are different. But I'll check the
ssd1306 datasheet again to confirma that's the case.

[snip]
 
>> +
>> +	buf = kmalloc_array(width, height, GFP_KERNEL);
> 
> There's kcalloc().
>

Indeed, forgot about it. Will use it instead...
 
>> +	if (!buf)
>> +		return;
>> +
>> +	/* Clear screen to black if disabled */
>> +	memset(buf, 0, width * height);
>> +

and then could drop this memset() call.

[snip]

>> +
>> +static int ssd1307_fb_blit_rect(struct drm_framebuffer *fb, const struct dma_buf_map *map,
>> +				struct drm_rect *rect)
>> +{
>> +	struct ssd1307_device *ssd1307 = drm_to_ssd1307(fb->dev);
>> +	void *vmap = map->vaddr; /* TODO: Use mapping abstraction properly */
>> +	int ret = 0;
>> +	u8 *buf = NULL;
>> +
>> +	buf = kmalloc_array(fb->width, fb->height, GFP_KERNEL);
> 
> Maybe leave a short comment that these arrays will be consumed by 
> i2c_master_send().
>

Ok.
 
>> +	if (!buf) {
>> +		ret = -ENOMEM;
>> +		goto out_exit;
> 
> It's the first error. Just return directly.
>

Right, reworked a little bit the function and forgot to adapt this error path.

[snip]

>> +
>> +	if (drm_atomic_helper_damage_merged(old_plane_state, plane_state, &rect))
>> +		ssd1307_fb_blit_rect(plane_state->fb, &shadow_plane_state->data[0], &rect);
> 
> Shadow-plane helpers have recently gotten the ability to use virtual 
> screens with sizes much larger than the display.
> 
> If you want to get fancy, you could add this here. It'll give you large 
> display sizes for easy scrolling and fbcon panning.
> 
> Example code is at
> 
> https://elixir.bootlin.com/linux/v5.17-rc2/source/drivers/gpu/drm/tiny/simpledrm.c#L652
> https://elixir.bootlin.com/linux/v5.17-rc2/source/drivers/gpu/drm/tiny/simpledrm.c#L703
> https://elixir.bootlin.com/linux/v5.17-rc2/source/drivers/gpu/drm/tiny/simpledrm.c#L785
>

Thanks for these pointers, very helpful!

[snip] 

>> +
>> +	connector->display_info.width_mm = mode->width_mm;
>> +	connector->display_info.height_mm = mode->height_mm;
>> +	connector->display_info.bpc = 32;
> 
> Not just 1 bit?
>

No because we always expose a fake DRM_FORMAT_XRGB8888 to user-space.

It will have to be adapted once we advertise greyscale and monochrome
formats to user-space.

>> +
>> +	drm_mode_set_name(mode);
>> +	mode->type |= DRM_MODE_TYPE_PREFERRED;
> 
> There's drm_set_preferred_mode().
>

Ok.
 
[snip]

>> +}
>> +
>> +static int ssd1307_probe(struct i2c_client *client)
> 
> This function is fairly confusing. device init, modeconfig init, OF 
> functions are all mixed up. Please bring some structure to this.
>

Yeah, I already tried to give it more structure. The original fbdev driver
just has a huge probe function and I tried to at least split it in many
functions that take care of only one thing. But I'll add more levels of
indirection to keep the probe function simpler.

[snip]

>> +
>> +	bl->props.brightness = ssd1307->contrast;
>> +	bl->props.max_brightness = MAX_CONTRAST;
>> +	ssd1307->bl_dev = bl;
>> +
> 
> drmm_mode_config_init here, then connector init
>

Ok.
 
>> +	ret = drm_simple_display_pipe_init(drm, &ssd1307->pipe, &ssd1307_pipe_funcs,
>> +					   ssd1307_formats, ARRAY_SIZE(ssd1307_formats),
>> +					   NULL, &ssd1307->connector);
>> +	if (ret)
>> +		goto pwm_disable;
>> +
>> +	drm_plane_enable_fb_damage_clips(&ssd1307->pipe.plane);
>> +
>> +	drm_mode_config_reset(drm);
> 
> Moving anything related to mode-config into a function would improve 
> readability.
>

Ok.
 
[snip]

>> +regulator_disable:
>> +	if (ssd1307->vbat_reg)
>> +		regulator_disable(ssd1307->vbat_reg);
>> +	return ret;
> 
> Can this be handled by managed clean-up helpers?
>

I believe so, I'll use the devm_* when possible.

>> +}
>> +
>> +static int ssd1307_remove(struct i2c_client *client)
>> +{
>> +	struct ssd1307_device *ssd1307 = i2c_get_clientdata(client);
>> +
>> +	drm_dev_unplug(&ssd1307->drm);
>> +
>> +	ssd1307_write_cmd(ssd1307->client, SSD1307_DISPLAY_OFF);
> 
> There's drm_atomic_helper_shutdown for switching of the device.
> 
> https://elixir.bootlin.com/linux/v5.17-rc2/source/drivers/gpu/drm/drm_atomic_helper.c#L3136
>

I'll use that then, thanks.

Best regards, -- 
Javier Martinez Canillas
Linux Engineering
Red Hat

