Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FC20691BC0
	for <lists+dri-devel@lfdr.de>; Fri, 10 Feb 2023 10:44:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC4F810ECBD;
	Fri, 10 Feb 2023 09:44:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-4323.proton.ch (mail-4323.proton.ch [185.70.43.23])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC27C10ECB5;
 Fri, 10 Feb 2023 09:44:23 +0000 (UTC)
Date: Fri, 10 Feb 2023 09:44:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail; t=1676022261; x=1676281461;
 bh=IyEQ+CuCWOZOggkoQCx0GMGKHUImT4heVz4N1nqNhMg=;
 h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
 Message-ID:BIMI-Selector;
 b=wnVRM+4J+epvNK4h7bYVBIW9nBEy2B9Sd4KI+rRJcGiLS8mZpj/VfsEOhKZEhE0zz
 s5+Z3ISt27KpBLUy5yyyWl/z5/h5p0HYjrMqD2oTshHXaS33uD0+mdJ3d5N5AO6O2D
 RUdIN1XyIat5qYYsv/f4WTgt58TWCE7bkD6ZHG4yRXJj5ugfh84SbPnPwp/2ivcb2F
 tNSiEfTIAyWDNiqZOuPpQiFamorZIpobbR1qmsh7+op6hHUpojUv9MgxGbSAReJVE8
 uAjBht+bUDFAN3uLY0Vyg93n3RwzmqznTrkV5YnEVFATt2ib7TZIftvwX8TuaFMb56
 NxjUP+TXvghMw==
To: Pekka Paalanen <ppaalanen@gmail.com>
From: Simon Ser <contact@emersion.fr>
Subject: Re: [PATCH 3/3] drm/connector: Deprecate split for BT.2020 in
 drm_colorspace enum
Message-ID: <Oize7M_bku6zBpy4cfPk2Nlxpp-OVNiRbynZJPQERNN_11oiZuTejO2GZWlXPUfJ1duzBKsoWHoanERG1LaHB8xdejCjiHsVg8UeqM-utIg=@emersion.fr>
In-Reply-To: <20230210113738.38ecda93@eldfell>
References: <20230203020744.30745-1-joshua@froggi.es>
 <20230203020744.30745-3-joshua@froggi.es> <20230208113041.70691449@eldfell>
 <54695463-3e7f-4e4a-cd76-fa6f9de1d8e8@froggi.es>
 <hlhk2_vNweAm7d8c2FK8GlUEi1-JHOZTU2W8unUHLoyTtyjXQnnAoGur8KqYgrbw6nsP9Yy91k8OzgiP1k_zwIX4JB0Qt5W178zqOgHilZY=@emersion.fr>
 <20230210113738.38ecda93@eldfell>
Feedback-ID: 1358184:user:proton
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
Cc: Sebastian Wick <sebastian.wick@redhat.com>, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, Uma Shankar <uma.shankar@intel.com>,
 Vitaly.Prosyak@amd.com, Joshua Ashton <joshua@froggi.es>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Friday, February 10th, 2023 at 10:37, Pekka Paalanen <ppaalanen@gmail.co=
m> wrote:

> On Thu, 09 Feb 2023 17:03:19 +0000
> Simon Ser contact@emersion.fr wrote:
>=20
> > On Thursday, February 9th, 2023 at 17:38, Joshua Ashton joshua@froggi.e=
s wrote:
> >=20
> > > > I mean, the strings are the uAPI, not the integers, right?
> > >=20
> > > Both are uAPI these days.
> >=20
> > Yes. The integers are uAPI, if you change them you'll break libliftoff
> > users. There is an old thread discussing this somewhere. The tl;dr was
> > that there is no use-case for exposing the same string with a different
> > integer, so no good reason to justify the substantial complexity of
> > handling this case.
>=20
> Funny, I remember exactly the opposite.

There was a bacxk-and-forth on this topic.

> This case would have been multiple different strings with the same
> integer, anyway.

That would be fine. As long as the meaning of an integer doesn't change
across planes, it's all fine.

> But no matter. If a uAPI header or documentation has exposed the
> integers, then there is no taking that back.

uAPI headers/docs don't expose the integers for this property.
Nevertheless, one cannot break user-space.

> This won't be a problem for enums that have no meaningful string names,
> like enums where the integer names a blob that describes what the value
> means, and enums where the integer is an index into an array of
> descriptions exposed as a blob.

This would be pretty tricky to handle.
