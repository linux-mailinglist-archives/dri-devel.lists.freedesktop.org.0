Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 861339D602A
	for <lists+dri-devel@lfdr.de>; Fri, 22 Nov 2024 15:10:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0BBAB10EBA4;
	Fri, 22 Nov 2024 14:10:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="OlO3HVgr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com
 [209.85.221.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A926D10EBA4
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Nov 2024 14:10:29 +0000 (UTC)
Received: by mail-wr1-f47.google.com with SMTP id
 ffacd0b85a97d-3823f1ed492so1805687f8f.1
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Nov 2024 06:10:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1732284627; x=1732889427; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=XVgF64/Tn6fYWXsD613XPmJVxiCtXinqResGOIxQA8M=;
 b=OlO3HVgr36+RBnlJB1c5PNYg/dHhdonGxlmU1RCTDcJKIIwQ9IustmAu18mEferNcI
 xbFm5QTKXqjB1LgJfg1oFYBe0t9dqG12RxiiBSc1kajRwX+NGqNbbMBkHTlJje/jK+3g
 /4tcLoUyLbHRDUgBHp3AxMV6soEMAYY2MYTOpiz5FW3b16c9udUBh3iQ/Mz9ghTtrPI+
 x1vxB357l2/l23jWEe8wgttY5QW9g+lnq2VN4n0SrUrTTrupOycSojCYxcuQjjMxZAVU
 k88bhgYcBrta9jQCNDsBWlV5f66PQVpLtyNatscZBLfAIem3Gvv2sYSxhe/y7/VAj8a5
 R7jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1732284627; x=1732889427;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=XVgF64/Tn6fYWXsD613XPmJVxiCtXinqResGOIxQA8M=;
 b=MM6SCDAnbaA9ofciFIeYqry0PpZT73s1gX/BJybqWXWBooKoAQUWUESS4Epo4zHu6r
 +6P1G/XViHYx53rRiN3gGNKtp3N+9A977AsYUdMW3OuONjgKoQe62BGu7uBiF11ghbhK
 ndWjppebVAW1jdl1Q1H9QjDoEF5WNYWJoXW4jSFAGXrI2wVSabJ+P6+62NYa0Gd4ScXj
 qsMFEyJcKwLZhYQmutboKh3Jzwc3ZAy03pTlKb9A2+hQu+9wKNLjacpgkqmpdVy9LvRw
 PG8IT/PwSxQUraKKysQ6IdEGcDK9vpf6fMIyD9uPowC4hfNjSW9WTj256uP2378hKEDy
 zNYA==
X-Gm-Message-State: AOJu0YwQCo/5b78C6UNvX01euxKaLT8ilSFQc3Y98Uc0AssnsmFAEj+B
 vHIQZcRTAC3lEPp2FmXgFNIbJr80wb04/a+uXR2jR9DVeg85C4o1
X-Gm-Gg: ASbGncsf5AidM8oFnKBDQnccCveqqeN56xAGLaTVlwhhvwSgCYHlzFARV7fJ0kjglxC
 7aJVzJbvhAIe/vQ+xb4vGph4zNFC5NzRt+tTsoxxqDuwj/NxqeqHkb/YPpl7BILle9g1o0jJhoR
 hCYjRlGy6v4By3oBS2Vc5+sjuVwXVjLk1Tpnc7nXdEgkdmkusaYQRU37NmJPZOyUsY/C08e70F1
 1fWl4r6Urw1m8dL3/TLKzz7aVR4V6L0N2MF4r6d8ZZc17lrcvOb18roWSk16vLK9fTtPtO8d6k4
 05o=
X-Google-Smtp-Source: AGHT+IEf/kHLyo6m1VS14wL/cjtOSzQGpeEmPy4BMjnW/OJSBxZvgReYOObEzlU08Kmgy3zlWRaBrw==
X-Received: by 2002:a5d:6daf:0:b0:367:8e57:8 with SMTP id
 ffacd0b85a97d-38259d2b7e8mr6227012f8f.19.1732284627326; 
 Fri, 22 Nov 2024 06:10:27 -0800 (PST)
Received: from [10.254.108.83] (munvpn.amd.com. [165.204.72.6])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-433cde8fcbbsm28261715e9.35.2024.11.22.06.10.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 22 Nov 2024 06:10:25 -0800 (PST)
Message-ID: <3855cc7c-399a-4feb-b34f-b77d858a3253@gmail.com>
Date: Fri, 22 Nov 2024 15:10:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Phase out ttm_exec
To: Zack Rusin <zack.rusin@broadcom.com>
Cc: dri-devel@lists.freedesktop.org
References: <20241121102725.4195-1-christian.koenig@amd.com>
 <CABQX2QOgf3Ucv8KQ0rPa+g9_H17TLvAFUu08Pk9qWN=kVEtuJg@mail.gmail.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>
In-Reply-To: <CABQX2QOgf3Ucv8KQ0rPa+g9_H17TLvAFUu08Pk9qWN=kVEtuJg@mail.gmail.com>
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

Am 22.11.24 um 05:22 schrieb Zack Rusin:
> On Thu, Nov 21, 2024 at 5:27 AM Christian König
> <ckoenig.leichtzumerken@gmail.com> wrote:
>> Hey Zack,
>>
>> vmwgfx is the only driver left using this component.
>>
>> So I though I go ahead and complete switching over to drm_exec.
>> The patches are only compile tested, but relatively staright forward.
> Hi, Christian.
>
> Thank you so much for tackling this! It's on our todo.
>
> I just applied the patches and they break rather badly,

Crap, but yeah that was kind of expected.

The changes are rather complicated and not as straight forward as it was 
on the other drivers, I probably just missed a detail.

>   i.e. I don't
> see any command submission with the changes. I won't have the time to
> look at it today, I'll try to carve out some time over the weekend to
> debug this. Two other observations:
> 1) The patches break the build, I think they're missing:
> diff --git a/drivers/gpu/drm/vmwgfx/Kconfig b/drivers/gpu/drm/vmwgfx/Kconfig
> index 6c3c2922ae8b..f7aff3fdfb1a 100644
> --- a/drivers/gpu/drm/vmwgfx/Kconfig
> +++ b/drivers/gpu/drm/vmwgfx/Kconfig
> @@ -4,6 +4,7 @@ config DRM_VMWGFX
>          depends on DRM && PCI && MMU
>          depends on (X86 && HYPERVISOR_GUEST) || ARM64
>          select DRM_CLIENT_SELECTION
> +       select DRM_EXEC
>          select DRM_TTM
>          select DRM_TTM_HELPER
>          select MAPPING_DIRTY_HELPERS

Oh, good point. I missed that on radeon as well because other drivers 
selected that dependency.

> 2) qxl would need to be patched as well. At least it uses
> ttm_eu_reserve_buffers which you're removing.

I pushed the qxl change the day before yesterday. Could only compile 
test them, but their were so straight forward that I had enough 
confidence that they will work. If not we can trivially revert them.

Thanks,
Christian.

>
> z

