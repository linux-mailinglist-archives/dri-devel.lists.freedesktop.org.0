Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 559FD53DCFD
	for <lists+dri-devel@lfdr.de>; Sun,  5 Jun 2022 18:26:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B0F910E183;
	Sun,  5 Jun 2022 16:26:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-4317.proton.ch (mail-4317.proton.ch [185.70.43.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE9B010E183
 for <dri-devel@lists.freedesktop.org>; Sun,  5 Jun 2022 16:26:21 +0000 (UTC)
Date: Sun, 05 Jun 2022 16:26:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail2; t=1654446379; x=1654705579;
 bh=5laiKgw7lv0eyY8Cc6jwyReGbLbZJ8FCX8eFaV0YuS8=;
 h=Date:To:From:Cc:Reply-To:Subject:Message-ID:In-Reply-To:
 References:Feedback-ID:From:To:Cc:Date:Subject:Reply-To:
 Feedback-ID:Message-ID;
 b=U4bdEGTvHEdVlyJ2qVxGvW6xjcltY0nvIeik6F5tCtLUzP/ArKoMQPQPrEbMFvQJn
 3Xy3SLPqog2g6YDsSYo3IjKgNK1DS2lMFO32cpi8u0xaM5mTTtonQWf79Wl82Ogk74
 5VdOAjYgW6094JTlwRhQWgFNPqE6ZAzsQ1QjB0V+lA97K7L6G5nkpydrq5R2p7dxtC
 vR4qu0t4hYzv+VLbZMq2nVGHelZcXiNQtQbEM1f+2koEQZi/d8nD7hYlgigcE8TScQ
 UEnoH/Ns89Qpiu1M0SzwUG6GQxEOayZb3qdvBqRDEKsmdOF5OytlHvOaC0u86Gxdz5
 hFGLEg/y6zdeg==
To: Zack Rusin <zackr@vmware.com>
From: Simon Ser <contact@emersion.fr>
Subject: Re: [PATCH 0/6] drm: Add mouse cursor hotspot support to atomic KMS
Message-ID: <UJ7PkcvdPsH-Mg3A4gJZWwCVK560WK9iiZC9N4Soh-1ISTHTDBRiZaS4D4Y-y_rZYzMUeQXbZsLT0-37Lly0zhp9HocepA7iCjE9_0mQZmo=@emersion.fr>
In-Reply-To: <40CAE3E3-9C74-4DC3-B0FD-8F00C7C29291@vmware.com>
References: <20220602154243.1015688-1-zack@kde.org>
 <wgIEdQpY_K8Qlq_xWBLy4DHOGwKi0P2c8a5dnTXM4dKOsA2hydYyT9DC6T1ldVZmi_mduaTPi4fnidg1msOofUUKkbnal0-Vv3VuTnfZh0s=@emersion.fr>
 <E53D9148-350D-4430-B4EF-689BBC1A9506@vmware.com>
 <GWQv37zd56Jok0LiKDGflZUSaHMYyk9Uad7M6-6-gqjeUGoT5dJOfsB9XDS4UuVEcZSI34GOTFa4XA0Cf2A1sGNhvbIsE16V7CyhxFne0d4=@emersion.fr>
 <00204913-BCF7-4D42-856D-675342B2B3E9@vmware.com>
 <GpX_UKNDfd2A3OuFfb9ga63xIKRP4vKVT2HTWBRw9mX0gsN743hR9bmx4be0OMukhdVmh0p3djW7Zj-ECCr4Q5-NRiPbWMLWAnTiZaPQVMU=@emersion.fr>
 <1E185B64-591E-47A5-A4D9-55E1BC3105CC@vmware.com>
 <VdFbe3wmVv8sSzgW8rsWsOaP3vTRyGGs86yIrHzf95_hCzy2ZNc90dY1TNUcVCo6057K1hsY0y_kVoFRfZ23hgUKMIpSoRAh5MAh5RmBUZI=@emersion.fr>
 <40CAE3E3-9C74-4DC3-B0FD-8F00C7C29291@vmware.com>
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
Reply-To: Simon Ser <contact@emersion.fr>
Cc: Martin Krastev <krastevm@vmware.com>, David Airlie <airlied@linux.ie>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Gurchetan Singh <gurchetansingh@chromium.org>,
 Hans de Goede <hdegoede@redhat.com>, Pekka Paalanen <ppaalanen@gmail.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 wayland-devel <wayland-devel@lists.freedesktop.org>,
 Maaz Mombasawala <mombasawalam@vmware.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>






------- Original Message -------
On Sunday, June 5th, 2022 at 17:47, Zack Rusin <zackr@vmware.com> wrote:

> > > Also, let me point this out because it also seems to be a fundamental
> > > misunderstanding, user space implementing software cursor doesn=
=E2=80=99t fix
> > > anything. Just leaves everything broken in different ways. The reason
> > > virtualized drivers went away from software cursors is because it mak=
es it
> > > impossible to make it work with a bunch of interesting and desirable
> > > scenarios, e.g. unity mode where the guest might have a terminal and =
browser
> > > open and then the virtual machine software creates windows out of tho=
se, so
> > > you don=E2=80=99t have the entire desktop of the guest but instead na=
tive looking
> > > windows with the apps. In that case guest has no way of knowing when =
the
> > > cursor leaves the window, so to make seemless cursors work you=
=E2=80=99d need to
> > > implement irc or backdoors that send that information from the host t=
o the
> > > guest, then have virtualized drivers create some sort of uevent, to s=
end to
> > > the userspace to let it know to hide the cursor because it actually l=
eft the
> > > window. That=E2=80=99s a trivial scenario and there=E2=80=99s a lot m=
ore with mice that are
> > > remoted themselves, guests with singular or maybe many apps exported,
> > > possibly overlapping on the host but all within a desktop in the gues=
t, etc.
> >
> > Are you saying that the current broken behavior is better than software
> > cursors?
>
> They=E2=80=99re broken in very different ways. You=E2=80=99re asking me w=
hich bugs do
> I prefer. Ultimately the current lack of hotspots leaves mouse unusable
> but I don=E2=80=99t see any reason to trade that for another set of bugs =
instead
> of just fixing it (either via fallback to legacy or using the new hotspot
> api).

Software cursors aren't a bug. They're a fallback.

> > > > > > New user-space supports setting the hotspot prop, and is aware =
that it can't
> > > > > > set the cursor plane position, so the cursor plane can be expos=
ed again when
> > > > > > the cap is enabled.
> > > > >
> > > > > But we still use cursor plane position. Hotspots are offsets from
> > > > > cursor plane positions. Both are required.
> > > >
> > > > No, VM drivers don't need and disregard the cursor position AFAIK. =
They
> > > > replace it with the host cursor's position.
> > >
> > > Iirc they all use it.
> >
> > What do they use it for?
> >
> > The whole point of this discussion is to be able to display the guest's=
 cursor
> > image on the host's cursor, so that latency is reduced?
>
>
> Ah, I think I see now where the confusion is coming from. No, it=E2=80=
=99s
> definitely not. This has nothing to do with latency. By default
> position of a mouse cursor doesn=E2=80=99t tell us where the point that i=
s
> actually used as an activation of a click is, e.g. a mouse cursor image
> with an arrow pointing to the top-left and a mouse cursor image pointing
> to the bottom right - both at the same position, as you can imagine it wi=
ll
> become impossible to use the desktop if the click defaults to the top lef=
t,
> especially as the number of cursor images increases, you need information
> about which point within the cursor image activates the click, that=
=E2=80=99s the
> hotspot. You need to know the position of the image and you need to know
> which point within that image is responsible for actually activating the
> events.

Yeah, that's what a hotspot is.

By "the whole point of this discussion", I meant that the whole point
for VM drivers to expose a hardware cursor is to improve latency (and
provide other related features).

At any rate, I consider broken any driver which exposes a cursor plane,
then doesn't display it exactly at the CRTC_X/CRTC_Y or misbehaves if
it's missing hotspot info.
