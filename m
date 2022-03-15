Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 361F04D9536
	for <lists+dri-devel@lfdr.de>; Tue, 15 Mar 2022 08:25:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3476610E4B3;
	Tue, 15 Mar 2022 07:25:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-4323.proton.ch (mail-4323.proton.ch [185.70.43.23])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 12FB310E484;
 Tue, 15 Mar 2022 07:25:37 +0000 (UTC)
Date: Tue, 15 Mar 2022 07:25:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail2; t=1647329134;
 bh=lhAwjz8Zfgx1uhhNxtYrRG2Zz+yonadhptfDVVXvQpM=;
 h=Date:To:From:Cc:Reply-To:Subject:Message-ID:In-Reply-To:
 References:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
 Message-ID;
 b=c66oqLxYI3c4dXx1crmC7rDGMwd6ZDii8LBE2vDsDuT9e+IFPAMHcC19nYf0lItOB
 ylPiHCGHslif0YLPQqXEyQjcZtTATJzBAD5JwQM7ohKXDkMdtI/47WLrvg6nSaY/9/
 oMrigRZYGzVNT4Y5EV/2oW/GkWncKE+cbavhmbODgaiqfWZto8LpIbF+d/wB8x/8GL
 SUNdP1MjvZwfFuAmqHDqmxIfcJlSkXsPpPaBsP/VdqzOTQVzwtIgo7+FPsVDhtXSfn
 N2znsGOwKf3XcLDDyMCXveU7DbMKXvevYRdRU1jkjc8ZRRcurPSrgxCDHVESfRNSMS
 UDWs0xkY8c2aw==
To: Dave Airlie <airlied@gmail.com>
From: Simon Ser <contact@emersion.fr>
Subject: Re: [PATCH v2 1/2] drm: Add GPU reset sysfs event
Message-ID: <t0xkHSxBAbO_Gp95ATn-PFC0hLrur-6fClYgwyO4RgU3FZEqwnW8S4Av6wu-APqnprbJsIuIDo6cd0hcaVPIEoLsKh_WqRv0TnlHkuw8qhU=@emersion.fr>
In-Reply-To: <CAPM=9tybizHtKQBHmur8Lh7+pu5CiswZtgcY6SW04y=g0a=YJQ@mail.gmail.com>
References: <20220308180403.75566-1-contactshashanksharma@gmail.com>
 <bf6922f0-da8e-eef6-8217-26c1f50f3c48@quicinc.com>
 <2980e6a0-624e-2b80-c5d0-c40dfce76fb8@amd.com>
 <CAF6AEGvC=k4xLA-0iTSf660X2o04E+ivjnThZA-=WANKzLSvpA@mail.gmail.com>
 <cda15a47-f469-2a7e-87b6-adf00e631ef0@amd.com>
 <CAF6AEGv3Wv+p1j2B-t22eeK+8rx-qrQHCGoXeV1-XPYp2Om7zg@mail.gmail.com>
 <20220311102709.225616cf@eldfell>
 <CADnq5_O1Qktec3kC_rcPZUQPbraBYmdhDwmj=jgp_QsaBFGUZw@mail.gmail.com>
 <CAPM=9tybizHtKQBHmur8Lh7+pu5CiswZtgcY6SW04y=g0a=YJQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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
Reply-To: Simon Ser <contact@emersion.fr>
Cc: Rob Clark <robdclark@chromium.org>, "Sharma,
 Shashank" <shashank.sharma@amd.com>,
 =?utf-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 Amaranath Somalapuram <amaranath.somalapuram@amd.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Alexandar Deucher <alexander.deucher@amd.com>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Shashank Sharma <contactshashanksharma@gmail.com>,
 Christian Koenig <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tuesday, March 15th, 2022 at 08:13, Dave Airlie <airlied@gmail.com> wrot=
e:

> Just one thing comes to mind reading this, racy PID reuse.
>
> process 1234 does something bad to GPU.
> process 1234 dies in parallel to sysfs notification being sent.
> other process 1234 reuses the pid
> new process 1234 gets destroyed by receiver of sysfs notification.

This is a more general problem with PIDs. One solution is pidfd.
