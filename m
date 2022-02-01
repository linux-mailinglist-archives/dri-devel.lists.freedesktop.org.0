Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D8DF4A53EC
	for <lists+dri-devel@lfdr.de>; Tue,  1 Feb 2022 01:14:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 41F9B10E13B;
	Tue,  1 Feb 2022 00:14:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5910210E13B
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Feb 2022 00:14:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643674466;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ps16fl052MoECt1hx8noeHj7dwSbReJeRPk0QUxjhD0=;
 b=JJZBiSTjV2TNvLjZ5ti7PvPZon1MY11jYHVJcfeeuUVQS6yaD4ttgUJqB65PV6ZNpmqGDO
 v+GwGED+j+cDE6ZGoTbOBKmc+lfxMc4bVbqdMsaiZ6zERmmkcX0Xk+GKELv6bfla833aIa
 q4mMA7rxLWPaLexC0kZPFoyzeaSN8kw=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-605-svE9zsGuNrKeAVnv61VCiw-1; Mon, 31 Jan 2022 19:14:25 -0500
X-MC-Unique: svE9zsGuNrKeAVnv61VCiw-1
Received: by mail-wm1-f72.google.com with SMTP id
 c7-20020a1c3507000000b0034a0dfc86aaso493548wma.6
 for <dri-devel@lists.freedesktop.org>; Mon, 31 Jan 2022 16:14:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=ps16fl052MoECt1hx8noeHj7dwSbReJeRPk0QUxjhD0=;
 b=AgSzF5cAdoB7crKcKA7653rbOl2F1mBnUrOPH63pw8ZIxg0vshUyz3hI//Wh8JrDTd
 deWX+DE9ih4XnfaLRhFi+dLCZkq2NmzKFc9o/Hvq/gHi0XzOv40aUUfvof4BBmjHOHE/
 ZYaq9DvkQ7hJOQ+APai4Z0FYziBKb5sgw1oJ3iukZRpTUQ9xELsdnpQfdixglVVgx1ft
 ejOpb5KH/7V9Iz+HVQVTIYaDGxwuRaOqME6/UdRjYzotOqtQrOj32dgaBf1p0Uk9nrPA
 owoj4H+W2S9BZUBVM1QCSwmM/0LxxUKmL8jLxLwBbbud5NM1lgYmW52EgF+ydPAQrEyz
 eFHg==
X-Gm-Message-State: AOAM533g85wlr7b3NXD0ZZQrCoYw2P5VbhR3lnKpGlMgLhbjJWPBhI2x
 6SpjrcnC7rR21UOKkldycNjLIM9HaSzYemyK4k2KFn/I+aeZl7Nsf+DwuA6LMKMszsnQZTgp6ps
 KqcvmKdk8GcZP87kA+oNP989gP3/9
X-Received: by 2002:a5d:60c5:: with SMTP id x5mr19143765wrt.376.1643674463758; 
 Mon, 31 Jan 2022 16:14:23 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwfVtkCLf5UCIVhNuwJpoPBEx1wQeITiJVAbwrAqN+w+wDCXUwxdqOf4wRfKkVW2NOXweGpJw==
X-Received: by 2002:a5d:60c5:: with SMTP id x5mr19143753wrt.376.1643674463532; 
 Mon, 31 Jan 2022 16:14:23 -0800 (PST)
Received: from [192.168.1.102] ([92.176.231.205])
 by smtp.gmail.com with ESMTPSA id q13sm13395493wrd.78.2022.01.31.16.14.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 31 Jan 2022 16:14:23 -0800 (PST)
Message-ID: <3aac291a-b30e-2775-336f-66dd08d634e2@redhat.com>
Date: Tue, 1 Feb 2022 01:14:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 3/4] drm/tiny: Add driver for Solomon SSD1307 OLED displays
To: Sam Ravnborg <sam@ravnborg.org>
References: <20220131202916.2374502-1-javierm@redhat.com>
 <YfhVBtv1UIA7bJja@ravnborg.org>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <YfhVBtv1UIA7bJja@ravnborg.org>
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
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>, Maxime Ripard <maxime@cerno.tech>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello Sam,

Thanks for your suggestions.

On 1/31/22 22:30, Sam Ravnborg wrote:
> Hi Javier,
> 
> On Mon, Jan 31, 2022 at 09:29:16PM +0100, Javier Martinez Canillas wrote:
>> Add a DRM driver for SSD1305, SSD1306, SSD1307 and SSD1309 Solomon OLED
>> controllers that can be programmed via an I2C interface. This is a port
>> of the ssd1307fb driver that already supports these devices.
>>
>> A Device Tree binding is not added because the DRM driver is compatible
>> with the existing binding for the ssd1307fb driver.
> 
> The driver uses the pwms property for the backlight.
> It would have been much better to bite the bullet and require the
> backlight to be specified using a backlight node in the DT.
> This is the standard way to do it and then the driver could use the
> existing backlight driver rather than embedding a backlight driver here.
>

I did consider that. Because that would allow me to use a struct drm_panel
and as you said make the core to manage the backlight. But then decied to
just keep the backward compatibility with the existing binding to make it
easier for users to migrate to the DRM driver.

I wonder if we could make the driver to support both ? That is, to query
if there's a backlight with drm_panel_of_backlight() and if not found then
registering it's own backlight like the driver is currently doing.
 
> It would cost some backward compatibility - but looking forward this is
> the right thing to do.
>

