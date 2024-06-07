Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B0C290038E
	for <lists+dri-devel@lfdr.de>; Fri,  7 Jun 2024 14:29:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC2CD10E052;
	Fri,  7 Jun 2024 12:29:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=leemhuis.info header.i=@leemhuis.info header.b="LTb6NBAD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de
 [80.237.130.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E1DA410E052;
 Fri,  7 Jun 2024 12:29:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=leemhuis.info; s=he214686; h=Content-Transfer-Encoding:Content-Type:
 In-Reply-To:Reply-To:Cc:From:References:To:Subject:MIME-Version:Date:
 Message-ID:From:Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:
 Content-Type:Content-Transfer-Encoding:Content-ID:Content-Description:
 In-Reply-To:References; bh=0b/H9LXWLQSWch5rZCiHKuXD5l8MSK7jrgpIZrym1aA=;
 t=1717763390; x=1718195390; b=LTb6NBADlTohdtKKIvfbsOqSpyg3XM5eeIIZk6iHRHjN3DC
 xD7Iw2VlB5l+J1NTVXOHxMsjsQPlsY/LFDG8yT6yERnYUxgWHFykyhUoGgDMnSMXodgkcEbHkQiUm
 3YB6CLejhyWU9Ln71Ni0SsC3wgygF3dP968PgmRLUWf6MnVI315AAu6/3dC5CxlV98uXLD4CqouL4
 csfxqSOyIR7Vq8uVtnmiIwFzL2y7mXOzKh6lmzBdG9u6vJy4PHV2aBZzOK3pHc0einNTWhgASSfZv
 y3WsPVyPxjLEXWXUysqftddjNxNoyim02QQMogK67pngVNhAK+knnje1hj7ztXSw==;
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
 by wp530.webpack.hosteurope.de running ExIM with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 id 1sFYj6-00021T-4E; Fri, 07 Jun 2024 14:29:48 +0200
Message-ID: <907df295-61b2-4cb4-9bcc-608d1ff2cf18@leemhuis.info>
Date: Fri, 7 Jun 2024 14:29:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: 6.10/bisected/regression - commits bc87d666c05 and 6d4279cb99ac
 cause appearing green flashing bar on top of screen on Radeon 6900XT and
 120Hz
To: "Deucher, Alexander" <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 "Pan, Xinhui" <Xinhui.Pan@amd.com>
References: <CABXGCsNptxsQO=5=qi-JYiFX=rX8Ok5inK80Gn0qrUFWbtBGng@mail.gmail.com>
 <CABXGCsN=9UFvGgKztzkkAM1c8cVN-h=TKLLxWhKgTm11h+H-eg@mail.gmail.com>
From: "Linux regression tracking (Thorsten Leemhuis)"
 <regressions@leemhuis.info>
Content-Language: en-US, de-DE
Cc: Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>,
 Hamza Mahfooz <hamza.mahfooz@amd.com>, Rodrigo.Siqueira@amd.com,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Linux regressions mailing list <regressions@lists.linux.dev>,
 Linux List Kernel Mailing <linux-kernel@vger.kernel.org>
In-Reply-To: <CABXGCsN=9UFvGgKztzkkAM1c8cVN-h=TKLLxWhKgTm11h+H-eg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-bounce-key: webpack.hosteurope.de; regressions@leemhuis.info; 1717763391;
 e682ed03; 
X-HE-SMSGID: 1sFYj6-00021T-4E
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

[CCing the other amd drm maintainers]

On 05.06.24 14:04, Mikhail Gavrilov wrote:
> On Sun, May 26, 2024 at 7:06 PM Mikhail Gavrilov
> <mikhail.v.gavrilov@gmail.com> wrote:
>>
>> Day before yesterday I replaced 7900XTX to 6900XT for got clear in
>> which kernel first time appeared warning message "DMA-API: amdgpu
>> 0000:0f:00.0: cacheline tracking EEXIST, overlapping mappings aren't
>> supported".
>> The kernel 6.3 and older won't boot on a computer with Radeon 7900XTX.

Mikhail: are those details in any way relevant? Then in the future best
leave them out (or make things easier to follow), they make the bug
report confusing and sounds like this is just a bug, when it fact from
your bisection is sounds like this is a regression.

Anyway, @amd maintainers: is there a reason why this report did not get
at least a single reply? Or was there some progress somewhere and I just
missed it? Or would it be better if Mikhail would report this to
https://gitlab.freedesktop.org/drm/amd/-/issues/ ?

Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)
--
Everything you wanna know about Linux kernel regression tracking:
https://linux-regtracking.leemhuis.info/about/#tldr
If I did something stupid, please tell me, as explained on that page.

#regzbot poke

>> When I booted the system with 6900XT I saw a green flashing bar on top
>> of the screen when I typed commands in the gnome terminal which was
>> maximized on full screen.
>>
>> Demonstration: https://youtu.be/tTvwQ_5pRkk
>> For reproduction you need Radeon 6900XT GPU connected to 120Hz OLED TV by HDMI.
>>
>> I bisected the issue and the first commit which I found was 6d4279cb99ac.
>> commit 6d4279cb99ac4f51d10409501d29969f687ac8dc (HEAD)
>> Author: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
>> Date:   Tue Mar 26 10:42:05 2024 -0600
>>
>>     drm/amd/display: Drop legacy code
>>
>>     This commit removes code that are not used by display anymore.
>>
>>     Acked-by: Hamza Mahfooz <hamza.mahfooz@amd.com>
>>     Signed-off-by: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
>>     Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
>>
>>  drivers/gpu/drm/amd/display/dc/inc/hw/stream_encoder.h         |  4 ----
>>  drivers/gpu/drm/amd/display/dc/inc/resource.h                  |  7 -------
>>  drivers/gpu/drm/amd/display/dc/optc/dcn20/dcn20_optc.c         | 10 ----------
>>  drivers/gpu/drm/amd/display/dc/resource/dcn21/dcn21_resource.c | 33
>> +--------------------------------
>>  4 files changed, 1 insertion(+), 53 deletions(-)
>>
>> Every time after bisecting I usually make sure that I found the right
>> commit and build the kernel with revert of the bad commit.
>> But this time I again observed an issue after running a kernel builded
>> without commit 6d4279cb99ac.
>> And I decided to find a second bad commit.
>> The second bad commit has been bc87d666c05.
>> commit bc87d666c05a13e6d4ae1ddce41fc43d2567b9a2 (HEAD)
>> Author: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
>> Date:   Tue Mar 26 11:55:19 2024 -0600
>>
>>     drm/amd/display: Add fallback configuration for set DRR in DCN10
>>
>>     Set OTG/OPTC parameters to 0 if something goes wrong on DCN10.
>>
>>     Acked-by: Hamza Mahfooz <hamza.mahfooz@amd.com>
>>     Signed-off-by: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
>>     Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
>>
>>  drivers/gpu/drm/amd/display/dc/optc/dcn10/dcn10_optc.c | 15 ++++++++++++---
>>  1 file changed, 12 insertions(+), 3 deletions(-)
>>
>> After reverting both these commits on top of 54f71b0369c9 the issue is gone.
>>
>> I also attach the build config.
>>
>> My hardware specs: https://linux-hardware.org/?probe=f25a873c5e
>>
>> Rodrigo or anyone else from the AMD team can you look please.
>>
> 
> Did anyone watch?
> 
