Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DB4706FDB0B
	for <lists+dri-devel@lfdr.de>; Wed, 10 May 2023 11:51:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB8AB10E1D2;
	Wed, 10 May 2023 09:51:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de
 [80.237.130.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5006610E1D2;
 Wed, 10 May 2023 09:51:07 +0000 (UTC)
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
 by wp530.webpack.hosteurope.de running ExIM with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 id 1pwgTP-0000gz-7f; Wed, 10 May 2023 11:51:03 +0200
Message-ID: <9cf29c20-5b82-89bb-0927-e6f66b3bd8d5@leemhuis.info>
Date: Wed, 10 May 2023 11:51:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: Fwd: Kernel 5.11 crashes when it boots, it produces black screen.
Content-Language: en-US, de-DE
To: Bagas Sanjaya <bagasdotme@gmail.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 "Pan, Xinhui" <Xinhui.Pan@amd.com>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Hawking Zhang <Hawking.Zhang@amd.com>,
 Le Ma <le.ma@amd.com>, Tao Zhou <tao.zhou1@amd.com>,
 YiPeng Chai <YiPeng.Chai@amd.com>, "Jiadong.Zhu" <Jiadong.Zhu@amd.com>,
 Yang Wang <KevinYang.Wang@amd.com>, Candice Li <candice.li@amd.com>,
 Xiaojian Du <Xiaojian.Du@amd.com>, Likun Gao <Likun.Gao@amd.com>,
 Linux AMDGPU <amd-gfx@lists.freedesktop.org>,
 Linux DRI Development <dri-devel@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Regressions <regressions@lists.linux.dev>
References: <c2168e4f-4d47-0d5d-a1b7-d237f0760df8@gmail.com>
From: "Linux regression tracking (Thorsten Leemhuis)"
 <regressions@leemhuis.info>
In-Reply-To: <c2168e4f-4d47-0d5d-a1b7-d237f0760df8@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de; regressions@leemhuis.info; 1683712267;
 44f10e44; 
X-HE-SMSGID: 1pwgTP-0000gz-7f
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
Reply-To: Linux regressions mailing list <regressions@lists.linux.dev>
Cc: "Azamat S. Kalimoulline" <turtle@bazon.ru>,
 max <kernel-ODwfxu5zp4@maxxor.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi!

On 10.05.23 10:26, Bagas Sanjaya wrote:
> 
> I noticed a regression report on Bugzilla ([1]). As many developers don't
> have a look on it, I decided to forward it by email. See the report
> for the full thread.
> 
> Quoting from the report:
> 
>>  Azamat S. Kalimoulline 2021-04-06 15:45:08 UTC
>>
>> Same as in https://bugzilla.kernel.org/show_bug.cgi?id=212133, but not StoneyRidge related. I have same issue in 5.11.9 kernel, but on Renoir architecture. I have AMD Ryzen 5 PRO 4650U with Radeon Graphics. Same stuck on loading initial ramdisk. modprobe.blacklist=amdgpu 3` didn't help to boot. Same stuck. Also iommu=off and acpi=off too. 5.10.26 boots fine. I boot via efi and I have no option boot without it.
> 
> Azamat, can you try reproducing this issue on latest mainline?
>
> [1]: https://bugzilla.kernel.org/show_bug.cgi?id=212579

Bagas, thx for all your help with regression tracking, much appreciated
(side note, as I'm curious for a while already: what is your motivation?
Just want to help? But whatever, any help is great!).

That being said: I'm not sure if I like what you did in this particular
case, as developers might start getting annoyed by regression tracking
if we throw too many bug reports of lesser quality before their feet --
and then they might start to ignore us, which we really need to prevent.

That's why I would not have forwarded that report at this point of time,
mainly for these reasons:

 * The initial report is quite old already, as it fall through the
cracks (not good, but happens; sorry Azamat!). Hence in this case it
would definitely be better to *first* ask the reporter to check if the
problem still happens with latest mainline (or at least latest stable)
before involving the kernel developers, as it might have been fixed
already.

 * This might not be a amdgpu bug at all; in fact the other bug the
reporter mentioned was an iommu thing. Hence this might be one of those
regressions where a bisection is the only way to get down to the
problem. Sure, sending a few developers a quick inquiry along the lines
of "do you maybe have an idea what's up there" is fine, but that's not
what you did in your mail. Your list of recipients is also quite long;
that's risky: if you do that too often, as then they might start
ignoring mail from you.

Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)
--
Everything you wanna know about Linux kernel regression tracking:
https://linux-regtracking.leemhuis.info/about/#tldr
If I did something stupid, please tell me, as explained on that page.
