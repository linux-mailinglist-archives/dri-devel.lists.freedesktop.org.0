Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 217E5885E6E
	for <lists+dri-devel@lfdr.de>; Thu, 21 Mar 2024 17:48:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC9F410F05B;
	Thu, 21 Mar 2024 16:48:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Ehh0D57C";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com
 [209.85.160.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7DFB810EFDA;
 Thu, 21 Mar 2024 16:48:40 +0000 (UTC)
Received: by mail-qt1-f180.google.com with SMTP id
 d75a77b69052e-430a7497700so8894181cf.1; 
 Thu, 21 Mar 2024 09:48:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1711039719; x=1711644519; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
 :to:content-language:subject:user-agent:mime-version:date:message-id
 :sender:from:to:cc:subject:date:message-id:reply-to;
 bh=RnSQH4sqrhF5Wo3QY3fQ9liz4+BuxfP+ECc1wYtEqZc=;
 b=Ehh0D57C2/TPW7UzLDhFK4NbzzWuOtQraxCs+qRhUrMmOgIy9Hqcv3dssZPsv/Jp4M
 7QrDmjaPc+DEzdPBHsvSRwg9032TjlaSEGQzgFF7/p56gN2b1g0ALyFfqsJ4Lb5eOn+T
 TnbDNHuEPM7Mil2E4mxLaNmZPWSZU9gmr/J+anzRZETqmIWK0YLMY5EJwehBtEDLeegu
 IaufM04pRoO6ORH31Ut/E7HgiGHxmYEEre7CmNFCRFQ+sNaic3mZqDSxW7lN8ODjcHdP
 Y8WgP4vMewmYznpm5zo1L53eF70pvcxDTI3Bdz+UDerTFQ02saC855wgaZq5mAHbwSq+
 qURw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711039719; x=1711644519;
 h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
 :to:content-language:subject:user-agent:mime-version:date:message-id
 :sender:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=RnSQH4sqrhF5Wo3QY3fQ9liz4+BuxfP+ECc1wYtEqZc=;
 b=gCzu1jlSj4mywJOdlg7h+9YYKGMuw10juOKYSQewgJs62Czt2Zufx19wC9UHXr8jfp
 U6CnC0/3wlNWH1tk1KEr/kWrSQndB7WLvJFGmKRw65gFJec5dT/INKGci256zdkHd6Bp
 4BxEhH9gg+ZnE/HBNDTLoKoZOIHTnu+v16wlikUURuhZ9EJ8Z5xYU95yCyEsM/+NjwnA
 ue1Al6PijXjYGE2IVmnRUx5sX4BAfVmhvWUdf3uIg4F5I7TQA7TNKyaMZT99hAmKbVs8
 06ke/Iz6cLcBJedeJLfqfnkQp82uK06dXdn80RvU9WNDR/tIHB8Zdz7EXDSPky6jp+dK
 wxug==
X-Forwarded-Encrypted: i=1;
 AJvYcCVDtk2Jo+MR7MNuuNVqIc8oDW+k5uKLEhi5VXy3nBvwCPGUuBzPIGclrfTHRfNkVo945nph/UY9cCgXHFn/pN68wPsOUHW/q9n8bpYb4Ral
X-Gm-Message-State: AOJu0YyFQz10n0H/UZ+Jv6tZ9Czo19bRzdkK1k50yPLBaXX5dxZq/2q2
 DSDAzjYtPvKAW2iMkeO542TFr8mXJoB/c3rzcp/hJHy8HyXtHlRpYGM+gxAW
X-Google-Smtp-Source: AGHT+IESGMrCCXgGlXp7C5pfKBqxty8YKppp9l1u+JHu9h2kxGl6gq2nE14v6JxaRhqfrObiEVpuxA==
X-Received: by 2002:a05:6a20:3c8c:b0:1a3:55d2:1483 with SMTP id
 b12-20020a056a203c8c00b001a355d21483mr64202pzj.5.1711039221798; 
 Thu, 21 Mar 2024 09:40:21 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c?
 ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id
 fe26-20020a056a002f1a00b006ea7e972947sm34883pfb.130.2024.03.21.09.40.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 21 Mar 2024 09:40:20 -0700 (PDT)
Message-ID: <8d6fbbb9-70cd-45bf-9c48-3bfae0b6654a@roeck-us.net>
Date: Thu, 21 Mar 2024 09:40:18 -0700
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

FWIW: The kissb build system reports the problem as well, so it isn't
just me.

http://kisskb.ellerman.id.au/kisskb/buildresult/15143996/

Sure, that is allmodconfig vs. allyesconfig, but that does not make
a difference. The compiler version doesn't make a difference either.
kissb runs tests with gcc-8 and gcc-13, and they both fail.

Guenter

