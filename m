Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E8FA05760B8
	for <lists+dri-devel@lfdr.de>; Fri, 15 Jul 2022 13:43:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4EEF312AE44;
	Fri, 15 Jul 2022 11:43:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x2a.google.com (mail-oa1-x2a.google.com
 [IPv6:2001:4860:4864:20::2a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF29C11A42C
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Jul 2022 11:43:13 +0000 (UTC)
Received: by mail-oa1-x2a.google.com with SMTP id
 586e51a60fabf-10bec750eedso5877497fac.8
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Jul 2022 04:43:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=usp.br; s=usp-google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=VQI+n5ZVexq/RFQtI9uTeCBYc9Q8ptTIuUXze5tj8Kk=;
 b=uZGvy+WcHMyYVjCAleBI4P+bCDSsNwSmTD9uDqJfTlJZz91e04FQ09gTeV6bl9KAYc
 LbPfGGF2CE+5ipsiGFGyAMKjQ/jolT0xAYXhfatc+uv/Vof3YQQncGpJQXIqAcj8u6SE
 K9R2XwIZItbdjoRhs3pC0rlt272PcbQc2bFrSJvhd9YamEY2M1FqxX+iRUpFMSjoA2Oz
 6R4Gyk6dVKYrkLS6N/ePpQVEAot9E0g5KpFuQfkxMckUCN/qF1iv06O7ph3Mf+C1109x
 Jmq4Uj8xZwr6/f6Q1tzSjqKU3GSwcbXqyWIeWBnXtcxx51bewl7OAKpc8VN1v7QOhvFJ
 gm0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=VQI+n5ZVexq/RFQtI9uTeCBYc9Q8ptTIuUXze5tj8Kk=;
 b=r+Cvfkpfhplwt12qspx29qssxg0/fjWBWLFGINBzYfkyz5JKft3B/L9IAVW4txxlwF
 BIQ/QcEPOkgef8cBGacU+GIWEXNofPn5xiKkalsroCXFf38MpPoMB5sBkF0Uch2jZz0b
 unQVP0OW6P/mvoQBMfRA2IeU+U3IihEywusXL/mlmGD5S5JORPfi5gcgxrjx6pqWPQCf
 stuVhAGyHFOR8SodLz69iLHHM4SNmRBiVCnRye6mbqp3uIowDjiwX1jUflXKVAVhwidK
 gwlT2AXqydqvWeetIP4kuCDrp3meOmBfc6YqTSmAUw79+HwKBbPHAHQC/bWBYxZbD1X5
 8X4g==
X-Gm-Message-State: AJIora9NeKCkrJbOuLxNtvZVBg47P78cykby6WLwGkeOUsTEy91CbPpn
 WOwjJVPH0Z9vujD8MdbDOcS/RA==
X-Google-Smtp-Source: AGRyM1v1cEuvsOrEB1NGvZu3qaCyx+3hVDMt28UI411gif+IDxpkN5hrzgkEzpAQ7jhWf5EFqpP44Q==
X-Received: by 2002:a05:6870:b148:b0:101:a001:77f with SMTP id
 a8-20020a056870b14800b00101a001077fmr7612760oal.90.1657885392547; 
 Fri, 15 Jul 2022 04:43:12 -0700 (PDT)
Received: from [192.168.1.195] ([187.36.234.139])
 by smtp.gmail.com with ESMTPSA id
 r41-20020a056870582900b00108b31bf8fbsm2233890oap.53.2022.07.15.04.43.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 15 Jul 2022 04:43:12 -0700 (PDT)
Message-ID: <df984423-a751-2251-e392-840675da31e5@usp.br>
Date: Fri, 15 Jul 2022 08:43:02 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v5 4/9] drm: selftest: convert drm_format selftest to KUnit
Content-Language: en-US
To: Javier Martinez Canillas <javierm@redhat.com>,
 Daniel Latypov <dlatypov@google.com>, Guenter Roeck <linux@roeck-us.net>
References: <20220708203052.236290-1-maira.canal@usp.br>
 <20220708203052.236290-5-maira.canal@usp.br>
 <20220714235137.GA485839@roeck-us.net>
 <CAGS_qxrhy3=pST9f85fvxubKQShOq1XF6ZHALzMhXDOf5gnaUg@mail.gmail.com>
 <5f9b35b4-09fa-a8a9-3181-cd8cd7898d03@redhat.com>
From: =?UTF-8?Q?Ma=c3=adra_Canal?= <maira.canal@usp.br>
In-Reply-To: <5f9b35b4-09fa-a8a9-3181-cd8cd7898d03@redhat.com>
Content-Type: text/plain; charset=UTF-8
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
Cc: siqueirajordao@riseup.net, David Airlie <airlied@linux.ie>,
 brendanhiggins@google.com, dri-devel@lists.freedesktop.org,
 linux-kselftest@vger.kernel.org, n@nfraprado.net,
 Isabella Basso <isabbasso@riseup.net>, andrealmeid@riseup.net,
 magalilemes00@gmail.com, mwen@igalia.com, David Gow <davidgow@google.com>,
 Shuah Khan <skhan@linuxfoundation.org>, kunit-dev@googlegroups.com,
 michal.winiarski@intel.com, tales.aparecida@gmail.com,
 linux-kernel@vger.kernel.org, leandro.ribeiro@collabora.com,
 Thomas Zimmermann <tzimmermann@suse.de>,
 =?UTF-8?B?Sm9zw6kgRXhww7NzaXRv?= <jose.exposito89@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 7/15/22 03:59, Javier Martinez Canillas wrote:
> On 7/15/22 02:03, Daniel Latypov wrote:
>> On Thu, Jul 14, 2022 at 4:51 PM Guenter Roeck <linux@roeck-us.net> wrote:
>>>
>>> On Fri, Jul 08, 2022 at 05:30:47PM -0300, Maíra Canal wrote:
>>>> Considering the current adoption of the KUnit framework, convert the
>>>> DRM format selftest to the KUnit API.
>>>>
>>>> Tested-by: David Gow <davidgow@google.com>
>>>> Acked-by: Daniel Latypov <dlatypov@google.com>
>>>> Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
>>>> Signed-off-by: Maíra Canal <maira.canal@usp.br>
>>>
>>> This patch results in:
>>>
>>> Building powerpc:allmodconfig ... failed
>>> --------------
>>> Error log:
>>> drivers/gpu/drm/tests/drm_format_test.c: In function 'igt_check_drm_format_min_pitch':
>>> drivers/gpu/drm/tests/drm_format_test.c:271:1: error: the frame size of 3712 bytes is larger than 2048 bytes
>>>
>>> presumably due to function nesting.
>>
>> This can happen when there's a lot of KUNIT_EXPECT_* calls in a single function.
>> See [1] for some related context.
>> There were a number of patches that went into 5.18 ([2] and others) to
>> try and mitigate this, but it's not always enough.
>>
>> Ideally the compiler would see that the stack-local variables used in
>> these macros don't need to stick around, but it doesn't always
>> happen...
> 
> Thanks Daniel for the explanation.
> 
>> One workaround would be to split up the test case functions into smaller chunks.
>>
> 
> Maíra,
> 
> Could you please look at splitting in smaller chunks to mitigate this issue ?

I'll look into this during the weekend. Thanks Guenter for the report.

Best Regards,
- Maíra Canal

> 
