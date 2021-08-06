Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B41B3E2A6E
	for <lists+dri-devel@lfdr.de>; Fri,  6 Aug 2021 14:15:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C8A8E6E0F4;
	Fri,  6 Aug 2021 12:15:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 490 seconds by postgrey-1.36 at gabe;
 Fri, 06 Aug 2021 12:15:23 UTC
Received: from ste-pvt-msa2.bahnhof.se (ste-pvt-msa2.bahnhof.se
 [213.80.101.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C1BE6E0F4;
 Fri,  6 Aug 2021 12:15:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by ste-pvt-msa2.bahnhof.se (Postfix) with ESMTP id 52C0A3F6EE;
 Fri,  6 Aug 2021 14:07:11 +0200 (CEST)
Authentication-Results: ste-pvt-msa2.bahnhof.se; dkim=pass (1024-bit key;
 unprotected) header.d=shipmail.org header.i=@shipmail.org header.b="NCzq7Mtg";
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at bahnhof.se
X-Spam-Flag: NO
X-Spam-Score: -2.223
X-Spam-Level: 
X-Spam-Status: No, score=-2.223 tagged_above=-999 required=6.31
 tests=[BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.124,
 URIBL_BLOCKED=0.001] autolearn=ham autolearn_force=no
Authentication-Results: ste-ftg-msa2.bahnhof.se (amavisd-new);
 dkim=pass (1024-bit key) header.d=shipmail.org
Received: from ste-pvt-msa2.bahnhof.se ([127.0.0.1])
 by localhost (ste-ftg-msa2.bahnhof.se [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PF3H0VQjJTPe; Fri,  6 Aug 2021 14:07:10 +0200 (CEST)
Received: by ste-pvt-msa2.bahnhof.se (Postfix) with ESMTPA id 9BFCB3F6E1;
 Fri,  6 Aug 2021 14:07:09 +0200 (CEST)
Received: from [192.168.0.209] (unknown [192.55.54.49])
 by mail1.shipmail.org (Postfix) with ESMTPSA id 28670360060;
 Fri,  6 Aug 2021 14:07:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=shipmail.org; s=mail;
 t=1628251628; bh=2cZ4OVwp4XiVl+gsAKy+wLNP7Fciza7YvMb1BLQE16Q=;
 h=Subject:From:To:Cc:References:Date:In-Reply-To:From;
 b=NCzq7Mtgv2HHU1reJ+uJMQHRtswn1T1WnE7O9CygmR9RQtxNfNZL3P0mg2DttNScp
 w761qQ0ye9hXC8LBjjistCT5wxy87lHXJgfAMcrbTxx8HhdESAuTA2jbypSfR2WqYq
 kU18baIrtNQ+GjBtOyRJBt1K5K1C08G1QodGd4o0=
Subject: Re: [Intel-gfx] [PATCH 0/4] Enable GuC submission by default on DG1
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m_=28Intel=29?= <thomas_os@shipmail.org>
To: Matthew Brost <matthew.brost@intel.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: intel-gfx <intel-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
References: <20210803051121.72017-1-matthew.brost@intel.com>
 <CAKMK7uGOAx7xM=6nDGtLqqW7sf2Rjbj24hAu8U9NK9J2t5+LwQ@mail.gmail.com>
 <20210803172623.GA82856@DUT151-ICLU.fm.intel.com>
 <b20f28eb-9efc-3d4e-57fa-c52c255063a5@shipmail.org>
Message-ID: <e7d35ec6-8129-5edd-2e94-df33bae3d92d@shipmail.org>
Date: Fri, 6 Aug 2021 14:07:02 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <b20f28eb-9efc-3d4e-57fa-c52c255063a5@shipmail.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 8/6/21 1:34 PM, Thomas Hellström (Intel) wrote:
> Hi,
>
> On 8/3/21 7:26 PM, Matthew Brost wrote:
>> On Tue, Aug 03, 2021 at 02:15:13PM +0200, Daniel Vetter wrote:
>>> On Tue, Aug 3, 2021 at 6:53 AM Matthew Brost 
>>> <matthew.brost@intel.com> wrote:
>>>> Minimum set of patches to enable GuC submission on DG1 and enable 
>>>> it by
>>>> default.
>>>>
>>>> A little difficult to test as IGTs do not work with DG1 due to a bunch
>>>> of uAPI features being disabled (e.g. relocations, caching memory
>>>> options, etc...).
>>> Matt Auld has an igt series which fixes a lot of this stuff, would be
>>> good to do at least a Test-With run with that.
>>>
> It looks like Maarten now merged Matt's series to IGT.
>
> There is a series on IGT trybot with pending work to have some igt 
> tests support relocations,
>
> https://patchwork.freedesktop.org/series/92043/
>
> One of the tests that have WIP fixes is gem_exec_whisper, and that 
> particular test has historically shown occasional hangs with GuC 
> submission on DG1 so it would be very desirable if we could make that 
> test in particular work (I haven't verified that that's the case) 
> reliably.
>
> Also the following series:
>
> https://patchwork.freedesktop.org/series/93455/
>
> tries a bit harder to get some more tests running, squashing the above 
> series on top of latest IGT.
>
> Thanks,
> /Thomas
>
And also while we're working on getting igt adapted to uapi changes and 
to get more LMEM coverage in there, an IMO relevant test case to run 
manually is "piglit quick"on top of DG1-enabled OpenGL checking for 
regressions and significant changes in execution time.

/Thomas


