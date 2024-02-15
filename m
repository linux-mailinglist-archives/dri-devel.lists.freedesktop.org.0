Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 917A8855A42
	for <lists+dri-devel@lfdr.de>; Thu, 15 Feb 2024 07:00:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6415110E1F5;
	Thu, 15 Feb 2024 05:59:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de
 [80.237.130.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D65910E208;
 Thu, 15 Feb 2024 05:59:51 +0000 (UTC)
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
 by wp530.webpack.hosteurope.de running ExIM with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 id 1raUmg-0001pd-LG; Thu, 15 Feb 2024 06:59:46 +0100
Message-ID: <e65c6dc4-9b43-4c97-bb4c-d9c14655835d@leemhuis.info>
Date: Thu, 15 Feb 2024 06:59:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Bug#1061449: linux-image-6.7-amd64: a boot message from amdgpu
Content-Language: en-US, de-DE
To: regressions@lists.linux.dev
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <170612149675.7169.757906919183146487.reportbug@kos-moceratops.home>
 <ZbUB0YWxEET3Y0xA@eldamar.lan>
From: "Linux regression tracking #update (Thorsten Leemhuis)"
 <regressions@leemhuis.info>
In-Reply-To: <ZbUB0YWxEET3Y0xA@eldamar.lan>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de; regressions@leemhuis.info; 1707976796;
 db5397b1; 
X-HE-SMSGID: 1raUmg-0001pd-LG
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 27.01.24 14:14, Salvatore Bonaccorso wrote:
> 
> In Debian (https://bugs.debian.org/1061449) we got the following
> quotred report:
> 
> On Wed, Jan 24, 2024 at 07:38:16PM +0100, Patrice Duroux wrote:
>> Package: src:linux
>> Version: 6.7.1-1~exp1
>> Severity: normal
>>
>> Giving a try to 6.7, here is a message extracted from dmesg:
>>
>> [    4.177226] ------------[ cut here ]------------
>> [    4.177227] WARNING: CPU: 6 PID: 248 at
>> drivers/gpu/drm/amd/amdgpu/../display/dc/link/link_factory.c:387
>> construct_phy+0xb26/0xd60 [amdgpu]
> 
> Analysis showed that this appears to be a regression from b17ef04bf3a4
> ("drm/amd/display: Pass pwrseq inst for backlight and ABM"). Does that
> ring some bells?
> 
> See: https://bugs.debian.org/1061449#27
> 
> #regzbot introduced: b17ef04bf3a4
> #regzbot link: https://bugs.debian.org/1061449
> #regzbot title: Regression by b17ef04bf3a4 ("drm/amd/display: Pass pwrseq inst for backlight and ABM")

#regzbot monitor:
https://lore.kernel.org/amd-gfx/20240214184006.1356137-8-Rodrigo.Siqueira@amd.com/
#regzbot fix: drm/amd/display: Only allow dig mapping to pwrseq in new asic
#regzbot ignore-activity

Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)
--
Everything you wanna know about Linux kernel regression tracking:
https://linux-regtracking.leemhuis.info/about/#tldr
That page also explains what to do if mails like this annoy you.
