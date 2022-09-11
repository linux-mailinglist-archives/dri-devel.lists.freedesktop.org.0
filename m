Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B81C75B4F12
	for <lists+dri-devel@lfdr.de>; Sun, 11 Sep 2022 15:34:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 811DB10E46B;
	Sun, 11 Sep 2022 13:34:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B9B6410E46B
 for <dri-devel@lists.freedesktop.org>; Sun, 11 Sep 2022 13:34:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1662903251;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UKjthsUaDF/tQ2BVZf10QWCE31KVr4BfvrxPp6oS5Vo=;
 b=D+JnK4szI4czy/mPuaqYbN3PmjfqTaO/tLHChsgOLEHVbA02Jqu/dIl0LHY7F5KxrUG7hO
 awNzLTMbsvFHmi0MwxZXeJRqG0U6+BmVdUBMNtcvwNYSvxZG8pHo+NA0fIhXgBS399MMDH
 hqSRgqz4tTFjsOuaL8DZvxZFvQ0yd5c=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-622-HMw8E63TPiqhBRUa1aOI3A-1; Sun, 11 Sep 2022 09:34:10 -0400
X-MC-Unique: HMw8E63TPiqhBRUa1aOI3A-1
Received: by mail-ed1-f69.google.com with SMTP id
 t13-20020a056402524d00b0043db1fbefdeso4431162edd.2
 for <dri-devel@lists.freedesktop.org>; Sun, 11 Sep 2022 06:34:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=UKjthsUaDF/tQ2BVZf10QWCE31KVr4BfvrxPp6oS5Vo=;
 b=rz73N83QtEtK+0IjRBlhixq1BhhkDY4ZZRua1v9FyaRJMvSgcWvRvGlyLC6++bD/L8
 f5M6aIM3RpytmuXoqbP7csqr3e/FZgtSWzOf89lzU3whAgufElSVsANark624CczJRVe
 qSP0Ugqq3mXGE3ZnjX7EDnhHktnM4xVHcF1U6hrLPfDoZXmEZc0t2c1rda0UFuWlH6qQ
 oSlagz8jcbWqUE3xO19IgFx+jsSNWnDLsheA7h+BaOKQMMqoUJb2lnMD6o+PQKpVxA0i
 fvAXqyg2BycWgWuU0dMRkHmtHvA2RUUs8hfTtxLumbdTYptisWQ1ODfXODXMJ7kfaqPB
 oZ9A==
X-Gm-Message-State: ACgBeo2G0mFHZk9yH+Evl5cczr0c2TuH2YnKFplifKJW+B1ZHUhv79AD
 kiqdtn+0XnVtf/9Z+1lo+KWkIrttsUW54bHUZ5kyP3MqmCmUeKtDBa0nh/rCwID9pL+K4OxS3LT
 FAjqOVLnbG/R9YoGgHow+C5RLd2Bd
X-Received: by 2002:a05:6402:1e8d:b0:441:58db:b6a2 with SMTP id
 f13-20020a0564021e8d00b0044158dbb6a2mr18231975edf.277.1662903249025; 
 Sun, 11 Sep 2022 06:34:09 -0700 (PDT)
X-Google-Smtp-Source: AA6agR5F6he2sp0EoHpvKWIMDQpxoUa903FRGG4KCTVq3jR3WA/Ne9ByFrlaKvNIcBg3ccB4rrSHHw==
X-Received: by 2002:a05:6402:1e8d:b0:441:58db:b6a2 with SMTP id
 f13-20020a0564021e8d00b0044158dbb6a2mr18231961edf.277.1662903248812; 
 Sun, 11 Sep 2022 06:34:08 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c1e:bf00:d69d:5353:dba5:ee81?
 (2001-1c00-0c1e-bf00-d69d-5353-dba5-ee81.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:c1e:bf00:d69d:5353:dba5:ee81])
 by smtp.gmail.com with ESMTPSA id
 q13-20020a056402040d00b004511b4779f0sm4022313edv.30.2022.09.11.06.34.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 11 Sep 2022 06:34:08 -0700 (PDT)
Message-ID: <7506231b-1ea1-b94d-4341-40e7873f4f06@redhat.com>
Date: Sun, 11 Sep 2022 15:34:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
Subject: Re: [PATCH 1/4] drm/gma500: Refactor backlight support
To: Sam Ravnborg <sam@ravnborg.org>
References: <20220910205101.1355950-1-hdegoede@redhat.com>
 <20220910205101.1355950-2-hdegoede@redhat.com>
 <Yx3K/6aF/twnuaHV@ravnborg.org>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <Yx3K/6aF/twnuaHV@ravnborg.org>
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Sam,

