Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F000A56212
	for <lists+dri-devel@lfdr.de>; Fri,  7 Mar 2025 08:55:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 83E5110E02D;
	Fri,  7 Mar 2025 07:55:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="Un6Ekr9B";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 07E4D10E02D
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Mar 2025 07:54:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1741334098;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/XjSBrzgKarSUxwTUTP4kt/kMcpFKwcJA5tHsYp7Puk=;
 b=Un6Ekr9BMGXPANM9zsNlS21elU8I4KwIjhmn287AgCiJoR7XJdOozPfSGQl4et6AYXFrV+
 5f59LZx85qoDdeQOUwy8Wo8hCZCdB3YXqqHb47DMQGNjyAW71VeFS2THl+7IvoVSPekdw1
 0Vvc18kYzFXdvKOeL7WuBGKgBRUD57I=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-444-5KoFzlnAO0Gs8yHGwgwkZg-1; Fri, 07 Mar 2025 02:54:56 -0500
X-MC-Unique: 5KoFzlnAO0Gs8yHGwgwkZg-1
X-Mimecast-MFC-AGG-ID: 5KoFzlnAO0Gs8yHGwgwkZg_1741334095
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-43bd0586b86so10786385e9.3
 for <dri-devel@lists.freedesktop.org>; Thu, 06 Mar 2025 23:54:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741334095; x=1741938895;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=/XjSBrzgKarSUxwTUTP4kt/kMcpFKwcJA5tHsYp7Puk=;
 b=wVLRHmPTr3h8Cp1E6Vo/4Kv4OItMRQqyPDzryO7UY10L6yYWNI/qBxC/mEaAg+AFNz
 iNJh85avLd64n46ckRbph9FzE5VF9etKYz7DOiFqBi9sOR5gaLcFvCL961aX9LAvEWQe
 44sGJapmsZ9aDh3JxjQZ+Cv+t1PBA0ps/WQPXlJgrPI6Te5y3J1Y3rERSpcVZ/qwv2jL
 0Q7/AEACVcEZhdD3obiIcwvJm3VxPRSOBUwfbS26n/8Nf6RkvAqehxFrUM9FlFcNIZo6
 wHSiEQqS55vJ+/FFO1CPRuLFhgwkjTlZGm2WKpjP/puBpdBZTVaUBvZoMKyRkYlV/LLH
 4QzA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUKHWqwOCiMsCW2WQfSYadk8tK52EmiMgohA7uzhVNzaqbNIETJzZ6h70QSgKiIED7M6Ot/8BSGLeI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyXfA8mHHcXe9tCKQ2T0A05Hio6ZaFZueegDqzhiBnjYsO2soyk
 G1AKhog6qd24cc6kys+cGBd1vk5qBTePG1A0hh3mUiyVT+7tn0WofFyXevt6XNe+ZvUQYmLwuTi
 8YpHY7OXohEl2kTry6O3/9enSJwRwDi8V7vIgCnGV+C9c03F2C6nIsJarVVtGOxOKnA==
X-Gm-Gg: ASbGncv6YAtX2+jvUcLyo1oJoufWVndneRhjlPOJMgMIVEOPnnTOiURsVLrLumFiTrJ
 EWiWD2zJrK6uq/9gUJl10X3DvqN+MLie1+VQv3JBn0EtVKM6K5AAMzrV87FWYHyKf/e2fLoNfZr
 2Z1DntAw793YV4CWX0o1JLlWqD5IlJL+YK0BTu5xRmlFrQbQu29fTcjOhS+3Yj3nGrOVwBOg7EA
 kK583auY574DO2rhzPGc7bv5OMFC9cWeg2lv5eyThOCg5TDwHe89X2M9rVLj+g+wJd1RfFt9d54
 JLhMxnrK1F10XGP6Ute1Xrk27lzHKLRKImgpEWlh/cyy+oBkC3jKJeQ=
X-Received: by 2002:a05:600c:3553:b0:439:8bc3:a698 with SMTP id
 5b1f17b1804b1-43c601cdc45mr16230475e9.6.1741334094997; 
 Thu, 06 Mar 2025 23:54:54 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG5GpnS4MDn/K1MDh6DvplMjCwTGNqRWUJiQpcKLuEIKeIoa5hrBZx50YeG7edtD/K149h+Ww==
X-Received: by 2002:a05:600c:3553:b0:439:8bc3:a698 with SMTP id
 5b1f17b1804b1-43c601cdc45mr16230285e9.6.1741334094550; 
 Thu, 06 Mar 2025 23:54:54 -0800 (PST)
