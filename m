Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 267CF4B24BD
	for <lists+dri-devel@lfdr.de>; Fri, 11 Feb 2022 12:50:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C9DA310EA86;
	Fri, 11 Feb 2022 11:50:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8103C10EA86
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Feb 2022 11:50:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644580208;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OICV3mcUbBxV6suQ2V0x/IRiIlr0MLiQcnu4h3ef4B4=;
 b=cLtGToEM1gvFiuuCpFl7M/zGyP3bGDi9PLeeXyZj15DvPcyhmUl8vsF2xQHz21FTmhqJ1i
 vLKh1K6y899YB6Nkc+snbEaB9CgSC1N0nxNkq+7OO0kyZna6IVQgkcPj4OWsLoZUGgHsLL
 DVPW41KYxSxCjjPRHpoBWWwUjPgz3Zw=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-110-SYigSVf4Nkm-THsOAOjsMg-1; Fri, 11 Feb 2022 06:50:07 -0500
X-MC-Unique: SYigSVf4Nkm-THsOAOjsMg-1
Received: by mail-wr1-f72.google.com with SMTP id
 w26-20020adf8bda000000b001e33dbc525cso3744292wra.18
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Feb 2022 03:50:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=OICV3mcUbBxV6suQ2V0x/IRiIlr0MLiQcnu4h3ef4B4=;
 b=igMSUCUIaojgHW3rkuR/VO8hT3+SvRpyNOa+KVJRCxN43AZcF+t3FL8r2WKEAizrpg
 mlFCwmM6wp+TQ3Wx6iLIItOzD77raOJKtUq5Rrm5iiKoDsVrib2D7aieT5WZLPSWAMzf
 Byz11LDlUhYuwzDbaL9GqPDlggmTsh+MAdl+1nyek4FnOlcyEIJMdpcZ81WGKdqghtcE
 XeqVQTus/iftKiArAolnwc/k1ClETfDvjUONQ+AEbkvPLHVdAQ4S4i+LcMEHn4BUibAg
 NWXCkZYygNX61RqxWslrNSM9PxDQxE1vt4wmYJcNwW1xKokVvHvcm70TXxxBnUVJORl4
 G8Fw==
X-Gm-Message-State: AOAM533auUykBmcRBjBYA6kJHbG6fR4g8QSWemyJWwY8N7g84kbH9m7r
 jw8dMtR2t9nTPz1ZpOHHm2TvUsGm73bGlLn/tzAiQ89MTAt0Bs/MTO+d63ea8HgyYsx2M9gPULc
 6qGPvERF6Bq7HM+HPYLV2g98XOa+1
X-Received: by 2002:adf:e4ca:: with SMTP id v10mr1064544wrm.635.1644580206266; 
 Fri, 11 Feb 2022 03:50:06 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxxu19EHwNoykZrkYLd84XXhMKpSr092i38lxhqdJ6Cbdpiv/di8sAiWsz0wnYXMkIZVmABsA==
X-Received: by 2002:adf:e4ca:: with SMTP id v10mr1064526wrm.635.1644580205951; 
 Fri, 11 Feb 2022 03:50:05 -0800 (PST)
Received: from [192.168.1.102] ([92.176.231.205])
 by smtp.gmail.com with ESMTPSA id ay12sm2689074wrb.73.2022.02.11.03.50.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 11 Feb 2022 03:50:05 -0800 (PST)
Message-ID: <00616642-1c95-9258-ab6e-b08116b36d21@redhat.com>
Date: Fri, 11 Feb 2022 12:50:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v4 2/6] drm/format-helper: Add
 drm_fb_xrgb8888_to_mono_reversed()
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
References: <20220211091927.2988283-1-javierm@redhat.com>
 <20220211091927.2988283-3-javierm@redhat.com>
 <YgZEPo0ERFRloDyA@smile.fi.intel.com>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <YgZEPo0ERFRloDyA@smile.fi.intel.com>
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
 Daniel Vetter <daniel.vetter@ffwll.ch>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>, Maxime Ripard <maxime@cerno.tech>,
 Thomas Zimmermann <tzimmermann@suse.de>, Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello Andy,

