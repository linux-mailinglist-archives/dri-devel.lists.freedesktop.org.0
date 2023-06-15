Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 76828731984
	for <lists+dri-devel@lfdr.de>; Thu, 15 Jun 2023 15:03:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 92FA489E59;
	Thu, 15 Jun 2023 13:03:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de
 [80.237.130.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3CB3789E59
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Jun 2023 13:03:33 +0000 (UTC)
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
 by wp530.webpack.hosteurope.de running ExIM with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 id 1q9mdN-0000wr-73; Thu, 15 Jun 2023 15:03:29 +0200
Message-ID: <11b342dc-1a46-d1be-5fdd-c6eee661e15a@leemhuis.info>
Date: Thu, 15 Jun 2023 15:03:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH 1/2] fbdev/offb: Update expected device name
Content-Language: en-US, de-DE
To: Salvatore Bonaccorso <carnil@debian.org>,
 Cyril Brulebois <cyril@debamax.com>, regressions@lists.linux.dev
References: <20230412095509.2196162-1-cyril@debamax.com>
 <20230412095509.2196162-2-cyril@debamax.com> <ZDvrY7X9mpJ7WZ3z@eldamar.lan>
From: "Linux regression tracking (Thorsten Leemhuis)"
 <regressions@leemhuis.info>
In-Reply-To: <ZDvrY7X9mpJ7WZ3z@eldamar.lan>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-bounce-key: webpack.hosteurope.de; regressions@leemhuis.info; 1686834213;
 38ff613b; 
X-HE-SMSGID: 1q9mdN-0000wr-73
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
Cc: linux-fbdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, stable@vger.kernel.org,
 Thomas Zimmermann <tzimmermann@suse.de>, Michal Suchanek <msuchanek@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 16.04.23 14:34, Salvatore Bonaccorso wrote:
> 
> On Wed, Apr 12, 2023 at 11:55:08AM +0200, Cyril Brulebois wrote:
>> Since commit 241d2fb56a18 ("of: Make OF framebuffer device names unique"),
>> as spotted by Frédéric Bonnard, the historical "of-display" device is
>> gone: the updated logic creates "of-display.0" instead, then as many
>> "of-display.N" as required.
>>
>> This means that offb no longer finds the expected device, which prevents
>> the Debian Installer from setting up its interface, at least on ppc64el.
>>
>> It might be better to iterate on all possible nodes, but updating the
>> hardcoded device from "of-display" to "of-display.0" is confirmed to fix
>> the Debian Installer at the very least.
> [...]
> #regzbot ^introduced 241d2fb56a18
> #regzbot title: Open Firmware framebuffer cannot find of-display
> #regzbot link: https://bugzilla.kernel.org/show_bug.cgi?id=217328
> #regzbot link: https://lore.kernel.org/all/20230412095509.2196162-1-cyril@debamax.com/T/#m34493480243a2cad2ae359abfd9db5e755f41add
> #regzbot link: https://bugs.debian.org/1033058

No reply to my status inquiry[1] a few weeks ago, so I have to assume
nobody cares anymore. If somebody still cares, holler!

#regzbot inconclusive: no answer to a status inquiry
#regzbot ignore-activity

[1]
https://lore.kernel.org/lkml/d1aee7d3-05f6-0920-b8e1-4ed5cf3f9f70@leemhuis.info/

Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)
--
Everything you wanna know about Linux kernel regression tracking:
https://linux-regtracking.leemhuis.info/about/#tldr
If I did something stupid, please tell me, as explained on that page.
