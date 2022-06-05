Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F2F0453DAB3
	for <lists+dri-devel@lfdr.de>; Sun,  5 Jun 2022 09:30:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F58010EFA0;
	Sun,  5 Jun 2022 07:30:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-4323.proton.ch (mail-4323.proton.ch [185.70.43.23])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CCDD410E9B6
 for <dri-devel@lists.freedesktop.org>; Sun,  5 Jun 2022 07:30:11 +0000 (UTC)
Date: Sun, 05 Jun 2022 07:30:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail2; t=1654414209; x=1654673409;
 bh=PT1irHYMGhc/lpIDw2+vTVElwV8CrMQ83EYXrMUYgI0=;
 h=Date:To:From:Cc:Reply-To:Subject:Message-ID:In-Reply-To:
 References:Feedback-ID:From:To:Cc:Date:Subject:Reply-To:
 Feedback-ID:Message-ID;
 b=OnSGKBMnot7Okyt1HwDPjoAnWUL1kVUWws1sJxcfbfw41vGiICmhMm7CeBj67E/zS
 TD01Zq2oprCLKDEOGUheK6QJfvjtZbBk8GoCT2lN54W7y8YM+crG/nlNb/85AGt/s2
 xDYljwEVhaBd6TFNazLdScmVuAcZwwHJiYrqR2XTSghOHBAZ297bMTg66NwuPkDIxg
 NPKTEtA7CjqvQ5X71dJ0t1S0GUHIiqNFiU9kvHqhdiZSvPwdI+QyEjoZlW5ZeLEJb4
 eTT8PlfiS4Rebwls10Ko65vfk2cdJcrWf6b7pSOnQK6H+Wu8VDfDy36VzawGBViVQa
 Of0Xv0cEgpC7A==
To: Zack Rusin <zackr@vmware.com>
From: Simon Ser <contact@emersion.fr>
Subject: Re: [PATCH 0/6] drm: Add mouse cursor hotspot support to atomic KMS
Message-ID: <VdFbe3wmVv8sSzgW8rsWsOaP3vTRyGGs86yIrHzf95_hCzy2ZNc90dY1TNUcVCo6057K1hsY0y_kVoFRfZ23hgUKMIpSoRAh5MAh5RmBUZI=@emersion.fr>
In-Reply-To: <1E185B64-591E-47A5-A4D9-55E1BC3105CC@vmware.com>
References: <20220602154243.1015688-1-zack@kde.org>
 <5Et1VowGX_0a0i5weC4YVMX7bhGDU45hQyiv4CjqyxQStY1CSUJs-xamBowRO8go8yCk1l_jgKmM_OrMB0Fdx166545AX5nL09NGsEYaBs0=@emersion.fr>
 <06E05345-758E-456A-803D-B50978A935CA@vmware.com>
 <wgIEdQpY_K8Qlq_xWBLy4DHOGwKi0P2c8a5dnTXM4dKOsA2hydYyT9DC6T1ldVZmi_mduaTPi4fnidg1msOofUUKkbnal0-Vv3VuTnfZh0s=@emersion.fr>
 <E53D9148-350D-4430-B4EF-689BBC1A9506@vmware.com>
 <GWQv37zd56Jok0LiKDGflZUSaHMYyk9Uad7M6-6-gqjeUGoT5dJOfsB9XDS4UuVEcZSI34GOTFa4XA0Cf2A1sGNhvbIsE16V7CyhxFne0d4=@emersion.fr>
 <00204913-BCF7-4D42-856D-675342B2B3E9@vmware.com>
 <GpX_UKNDfd2A3OuFfb9ga63xIKRP4vKVT2HTWBRw9mX0gsN743hR9bmx4be0OMukhdVmh0p3djW7Zj-ECCr4Q5-NRiPbWMLWAnTiZaPQVMU=@emersion.fr>
 <1E185B64-591E-47A5-A4D9-55E1BC3105CC@vmware.com>
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

On Friday, June 3rd, 2022 at 20:31, Zack Rusin <zackr@vmware.com> wrote:

