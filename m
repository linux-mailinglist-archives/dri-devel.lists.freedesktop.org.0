Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E9D0A80E043
	for <lists+dri-devel@lfdr.de>; Tue, 12 Dec 2023 01:28:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A4B0D10E16E;
	Tue, 12 Dec 2023 00:28:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from vps.thesusis.net (vps.thesusis.net
 [IPv6:2600:1f18:60b9:2f00:6f85:14c6:952:bad3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E4B5610E16E;
 Tue, 12 Dec 2023 00:28:29 +0000 (UTC)
Received: by vps.thesusis.net (Postfix, from userid 1000)
 id 06F6714D25B; Mon, 11 Dec 2023 19:28:29 -0500 (EST)
From: Phillip Susi <phill@thesusis.net>
To: Alex Deucher <alexdeucher@gmail.com>
Subject: Re: Radeon regression in 6.6 kernel
In-Reply-To: <87y1e05me4.fsf@vps.thesusis.net>
References: <87edgv4x3i.fsf@vps.thesusis.net>
 <559d0fa5-953a-4a97-b03b-5eb1287c83d8@leemhuis.info>
 <CAPM=9tw-8pQWFso0zuLqpsqd5BSHWtc4As9ttdjY-DDr70EMqQ@mail.gmail.com>
 <bdb238b6-60c7-4f26-81d0-9e62cd5dd326@gmail.com>
 <CADnq5_NVGS1XykxGxpcu_bpPbzboCUJQkcCF3r+0N9a23KUgiQ@mail.gmail.com>
 <96e2e13c-f01c-4baf-a9a3-cbaa48fb10c7@amd.com>
 <CADnq5_NBfeAXEyQw0gnSd67=tR-bUKg8w=10+4z9pGGuRnP9uw@mail.gmail.com>
 <87jzq2ixtm.fsf@vps.thesusis.net>
 <CADnq5_Ou-MVVm0rdWDmDnJNLkWUayXzO26uCEtz3ucNa4Ghy2w@mail.gmail.com>
 <95fe9b5b-05ce-4462-9973-9aca306bc44f@gmail.com>
 <CADnq5_MYEWx=e1LBLeVs0UbR5_xEScjDyw_-75mLe8RAMnqh6g@mail.gmail.com>
 <CADnq5_OC=JFpGcN0oGbTF5xYEt4X3r0=jEY6hJ12W8CzYq1+cA@mail.gmail.com>
 <9595b8bf-e64d-4926-9263-97e18bcd7d05@gmail.com>
 <CADnq5_N6DF-huOzgaVygvS5N_j_oNUEC1aa4zRsZTzx8GOD_aw@mail.gmail.com>
 <CADnq5_PgMxoW=4iabtgeHydwye-6DvwvCyETdfBToEpuYWocmA@mail.gmail.com>
 <CADnq5_P0S7Jem0e4K6mG2+bboG8P56nELaGC1p4Pfx-8eV-BjQ@mail.gmail.com>
 <CADnq5_Oy6RMyJ52TbsxVjZ=0p=wYJHduE4X8B3DiYnqHYJUAvw@mail.gmail.com>
 <87edg3koka.fsf@vps.thesusis.net>
 <CADnq5_PtSV1C6Up78XX8ejExqaiM-wzHVFhCRtxboS1Y4cF-Ow@mail.gmail.com>
 <87y1e05me4.fsf@vps.thesusis.net>
Date: Mon, 11 Dec 2023 19:28:28 -0500
Message-ID: <87r0jsw9g3.fsf@vps.thesusis.net>
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
 Luben Tuikov <ltuikov89@gmail.com>,
 Christian =?utf-8?Q?K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Danilo Krummrich <dakr@redhat.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 Christian =?utf-8?Q?K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Phillip Susi <phill@thesusis.net> writes:

> And it works, but 6.7-rc5 does not, even though it includes that patch.
> Here's the syslog from the attempt.  I'll start bisecting again.

I checked out the patch that got merged upstream and it also fails.  I
looked at the two commits, and I see what happened.  Your original patch
MOVED the call to amdgpu_ttm_set_buffer_funcs_status().  The one that
got merged into Linus' tree instead DUPLICATES the call.  Oops?

