Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B656E86A3B2
	for <lists+dri-devel@lfdr.de>; Wed, 28 Feb 2024 00:32:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A42810E959;
	Tue, 27 Feb 2024 23:32:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="X2PyoMKf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f53.google.com (mail-io1-f53.google.com
 [209.85.166.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C70C10E752
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Feb 2024 23:32:12 +0000 (UTC)
Received: by mail-io1-f53.google.com with SMTP id
 ca18e2360f4ac-7bff8f21b74so46713939f.0
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Feb 2024 15:32:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linuxfoundation.org; s=google; t=1709076731; x=1709681531;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=80vE8I00zUuMjb98bapG9u6P0XhLZj80ZGaIUfonjH8=;
 b=X2PyoMKfgLhUNztyS4L8quH6/rG7Y+XUtCuNfkKa62qaabVILjJSzhORPSCgK0eKbU
 wADHL2YI7aKe2DFQgNT9cVmo1ftNULMiMvGQUYOULCnSquJBsjH4s0TzeusWdDhw9oWS
 eH+wwsNNr21AhQJRb+e/ng2d8ksBJeqjojhgw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709076731; x=1709681531;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=80vE8I00zUuMjb98bapG9u6P0XhLZj80ZGaIUfonjH8=;
 b=oe0t3W1uraizOZKsJJ20nbCCd5yiSb/0Qw4H2lBK2e1ofgvbJNrWknQfzQatXx0K2X
 0pACsLZD10IwZ+ejEO+r7baS9yqmiVGIaGwqkh3U/esy8tIvLAXxEgKypG5wATgH3seN
 wYwngKf79G1ypdX4r8FuFQB2lmoj7hRz6w8ttASYax9ajAn1z6cz0TkEvUqItyGxV2dp
 +JZYAIwKnhxidQFoluB6ESFlcgRwFQ/UfTn/oZRKzj/KRwUXqu+7BO4zoCEAJc366Yjl
 ijb1SLltTUBhsSoSu92I1OcHwzi7f/BhW4VdD20Wf1FjTIlw1MRmODr74+Rs7FQHh+4U
 gxhA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVl96Y3HWraZma1DCflJDZNhLYoWoGgnJjJz/08kdEFybU7fOo1c/pJzLKj9ss/pghjCkOR3svRtzMAljVc3nAVBQAdTQgyicyE+SgHpY/v
X-Gm-Message-State: AOJu0YyRWzSCjv2FONkyOjkilx7rbVr549eMfmBpPhWdYZ5IUzsEzHva
 5R7Vj3qXa+eHClCbsFhemP35IPqov/6O7gt8kq/CGHX2Y+/KtUe8qGAcuORRblo=
X-Google-Smtp-Source: AGHT+IG69oUodDQLtj9TB2lWzXOa+NfkxOjVRrZm5njOmm/xNqu/JAHdlHJH3zfk/5jCzDJ8f9tmVg==
X-Received: by 2002:a05:6602:2195:b0:7c7:ce93:f532 with SMTP id
 b21-20020a056602219500b007c7ce93f532mr5798424iob.1.1709076731281; 
 Tue, 27 Feb 2024 15:32:11 -0800 (PST)
Received: from [192.168.1.128] ([38.175.170.29])
 by smtp.gmail.com with ESMTPSA id
 s20-20020a6bd314000000b007c45ab3dc34sm1998648iob.29.2024.02.27.15.32.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 27 Feb 2024 15:32:10 -0800 (PST)
Message-ID: <fd438c6c-87a2-4976-aee1-b706212914c4@linuxfoundation.org>
Date: Tue, 27 Feb 2024 16:32:09 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/9] kunit: Fix printf format specifier issues in KUnit
 assertions