On 9/11/22 13:48, Sam Ravnborg wrote:
> Hi Hans,
> 
> just a few minor things. See comments.
> I like the diff - removes much more than it adds.

I'm glad you like it and thank you for the review.

> On Sat, Sep 10, 2022 at 10:50:58PM +0200, Hans de Goede wrote:
>> Refactor backlight support so that the gma_backlight_enable() /
>> gma_backlight_disable() / gma_backlight_set() functions used by
>> the Opregion handle will also work if no backlight_device gets
>> registered.
>>
>> This is a preparation patch for not registering the gma500's own backlight
>> device when acpi_video should be used, since registering 2 backlight
>> devices for a single display really is undesirable.
>>
>> Since the acpi-video interface often uses the OpRegion we need to keep
>> the OpRegion functional even when dev_priv->backlight_device is NULL.
>>
>> As a result of this refactor the actual backlight_device_register()
>> call is moved to the shared backlight.c code and all #ifdefs related to
>> CONFIG_BACKLIGHT_CLASS_DEVICE are now also limited to backlight.c .
>>
>> No functional changes intended.
>>
>> This has been tested on a Packard Bell Dot SC (Intel Atom N2600, cedarview)
>> and a Sony Vaio vpc-x11s1e (Intel N540, poulsbo) laptop.
>>
>> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
>> ---
> 
>> +static int gma_backlight_update_status(struct backlight_device *bd)
>> +{
>> +	struct drm_device *dev = bl_get_data(bd);
>> +	int level = bd->props.brightness;
> 
> Here backlight_get_brightness(bd) should be used.

Ack, but the old set methods all 3 used:

	int level = bd->props.brightness;

So that would be a small functional / behavior change.

As such I would prefer to split using backlight_get_brightness(bd)
out into a separate patch for version 2 of the series.
Like how I also made the change from type = BACKLIGHT_PLATFORM ->
type = BACKLIGHT_RAW a separate change.

Would that be ok with you ?

> 
> 
>>  int gma_backlight_init(struct drm_device *dev)
>>  {
>> -#ifdef CONFIG_BACKLIGHT_CLASS_DEVICE
>>  	struct drm_psb_private *dev_priv = to_drm_psb_private(dev);
>> +	struct backlight_properties props = {};
>> +	int ret;
>> +
>>  	dev_priv->backlight_enabled = true;
>> -	return dev_priv->ops->backlight_init(dev);
>> -#else
>> -	return 0;
>> +	dev_priv->backlight_level = 100;
>> +
>> +	ret = dev_priv->ops->backlight_init(dev);
>> +	if (ret)
>> +		return ret;
>> +
>> +#ifdef CONFIG_BACKLIGHT_CLASS_DEVICE
>> +	props.brightness = dev_priv->backlight_level;
>> +	props.max_brightness = PSB_MAX_BRIGHTNESS;
>> +	props.type = BACKLIGHT_PLATFORM;
>> +
>> +	dev_priv->backlight_device =
>> +		backlight_device_register(dev_priv->ops->backlight_name,
>> +					  dev->dev, dev,
>> +					  &gma_backlight_ops, &props);
> 
> Consider using the devm_backlight_device_register() variant.
> Then you can drop gma_backlight_exit() - I think..

The problem is the rest of the driver does not use devm_foo functions,
so then psb_driver_unload() which runs before the devm cleanup functions
will already release various iommap-s before the backlight is unregistered.

This leaves a race where the backlight device could be poked and then try
to use no longer valid pointers in the main driver struct to write to the hw.

Regards,

Hans





> 
>> +	if (IS_ERR(dev_priv->backlight_device))
>> +		return PTR_ERR(dev_priv->backlight_device);
>>  #endif
>> +
>> +	return 0;
>>  }
>>  
>>  void gma_backlight_exit(struct drm_device *dev)
>>  {
>>  #ifdef CONFIG_BACKLIGHT_CLASS_DEVICE
>>  	struct drm_psb_private *dev_priv = to_drm_psb_private(dev);
>> -	if (dev_priv->backlight_device) {
>> -		dev_priv->backlight_device->props.brightness = 0;
>> -		backlight_update_status(dev_priv->backlight_device);
>> +
>> +	if (dev_priv->backlight_device)
>>  		backlight_device_unregister(dev_priv->backlight_device);
>> -	}
>>  #endif
>>  }
> 

