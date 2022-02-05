Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C2CFA4AAAAD
	for <lists+dri-devel@lfdr.de>; Sat,  5 Feb 2022 18:40:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 65A6310E171;
	Sat,  5 Feb 2022 17:40:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 341CB10E171
 for <dri-devel@lists.freedesktop.org>; Sat,  5 Feb 2022 17:40:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644082813;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=s+XMIPONIeda9RhSsJc9ELak7yslDV8zLw8dyCY9WO4=;
 b=g18dXsA6ZUPY8op+KrLFghaTiFu0vBkULlppp5jkz2cVhTRvM+BVqXLD53T5eM/jsrzwcM
 TX8hlYDLoUPITipklB4pQwxtaNhapKzHrR1DB1Au69COS6X43gAPMo4gxRfp+fB1LXWl95
 aLfjAqWzUSEp0+d5J2NYx7Ge2cg1r0g=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-300-AwvEPu2mNJ2uuNZCs5hr2g-1; Sat, 05 Feb 2022 12:40:11 -0500
X-MC-Unique: AwvEPu2mNJ2uuNZCs5hr2g-1
Received: by mail-wr1-f69.google.com with SMTP id
 y10-20020adfc7ca000000b001e30ed3a496so291515wrg.15
 for <dri-devel@lists.freedesktop.org>; Sat, 05 Feb 2022 09:40:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=s+XMIPONIeda9RhSsJc9ELak7yslDV8zLw8dyCY9WO4=;
 b=psoW0b+XuiqbOuYPR7wfDtOAdcRGewXHUhVSZEhB97U/wnBvVJtMonztegb6MgHmRW
 L8phSNcsgKnajy3a6MnxWajyHVqxXdzR98UX5XOeX0EVt4gWgvARffQnEZxiCNi9fO7g
 AMeiMrrjhztYVNQZ/B6Jbe5CwFdm17na8SC5wPi69S2G8wBf2wvd6kX55d1AodLDaUFT
 rYV34Hw+PB6MlgzST2LGEDCkuNRQjfUHur+XQY3xBeP8f2JlR/F0vmZwLV08sSEsZg8O
 oncjiUxp6ZQ37zsoEXKW5oeskCycbD1ksfR/Pj7TmSdyf5T5/U750LVoaChh27z9IEDo
 BO4A==
X-Gm-Message-State: AOAM53126PnFaurryQvgQS675DELLms6yeb19c0Qh/2TqrUPvDEPDAEb
 8nXa3IuDo5sxZsjC2TxW+ylv5055/sNS1arx5SGW1spuHD9DLxXvLH7o3ZtxMk6pElD/t7oplyl
 wsOmWoMnc8198JtAsWNswIWgfxfpL
X-Received: by 2002:adf:eacc:: with SMTP id o12mr3614260wrn.576.1644082809879; 
 Sat, 05 Feb 2022 09:40:09 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzwOCtnvSr9+0ruFVwU6XWZ8NVfXJZicBayON9c+Gj34T6iN20u+eYDTxD526vsLX81bmpGlg==
X-Received: by 2002:adf:eacc:: with SMTP id o12mr3614243wrn.576.1644082809582; 
 Sat, 05 Feb 2022 09:40:09 -0800 (PST)
Received: from [192.168.1.102] ([92.176.231.205])
 by smtp.gmail.com with ESMTPSA id ay29sm4452119wmb.38.2022.02.05.09.40.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 05 Feb 2022 09:40:09 -0800 (PST)
Message-ID: <8b87cbc8-4878-b320-9460-dac751f6f0d6@redhat.com>
Date: Sat, 5 Feb 2022 18:40:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v2 2/4] drm/tiny: Add driver for Solomon SSD130X OLED
 displays
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
References: <20220204134347.1187749-1-javierm@redhat.com>
 <20220204134347.1187749-3-javierm@redhat.com>
 <Yf03sCSuQwHKvgA9@smile.fi.intel.com>
 <d4e8c16c-5586-3233-0b99-be15a4c0f7aa@redhat.com>
 <Yf511hhojzIXcNXp@smile.fi.intel.com>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <Yf511hhojzIXcNXp@smile.fi.intel.com>
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
Cc: linux-pwm@vger.kernel.org, linux-fbdev@vger.kernel.org,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Mark Brown <broonie@kernel.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Liam Girdwood <lgirdwood@gmail.com>,
 =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>, Maxime Ripard <maxime@cerno.tech>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
 Thierry Reding <thierry.reding@gmail.com>, Lee Jones <lee.jones@linaro.org>,
 Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2/5/22 14:04, Andy Shevchenko wrote:
> On Fri, Feb 04, 2022 at 08:19:12PM +0100, Javier Martinez Canillas wrote:
>> On 2/4/22 15:26, Andy Shevchenko wrote:
>>> On Fri, Feb 04, 2022 at 02:43:45PM +0100, Javier Martinez Canillas wrote:
> 
> ...
> 
>>>> +struct ssd130x_device {
>>>> +	struct drm_device drm;
>>>> +	struct drm_simple_display_pipe pipe;
>>>> +	struct drm_display_mode mode;
>>>> +	struct drm_connector connector;
>>>
>>>
>>>> +	struct i2c_client *client;
>>>
>>> Can we logically separate hw protocol vs hw interface from day 1, please?
>>> This will allow to add SPI support for this panel much easier.
>>>
>>> Technically I would like to see here
>>>
>>> 	struct device *dev;
>>>
>>> and probably (I haven't looked into design)
>>>
>>> 	struct ssd130x_ops *ops;
>>>
>>> or something alike.
>>
>> Sure. I wanted to keep the driver simple, making the writes bus agnostic and
>> adding a level of indirection would make it more complex. But I agree that
>> it will also make easier to add more buses later. I will do that for v3.
> 
> I have SSD1306 display with SPI interface and I'm not able to test your series.
> With the above it at least gives me a point to consider helping (coding and
> testing)  with SPI one.
>

Yes, I understand that. On the other hand, I only have a SSD1306 with an I2C
interface so I'm interested in supporting that. Then someone could extend to
support other buses :)

But I agree with you that making the driver easier to extend and using regmap
would be desirable. In fact, since I will add the level of indirection I can
got ahead and attempt to add the SPI support as well.

I won't be able to test but I can use drivers/staging/fbtft/fb_ssd1306.c as a
reference for this.

> ...
> 
>>>> +	if (!fb)
>>>> +		return;
>>>
>>> Can it happen?
>>
>> I don't know, but saw that the handler of other drivers checked for this so
>> preferred to play safe and do the same.
> 
> So, either cargo-cult or indeed it may happen. Somebody may conduct a research
> on this...
>

Someone familiar with the simple display pipe helpers should chime in, I tried
to grep around but couldn't figure out whether it was safe or not to assume the
struct drm_framebuffer won't ever be NULL in a struct drm_shadow_plane_state.

As mentioned other drivers were doing and I preferred to be defensive rather
than leading to a possible NULL pointer dereference.
 
> ...
> 
>>>> +	drm_mode_probed_add(connector, mode);
>>>> +	drm_set_preferred_mode(connector, mode->hdisplay, mode->vdisplay);
>>>> +
>>>> +	return 1;
>>>
>>> Positive code, what is the meaning of it?
>>
>> It's the number of connector modes. The driver only supports 1.
> 
> A comment then?
> 

Yes, that makes sense.

Best regards,
-- 
Javier Martinez Canillas
Linux Engineering
Red Hat

