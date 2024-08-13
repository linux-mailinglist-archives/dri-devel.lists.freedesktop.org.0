Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D2BB09507C6
	for <lists+dri-devel@lfdr.de>; Tue, 13 Aug 2024 16:34:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A3F810E371;
	Tue, 13 Aug 2024 14:34:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="cNpbyv8T";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D2F0410E371
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Aug 2024 14:34:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1723559671;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=78IsUJKw9IqeoT5lC9OSKM4PAO7hFbDugoVudFsVevs=;
 b=cNpbyv8THQzuqaawjFJXG8OgRHlLz9Ce0ODWxwKWP1mWMF573Dh8d75BdcXyJuMidSu4fO
 vHd9rEKjS5jtnAGFFksCU70iBJyptFMNrJRjnc2MjiYl/VgQHF5R/BSv7k2o7eF6OEBh6I
 TKczKV/Z7yFaQAtisueK9Aic+UcEReE=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-187-f4sQg2w7Oi-4ku9y9mIcBQ-1; Tue, 13 Aug 2024 10:34:29 -0400
X-MC-Unique: f4sQg2w7Oi-4ku9y9mIcBQ-1
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-4282164fcbcso42968505e9.2
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Aug 2024 07:34:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1723559668; x=1724164468;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=78IsUJKw9IqeoT5lC9OSKM4PAO7hFbDugoVudFsVevs=;
 b=o5GhYubGEfDn07Ootd6td8QPt8BK/PLbmN8q3tP1GqGN1l3Ax5ItGMCiwFWgP5IId9
 Yl73lQ30GA5gE1rLEaLdqIC+dMHO40PkSoxbwVk5zG/YgqJAyF0100mfZ1EmhIOVpaRG
 Li7kxaknEO3wBHSQ1xxkKur+QQM24GW/yGDh0Y8fPZwmWGfwXHAEaoYQUD7ZliGEQR27
 zQKHbTTkFFRcEUo2CY8CCjdAuQFcUB6vET7KuXDEYfmnc8X3wAERXY6LkAM9sQQacz1O
 tJNtLnfKqIQdNJd6vVPoqDLpbEgtaAyF85cE5gTAMTIDlWHyhViXaaIRQdy+UWcSu4W/
 j9kw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWknONFtueZ1yxY+q7bLNwE691RVZ5VLutYj5tPMTzMjZcachKC/4pK7lXdztkFv5HAW6vmehq/NT9c9LEtD04lJK4PETZ+yIhBsV7hSmfs
X-Gm-Message-State: AOJu0YwwXBlePcQdV2Y+ag8+NvXcQ1jRL1m8F2M/f3Svz7HQnPuqTfl5
 kg+ohpBZYVTyS6BooOPfArcMYE/U+Z/3AzjHRRr0tTt+Evj2K41W4pNX3Y4ETW8xyasyeW2D0mi
 iJy83xT4REws2Rdg+iI8iqByhiOIwzxs4gTAZUpN6pclUX6WRLDGWXDTnxw0B1yTkOQ==
X-Received: by 2002:a05:600c:548b:b0:427:fa39:b0db with SMTP id
 5b1f17b1804b1-429d487347dmr30344075e9.27.1723559668289; 
 Tue, 13 Aug 2024 07:34:28 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG9S1VIbZLOEd8TYuQEWYafYxx7AV0xbNqaDFtZ2nyxoqmDI3atbQHIXjCKmWBf0/FxeiUD2w==
X-Received: by 2002:a05:600c:548b:b0:427:fa39:b0db with SMTP id
 5b1f17b1804b1-429d487347dmr30343785e9.27.1723559667737; 
 Tue, 13 Aug 2024 07:34:27 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:c:37e0:ced3:55bd:f454:e722?
 ([2a01:e0a:c:37e0:ced3:55bd:f454:e722])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-36e4c938045sm10585470f8f.43.2024.08.13.07.34.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 13 Aug 2024 07:34:27 -0700 (PDT)
Message-ID: <bbbd7a97-6d40-4fd8-b70d-17e02481ba3c@redhat.com>
Date: Tue, 13 Aug 2024 16:34:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 2/4] drm/rect: Add drm_rect_overlap()
To: Jani Nikula <jani.nikula@linux.intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Wedson Almeida Filho <wedsonaf@gmail.com>, Boqun Feng
 <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 Bjorn Roy Baron <bjorn3_gh@protonmail.com>,
 Benno Lossin <benno.lossin@proton.me>,
 Andreas Hindborg <a.hindborg@samsung.com>, Alice Ryhl
 <aliceryhl@google.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org,
 Danilo Krummrich <dakr@redhat.com>
References: <20240812123147.81356-1-jfalempe@redhat.com>
 <20240812123147.81356-3-jfalempe@redhat.com> <87sev926na.fsf@intel.com>
 <60e55a9d-70bb-45d1-ac97-e4f6f6ffa9a9@redhat.com> <87frr924nj.fsf@intel.com>
 <87mslgzf52.fsf@intel.com>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <87mslgzf52.fsf@intel.com>
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