> > > > > > My proposal was:
> > > > > >
> > > > > > - Introduce DRM_CLIENT_CAP_CURSOR_PLANE_NO_POSITION (or a bette=
r name). Only
> > > > > > user-space which supports the hotspot props will enable it.
> > > > > > - By default, don't expose a cursor plane, because current user=
-space doesn't
> > > > > > support it (Weston might put a window in the cursor plane, and =
nobody can
> > > > > > report hotspot).
> > > > > > - If the KMS client enables the cap, advertise the cursor
> > > > > > plane, and make it so the plane doesn't have the CRTC_X/CRTC_Y =
properties
> > > > > > since the driver will pick the position.
> > > > > >
> > > > > > That way both old and new user-space are fixed.
> > > > >
> > > > > I don=E2=80=99t think I see how that fixes anything. In particula=
r I don=E2=80=99t see a way
> > > > > of fixing the old user space at all. We require hotspot info, old=
 user space
> > > > > doesn=E2=80=99t set it because there=E2=80=99s no way of setting =
it on atomic kms.
> > > >
> > > > Old atomic user-space is fixed by removing the cursor plane. Then o=
ld
> > > > atomic user-space will fallback to drawing the cursor itself, e.g. =
via
> > > > OpenGL.
> > >
> > > But it=E2=80=99s not fixed, because the driver is still on a deny-lis=
t and
> > > nothing implements this. You=E2=80=99re saying you could potentially =
=E2=80=9Cfix=E2=80=9D by
> > > implementing client side cursor handling in all kms clients? That=
=E2=80=99s a
> > > hard sell if the user space can just put the virtualized driver on
> > > deny-lists and fallback to use old kms which supports hotspots.
> >
> > What deny-list are you referring to?
> >
> > All compositors I know of implement a fallback when no cursor plane is
> > usable.
>
> I put the links in the first email in the
> series:
> https://gitlab.gnome.org/GNOME/mutter/-/blob/main/src/backends/native/met=
a-kms-impl-device-atomic.c#L1188
> https://invent.kde.org/plasma/kwin/-/blob/master/src/backends/drm/drm_gpu=
.cpp#L156

I was not aware of these lists. Having to work-around drivers in user-space=
 is
really not great.

But regardless, that doesn't really change anything. With my proposal:

- Old user-space with hacky deny-lists (Mutter, KWin) still goes through th=
e
  legacy uAPI.
- Old user-space without the hacky deny-lists (Weston, wlroots) uses softwa=
re
  cursors and is not broken anymore.
- New user-space can report hotspot and is not broken.

> Also, let me point this out because it also seems to be a fundamental
> misunderstanding, user space implementing software cursor doesn=E2=80=
=99t fix
> anything. Just leaves everything broken in different ways. The reason
> virtualized drivers went away from software cursors is because it makes i=
t
> impossible to make it work with a bunch of interesting and desirable
> scenarios, e.g. unity mode where the guest might have a terminal and brow=
ser
> open and then the virtual machine software creates windows out of those, =
so
> you don=E2=80=99t have the entire desktop of the guest but instead native=
 looking
> windows with the apps. In that case guest has no way of knowing when the
> cursor leaves the window, so to make seemless cursors work you=E2=80=
=99d need to
> implement irc or backdoors that send that information from the host to th=
e
> guest, then have virtualized drivers create some sort of uevent, to send =
to
> the userspace to let it know to hide the cursor because it actually left =
the
> window. That=E2=80=99s a trivial scenario and there=E2=80=99s a lot more =
with mice that are
> remoted themselves, guests with singular or maybe many apps exported,
> possibly overlapping on the host but all within a desktop in the guest, e=
tc.

Are you saying that the current broken behavior is better than software
cursors?

> > > > New user-space supports setting the hotspot prop, and is aware that=
 it can't
> > > > set the cursor plane position, so the cursor plane can be exposed a=
gain when
> > > > the cap is enabled.
> > >
> > > But we still use cursor plane position. Hotspots are offsets from
> > > cursor plane positions. Both are required.
> >
> > No, VM drivers don't need and disregard the cursor position AFAIK. They
> > replace it with the host cursor's position.
>
> Iirc they all use it.

What do they use it for?

The whole point of this discussion is to be able to display the guest's cur=
sor
image on the host's cursor, so that latency is reduced? When the VM softwar=
e
does this, why does it need to use CRTC_X/CRTC_Y, since these are thrown aw=
ay
by the host?

> I guess we could repurpose src_x|y to mean mouse hotspots and write patch=
es
> for userspace to use that instead of explicit properties

That sounds like a terrible idea.
