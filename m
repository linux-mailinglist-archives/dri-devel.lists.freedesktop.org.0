Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 638BA710AD2
	for <lists+dri-devel@lfdr.de>; Thu, 25 May 2023 13:24:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 42FCF10E009;
	Thu, 25 May 2023 11:24:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de
 [80.237.130.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A6E9110E009
 for <dri-devel@lists.freedesktop.org>; Thu, 25 May 2023 11:24:46 +0000 (UTC)
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
 by wp530.webpack.hosteurope.de running ExIM with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 id 1q295H-0007uO-Dj; Thu, 25 May 2023 13:24:43 +0200
Message-ID: <d4879ff1-b9ac-0373-ceb2-beaa645fba23@leemhuis.info>
Date: Thu, 25 May 2023 13:24:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [Nouveau] Fwd: absent both plymouth, and video= on linu lines,
 vtty[1-6] framebuffers produce vast raster right and bottom borders on the
 larger resolution of two displays
Content-Language: en-US, de-DE
To: Bagas Sanjaya <bagasdotme@gmail.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Regressions <regressions@lists.linux.dev>,
 Linux Framebuffer <linux-fbdev@vger.kernel.org>,
 DRI Development List <dri-devel@lists.freedesktop.org>,
 Linux Nouveau/NVIDIA <nouveau@lists.freedesktop.org>,
 Linux Stable <stable@vger.kernel.org>
References: <e8f93560-a2f6-8e9f-031a-88d333482a31@gmail.com>
 <585f36f8-431a-e929-0a04-ffb65f02e9df@gmail.com>
From: Thorsten Leemhuis <regressions@leemhuis.info>
In-Reply-To: <585f36f8-431a-e929-0a04-ffb65f02e9df@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de; regressions@leemhuis.info; 1685013886;
 17d9fab6; 
X-HE-SMSGID: 1q295H-0007uO-Dj
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
Cc: Helge Deller <deller@gmx.de>, Felix Miata <mrmazda@earthlink.net>,
 Ben Skeggs <bskeggs@redhat.com>, Antonino Daplas <adaplas@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 25.05.23 12:55, Bagas Sanjaya wrote:
> On 5/25/23 17:52, Bagas Sanjaya wrote:
>>
>> I notice a regression report on Bugzilla [1]. Quoting from it:
>> [...]
>> Anyway, I'm adding it to regzbot:
>>
>> #regzbot introduced: v6.1.12..v6.2.12
>> #regzbot title: vast raster right and bottom borders on larger display (two displays with inequal resolution) unless forcing resolution with video= parameter

Bagas, thx again for your efforts, much appreciated. But I guess for drm
drivers that have a line like

B: https://gitlab.freedesktop.org/drm/[...]

in MAINTAINERS (which includes all the popular drm drivers) this just
creates a lot of confusion for everyone, as one issue will likely end up
being discussed in two or three places in parallel (bugzilla,
freedesktop, email). Better tell reporters to move their issue to the
freedesktop drm tracker and close the ticket in bugzilla. And don't get
regzbot involved, as it for now it sadly is unable to monitor the
freedesktop drm tracker (sooner or later I'll fix that, but for now it's
a blind spot :-/).

Pretty sure none of the DRM developers will disagree, but if I'm wrong,
please holler.

> Oops, I forget to add bugzilla link:
> 
> #regzbot introduced: v6.1.12..v6.2.12 https://bugzilla.kernel.org/show_bug.cgi?id=217479
> #regzbot from: Felix Miata <mrmazda@earthlink.net>

Side note: that currently does not work with regzbot. :-/ Whatever, I'll
remove it from the tracking due to above reasons:

#regzbot inconclusive: sadly not tracked for now

Ciao, Thorsten
