Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E975D7FAE3F
	for <lists+dri-devel@lfdr.de>; Tue, 28 Nov 2023 00:25:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3FA4D10E407;
	Mon, 27 Nov 2023 23:24:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from vps.thesusis.net (vps.thesusis.net
 [IPv6:2600:1f18:60b9:2f00:6f85:14c6:952:bad3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 56DC310E407;
 Mon, 27 Nov 2023 23:24:54 +0000 (UTC)
Received: by vps.thesusis.net (Postfix, from userid 1000)
 id 64FAA14ACC1; Mon, 27 Nov 2023 18:24:53 -0500 (EST)
From: Phillip Susi <phill@thesusis.net>
To: Alex Deucher <alexdeucher@gmail.com>, Christian =?utf-8?Q?K=C3=B6nig?=
 <christian.koenig@amd.com>
Subject: Re: Radeon regression in 6.6 kernel
In-Reply-To: <CADnq5_NBfeAXEyQw0gnSd67=tR-bUKg8w=10+4z9pGGuRnP9uw@mail.gmail.com>
References: <87edgv4x3i.fsf@vps.thesusis.net>
 <559d0fa5-953a-4a97-b03b-5eb1287c83d8@leemhuis.info>
 <CAPM=9tw-8pQWFso0zuLqpsqd5BSHWtc4As9ttdjY-DDr70EMqQ@mail.gmail.com>
 <bdb238b6-60c7-4f26-81d0-9e62cd5dd326@gmail.com>
 <CADnq5_NVGS1XykxGxpcu_bpPbzboCUJQkcCF3r+0N9a23KUgiQ@mail.gmail.com>
 <96e2e13c-f01c-4baf-a9a3-cbaa48fb10c7@amd.com>
 <CADnq5_NBfeAXEyQw0gnSd67=tR-bUKg8w=10+4z9pGGuRnP9uw@mail.gmail.com>
Date: Mon, 27 Nov 2023 18:24:53 -0500
Message-ID: <87jzq2ixtm.fsf@vps.thesusis.net>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: Linux regressions mailing list <regressions@lists.linux.dev>,
 Christian =?utf-8?Q?K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 linux-kernel@vger.kernel.org,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 Luben Tuikov <luben.tuikov@amd.com>, dri-devel@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Alex Deucher <alexdeucher@gmail.com> writes:

>> In that case those are the already known problems with the scheduler
>> changes, aren't they?
>
> Yes.  Those changes went into 6.7 though, not 6.6 AFAIK.  Maybe I'm
> misunderstanding what the original report was actually testing.  If it
> was 6.7, then try reverting:
> 56e449603f0ac580700621a356d35d5716a62ce5
> b70438004a14f4d0f9890b3297cd66248728546c

At some point it was suggested that I file a gitlab issue, but I took
this to mean it was already known and being worked on.  -rc3 came out
today and still has the problem.  Is there a known issue I could track?

