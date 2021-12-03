Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 13585467540
	for <lists+dri-devel@lfdr.de>; Fri,  3 Dec 2021 11:40:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB2F86EE5C;
	Fri,  3 Dec 2021 10:40:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de
 [IPv6:2a01:488:42:1000:50ed:8234::])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 49E5E6EE5C
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Dec 2021 10:40:14 +0000 (UTC)
Received: from ip4d173d4a.dynamic.kabel-deutschland.de ([77.23.61.74]
 helo=[192.168.66.200]); authenticated
 by wp530.webpack.hosteurope.de running ExIM with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 id 1mt5z3-00055G-Es; Fri, 03 Dec 2021 11:40:05 +0100
Message-ID: <bf5d157b-4661-3549-5c90-e28be1846e70@leemhuis.info>
Date: Fri, 3 Dec 2021 11:40:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: 5.15 regression: CONFIG_SYSFB_SIMPLEFB breaks console scrolling
Content-Language: en-BW
From: Thorsten Leemhuis <regressions@leemhuis.info>
To: Harald Dunkel <harri@afaics.de>,
 Javier Martinez Canillas <javierm@redhat.com>
References: <e50d5ad5-19fd-07ae-41e4-5a2d26a98bcf@afaics.de>
 <4bf94684-6410-db9f-5bec-ea0540a2ea76@leemhuis.info>
 <d9acb4ba-691b-3496-f77b-175c441f887d@leemhuis.info>
In-Reply-To: <d9acb4ba-691b-3496-f77b-175c441f887d@leemhuis.info>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de; regressions@leemhuis.info; 1638528014;
 1e8bf9e5; 
X-HE-SMSGID: 1mt5z3-00055G-Es
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>,
 Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel@lists.freedesktop.org,
 "regressions@lists.linux.dev" <regressions@lists.linux.dev>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 25.11.21 13:00, Thorsten Leemhuis wrote:
> On 21.11.21 12:47, Thorsten Leemhuis wrote:
>> Hi, this is your Linux kernel regression tracker speaking.
> /me again

and again :-D

>> On 16.11.21 05:52, Harald Dunkel wrote:
>>>
>>> if I enable CONFIG_SYSFB_SIMPLEFB in 5.15.2 and use grub's default
>>> configuration
>>> (Debian sid amd64), then a few lines at the bottom of /dev/tty1 including
>>> login prompt are off-screen. Scrolling is broken. I can login, though.
>>>
>>> Enabling GRUB_TERMINAL=console in grub doesn't make a difference. Using
>>> the same kernel except for CONFIG_SYSFB_SIMPLEFB the problem is gone.
>>>
>>> Graphics card is a GeForce GTX 1650. I tried with both CONFIG_DRM_NOUVEAU
>>> and proprietary graphics drivers disabled.
>>>
>>> Attached you can find the config file. Please mail if I can help to track
>>> this problem down.
>>
>> Thx for the report. I'm not totally sure if this is a regression, as
>> that's a new config option. But it might be one considered a successor
>> to an older one, hence it might count as regression. Adding two
>> developers and a mailing list to the CC, hopefully someone can clarify.
> 
> Javier, I'd be interested in your option on this.
> 
> Harald, did you have CONFIG_X86_SYSFB enabled in earlier kernel versions
> (and did console scrolling work then)? The answer would help me to
> decide if this a regression, as those ideally should be fixed as quickly
> as possible.

Harald, a reply would have been very helpful; I wonder if Javier is
waiting for the answer, too. If I get none in the next few days I guess
I'll drop this from the list of tracked regressions.

Ciao, Thorsten

#regzbot ignore-activity

>> TWIMC: To be sure this issue doesn't fall through the cracks unnoticed,
>> I'm adding it to regzbot, my Linux kernel regression tracking bot:
>>
>> #regzbot ^introduced 8633ef82f101c040427b57d4df7b706261420b94
>> #regzbot title CONFIG_SYSFB_SIMPLEFB breaks console scrolling
>> #regzbot ignore-activity
>>
>> Ciao, Thorsten, your Linux kernel regression tracker.
>>
>> P.S.: If you want to know more about regzbot, check out its
>> web-interface, the getting start guide, and/or the references documentation:
>>
>> https://linux-regtracking.leemhuis.info/regzbot/
>> https://gitlab.com/knurd42/regzbot/-/blob/main/docs/getting_started.md
>> https://gitlab.com/knurd42/regzbot/-/blob/main/docs/reference.md
>>
>> The last two documents will explain how you can interact with regzbot
>> yourself if your want to.
>>
>> Hint for the reporter: when reporting a regression it's in your interest
>> to tell #regzbot about it in the report, as that will ensure the
>> regression gets on the radar of regzbot and the regression tracker.
>> That's in your interest, as they will make sure the report won't fall
>> through the cracks unnoticed.
>>
>> Hint for developers: you normally don't need to care about regzbot, just
>> fix the issue as you normally would. Just remember to include a 'Link:'
>> tag to the report in the commit message, as explained in
>> Documentation/process/submitting-patches.rst
>> That aspect was recently was made more explicit in commit 1f57bd42b77c:
>> https://git.kernel.org/linus/1f57bd42b77c
> 
> #regzbot title drm: CONFIG_SYSFB_SIMPLEFB breaks console scrolling
> 
> 
> 
> 