Thanks for your feedback.

On 2/11/22 12:10, Andy Shevchenko wrote:

[snip]

>> +static void drm_fb_gray8_to_mono_reversed_line(u8 *dst, const u8 *src, unsigned int pixels,
>> +					       unsigned int start_offset, unsigned int end_len)
>> +{
>> +	unsigned int xb, i;
>> +
>> +	for (xb = 0; xb < pixels; xb++) {
>> +		unsigned int start = 0, end = 8;
>> +		u8 byte = 0x00;
> 
>> +		if (xb == 0 && start_offset)
>> +			start = start_offset;
> 
> This is invariant to the loop, can be moved out.
> 
>> +		if (xb == pixels - 1 && end_len)
>> +			end = end_len;
> 
> Ditto. However it may require to factor out the following loop to a helper.
>

Not sure I'm following, it's not invariant since it depends on the
loop iterator value. It only applies to the first and last pixels.
 
[snip]

>> +	/*
>> +	 * The reversed mono destination buffer contains 1 bit per pixel
>> +	 * and destination scanlines have to be in multiple of 8 pixels.
>> +	 */
>> +	if (!dst_pitch)
>> +		dst_pitch = DIV_ROUND_UP(linepixels, 8);
> 
> round_up() ?
> 

But it's not a round up operation but a div and round up.

>> +	WARN_ONCE(dst_pitch % 8 != 0, "dst_pitch is not a multiple of 8\n");
> 
> 
> I would move this to the if conditional, i.e.
> 
> 	if (dst_pitch)
> 		WARN_ONCE(dst_pitch % 8 != 0, "dst_pitch is not a multiple of 8\n");
> 	else
> 		dst_pitch = round_up(linepixels, 8);
>

No, because we always need to div and round up. The warning is just printed to
let know that the dst pitch is not a multiple of 8 as it should be. So callers
could be fixed.

>> +	/*
>> +	 * The cma memory is write-combined so reads are uncached.
> 
> CMA
>

Yes, this bug me too. But other format helpers (e.g: drm_fb_xrgb8888_to_rgb565
and drm_fb_xrgb8888_to_gray8) had this comment with CMA in lower case. So did
the same for consistency.

>> +	 * Speed up by fetching one line at a time.
>> +	 *
>> +	 * Also, format conversion from XR24 to reversed monochrome
>> +	 * are done line-by-line but are converted to 8-bit grayscale
>> +	 * as an intermediate step.
>> +	 *
>> +	 * Allocate a buffer to be used for both copying from the cma
>> +	 * memory and to store the intermediate grayscale line pixels.
>> +	 */
>> +	src32 = kmalloc(len_src32 + linepixels, GFP_KERNEL);
> 
> size_add() ?
>

I wasn't familiar with this macro and git grep returned nothing. Then I noticed
that it is fairly new, introduced in commit a66866cff71c ("overflow: Implement
size_t saturating arithmetic helpers").

git tag --contains a66866cff71c | head -1
next-20220207

So I can't really use it since isn't yet in the latest drm-misc-next base tag :)

>> +	if (!src32)
>> +		return;
> 
> ...
> 
>> +	/*
>> +	 * For damage handling, it is possible that only parts of the source
>> +	 * buffer is copied and this could lead to start and end pixels that
>> +	 * are not aligned to multiple of 8.
>> +	 *
>> +	 * Calculate if the start and end pixels are not aligned and set the
>> +	 * offsets for the reversed mono line conversion function to adjust.
>> +	 */
>> +	start_offset = clip->x1 % 8;
>> +	end_len = clip->x2 % 8;
> 
> ALIGN() ?
> 

But we don't want to align here but to know what's the start and end if is
not aligned since that would mean converting to mono in the middle of a byte.

Best regards,
-- 
Javier Martinez Canillas
Linux Engineering
Red Hat

