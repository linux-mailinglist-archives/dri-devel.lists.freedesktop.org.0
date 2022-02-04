Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 09ED44AA019
	for <lists+dri-devel@lfdr.de>; Fri,  4 Feb 2022 20:31:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D6CA510EB3B;
	Fri,  4 Feb 2022 19:31:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9EE2210EB3B
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Feb 2022 19:31:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644003100;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XB7EqmHX3QJchDoebIRUn45wKZyDtzMRU7LbvShZrmI=;
 b=XoEy8CyWXdXJ3PgmQkvIX6g0A8RdEWXkOB9j+UbPDOJx/AO4aZXgIoBpCCqsTU+sTEy5TJ
 A0sh954FKmMT8WW65+yfJYr/9Ot0Bha3g3yIpnUX2HUuqCf1ymFKx204+ue/niSW8OxdtY
 T4U8wd+RuO1tuadaPQ8SylXLS696kzQ=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-118-kto3r6cbPCOZbHElBttQlQ-1; Fri, 04 Feb 2022 14:31:39 -0500
X-MC-Unique: kto3r6cbPCOZbHElBttQlQ-1
Received: by mail-wr1-f69.google.com with SMTP id
 q4-20020adfbb84000000b001dd3cfddb2dso2443808wrg.11
 for <dri-devel@lists.freedesktop.org>; Fri, 04 Feb 2022 11:31:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=XB7EqmHX3QJchDoebIRUn45wKZyDtzMRU7LbvShZrmI=;
 b=cFc66SyIxRoEKREly6kxyt4WoqrGUrZEmW9EvfetnxjY7sYb0UTdyHVJvgwfnRBVtk
 DsXtUkMPZRWtA1vHUlXHMY4pqrgOTSyUYIedt87S2pHXiM5OTpnBrAkfH4zmHe5iTGx8
 S8UOJu+3umqI/tcQ4lGikbrbi7ACmTIUoOF2VVCc3SW76TuCFmt44zel8bMyJrPmAA/j
 xcKgNG7BmlWayy6no1Dvg2MongpMHI+pXAgx0i2iOK3WWd7GKJV/3UN3wxXGMDzwFblQ
 JVSnwTHiJxj/TiI+eqTzGbHwl6dGC26zK1nGiq9d/ZXhJinfAUlyRWZQlThf5J3X0pEW
 Ns8g==
X-Gm-Message-State: AOAM531iz/kvKVacwR1pcDwQDVSDmNS33Auu7oUT0MUqx4tWsNVjiQFe
 kHVFzAMw/SYderlYfejfUeTK9Y97AxfLloPawgVYGjPNrgeOKPIs9W5z0Ks1OtJg042q7Xg7Vyk
 9Lb2xUCIWYtUA/LQ/HzqX0t+zC4O9
X-Received: by 2002:a05:600c:308:: with SMTP id
 q8mr227585wmd.118.1644003098414; 
 Fri, 04 Feb 2022 11:31:38 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwnUrl7L5DUkWi88NA0XDtQhKrbGlFf75d9R565igNT1eWA/BV6uT/4ED51bA6rarcBe+VNVg==
X-Received: by 2002:a05:600c:308:: with SMTP id
 q8mr227567wmd.118.1644003098213; 
 Fri, 04 Feb 2022 11:31:38 -0800 (PST)
Received: from [192.168.1.102] ([92.176.231.205])
 by smtp.gmail.com with ESMTPSA id y14sm3081929wrd.91.2022.02.04.11.31.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 04 Feb 2022 11:31:37 -0800 (PST)
Message-ID: <b388f295-920a-b4fc-41ef-d090bdcd69e2@redhat.com>
Date: Fri, 4 Feb 2022 20:31:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v2 1/4] drm/format-helper: Add
 drm_fb_{xrgb8888,gray8}_to_mono_reversed()
To: Thomas Zimmermann <tzimmermann@suse.de>, linux-kernel@vger.kernel.org
References: <20220204134347.1187749-1-javierm@redhat.com>
 <20220204134347.1187749-2-javierm@redhat.com>
 <47100413-db63-1efa-45e9-028dfc430b7e@suse.de>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <47100413-db63-1efa-45e9-028dfc430b7e@suse.de>
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
Cc: linux-fbdev@vger.kernel.org, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, dri-devel@lists.freedesktop.org,
 =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>, Maxime Ripard <maxime@cerno.tech>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello Thomas,