Content-Language: en-US
To: David Gow <davidgow@google.com>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Guenter Roeck <linux@roeck-us.net>, Rae Moar <rmoar@google.com>,
 Matthew Auld <matthew.auld@intel.com>,
 Arunpravin Paneer Selvam <arunpravin.paneerselvam@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Kees Cook <keescook@chromium.org>, =?UTF-8?Q?Ma=C3=ADra_Canal?=
 <mcanal@igalia.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Willem de Bruijn <willemb@google.com>, Florian Westphal <fw@strlen.de>,
 Cassio Neri <cassio.neri@gmail.com>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Arthur Grillo <arthur.grillo@usp.br>
Cc: Brendan Higgins <brendan.higgins@linux.dev>,
 Daniel Latypov <dlatypov@google.com>, Stephen Boyd <sboyd@kernel.org>,
 David Airlie <airlied@gmail.com>, Maxime Ripard <mripard@kernel.org>,
 "David S . Miller" <davem@davemloft.net>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, intel-xe@lists.freedesktop.org,
 linux-rtc@vger.kernel.org, linux-kselftest@vger.kernel.org,
 kunit-dev@googlegroups.com, linux-hardening@vger.kernel.org,
 netdev@vger.kernel.org, Shuah Khan <skhan@linuxfoundation.org>
References: <20240221092728.1281499-1-davidgow@google.com>
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <20240221092728.1281499-1-davidgow@google.com>
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

On 2/21/24 02:27, David Gow wrote:
> KUnit has several macros which accept a log message, which can contain
> printf format specifiers. Some of these (the explicit log macros)
> already use the __printf() gcc attribute to ensure the format specifiers
> are valid, but those which could fail the test, and hence used
> __kunit_do_failed_assertion() behind the scenes, did not.
> 
> These include:
> - KUNIT_EXPECT_*_MSG()
> - KUNIT_ASSERT_*_MSG()
> - KUNIT_FAIL()
> 
> This series adds the __printf() attribute, and fixes all of the issues
> uncovered. (Or, at least, all of those I could find with an x86_64
> allyesconfig, and the default KUnit config on a number of other
> architectures. Please test!)
> 
> The issues in question basically take the following forms:
> - int / long / long long confusion: typically a type being updated, but
>    the format string not.
> - Use of integer format specifiers (%d/%u/%li/etc) for types like size_t
>    or pointer differences (technically ptrdiff_t), which would only work
>    on some architectures.
> - Use of integer format specifiers in combination with PTR_ERR(), where
>    %pe would make more sense.
> - Use of empty messages which, whilst technically not incorrect, are not
>    useful and trigger a gcc warning.
> 
> We'd like to get these (or equivalent) in for 6.9 if possible, so please
> do take a look if possible.
> 
> Thanks,
> -- David
> 
> Reported-by: Linus Torvalds <torvalds@linux-foundation.org>
> Closes: https://lore.kernel.org/linux-kselftest/CAHk-=wgJMOquDO5f8ShH1f4rzZwzApNVCw643m5-Yj+BfsFstA@mail.gmail.com/
> 
> David Gow (9):
>    kunit: test: Log the correct filter string in executor_test
>    lib/cmdline: Fix an invalid format specifier in an assertion msg
>    lib: memcpy_kunit: Fix an invalid format specifier in an assertion msg
>    time: test: Fix incorrect format specifier
>    rtc: test: Fix invalid format specifier.
>    net: test: Fix printf format specifier in skb_segment kunit test
>    drm: tests: Fix invalid printf format specifiers in KUnit tests
>    drm/xe/tests: Fix printf format specifiers in xe_migrate test
>    kunit: Annotate _MSG assertion variants with gnu printf specifiers
> 

Applied all patches in this series except to linux-ksefltest kunit
for linux 6.9-rc1

drm: tests: Fix invalid printf format specifiers in KUnit tests

David, as requtested in 7/9 thread, if you can send me patch on
top pf 6.8-rc6, will apply it

7-9 drm: tests: Fix invalid printf format specifiers in KUnit tests

thanks,
-- Shuah


