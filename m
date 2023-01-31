Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 00CFF682B58
	for <lists+dri-devel@lfdr.de>; Tue, 31 Jan 2023 12:21:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 246D510E2A0;
	Tue, 31 Jan 2023 11:21:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-4018.proton.ch (mail-4018.proton.ch [185.70.40.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0088310E317
 for <dri-devel@lists.freedesktop.org>; Tue, 31 Jan 2023 11:21:27 +0000 (UTC)
Date: Tue, 31 Jan 2023 11:21:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail; t=1675164085; x=1675423285;
 bh=wMBxUbNSUDFZW+gyeVupAV5mIR5Os1XJkplKbhfwl7U=;
 h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
 Message-ID:BIMI-Selector;
 b=fHhrgFKacSy8/HkcjtkjcqUrBWOOhbn7uLoyY7iOWHVs6PdYT9+7bZvvWBqmbBLam
 9gjtJResaOf1tQH8ucrULnxH+UdolwsPeXyKUZLCJj/05bjvJwvvcgBqPtEMtlZ52a
 G8ntIHJ7AOnfaA6Fp9krpbki+QvtZkL7z1SEjOvtPV31jx3fhOPTz/+ldX2cGQkvSW
 Y9T4TB5VCrq2G4JqZ7psVnhpid0HHreAzJxopn/mUKM0ynPb0rRUYqfbIfDj8WIC+Y
 d2kdh6gx52/mKvj6vmFYOMXetizWVuQLE67KqpCYj2WB8JKycbgiNBQlRIfza5hA/u
 jP6b6btR4se4g==
To: Pekka Paalanen <ppaalanen@gmail.com>
From: Simon Ser <contact@emersion.fr>
Subject: Re: [RFC PATCH v3 0/3] Support for Solid Fill Planes
Message-ID: <x3f8jyn_QDj34hYn9rgumw2uhFTpWzOw2E-715WYVOfwNOpthv26sefM6ePtwqbuHH54ATupqQzzz9qIWqAbDvMpb06bhdiU5BJlMjsaCdo=@emersion.fr>
In-Reply-To: <20230131131326.75b43152@eldfell>
References: <20230104234036.636-1-quic_jesszhan@quicinc.com>
 <Y7a1hCmsvJHKdW1Y@phenom.ffwll.local>
 <58caf08c-3a02-82ce-4452-8ae7f22f373d@quicinc.com>
 <CAA8EJppnAmN6+S-emEfXJEc1iVf+DjeLBmCQpGd-nRY2M2AAQQ@mail.gmail.com>
 <Y7hrWDpg8msuefgZ@phenom.ffwll.local>
 <CAA8EJppoejPPNhu3eHBc_vsstHvEEwYx67HZLo8+4W3K-gHkag@mail.gmail.com>
 <20230131112527.32ab8ba5@eldfell>
 <9Q0ano1jjZ1LTNWaVcVkDp0-jsTSUJKoNrKwvpGpIuejUSB33DK-uOpeLmyMbbk6tdfWG8RS83AGyB--EPEHqJe5shq6RC_gVpPLR7sUScY=@emersion.fr>
 <20230131131326.75b43152@eldfell>
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
Cc: sebastian.wick@redhat.com, linux-arm-msm@vger.kernel.org,
 quic_abhinavk@quicinc.com, dri-devel@lists.freedesktop.org,
 swboyd@chromium.org, seanpaul@chromium.org, laurent.pinchart@ideasonboard.com,
 daniel.vetter@ffwll.ch, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, wayland-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tuesday, January 31st, 2023 at 12:13, Pekka Paalanen <ppaalanen@gmail.co=
m> wrote:

> On Tue, 31 Jan 2023 10:06:39 +0000
> Simon Ser <contact@emersion.fr> wrote:
>=20
> > On Tuesday, January 31st, 2023 at 10:25, Pekka Paalanen <ppaalanen@gmai=
l.com> wrote:
> >=20
> > > indeed, what about simply using a 1x1 framebuffer for real? Why was t=
hat
> > > approach rejected? =20
> >=20
> > Ideally we don't want to allocate any GPU memory for the solid-fill
> > stuff. And if we special-case 1x1 FB creation to not be backed by real
> > GPU memory then we hit several situations where user-space expects a
> > real FB but there isn't: for instance, GETFB2 converts from FB object
> > ID to GEM handles. Even if we make GETFB2 fail and accept that this
> > breaks user-space, then there is no way for user-space to recover the
> > FB color for flicker-free transitions and such.
> >=20
> > This is all purely from a uAPI PoV, completely ignoring the potential
> > issues with the internal kernel abstractions which might not be suitabl=
e
> > for this either.
>=20
> I mean a real 1x1 buffer: a dumb buffer.
>=20
> It would be absolutely compatible with anything existing, because it is
> a real FB. As a dumb buffer it would be trivial to write into and read
> out. As 1x1 it would be tiny (one page?). Even if something needs to
> raw-access uncached memory over 33 MHz PCI bus or whatever the worst
> case is, it's just one pixel, so it's fast enough, right? And it only
> needs to be read once when set, like USB display drivers do. The driver
> does not need to manually apply any color operations, because none are
> supported in this special case.
>=20
> One can put all these limitations and even pixel format in the plane
> property that tells userspace that a 1x1 FB works here.
>=20
> To recap, the other alternatives under discussion I see right now are:
>=20
> - this proposal of dedicated fill color property
> - stuffing something new into FB_ID property
>=20
> There is also the question of other kinds of plane content sources like
> live camera feeds where userspace won't be shovelling each frame
> individually like we do now.
>=20
> 1x1 dumb buffer is not as small and lean as a dedicated fill color
> property, but the UAPI design questions seem to be much less. What's
> the best trade-off and for whom?

By "real memory" yes I mean the 1 page.

Using a real buffer also brings back other discussions, e.g. the one about
which pixel formats to accept.
