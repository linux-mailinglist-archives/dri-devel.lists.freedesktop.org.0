Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 196074AF540
	for <lists+dri-devel@lfdr.de>; Wed,  9 Feb 2022 16:31:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F264D10E272;
	Wed,  9 Feb 2022 15:31:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2AD9F10E210
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Feb 2022 15:31:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644420663;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WPpvyB7McdG+sCGO6qQRcD8vYFMWX9f+Cg4663yTg2s=;
 b=hxLMXAmaQ9We6Xp/1UoFFC4iVjBkLbELmMR17EPWWprOAmDpGR8ks9R6IolrymBqpHdrf6
 njUNAWsxg0ALYnW7skem5l6wsFasQN+dy5okPVVGtibqPlj7YWQxwUTcIPSjbOkpWWhBy7
 y6ZIL8Ev5STtvt7ROWUxYzb7ptsPKh0=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-372-d6pzxae3OE-ngXR3MPiPvQ-1; Wed, 09 Feb 2022 10:31:02 -0500
X-MC-Unique: d6pzxae3OE-ngXR3MPiPvQ-1
Received: by mail-wm1-f71.google.com with SMTP id
 h82-20020a1c2155000000b003552c13626cso2828506wmh.3
 for <dri-devel@lists.freedesktop.org>; Wed, 09 Feb 2022 07:31:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=WPpvyB7McdG+sCGO6qQRcD8vYFMWX9f+Cg4663yTg2s=;
 b=vrMtb2MXFtsnn1gBIiy2hZ1EdYOWz8chiNEKl0Ao7K7G0Iy4Suuwes4l3cjn6dX6se
 Do8oe9lcSm6XxPDCImloEEnLYAQ40011+LNQKKOaKXBH0lM89FbuupiPzjgLW+QKsTKm
 i1VW/YgLMKp/JyOL6lNhGzbasBK/y10Lpa5h3qkfwg5OvZSq3Xz7Dt76QGfvGGP+0L1h
 4kLF4jv4ttiHAuLDcDH13QfotJUW0OQvXOZsUTGLa0X9zMKFL8NnBkJZZl5OaKwbdJS+
 0wEnLstgDyjuj5AKUHFd4ADEJ8543IzBjdw+7I+sM0LAv5QK8cotRYNb2SP9+Fa2/SW9
 FGoQ==
X-Gm-Message-State: AOAM532gBwSeDRXJNiIXK9Ixy81r0YqWG8+0oXHPXSHqWcxY+cqBNcza
 uAGz9w5Dej4taNVKQSMqiAPMNH6Zt2eiOVeet5CGWQ03D4FjjB1hhnTMOjVHstKbgLpXl/3grAe
 P1TXxWRArbukqzl4YceVtkm7fwEiV
X-Received: by 2002:a5d:40ca:: with SMTP id b10mr2557995wrq.6.1644420659909;
 Wed, 09 Feb 2022 07:30:59 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyUJ460salQYs6rWREOZPwbsIL73KBkIAP9a0luO40gtQzhT1NgjwQDGKwNSlhfORRzFqslOg==
X-Received: by 2002:a5d:40ca:: with SMTP id b10mr2557983wrq.6.1644420659724;
 Wed, 09 Feb 2022 07:30:59 -0800 (PST)
Received: from [192.168.1.102] ([92.176.231.205])
 by smtp.gmail.com with ESMTPSA id c8sm6408714wmq.39.2022.02.09.07.30.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 09 Feb 2022 07:30:59 -0800 (PST)
Message-ID: <3b6fe640-47e5-8765-3a09-8f9f2f0a6329@redhat.com>
Date: Wed, 9 Feb 2022 16:30:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v3 2/7] drm/format-helper: Add drm_fb_{xrgb8888,
 gray8}_to_mono_reversed()
To: Thomas Zimmermann <tzimmermann@suse.de>, linux-kernel@vger.kernel.org
References: <20220209090314.2511959-1-javierm@redhat.com>
 <20220209090314.2511959-3-javierm@redhat.com>
 <6df9c28d-968d-ff16-988e-8e88e4734e49@suse.de>
 <f75a1544-5a3e-e49f-7eab-5dd5c72584b9@redhat.com>
 <d5fc654c-643a-7b20-85f1-54169a3aa889@suse.de>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <d5fc654c-643a-7b20-85f1-54169a3aa889@suse.de>
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

On 2/9/22 16:21, Thomas Zimmermann wrote:

[snip]

>>
>> It could be taken from this patch-set anyways if someone wants to wire the
>> needed support for R8.
> 
> I think, policy is to not keep unused code around.
>

Ok, I'll drop it then. We can include it again when adding R8 formats.
 
[snip]

>>> If might be faster to allocate both buffers in one step and set the
>>> pointers into the allocated buffer.
>>>
>>
>> Not sure I got this. Do you mean to have a single buffer with length
>> linepixels + len_src32 and point src32 and gray8 to the same buffer ?
> 
> That's the idea. I don't know the exact overhead for kalloc(), but at 
> least the in userspace, malloc() in hot code paths is not a good idea. 
> There's usually some searching for free space involved.
>

Sure, let's do it in one allocation then and I'll add some comments to
make easier for people to follow the code.
 
> In the long term, we could add a field in struct drm_framebuffer to keep 
> such buffers around for reuse.
> 
>>
>>>> +
>>>> +	/*
>>>> +	 * For damage handling, it is possible that only parts of the source
>>>> +	 * buffer is copied and this could lead to start and end pixels that
>>>> +	 * are not aligned to multiple of 8.
>>>> +	 *
>>>> +	 * Calculate if the start and end pixels are not aligned and set the
>>>> +	 * offsets for the reversed mono line conversion function to adjust.
>>>> +	 */
>>>> +	start_offset = clip->x1 % 8;
>>>> +	end_offset = clip->x2 % 8;
>>>
>>> end_len, again. If you have 1 single bit set in the final byte, the
>>> offset is 0, but the length is 1.
>>>
>>
>> Agreed, will change it too.
> 
> Feel free to add my
> 
> Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
>

Thanks!

Best regards, -- 
Javier Martinez Canillas
Linux Engineering
Red Hat

