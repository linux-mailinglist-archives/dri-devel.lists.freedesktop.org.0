Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 37AC469407E
	for <lists+dri-devel@lfdr.de>; Mon, 13 Feb 2023 10:14:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC93410E4FB;
	Mon, 13 Feb 2023 09:14:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E49510E510;
 Mon, 13 Feb 2023 09:14:52 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id m14so11343081wrg.13;
 Mon, 13 Feb 2023 01:14:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=D0Zxk9nlGibG/+2xr84KCXIYQirPbNBqFNHwNX/j4MI=;
 b=dptk+QMfkriyZws1xoVXnRyDeqjdPmOca2BdGPx0pDsafOrpFNaXkT/lJD7PeErW9i
 sc0U9vMqp0pOsn1LTpuj9/RSCddKKctubYGbMOAFCwxAFaV9E2cRMDZxmypnygSaiNf7
 XviuGYlSR8O5lkgpcfaFH9sZXK4vg9zQFc+cvU60IR4q8vpzkHdyIJuYSPX3eBW4pcJk
 zGj84JnHlisy7tlWg5QjxXcNBzMlToEIsK8S+zG+ZZX3MbNHL+7SLwxQWoaKWQhw41Dm
 42bHnuYOzbwTwW5Ffspu9DLsYRuPwGREPdteJCt0ohfFHuRhNB0CW2EmPb14RuoIMQt8
 RWlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=D0Zxk9nlGibG/+2xr84KCXIYQirPbNBqFNHwNX/j4MI=;
 b=RilX+wEGeoQtpzjnQLd4t7LO7S9BEh7uzrve+17cRVuO1z5S3r2Fk0LbhcDU8y1EqW
 8YGcgEPzOIBHRq2LcFhvEXwUeM8u6Rh4LTJ5rhK54nSAhtJWHtDImyEPZghy1988mmD7
 ejpqKtuiF0igLTQbVklXmeoxSQU7r2s3mAe7b7u0fZ+TDSs9qdA97jlbS695P3joiOCA
 yVmcTF078aaKEKaAflQHWtcRC4wwzB6P7zNCmtb2RAI01ijKHmeZ+7rEEDSEj4SIHh5S
 BnILay9iIqrlZHztV/T12M2aGEfn0vaSqKVhyiEHBherkcFDTGOK2wbO0VZOtKrRRu5H
 lxmg==
X-Gm-Message-State: AO0yUKWsYWhEYTa/kHv1+LJpCpSyfXMSPFeDvIpZIqmmPY71KMEBCnqP
 WFzCZFfm9JSOKK7jTKqXwKFSq/VypsuSLA==
X-Google-Smtp-Source: AK7set+MFO189SjOPO9EioJwc4mDcWfoO7PkSuUi7yW7G2UAmspopBZ46DUZE4wO5fFZU2qmPXZ44w==
X-Received: by 2002:a5d:488b:0:b0:2c3:daf1:ec3 with SMTP id
 g11-20020a5d488b000000b002c3daf10ec3mr21529700wrq.61.1676279690626; 
 Mon, 13 Feb 2023 01:14:50 -0800 (PST)
Received: from [192.168.1.10] (97e09f27.skybroadband.com. [151.224.159.39])
 by smtp.googlemail.com with ESMTPSA id
 i8-20020a5d4388000000b002c5493a17efsm7983696wrq.25.2023.02.13.01.14.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Feb 2023 01:14:50 -0800 (PST)
