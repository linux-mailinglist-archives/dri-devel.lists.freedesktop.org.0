Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DEBA9B41DB1
	for <lists+dri-devel@lfdr.de>; Wed,  3 Sep 2025 13:54:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 111DB10E084;
	Wed,  3 Sep 2025 11:54:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="dDRZrJiv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B0A410E084
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Sep 2025 11:54:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1756900494;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=Vy+lxzXfL0kgtP99rbzpLuAz47IO4D0JFyDaKKvEah0=;
 b=dDRZrJivtvIXxAnkZlWy3Ku1u91kpQ9r7ZOtO4MW9APA2iGkP5vOAc0Zibs9ah5YSg9Qd4
 YL1le+SSSiqnmpdQoptf/1RIzejR0o91VVmuZUT7lxerAC4ayxpJ97HlyPHikKfJFUn4pO
 SLqqiYzgCG97ecTNtGpoCnNK638YlGA=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-574-ZK2SIop4MQWH6ygO0U-Q8A-1; Wed, 03 Sep 2025 07:54:53 -0400
X-MC-Unique: ZK2SIop4MQWH6ygO0U-Q8A-1
X-Mimecast-MFC-AGG-ID: ZK2SIop4MQWH6ygO0U-Q8A_1756900492
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-45b87609663so22058765e9.3
 for <dri-devel@lists.freedesktop.org>; Wed, 03 Sep 2025 04:54:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756900492; x=1757505292;
 h=content-transfer-encoding:in-reply-to:autocrypt:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Vy+lxzXfL0kgtP99rbzpLuAz47IO4D0JFyDaKKvEah0=;
 b=uS7GCCG8VxxJAlJfPUkGSu7nrkj3J45cKtQYZjoyLQS7+c57aVfakSbeUqPF2e+hhS
 11APTWkcPc+XZubIDYLLQXcTxpsQ3iBLNT9Zc5prrfhVT8P0dbjnwzsYwYe1NW5iLkho
 zfwMpQ7y2qEJGLMPAQAK04GXw8M82VBQy2V1hk+nz5yDkij6CejUU8L13UfKdyZKtWly
 np5hAY7Z90ya32oNH/rPWMaffXlw7z2Y2HNsy4yRPo+7sS7q4klZp72DLpbh8IJgEd+5
 uNE+wecwSgE2vIAnPYCNY1XB7iSGF6e5GtieWPKVAQDgCP+hvoxuzLYwvm5WZhqrs9+p
 HCDA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWpz6gzCgmGgV1m7/FSX2j4w/4KvPArBFAPfqs4YQa6FNj9Hw7W2slUUiHgPMtb7ziFG1nFIazK2wo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzfiwDZ0CbI/1LBh3vR1IRP+x+J+DwrHG3hMj2T2KAMfcmVMk2T
 MJ4EnEyh6CLt9hK9F9UJSE445+H+KT6qsCwHL2Hz5bjc4lHM1JY5STit/5LSsoBYrFOeEHXQTaW
 giud9RvYUxISSRByPBoBPphVZtOuEwrDGIGxNkilAWi5985lLrjHVTzXBVfVq3rAsXS+cyA==
X-Gm-Gg: ASbGncvPk1tY2ZD3zyFAjb50UvjXMzOg/1ZsGyZyjVPDrk/7nLwVt6WqJxetERcghtS
 IHXzDdDLnv1tOyTgo426jbOi+W3BaX0RVaJdVUYvOwyba0XTO67I/gXPq4qzD6AVbbkhDZpFFu3
 dostuCtTWZGArn+f8+2Ofhqk7LGDV2C9jk1/BB2SsviienbmutrXx/1CZaOzh+/nOIV9cxoJHFj
 lzEwB9zdEmbYg8apw1LSHTgJS8mJIxXJKC9pE4E5RLo4Uq4REUEWp9ffmyCWEZ36h8/oW9ALArK
 qXQEVqPBrGE9YAxpVkEwVQMkG2lhyaZpNnsiYZRF5wHeoeszjhCDuOUWqrDn1lvaNXjwIMgajUD
 FVaawnphDUSE/nYdglKxFnPZ/WqOmBcY3maofVOnaUEuO0meGeEja55A5zYdBmwtI5S8=
X-Received: by 2002:a05:600c:3b07:b0:45b:b05a:af04 with SMTP id
 5b1f17b1804b1-45bbd1e7bdemr33528665e9.14.1756900491952; 
 Wed, 03 Sep 2025 04:54:51 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH4cpqBq++Zrb9IT80A4uabVZk9ElZFleozbFNUtapOQ1NF258s1FbhAQ7gOCAX/tb7ptHTCQ==
X-Received: by 2002:a05:600c:3b07:b0:45b:b05a:af04 with SMTP id
 5b1f17b1804b1-45bbd1e7bdemr33528325e9.14.1756900491452; 
 Wed, 03 Sep 2025 04:54:51 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f09:9c00:8173:2a94:640d:dd31?
 (p200300d82f099c0081732a94640ddd31.dip0.t-ipconnect.de.
 [2003:d8:2f09:9c00:8173:2a94:640d:dd31])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-45b6f0d32a2sm347689785e9.9.2025.09.03.04.54.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 03 Sep 2025 04:54:51 -0700 (PDT)
Message-ID: <735f70a4-049b-4be7-9d08-97e2b326808a@redhat.com>
Date: Wed, 3 Sep 2025 13:54:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/9] dma-buf: heaps: Add Tegra VPR support
To: Thierry Reding <thierry.reding@gmail.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Sumit Semwal <sumit.semwal@linaro.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Brian Starkey <Brian.Starkey@arm.com>, John Stultz <jstultz@google.com>,
 "T.J. Mercier" <tjmercier@google.com>,
 Andrew Morton <akpm@linux-foundation.org>, Mike Rapoport <rppt@kernel.org>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-tegra@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
 linux-mm@kvack.org
References: <20250902154630.4032984-1-thierry.reding@gmail.com>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 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
 qIws/H2t
In-Reply-To: <20250902154630.4032984-1-thierry.reding@gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: LPCsi76-FPv80kDOK1NoLV5wy0VND6Dn4lYhoWw-1a8_1756900492
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

On 02.09.25 17:46, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
> 
> Hi,
> 

Hi,

> This series adds support for the video protection region (VPR) used on
> Tegra SoC devices. It's a special region of memory that is protected
> from accesses by the CPU and used to store DRM protected content (both
> decrypted stream data as well as decoded video frames).
> 
> Patches 1 and 2 add DT binding documentation for the VPR and add the VPR
> to the list of memory-region items for display and host1x.
> 
> Patch 3 introduces new APIs needed by the Tegra VPR implementation that
> allow CMA areas to be dynamically created at runtime rather than using
> the fixed, system-wide list. This is used in this driver specifically
> because it can use an arbitrary number of these areas (though they are
> currently limited to 4).

I am pretty sure we want a system-wide list. Currently we maintain all 
areas in a static array limited by CONFIG_CMA_AREAS.

We can adjsut that to support for more dynamically.

-- 
Cheers

David / dhildenb

