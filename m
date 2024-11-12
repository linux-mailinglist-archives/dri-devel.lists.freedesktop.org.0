Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A8B99C57D2
	for <lists+dri-devel@lfdr.de>; Tue, 12 Nov 2024 13:34:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 04FC010E5D8;
	Tue, 12 Nov 2024 12:34:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=leemhuis.info header.i=@leemhuis.info header.b="gOXIrwxv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de
 [80.237.130.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 970E810E5DE;
 Tue, 12 Nov 2024 12:34:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=leemhuis.info; s=he214686; h=Content-Transfer-Encoding:Content-Type:
 In-Reply-To:Reply-To:Cc:From:References:To:Subject:MIME-Version:Date:
 Message-ID:From:Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:
 Content-Type:Content-Transfer-Encoding:Content-ID:Content-Description:
 In-Reply-To:References; bh=bz78wy1Ojt/VhaI70iMSW/EP3C6fegnHr1blD2YOME4=;
 t=1731414888; x=1731846888; b=gOXIrwxvY2UzkdsiqS+nfDqSaVdkbVFQiOXpt6zizljD4Ra
 QgaJ1mqz0amtYtacHq9c/U1z7DwAYhPyxImCrFgAakLGqhpMdV1vOJ3e82nNWBSg282la6j1AZr1l
 CLuU3liPAQ9nD+Xjl7hLjZ4wP+EQcFT6PJrXhbGDLiFRrvxazxg7z5NZjgypex2T4S+ndXMyW1NCn
 9q3ZguUlrywLgFtHIn1W80Rsu5/3CXfO+gKKn5wuWT4HqEHgfEwvuuSuU9dJH9m/l1kqZcDnQv5fz
 YYiqmkUsM4suWuOkNbNK2DHnvUrNOk34MwrFsLR0o/cca83bpzTkdHMOm67nFdRw==;
Received: from [2a02:8108:8980:2478:87e9:6c79:5f84:367d]; authenticated
 by wp530.webpack.hosteurope.de running ExIM with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 id 1tAq6T-00042N-MY; Tue, 12 Nov 2024 13:34:41 +0100
Message-ID: <44c39c87-90e2-4a74-a185-752c14f6d711@leemhuis.info>
Date: Tue, 12 Nov 2024 13:34:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [REGRESSION] GM20B pmu timeout
To: airlied@gmail.com
References: <20241010133253.30311-1-diogo.ivo@tecnico.ulisboa.pt>
 <041511ee-4556-422a-8604-30b5e0dfd21c@leemhuis.info>
 <D5DDUQJOZ4HW.1XDOASECJR714@tecnico.ulisboa.pt>
From: "Linux regression tracking (Thorsten Leemhuis)"
 <regressions@leemhuis.info>
Content-Language: en-MW
Cc: kherbst@redhat.com, linux-kernel@vger.kernel.org, dakr@redhat.com,
 lyude@redhat.com, bskeggs@nvidia.com, simona@ffwll.ch,
 dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>,
 Linux regressions mailing list <regressions@lists.linux.dev>,
 Danilo Krummrich <dakr@kernel.org>
In-Reply-To: <D5DDUQJOZ4HW.1XDOASECJR714@tecnico.ulisboa.pt>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de; regressions@leemhuis.info; 1731414888;
 c9f82ce0; 
X-HE-SMSGID: 1tAq6T-00042N-MY
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

[CCing Danilo, who committed the culprit]

On 04.11.24 13:11, Diogo Ivo wrote:
> On Tue Oct 15, 2024 at 7:13 PM WEST, Linux regression tracking (Thorsten Leemhuis) wrote:
>> On 10.10.24 15:32, Diogo Ivo wrote:
>>>
>>> Somewhere between 6.11-rc4 and 6.11-rc5 the following error message is displayed
>>> when trying to initialize a nvc0_screen on the Tegra X1's GM20B:
>>>
>>> [ 34.431210] nouveau 57000000.gpu: pmu:hpq: timeout waiting for queue ready
>>> [ 34.438145] nouveau 57000000.gpu: gr: init failed, -110
>>> nvc0_screen_create:1075 - Error allocating PGRAPH context for M2MF: -110
>>> failed to create GPU screen
>>
>> Thx for the report. Hmmm. No reply so far. :-/
>>
>> Diogo, maybe report this here as well:
>> https://gitlab.freedesktop.org/drm/nouveau/-/issues/
>>
>> Afterwards drop a link to the ticket here. Reporting nouveau issues via
>> email should work, but maybe you have more luck there.
> 
> Gentle ping on this topic.

@airlied: I missed this earlier (and I assume you did, too), but seems
this regression is caused by the following change of yours:
9b340aeb26d50e ("nouveau/firmware: use dma non-coherent allocator")

For the full report see the start of the thread here:
https://lore.kernel.org/all/20241010133253.30311-1-diogo.ivo@tecnico.ulisboa.pt/

Diogo submitted an issue to the nouveau tracker as well:
https://gitlab.freedesktop.org/drm/nouveau/-/issues/391

Another user just joined and reported seeing similar problems.

And I just noticed there is another regression report bisected to the
same change:
https://gitlab.freedesktop.org/drm/nouveau/-/issues/388

Two users there are affected by the change; one of them in the 6.6.y
series and a revert there was able to fix this.

Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)
--
Everything you wanna know about Linux kernel regression tracking:
https://linux-regtracking.leemhuis.info/about/#tldr
If I did something stupid, please tell me, as explained on that page.

#regzbot poke
