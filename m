Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 67A766E37DE
	for <lists+dri-devel@lfdr.de>; Sun, 16 Apr 2023 14:06:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C215910E0D6;
	Sun, 16 Apr 2023 12:06:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de
 [80.237.130.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D03ED10E0D6
 for <dri-devel@lists.freedesktop.org>; Sun, 16 Apr 2023 12:06:17 +0000 (UTC)
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
 by wp530.webpack.hosteurope.de running ExIM with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 id 1po18w-0001TX-Gw; Sun, 16 Apr 2023 14:06:06 +0200
Message-ID: <812d42bf-157b-7478-27e3-7086e6f00a8e@leemhuis.info>
Date: Sun, 16 Apr 2023 14:06:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH v3 01/13] firmware/sysfb: Fix EFI/VESA format selection
Content-Language: en-US, de-DE
From: "Linux regression tracking #update (Thorsten Leemhuis)"
 <regressions@leemhuis.info>
To: Pierre Asselin <pa@panix.com>, tzimmermann@suse.de, mripard@kernel.org,
 mairacanal@riseup.net, maarten.lankhorst@linux.intel.com,
 jose.exposito89@gmail.com, javierm@redhat.com, daniel@ffwll.ch,
 airlied@gmail.com
References: <20230102112927.26565-1-tzimmermann@suse.de>
 <20230102112927.26565-2-tzimmermann@suse.de>
 <4Psm6B6Lqkz1QXM@panix3.panix.com>
 <b6e7abcf-499c-da4b-7249-749fa525a911@leemhuis.info>
In-Reply-To: <b6e7abcf-499c-da4b-7249-749fa525a911@leemhuis.info>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de; regressions@leemhuis.info; 1681646777;
 c02ac2a8; 
X-HE-SMSGID: 1po18w-0001TX-Gw
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
Cc: Linux kernel regressions list <regressions@lists.linux.dev>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

[TLDR: This mail in primarily relevant for Linux regression tracking. A
change or fix related to the regression discussed in this thread was
posted or applied, but it did not use a Link: tag to point to the
report, as Linus and the documentation call for. Things happen, no
worries -- but now the regression tracking bot needs to be told manually
about the fix. See link in footer if these mails annoy you.]

On 08.04.23 13:26, Linux regression tracking #adding (Thorsten Leemhuis)
wrote:
> 
> On 06.04.23 17:45, Pierre Asselin wrote:
>> Thomas Zimmermann <tzimmermann@suse.de> wrote:
>> [...] 
>> Starting at linux-6.3-rc1 my simplefb picks the wrong mode and garbles
>> the display This is on a 16-year old i686 laptop.  I can post lshw or
>> dmidecode output if it helps.
>> [...] 
>> I bisected it to f35cd3fa77293c2cd03e94b6a6151e1a7d9309cf
>>     firmware/sysfb: Fix EFI/VESA format selection
> 
> Thanks for the report. To be sure the issue doesn't fall through the
> cracks unnoticed, I'm adding it to regzbot, the Linux kernel regression
> tracking bot:
> 
> #regzbot ^introduced f35cd3fa77293c2cd03e
> #regzbot title firmware/sysfb: wrong mode and display garbled on 16-year
> old i686 laptop
> #regzbot ignore-activity

#regzbot monitor:
https://lore.kernel.org/lkml/20230412150225.3757223-1-javierm@redhat.com/
#regzbot ignore-activity

Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)
--
Everything you wanna know about Linux kernel regression tracking:
https://linux-regtracking.leemhuis.info/about/#tldr
That page also explains what to do if mails like this annoy you.
