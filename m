Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 606BD87EB17
	for <lists+dri-devel@lfdr.de>; Mon, 18 Mar 2024 15:34:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE8D210F665;
	Mon, 18 Mar 2024 14:34:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="f5qLNDAi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com
 [209.85.215.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E8EA610EE9C;
 Mon, 18 Mar 2024 14:34:14 +0000 (UTC)
Received: by mail-pg1-f180.google.com with SMTP id
 41be03b00d2f7-5d3912c9a83so2241247a12.3; 
 Mon, 18 Mar 2024 07:34:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1710772454; x=1711377254; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
 :to:content-language:subject:user-agent:mime-version:date:message-id
 :sender:from:to:cc:subject:date:message-id:reply-to;
 bh=pCUApaONo8ehyXHQqRUbNVk/TB7fiQ1m1hWXI6brQnc=;
 b=f5qLNDAisbgxBeF+pyT4hkn+9Bi0TjTiclAa0kZg7vkFUVFBq52yDWJPHoP9KGO3O0
 ba8oANo/j5ETy55pYqXjjJowOyn9aEASwztdThDnnFniTYu5s3DLMObi+205KerJ4YNk
 af5LqsDwKUApB8tzc4CLHvY1W9hj7z1uSd3T3HHOnMDFcVH2sIwmeOJjrTnwX5y7Uki3
 8NepNXk9UOlAAHX4wqWRu3OclP32mSBgrnrlEx5K59UB8vjzqepB9My6BCwP8t+N7w+3
 4n7TS63l8638VAr1YliAnIGMiDamI+ODRYP3PZpaPwSR9I9iaUjrR2gpWevK0/iVAYGq
 zg3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710772454; x=1711377254;
 h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
 :to:content-language:subject:user-agent:mime-version:date:message-id
 :sender:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=pCUApaONo8ehyXHQqRUbNVk/TB7fiQ1m1hWXI6brQnc=;
 b=UxCLeDRLjagy6bototFKpPVKQDGDttkLK/g1+hhKNAkIVIdPOsQWS29yL3Brk/GUjm
 +3JNlOZLpril228VqwOXfOIv1RZ9u7fs8Z4g36bmV2ncjE5c/WftfbHSIbHzaSeC2MY5
 7YDIsQoYONAE6SDlbExrHvDWCPsKFTzE70ue6uxb0rEQAO/Y+fhQRKIjGjeFvV/Ukz+u
 Cy4qp3D0w2XAFb+kBxb2Si5kumiOWc2BCKLMOy/8KLryiQdd2b5k/7xK+qfWFaIJW1MH
 hBB/q843hdn+5ID5G2V+8E5yVpo5pq96Knm6dkB6bUZsn1/6RdTH94vGpGIKA3WCv42B
 JIlA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWG7OUbUQtUt3tiQtZoV8W0LFfb9tPgi6vahHLwgAZn8AR/PpG1no9akhRIJVWvDq0wwvo9eOcm712uzw0+Uiqxx8Mr5FHfxZ9tsOj4VZAQ
X-Gm-Message-State: AOJu0YwkK7h9hB7IhW2DTP/gouSHixpVmqk5HhVjCAFNPSPxAFqSqISJ
 w3ncExtMHsWmZ8bSSVGO9zS+ESOZmeLni7ZdnlrDIucxM9U92AgF
X-Google-Smtp-Source: AGHT+IFhgkXLDH1Nsb2bn/tOkKam9Q5dzrQx71TLlzh9hIPane69cJemjbETVa60AWVap2hwH8gRGg==
X-Received: by 2002:a17:90b:60e:b0:29d:eea9:c800 with SMTP id
 gb14-20020a17090b060e00b0029deea9c800mr7483571pjb.7.1710772454041; 
 Mon, 18 Mar 2024 07:34:14 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c?
 ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id
 nc16-20020a17090b37d000b0029bb5a95a3csm7697477pjb.55.2024.03.18.07.34.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 18 Mar 2024 07:34:13 -0700 (PDT)
Message-ID: <e6ebb8ee-406e-4d2d-9932-7b48ae3721e3@roeck-us.net>
Date: Mon, 18 Mar 2024 07:34:11 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [v3,5/5] drm/xe: Enable 32bits build
Content-Language: en-US
To: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: intel-xe@lists.freedesktop.org, Matt Roper <matthew.d.roper@intel.com>,
 dri-devel@lists.freedesktop.org, daniel@ffwll.ch, airlied@gmail.com
References: <20240119001612.2991381-6-lucas.demarchi@intel.com>
 <d53d2da5-22de-4f81-9fbc-2f54e5da9ac6@roeck-us.net>
 <qm5q44hs7vmq6erio7ome323xemwrg5mrxhaozkwblf6qjjvow@dqwy2oz2rrrj>
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <qm5q44hs7vmq6erio7ome323xemwrg5mrxhaozkwblf6qjjvow@dqwy2oz2rrrj>
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

On 3/18/24 06:28, Lucas De Marchi wrote:
> On Sun, Mar 17, 2024 at 09:14:14AM -0700, Guenter Roeck wrote:
>> Hi,
>>
>> On Thu, Jan 18, 2024 at 04:16:12PM -0800, Lucas De Marchi wrote:
>>> Now that all the issues with 32bits are fixed, enable it again.
>>>
>>> Reviewed-by: Matt Roper <matthew.d.roper@intel.com>
>>> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
>>> ---
>>>  drivers/gpu/drm/xe/Kconfig | 2 +-
>>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/gpu/drm/xe/Kconfig b/drivers/gpu/drm/xe/Kconfig
>>> index 1b57ae38210d..1b0ef91a5d2c 100644
>>> --- a/drivers/gpu/drm/xe/Kconfig
>>> +++ b/drivers/gpu/drm/xe/Kconfig
>>> @@ -1,7 +1,7 @@
>>>  # SPDX-License-Identifier: GPL-2.0-only
>>>  config DRM_XE
>>>      tristate "Intel Xe Graphics"
>>> -    depends on DRM && PCI && MMU && (m || (y && KUNIT=y)) && 64BIT
>>> +    depends on DRM && PCI && MMU && (m || (y && KUNIT=y))
>>
>> I am curious about changes like this. Enabling 32-bit builds results in
>> build failures for mips_allmodconfig because the driver redefines END.
>> END is also used as macro in assembler code, the define happens to be
>> included for mips builds, and it would be difficult to change it there.
>>
>> Unlike the i915 code, DRM_XE is not marked as depending on x86. This means
>> it will be built for pretty much all "allmodconfig" builds for all
>> architectures. Yet, there have been recent complaints about "allmodconfig"
>> builds of drm code causing build failures on "oddball" architectures.
>> Is there an assumption that DRM_XE (or DRM in general) is manually
>> excluded from all architectures where it fails to build ? If so, would
> 
> for all the reports we've been receiving we fixed the build and improved
> CI to try to avoid the regressions. DRM_XE doesn't really depend on x86,
> but I see your point of filtering out the "oddball architectures" or just
> expose the ones we know it builds against. Yet, I don't see that
> approach done in the wild in other drivers. At least on the build side, we
> constantly check the reports from lkp like
> 
> https://lore.kernel.org/all/202403152008.KlwyYggO-lkp@intel.com/
> 
> which also includes mips:
> 
>      mips                              allnoconfig   gcc
>      mips                             allyesconfig   gcc
> 
> is that not sufficient? allyesconfig should be covering it afaics
> 

All I can say is that drivers/gpu/drm/xe/xe_lrc.c doesn't build for
mips builds in the mainline kernel. This is for both allmodconfig and
allyesconfig. Both automatically build 32-bit kernels. Those builds are
only enabled with this commit. The problem is also seen with 64-bit
builds, but those are not enabled with allmodconfig/alldefconfig.
I don't know what and how exactly 0-day runs its tests, but the failure
is also seen in the drm-xe-next branch.

I am going to blame this on my environment and just exclude DRM_XE
from mips test builds going forward.

Thanks,
Guenter

