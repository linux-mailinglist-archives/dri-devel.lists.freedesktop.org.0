Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DD349833030
	for <lists+dri-devel@lfdr.de>; Fri, 19 Jan 2024 22:24:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A18810EA6E;
	Fri, 19 Jan 2024 21:23:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f42.google.com (mail-io1-f42.google.com
 [209.85.166.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F99E10EA6E
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Jan 2024 21:23:52 +0000 (UTC)
Received: by mail-io1-f42.google.com with SMTP id
 ca18e2360f4ac-7bb06f56fe9so13472439f.0
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Jan 2024 13:23:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kernel-dk.20230601.gappssmtp.com; s=20230601; t=1705699371; x=1706304171;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=yhg0VXUn6GSGo/fJYyg3JJjsnII4D6lYYn8pfIAZut0=;
 b=D/ySOt6glPCLz01qjwIdBn7f8KOSKIkSZ6o0Jo0oQD5m9ObsnTLdWqKrfpl4G6Y0Qh
 YVEpdaJUFTAVesXAEakH1LKa+e5P0ISxLms96kNGxaXPDPmwtEWMA/sKOiYzm8KFxZMy
 8N7B6LMKlOsWIN4o9njVXn5zo4I6tC+CzwQ05KTZNStRietybT8/zjqh5qBg8+md7RKh
 bz50REGNmuKmwwBt7kOnn2WcTEn/N3eMpc9bDQTN/Z3WYNMLHZvVaRxEYvyjg+IpIRce
 O3OJ6eIlOpil9uwpUVb7jwVqT0ZYf10cyysSJHnv9hiTigv3+BwhcUWI8hAPjseCklei
 xQKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705699371; x=1706304171;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=yhg0VXUn6GSGo/fJYyg3JJjsnII4D6lYYn8pfIAZut0=;
 b=LQvxOKRKVppenYuPpuUcjjkcbXYzgce42Ns/PabT9raKUeGIQ1Vl0TuQISY4GcavMa
 uojg1/zUP5U3/k4SGNF8R+UMJf+3Hy4n42i/40JNht0XCjz7GpNCAdHw8NHRK76dKVKp
 I/WeHc6PfztyESKhsbyG4VvIM0s2MmruNcT2l6JlAacuXd/4fOhFSvRBlUVMSm/G1Lht
 Kut+9G2z3ZFHSwXBXkpExYfPXWNr4zJ0ylrT/5GAzTqofpUIXJRhEloW0Sr40qevTUyS
 C8fzwe67Ijo8XYvLYt9+inqjZi6LVbgWOoesr1dWvhqVHzg8TtZn969zK/oFD0eLHYaD
 YPzw==
X-Gm-Message-State: AOJu0Yyyc0BIfp6cxr8RvONUqqh9fkKDy5jpPfngEhDXibxCj6valve4
 uzI49TrlS8FoVeJoRX5U7YC3M/XfjILYMX/N+bilU9L0HJiICbdHzB/ogTcjm7M=
X-Google-Smtp-Source: AGHT+IEhZv7rBM/0mhazF6qpEocA3UoyedhPX7vTStNQc2skiNZxCDLHraxA8cGa9o7E0Y+OafuGNQ==
X-Received: by 2002:a05:6e02:1a84:b0:361:9667:937f with SMTP id
 k4-20020a056e021a8400b003619667937fmr935474ilv.1.1705699371364; 
 Fri, 19 Jan 2024 13:22:51 -0800 (PST)
Received: from [192.168.1.116] ([96.43.243.2])
 by smtp.gmail.com with ESMTPSA id
 t11-20020a92c0cb000000b003606dc5804asm5634663ilf.65.2024.01.19.13.22.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 19 Jan 2024 13:22:50 -0800 (PST)
Message-ID: <017a1df5-e08b-44c5-9e4e-f61a9ce49e8d@kernel.dk>
Date: Fri, 19 Jan 2024 14:22:50 -0700
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
From: Jens Axboe <axboe@kernel.dk>
In-Reply-To: <b6350dac-0be6-45f9-9309-d196ea455dea@gmx.de>
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

On 1/19/24 2:14 PM, Helge Deller wrote:
> On 1/19/24 22:01, Jens Axboe wrote:
>> On 1/19/24 1:55 PM, Helge Deller wrote:
>>> Adding Mirsad Todorovac (who reported a similar issue).
>>>
>>> On 1/19/24 19:39, Jens Axboe wrote:
>>>> My trusty R7525 test box is failing to show a console, or in fact anything,
>>>> on current -git. There's no output after:
>>>>
>>>> Loading Linux 6.7.0+ ...
>>>> Loading initial ramdisk ...
>>>>
>>>> and I don't get a console up. I went through the bisection pain and
>>>> found this was the culprit:
>>>>
>>>> commit df67699c9cb0ceb70f6cc60630ca938c06773eda
>>>> Author: Thomas Zimmermann <tzimmermann@suse.de>
>>>> Date:   Wed Jan 3 11:15:11 2024 +0100
>>>>
>>>>       firmware/sysfb: Clear screen_info state after consuming it
>>>>
>>>> Reverting this commit, and everything is fine. Looking at dmesg with a
>>>> buggy kernel, I get no frame or fb messages. On a good kernel, it looks
>>>> ilke this:
>>>>
>>>> [    1.416486] efifb: probing for efifb
>>>> [    1.416602] efifb: framebuffer at 0xde000000, using 3072k, total 3072k
>>>> [    1.416605] efifb: mode is 1024x768x32, linelength=4096, pages=1
>>>> [    1.416607] efifb: scrolling: redraw
>>>> [    1.416608] efifb: Truecolor: size=8:8:8:8, shift=24:16:8:0
>>>> [    1.449746] fb0: EFI VGA frame buffer device
>>>>
>>>> Happy to test a fix, or barring that, can someone just revert this
>>>> commit please?
>>>
>>> I've temporarily added a revert patch into the fbdev for-next tree for now,
>>> so people should not face the issue in the for-next series:
>>> https://git.kernel.org/pub/scm/linux/kernel/git/deller/linux-fbdev.git/commit/?h=for-next
>>> I'd like to wait for Thomas to return on monday to check the issue
>>> as there are some other upcoming patches in this area from him.
>>
>> Given the issue (and that I'm not the only one reporting it), can we
>> please just get that pushed so it'll make -rc1? It can always get
>> re-introduced in a fixed fashion. I don't run -next here, I rely on
>> mainline working for my testing.
> 
> I agree, it would be good to get it fixed for -rc1.
> So, it's ok for me, but I won't be able to test the revert short time right now.
> If you can assure that the revert fixes it, and builds in git-head,
> I can now prepare the pull request for Linus now (or he just reverts
> commit df67699c9cb0 manually).

I already tested a revert on top of the current tree, and it builds just
fine and boots with a working console. So reverting it does work and
solves the issue.

-- 
Jens Axboe