Message-ID: <4e786e22-f17a-da76-5129-8fef0c7c825a@googlemail.com>
Date: Mon, 13 Feb 2023 09:14:49 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
Subject: Re: linux-6.2-rc4+ hangs on poweroff/reboot: Bisected
To: Dave Airlie <airlied@gmail.com>
References: <b64705e3-2e63-a466-f829-f9568b06766a@googlemail.com>
 <b21fa1f6-a71d-5657-8596-ee0be73185ea@leemhuis.info>
 <3ab28896-70e9-6f90-5b97-e5397b06e715@googlemail.com>
 <a163dd7b-c5d1-a07b-a816-7a2dfd3edfd4@leemhuis.info>
 <ab1b0f73-6b4e-8602-2999-b7bec25d92db@googlemail.com>
 <CACAvsv4sOtPjCVnEcKd2RCUqYWxSn5XKyksbS-Bds2qCqyusVw@mail.gmail.com>
 <1cdb84ac-f7a8-66ba-98fc-3db302b49a5a@googlemail.com>
 <dab6eb81-db3f-8fa1-84ad-9b40e209514b@googlemail.com>
 <CACAvsv5iYdF3P8AbyrbYo3zGmYRYhxDWn7WbAR5V9qHpbgBXRA@mail.gmail.com>
 <1632a9ef-2954-c8f0-cdc9-03157c9d8547@googlemail.com>
 <5abbee70-cc84-1528-c3d8-9befd9edd611@googlemail.com>
 <5cf46df8-0fa2-e9f5-aa8e-7f7f703d96dd@googlemail.com>
 <f72fe15b-db1d-56dd-aaf6-3cba68a8bf0a@leemhuis.info>
 <CACO55tvR4ydDOXt=9nbR3n2aFLKrj8zeuGRR_xpezVQBBLrjqg@mail.gmail.com>
 <a6188878-f84c-0fcc-9509-b9d7ab797f4c@leemhuis.info>
 <d031f0a5-8d5e-af51-6db6-11844de3eeba@googlemail.com>
 <CAPM=9tz+wksJTvMi_4Ef7XWezfH0ReN2se189s8Q=obJjHC+Fw@mail.gmail.com>
Content-Language: en-GB
From: Chris Clayton <chris2553@googlemail.com>
In-Reply-To: <CAPM=9tz+wksJTvMi_4Ef7XWezfH0ReN2se189s8Q=obJjHC+Fw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
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
Cc: Linux regressions mailing list <regressions@lists.linux.dev>,
 Karol Herbst <kherbst@redhat.com>, ML nouveau <nouveau@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>,
 ML dri-devel <dri-devel@lists.freedesktop.org>, bskeggs@redhat.com,
 Ben Skeggs <skeggsb@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 13/02/2023 02:57, Dave Airlie wrote:
> On Sun, 12 Feb 2023 at 00:43, Chris Clayton <chris2553@googlemail.com> wrote:
>>
>>
>>
>> On 10/02/2023 19:33, Linux regression tracking (Thorsten Leemhuis) wrote:
>>> On 10.02.23 20:01, Karol Herbst wrote:
>>>> On Fri, Feb 10, 2023 at 7:35 PM Linux regression tracking (Thorsten
>>>> Leemhuis) <regressions@leemhuis.info> wrote:
>>>>>
>>>>> On 08.02.23 09:48, Chris Clayton wrote:
>>>>>>
>>>>>> I'm assuming  that we are not going to see a fix for this regression before 6.2 is released.
>>>>>
>>>>> Yeah, looks like it. That's unfortunate, but happens. But there is still
>>>>> time to fix it and there is one thing I wonder:
>>>>>
>>>>> Did any of the nouveau developers look at the netconsole captures Chris
>>>>> posted more than a week ago to check if they somehow help to track down
>>>>> the root of this problem?
>>>>
>>>> I did now and I can't spot anything. I think at this point it would
>>>> make sense to dump the active tasks/threads via sqsrq keys to see if
>>>> any is in a weird state preventing the machine from shutting down.
>>>
>>> Many thx for looking into it!
>>
>> Yes, thanks Karol.
>>
>> Attached is the output from dmesg when this block of code:
>>
>>         /bin/mount /dev/sda7 /mnt/sda7
>>         /bin/mountpoint /proc || /bin/mount /proc
>>         /bin/dmesg -w > /mnt/sda7/sysrq.dmesg.log &
>>         /bin/echo t > /proc/sysrq-trigger
>>         /bin/sleep 1
>>         /bin/sync
>>         /bin/sleep 1
>>         kill $(pidof dmesg)
>>         /bin/umount /mnt/sda7
>>
>> is executed immediately before /sbin/reboot is called as the final step of rebooting my system.
>>
>> I hope this is what you were looking for, but if not, please let me know what you need
> 

Thanks Dave.
> Another ot in the dark, but does nouveau.runpm=0 help at all?
> 
> Dave.
