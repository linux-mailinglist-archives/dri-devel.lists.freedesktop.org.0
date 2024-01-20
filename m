Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7456A8331D7
	for <lists+dri-devel@lfdr.de>; Sat, 20 Jan 2024 01:34:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B415B10E1DC;
	Sat, 20 Jan 2024 00:33:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com
 [209.85.210.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 43CD210E1DC
 for <dri-devel@lists.freedesktop.org>; Sat, 20 Jan 2024 00:33:55 +0000 (UTC)
Received: by mail-pf1-f176.google.com with SMTP id
 d2e1a72fcca58-6d9ac0521c6so258102b3a.0
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Jan 2024 16:33:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kernel-dk.20230601.gappssmtp.com; s=20230601; t=1705710775; x=1706315575;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=zXbx5KLjnuEXGoUIzJq2FnD3gOZC2HLZU+Ar46f2g5k=;
 b=wFcM3z1sTszvM2yxnEnzIr/a95FGruCHolPFd7+6EjoZV8rZjF/YekSgvTCyuhsSq9
 mfZDcopxpvHVbm2cIAMnHscaOAFQ+6H2VKhwr+H8wYHSEybWqrNJ+d6KdwyMb4S0j8wV
 /9Iu/lE8lxNi+xu+DkVvIHXvfbRBw6r5BqqjhZ/ZpeCvG+HukzfiV9fiM/d5oPgDbFTz
 +nadVzCQdxxAt3T4gJcv5T7yE0xzA0M998fW0ZV5FHBMAfzd5Y90gTbBJ990RwtH83/R
 dpRO7MdNRFosR0ybzziToFBMsYwjE3xK/GRO6ewTx7p5/N9ArouQNsbgQ/xSvAZ0dJaE
 7K2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705710775; x=1706315575;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=zXbx5KLjnuEXGoUIzJq2FnD3gOZC2HLZU+Ar46f2g5k=;
 b=D6mduckAQtjuhp/XAdzuvgMdoSkByTWSCQDfg/PKAgRIijhCUQIFygUozVUTboxTh/
 sJEP6vrJ76F4lXshfubpr0+HLnmNWTZQV+8DvaaX4gl6NgFAXk6M6m5N/U2+7sp/JtAj
 QSNlsodhnSHuMf5hKQJfRpJZqOsR+D/xr3fTakXhcmHwq9iIuPG/V6W5+3wNMeAWt7oB
 ibfLxY9YYL4666HfnPXDTe1lxnIIHs5NjyfWRAw1VXqXM8rs3OIx/15yMQo1sli4iiDJ
 C3CnrHHs6iJmIWI6tjQDXE/b51PsAPiL8FVwk15CuU2vSUgQlLRvteMFZQ8u6Ex7VnXM
 /Muw==
X-Gm-Message-State: AOJu0Yx5IFY8JGUtni+SzEYfay5PXDuKfuJrVe7A9JQBrjEn7VCS/Z5B
 +pSHAppFGJ9xj4m9lH7OP7b3iYD41ZwEipAeanACktA+J2XZlX4kKksY+p69DbU=
X-Google-Smtp-Source: AGHT+IH59wAMlt2d7W+nL3Uwl8nawc/QUfSY+ID2uXcxJLUh4jRHJpOIHDQd2m9rMCO4UXjvPCm5vA==
X-Received: by 2002:a05:6a20:c887:b0:19a:40f3:e460 with SMTP id
 hb7-20020a056a20c88700b0019a40f3e460mr1487067pzb.2.1705710774817; 
 Fri, 19 Jan 2024 16:32:54 -0800 (PST)
Received: from [192.168.1.150] ([198.8.77.194])
 by smtp.gmail.com with ESMTPSA id
 q1-20020a63f941000000b005cfba3c84b7sm968115pgk.81.2024.01.19.16.32.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 19 Jan 2024 16:32:54 -0800 (PST)
Message-ID: <93ffd2ee-fa83-4469-96fb-fb263c26bb3c@kernel.dk>
Date: Fri, 19 Jan 2024 17:32:52 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: REGRESSION: no console on current -git
Content-Language: en-US
To: Helge Deller <deller@gmx.de>, LKML <linux-kernel@vger.kernel.org>,
 "regressions@lists.linux.dev" <regressions@lists.linux.dev>,
 dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Linus Torvalds <torvalds@linux-foundation.org>
References: <05ea3233-20dd-4af7-86cc-de11ad2efe84@kernel.dk>
 <0293b14b-6188-4229-9fb6-29fbbdb8dc83@gmx.de>
 <9e09464a-d58c-4f17-9318-26f0813a3023@kernel.dk>
 <b6350dac-0be6-45f9-9309-d196ea455dea@gmx.de>
 <017a1df5-e08b-44c5-9e4e-f61a9ce49e8d@kernel.dk>
 <2c267aef-f1a7-4277-aac6-75d9ea22ec03@gmx.de>
From: Jens Axboe <axboe@kernel.dk>
In-Reply-To: <2c267aef-f1a7-4277-aac6-75d9ea22ec03@gmx.de>
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
Cc: avier Martinez Canillas <javierm@redhat.com>,
 Mirsad Todorovac <mirsad.todorovac@alu.unizg.hr>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 1/19/24 5:27 PM, Helge Deller wrote:
> On 1/19/24 22:22, Jens Axboe wrote:
>> On 1/19/24 2:14 PM, Helge Deller wrote:
>>> On 1/19/24 22:01, Jens Axboe wrote:
>>>> On 1/19/24 1:55 PM, Helge Deller wrote:
>>>>> Adding Mirsad Todorovac (who reported a similar issue).
>>>>>
>>>>> On 1/19/24 19:39, Jens Axboe wrote:
>>>>>> My trusty R7525 test box is failing to show a console, or in fact anything,
>>>>>> on current -git. There's no output after:
>>>>>>
>>>>>> Loading Linux 6.7.0+ ...
>>>>>> Loading initial ramdisk ...
>>>>>>
>>>>>> and I don't get a console up. I went through the bisection pain and
>>>>>> found this was the culprit:
>>>>>>
>>>>>> commit df67699c9cb0ceb70f6cc60630ca938c06773eda
>>>>>> Author: Thomas Zimmermann <tzimmermann@suse.de>
>>>>>> Date:   Wed Jan 3 11:15:11 2024 +0100
>>>>>>
>>>>>>        firmware/sysfb: Clear screen_info state after consuming it
>>>>>>
>>>>>> Reverting this commit, and everything is fine. Looking at dmesg with a
>>>>>> buggy kernel, I get no frame or fb messages. On a good kernel, it looks
>>>>>> ilke this:
>>>>>>
>>>>>> [    1.416486] efifb: probing for efifb
>>>>>> [    1.416602] efifb: framebuffer at 0xde000000, using 3072k, total 3072k
>>>>>> [    1.416605] efifb: mode is 1024x768x32, linelength=4096, pages=1
>>>>>> [    1.416607] efifb: scrolling: redraw
>>>>>> [    1.416608] efifb: Truecolor: size=8:8:8:8, shift=24:16:8:0
>>>>>> [    1.449746] fb0: EFI VGA frame buffer device
>>>>>>
>>>>>> Happy to test a fix, or barring that, can someone just revert this
>>>>>> commit please?
>>>>>
>>>>> I've temporarily added a revert patch into the fbdev for-next tree for now,
>>>>> so people should not face the issue in the for-next series:
>>>>> https://git.kernel.org/pub/scm/linux/kernel/git/deller/linux-fbdev.git/commit/?h=for-next
>>>>> I'd like to wait for Thomas to return on monday to check the issue
>>>>> as there are some other upcoming patches in this area from him.
>>>>
>>>> Given the issue (and that I'm not the only one reporting it), can we
>>>> please just get that pushed so it'll make -rc1? It can always get
>>>> re-introduced in a fixed fashion. I don't run -next here, I rely on
>>>> mainline working for my testing.
>>>
>>> I agree, it would be good to get it fixed for -rc1.
>>> So, it's ok for me, but I won't be able to test the revert short time right now.
>>> If you can assure that the revert fixes it, and builds in git-head,
>>> I can now prepare the pull request for Linus now (or he just reverts
>>> commit df67699c9cb0 manually).
>>
>> I already tested a revert on top of the current tree, and it builds just
>> fine and boots with a working console. So reverting it does work and
>> solves the issue.
> 
> I sent a pull request with the revert.

Thanks! You forgot the Reported-by, but no big deal.

-- 
Jens Axboe

