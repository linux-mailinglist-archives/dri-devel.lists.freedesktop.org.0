Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 053A94E22B8
	for <lists+dri-devel@lfdr.de>; Mon, 21 Mar 2022 09:58:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1127910E2B5;
	Mon, 21 Mar 2022 08:58:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de
 [IPv6:2a01:488:42:1000:50ed:8234::])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E1F210E2B5;
 Mon, 21 Mar 2022 08:58:05 +0000 (UTC)
Received: from ip4d144895.dynamic.kabel-deutschland.de ([77.20.72.149]
 helo=[192.168.66.200]); authenticated
 by wp530.webpack.hosteurope.de running ExIM with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 id 1nWDrU-0003JJ-BW; Mon, 21 Mar 2022 09:58:00 +0100
Message-ID: <61c2b2ce-d749-3723-ad27-f40e1c49d967@leemhuis.info>
Date: Mon, 21 Mar 2022 09:57:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: Regression from 3c196f056666 ("drm/amdgpu: always reset the asic
 in suspend (v2)") on suspend?
Content-Language: en-US
To: Eric Valette <eric.valette@free.fr>,
 Salvatore Bonaccorso <carnil@debian.org>, Dominique Dumont <dod@debian.org>
References: <Ygf7KuWyc0d4HIFu@eldamar.lan>
 <CADnq5_MfR99OhjumQESCO7Oq+JVOHOVgyVQHX4FpGFDnPu6CyQ@mail.gmail.com>
 <5164225.DI6hChFYCN@ylum> <c62d4ba9-2214-ca7d-ee78-ee19a9bf51e6@free.fr>
 <CADnq5_MWqz7-XhOS4zfuzi3=_nKa72iYaO0BcKNcVDwEvZ+YHw@mail.gmail.com>
From: Thorsten Leemhuis <regressions@leemhuis.info>
In-Reply-To: <CADnq5_MWqz7-XhOS4zfuzi3=_nKa72iYaO0BcKNcVDwEvZ+YHw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de; regressions@leemhuis.info; 1647853085;
 667eccc4; 
X-HE-SMSGID: 1nWDrU-0003JJ-BW
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
Cc: Sasha Levin <sashal@kernel.org>, David Airlie <airlied@linux.ie>, "Pan,
 Xinhui" <Xinhui.Pan@amd.com>, LKML <linux-kernel@vger.kernel.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Luben Tuikov <luben.tuikov@amd.com>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>, 1005005@bugs.debian.org,
 Evan Quan <evan.quan@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi, this is your Linux kernel regression tracker. Top-posting for once,
to make this easily accessible to everyone.

Dominique/Salvatore/Eric, what's the status of this regression?
According to the debian bug tracker the problem is solved with 5.16 and
5.17, but was 5.15 ever fixed?

Ciao, Thorsten

On 21.02.22 15:16, Alex Deucher wrote:
> On Mon, Feb 21, 2022 at 3:29 AM Eric Valette <eric.valette@free.fr> wrote:
>>
>> On 20/02/2022 16:48, Dominique Dumont wrote:
>>> On Monday, 14 February 2022 22:52:27 CET Alex Deucher wrote:
>>>> Does the system actually suspend?
>>>
>>> Not really. The screens looks like it's going to suspend, but it does come
>>> back after 10s or so. The light mounted in the middle of the power button does
>>> not switch off.
>>
>>
>> As I have a very similar problem and also commented on the original
>> debian bug report
>> (https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=1005005), I will add
>> some information here on another amd only laptop (renoir AMD Ryzen 7
>> 4800H with Radeon Graphics + Radeon RX 5500/5500M / Pro 5500M).
>>
>> For me the suspend works once, but after the first resume (I do know
>> know if it is in the suspend path or the resume path I see a RIP in the
>> dmesg (see aditional info in debian bug))  and later suspend do not
>> work: It only go to the kde login screen.
>>
>> I was unable due to network connectivity to do a full bisect but tested
>> with the patch I had on my laptop:
>>
>> 5.10.101 works, 5.10 from debian works
>> 5.11 works
>> 5.12 works
>> 5.13 suspend works but when resuming the PC is dead I have to reboot
>> 5.14 seems to work but looking at dmesg it is full of RIP messages at
>> various places.
>> 5.15.24 is a described 5.15 from debian is behaving identically
>> 5.16 from debian is behaving identically.
>>
>>>> Is this system S0i3 or regular S3?
>>
>> For me it is real S3.
>>
>> The proposed patch is intended for INTEl + intel gpu + amdgpu but I have
>> dual amd GPU.
> 
> It doesn't really matter what the platform is, it could still
> potentially help on your system, it depends on the bios implementation
> for your platform and how it handles suspend. You can try the patch,
> but I don't think you are hitting the same issue.  I bisect would be
> helpful in your case.
> 
> Alex

