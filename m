Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ECD4B69B9F4
	for <lists+dri-devel@lfdr.de>; Sat, 18 Feb 2023 13:22:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B68F10E200;
	Sat, 18 Feb 2023 12:22:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [IPv6:2a00:1450:4864:20::52b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F1FE310E200;
 Sat, 18 Feb 2023 12:22:29 +0000 (UTC)
Received: by mail-ed1-x52b.google.com with SMTP id fd2so2451992edb.2;
 Sat, 18 Feb 2023 04:22:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=vSFhK0gX7xLAjDvAdw5Ub/even+FiWfI7Dc8rnupOLE=;
 b=CnBvEplv2WTtQW0d4GTeBfKkksECcd8nz6dItfyfYbVPba/xmypBoSCaAWqIggDqJW
 CEKF9sMAtqIXLzQUDJcoJy883Exs+OIb7jD7nT3LzDetwrxCeIyCo3IL2dx4Fgkb2nnW
 2615xl5Q70pYsjrmgYgcXifBgSEkFDfmpYExVKT09qxGHxMOFHpxoE/8zQgxdQ37+Z9Z
 uEjLi4NYS3AkdWjW5OBf+738yCyTeagFydqcgyd3p5VaiSsg4TzkdrzHJfuYI9DXbTXw
 O0jal2afwN3LQ/lCkNzNVsh77JZDVHPsgCG8C09T7Wa0Qpva49+67fOXcFCBM9WHBSoi
 aerQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=vSFhK0gX7xLAjDvAdw5Ub/even+FiWfI7Dc8rnupOLE=;
 b=Y9hLyI1d8BvE1qEXlEfc7+Xx7I0CR++IYwHJxxE34riX5st+Z+rOcxmvuWxW8WE6pd
 Fc5Kr3O3Xslil/LcXod1Ua+VuDrS4jNC6l6Iz0a8Pce9bw4qkQvQFEFPIQmXioMoTlB+
 px2rRXQ2C0OpoFmAw0Fb0gPbg+VmVmF03+2ug4WdlcqJB7EPXgMDy9WrGzb3nDjXlkPF
 TQhsk5hETF9g7AkgJSNgqCSw/T04P1FPhFFXKUg0bD1Aam7jgqeg6ZORAJNohgZiGGgN
 VYp7WHdELMzm6FwEKkUGOEq3olx/Gs8T2DhBmHSkF58l9gn9FcfILmRPZrGXW5g1UX1W
 Ca9Q==
X-Gm-Message-State: AO0yUKXFHX31eu8b0A/X5VFaqUjVQ1Pd1J9M+Wkf0tu1ym+dXxLgsafm
 JKuuB9RENcWl+9OZh0jdt7g=
X-Google-Smtp-Source: AK7set8joj7Ao/gmx+ebDbKwbsXBNeMBvonzeqxp071jClpYHAKYIdLsR2ZYh7d/QxWXD4DACj03pA==
X-Received: by 2002:a17:906:8258:b0:8ae:b008:9b5a with SMTP id
 f24-20020a170906825800b008aeb0089b5amr2139465ejx.69.1676722948146; 
 Sat, 18 Feb 2023 04:22:28 -0800 (PST)
Received: from [192.168.1.10] (97e09f27.skybroadband.com. [151.224.159.39])
 by smtp.googlemail.com with ESMTPSA id
 ha13-20020a170906a88d00b008b12823f0f7sm3311971ejb.88.2023.02.18.04.22.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 18 Feb 2023 04:22:27 -0800 (PST)
Message-ID: <181bea6a-e501-f5bd-b002-de7a244a921a@googlemail.com>
Date: Sat, 18 Feb 2023 12:22:25 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: linux-6.2-rc4+ hangs on poweroff/reboot: Bisected
To: Karol Herbst <kherbst@redhat.com>,
 Linux regressions mailing list <regressions@lists.linux.dev>
References: <b64705e3-2e63-a466-f829-f9568b06766a@googlemail.com>
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
 <4e786e22-f17a-da76-5129-8fef0c7c825a@googlemail.com>
 <b829633e-ccc4-7a54-1cad-f29254de1251@leemhuis.info>
 <CACO55tsvM07_6mGU3dCgeji0a6B4JJKSDOOBuCHv2Mw3rYbCHg@mail.gmail.com>
Content-Language: en-GB
From: Chris Clayton <chris2553@googlemail.com>
In-Reply-To: <CACO55tsvM07_6mGU3dCgeji0a6B4JJKSDOOBuCHv2Mw3rYbCHg@mail.gmail.com>
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
Cc: ML nouveau <nouveau@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>,
 ML dri-devel <dri-devel@lists.freedesktop.org>, bskeggs@redhat.com,
 Ben Skeggs <skeggsb@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 15/02/2023 11:09, Karol Herbst wrote:
> On Wed, Feb 15, 2023 at 11:36 AM Linux regression tracking #update
> (Thorsten Leemhuis) <regressions@leemhuis.info> wrote:
>>
>> On 13.02.23 10:14, Chris Clayton wrote:
>>> On 13/02/2023 02:57, Dave Airlie wrote:
>>>> On Sun, 12 Feb 2023 at 00:43, Chris Clayton <chris2553@googlemail.com> wrote:
>>>>>
>>>>>
>>>>>
>>>>> On 10/02/2023 19:33, Linux regression tracking (Thorsten Leemhuis) wrote:
>>>>>> On 10.02.23 20:01, Karol Herbst wrote:
>>>>>>> On Fri, Feb 10, 2023 at 7:35 PM Linux regression tracking (Thorsten
>>>>>>> Leemhuis) <regressions@leemhuis.info> wrote:
>>>>>>>>
>>>>>>>> On 08.02.23 09:48, Chris Clayton wrote:
>>>>>>>>>
>>>>>>>>> I'm assuming  that we are not going to see a fix for this regression before 6.2 is released.
>>>>>>>>
>>>>>>>> Yeah, looks like it. That's unfortunate, but happens. But there is still
>>>>>>>> time to fix it and there is one thing I wonder:
>>>>>>>>
>>>>>>>> Did any of the nouveau developers look at the netconsole captures Chris
>>>>>>>> posted more than a week ago to check if they somehow help to track down
>>>>>>>> the root of this problem?
>>>>>>>
>>>>>>> I did now and I can't spot anything. I think at this point it would
>>>>>>> make sense to dump the active tasks/threads via sqsrq keys to see if
>>>>>>> any is in a weird state preventing the machine from shutting down.
>>>>>>
>>>>>> Many thx for looking into it!
>>>>>
>>>>> Yes, thanks Karol.
>>>>>
>>>>> Attached is the output from dmesg when this block of code:
>>>>>
>>>>>         /bin/mount /dev/sda7 /mnt/sda7
>>>>>         /bin/mountpoint /proc || /bin/mount /proc
>>>>>         /bin/dmesg -w > /mnt/sda7/sysrq.dmesg.log &
>>>>>         /bin/echo t > /proc/sysrq-trigger
>>>>>         /bin/sleep 1
>>>>>         /bin/sync
>>>>>         /bin/sleep 1
>>>>>         kill $(pidof dmesg)
>>>>>         /bin/umount /mnt/sda7
>>>>>
>>>>> is executed immediately before /sbin/reboot is called as the final step of rebooting my system.
>>>>>
>>>>> I hope this is what you were looking for, but if not, please let me know what you need
>>>
>>> Thanks Dave. [...]
>> FWIW, in case anyone strands here in the archives: the msg was
>> truncated. The full post can be found in a new thread:
>>
>> https://lore.kernel.org/lkml/e0b80506-b3cf-315b-4327-1b988d86031e@googlemail.com/
>>
>> Sadly it seems the info "With runpm=0, both reboot and poweroff work on
>> my laptop." didn't bring us much further to a solution. :-/ I don't
>> really like it, but for regression tracking I'm now putting this on the
>> back-burner, as a fix is not in sight.
>>
>> #regzbot monitor:
>> https://lore.kernel.org/lkml/e0b80506-b3cf-315b-4327-1b988d86031e@googlemail.com/
>> #regzbot backburner: hard to debug and apparently rare
>> #regzbot ignore-activity
>>
> 
> yeah.. this bug looks a little annoying. Sadly the only Turing based
> laptop I got doesn't work on Nouveau because of firmware related
> issues and we probably need to get updated ones from Nvidia here :(
> 
> But it's a bit weird that the kernel doesn't shutdown, because I don't
> see anything in the logs which would prevent that from happening.
> Unless it's waiting on one of the tasks to complete, but none of them
> looked in any way nouveau related.
> 
> If somebody else has any fancy kernel debugging tips here to figure
> out why it hangs, that would be very helpful...
> 

I think I've figured this out. It's to do with how my system is configured. I do have an initrd, but the only thing on
it is the cpu microcode which, it is recommended, should be loaded early. The absence of the NVidia firmare from an
initrd doesn't matter because the drivers for the hardware that need to load firmware are all built as modules, So, by
the time the devices are configured via udev, the root partition is mounted and the drivers can get at the firmware.

I've found, by turning on nouveau debug and taking a video of the screen as the system shuts down, that nouveau seems to
be trying to run the scrubber very very late in the shutdown process. The problem is that by this time, I think the root
partition, and thus the scrubber binary, have become inaccessible.

I seem to have two choices - either make the firmware accessible on an initrd or unload the module in a shutdown script
before the scrubber binary becomes inaccessible. The latter of these is the workaround I have implemented whilst the
problem I reported has been under investigation. For simplicity, I think I'll promote my workaround to being the
permanent solution.

So, apologies (and thanks) to everyone whose time I have taken up with this non-bug.

Chris

>> Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)
>> --
>> Everything you wanna know about Linux kernel regression tracking:
>> https://linux-regtracking.leemhuis.info/about/#tldr
>> That page also explains what to do if mails like this annoy you.
>>
>> #regzbot ignore-activity
>>
> 
