Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 749D5AEB6DC
	for <lists+dri-devel@lfdr.de>; Fri, 27 Jun 2025 13:51:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 62E7510E9FA;
	Fri, 27 Jun 2025 11:51:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="NQsQTmji";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E23A410E9FA
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Jun 2025 11:51:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1751025071;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XjX+hBaXMJwj3R/v9FBA0Weiar4fLlGU7PJj1VBqjqI=;
 b=NQsQTmjiP//Ro1bpHLAg44UeQ+hU4aAtFJQqf1BC+1lU2kjVdrIJlfmx5janzX/3bzrr7U
 gsJy4MLK6N1oYgthiSUMB6dYcMmAPzxF3QBpsWS+O3nkmQZ3p47evNsV6fgYqsiGlqwuC8
 r4uWxgnvLygnYPRfoGwDGUjCRNXIfo4=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-404-jGLJWz9rMfizXa6HY8s5nQ-1; Fri, 27 Jun 2025 07:47:12 -0400
X-MC-Unique: jGLJWz9rMfizXa6HY8s5nQ-1
X-Mimecast-MFC-AGG-ID: jGLJWz9rMfizXa6HY8s5nQ_1751024832
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-4535d300d2dso16544645e9.1
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Jun 2025 04:47:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751024831; x=1751629631;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=XjX+hBaXMJwj3R/v9FBA0Weiar4fLlGU7PJj1VBqjqI=;
 b=a+9Xsl/q2raViOG4biJLJowbwR3VuwhSur6QvaBXMNvMcSeAKLKg4pe1ZgI95lTr//
 Q80ahY0ZcfVIYlwvkt3WlujdjJ6xzwD7wcao/lIG7Lijzavdqi6IWVOGcOg2/xPtMvHZ
 v7UPbahsmpya+aceRiB2KnW6UvT0ypwWA0wnQymHGUZRAse70DF+yMfNOIaxTt9vwHlY
 3jQPqY4Vo960Fe2Iih9NbdpVWldcXcoGG1H0x6h/NoqKb5rTIS/6SLrEN6X0LpluAzQz
 z2LJkIf0TblsBV+fi//aMOoxBltwLZfr9QpanDWPIGZKz1mrNOL8yDbOr9S+yJl+54Aj
 lP9g==
X-Forwarded-Encrypted: i=1;
 AJvYcCWXO3I3TqVQt71N13v6E3cSD5Np0LMgTTrFeheAYrtGNl6c5Nz/SPLn5st0ei3hva9POeKwlsJavTQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyVjcfYJoDG5c2BqY8h+Ip6FXwlZjNRftEpKN8X1rLYLER5R1Co
 15M7QwWRzAnWNWc9u67Tg+jKvkk2H6w2J7ZISzo3IwobSB9YYeuStP5RHtjLDOMl1qNSeIPjAdS
 WJ+aHWyvLeitCc2EY5mSeDZUBKP9JI1pdHqb4HObPPLpC6RjsJiWWa1+d8sbV/ziu/NXwYg==
X-Gm-Gg: ASbGnctJtXV4ikpokNnloFZkXXNzWIXY/QxLSX21O76e+G1iqITSCjvZLqhQDBnYY7o
 iAKzk8UvUNlhO7Ql/X66B3FAU4/nJmuG9fkrzfwWNOSpfPIVGguEXmoOL2oPfEQ6LE4nVj/MoEh
 wQn+/99BlNCu0X0GczucO/AyE02C6DrMybN27zxzDVddWCrlFixllB9X/zKfp8f4zo4Jmh3Evu8
 +w6SkVPrCboIZhf+qLNGrU/D0zZWSUoIoWJ9MDajyLISbd/Jgol4II4TihyktaSAjPqLC+WWvN3
 ONFrNm9Wed3lcezASgsL7Fd2EVY9gB+1EnDiD1qLWPRj7SHE9tDoXDa85k7uUw==
X-Received: by 2002:a05:600c:1910:b0:43c:ec0a:ddfd with SMTP id
 5b1f17b1804b1-4538ee15b9cmr28114225e9.6.1751024831592; 
 Fri, 27 Jun 2025 04:47:11 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGL1rcgj8WhmZRm4aQKNgi4lgSW/cEGWUMdJSQbENUhm47d/UZivhsYn/wnlHMWu5iFMWgHIA==
X-Received: by 2002:a05:600c:1910:b0:43c:ec0a:ddfd with SMTP id
 5b1f17b1804b1-4538ee15b9cmr28113965e9.6.1751024831098; 
 Fri, 27 Jun 2025 04:47:11 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:c:37e0:8998:e0cf:68cc:1b62?
 ([2a01:e0a:c:37e0:8998:e0cf:68cc:1b62])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a892e59736sm2475960f8f.74.2025.06.27.04.47.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 27 Jun 2025 04:47:10 -0700 (PDT)
