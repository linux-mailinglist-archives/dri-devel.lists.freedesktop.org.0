Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 942E098646B
	for <lists+dri-devel@lfdr.de>; Wed, 25 Sep 2024 18:04:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DAA7D10E2F2;
	Wed, 25 Sep 2024 16:04:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="BmZYy6mh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-f43.google.com (mail-oa1-f43.google.com
 [209.85.160.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5988810E2F2;
 Wed, 25 Sep 2024 16:04:43 +0000 (UTC)
Received: by mail-oa1-f43.google.com with SMTP id
 586e51a60fabf-27b7a1480bdso38966fac.2; 
 Wed, 25 Sep 2024 09:04:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1727280282; x=1727885082; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:autocrypt:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
 bh=u1Gr80ro8+ummkN/WH/W07Tsla30e6APnC3O5egIj90=;
 b=BmZYy6mhqqCjOY4nnLaeiEFR8dwgJubCBm6qYm1BMRdqIPt2/AIsQDGIm6/nNu/akZ
 ii0moeU498Lu9OeJBndieqExs6FC2Pf4weKWYZKvveR7EuZOxrnUAk0rgD/W+3xJAlqC
 aRMtUS4tCGBldC7dVFe8bQ1MBRinSWRGnI6+nrGmD4IP60iDCZQOlG93kyW9duTCoDjw
 fBtx+Y0uQxMuN7WX+pHnTB9jR0A2uTTR8i2ilc3MUec2SWv9qH5+gjIh5n8lYMHq8Eeb
 tPXHaVEQxW37eidP46KN7F3KpAfDEIaMoMULd0CTTjl5BgdAREMCYMMihGVYaww+nMy5
 e16A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727280282; x=1727885082;
 h=content-transfer-encoding:in-reply-to:autocrypt:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=u1Gr80ro8+ummkN/WH/W07Tsla30e6APnC3O5egIj90=;
 b=fHc2w34uQmeD1XJZHyAq/jLrk+f5mSXM91pXiM2Oqiy0meISNDD7cOKbrCJvhaAuOx
 f8oUhOm0c5dtwWCCUl4vErhSICXLa8ZVyN7bYXUurX5H3q7dn1FbBvYewyUmAYyxVQuD
 SXUvZXWQD3clL+fIYvWqgNq20LdhS4qn6I03KjiHOTHSKWqhVskPqDxiG9mhloVwsok4
 OJsVzZFV5bQdAZt8khHvRD6D6VZDG9yzrT6tC6jLt70t6e8gSCz/2nmRGOYnYK86lO1w
 G+KbAZWO5rhqEp6w5BXGfQn0ynx2li69vRIzAaYmvpabcx+ldB7rT/syBp5C9QkYa5m/
 ohdw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVx3iJgAIO5y1a0Bjsr2NKSe276B/A5l/fJnQ8jPHTwKIAygblwQ418Qb4Pwr6ZyBcSx/JkBDN9HoQ=@lists.freedesktop.org,
 AJvYcCWsik2VGgwM4qsxBIghf0V5+BvURF7Do8AMnJqoETzEW8DeiNGplL+JsMLQmUR+IFRXguLVm8utUJH0@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzJD7gy9i1P5sAZ3aAiVw6IcBX0oKwp6YQWp05uf5FURwK5rG+a
 h/OVbpn/wThcMGhZN488UadhFGzdI4ZnybDfWspJVU9G64JPn2cW
X-Google-Smtp-Source: AGHT+IEBlGMu5XYMIvL9xSi+QvVIbwSnkNmQXzCFFdhX9xqF56epbD0jcIeG7sx1lzqsvn8nMFw8gg==
X-Received: by 2002:a05:6870:330a:b0:277:e5a5:3362 with SMTP id
 586e51a60fabf-286e15f3febmr2714234fac.30.1727280281491; 
 Wed, 25 Sep 2024 09:04:41 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c?
 ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-7e6befcdb83sm1646037a12.15.2024.09.25.09.04.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 25 Sep 2024 09:04:40 -0700 (PDT)
Message-ID: <25673888-cb27-4e03-98c0-66020aae5631@roeck-us.net>
Date: Wed, 25 Sep 2024 09:04:39 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] drm: revert some framebuffer API tests
To: Maxime Ripard <mripard@kernel.org>, Simona Vetter <simona.vetter@ffwll.ch>
Cc: Jani Nikula <jani.nikula@intel.com>, dri-devel@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org,
 Carlos Eduardo Gallo Filho <gcarlos@disroot.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Jeff Johnson <quic_jjohnson@quicinc.com>
References: <cover.1726594684.git.jani.nikula@intel.com>
 <ZvKPJGQyZmdWNOmd@phenom.ffwll.local>
 <20240924-refined-nocturnal-starfish-2947b8@houat>
 <f3f8bec1-884b-46ac-82a6-6e5cb8840146@roeck-us.net>
 <20240924-handsome-labrador-of-shopping-b1dce5@houat>
 <4accd038-9624-43de-96ad-7ecd0876b607@roeck-us.net>
 <ZvP5YhON49Z5TMI7@phenom.ffwll.local>
 <20240925-fresh-artichoke-boa-1a673f@houat>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <20240925-fresh-artichoke-boa-1a673f@houat>
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

On 9/25/24 06:05, Maxime Ripard wrote:
[ ... ]

>> We've had similar discussions in the past around unit tests that wasted
>> too much cpu time with randomized combinatorial testing, and we've thrown
>> those out too from drm. Test hygiene matters.
> 
> We had that discussion because those tests could run for up to around a
> minute on certain platforms. It's not the same issue at all?
> 

I added "kunit.stats_enabled=2 kunit.filter=speed>slow" to the kernel command
line in my tests to avoid long-running tests. That works as long as slow tests
are marked accordingly using KUNIT_CASE_SLOW(), KUNIT_SPEED_SLOW, or
KUNIT_SPEED_VERY_SLOW.

Guenter

