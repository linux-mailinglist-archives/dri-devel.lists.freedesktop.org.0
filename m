Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BDBF41CE610
	for <lists+dri-devel@lfdr.de>; Mon, 11 May 2020 22:56:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 64D006E58B;
	Mon, 11 May 2020 20:56:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mtlfep02.bell.net (belmont80srvr.owm.bell.net [184.150.200.80])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C951589DBA;
 Mon, 11 May 2020 20:56:51 +0000 (UTC)
Received: from bell.net mtlfep02 184.150.200.30 by mtlfep02.bell.net with ESMTP
 id <20200511205650.TLGP3628.mtlfep02.bell.net@mtlspm01.bell.net>;
 Mon, 11 May 2020 16:56:50 -0400
Received: from [192.168.1.208] (really [70.49.140.223])
 by mtlspm01.bell.net with ESMTP
 id <20200511205650.JAUU130487.mtlspm01.bell.net@[192.168.1.208]>;
 Mon, 11 May 2020 16:56:50 -0400
Date: Mon, 11 May 2020 16:56:48 -0400
From: Al Dunsmuir <al.dunsmuir@sympatico.ca>
Message-ID: <1266714942.20200511165648@sympatico.ca>
To: Dave Airlie <airlied@gmail.com>, Alex Deucher <alexdeucher@gmail.com>
Subject: Re: [RFC] Remove AGP support from Radeon/Nouveau/TTM
In-Reply-To: <CAPM=9tysbcgQ-KR8+icQ=3e6+SECxkwHdVpP8=w0Pmh9ML_+Lw@mail.gmail.com>
References: <20200511171722.96576-1-christian.koenig@amd.com> 
 <1815605280.20200511161440@sympatico.ca>
 <CADnq5_MYPcAoWzCcBkJAkd858gCVbJpCJobiwH_BBbwgEdx5rA@mail.gmail.com>
 <CAPM=9tysbcgQ-KR8+icQ=3e6+SECxkwHdVpP8=w0Pmh9ML_+Lw@mail.gmail.com>
MIME-Version: 1.0
X-CM-Analysis: v=2.3 cv=I5Mbu+og c=1 sm=1 tr=0 a=nyNe8J8XL+yB5u22Hc0alw==:117
 a=nyNe8J8XL+yB5u22Hc0alw==:17 a=IkcTkHD0fZMA:10 a=sTwFKg_x9MkA:10
 a=pGLkceISAAAA:8 a=k_m-kdumAAAA:8 a=MKYSiYnM_ShKeF4uUZ4A:9 a=QEXdDO2ut3YA:10
 a=2aFmp3DG3lfw9CblUY6y:22
X-CM-Envelope: MS4wfIx70+UzrDIciCO0zrkfyt17Douf6fJwd69A/rgJ6esorF4fGqIvCGHQ7lKO4EppqyAUqESAU0JrhzQkfEaoFNXBJbn6aHQ+q3EsRzWGoBosFMY7v9gA
 UEAE/d0KHpQ5x+bxf5cuuFcBs8sWBH+nJDG34jHF52xVwwXHFMDt0SVuzk+yirLlwNeet9xFomoR3UM5Raf6Havft3P2YUekwWG8ucHMhnv5/nE2W8M/LLsy
 h+4rmFRXszaR/A5CnoukTR2o8ctzLgV9uH9EhAqDexdfc61dQvwUM4BptH9FjWlL
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
Cc: =?utf-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 nouveau <nouveau@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello Dave,

On Monday, May 11, 2020, 4:43:01 PM, Dave Airlie wrote:
> On Tue, 12 May 2020 at 06:28, Alex Deucher <alexdeucher@gmail.com> wrote:
>>
>> On Mon, May 11, 2020 at 4:22 PM Al Dunsmuir <al.dunsmuir@sympatico.ca> wrote:
>> Note there is no loss of functionality here, at least on radeon
>> hardware.  It just comes down to which MMU gets used for access to
>> system memory, the AGP MMU on the chipset or the MMU built into the
>> GPU.  On powerpc hardware, AGP has been particularly unstable, and AGP
>> has been disabled by default on radeon on powerpc for years now.  In
>> fact, this will probably make older hardware more reliable as it takes
>> AGP out of the equation.
>>

> From memory there is quite a loss in speed though, like pretty severe.

> The radeon PCI GART has a single slot TLB, if memory serves.

> I think this is going to be a hard sell at this stage, I'm guessing
> users will crawl out of the woodwork, I'm sure with 2 hours after I'm
> able to access the office, I can boot the 865 AGP box with an rv350 in
> it on a modern distro.

> Maybe we can find some way to compartmentalise AGP further?

> Dave.

Significantly   reduced  caching  on memory accesses definitely sounds
like something that would be noticeable and objectionable.

I would speculate that this would also vary a lot across chipsets,
depending on the capabilities of the PCI MMU vs the AGP MMU.

In the end, it may be best to leave things as is, or as Dave suggested
try to keep AGP in the picture.  

Nothing is ever simple, is it?
Al


_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
