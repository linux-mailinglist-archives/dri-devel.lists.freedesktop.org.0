Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B14D86CC59
	for <lists+dri-devel@lfdr.de>; Thu, 29 Feb 2024 16:07:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 37A9010E2B6;
	Thu, 29 Feb 2024 15:07:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="b8CuipEh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-f179.google.com (mail-il1-f179.google.com
 [209.85.166.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3056210E2A5
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Feb 2024 15:07:13 +0000 (UTC)
Received: by mail-il1-f179.google.com with SMTP id
 e9e14a558f8ab-3651ee59db4so1056715ab.0
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Feb 2024 07:07:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linuxfoundation.org; s=google; t=1709219232; x=1709824032;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=lUr9WwPm1bDr07bGVGyHcZBKICuYFoD9+zTSPH1u+LA=;
 b=b8CuipEhvdn9EtWYpsNHxcdK4DlpeE/4JjmiljMhkN/0OyVZ9zlH6PttP7YhD5hC05
 1U/T/thj9/Ysx+1elnTV0h5NnCqSipzitEyAS1BwGkLpYTf/kBCC9m7zHAaVZNhZ7agq
 Gtr84YPIjH96yxOXy9gRNPsqMifkV4R8T3aLU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709219232; x=1709824032;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=lUr9WwPm1bDr07bGVGyHcZBKICuYFoD9+zTSPH1u+LA=;
 b=F7K4Ob8S8lQVsM5GvsBNY5I1Qi+LpVFH2ecAC8DLSpTk0hFRUtS4XH080AngiCsfRE
 nIWootKSKwPSlrp1x5aXINpuEu23o6EP92EW+OIbLsPcrCZ36EOwqmTGTrTISz55DP/V
 eb5LXydfemEyuyePoZWFZNyjIP3Scvhh8Tko2HT8y6uVPFaZWo/WV+yBnxhg+R2Zk2mx
 kjLLaZ+iGftmo/qisDi0okzO89yuX0SCjNDCzXaDy0Sg/qvd2v/j8gnO92W6NPNNB9Pt
 owpU03VPbLg/qWx4pYv4AfYDypVrZum9XIhKGYeKlx1i1UqiJSSEjeARbc5AeWJ7VB8r
 VXag==
X-Forwarded-Encrypted: i=1;
 AJvYcCU970lEqws5SKDvGZxFKdOpuNTF3Pmis+XGbhtA1WIfkXBhCM8n43r2uLGiF5/7z7UJIMw5NfkGiBec+QmJKB/EspvOu1+4G7Ku75sM3Upz
X-Gm-Message-State: AOJu0Yybc2JnITZrUDtsNz3Oe7fFD6pUVvyRk4/uaGMIy2nPYo3pY3bm
 k56TEZMVnBl3lmHWWK1wVMV6GLlA8BSl4JWUg2lrNNb0yi7i7WWK+B+MKx571y4=
X-Google-Smtp-Source: AGHT+IGnBv7cnuB5+Ygx0Spp8dOixJyI7HqA7kTIXE4S9xFxwubQmYW37F+sI4cGzNH5Sqb9chjpgg==
X-Received: by 2002:a05:6e02:1a27:b0:365:2bd4:2f74 with SMTP id
 g7-20020a056e021a2700b003652bd42f74mr2811151ile.0.1709219232030; 
 Thu, 29 Feb 2024 07:07:12 -0800 (PST)
Received: from [192.168.1.128] ([38.175.170.29])
 by smtp.gmail.com with ESMTPSA id
 m15-20020a02c88f000000b004745b40ba6fsm346477jao.164.2024.02.29.07.07.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 29 Feb 2024 07:07:11 -0800 (PST)
Message-ID: <be2e812c-3898-4be8-8a9d-e221acb837c3@linuxfoundation.org>
Date: Thu, 29 Feb 2024 08:07:10 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: linux-next: build failure after merge of the kunit-next tree
To: Stephen Rothwell <sfr@canb.auug.org.au>,
 Brendan Higgins <brendanhiggins@google.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: Intel Graphics <intel-gfx@lists.freedesktop.org>,
 DRI <dri-devel@lists.freedesktop.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Matthew Auld <matthew.auld@intel.com>, David Gow <davidgow@google.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Shuah Khan <skhan@linuxfoundation.org>
References: <20240229152653.09ecf771@canb.auug.org.au>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <20240229152653.09ecf771@canb.auug.org.au>
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

Hi Stephen,

On 2/28/24 21:26, Stephen Rothwell wrote:
> Hi all,
> 
> After merging the kunit-next tree, today's linux-next build (x86_64
> allmodconfig) failed like this:
> 
> In file included from drivers/gpu/drm/tests/drm_buddy_test.c:7:
> drivers/gpu/drm/tests/drm_buddy_test.c: In function 'drm_test_buddy_alloc_range_bias':
> drivers/gpu/drm/tests/drm_buddy_test.c:191:40: error: format '%u' expects a matching 'unsigned int' argument [-Werror=format=]
>    191 |                                        "buddy_alloc failed with bias(%x-%x), size=%u, ps=%u\n",
>        |                                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> include/kunit/test.h:597:37: note: in definition of macro '_KUNIT_FAILED'
>    597 |                                     fmt,                                       \
>        |                                     ^~~
> include/kunit/test.h:662:9: note: in expansion of macro 'KUNIT_UNARY_ASSERTION'
>    662 |         KUNIT_UNARY_ASSERTION(test,                                            \
>        |         ^~~~~~~~~~~~~~~~~~~~~
> include/kunit/test.h:1233:9: note: in expansion of macro 'KUNIT_FALSE_MSG_ASSERTION'
>   1233 |         KUNIT_FALSE_MSG_ASSERTION(test,                                        \
>        |         ^~~~~~~~~~~~~~~~~~~~~~~~~
> drivers/gpu/drm/tests/drm_buddy_test.c:186:17: note: in expansion of macro 'KUNIT_ASSERT_FALSE_MSG'
>    186 |                 KUNIT_ASSERT_FALSE_MSG(test,
>        |                 ^~~~~~~~~~~~~~~~~~~~~~
> drivers/gpu/drm/tests/drm_buddy_test.c:191:91: note: format string is defined here
>    191 |                                        "buddy_alloc failed with bias(%x-%x), size=%u, ps=%u\n",
>        |                                                                                          ~^
>        |                                                                                           |
>        |                                                                                           unsigned int
> cc1: all warnings being treated as errors
> 
> Caused by commit
> 
>    806cb2270237 ("kunit: Annotate _MSG assertion variants with gnu printf specifiers")
> 

Thank you. I did allmodconfig build on kselftest kunit branch to make
sure all is well, before I pushed the commits.

> interacting with commit
> 
>    c70703320e55 ("drm/tests/drm_buddy: add alloc_range_bias test")
  > 
> from the drm-misc-fixes tree.
> 
> I have applied the following patch for today (this should probably
> actually be fixed in the drm-misc-fixes tree).
> 

Danial, David,

I can carry the fix through kselftest kunit if it works
for all.

> From: Stephen Rothwell <sfr@canb.auug.org.au>
> Date: Thu, 29 Feb 2024 15:18:36 +1100
> Subject: [PATCH] fix up for "drm/tests/drm_buddy: add alloc_range_bias test"
> 
> Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
> ---
>   drivers/gpu/drm/tests/drm_buddy_test.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/tests/drm_buddy_test.c b/drivers/gpu/drm/tests/drm_buddy_test.c
> index 1e73e3f0d278..369edf587b44 100644
> --- a/drivers/gpu/drm/tests/drm_buddy_test.c
> +++ b/drivers/gpu/drm/tests/drm_buddy_test.c
> @@ -188,7 +188,7 @@ static void drm_test_buddy_alloc_range_bias(struct kunit *test)
>   							      bias_end, size, ps,
>   							      &allocated,
>   							      DRM_BUDDY_RANGE_ALLOCATION),
> -				       "buddy_alloc failed with bias(%x-%x), size=%u, ps=%u\n",
> +				       "buddy_alloc failed with bias(%x-%x), size=%u\n",
>   				       bias_start, bias_end, size);
>   		bias_rem -= size;
>   

thanks,
-- Shuah
