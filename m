Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E81A24AF29D
	for <lists+dri-devel@lfdr.de>; Wed,  9 Feb 2022 14:26:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1882410E349;
	Wed,  9 Feb 2022 13:26:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 781C610E349
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Feb 2022 13:26:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644413189;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gj7EYe83fjjc2pVbDvN8nW0XXrWOw/vijRlZTRlTyb4=;
 b=PayhbvnC9hTUeZMBzdWIX8adBgVxTdeXMvFAEKy6WSlQWmHTXf9VonwpebHi4zYHEZ46AQ
 EUGBYFCia9h2C6YS7hhX+z9s3M25EtSdqyNpA4GdAT+kxDaps9w7tEqU1phfWvy0JhSo9u
 zRC4fPaH/rrxSPZLBgypWB8xhTRLz8A=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-135-rDfBGVCkPVSbkpTVPHY_NA-1; Wed, 09 Feb 2022 08:26:23 -0500
X-MC-Unique: rDfBGVCkPVSbkpTVPHY_NA-1
Received: by mail-wr1-f69.google.com with SMTP id
 v9-20020adfa1c9000000b001e33e5dbd5fso1099262wrv.17
 for <dri-devel@lists.freedesktop.org>; Wed, 09 Feb 2022 05:26:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=gj7EYe83fjjc2pVbDvN8nW0XXrWOw/vijRlZTRlTyb4=;
 b=TjJJjcCv7xjbAXrcL3aw5rfgdRmySDcT+IVDMmpHcn+c8yxGN1nCkIpuDl9SyQ5yXW
 BB8rMnOlPmf7WUaBM/PW6de0rXEJ/AtKIUiMqSQ37vR71rvnzP/BEZObd0Sr026ELz0N
 t1dIov8bX6iCXLjodeY9G5Zs/DpAiDQ6c7o7bmoDjYBNPzr64Nini4lvasYWo57R0yES
 ijRb3gjla9bshrQd8HG9Y6mP7DOsZDegaoKDxH8XgiK7tSV0EKOkuQjWvkPLkLNlezOC
 lHMI9aruDA5ixVfkeoeDdgR8fE4PtrnM9jZF4RNG3+GD+WKg9QzPtLbSZO4gpr+B0sSG
 V4bw==
X-Gm-Message-State: AOAM530oDLYgWCU6QDD9X4h00gtrV5Ap8rE9yqOjjV8gylV9yuksMKgk
 UXpXVjp8ElhApaEtfyWFzUNNI9WK3atV4UjX99UbcUzT4kbNr8l6CpHpQBOb+82Y4M5Kvs02EZM
 wBzWoahjr33faGJFV5wZ0OteyL9O8
X-Received: by 2002:a05:600c:22d3:: with SMTP id
 19mr2067401wmg.178.1644413182026; 
 Wed, 09 Feb 2022 05:26:22 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyFKrknf35Xf2LefmXXuc7aRIfezVH3jBJsgn4R4Bvho+wSQI39jFu6aG9bFdzQzoX5XOf93w==
X-Received: by 2002:a05:600c:22d3:: with SMTP id
 19mr2067383wmg.178.1644413181828; 
 Wed, 09 Feb 2022 05:26:21 -0800 (PST)
Received: from [192.168.1.102] ([92.176.231.205])
 by smtp.gmail.com with ESMTPSA id m6sm5678550wmq.6.2022.02.09.05.26.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 09 Feb 2022 05:26:21 -0800 (PST)
Message-ID: <f75a1544-5a3e-e49f-7eab-5dd5c72584b9@redhat.com>
Date: Wed, 9 Feb 2022 14:26:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v3 2/7] drm/format-helper: Add drm_fb_{xrgb8888,
 gray8}_to_mono_reversed()
