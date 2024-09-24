Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 92FEF9849BD
	for <lists+dri-devel@lfdr.de>; Tue, 24 Sep 2024 18:36:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 28C1410E0E6;
	Tue, 24 Sep 2024 16:36:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="bP1L0gRq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com
 [209.85.210.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B10710E0E6;
 Tue, 24 Sep 2024 16:36:00 +0000 (UTC)
Received: by mail-pf1-f180.google.com with SMTP id
 d2e1a72fcca58-719b17b2da1so2241289b3a.0; 
 Tue, 24 Sep 2024 09:36:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1727195760; x=1727800560; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:autocrypt:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
 bh=WLppqF4w3VqZ8hI6uVUZ3LxJi+ZfMfp5Hdlw0qOW6gM=;
 b=bP1L0gRq9zLyAq74dGc1U0pqPFo4Vqbc/0GJ2IwkeT9jCkFkziYroMQpnGlKTwWVk0
 ad3Xt8MeMF17tqL3ov5beFH9deWh2vPRRSHsTlxOT9Mt1bVmuqmqe862tBxsfW/Hsjcl
 vZ4cdiyK/VVePdIQMS/HiawjabbZW86/ZkyHdEINwPYcm9XFPfrANTow8Yw9yHmlyNgj
 N4Nq0S/66JT6dOQ1IE7QAYARZsS15AVXkEhuBxIxUbz/jq0tYO1XylNBT+5NCMI1P+aB
 sQVz/wXFAaQx2Kep+mhe2Lh9V+LxQyH0CSUk8bqC7qCO5QP0q1iT8a3GOLjGUpaGx3/u
 HVJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727195760; x=1727800560;
 h=content-transfer-encoding:in-reply-to:autocrypt:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=WLppqF4w3VqZ8hI6uVUZ3LxJi+ZfMfp5Hdlw0qOW6gM=;
 b=IAbbGH6vOqkzr1vT/2U+1Pdm87AmB0IOuvUDnp3g3uoPZQbDlzj8JaGNNx6btFVvqv
 PDpbDe372YR1VOjIMebAgxyIWCglA0AfYLovncHkR8rjTWNwq6Wq6dp7tRYrb/Ek5Xyr
 CKKi6AkkGBqFbO125NUd2J6C3P3LbJa2Xuw+d44zxGS/YHeDqGrXbQ3392gFO1JOlU88
 y3tsskhOwIBAfWOm3hdiBQt+lMd4G/E2KK9HHoBgOYd25ez/cALIqSeN3baPynA9fSCj
 vc6C7ReiM3ngnvMvtcZL0cUU+UWALWBjvQdUVSi4+GR6ceZQ0XQv78qiXplX29eD6TUG
 Dj4w==
X-Forwarded-Encrypted: i=1;
 AJvYcCUSupcUmd4qFf5UZeghhuYCEdl3hzQyzKnDUx1trc7iXlJOPmfw6AjvlFC0/xMh0lCepRKsbNbOkar4@lists.freedesktop.org,
 AJvYcCXwZXIjZUWzouV/pdqb3EJoUnoDWkk+FCZIs6Lyo1smaFddu0EGmV6p12BOytUhkH5AJfl3oivUDBc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyrE8PGt0gHv2SghoNGuzmwfnv6aOJPklqFra73qPKgOTa1SZmO
 WYQPFWvG4fmwuLVkCXIoI1XWcaF31aFUema9A3Iy0KdJSkO7tF1m
X-Google-Smtp-Source: AGHT+IGA+EunVy9wV0ZVAHfeV6W53X1C9T+lzt8CoyONROh0u3VMZ3tJhb4D41JGLLtRL49HMhOmFA==
X-Received: by 2002:a05:6a00:3c91:b0:717:88eb:824d with SMTP id
 d2e1a72fcca58-7199c9a442cmr24803070b3a.7.1727195759752; 
 Tue, 24 Sep 2024 09:35:59 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c?
 ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-71afc84683bsm1386612b3a.84.2024.09.24.09.35.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 24 Sep 2024 09:35:58 -0700 (PDT)
Message-ID: <ee7377bc-128d-44d8-bec5-08221a9b065a@roeck-us.net>
Date: Tue, 24 Sep 2024 09:35:56 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] drm: revert some framebuffer API tests
To: Jani Nikula <jani.nikula@intel.com>, Maxime Ripard <mripard@kernel.org>
Cc: Simona Vetter <simona.vetter@ffwll.ch>, dri-devel@lists.freedesktop.org,
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
 <87ed593v11.fsf@intel.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <87ed593v11.fsf@intel.com>
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

On 9/24/24 08:56, Jani Nikula wrote:
> On Tue, 24 Sep 2024, Guenter Roeck <linux@roeck-us.net> wrote:
>>>>> On Tue, Sep 24, 2024 at 12:06:28PM GMT, Simona Vetter wrote:
>>>>>> Yeah I think long-term we might want a kunit framework so that we can
>>>>>> catch dmesg warnings we expect and test for those, without those warnings
>>>>>> actually going to dmesg. Similar to how the lockdep tests also reroute
>>>>>> locking validation, so that the expected positive tests don't wreak
>>>>>> lockdep for real.
>>>>>>
>>>>>> But until that exists, we can't have tests that splat in dmesg when they
>>>>>> work as intended.
>>
>> FWIW, that is arguable. More and more tests are added which do add such splats,
>> and I don't see any hesitance by developers to adding more. So far I counted
>> two alone in this commit window, and that does not include new splats from
>> tests which I had already disabled. I simply disable those tests or don't
>> enable them in the first place if they are new. I did the same with the drm
>> unit tests due to the splats generated by the scaling unit tests, so any
>> additional drm unit test splats don't make a difference for me since the
>> tests are already disabled.
> 
> What's the point of having unit tests that CI systems routinely have to
> filter out of test runs? Or filter warnings generated by the tests,
> potentially missing new warnings. Who is going to run the tests if the
> existing CI systems choose to ignore them?
> 
> Automation on a massive scale is key here, and making that harder is
> counter-productive.
> 

As I have said elsewhere, not being able to handle backtraces generated
on purpose is a limitation of my testbed. Other testbeds with active (and
paid) maintainers may not have that limitation. I deal with it by disabling
affected tests. Others may deal with it by maintaining exception lists.

Ultimately it is up to developers and testbed maintainers to decide the level
of test coverage they are looking for or able to support.

Thanks,
Guenter

