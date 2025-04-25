Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 26BAEA9C361
	for <lists+dri-devel@lfdr.de>; Fri, 25 Apr 2025 11:27:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 09F7F10E8DE;
	Fri, 25 Apr 2025 09:27:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="O2tgU9sJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B5DD110E2FA
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Apr 2025 09:27:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1745573225;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=8eqLytJIQY/pnCK/wv0GRjy/uV2gVRfHwFR8LZ6llRk=;
 b=O2tgU9sJJMmRZ/OVQu/dRQCeNcEfyxXcTn4cnIj/D5GymwUM23O6OXINdXljLNMdzsIONW
 2QVCiOFT/cqOhAt/tIeLP871+YTwrtuqlWvlCax/zc2E7frOAmVan1tD8wceJVP67VdoFq
 NYCADOFDViFCAMmnsAvsv4CZksGh1NM=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-455-w3hVqeuwOn2wfp0UPS9SOw-1; Fri, 25 Apr 2025 05:27:04 -0400
X-MC-Unique: w3hVqeuwOn2wfp0UPS9SOw-1
X-Mimecast-MFC-AGG-ID: w3hVqeuwOn2wfp0UPS9SOw_1745573223
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-43947a0919aso14480265e9.0
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Apr 2025 02:27:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745573223; x=1746178023;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:from:references:cc:to:subject:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=8eqLytJIQY/pnCK/wv0GRjy/uV2gVRfHwFR8LZ6llRk=;
 b=s/SUvg7s54zqa8fyneeVjiXsJwkKW1w/EuIXwgrpL7ZeVKSOUJU+bG5Y4cp808F1y2
 uuQ5upipNuuUnOxeL2DNUzWMneQUBE+tTFUb7RhQiY+I7LpstPP9lGLzuf/yx5TFNidP
 zbACN2JtwZ6wGMCDVgL+NXBo60UbQR37Odh7TDRdYmIRvBlSgpwJcmBNGkbMF1enP4BJ
 OtaLA7tBbh/JPYxu7Falw9DlN5iEVdv9rQR+FAcmGtbSMyOTUwCPxeOv89syoy6JNFQN
 gQR9vYfCtBw35nZP2NdeTKfs3PgKHnW7odXL8fcImrbKjyucb/cvU5E6sXf9U5YvSE+j
 om7A==
X-Forwarded-Encrypted: i=1;
 AJvYcCVG1eXEdd6P0yl5WLjFAZgz+hV8087EEXBRCilhpTV+Nc7ZJCM55FuTvkmx1wZKz1RmkfAidmnRqO8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxv2qh4pkzqfSH/PooDd/PmNxNJxQQ7ln/yejng3jFWRaSAm9YA
 FUcvG9TuafJ/USqtguVe6l3TMH5m8A71qVgDtWZey1MdDLqzxzFyBvkp2yRuUhMp7XVOlw0o/rP
 ZjQ5t56BGg68Ow9OXJNJ6tajrxWZUh7cOdEVbiRCtIKdeQ1L/udlEQZKu1wZlKWDSyw==
X-Gm-Gg: ASbGncs5Z5cx/VkvDuSs7uSQCwg9LebzsvSrR8GIwe2B3KR42POge6HN2kYMby5gAxm
 GPWJGKVTT5JUWrKm9rv9VCLskO1QS0/ahGiZglBO7Fs9j71bbAocUPhX+imlC63PCWi4ROrkJyI
 CVTKlDkwLkGtZaJznz2y9LPx8+fD0si5G7z6H89AEMytuCQG1S5fIbE+MWYScSaedl/1XbrKAvq
 k899m74nXl51XRGmxe0sumuVa8DBeZ07YccS/QdYo6ItUsOkr6pGNZwnPF5d4dXoKVuuJksooRl
 lTT/MwXUJwlnx4xlSngnEVGA94ZrGhMLnK/0Mj/row==
X-Received: by 2002:a05:600c:1f82:b0:43d:b85:1831 with SMTP id
 5b1f17b1804b1-440a6347ff9mr13026635e9.0.1745573222963; 
 Fri, 25 Apr 2025 02:27:02 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFY7LbS9YRQ5wCXB84Jy7eT6u2rOjZc7kKIwIhV5LjW+hBQBfoI1k6U1ecprzUpbxRl2y0xrg==
X-Received: by 2002:a05:600c:1f82:b0:43d:b85:1831 with SMTP id
 5b1f17b1804b1-440a6347ff9mr13026355e9.0.1745573222548; 
 Fri, 25 Apr 2025 02:27:02 -0700 (PDT)
Received: from [192.168.3.141] (p4ff23df8.dip0.t-ipconnect.de. [79.242.61.248])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-440a52f8915sm18804175e9.7.2025.04.25.02.27.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 25 Apr 2025 02:27:02 -0700 (PDT)
Message-ID: <c69f782b-798d-459d-b7fb-c2d7c7e30372@redhat.com>
Date: Fri, 25 Apr 2025 11:27:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 00/11] mm: rewrite pfnmap tracking and remove VM_PAT
To: Ingo Molnar <mingo@kernel.org>
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
 "Liam R. Howlett" <Liam.Howlett@oracle.com>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Vlastimil Babka <vbabka@suse.cz>, Jann Horn <jannh@google.com>,
 Pedro Falcato <pfalcato@suse.de>, Peter Xu <peterx@redhat.com>
References: <20250425081715.1341199-1-david@redhat.com>
 <aAtNy6VjUvOrOC7r@gmail.com>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <aAtNy6VjUvOrOC7r@gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: Elz5vHV0rJaWaeu2iC-EoT_BPR4aopR4cZgPJ4_dypk_1745573223
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

>> There will be some clash with [1], but nothing that cannot be sorted out
>> easily by moving the functions added to kernel/fork.c to wherever the vma
>> bits will live.
>>
>> Briefly tested with some basic /dev/mem test I crafted. I want to convert
>> them to selftests, but that might or might not require a bit of
>> more work (e.g., /dev/mem accessibility).
> 
> So for the x86 bits, once it passes review by the fine MM folks:
> 
>    Acked-by: Ingo Molnar <mingo@kernel.org>
> 

Thanks!

> And I suppose this rewrite will be carried in -mm?

Yes, will make conflicts with Lorenzo's work easier to resolve (in 
whatever order this ends up going in). I suspect there are not many PAT 
related things on the horizon.

-- 
Cheers,

David / dhildenb

