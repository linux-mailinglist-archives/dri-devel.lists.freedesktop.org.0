Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 32B1B6947C0
	for <lists+dri-devel@lfdr.de>; Mon, 13 Feb 2023 15:13:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C60F10E5C8;
	Mon, 13 Feb 2023 14:12:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E1D910E5C8;
 Mon, 13 Feb 2023 14:12:54 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id m10so3463886wrn.4;
 Mon, 13 Feb 2023 06:12:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:cc:from:to:references
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=EsqkxOvpnaFZCqHajOpHltyVhIkx+s6eYXNOmyQ4+o4=;
 b=OUzZcLleBxOMqrP9XviKuUrD0xYSPYpPLESmUkD1O6ZcmLJxTCv8nULdz7i0tyZs60
 /ERJgBT0bqLe9+7CQv5+/Bniht4E6MKnF95RcrMKk0rm3JLHFamh/Dw7Xq3XQcXwk3L0
 cepU8kuWhq/7HKV127ztH7nXOnwNqY2dSnKewNDpMhj0UB+gIr64VdEQGaRdYH6aZ3/i
 A9plwBGs20Yy1rjA9v5CIevipFF8L4XI7cG2IZGLTvXaoXOZczrOPIDxKkL4zEpwrZZ7
 HnhClGGjw8mKRBY8tBK9+/hYx99wmLerEASStnvHqBfD2EvTq2cDRCzv+a1oEi+vQADl
 0Uuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:cc:from:to:references
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=EsqkxOvpnaFZCqHajOpHltyVhIkx+s6eYXNOmyQ4+o4=;
 b=ZP7aQ5DfCA7CkzmfBABSMxr4GnwByrQt223sRUiIJuyMN+AJA9API7UEQJFv10ybDj
 YC9gO+XthbbsmdunFyNor3a7NHxBa0Ub+oUOjfQ5YlEJd74OTMGmb+OHNRKCyhSm+Le+
 7RXKFGdVarEKMqDT8uPeO1DlPski+uVcfVITEJkr8K2DDI+ERNve6f6pzeq7mVQUx2GC
 AMTYUQNMElOMhVP/xBPCLrgwneybnCM18cZBiAcuIVyMvcVg7S4nRRbJyFVaZ1qt/w0K
 65VM/dwKkFhM9MCnQGm7gjcNg3+kHJmxekbppoIfRTM6ig7AdD1Y/Sx7ugsG1LkUNMON
 1F/Q==
X-Gm-Message-State: AO0yUKWeDTyLsMDydWLJOmVy/zakBRDIINM0Su2e5shjVw6VMn6csSJW
 Ys6lB6ZI+RTyO+64sk99BuAnReDPF3w=
X-Google-Smtp-Source: AK7set/wugfPYZOYQTzQrvfbcgzO0WnIG8etqnnThADl0ZnsrGA9jjVo3EGtn3NH4mRbfJ3Nruf9Wg==
X-Received: by 2002:adf:e54a:0:b0:2c5:5984:6f07 with SMTP id
 z10-20020adfe54a000000b002c559846f07mr2319355wrm.26.1676297573096; 
 Mon, 13 Feb 2023 06:12:53 -0800 (PST)
Received: from [192.168.1.10] (97e09f27.skybroadband.com. [151.224.159.39])
 by smtp.googlemail.com with ESMTPSA id
 w11-20020adff9cb000000b002c54e9f6bc2sm6176883wrr.77.2023.02.13.06.12.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Feb 2023 06:12:52 -0800 (PST)
Message-ID: <e0b80506-b3cf-315b-4327-1b988d86031e@googlemail.com>
Date: Mon, 13 Feb 2023 14:12:51 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
Subject: Fwd: linux-6.2-rc4+ hangs on poweroff/reboot: Bisected
Content-Language: en-GB
References: <ab3b4b8a-93a7-5129-5996-f0b364b04dda@googlemail.com>
To: ">> ML dri-devel" <dri-devel@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>,
 Linux regressions mailing list <regressions@lists.linux.dev>,
 Karol Herbst <kherbst@redhat.com>, Ben Skeggs <skeggsb@gmail.com>,
 bskeggs@redhat.com, Lyude Paul <lyude@redhat.com>,
 ML nouveau <nouveau@lists.freedesktop.org>
From: Chris Clayton <chris2553@googlemail.com>
In-Reply-To: <ab3b4b8a-93a7-5129-5996-f0b364b04dda@googlemail.com>
X-Forwarded-Message-Id: <ab3b4b8a-93a7-5129-5996-f0b364b04dda@googlemail.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Proof, if any where needed, that I should consume more coffee before dealing with email...

Adding cc recipients that were dropped in my message this morning.


-------- Forwarded Message --------
Subject: Re: linux-6.2-rc4+ hangs on poweroff/reboot: Bisected
Date: Mon, 13 Feb 2023 09:21:10 +0000
From: Chris Clayton <chris2553@googlemail.com>
To: Dave Airlie <airlied@gmail.com>

[ Apologies for the incomplete message I sent a few minutes ago. I should have had more coffee before I started dealing
with email. ]

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

Thanks, Dave.

> Another shot in the dark, but does nouveau.runpm=0 help at all?
> 
Yes, it does. With runpm=0, both reboot and poweroff work on my laptop. Of course, it also means that the discrete
(NVidia) GPU is now powered on permanently.

Chris


> Dave.
