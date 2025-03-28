Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 30434A75267
	for <lists+dri-devel@lfdr.de>; Fri, 28 Mar 2025 23:15:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C5D010E0B7;
	Fri, 28 Mar 2025 22:15:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="RSlUdDgM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-f177.google.com (mail-il1-f177.google.com
 [209.85.166.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F2F710E074
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Mar 2025 22:14:58 +0000 (UTC)
Received: by mail-il1-f177.google.com with SMTP id
 e9e14a558f8ab-3d5bb2ae4d3so8891565ab.0
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Mar 2025 15:14:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linuxfoundation.org; s=google; t=1743200098; x=1743804898;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=RUbOEFaJOAbY7faqDFBOHIbC1ZRfCrfheNTZ60rM6cc=;
 b=RSlUdDgMb3tjbSj7EbyWp5Kus31PP73LGU8zYaoRYK/EXN15xWoZK4ZIUJzpJOiet3
 4qQUnPXU7NiXiF0ZhA4L313HG6vik7A/FXmd05IpdYgF1ANsSeQVT5nJX0XIVzvrexu+
 DUr+lp1beXvqixOyWTg7ToZ+8MtGGme0/ke0w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1743200098; x=1743804898;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=RUbOEFaJOAbY7faqDFBOHIbC1ZRfCrfheNTZ60rM6cc=;
 b=XZOoCD/s5zg7vDyR7Hhf+LMbLneFY28aS+S+1BYJWTrc9UAE0XmZv+tjQaxRdCJCMz
 8ZoEhAqAritEZ1YgvmLc4a4b0BvdzAOGUQi8jKL+IkMyVRgF4mu2DbyL6UmqQ+g/A3ZS
 MFiBtKQNhIbKLUB7OBQU37saPHwLY/ddQkyXrFOR+77mqhsO7QXAcb5UQ6zmTG1BD9hm
 cJ+36bB015bb4LM5XbxLXZ78hu7ONXZcBiQomtBJdFiRrWgiZW9k+QzVShY+9gLCMxeI
 KEnO5i9jovxtqVW7VNwQkr2b3ZOQcUNIv+FWu0QHrjZUPHmhNe2xGwFNh4DOLSfCKpLl
 4NPQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWafT2DhSA40Qyz5qnPQ3ce2govefZ6Hcoetk85S3fPTYWkTu+oBwS6xFSa3nkMYTFMEesx+mKrIek=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YweX2oXKrfnB76DImX9vgfEV4++rVNv3megX6lGRbq9ATfQYsRL
 hu15cJy2rsOJGSaU2vJRDShgTcwr2FCfC4NwR+xspLVROVImA5iF1wTN59uHpVI=
X-Gm-Gg: ASbGncuLNxotbvXJrl33No9Xosp4tvKaniFKeAGb/Xart3++M5qPrrb1Z37wnJ4taRq
 1paBwIVcurg44dAT6CwfDuvlaf2ukdoi8meq6YEnfUHBogZXkU+7vha9Fw8Wi2f8EOWi+8WlzY1
 q+RT2P4HDi6ZpXvPQaSeeILyvYs/06Lx6SfkOhWF0edt0vCwTmL891Cc0ty04lOHiOVS4F+/LqC
 2m1jtASI2bkOoUiAIDEN/JUXsi9OiLQt9CM7uVcFTkqPp2MKAb4fo64LHCXz8DB72ZJgzuXIvoe
 8eAmv/dG5ineZXouzl03esRpaju5yvIsFuSE/i39EICWtruXsM0rExs=
X-Google-Smtp-Source: AGHT+IHAgQaNQm7V/HQ9xhZOQz/Fs6tsLI4+HRU2b6hOJkb/FR7IJnx7J0M2QjLjv4gsNmH0eGf+NQ==
X-Received: by 2002:a05:6e02:3807:b0:3d0:47cf:869c with SMTP id
 e9e14a558f8ab-3d5e0a004a5mr11036025ab.19.1743200097993; 
 Fri, 28 Mar 2025 15:14:57 -0700 (PDT)
Received: from [192.168.1.14] ([38.175.170.29])
 by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-4f464751ebasm643215173.57.2025.03.28.15.14.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 28 Mar 2025 15:14:57 -0700 (PDT)
Message-ID: <a998f3fa-495c-4165-884a-a11c5cb61e96@linuxfoundation.org>
Date: Fri, 28 Mar 2025 16:14:55 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 00/14] Add support for suppressing warning backtraces
To: Andrew Morton <akpm@linux-foundation.org>,
 Guenter Roeck <linux@roeck-us.net>,
 Brendan Higgins <brendan.higgins@linux.dev>, David Gow
 <davidgow@google.com>, Rae Moar <rmoar@google.com>
Cc: Maxime Ripard <mripard@kernel.org>, Kees Cook <kees@kernel.org>,
 Alessandro Carminati <acarmina@redhat.com>, linux-kselftest@vger.kernel.org,
 David Airlie <airlied@gmail.com>, Arnd Bergmann <arnd@arndb.de>,
 =?UTF-8?Q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>,
 Dan Carpenter <dan.carpenter@linaro.org>,
 Daniel Diaz <daniel.diaz@linaro.org>, Arthur Grillo
 <arthurgrillo@riseup.net>, Naresh Kamboju <naresh.kamboju@linaro.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>,
 Daniel Vetter <daniel@ffwll.ch>, Thomas Zimmermann <tzimmermann@suse.de>,
 Alessandro Carminati <alessandro.carminati@gmail.com>,
 Jani Nikula <jani.nikula@intel.com>, dri-devel@lists.freedesktop.org,
 kunit-dev@googlegroups.com, linux-arch@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-parisc@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
 linux-s390@vger.kernel.org, linux-sh@vger.kernel.org,
 loongarch@lists.linux.dev, x86@kernel.org
References: <20250313114329.284104-1-acarmina@redhat.com>
 <202503131016.5DCEAEC945@keescook>
 <20250313-abiding-vivid-robin-159dfa@houat>
 <c8287bde-fa1c-4113-af22-4701d40d386e@roeck-us.net>
 <20250313150505.cf1568bf7197a52a8ab302e6@linux-foundation.org>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <20250313150505.cf1568bf7197a52a8ab302e6@linux-foundation.org>
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

On 3/13/25 16:05, Andrew Morton wrote:
> On Thu, 13 Mar 2025 11:31:12 -0700 Guenter Roeck <linux@roeck-us.net> wrote:
> 
>> On Thu, Mar 13, 2025 at 06:24:25PM +0100, Maxime Ripard wrote:
>>>>
>>>> Yeah, as with my prior review, I'm a fan of this. It makes a bunch of my
>>>> very noisy tests much easier to deal with.
>>>
>>> And for the record, we're also affected by this in DRM and would very
>>> much like to get it merged in one shape or another.
>>>
>>
>> I was unable to get maintainers of major architectures interested enough
>> to provide feedback, and did not see a path forward. Maybe Alessandro
>> has more success than me.
> 
> I'll put them into mm.git, to advance things a bit.

I haven't heard from kunit maintainers yet. This thread got lost
in inbox due to travel.

David/Brendan/Rae, Okay to take this series?

Andrew, Okay to take this through your tree - this needs merging.

thanks,
-- Shuah

