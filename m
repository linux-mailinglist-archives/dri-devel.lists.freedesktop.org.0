Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C85E4A81CB6
	for <lists+dri-devel@lfdr.de>; Wed,  9 Apr 2025 08:11:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8DFA710E2EB;
	Wed,  9 Apr 2025 06:11:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="FA+7FuBi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D33E210E2EB
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Apr 2025 06:11:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1744179088;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=FkGJe1evrgUVlR6KJxJhudUWP1DF0JGYcQqiM6RClM0=;
 b=FA+7FuBiNC4R3UjeyaUzsIloet7I/vVO8LIyZJtMWzPu65VMZ/hVpQzdJ6nuq3jB5d3aVC
 Zkg9bwMQwdzWSUQbwbWc1oh4iffISgB6UYdCbhuYBeUMrWnv8jeVp/tBtMf9LMb5aR2+R7
 7i1doeWrJ6G3qnvDwAeC5HCsnSuyH/k=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-652-FI5ETsbeN3C1YAjiWnjiUw-1; Wed, 09 Apr 2025 02:11:27 -0400
X-MC-Unique: FI5ETsbeN3C1YAjiWnjiUw-1
X-Mimecast-MFC-AGG-ID: FI5ETsbeN3C1YAjiWnjiUw_1744179086
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-43cf44b66f7so53054745e9.1
 for <dri-devel@lists.freedesktop.org>; Tue, 08 Apr 2025 23:11:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744179086; x=1744783886;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=FkGJe1evrgUVlR6KJxJhudUWP1DF0JGYcQqiM6RClM0=;
 b=rbQU0AtmqT7I6mmpGtFHqG5ZHa21EcofC+qElGlFbIyMtPW1iYZgnVRK14BNIuVJOp
 x3JzQPVliUeXhO//faFLjUQYj08WdEuHAF+dG1cbNgMGAMSnA0Da8DDaY9aggy153dN3
 C9qcHI+HO6IciQoPclVjdEt2zIozE+oP6HKKlTYid/BxcSmH4c2IArl28X/SrLlWYgfR
 frOG95u5dmcUrpoS+bE3rtky1CSOPI2fCsAfmdIjgp/MPBdYaLMfrjG8scRJEYEpu+J5
 bxY91O3anJ850s8LVGMaJc8C8mlGhcZtS7iELG2KJIyNpdnY+Bw3mwjV/suJSjdhYDhT
 SAnQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUSOL0EXADgYqr04RCv+lgyHaC251pDrzgJ6rPoC7UvF2yhwLDJROzzWaerdyL/oV7VLpxBlpATxjA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxzurpl6qLC1L4KfQYHVMLE8l+N3r11sDn/QbCr4KiOiCWMtciz
 esHLmpGKL3oGIk8W3lK5K4aSMFErCVHoNZalhbSZicsrKwFOYjCHWX5C/aVa5MPOHOVUCa+S2Bz
 AlrweI8vVej8QA4Kfw8gFu37v9YuLVFYCJH/4n3luQKweiUUyZXIYfryQEqE7U8YQcg==
X-Gm-Gg: ASbGncv2VEAFVFGLOanrHMOb/lSw8avbGG3P9ZDX8gdrW29qr0jrm3MaViYGtZl9Drf
 mcnIgWeLpEbw0hKjA783bUsKpxREDC5DFgTf0i6fXQtpMLHlzE7ohxopUL6TC1SLdJz8/Bck6cz
 TzqWbqW4zY6pl3l2Hla+5to1Omfm2Llr38dMBpJ5+T4od6i/Gz/eMHTJWdUuM6oCEqfoZqyo736
 gb6IDq45pJs5w/WEOxSRTYEL7Q8Xrt4UG0A/mBguabzL9Da8mGtfBECrreZTtpVp8E/f0zmhtCH
 yXwIr7/DKLy7PBFPxqAAj48gRQxc/89CmktfTg3J
X-Received: by 2002:a05:600c:154a:b0:43d:300f:fa51 with SMTP id
 5b1f17b1804b1-43f1eca7bcemr12685745e9.9.1744179086139; 
 Tue, 08 Apr 2025 23:11:26 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGSLZG2TBuSXmab/YseLnbp2IIg80r1qZhkNHXeucJ53UNHusBlv/XxTzUgia33RxlF3w3lcA==
X-Received: by 2002:a05:600c:154a:b0:43d:300f:fa51 with SMTP id
 5b1f17b1804b1-43f1eca7bcemr12685485e9.9.1744179085800; 
 Tue, 08 Apr 2025 23:11:25 -0700 (PDT)