I don't have a strong opinion. As mentioned I thought that was more worthy
to keep the backward compat over doing it correctly. After all, this driver
is for a very niche hardware (small OLED monochromatic panels), so I wasn't
that concerned about supporting the proper DT conventions.

I would also like to know Andy's opinion. Since he mentioned that embedded
x86/ACPI hardware is using the PRP0001 _DSD extension to match against the
OF driver. I wonder how feasible is for those platforms to change the DSDT.

Another option is to have different compatible strings for this ? I wanted
to drop the "fb" suffix and just have OF entries with compatible "ssd1307"
instead of "ssd1307fb", but again left the latter for backward compat.

But maybe we can have the "fb" ones creating the backlight and the new ones
expecting it to have a backlight DT node.

>>
>> Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
> 
> Some random comments in the following.
> 
> 	Sam

[snip]

>> +config TINYDRM_SSD1307
>> +	tristate "DRM support for Solomon SSD1307 OLED displays"
> Use SSD130X here - so SSD1306 users can find it.
>

Agreed. That's what I had before (and also in the driver, MAINTAINERS entry,
etc) but then changed to SSD1307 everywhere. Unsure what could be more clear
to users grepping to figure out if there's a DRM driver for their device.

I'll follow your suggestion and change in the Kconfig description for v2.

[snip]

>> +
>> +static int ssd1307_fb_blit_rect(struct drm_framebuffer *fb, const struct dma_buf_map *map,
>> +				struct drm_rect *rect)
>> +{
>> +	struct ssd1307_device *ssd1307 = drm_to_ssd1307(fb->dev);
>> +	void *vmap = map->vaddr; /* TODO: Use mapping abstraction properly */
> Hmm, can we fix this TODO now?
>

I did try to fix it while writing the driver but couldn't figure out what was
the proper abstraction to use. Looked at other drivers but *many* do the same
and have the exact same comment :)

$ git grep "TODO: Use mapping abstraction properly" -- drivers/gpu/  | wc -l
15

I'll be happy to fix it if someone could elaborate what this comment expects.

[snip]

>> +
>> +	if (!drm_dev_enter(drm, &idx))
>> +		return;
>> +
>> +	backlight_enable(ssd1307->bl_dev);
> This seems backward - I would have assumed backlight was enabled
> after the display was enabled - so you potentially hide some flickering.
> This is the order done in drm_panel.
>

I see. Sure, I'll change this in v2 as well.

[snip]
 
>> +
>> +	backlight_disable(ssd1307->bl_dev);
> And here backlight could be disabled before disabling the display.
> 

Ok.

[snip]

>> +
>> +	/* Turn on the display */
>> +	ret = ssd1307_write_cmd(ssd1307->client, SSD1307_DISPLAY_ON);
>> +	if (ret < 0)
>> +		return ret;
> I would assume the display is turned on later - and should be left off
> here. The pipe function will do this when needed.
>

Indeed. I based this on the the ssd1307fb probe logi but forgot to remove
this that's not needed since will be managed by display pipe {en,dis}able.
 
>> +
>> +	return 0;
>> +}
>> +
>> +static int ssd1307_update_bl(struct backlight_device *bdev)
>> +{
>> +	struct ssd1307_device *ssd1307 = bl_get_data(bdev);
>> +	int brightness = bdev->props.brightness;
> Use backlight_get_brightness(bdev) here.
>

Ok.
 
>> +	int ret;
>> +
>> +	ssd1307->contrast = brightness;
>> +
>> +	ret = ssd1307_write_cmd(ssd1307->client, SSD1307_CONTRAST);
>> +	if (ret < 0)
>> +		return ret;
>> +
>> +	ret = ssd1307_write_cmd(ssd1307->client, ssd1307->contrast);
>> +	if (ret < 0)
>> +		return ret;
>> +
>> +	return 0;
>> +}
>> +
>> +static int ssd1307_get_brightness(struct backlight_device *bdev)
>> +{
>> +	struct ssd1307_device *ssd1307 = bl_get_data(bdev);
>> +
>> +	return ssd1307->contrast;
> I am pretty sure this function can be omitted - as the brightness value
> is not changed unless we write it.
>

Gotcha. I will remove this too then.

[snip] 

>> +
>> +	drm_connector_helper_add(&ssd1307->connector, &ssd1307_connector_helper_funcs);
>> +	ret = drm_connector_init(drm, &ssd1307->connector, &ssd1307_connector_funcs,
>> +				 DRM_MODE_CONNECTOR_Unknown);
> Why not the I2C connector?
>

Doh, I forgot to update the driver after introducing patch 1/4...
 
[snip]

>> +
>> +	snprintf(bl_name, sizeof(bl_name), "ssd1307%d", drm->primary->index);
>> +	bl = backlight_device_register(bl_name, dev, ssd1307, &ssd1307fb_bl_ops,
>> +				       NULL);
> devm_backlight_device_register?
> And use (dev, dev_name(dev), - so you can drop bl_name[]
>

Right. Good suggestion.

[snip]
 
>> +	}
>> +regulator_disable:
>> +	if (ssd1307->vbat_reg)
>> +		regulator_disable(ssd1307->vbat_reg);
> No need for the if (sd1307->vbat_reg) here.
>

Ok.

[snip]
 
>> +	if (ssd1307->vbat_reg)
>> +		regulator_disable(ssd1307->vbat_reg);
> Drop if.
>

Ok.

If you don't mind I'll wait a few days before re-spining v2, in case
others could have more feedback. Thanks a lot again for your review.
 
Best regards,
-- 
Javier Martinez Canillas
Linux Engineering
Red Hat