Received: from ?IPV6:2a01:e0a:c:37e0:ced3:55bd:f454:e722?
 ([2a01:e0a:c:37e0:ced3:55bd:f454:e722])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43bd4352fa3sm72985885e9.30.2025.03.06.23.54.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 06 Mar 2025 23:54:54 -0800 (PST)
Message-ID: <51c11147-4927-4ebc-9737-fd1eebe4e0bd@redhat.com>
Date: Fri, 7 Mar 2025 08:54:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH drm-next 1/2] vmalloc: Add atomic_vmap
To: Matthew Wilcox <willy@infradead.org>,
 Ryosuke Yasuoka <ryasuoka@redhat.com>, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch,
 kraxel@redhat.com, gurchetansingh@chromium.org, olvaffe@gmail.com,
 akpm@linux-foundation.org, urezki@gmail.com, hch@infradead.org,
 dmitry.osipenko@collabora.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, virtualization@lists.linux.dev,
 linux-mm@kvack.org
References: <20250305152555.318159-1-ryasuoka@redhat.com>
 <20250305152555.318159-2-ryasuoka@redhat.com>
 <Z8kp9Z9VgTpQmV9d@casper.infradead.org>
 <3bfd4238-6954-41a3-a5a3-8515a3ac9dce@redhat.com>
 <Z8nEqDQhjU-Ly8Js@phenom.ffwll.local>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <Z8nEqDQhjU-Ly8Js@phenom.ffwll.local>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: _5iwVm7stdtBYGpQNzli-k5GRo7QeIdeVvPoV1-cO58_1741334095
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

On 06/03/2025 16:52, Simona Vetter wrote:
> On Thu, Mar 06, 2025 at 02:24:51PM +0100, Jocelyn Falempe wrote:
>> On 06/03/2025 05:52, Matthew Wilcox wrote:
>>> On Thu, Mar 06, 2025 at 12:25:53AM +0900, Ryosuke Yasuoka wrote:
>>>> Some drivers can use vmap in drm_panic, however, vmap is sleepable and
>>>> takes locks. Since drm_panic will vmap in panic handler, atomic_vmap
>>>> requests pages with GFP_ATOMIC and maps KVA without locks and sleep.
>>>
>>> In addition to the implicit GFP_KERNEL allocations Vlad mentioned, how
>>> is this supposed to work?
>>>
>>>> +	vn = addr_to_node(va->va_start);
>>>> +
>>>> +	insert_vmap_area(va, &vn->busy.root, &vn->busy.head);
>>>
>>> If someone else is holding the vn->busy.lock because they're modifying the
>>> busy tree, you'll corrupt the tree.  You can't just say "I can't take a
>>> lock here, so I won't bother".  You need to figure out how to do something
>>> safe without taking the lock.  For example, you could preallocate the
>>> page tables and reserve a vmap area when the driver loads that would
>>> then be usable for the panic situation.  I don't know that we have APIs
>>> to let you do that today, but it's something that could be added.
>>>
>> Regarding the lock, it should be possible to use the trylock() variant, and
>> fail if the lock is already taken. (In the panic handler, only 1 CPU remain
>> active, so it's unlikely the lock would be released anyway).
>>
>> If we need to pre-allocate the page table and reserve the vmap area, maybe
>> it would be easier to just always vmap() the primary framebuffer, so it can
>> be used in the panic handler?
> 
> Yeah I really don't like the idea of creating some really brittle one-off
> core mm code just so we don't have to vmap a buffer unconditionally. I
> think even better would be if drm_panic can cope with non-linear buffers,
> it's entirely fine if the drawing function absolutely crawls and sets each
> individual byte ...

It already supports some non-linear buffer, like Nvidia block-linear:
https://elixir.bootlin.com/linux/v6.13.5/source/drivers/gpu/drm/nouveau/dispnv50/wndw.c#L606

And I've also sent some patches to support Intel's 4-tile and Y-tile format:
https://patchwork.freedesktop.org/patch/637200/?series=141936&rev=5
https://patchwork.freedesktop.org/patch/637202/?series=141936&rev=5

Hopefully Color Compression can be disabled on intel's GPU, otherwise 
that would be a bit harder to implement than tiling.

> 
> The only thing you're allowed to do in panic is try_lock on a raw spinlock
> (plus some really scare lockless tricks), imposing that on core mm sounds
> like a non-starter to me.
> 
> Cheers, Sima