Thanks a lot for your feedback.

On 2/4/22 16:52, Thomas Zimmermann wrote:

[snip]

>> +static void drm_fb_gray8_to_mono_reversed_line(u8 *dst, const u8 *src, size_t pixels)
>> +{
>> +	unsigned int xb, i;
>> +
>> +	for (xb = 0; xb < pixels / 8; xb++) {
> 
> In practice, all mode widths are multiples of 8 because VGA mandated it. 
> So it's ok-ish to assume this here. You should probably at least print a 
> warning somewhere if (pixels % 8 != 0)
>

Agreed.
 
[snip]

>> + * DRM doesn't have native monochrome or grayscale support.
>> + * Such drivers can announce the commonly supported XR24 format to userspace
>> + * and use drm_fb_xrgb8888_to_gray8() to convert to grayscale and then this
>> + * helper function to convert to the native format.
>> + */
>> +void drm_fb_gray8_to_mono_reversed(void *dst, unsigned int dst_pitch, const void *src,
>> +				   const struct drm_rect *clip)
> 
> There's a bug here. You want to pass in a drm_framebuffer as fourth 
> argument.
>
>> +{
>> +
>> +	size_t height = drm_rect_height(clip);
>> +	size_t width = drm_rect_width(clip);
>> +	unsigned int y;
>> +	const u8 *gray8 = src;
>> +	u8 *mono = dst;
>> +
>> +	if (!dst_pitch)
>> +		dst_pitch = width;
> 
> The dst_pitch is given in bytes. You have to device by 8. Here would be 
> a good place to warn if (width % 8 != 0).
>

Ok.
 
>> +
>> +	for (y = 0; y < height; y++) {
>> +		drm_fb_gray8_to_mono_reversed_line(mono, gray8, dst_pitch);
>> +		mono += (dst_pitch / 8);
> 
> The dst_pitch is already given in bytes.
>

Yes, I know but for reversed mono we want only 1/8 of the width since we
are converting from 8 bits per pixel greyscale to 1 bit per pixel mono.

Or am I misunderstanding what you meant ?

>> +		gray8 += dst_pitch;
> 
> 'gray8 += fb->pitches[0]' would be correct.
>

Ok.
 
[snip]

>> + */
>> +void drm_fb_xrgb8888_to_mono_reversed(void *dst, unsigned int dst_pitch, const void *src,
>> +				      const struct drm_framebuffer *fb,
>> +				      const struct drm_rect *clip)
>> +{
>> +	if (WARN_ON(fb->format->format != DRM_FORMAT_XRGB8888))
>> +		return;
>> +
>> +	if (!dst_pitch)
>> +		dst_pitch = drm_rect_width(clip);
>> +
>> +	drm_fb_xrgb8888_to_gray8(dst, dst_pitch, src, fb, clip);
>> +	drm_fb_gray8_to_mono_reversed(dst, dst_pitch, dst, fb, clip);
> 
> Converting from dst into dst can give incorrect results. At some point 
> we probably want to add restrict qualifiers to these pointers, to help 
> the compiler with optimizing.
> 
> A better approach here is to pull the per-line conversion from 
> drm_fb_xrgb8888_to_gray8() into a separate helper and implement a 
> line-by-line conversion here. something like this:
> 
>    drm_fb_xrgb8888_to_mono_reversed()
>    {
>      char *tmp = kmalloc(size of a single line of gray8)
> 
>      for (heigth) {
>         drm_fb_xrgb8888_to_gray8_line(tmp, ..., src, ...);
>         drm_fb_gray8_to_mono_reversed(dst, ..., tmp, ...);
> 
>         src += fb->pitches[0]
>         dst += dst_pitch;
>      }
> 
>      kfree(tmp);
>    }
>

I see. Yes, that sounds a much better approach. I'll change it in v3.
 
Best regards,
-- 
Javier Martinez Canillas
Linux Engineering
Red Hat

