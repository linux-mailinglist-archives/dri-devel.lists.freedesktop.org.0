Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 621CBA9F55C
	for <lists+dri-devel@lfdr.de>; Mon, 28 Apr 2025 18:15:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E4C510E214;
	Mon, 28 Apr 2025 16:15:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="if/7w/vw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C14310E5C5
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Apr 2025 16:15:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1745856904;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=mjJ99tBsBuWDC/A8a87VaJBRW/3oANaQLfcx6YawuMA=;
 b=if/7w/vwQmNUKtBkxqXDS9x2WjWuzZgYvu8cT1lcRSAtdZnl3IMLdp36WpSl4yKSQJjHkb
 XiPeXuufho7kRbxHTkqKuxqXcSziyFjZbFAMie+dfxwaA06j2PKGIW2P3vWkNBIAHhYEyv
 287jUEZk+jN3ngLKvK54OBsO5FV/kYA=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-458-T1Y5ACG5Pg2odhMSHHmFvQ-1; Mon, 28 Apr 2025 12:15:03 -0400
X-MC-Unique: T1Y5ACG5Pg2odhMSHHmFvQ-1
X-Mimecast-MFC-AGG-ID: T1Y5ACG5Pg2odhMSHHmFvQ_1745856902
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-43ceb011ea5so27939115e9.2
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Apr 2025 09:15:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745856902; x=1746461702;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:from:references:cc:to:subject:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=mjJ99tBsBuWDC/A8a87VaJBRW/3oANaQLfcx6YawuMA=;
 b=Jvkzh6CXfoF1nt7igLuB/t5fZI2exYpPsVCM+/07C+HBdW8TYJLPwmUu5EILH3fL9l
 tqHmlS6zjffYhptSx57MdwW5TcBgT6L5wgJ7tV6i08zsJleIGKLf0ua5fr+t/r2iUgQO
 fuKepdP9JMGfJ0rLFYKZX+WZt5jAY6Ew0vT3QmrotLOW05SygwBkM2s8M+1Iejjx57rK
 1c4kVgnN+wYq5s8gP7Gos2UlilEy5cKsS5pFs4hdMFgX+eCar+7jFNQWaKfdL3p+pwU7
 diDz7rxp9cXTUrMbTUVLjVayOyUFniKvQdB0ceM1S5iyWTBHD64weToRgGLX7tORGEfj
 fFhg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXaAKJSrpHqgREG0FbhqBniT65Olp7c5VJvDlXsyVnIvpih0Mk0LHE7emQvPiDJvTDAZTLVAsG3TZQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz3F72+Bn7yav2+1HSP9IrxTc3YqGVqJTniwjPQIGjo4USBNvWn
 J2I6EwbO8zRtp0bLeLrdjWC0b0/k/BBmLaueEluKP83F4/Uz0dV8uy8KUsqVNbhvEJALIlWVkIJ
 vTW8LY96V7mqsmF64pujxMO2mOWK3odFXxauCGE8He5CC33hpK2ytguuw714CBa2TrQ==
X-Gm-Gg: ASbGnct4iG6gmOnFutOfibQ3J1GzPYfy8/50s1DY/3lju2wRlwRnmCFOfT07tiCGW+T
 wTE7i7OxVEWxP0lCOyiSqvf1PIyRoyxP8yhubKkLH1/a0AUWkM/PtIeqI4b2ilmZeN9QGCdfbpl
 d6seZUrhPwKNF28DcCVDNIRpCzI10eJGnWTukhW+Un7hPL2IC9iyMi2dHyfAwDdTbPFoCrqTm34
 WwYuTabbpNHDB1PhU0EQXIDM0ND/hBU036dN5rdLWgA1IVbs9ij70Lb49TmXRdGiL/Hp784oIi6
 UO84m4WdyjbDXoQdHlGBREG/89v4fBZbh6L74eX3sQ1xD8B2kxBSljAxL2fbWnt3d+KGkUHRrql
 AdRY2N9mWFqhKNIPgmviO0ZpUs+8VI6f/9NNTig==
X-Received: by 2002:a05:600c:4f81:b0:43c:efed:732c with SMTP id
 5b1f17b1804b1-440ab8722e8mr62094835e9.28.1745856902033; 
 Mon, 28 Apr 2025 09:15:02 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHf7xoVWGe8POH6/bAu4Zm1T2P/Ns6FQlhV/6P/Tg1uN3kkn8wReO0mmLvPeggLU1mpCqiyHw==
