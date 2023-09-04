Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 485B6791AAD
	for <lists+dri-devel@lfdr.de>; Mon,  4 Sep 2023 17:33:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 071E210E380;
	Mon,  4 Sep 2023 15:33:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 29ECA10E380
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Sep 2023 15:33:08 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 7E1A760E9A;
 Mon,  4 Sep 2023 15:33:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 930FEC433C8;
 Mon,  4 Sep 2023 15:33:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1693841586;
 bh=UeKK5EZJuIgCkUx5xqRn3CgwQq16K8S9woQmQDDN6JE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=hqc96kthJhcdhdl1Rlk0yY3dQ/CFCUPeOHYx4AbJFcC7PnFUzBNnneQRtC7angbjy
 hJGxyIO2mGHRrfE06mEn86+a6xnB3yfJvZ0PnYD7ZVsr09GZaqxFa4xWBcw7QlSgkx
 hwyn81J2jeRSRsQ0LGG7K2eHNULCtT3FTpLqj08H94AJjb+5PmfNjcj0qjUHnFzKTF
 tn3r7Y/MYD8CZu+2tWHhGgVMAWlrWVk05k82P0g168zcfbAf6KwtXS2NJCEHI/7VIz
 a8kdhPr2AebRaLXr8yC5srMFnOBncil5ozqq77Frwd4WGIZdSXt5P9Wz67VVILRBwe
 cF9xW2KNlKgBA==
Date: Mon, 4 Sep 2023 17:33:03 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Doug Anderson <dianders@chromium.org>
Subject: Re: [RFC PATCH 04/10] drm/panel_helper: Introduce drm_panel_helper
Message-ID: <nahwibpea2akyg7swbdb3f6xyv7fqs35v5spqbjfzfchxnoqqz@glgg5core75d>
References: <bphkopaq76imqzut7xrx7aprqybhx3veajdympqhig2wqlix6c@64ck23rc5cv7>
 <CAD=FV=XiVkoCsjin4R74nkcd8vzOq9uPq+o5cRjd=YOoPXuQkg@mail.gmail.com>
 <lhd6ai7d6swlxhisjhikytguor7pptrymo3bmfwej4k7zqrnv4@hp2gvhw7mh3m>
 <CAD=FV=XUhzguFCC=aKzHFMV0bBnZzkHXP_tx+P=PNkVr=8SnTA@mail.gmail.com>
 <mumiep5q7x7qj7k64h3cyodxrgk737iy5rum5keguquwymf2gy@3qruwfrqjgy7>
 <CAD=FV=VEene+nr1us87iA+bomxzQ039r-E+wqvizvFGbxXjDvA@mail.gmail.com>
 <wwzbd7dt5qyimshnd7sbgkf5gxk7tq5dxtrerz76uw5p6s7tzt@cbiezkfeuqqn>
 <CAD=FV=XcUVvg5Om__dD=i9zu7ZtQmvWicms9yN7w0c2nWGhqYg@mail.gmail.com>
 <p7okuysh442hulqls3ekbaar2bguqv67fum3gsb2cj75kjvdpx@uebwlgvf46sy>
 <CAD=FV=Xr4nZUeHY-FdiedcV=BuP5szNBEHPKjdRnA7c+3MADqg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <CAD=FV=Xr4nZUeHY-FdiedcV=BuP5szNBEHPKjdRnA7c+3MADqg@mail.gmail.com>
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Fri, Sep 01, 2023 at 06:42:42AM -0700, Doug Anderson wrote:
> On Fri, Sep 1, 2023 at 1:15=E2=80=AFAM Maxime Ripard <mripard@kernel.org>=
 wrote:
> > On Thu, Aug 31, 2023 at 11:18:49AM -0700, Doug Anderson wrote:
> > > Today this is explicitly _not_ refcounting, right? It is simply
> > > treating double-enables as no-ops and double-disables as no-ops. With
> > > our current understanding, the only thing we actually need to guard
> > > against is double-disable but at the moment we do guard against both.
> > > Specifically we believe the cases that are issues:
> > >
> > > a) At shutdown/remove time we want to disable the panel, but only if
> > > it was enabled (we wouldn't want to call disable if the panel was
> > > already off because userspace turned it off).
> >
> > Yeah, and that's doable with refcounting too.
>=20
> I don't understand the benefit of switching to refcounting, though. We
> don't ever expect the "prepare" or "enable" function to be called more
> than once and all we're guarding against is a double-unprepare and a
> double-enable. Switching this to refcounting would make the reader
> think that there was a legitimate case for things to be prepared or
> enabled twice. As far as I know, there isn't.

Sure, eventually we'll want to remove it.

I even said it as such here:
https://lore.kernel.org/dri-devel/wwzbd7dt5qyimshnd7sbgkf5gxk7tq5dxtrerz76u=
w5p6s7tzt@cbiezkfeuqqn/

However, we have a number of panels following various anti-patterns
where disable and unprepare would be called multiple times. A boolean
would just ignore the second, refcounting would warn over it, and that's
what we want.

And that's exactly because there isn't a legitimate case for things to
be disabled or unprepared twice, but yet many panel driver do it anyway.

> In any case, I don't think there's any need to switch this to
> refcounting as part of this effort. Someone could, in theory, do it as
> a separate patch series.

I'm sorry, but I'll insist on getting a solution that will warn panels
that call drm_atomic_helper_shutdown or drm_panel_disable/unprepare by
hand. It doesn't have to be refcounting though if you have a better idea
in mind.

> > > The above solves the problem with panels wanting to power sequence
> > > themselves at remove() time, but not at shutdown() time. Thus we'd
> > > still have a dependency on having all drivers use
> > > drm_atomic_helper_shutdown() so that work becomes a dependency.
> >
> > Does it? I think it can be done in parallel?
>=20
> I don't think it can be in parallel. While it makes sense for panels
> to call drm_panel_remove() at remove time, it doesn't make sense for
> them to call it at shutdown time. That means that the trick of having
> the panel get powered off in drm_panel_remove() won't help for
> shutdown. For shutdown, which IMO is the more important case, we need
> to wait until all drm drivers call drm_atomic_helper_shutdown()
> properly.

Right, my point was more that drivers that already don't disable the
panel in their shutdown implementation will still not do it. And drivers
that do will still do it, so there's no regression.

We obviously want to tend to having all drivers call
drm_atomic_helper_shutdown(), but not having it will not introduce any
regression.

Maxime