To: Thomas Zimmermann <tzimmermann@suse.de>, linux-kernel@vger.kernel.org
References: <20220209090314.2511959-1-javierm@redhat.com>
 <20220209090314.2511959-3-javierm@redhat.com>
 <6df9c28d-968d-ff16-988e-8e88e4734e49@suse.de>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <6df9c28d-968d-ff16-988e-8e88e4734e49@suse.de>
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

On 2/9/22 13:51, Thomas Zimmermann wrote:
> Hi
> 

[snip]

>> +
>> +		if (xb == pixels - 1 && end_offset)
>> +			end = end_offset;
> 
> end_offset should be called end_len, because it is the number of bits in
> the final byte; but not the offset of the final bit.
>

Indeed.

[snip]

>> +void drm_fb_gray8_to_mono_reversed(void *dst, unsigned int dst_pitch, const void *vaddr,
>> +				   const struct drm_framebuffer *fb,
>> +				   const struct drm_rect *clip)

[snip]

> 
> Do you really need that function. It's not exported and if it's not 
> otherwise used, I'd just remove it.  We don't keep unused interfaces around.
>

At the end after your suggestion of doing line-per-line conversions it is not
needed, but since I already typed it and we were talking about adding other
formats besides the fake XRGB8888 as an optimization (R8 for grayscale and
Dx or something like that for reversed mono), I thought that would be useful
to have it as a helper.

Also other drivers that want to advertise a R8 format could just use it and
not having to add their own helper. But I'm happy to drop it in v4 if you
think that's better to not have unused helpers. 

It could be taken from this patch-set anyways if someone wants to wire the
needed support for R8.

[snip]

>> +
>> +	/*
>> +	 * The reversed mono destination buffer contains 1 bit per pixel
>> +	 * and destination scanlines have to be in multiple of 8 pixels.
>> +	 */
>> +	if (!dst_pitch)
>> +		dst_pitch = DIV_ROUND_UP(linepixels, 8);
> 
> I'd do a warn_once if (dst_pitch % 8 != 0).
>

Agreed. I'll add a warning an mention that will be rounded up.

> 
>> +
>> +	/*
>> +	 * The cma memory is write-combined so reads are uncached.
>> +	 * Speed up by fetching one line at a time.
> 
> I once had a patchset that adds caching information to struct 
> dma_buf_map (soon to be named struct iosys_map).  Blitting helpers would 
> be able to enable/disable this optimization as needed.
> 
> However, your driver doesn't use CMA. It's backed by SHMEM. Do you 
> really want to keep that code in?
>

It doesn't but the repaper does. And since the plan was to make that driver
to use the helper instead of having their own, I wanted to also make sure
that would work well with CMA.

> 
>> +	 */
>> +	src32 = kmalloc(len_src32, GFP_KERNEL);
>> +	if (!src32)
>> +		return;
>> +
>> +	/*
>> +	 * Copies are done line-by-line, allocate an intermediate
>> +	 * buffer to copy the gray8 lines and then convert to mono.
>> +	 */
>> +	gray8 = kmalloc(linepixels, GFP_KERNEL);
>> +	if (!gray8)
>> +		goto free_src32;
> 
> If might be faster to allocate both buffers in one step and set the 
> pointers into the allocated buffer.
>

Not sure I got this. Do you mean to have a single buffer with length
linepixels + len_src32 and point src32 and gray8 to the same buffer ?

>> +
>> +	/*
>> +	 * For damage handling, it is possible that only parts of the source
>> +	 * buffer is copied and this could lead to start and end pixels that
>> +	 * are not aligned to multiple of 8.
>> +	 *
>> +	 * Calculate if the start and end pixels are not aligned and set the
>> +	 * offsets for the reversed mono line conversion function to adjust.
>> +	 */
>> +	start_offset = clip->x1 % 8;
>> +	end_offset = clip->x2 % 8;
> 
> end_len, again. If you have 1 single bit set in the final byte, the
> offset is 0, but the length is 1.
>

Agreed, will change it too.

Best regards,
-- 
Javier Martinez Canillas
Linux Engineering
Red Hat

