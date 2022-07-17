Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1529A577796
	for <lists+dri-devel@lfdr.de>; Sun, 17 Jul 2022 19:48:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 66BB69148D;
	Sun, 17 Jul 2022 17:48:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x35.google.com (mail-oa1-x35.google.com
 [IPv6:2001:4860:4864:20::35])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3912F91489
 for <dri-devel@lists.freedesktop.org>; Sun, 17 Jul 2022 17:48:16 +0000 (UTC)
Received: by mail-oa1-x35.google.com with SMTP id
 586e51a60fabf-10bec750eedso18645528fac.8
 for <dri-devel@lists.freedesktop.org>; Sun, 17 Jul 2022 10:48:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=usp.br; s=usp-google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=wWo5nfiIszKM/pVy4I94cp8djYzE87GUS1z1+3Dj3X8=;
 b=saLG7Jfv/cpv45n+vut19GSIYCg0J4XcllVl0Aam+FMQb5sH5WDf/oZLHiJNqHixjZ
 ZZnTfYb2Hd5kBPab1/jtADZ9c+D5U9MuLSLVEc2VvkbWMsQ1wpldAj0rgGiLfKbsIfuI
 ilvDi6vtACVJ52c+rXIEEkQ7lJAKn/GP/oXoaxMU5wgT9ys2j3Y8FZ52sB+3db2fHGR0
 ssQ5PK1WKyH1pjuczTuP0UDSIp4/8LpF/bnWiAjuYhIAhGEoQKTknIFKukoY/OrSweo/
 ilSHXU4ccKOKQA0+tkx3/kVrglt2HndWhkm12mrJvsb/CBD5FIJeysiM651RUk/K+YPn
 SHjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=wWo5nfiIszKM/pVy4I94cp8djYzE87GUS1z1+3Dj3X8=;
 b=kX96TlsUVGTyPymRoH0mKWHPW5Dz9Jwk/Zo8PshsXDrF7QhTSoJNOrhWahOusagkSU
 SlLbAwrrXkYQVkK2WkxPqQsTK9Wo3gxYLnRNjekuDnOqNcRAeW1TwfJ0/SoT8o1Jf4eH
 t0aq083OBF7z0Yae72hKIBiOoBufpciEqE871TA3Du2UIV1CQCutSACIxSksKPMxpCBB
 WXTfOL8fPnHynV15+iQDXCoyH0O+Ivip9xnH0gqY/W2Dvdrkuh2/KTNHBol4J6eUXBvv
 4Zla2YQHDYmklQVGsgQPgGYC+oGbqWB9Pz70hhbDA0olBGigD4CnAuS27OUJNMmYc3DO
 EEjg==
X-Gm-Message-State: AJIora+XcM0CHO3T3LELeH9OlU1mSHgJhO8kwtBUDy2ArlSjPKNxo05c
 DGkT80JPuz3QDUJo6Y9YLEeEpQ==
X-Google-Smtp-Source: AGRyM1sQBNoOS0lLk6GPha7ctC/wcB/G6Pai9TruWEuZD5rTUvN3LQo6MebMZgKUkaJTNbl4nz6TvQ==
X-Received: by 2002:a05:6871:b0d:b0:10c:10bf:1276 with SMTP id
 fq13-20020a0568710b0d00b0010c10bf1276mr12608104oab.185.1658080095178; 
 Sun, 17 Jul 2022 10:48:15 -0700 (PDT)
Received: from [192.168.1.195] ([187.36.234.139])
 by smtp.gmail.com with ESMTPSA id
 x27-20020a9d459b000000b0061c68a35fdfsm2470857ote.9.2022.07.17.10.48.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 17 Jul 2022 10:48:14 -0700 (PDT)
Message-ID: <99aedd6c-0254-9712-a7d7-d94c0be31086@usp.br>
Date: Sun, 17 Jul 2022 14:48:04 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v5 4/9] drm: selftest: convert drm_format selftest to KUnit
Content-Language: en-US
To: Daniel Latypov <dlatypov@google.com>, Guenter Roeck <linux@roeck-us.net>
References: <20220708203052.236290-1-maira.canal@usp.br>
 <20220708203052.236290-5-maira.canal@usp.br>
 <20220714235137.GA485839@roeck-us.net>
 <CAGS_qxrhy3=pST9f85fvxubKQShOq1XF6ZHALzMhXDOf5gnaUg@mail.gmail.com>
From: =?UTF-8?Q?Ma=c3=adra_Canal?= <maira.canal@usp.br>
In-Reply-To: <CAGS_qxrhy3=pST9f85fvxubKQShOq1XF6ZHALzMhXDOf5gnaUg@mail.gmail.com>
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
 magalilemes00@gmail.com, Javier Martinez Canillas <javierm@redhat.com>,
 mwen@igalia.com, David Gow <davidgow@google.com>,
 Shuah Khan <skhan@linuxfoundation.org>, kunit-dev@googlegroups.com,
 michal.winiarski@intel.com, tales.aparecida@gmail.com,
 linux-kernel@vger.kernel.org, leandro.ribeiro@collabora.com,
 Thomas Zimmermann <tzimmermann@suse.de>,
 =?UTF-8?B?Sm9zw6kgRXhww7NzaXRv?= <jose.exposito89@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 7/14/22 21:03, Daniel Latypov wrote:
> On Thu, Jul 14, 2022 at 4:51 PM Guenter Roeck <linux@roeck-us.net> wrote:
>>
>> On Fri, Jul 08, 2022 at 05:30:47PM -0300, Maíra Canal wrote:
>>> Considering the current adoption of the KUnit framework, convert the
>>> DRM format selftest to the KUnit API.
>>>
>>> Tested-by: David Gow <davidgow@google.com>
>>> Acked-by: Daniel Latypov <dlatypov@google.com>
>>> Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
>>> Signed-off-by: Maíra Canal <maira.canal@usp.br>
>>
>> This patch results in:
>>
>> Building powerpc:allmodconfig ... failed
>> --------------
>> Error log:
>> drivers/gpu/drm/tests/drm_format_test.c: In function 'igt_check_drm_format_min_pitch':
>> drivers/gpu/drm/tests/drm_format_test.c:271:1: error: the frame size of 3712 bytes is larger than 2048 bytes
>>
>> presumably due to function nesting.
> 
> This can happen when there's a lot of KUNIT_EXPECT_* calls in a single function.
> See [1] for some related context.
> There were a number of patches that went into 5.18 ([2] and others) to
> try and mitigate this, but it's not always enough.
> 
> Ideally the compiler would see that the stack-local variables used in
> these macros don't need to stick around, but it doesn't always
> happen...

As a matter of fact, for GCC 12, the warning -Wframe-larger-than=
doesn't show up due to compiler improvement, but for GCC 11.3, it does.

As I have GCC 12 on my machine, I didn't even get the warning.

Anyway, I'll separate the test into multiple functions to avoid any
problems related to stack size.

Best Regards,
- Maíra Canal

> One workaround would be to split up the test case functions into smaller chunks.
> 
> [1] https://lore.kernel.org/linux-kselftest/20210929212713.1213476-1-brendanhiggins@google.com/
> [2] https://lore.kernel.org/linux-kselftest/20220113165931.451305-1-dlatypov@google.com/
> 
> Daniel