Message-ID: <bc7efb62-11ec-4fbb-a911-24cc943a9968@redhat.com>
Date: Fri, 27 Jun 2025 13:47:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/panic: Add a u64 divide by 10 for arm32
To: Alice Ryhl <aliceryhl@google.com>
Cc: Andrei Lalaev <andrey.lalaev@gmail.com>, Miguel Ojeda <ojeda@kernel.org>, 
 Christian Schrefl <chrisi.schrefl@gmail.com>, Arnd Bergmann <arnd@arndb.de>,
 Russell King <linux@armlinux.org.uk>, Paolo Bonzini <pbonzini@redhat.com>,
 rust-for-linux <rust-for-linux@vger.kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, dri-devel@lists.freedesktop.org
References: <20250627094102.770689-1-jfalempe@redhat.com>
 <CAH5fLgimktQmU6d24o3QVDBX90OD5E4wdnvLoNhk_gtpbUhXMA@mail.gmail.com>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <CAH5fLgimktQmU6d24o3QVDBX90OD5E4wdnvLoNhk_gtpbUhXMA@mail.gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: CfqD6df2ulQUJbYMfQbefwgUYZ6QK49Nb8QZlAQvmgk_1751024832
X-Mimecast-Originator: redhat.com
Content-Language: en-US, fr
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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

On 27/06/2025 13:36, Alice Ryhl wrote:
> On Fri, Jun 27, 2025 at 11:41 AM Jocelyn Falempe <jfalempe@redhat.com> wrote:
>>
>> On 32bits ARM, u64 divided by a constant is not optimized to a
>> multiply by inverse by the compiler [1].
>> So do the multiply by inverse explicitly for this architecture.
>>
>> Link: https://github.com/llvm/llvm-project/issues/37280 [1]
>> Reported-by: Andrei Lalaev <andrey.lalaev@gmail.com>
>> Closes: https://lore.kernel.org/dri-devel/c0a2771c-f3f5-4d4c-aa82-d673b3c5cb46@gmail.com/
>> Fixes: 675008f196ca ("drm/panic: Use a decimal fifo to avoid u64 by u64 divide")
>> Signed-off-by: Jocelyn Falempe <jfalempe@redhat.com>
> 
> Not to block this change, but I think this really ought to be fixed in
> the compiler. We should not have to do this kind of thing to divide by
> 10.

I agree, I didn't expect that would be a problem. But I'm not a compiler 
expert, and it will probably take time to update the compiler, so we 
have to do this at least temporary.
> 
>>   drivers/gpu/drm/drm_panic_qr.rs | 24 +++++++++++++++++++++++-
>>   1 file changed, 23 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/drm_panic_qr.rs b/drivers/gpu/drm/drm_panic_qr.rs
>> index dd55b1cb764d..82acecd505d3 100644
>> --- a/drivers/gpu/drm/drm_panic_qr.rs
>> +++ b/drivers/gpu/drm/drm_panic_qr.rs
>> @@ -381,6 +381,24 @@ struct DecFifo {
>>       len: usize,
>>   }
>>
>> +/// On arm32 architecture, dividing an u64 by a constant will generate a call
>> +/// to __aeabi_uldivmod which is not present in the kernel.
>> +/// So use the multiply by inverse method for this architecture.
>> +#[cfg(target_arch = "arm")]
>> +fn div10(val: u64) -> u64
>> +{
> 
> Please run rustfmt on your patch.

sorry, I will fix that.
> 
>> +    let val_h = val >> 32;
>> +    let val_l = val & 0xFFFFFFFF;
>> +    let b_h: u64 = 0x66666666;
>> +    let b_l: u64 = 0x66666667;
>> +
>> +    let tmp1 = val_h * b_l + ((val_l * b_l) >> 32);
>> +    let tmp2 = val_l * b_h + (tmp1 & 0xffffffff);
>> +    let tmp3 = val_h * b_h + (tmp1 >> 32) + (tmp2 >> 32);
>> +
>> +    tmp3 >> 2
>> +}
>> +
>>   impl DecFifo {
>>       fn push(&mut self, data: u64, len: usize) {
>>           let mut chunk = data;
>> @@ -389,7 +407,11 @@ fn push(&mut self, data: u64, len: usize) {
>>           }
>>           for i in 0..len {
>>               self.decimals[i] = (chunk % 10) as u8;
>> -            chunk /= 10;
>> +            if cfg!(target_arch = "arm") {
>> +                chunk = div10(chunk);
>> +            } else {
>> +                chunk /= 10;
>> +            }
> 
> I would get rid of this conditional and declare another div10 function
> that just does input/10 on other arches.

ok, I will send a v2 shortly with that changed.
> 
> Alice
> 

