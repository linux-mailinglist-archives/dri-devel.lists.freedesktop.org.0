Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DD9BA24E9B
	for <lists+dri-devel@lfdr.de>; Sun,  2 Feb 2025 15:28:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A742510E258;
	Sun,  2 Feb 2025 14:28:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="RBc/PoBR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com
 [209.85.214.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 94CDC10E0E5;
 Sun,  2 Feb 2025 14:28:11 +0000 (UTC)
Received: by mail-pl1-f179.google.com with SMTP id
 d9443c01a7336-21628b3fe7dso62705955ad.3; 
 Sun, 02 Feb 2025 06:28:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1738506491; x=1739111291; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:autocrypt:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
 bh=/I6rSMAKEl7cAPHfSJ/klXATUxOewzlsZpepTuhR4cc=;
 b=RBc/PoBRln08QINqEHTQM4foHeUR9U9G9bu/fpE2gx2MwgxcdBlx23/0igTriJDstJ
 f1FSe3BkO2f05u/3D4OGuYYVZ4B8RkxSHa5TFdTiJRmCoR81Zzigz1Zlh/nxtarHhD2C
 PAJuiykw7umWC8fKdL8q97T/N0k0TQ7EwMmfgq0UWoyoKt/0YmVtjMzTlbnd/atZJLAR
 ZuZE5GaKwMXlk3D/2Rrhs2A3QLx84CG16LlTIVaVtNS+wa8QWF/1PDhpl7tUPW4CGeiw
 zYk3IIwk4hWjzwOWhct95Nb3x1ljW51+4I2E1jg7SRkHoU3LrEI2yihfymPhJEu4kVny
 xIKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738506491; x=1739111291;
 h=content-transfer-encoding:in-reply-to:autocrypt:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/I6rSMAKEl7cAPHfSJ/klXATUxOewzlsZpepTuhR4cc=;
 b=hP27/alWYu9t0bVf7PxFhFaMNzZBcZB80F/SiTtngCeKiaMR56O4pBam5GFHv9B7I6
 MQ9LzmKoEOmEPTQnGIxLIIg649oACb69gCcZmDlayzBBi36ew3kqCtN5r3Sh1KfHiIks
 LsBUp18hKVfCbSWTDiTBq929SxH08Bad9l/25sXwghFstZhRpwG36LppiU12ySLtVphd
 pAqvAv8Pmknoj3+Bho6A7dwqypFTAIdUUTigqG/D5OwrtxwGRVS18oBYhIR7I36UHPbw
 t8xt0cQK4Kt+gYAMyJfUy3FWIZTzk/j3Hrd0SSRpgfL3/TNyIKPqtTtjioJTE6zCOPXA
 bbpg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVHt7KYeXdlD38JX66se1xpPgiYzp2QDd1yNCozf3ChnaqpgS2D7gTHcq0ZoQkOUyQasdnSkE8vglaV@lists.freedesktop.org,
 AJvYcCX+u8PG+H2J890Xrzg7FS11uu2PDMfvQJQDvCR3GvHsApIQ0gs0VbwfydmDLwTJuQQRgnqo118GcU4=@lists.freedesktop.org,
 AJvYcCXfA4eOBg/V2YKYl09Zc46Zo7hHHIwhCUh24EI4WC878DXXCJ3qKfNfJbaI4Ec2ey4o7xGH1BD+VZE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw1RFrhp7a1VpETq/0NTU+wK+PYKR1ECSyu7KMjBeIwTKlJKmu3
 AJZ+DOssd/q23rumn4F4YpuZuU7Yq89uj+xdhIaJv7kiENUgaPDN
X-Gm-Gg: ASbGncts8YApwOSRw2sfb9tQKVzLSkVfB6NhQnYYagElTY4HUO83UeGBlBtcFR88Pyo
 eJpt8vTXSnZRw85XtejC/Ma3DGBsk1akmU4GRvFaj94Hg0OCKFhBFpO4hfetrRLpch86Q1yAj6c
 1IWtu3bVzlUHE8xpzP+1eR9WSUehPi/0g5sLBJbwg1HkxBQR4uyOa14rs1PDUlZFFPaCagvrUHQ
 CeSi6Uea/ReNiJDsNCaLsKFEoHGtFKlO3DW4OseTovDRedLgFHhGjWwpKvh7oX9VPAxMVVFUA+a
 tDI3RWdZ83cF1C3qawY/v+d/97sVCMdWF7SwStIpQhffeuhxrd/rjC5Uo5G9n0Lp
X-Google-Smtp-Source: AGHT+IHACnzm1wEujooiBkXO9oiLminIt0LT5rD6xhd8TufkGNtfudg03xLfdwCdTzGjXHR/S9DqPw==
X-Received: by 2002:a17:902:ea12:b0:215:9a73:6c45 with SMTP id
 d9443c01a7336-21dd7d6e17bmr283864935ad.22.1738506490906; 
 Sun, 02 Feb 2025 06:28:10 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5?
 ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2f83bd0ce4dsm9458541a91.27.2025.02.02.06.28.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 02 Feb 2025 06:28:10 -0800 (PST)
Message-ID: <27c1243c-15e8-4c24-a0a4-cc433000ad38@roeck-us.net>
Date: Sun, 2 Feb 2025 06:28:08 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/i915/backlight: Return immediately when scale()
 finds invalid parameters
To: David Laight <david.laight.linux@gmail.com>,
 Linus Torvalds <torvalds@linux-foundation.org>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
References: <20250121145203.2851237-1-linux@roeck-us.net>
 <Z5AmlJ8stVQ4L5jS@intel.com>
 <CAHk-=wix3Rgt+8yBHDdeb_F+c8TzL5aidtCiUEpF+TBc6SCLiQ@mail.gmail.com>
 <20250202132709.3ab54376@pumpkin>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <20250202132709.3ab54376@pumpkin>
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

On 2/2/25 05:27, David Laight wrote:
> On Tue, 21 Jan 2025 15:15:09 -0800
> Linus Torvalds <torvalds@linux-foundation.org> wrote:
> 
>> On Tue, 21 Jan 2025 at 14:59, Rodrigo Vivi <rodrigo.vivi@intel.com> wrote:
>>>
>>> I'm pushing this soon to drm-intel-next, unless Linus want to take
>>> this one directly to his tree
>>
>> Let's just go through the proper channels and go through the drm tree.
>>
>> Unless I've issed something, I think this is only an active issue on
>> parisc (and only with certain compiler versions at that), so it isn't
>> some super-urgent thing that needs to be expedited.
> 
> It probably wants pushing into rc-2.
> The build bot is complaining again.
> 

The patch didn't make it into linux-next (as of next-20250131).
I assume it either got lost or it was dropped for some reason.

Guenter