X-Received: by 2002:a05:600c:4f81:b0:43c:efed:732c with SMTP id
 5b1f17b1804b1-440ab8722e8mr62094425e9.28.1745856901631; 
 Mon, 28 Apr 2025 09:15:01 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f32:c200:9add:4a7a:46aa:f740?
 (p200300d82f32c2009add4a7a46aaf740.dip0.t-ipconnect.de.
 [2003:d8:2f32:c200:9add:4a7a:46aa:f740])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4409d2e00d8sm159297655e9.35.2025.04.28.09.14.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Apr 2025 09:15:01 -0700 (PDT)
Message-ID: <d9b32bb8-fe69-48d2-9b9b-c1a4af231f93@redhat.com>
Date: Mon, 28 Apr 2025 18:14:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 11/11] mm/io-mapping: track_pfn() -> "pfnmap tracking"
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: linux-kernel@vger.kernel.org, linux-mm@kvack.org, x86@kernel.org,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-trace-kernel@vger.kernel.org, Dave Hansen
 <dave.hansen@linux.intel.com>, Andy Lutomirski <luto@kernel.org>,
 Peter Zijlstra <peterz@infradead.org>, Thomas Gleixner <tglx@linutronix.de>,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 "H. Peter Anvin" <hpa@zytor.com>, Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Tvrtko Ursulin
 <tursulin@ursulin.net>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Andrew Morton <akpm@linux-foundation.org>,
 Steven Rostedt <rostedt@goodmis.org>, Masami Hiramatsu
 <mhiramat@kernel.org>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>, Vlastimil Babka
 <vbabka@suse.cz>, Jann Horn <jannh@google.com>,
 Pedro Falcato <pfalcato@suse.de>, Peter Xu <peterx@redhat.com>
References: <20250425081715.1341199-1-david@redhat.com>
 <20250425081715.1341199-12-david@redhat.com>
 <07a780ee-b2fa-4eb3-a340-175d7c18a0fe@lucifer.local>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <07a780ee-b2fa-4eb3-a340-175d7c18a0fe@lucifer.local>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: b18wA7ySUt-hGfBh1-NPpSbHDi4OlBoxVFuK7N7NBJk_1745856902
X-Mimecast-Originator: redhat.com
Content-Language: en-US
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

On 28.04.25 18:06, Lorenzo Stoakes wrote:
> On Fri, Apr 25, 2025 at 10:17:15AM +0200, David Hildenbrand wrote:
>> track_pfn() does not exist, let's simply refer to it as "pfnmap
>> tracking".
>>
>> Signed-off-by: David Hildenbrand <david@redhat.com>
> 
> LGTM, so:
> 
> Reviewed-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
> 
>> ---
>>   mm/io-mapping.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/mm/io-mapping.c b/mm/io-mapping.c
>> index 01b3627999304..7266441ad0834 100644
>> --- a/mm/io-mapping.c
>> +++ b/mm/io-mapping.c
>> @@ -21,7 +21,7 @@ int io_mapping_map_user(struct io_mapping *iomap, struct vm_area_struct *vma,
>>   	if (WARN_ON_ONCE((vma->vm_flags & expected_flags) != expected_flags))
>>   		return -EINVAL;
>>
>> -	/* We rely on prevalidation of the io-mapping to skip track_pfn(). */
>> +	/* We rely on prevalidation of the io-mapping to skip pfnmap tracking. */
>>   	return remap_pfn_range_notrack(vma, addr, pfn, size,
>>   		__pgprot((pgprot_val(iomap->prot) & _PAGE_CACHE_MASK) |
>>   			 (pgprot_val(vma->vm_page_prot) & ~_PAGE_CACHE_MASK)));
>> --
>> 2.49.0
>>
> 
> However this doesn't apply after commit b8d8f1830bab ("mm/io-mapping:
> precompute remap protection flags for clarity"), so will need a rebase :)
> seems this was cleaned up to separate the __pgprot() bit from the
> remap_pfn_range_notrack().

Yeah, I reviewed that just today. Trivial conflict :)

Thanks!

-- 
Cheers,

David / dhildenb

