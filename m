Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CEEF98484B
	for <lists+dri-devel@lfdr.de>; Tue, 24 Sep 2024 17:09:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B22BE10E702;
	Tue, 24 Sep 2024 15:09:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="RfjBpiIQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com
 [209.85.210.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 71CCF10E8CD;
 Tue, 24 Sep 2024 15:09:42 +0000 (UTC)
Received: by mail-pf1-f170.google.com with SMTP id
 d2e1a72fcca58-71b08405187so183191b3a.3; 
 Tue, 24 Sep 2024 08:09:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1727190582; x=1727795382; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:autocrypt:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
 bh=cfo3ogkNwrEgRrC3RoYf+bQfdrr67MP1w0PEcE3Sh3c=;
 b=RfjBpiIQvIxPihR9k6CFGS3HHOiev6nLY+06vlT+UiRCfYnNlAylmqmxkSV4EmLpYI
 JOnMu8gevmF4BYuVofDxZyVVPx3SQHCxlli1u1r862DMnpcaLwNnEuJ2v72d1glDrOdd
 6I7ICQmkiNP+l9aSdYO3x7Fo/xFghpXS/r48vx/uQNxy+wbPrTxlPisNwajR+VGQCrO2
 74d6WJBNGCm4YviubHS7nfeXmR3JPvLSbv0t2tWV+tDp5Mfhy+Ehq2nXsS2tHZNi4KeZ
 v1oYk9zLuS9Mp0OmWftfA8AKeujzxqizBaC4HXMOwnSdqR9nk6234P31Wo+CVkxbFYTo
 Iv+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727190582; x=1727795382;
 h=content-transfer-encoding:in-reply-to:autocrypt:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=cfo3ogkNwrEgRrC3RoYf+bQfdrr67MP1w0PEcE3Sh3c=;
 b=N3qRDIY1SaKj4ZkkB4Yr8q0eFgmZds9Vm+YaRwl0Ni/yP8Evpy7+7zPoEUcuOaN2gq
 Pvnp947by4laPBQHBXgadX8L9NhiVIFW1cgFp94tM2PU9+wZMJUiLWzkIfnCBAGPx6N5
 KpJhnPLzENzVyUGc4wALPKfC+xau5hp2u7P8VaNLMV1HzbELEzGUSuDuvY1x0pN98BQL
 mxC61Cpxu0P7t6zEKGgoe2BfQACy3Y+DHU303hlN67+5uC/tEHQytdWdnSu1U/+9Pq53
 rkfIrg3SEoUSFIxS350ZTcDJb2huygyqc4It9hpQqmVAAYEap2ysvFp/XL3mnVZ9W0ro
 rr4g==
X-Forwarded-Encrypted: i=1;
 AJvYcCU/YyjMVjrNZlpN4ps0s7/V6iWquZ5+h/ETz1QdC2/cKWUiNvekzPEC77i7g6nV+zT04nxt/wMfeyk=@lists.freedesktop.org,
 AJvYcCXKSUEEjRVTF8cnauso6gm4WUAhyTREUpxgR0dNrXOKC23TrEw1ErI6YpYaZv5O9WBpnlJZRx0e7ET8@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzodIbfYT0XgaqKrfwPcDFT0mCKfKQa7uMgVLpmDC0GpK20WWLm
 KvMD6+9vNqZUxPhN/YigoZNlf2JYavbpxh9WpamxoNz9EdLZBF3Q
X-Google-Smtp-Source: AGHT+IGLrdslVWPxF1WbVckJaFqp46yKiM9TtPJOqkoG6UKwzb6lU1/L5YoKbupOJxva0LTjKiz3Ow==
X-Received: by 2002:a05:6a00:3cd3:b0:710:591e:b52f with SMTP id
 d2e1a72fcca58-7199cc45827mr22140121b3a.5.1727190581743; 
 Tue, 24 Sep 2024 08:09:41 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c?
 ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-71afc9c6a67sm1310291b3a.190.2024.09.24.08.09.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 24 Sep 2024 08:09:40 -0700 (PDT)
Message-ID: <4accd038-9624-43de-96ad-7ecd0876b607@roeck-us.net>
Date: Tue, 24 Sep 2024 08:09:38 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] drm: revert some framebuffer API tests
To: Maxime Ripard <mripard@kernel.org>
Cc: Simona Vetter <simona.vetter@ffwll.ch>,
 Jani Nikula <jani.nikula@intel.com>, dri-devel@lists.freedesktop.org,
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
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <20240924-handsome-labrador-of-shopping-b1dce5@houat>
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

On 9/24/24 06:56, Maxime Ripard wrote:
> On Tue, Sep 24, 2024 at 06:37:59AM GMT, Guenter Roeck wrote:
>> On 9/24/24 04:54, Maxime Ripard wrote:
>>> +Guenter
>>>
>>> On Tue, Sep 24, 2024 at 12:06:28PM GMT, Simona Vetter wrote:
>>>> On Tue, Sep 17, 2024 at 08:43:50PM +0300, Jani Nikula wrote:
>>>>> The tests consistently trigger WARNs in drm_framebuffer code. I'm not
>>>>> sure what the point is with type of belts and suspenders tests. The
>>>>> warnings *are* the way to flag erroneous API usage.
>>>>>
>>>>> Warnings in turn trigger failures in CI. Filtering the warnings are
>>>>> error prone, and, crucially, would also filter actual errors in case the
>>>>> kunit tests are not run.
>>>>>
>>>>> I acknowledge there may be complex test cases where you'd end up
>>>>> triggering warnings somewhere deep, but these are not it. These are
>>>>> simple.
>>>>>
>>>>> Revert the tests, back to the drawing board.
>>>>
>>>> Yeah I think long-term we might want a kunit framework so that we can
>>>> catch dmesg warnings we expect and test for those, without those warnings
>>>> actually going to dmesg. Similar to how the lockdep tests also reroute
>>>> locking validation, so that the expected positive tests don't wreak
>>>> lockdep for real.
>>>>
>>>> But until that exists, we can't have tests that splat in dmesg when they
>>>> work as intended.
>>>

FWIW, that is arguable. More and more tests are added which do add such splats,
and I don't see any hesitance by developers to adding more. So far I counted
two alone in this commit window, and that does not include new splats from
tests which I had already disabled. I simply disable those tests or don't
enable them in the first place if they are new. I did the same with the drm
unit tests due to the splats generated by the scaling unit tests, so any
additional drm unit test splats don't make a difference for me since the
tests are already disabled.

>>> It should be pretty soon:
>>> https://lore.kernel.org/dri-devel/20240403131936.787234-1-linux@roeck-us.net/
>>>
>>> I'm not sure what happened to that series, but it looks like everybody
>>> was mostly happy with it?
>>>
>>
>> Major subsystem maintainers did not provide any feedback at all, and then
>> there came the "it is not perfect enough" feedback, so I gave up on it.
> 
> Well, if that means anything, we're interested even in something
> imperfect if it solves the above case :)
> 

Maybe someone else is interested picking it up (and no need for credits).
I am buried in work and don't have the time (nor, frankly, much interest)
to revive it. Also, just for reference: The patch series touches a total
of 8 architectures, and unless I missed some I only got feedback from two
architecture maintainers. That doesn't include arm - I don't recall if it
doesn't need changes or if I never got there.

Guenter

