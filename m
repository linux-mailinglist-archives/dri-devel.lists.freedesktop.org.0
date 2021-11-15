Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 35E9945092D
	for <lists+dri-devel@lfdr.de>; Mon, 15 Nov 2021 17:04:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 05CE86E042;
	Mon, 15 Nov 2021 16:04:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from vps.xff.cz (vps.xff.cz [195.181.215.36])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E2316E09C
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Nov 2021 16:04:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=xff.cz; s=mail;
 t=1636992276; bh=hQvV3bAfquc9aXxoYHr29dbhsdloRuciZIszUZT32kQ=;
 h=Date:From:To:Cc:Subject:X-My-GPG-KeyId:References:From;
 b=JK0VbNWBztF+oWYaQidzuUXg+YDxmjiwjEuYjQngYYqYr5ZvL7CeELKXjs+YKRn9Q
 t8ZeZ/igma3kBfHYpZin7HxpEw8OLsIa4vJ2HxUHt/gAbUvPkzzl4nUhY0jQFrUIXI
 5DdS7iZJB4zSOpxRaRg9+gNTJ23+ZyE1I1eUEuQo=
Date: Mon, 15 Nov 2021 17:04:36 +0100
From: =?utf-8?Q?Ond=C5=99ej?= Jirman <megi@xff.cz>
To: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: Panic with linus/master and panfrost
Message-ID: <20211115160436.llmlb3j6quts2frz@core>
X-My-GPG-KeyId: EBFBDDE11FB918D44D1F56C1F9F0A873BE9777ED
 <https://xff.cz/key.txt>
References: <20211114234045.cc5tearljna2ywij@core>
 <CAPj87rPxtQVQnrs0BiXy0H1viF-oMNeCCP_Aptsxt_sgeK+CpA@mail.gmail.com>
 <CAKMK7uGd+W3yOr2wGRREW08pcX=g1UPvkX4n13dVo7YdQ4dpxg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAKMK7uGd+W3yOr2wGRREW08pcX=g1UPvkX4n13dVo7YdQ4dpxg@mail.gmail.com>
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
Cc: Tomeu Vizoso <tomeu.vizoso@collabora.com>, dri-devel@lists.freedesktop.org,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Nov 15, 2021 at 04:05:02PM +0100, Daniel Vetter wrote:
> You need
> 
> commit 13e9e30cafea10dff6bc8d63a38a61249e83fd65
> Author: Christian König <christian.koenig@amd.com>
> Date:   Mon Oct 18 21:27:55 2021 +0200
> 
>    drm/scheduler: fix drm_sched_job_add_implicit_dependencies

Thank you, that fixed the panic. :)

kind regards,
	Ondrej

> which Christian pushed to drm-misc-next instead of drm-misc-fixes. I
> already asked Christian in some other thread to cherry-pick it over.
> -Daniel
> 
> On Mon, Nov 15, 2021 at 3:56 PM Daniel Stone <daniel@fooishbar.org> wrote:
> > Hi Ondrej,
> >
> > On Mon, 15 Nov 2021 at 07:35, Ondřej Jirman <megi@xff.cz> wrote:
> > > I'm getting some fence refcounting related panics with the current
> > > Linus's master branch:
> > >
> > > It happens immediately whenever I start Xorg or sway.
> > >
> > > Anyone has any ideas where to start looking? It works fine with v5.15.
> > >
> > > (sorry for the interleaved log, it's coming from multiple CPUs at once
> > > I guess)
> >
> > Thanks a lot for the report - are you able to bisect this please?
> >
> > Cheers,
> > Daniel
> 
> 
> 
> --
> Daniel Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch
