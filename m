Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E3C9C4A5B8A
	for <lists+dri-devel@lfdr.de>; Tue,  1 Feb 2022 12:48:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 73D5510E873;
	Tue,  1 Feb 2022 11:48:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 49C1010E873
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Feb 2022 11:48:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643716127;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HAQrcI0deDlNA9eCisSMwUR/TZsbNGoMTXQyByv6Pq0=;
 b=VRBAKh1Ai5vH0ajraEih6JrMLbejf57xM3h9aW/lsbpM/JvRs73cXJTmQxVM0jlrWCF2rs
 4s1hCcfIbpQ05eSqZLQo0o4ThwCORgcI+iJTj9kMnbXTUGjHEWpVb8oU+T2VasOZvSAmQU
 B4JytFc3tvf3YgS8swy8aEd+AJNaizI=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-45-bl24pYHnMjKcwNSwnvHSfQ-1; Tue, 01 Feb 2022 06:48:46 -0500
X-MC-Unique: bl24pYHnMjKcwNSwnvHSfQ-1
Received: by mail-wr1-f70.google.com with SMTP id
 o26-20020adfa11a000000b001dd1d3a73c7so5893289wro.21
 for <dri-devel@lists.freedesktop.org>; Tue, 01 Feb 2022 03:48:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=HAQrcI0deDlNA9eCisSMwUR/TZsbNGoMTXQyByv6Pq0=;
 b=6kBVajuY6Q5h31QRXKepNGqWZ9XHHh176BeaAQOQ38x4XxueTI0OvlvLaE6nDGnMi1
 aB1VFAW8Y4tvEqbcdNMIBqdh83pSagDoLrjGWeD2EEINOgu9F5BbQnUE5eaSnkCBzg+I
 7Jl68RoIMSmHh5PIMGLdouldfvgr0flVs9S/Wdv9NjzO63X42k1LO61wYFAtHtXw3/Io
 e4PL0nGrcKm7HnNKFBEs0jswkrvmgcrRRqALBHiIuftQabtqnG0oTa5DB5qvy4XqvoVm
 ffQh/8SkAelo8/k4x4Yp5sZjXFcDnc82EeXW2IOcXeNIvTyO2jiF/ryUNqoIpcdZHxV+
 REzw==
X-Gm-Message-State: AOAM530agK3KZqx8BH5aFBNzDi81v1wsn0rtcgtUqwh0SqNplaStgXbB
 ZqovPCtmuKglFv8XlGO/3DA/OmUScx6fxoO+QHQQ1iqRPJZv4R/9TeMvtPc43GE1+i+SSwjOHZH
 kloE/lgnS2e5gPnfZWqoJxEQoe4G9
X-Received: by 2002:adf:f58f:: with SMTP id f15mr12076476wro.192.1643716124453; 
 Tue, 01 Feb 2022 03:48:44 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzd9BlV0HRMbyk/XwhfXyaNQQpXbeT1Gbtln4v7etwlKLUXdBdHLLvcKWVu2NnD4Vi+vIyooQ==
X-Received: by 2002:adf:f58f:: with SMTP id f15mr12076463wro.192.1643716124242; 
 Tue, 01 Feb 2022 03:48:44 -0800 (PST)
Received: from [192.168.1.102] ([92.176.231.205])
 by smtp.gmail.com with ESMTPSA id g6sm14023059wrq.97.2022.02.01.03.48.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 01 Feb 2022 03:48:43 -0800 (PST)
Message-ID: <c10f8a68-6c45-41ec-7061-ff69360f1fbb@redhat.com>
Date: Tue, 1 Feb 2022 12:48:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 2/4] drm/format-helper: Add drm_fb_gray8_to_mono_reversed()
To: Thomas Zimmermann <tzimmermann@suse.de>, linux-kernel@vger.kernel.org
References: <20220131201225.2324984-1-javierm@redhat.com>
 <20220131201225.2324984-3-javierm@redhat.com>
 <e52560f0-bd0c-b51b-af1b-bd4be2df8702@suse.de>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <e52560f0-bd0c-b51b-af1b-bd4be2df8702@suse.de>
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
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello Thomas,

Thanks a lot for your feedback.

On 2/1/22 10:59, Thomas Zimmermann wrote:
> Hi
> 
> Am 31.01.22 um 21:12 schrieb Javier Martinez Canillas:
>> Add support to convert 8-bit grayscale to reversed monochrome for drivers
>> that control monochromatic displays, that only have 1 bit per pixel depth.
>>
>> This helper function was based on repaper_gray8_to_mono_reversed() from
>> the drivers/gpu/drm/tiny/repaper.c driver.
> 
> You could convert repaper to the new helper.
>

Yes, I plan to do it but was out of scope for this patch series.

>>
>> Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
>> ---
>>
>>   drivers/gpu/drm/drm_format_helper.c | 35 +++++++++++++++++++++++++++++
>>   include/drm/drm_format_helper.h     |  2 ++
>>   2 files changed, 37 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/drm_format_helper.c b/drivers/gpu/drm/drm_format_helper.c
>> index 0f28dd2bdd72..bf477c136082 100644
>> --- a/drivers/gpu/drm/drm_format_helper.c
>> +++ b/drivers/gpu/drm/drm_format_helper.c
>> @@ -584,3 +584,38 @@ int drm_fb_blit_toio(void __iomem *dst, unsigned int dst_pitch, uint32_t dst_for
>>   	return -EINVAL;
>>   }
>>   EXPORT_SYMBOL(drm_fb_blit_toio);
>> +
>> +/**
>> + * drm_fb_gray8_to_mono_reversed - Convert grayscale to reversed monochrome
>> + * @dst: reversed monochrome destination buffer
>> + * @src: 8-bit grayscale source buffer
>> + * @clip: Clip rectangle area to copy
>> + *
>> + * DRM doesn't have native monochrome or grayscale support.
>> + * Such drivers can announce the commonly supported XR24 format to userspace
>> + * and use drm_fb_xrgb8888_to_gray8() to convert to grayscale and then this
>> + * helper function to convert to the native format.
>> + */
>> +void drm_fb_gray8_to_mono_reversed(void *dst, void *src, const struct drm_rect *clip)
> 
> IMHO it would be better to have a function that converts xrgb8888 to 
> mono and let it handle the intermediate step of gray8.
>

That's a good idea. I'll add that too.

>> +{
>> +	size_t width = drm_rect_width(clip);
>> +	size_t height = drm_rect_width(clip);
>> +
>> +	u8 *mono = dst, *gray8 = src;
>> +	unsigned int y, xb, i;
>> +
>> +	for (y = 0; y < height; y++)
>> +		for (xb = 0; xb < width / 8; xb++) {
> 
> The inner loop should probably go into a separate helper function. See 
> the drm_fb_*_line() helpers in this file
>
> At some point, we's want to have a single blit helper that takes source 
> and destination formats/buffers. It would then pick the correct per-line 
> helper for the conversion. So yeah, we'd want something composable.
>

Agreed. I'll split that into a separate helper function.

Best regards,
-- 
Javier Martinez Canillas
Linux Engineering
Red Hat

