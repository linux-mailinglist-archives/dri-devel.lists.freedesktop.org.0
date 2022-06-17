Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 42FEC54FE3D
	for <lists+dri-devel@lfdr.de>; Fri, 17 Jun 2022 22:24:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 47C3C10E04F;
	Fri, 17 Jun 2022 20:24:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x233.google.com (mail-oi1-x233.google.com
 [IPv6:2607:f8b0:4864:20::233])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 01BB310E04F
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Jun 2022 20:24:23 +0000 (UTC)
Received: by mail-oi1-x233.google.com with SMTP id v143so6621824oie.13
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Jun 2022 13:24:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=usp.br; s=usp-google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=fcyBDhbFJN4+s7r8qDu1ovBGv1GC9A7K0M1THsn/P8Q=;
 b=n4PmpOC+N/jHZEmfGQL9xYmBgHryKzlPUmYtHPaFkWsniNbtEufmwCG+/YGorhDa4s
 2Cc015oegJdtWODoip3aQXyhtbUsNUPRBvi89uy8W8q3wFspZk3Mj9Aok6L+Y46Hwqjw
 sugQD7Uh/gEXmm/4t5kH1nfciDSixqV3LvrFUZAP+sJ7K8DwMjCPzn7Cp3LOA29x1jEw
 qbsA5n7Jy8DzMlP1SW/huK5opn+IisR0Lru83ui+5VpptMTlr/aRdHC4inwIP89s/Etj
 wg3i1bpdLZ5LoMUYJTgg/T8eaBLArpTmeQxKe1BdiQpS3PyZ6NeC1YiayTYHjtj9H4eN
 6Iaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=fcyBDhbFJN4+s7r8qDu1ovBGv1GC9A7K0M1THsn/P8Q=;
 b=y7n/BpcB5JSrr+bXYXQc+M6mp+BIFcCMz+iiGqU8x6TH5bj2TTPaLBH/OzSgdcSC4A
 YqvzHFD0U1aZHJU5gRibnZO6CGeR8hx1D10h8aF0t1JLWt/1lgY2zknnof1zK08y0dJT
 TUCmdYNeMcw8Dn/TS99rIMEotCVtIVDb3CWdMKXB5eZwm+JSgUaS1pa3vcKSXqUxbb+h
 WQ9lQ0/STGcjM1ewcBVVQMQBUFC2UD9mYuAIeYqimBBz5+m4SSpf3e7xpnZeOnP4nrUS
 J+48S5jAqZU3CV27G8ebZT0Ui3KG9sYpKgtdjaaPrDoazcos+ZBpm1bsRJu7rm5uRKK3
 /aXw==
X-Gm-Message-State: AOAM5309qKilUtF3O2ksML877xmcfgs8vhAraRRrzGaAubUZH2DgTk7K
 6Yg/iJn/iQNvCp2ENO9dFSjuVg==
X-Google-Smtp-Source: ABdhPJwMClEFYUjCawbxuTxVD3teFqaqToNmT4i3fcIhUXBBB6+yn28S/VG+gt2wWwWCUeHsJasskA==
X-Received: by 2002:a05:6808:1202:b0:322:dc37:2c3b with SMTP id
 a2-20020a056808120200b00322dc372c3bmr11470790oil.298.1655497462750; 
 Fri, 17 Jun 2022 13:24:22 -0700 (PDT)
Received: from ?IPV6:2804:14d:8084:84c6:fe26:c42d:aab9:fa8a?
 ([2804:14d:8084:84c6:fe26:c42d:aab9:fa8a])
 by smtp.gmail.com with ESMTPSA id
 m1-20020a4a3901000000b0041bcf7c8414sm3102325ooa.48.2022.06.17.13.24.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 17 Jun 2022 13:24:22 -0700 (PDT)
Message-ID: <44745ed7-18ad-ad7c-fef5-2f0f71d289d1@usp.br>
Date: Fri, 17 Jun 2022 17:24:14 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [RFC 0/3] drm/amd/display: Introduce KUnit to Display Mode Library
Content-Language: en-US
To: David Gow <davidgow@google.com>
References: <20220608010709.272962-1-maira.canal@usp.br>
 <CABVgOSmesj5MGfQrtdWCgXzm1VXRoG0fAMCbkBCAvtqediqAjQ@mail.gmail.com>
 <8b040fb2-7edd-6fd1-864e-ee04115c5b1d@usp.br>
 <CABVgOSmyUC11fwpsH8Y6a_8hCKphyyZj2uYT+dhuRfHT2uonmA@mail.gmail.com>
From: =?UTF-8?Q?Ma=c3=adra_Canal?= <maira.canal@usp.br>
In-Reply-To: <CABVgOSmyUC11fwpsH8Y6a_8hCKphyyZj2uYT+dhuRfHT2uonmA@mail.gmail.com>
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
Cc: Harrison Chiu <harrison.chiu@amd.com>, Daniel Latypov <dlatypov@google.com>,
 Brendan Higgins <brendanhiggins@google.com>, dri-devel@lists.freedesktop.org,
 Isabella Basso <isabbasso@riseup.net>, andrealmeid@riseup.net,
 Jun Lei <jun.lei@amd.com>, magalilemes00@gmail.com,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 Javier Martinez Canillas <javierm@redhat.com>, amd-gfx@lists.freedesktop.org,
 Leo Li <sunpeng.li@amd.com>, mwen@igalia.com,
 Sean Paul <seanpaul@chromium.org>,
 KUnit Development <kunit-dev@googlegroups.com>,
 Mark Yacoub <markyacoub@chromium.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Dmytro Laktyushkin <Dmytro.Laktyushkin@amd.com>,
 Nicholas Choi <Nicholas.Choi@amd.com>, tales.aparecida@gmail.com,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 6/17/22 04:55, David Gow wrote:
