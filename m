Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CFEFB93E021
	for <lists+dri-devel@lfdr.de>; Sat, 27 Jul 2024 18:28:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD98B10E02D;
	Sat, 27 Jul 2024 16:28:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=leemhuis.info header.i=@leemhuis.info header.b="UfwWXRY0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de
 [80.237.130.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1001E10E02D;
 Sat, 27 Jul 2024 16:28:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=leemhuis.info; s=he214686; h=Content-Transfer-Encoding:Content-Type:
 In-Reply-To:Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
 Message-ID:From:Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:
 Content-Type:Content-Transfer-Encoding:Content-ID:Content-Description:
 In-Reply-To:References; bh=6woDU4xkf0yXoBT9uAn0Jihe89Zin8AHAJkgz1oPFS4=;
 t=1722097712; x=1722529712; b=UfwWXRY0yL141e15Bzv9WLnL5rKED0Y0pb9gEVsBRBgEoaJ
 Udg+qXew7aJmFV3o6+MJXGR+7YXOk2iLKl2lNb5WHVDlxCgy/i9ehfiWgcdtJUCZ2JwqNvoVY88E0
 qZpB894F0nhIJ/puaYrbcs9AH+Lmw6p7qX5xOsOyVKRMX+7Zjz5ZBUWDgGiPosUVX4jbl61d3IsMf
 sj2ieEPwJpv4Na7I48BHITHcjYbC17BaMDnt6ppvSGElJhOB9avKqpD1mk2MOFoJa4xSB3y3CsNa6
 MROAiXbqTy9+zm7TUyquhPvVY/1tKqOdeql2JywmaIqE+Oo/BCwBqqxObbV0KJuw==;
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
 by wp530.webpack.hosteurope.de running ExIM with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 id 1sXkHV-00007W-6i; Sat, 27 Jul 2024 18:28:29 +0200
Message-ID: <9ca719e4-2790-4804-b2cb-4812899adfe8@leemhuis.info>
Date: Sat, 27 Jul 2024 18:28:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [REGRESSION] No image on 4k display port displays connected
 through usb-c dock in kernel 6.10
To: kevin@holm.dev, Alex Deucher <alexander.deucher@amd.com>,
 Hersen Wu <hersenxs.wu@amd.com>, Wayne Lin <wayne.lin@amd.com>
Cc: regressions@lists.linux.dev, stable@vger.kernel.org,
 LKML <linux-kernel@vger.kernel.org>,
 ML dri-devel <dri-devel@lists.freedesktop.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
References: <d74a7768e957e6ce88c27a5bece0c64dff132e24@holm.dev>
From: "Linux regression tracking (Thorsten Leemhuis)"
 <regressions@leemhuis.info>
Content-Language: en-US, de-DE
In-Reply-To: <d74a7768e957e6ce88c27a5bece0c64dff132e24@holm.dev>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de; regressions@leemhuis.info; 1722097712;
 09bda657; 
X-HE-SMSGID: 1sXkHV-00007W-6i
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

[adding a few people and lists to the recipients]

Hi! Thx for your rpeort.

On 27.07.24 18:07, kevin@holm.dev wrote:
> Connecting two 4k displays with display port through a lenovo usb-c
> dock (type 40AS) to a Lenovo P14s Gen 2 (type 21A0) results in no
> image on the connected displays.
> 
> The CPU in the Lenovo P14s is a 'AMD Ryzen 7 PRO 5850U with Radeon
> Graphics' and it has no discrete GPU.
> 
> I first noticed the issue with kernel version '6.10.0-arch1-2'
> provided by arch linux. With the previous kernel version
> '6.9.10.arch1-1' both connected displays worked normally. I reported
> the issue in the arch forums at
> https://bbs.archlinux.org/viewtopic.php?id=297999 and was guided to
> do a bisection to find the commit that caused the problem. Through
> testing I identified that the issue is not present in the latest
> kernel directly compiled from the trovalds/linux git repository.
> 
> With git bisect I identified 4df96ba66760345471a85ef7bb29e1cd4e956057

That's 4df96ba6676034 ("drm/amd/display: Add timing pixel encoding for
mst mode validation") [v6.10-rc1] from Hersen Wu.

Did you try if reverting that commit is possible and might fix the problem?

> as the first bad commit and fa57924c76d995e87ca3533ec60d1d5e55769a27

That's fa57924c76d995 ("drm/amd/display: Refactor function
dm_dp_mst_is_port_support_mode()") [v6.10-post] from Wayne Lin.

> as the first commit that fixed the problem again.

Hmm, the latter commit does not have a fixes tag and might or might not
be to invasive to backport to 6.10. Let's see what the AMD developers say.

> The initial commit only still shows an image on one of the connected
> 4k screens. I have not investigated further to find out at what point
> both displays stopped showing an image.

Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)
--
Everything you wanna know about Linux kernel regression tracking:
https://linux-regtracking.leemhuis.info/about/#tldr
If I did something stupid, please tell me, as explained on that page.
