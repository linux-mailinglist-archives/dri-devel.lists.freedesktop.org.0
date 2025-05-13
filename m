Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 54DABAB4ED2
	for <lists+dri-devel@lfdr.de>; Tue, 13 May 2025 11:06:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E404610E1EB;
	Tue, 13 May 2025 09:06:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="Y3l19tV/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E00510E4E9
 for <dri-devel@lists.freedesktop.org>; Tue, 13 May 2025 09:06:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1747127177;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=q9jxOCEACQ9TguSqvzkS3Gt7WQBGW3OxfkGW2LURiUg=;
 b=Y3l19tV/MVPtvuejp43Dwhg+pUR96xHbR9HNKxVB+G0nEDhU+uiiCcP/R6y0p56jpJ4j7p
 oUgKaWKCcwKxQYHmUlQYwfsr3dbGZwX8yiBladNhGv4q2HchDpEoZkbFmIWBqpFtr7/xa4
 xlslHCtoWto7TQPzWqWfKn6nAFZvc/g=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-14-b8PuDEUcOQmZe6qoU1yW8A-1; Tue, 13 May 2025 05:06:16 -0400
X-MC-Unique: b8PuDEUcOQmZe6qoU1yW8A-1
X-Mimecast-MFC-AGG-ID: b8PuDEUcOQmZe6qoU1yW8A_1747127175
Received: by mail-wr1-f72.google.com with SMTP id
 ffacd0b85a97d-3a0b9bbfb0fso2946195f8f.1
 for <dri-devel@lists.freedesktop.org>; Tue, 13 May 2025 02:06:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747127175; x=1747731975;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:from:references:cc:to:subject:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=q9jxOCEACQ9TguSqvzkS3Gt7WQBGW3OxfkGW2LURiUg=;
 b=Ij21JKCPNwLMRAaPuzeAHmFewr2z/XoUlHnjdPArvRRCJVxtUt2vikCxjRO3vMnOyi
 8YQjdghFp9wxQ3oiKp+9YEoEn9Jgd1rX9k7hbn+8BaQDunOLeO0M3m+U+u07pFqT/LP6
 8dyTif2YtEPMZe82OmLXekOqRDp8MD6xBUcZ7k0Zm0aryPBTPgM03Ho+rmoB6kjbE0C8
 eOeaCWcAiyamddmVe7TVYG6zHRLr3/PnTWjAjoDes88hxP1kwiBacZBTAV0FQDCFSxdn
 t0SWmq75lE/F2g0BEHUqsjFTPjIN2LUTMAGqWiXcwWUeNvsg3vlCjn/ChBwr2GcN0D7d
 XlaQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXfEROMSdgWa1M5dxZ8XKHLcGd73dAQaFuPaHivFZq3+/BRqddjLRL/wv4gfXQF9ivmaAHkzpKvZQ8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxQUyJoUtu9Ac80NQpVfTTHJAqjKdlCZbpWrJpzqjNbaEMZzQiH
 aFzrxJZw6pvcaBDYHTjpZAWGFjl1K/6wMSG5K70fS26bNQX1p2SsyU73Ca2of9eNmvBgnYDFub4
 AkTKzmfQNJ5B1PPgl81gOkE/W4eaeMg3Tz1mRTo3xUOibpfc/Gul3wmdxFU6RBF9Yvw==
X-Gm-Gg: ASbGncti1De2WF9tWHIsSB5og20rW66pvCqJ5kIh2f8DMts8GGNcrGdd3OipFTXkYdQ
 bKmsmf6cKHhXWVtjCjOUOtdyFlssqMC01KfVSIXUY6xZWsN9r3JvuRZHR1tjcDGM+FJvSlxWNaS
 nJS2xQCeb8d+/birkiCb0u8tUm2WwLXPOnD7sAy5yPmrnx7HsYXsMdWAAuWXuWho7ZbHqf3CE8R
 71EqFcguJANm0KmITtOCK9yjkyFy0unybzzdCKBqWsbyDkRN4lM1gWKWf/fSiciMO3nwJaz+ABi
 6Skn1Z+eyO+XNi6/D04tvkCjAfbbgxYRESZqKgbz1rQUB/vTYW86uNCWYhQLdz7dO4hoQWdrgED
 S3hhShwyrfwUz6r3n809hjUsgEByj10K95UCw03Y=
X-Received: by 2002:a05:6000:184b:b0:3a0:90c6:46df with SMTP id
 ffacd0b85a97d-3a1f64ae085mr11924383f8f.48.1747127174838; 
 Tue, 13 May 2025 02:06:14 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFczOcMfR6BGu8q55UlQ2KyVNNVnSREngFyFtwsspWxPS6JUuFMiq9K5/NPrcvYrdGyfp5UgA==
X-Received: by 2002:a05:6000:184b:b0:3a0:90c6:46df with SMTP id
 ffacd0b85a97d-3a1f64ae085mr11924338f8f.48.1747127174488; 
 Tue, 13 May 2025 02:06:14 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f4d:1a00:4fdf:53e2:1a36:ba34?
 (p200300d82f4d1a004fdf53e21a36ba34.dip0.t-ipconnect.de.
 [2003:d8:2f4d:1a00:4fdf:53e2:1a36:ba34])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a1f58f2f58sm15131406f8f.49.2025.05.13.02.06.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 13 May 2025 02:06:14 -0700 (PDT)
Message-ID: <219ad4d8-c191-4c1a-a835-e798ab58374f@redhat.com>
Date: Tue, 13 May 2025 11:06:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 02/11] mm: convert track_pfn_insert() to
 pfnmap_setup_cachemode*()
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
 Pedro Falcato <pfalcato@suse.de>, Peter Xu <peterx@redhat.com>,
 Ingo Molnar <mingo@kernel.org>
References: <20250512123424.637989-1-david@redhat.com>
 <20250512123424.637989-3-david@redhat.com>
 <b8b9c0ec-3654-4231-aad9-fec702bcebda@lucifer.local>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <b8b9c0ec-3654-4231-aad9-fec702bcebda@lucifer.local>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: xbXwGL1rcRViU21K4nEiZ2wm8073GCLruMaWPwj4lVQ_1747127175
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

On 12.05.25 17:43, Lorenzo Stoakes wrote:
> On Mon, May 12, 2025 at 02:34:15PM +0200, David Hildenbrand wrote:
>> ... by factoring it out from track_pfn_remap() into
>> pfnmap_setup_cachemode() and provide pfnmap_setup_cachemode_pfn() as
>> a replacement for track_pfn_insert().
>>
>> For PMDs/PUDs, we keep checking a single pfn only. Add some documentation,
>> and also document why it is valid to not check the whole pfn range.
>>
>> We'll reuse pfnmap_setup_cachemode() from core MM next.
>>
>> Acked-by: Ingo Molnar <mingo@kernel.org> # x86 bits
>> Signed-off-by: David Hildenbrand <david@redhat.com>
> 
> I've gone through carefully and checked and this looks good to me :)

Thanks a bunch!

-- 
Cheers,

David / dhildenb

