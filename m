Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 508CE4E305C
	for <lists+dri-devel@lfdr.de>; Mon, 21 Mar 2022 20:00:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC30210E3A0;
	Mon, 21 Mar 2022 19:00:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de
 [IPv6:2a01:488:42:1000:50ed:8234::])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6805710E3A0;
 Mon, 21 Mar 2022 19:00:36 +0000 (UTC)
Received: from ip4d144895.dynamic.kabel-deutschland.de ([77.20.72.149]
 helo=[192.168.66.200]); authenticated
 by wp530.webpack.hosteurope.de running ExIM with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 id 1nWNGY-0001D5-7r; Mon, 21 Mar 2022 20:00:31 +0100
Message-ID: <b3c39447-c02a-a021-8a4f-499aa962980c@leemhuis.info>
Date: Mon, 21 Mar 2022 20:00:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: Regression from 3c196f056666 ("drm/amdgpu: always reset the asic
 in suspend (v2)") on suspend?
Content-Language: en-US
To: dod@debian.org, Eric Valette <eric.valette@free.fr>,
 Salvatore Bonaccorso <carnil@debian.org>
References: <Ygf7KuWyc0d4HIFu@eldamar.lan>
 <CADnq5_MWqz7-XhOS4zfuzi3=_nKa72iYaO0BcKNcVDwEvZ+YHw@mail.gmail.com>
 <61c2b2ce-d749-3723-ad27-f40e1c49d967@leemhuis.info>
 <3873010.MHq7AAxBmi@ylum>
From: Thorsten Leemhuis <regressions@leemhuis.info>
In-Reply-To: <3873010.MHq7AAxBmi@ylum>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de; regressions@leemhuis.info; 1647889236;
 03ad7ec8; 
X-HE-SMSGID: 1nWNGY-0001D5-7r
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

On 21.03.22 19:49, Dominique Dumont wrote:
> On Monday, 21 March 2022 09:57:59 CET Thorsten Leemhuis wrote:
>> Dominique/Salvatore/Eric, what's the status of this regression?
>> According to the debian bug tracker the problem is solved with 5.16 and
>> 5.17, but was 5.15 ever fixed?
> 
> I don't think so.
> 
> On kernel side, the commit fixing this issue is
> e55a3aea418269266d84f426b3bd70794d3389c8 . 
> 
> According to the logs of [1] , this commit landed in v5.17-rc3
> 
> HTH
> 
> [1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git

And from there it among others got backported to 5.15.22:

https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/?h=linux-5.15.y&id=8a15ac1786c92dce6ecbeb4e4c237f5f80c2c703

https://lwn.net/Articles/884107/

Another indicator that Eric's problem is something else.

Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)

P.S.: As the Linux kernel's regression tracker I'm getting a lot of
reports on my table. I can only look briefly into most of them and lack
knowledge about most of the areas they concern. I thus unfortunately
will sometimes get things wrong or miss something important. I hope
that's not the case here; if you think it is, don't hesitate to tell me
in a public reply, it's in everyone's interest to set the public record
straight.


