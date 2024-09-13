Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EA3BF977AC9
	for <lists+dri-devel@lfdr.de>; Fri, 13 Sep 2024 10:14:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 87DE210ECB6;
	Fri, 13 Sep 2024 08:14:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="Z6i9oJuS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 749CD10ECB8
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Sep 2024 08:14:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1726215295;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Pfcxu+UmXmfDI/rTDdM4uILVL0wQha2acqL1NiwE3nw=;
 b=Z6i9oJuSA1zNTFdgAGuklOFQJKsAJQGm59tTx9zMw5HNvt7YEvpU2UvNsEI5CYTlR7dzgV
 HSkHwnzHayI16VWhRcCiH7plP5yeIHS7ekWvuq32tepVy3o4G3OGUvaseKsUcivufDdLKb
 HTrBej48f5uVgxwV233JHR78GihmwZg=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-433--ZGfnU-DO3GsFaDtFhEOEA-1; Fri, 13 Sep 2024 04:14:52 -0400
X-MC-Unique: -ZGfnU-DO3GsFaDtFhEOEA-1
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-42cb940cd67so6234435e9.0
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Sep 2024 01:14:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726215291; x=1726820091;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Pfcxu+UmXmfDI/rTDdM4uILVL0wQha2acqL1NiwE3nw=;
 b=w8zfk7mgDBC26O2W/GoTR4rhTgMoVISpWoi0JT3Z25nGj8A2c7pTFISa3vRlDD3FCa
 PMq1IKOoXGlinGLzWt2ZPxhmOHY6Fd1RfGhU04ljPvzBxNJ+ZPfZ9s7wcLTckHFhR1nE
 OP4tVswqlk5dYli18SxJ4a4KXt0QDgiOfVYpQFUBv9I+C0Uqg5EL2zMkZqwanVtKMivT
 gZ9gY2Q1Jzve6j4PlN/OMZZFmxiAZRYMphC/GIYLT5+HUuX+fXzbpT3XHAWicYSL/835
 Lrc1zsgJXbw4sOkNlk3egoNfij6kK35AfsSnI3QIXxERuhXcHHQ2hk3vUt5z5kawWRqF
 871A==
X-Forwarded-Encrypted: i=1;
 AJvYcCXKDv7n8TZ39ExzHVPO8FhzY5XBxE6z2xITeWFIi6HSXqUNQeRaTGtg4k7cYyRyhKoCU1hM5vM1BXA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx8gfamKwTRL/T9xQpjPdRSsQXGxYAHLuXhqExS70y9UV/Hy0rN
 oe4AXP4hN9KP+/q1FZYJu/qIFLAJ5rXLn5CZmZoEH9mWSVckrcPyZjeGUgcT87Uf2J2HYsqxC4l
 RDqFVWrdNISpV7ECNNtUrXWv7/z+BhgUT/xWGbCGitkghMhY+0Zq2ODxXEcUS9hiW2g==
X-Received: by 2002:a05:600c:1d1b:b0:42c:b555:43dd with SMTP id
 5b1f17b1804b1-42d9070a3f2mr19812545e9.3.1726215290943; 
 Fri, 13 Sep 2024 01:14:50 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFQkYNqZa5jF6ReF1NSD90GNAfAwze/3O4yqzySA4Awnui5bCo04WKFNl0IwH6e2Z5WUB/2NA==
X-Received: by 2002:a05:600c:1d1b:b0:42c:b555:43dd with SMTP id
 5b1f17b1804b1-42d9070a3f2mr19812175e9.3.1726215290403; 
 Fri, 13 Sep 2024 01:14:50 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:c:37e0:ced3:55bd:f454:e722?
 ([2a01:e0a:c:37e0:ced3:55bd:f454:e722])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-378956653b0sm16298795f8f.44.2024.09.13.01.14.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 13 Sep 2024 01:14:49 -0700 (PDT)
Message-ID: <a58be9b0-d766-401f-8666-8e693b1b38da@redhat.com>
Date: Fri, 13 Sep 2024 10:14:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] drm/panic: Add ABGR2101010 support
To: Javier Martinez Canillas <javierm@redhat.com>,
 Ilia Mirkin <imirkin@alum.mit.edu>, James Jones <jajones@nvidia.com>,
 Karol Herbst <kherbst@redhat.com>, Lyude Paul <lyude@redhat.com>,
 Danilo Krummrich <dakr@redhat.com>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org
References: <20240913071036.574782-1-jfalempe@redhat.com>
 <20240913071036.574782-2-jfalempe@redhat.com>
 <87h6akyq49.fsf@minerva.mail-host-address-is-not-set>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <87h6akyq49.fsf@minerva.mail-host-address-is-not-set>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US, fr
Content-Type: text/plain; charset=UTF-8; format=flowed
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

On 13/09/2024 09:22, Javier Martinez Canillas wrote:
> Jocelyn Falempe <jfalempe@redhat.com> writes:
> 
> Hello Jocelyn,
> 
>> Add support for ABGR2101010, used by the nouveau driver.
>>
>> Signed-off-by: Jocelyn Falempe <jfalempe@redhat.com>
>> ---
>>   drivers/gpu/drm/drm_panic.c | 10 ++++++++++
>>   1 file changed, 10 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/drm_panic.c b/drivers/gpu/drm/drm_panic.c
>> index 74412b7bf936..0a9ecc1380d2 100644
>> --- a/drivers/gpu/drm/drm_panic.c
>> +++ b/drivers/gpu/drm/drm_panic.c
>> @@ -209,6 +209,14 @@ static u32 convert_xrgb8888_to_argb2101010(u32 pix)
>>   	return GENMASK(31, 30) /* set alpha bits */ | pix | ((pix >> 8) & 0x00300C03);
>>   }
>>   
>> +static u32 convert_xrgb8888_to_abgr2101010(u32 pix)
>> +{
>> +	pix = ((pix & 0x00FF0000) >> 14) |
>> +	      ((pix & 0x0000FF00) << 4) |
>> +	      ((pix & 0x000000FF) << 22);
>> +	return GENMASK(31, 30) /* set alpha bits */ | pix | ((pix >> 8) & 0x00300C03);
>> +}
> 
> Maybe we can move this format conversion helper and the others in the
> driver to drivers/gpu/drm/drm_format_helper.c ?

I think there are still a few issues with that. First is that 
drm_format_helper.c is in a separate module, so you can't call its 
functions from the main drm module, where drm_panic is.

In my drm_log series, https://patchwork.freedesktop.org/series/136789/ I 
moved this to drm_draw.c, and maybe drm_format_helper could re-use that ?

> 
>> +
>>   /*
>>    * convert_from_xrgb8888 - convert one pixel from xrgb8888 to the desired format
>>    * @color: input color, in xrgb8888 format
>> @@ -242,6 +250,8 @@ static u32 convert_from_xrgb8888(u32 color, u32 format)
>>   		return convert_xrgb8888_to_xrgb2101010(color);
>>   	case DRM_FORMAT_ARGB2101010:
>>   		return convert_xrgb8888_to_argb2101010(color);
>> +	case DRM_FORMAT_ABGR2101010:
>> +		return convert_xrgb8888_to_abgr2101010(color);
>>   	default:
>>   		WARN_ONCE(1, "Can't convert to %p4cc\n", &format);
>>   		return 0;
>> -- 
>> 2.46.0
>>
> 
> 
> The patch looks good to me.
> 
> Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
> 