> On Fri, Jun 17, 2022 at 6:41 AM Maíra Canal <maira.canal@usp.br> wrote:
>>
>> Hi David,
>>
>> Thank you for your feedback!
>>
>> On 6/16/22 11:39, David Gow wrote:
>>> On Wed, Jun 8, 2022 at 9:08 AM Maíra Canal <maira.canal@usp.br> wrote:
>>
>>>>
>>>> As kunit_test_suites() defines itself as an init_module(), it conflicts with
>>>> the existing one at amdgpu_drv. So, if we use kunit_test_suites(), we won't
>>>> be able to compile the tests as modules and, therefore, won't be able to use
>>>> IGT to run the tests. This problem with kunit_test_suites() was already
>>>> discussed in the KUnit mailing list, as can be seen in [7].
>>>
>>> I'm not sure I fully understand why these tests need to be part of the
>>> amdgpu module, though admittedly I've not played with IGT much. Would
>>> it be possible to compile these tests as separate modules, which could
>>> depend on amdgpu (or maybe include the DML stuff directly), and
>>> therefore not have this conflict? I definitely was able to get these
>>> tests working under kunit_tool (albeit as built-ins) by using
>>> kunit_test_suites(). If each suite were built as a separate module (or
>>> indeed, even if all the tests were in one module, with one list of
>>> suites), then it should be possible to avoid the init_module()
>>> conflict. That'd also make it possible to run these tests without
>>> actually needing the driver to initialise, which seems like it might
>>> require actual hardware(?)
>>
>> Initially, we tried the kunit_test_suites() approach. And it did work pretty well for the kunit_tool (although we didn't test any hardware-specific unit test). But when compiling the test as a module, we would get a linking error, pointing out multiple definitions of 'init_module'/'cleanup_module' at kunit_test_suites().
>>
>> At this point, we thought about a couple of options to resolve this problem:
>> - Add EXPORT_SYMBOL to the functions we would test. But, this doesn't scale pretty well, because it would pollute AMDGPU code as the tests expand.
>> - Take the Thunderbolt path and add the tests to the driver stack.
>>
>> We end up taking the Thunderbolt path as it would be more maintainable.
>>
>> Compiling the tests as a module is essential to make the tests run at IGT, as IGT essentially loads the module, runs it, and parses the output (a very very simplified explanation of what IGT does). IGT is a very known tool for DRI developers, so we believe that IGT support is crucial for this project.
>>
>> If you have any other options on how to make the module compilation viable without using the 'thunderbolt'-style, we would be glad to hear your suggestions.
> 
> As you point out, there are really two separate problems with
> splitting the tests out totally:
> - It's ugly and pollutes the symbol namespace to have EXPORT_SYMBOL()
> everywhere.
> - It's impossible to have multiple init_module() "calls" in the same module.
> 
> The first of these is, I think, the harder to solve generally. (There
> are some ways to mitigate the namespace pollution part of it by either
> hiding the EXPORT_SYMBOL() directives behind #ifdef CONFIG_KUNIT or
> similar, or by using symbol namespaces:
> https://www.kernel.org/doc/html/latest/core-api/symbol-namespaces.html
> -- or both -- but they don't solve the issue entirely.)
> 
> That being said, it's as much a matter of taste as anything, so if
> keeping things in the amdgpu module works well, don't let me stop you.
> Either way should work, and have their own advantages and
> disadvantages.
> 
> The latter is just a quirk of the current KUnit implementation of
> kunit_test_suites(). This multiple-definition issue will go away in
> the not-too-distant future.
> 
> So my suggestion here would be to make sure any changes you make to
> work around the issue with multiple init_module definitions are easy
> to remove. I suspect you could probably significantly simplify the
> whole dml_test.{c,h} bit to just directly export the kunit_suites and
> maybe throw them all in one array to pass to
> __kunit_test_suites_init(). Then, when the improved modules work
> lands, they could be deleted entirely and replaced with one or more
> calls to kunit_test_suite().
> 
>>>
>>> There are two other reasons the 'thunderbolt'-style technique is one
>>> we want to avoid:
>>> 1. It makes it much more difficult to run tests using kunit_tool and
>>> KUnit-based CI tools: these tests would not run automatically, and if
>>> they were built-in as-is, they'd need to be
>>> 2. We're planning to improve module support to replace the
>>> init_module()-based implementation of kunit_test_suites() with one
>>> which won't have these conflicts, so the need for this should be
>>> short-lived.
>>>
>>> If you're curious, an early version of the improved module support can
>>> be found here, though it's out-of-date enough it won't apply or work
>>> as-is:
>>> https://lore.kernel.org/all/101d12fc9250b7a445ff50a9e7a25cd74d0e16eb.camel@codeconstruct.com.au/
>>>
>>> Now, that's unlikely to be ready very soon, but I'd be hesitant to
>>> implement too extensive a system for avoiding kunit_test_suites()
>>> given at some point it should work and we'll need to migrate back to
>>> it.
>>
>> We hope to see in the near future the improved module support from KUnit as it would make the addition of tests much more simple and clean.
>>
>> Could you explain more about what is missing to make this improved module support come upstream?
>>
> 
> Mostly just time and some other priorities. We've taken another look
> at it over the last couple of days, and will try to accelerate getting
> it in within the next couple of kernel releases. (Hopefully sooner
> rather than later.)
Is there anything we can do to make this move faster? As it is our great
interest to make this work in KUnit, maybe I, Isabella, Tales, or Magali
can start work on this feature. We don´t have much knowledge of the
inner workings of KUnit, but if you point out a path, we can try to work
on this task.

Maybe, could we work in the same way as Jeremy?
> 
> Cheers,
> -- David

- Maíra Canal