Received: from localhost ([185.124.31.119]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43f205ecb20sm9182735e9.3.2025.04.08.23.11.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Apr 2025 23:11:25 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Marcus Folkesson <marcus.folkesson@gmail.com>
Cc: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Thomas
 Zimmermann <tzimmrmann@suse.de>
Subject: Re: [PATCH v3 2/3] drm/st7571-i2c: add support for Sitronix ST7571
 LCD controller
In-Reply-To: <Z_Uin2dvmbantQU4@gmail.com>
References: <20250408-st7571-v3-0-200693efec57@gmail.com>
 <20250408-st7571-v3-2-200693efec57@gmail.com>
 <87cydn9bkx.fsf@minerva.mail-host-address-is-not-set>
 <Z_Uin2dvmbantQU4@gmail.com>
Date: Wed, 09 Apr 2025 08:11:23 +0200
Message-ID: <87ecy1g8z8.fsf@minerva.mail-host-address-is-not-set>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: sjWCKs89960_P8qYlP64kgp8UKa3a7M7EuC4hWUJewY_1744179086
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
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

Marcus Folkesson <marcus.folkesson@gmail.com> writes:

> Hello Javier,
>
> Thank you for your review and suggestions.
>
> On Tue, Apr 08, 2025 at 12:44:46PM +0200, Javier Martinez Canillas wrote:
>> Marcus Folkesson <marcus.folkesson@gmail.com> writes:
>> 
>> Hello Marcus,
>> 
>> > Sitronix ST7571 is a 4bit gray scale dot matrix LCD controller.
>> > The controller has a SPI, I2C and 8bit parallel interface, this
>> > driver is for the I2C interface only.
>> >
>> 
>> I would structure the driver differently. For example, what was done
>> for the Solomon SSD130X display controllers, that also support these
>> three interfaces:
>> 
>> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/gpu/drm/solomon
>> 
>> Basically, it was split in a ssd130x.c module that's agnostic of the
>> transport interface and implements all the core logic for the driver.
>> 
>> And a set of different modules that have the interface specific bits:
>> ssd130x-i2c.c and ssd130x-spi.c.
>> 
>> That way, adding for example SPI support to your driver would be quite
>> trivial and won't require any refactoring. Specially since you already
>> are using regmap, which abstracts away the I2C interface bits.
>
> Yes, I had in mind to start looking into this after the initial version.
> The driver is writtin in this in mind, everything that is common for all
> interfaces is easy to move out.
>

Yes, I noticed that and the reason why I mentioned the file layout used in
the ssd130x driver. If was meant to only be an I2C driver then I think it
would be a good candidate for the tiny sub-dir (that is for small drivers
that can be implemented in a single file).

But as said, it's OK for me too if you start in tiny and then refactor it
to be moved to a sitronix vendor sub-dir.

[...]

>> > +static int st7571_set_pixel_format(struct st7571_device *st7571,
>> > +				   u32 pixel_format)
>> > +{
>> > +	switch (pixel_format) {
>> > +	case DRM_FORMAT_C1:
>> > +		return st7571_set_color_mode(st7571, ST7571_COLOR_MODE_BLACKWHITE);
>> > +	case DRM_FORMAT_C2:
>> > +		return st7571_set_color_mode(st7571, ST7571_COLOR_MODE_GRAY);
>> > +	default:
>> > +		return -EINVAL;
>> > +	}
>> 
>> These should be DRM_FORMAT_R1 and DRM_FORMAT_R2 and not C{1,2}. The former
>> is for displays have a single color (i.e: grey) while the latter is when a
>> pixel can have different color, whose values are defined by a CLUT table.
>> 
>
> I see.
> Does fbdev only works with CLUT formats? I get this error when I switch
> to DRM_FORMAT_R{1,2}:
>
> [drm] Initialized st7571 1.0.0 for 0-003f on minor 0
> st7571 0-003f: [drm] format C1   little-endian (0x20203143) not supported
> st7571 0-003f: [drm] No compatible format found
> st7571 0-003f: [drm] *ERROR* fbdev: Failed to setup emulation (ret=-22)
>
>

That's a god question, I don't really know...

But fbdev does support XRGB8888, which may be another good reason to add
it and make it the default format. Yes, it will cause an unnecessary pixel
format conversion but the I2C transport is so slow anyways that compute is
not the bottleneck when using these small displays.

>> ...
>> 
>> > +
>> > +static const uint32_t st7571_primary_plane_formats[] = {
>> > +	DRM_FORMAT_C1,
>> > +	DRM_FORMAT_C2,
>> > +};
>> > +
>> 
>> I would add a DRM_FORMAT_XRGB8888 format. This will allow your display to
>> be compatible with any user-space. Your st7571_fb_blit_rect() can then do
>> a pixel format conversion from XRGB8888 to the native pixel format.
>
> This were discussed in v2, but there were limitations in the helper
> functions that we currently have.
>

Indeed, will need a drm_fb_xrgb8888_to_gray2() for R2. There is already a
drm_fb_xrgb8888_to_mono() as mentioned that you can use for R1. 

> I will look into how this could be implemented in a generic way, but maybe that is
> something for a follow up patch?
>

Yes, it could be a follow-up patch. It just helps to have XRGB8888 support for
compatibility reasons (the fbdev issue you found is another example of this).

[...]

>> > +
>> > +static void st7571_remove(struct i2c_client *client)
>> > +{
>> > +	struct st7571_device *st7571 = i2c_get_clientdata(client);
>> > +
>> > +	drm_dev_unplug(&st7571->dev);
>> 
>> I think you are missing a drm_atomic_helper_shutdown() here.
>
> This is a change for v3. As the device has been unplugged already, it
> won't do anything, so I removed it.
>
> Isn't it right to do so?
>
>

It seems I was wrong on this and your implementation is correct. I talked
with Thomas yesterday and he clarified it to me.

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