On 13/08/2024 16:11, Jani Nikula wrote:
> On Mon, 12 Aug 2024, Jani Nikula <jani.nikula@linux.intel.com> wrote:
>> On Mon, 12 Aug 2024, Jocelyn Falempe <jfalempe@redhat.com> wrote:
>>> On 12/08/2024 15:49, Jani Nikula wrote:
>>>> On Mon, 12 Aug 2024, Jocelyn Falempe <jfalempe@redhat.com> wrote:
>>>>> Check if two rectangles overlap.
>>>>> It's a bit similar to drm_rect_intersect() but this won't modify
>>>>> the rectangle.
>>>>> Simplifies a bit drm_panic.
>>>>
>>>> Based on the name, I'd expect drm_rect_overlap() to return true for
>>>> *any* overlap, while this one seems to mean if one rectangle is
>>>> completely within another, with no adjacent borders.
>>>
>>> It's what I intended, but I may have messed up the formula.
>>
>> Hmm, then I may have messed up the review. :)
> 
> Yeah, my bad, sorry for the noise.
> 
> I think I was thrown off by the comparisons mixing r1 and r2 as the
> first operand. Something like this might have been easier for *me* to
> parse, but not sure if it's worth changing anything:
> 
> return (a->x1 < b->x2 && a->x2 > b->x1 &&
>          a->y1 < b->y2 && a->y2 > b->y1);

You're right, I've used r1 and r2 for consistency with other functions, 
but for this case it's confusing, I prefer the a/b.

If I send a v7 I will do this change.

I can also rename when pushing, but I was already bitten by doing this.

Best regards,

-- 

Jocelyn

> 
> 
> BR,
> Jani.
> 
> 
>>
>> Gotta run now, but I'll get back.
>>
>> BR,
>> Jani.
>>
>>
>>
>>>>
>>>> I'd expect a drm_rect_overlap() to return true for this:
>>>>
>>>>    +-------+
>>>>    |   +---+---+
>>>>    |   |       |
>>>>    +---+       |
>>>>        |       |
>>>>        +-------+
>>>
>>> if r1 is the top left rectangle, you've got:
>>>
>>> r1->x2 > r2->x1   => true
>>> r2->x2 > r1->x1   => true
>>> r1->y2 > r2->y1   => true
>>> r2->y2 > r1->y1   => true
>>>
>>> So they count as overlap.
>>>
>>> Checking in stackoverflow, they use the same formula:
>>> https://stackoverflow.com/questions/306316/determine-if-two-rectangles-overlap-each-other
>>>
>>>>
>>>> While this seems to be required instead:
>>>>
>>>>    +-------+
>>>>    | +---+ |
>>>>    | |   | |
>>>>    | +---+ |
>>>>    +-------+
>>>>
>>>>
>>>> IOW, I find the name misleading.
>>>>
>>>> BR,
>>>> Jani.
>>>>
>>>>
>>>>>
>>>>> Signed-off-by: Jocelyn Falempe <jfalempe@redhat.com>
>>>>> ---
>>>>>    drivers/gpu/drm/drm_panic.c |  3 +--
>>>>>    include/drm/drm_rect.h      | 15 +++++++++++++++
>>>>>    2 files changed, 16 insertions(+), 2 deletions(-)
>>>>>
>>>>> diff --git a/drivers/gpu/drm/drm_panic.c b/drivers/gpu/drm/drm_panic.c
>>>>> index 0a047152f88b8..59fba23e5fd7a 100644
>>>>> --- a/drivers/gpu/drm/drm_panic.c
>>>>> +++ b/drivers/gpu/drm/drm_panic.c
>>>>> @@ -529,8 +529,7 @@ static void draw_panic_static_user(struct drm_scanout_buffer *sb)
>>>>>    	/* Fill with the background color, and draw text on top */
>>>>>    	drm_panic_fill(sb, &r_screen, bg_color);
>>>>>    
>>>>> -	if ((r_msg.x1 >= logo_width || r_msg.y1 >= logo_height) &&
>>>>> -	    logo_width <= sb->width && logo_height <= sb->height) {
>>>>> +	if (!drm_rect_overlap(&r_logo, &r_msg)) {
>>>>>    		if (logo_mono)
>>>>>    			drm_panic_blit(sb, &r_logo, logo_mono->data, DIV_ROUND_UP(logo_width, 8),
>>>>>    				       fg_color);
>>>>> diff --git a/include/drm/drm_rect.h b/include/drm/drm_rect.h
>>>>> index 73fcb899a01da..7bafde747d560 100644
>>>>> --- a/include/drm/drm_rect.h
>>>>> +++ b/include/drm/drm_rect.h
>>>>> @@ -238,6 +238,21 @@ static inline void drm_rect_fp_to_int(struct drm_rect *dst,
>>>>>    		      drm_rect_height(src) >> 16);
>>>>>    }
>>>>>    
>>>>> +/**
>>>>> + * drm_rect_overlap - Check if two rectangles overlap
>>>>> + * @r1: first rectangle
>>>>> + * @r2: second rectangle
>>>>> + *
>>>>> + * RETURNS:
>>>>> + * %true if the rectangles overlap, %false otherwise.
>>>>> + */
>>>>> +static inline bool drm_rect_overlap(const struct drm_rect *r1,
>>>>> +				    const struct drm_rect *r2)
>>>>> +{
>>>>> +	return (r1->x2 > r2->x1 && r2->x2 > r1->x1 &&
>>>>> +		r1->y2 > r2->y1 && r2->y2 > r1->y1);
>>>>> +}
>>>>> +
>>>>>    bool drm_rect_intersect(struct drm_rect *r, const struct drm_rect *clip);
>>>>>    bool drm_rect_clip_scaled(struct drm_rect *src, struct drm_rect *dst,
>>>>>    			  const struct drm_rect *clip);
>>>>
>>>
> 

