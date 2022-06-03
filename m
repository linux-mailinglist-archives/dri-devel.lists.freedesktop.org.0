Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F08B53CC9F
	for <lists+dri-devel@lfdr.de>; Fri,  3 Jun 2022 17:49:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4EE6A113869;
	Fri,  3 Jun 2022 15:49:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-4018.proton.ch (mail-4018.proton.ch [185.70.40.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F3FE113869;
 Fri,  3 Jun 2022 15:49:41 +0000 (UTC)
Date: Fri, 03 Jun 2022 15:49:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail2; t=1654271378; x=1654530578;
 bh=qUoGp0yf2mgeGdD6cwO91OjF8hHbjzBPI6dTqp5JPn4=;
 h=Date:To:From:Cc:Reply-To:Subject:Message-ID:In-Reply-To:
 References:Feedback-ID:From:To:Cc:Date:Subject:Reply-To:
 Feedback-ID:Message-ID;
 b=Alzco0FD9DT6Bs/YuwYfYZ9ddwvrYKoqQ4Egwcny2z5BZHxcVTVqH6o2roSCYeNe2
 o7LzFuZfrtViJkPpa084oNTaT25LMNpbSlNzQQCUYPw2P/DNW/qtEYitkyBw6+mvJX
 hJ/1qDDT277q26CvaVjEPyNwpQ72QzctJm+YeFWiUSDfi0i0ejDGcj/YLcu0mmRs5g
 MQPd/L2zNQG3kYJ4UXSNGWkl3DQgCILYQzUmZotT5ZfuVspQQoR5DxnAV3nZrwpLpx
 kYH6zTBXfc0VxyNfkOgiGr8KAnoakO4T13jJJzdjcuw7sduTpeJdBS1KWMootTzghr
 OZNMZpDM6klHQ==
To: Zack Rusin <zackr@vmware.com>
From: Simon Ser <contact@emersion.fr>
Subject: Re: [PATCH 0/6] drm: Add mouse cursor hotspot support to atomic KMS
Message-ID: <GpX_UKNDfd2A3OuFfb9ga63xIKRP4vKVT2HTWBRw9mX0gsN743hR9bmx4be0OMukhdVmh0p3djW7Zj-ECCr4Q5-NRiPbWMLWAnTiZaPQVMU=@emersion.fr>
In-Reply-To: <00204913-BCF7-4D42-856D-675342B2B3E9@vmware.com>
References: <20220602154243.1015688-1-zack@kde.org>
 <wRnf-Lm5zz6v1e-NlnFPteyARuLl-R98mOZZVjePHD5ue7QQNR_TSU7RwYBssgUa7xM5hf7Fe59-gMEj81ESrHY3mu_H7yE0dtGhFHFPTnc=@emersion.fr>
 <0F911D96-1C9B-4EF1-84D7-F5335B3FFEB7@vmware.com>
 <5Et1VowGX_0a0i5weC4YVMX7bhGDU45hQyiv4CjqyxQStY1CSUJs-xamBowRO8go8yCk1l_jgKmM_OrMB0Fdx166545AX5nL09NGsEYaBs0=@emersion.fr>
 <06E05345-758E-456A-803D-B50978A935CA@vmware.com>
 <wgIEdQpY_K8Qlq_xWBLy4DHOGwKi0P2c8a5dnTXM4dKOsA2hydYyT9DC6T1ldVZmi_mduaTPi4fnidg1msOofUUKkbnal0-Vv3VuTnfZh0s=@emersion.fr>
 <E53D9148-350D-4430-B4EF-689BBC1A9506@vmware.com>
 <GWQv37zd56Jok0LiKDGflZUSaHMYyk9Uad7M6-6-gqjeUGoT5dJOfsB9XDS4UuVEcZSI34GOTFa4XA0Cf2A1sGNhvbIsE16V7CyhxFne0d4=@emersion.fr>
 <00204913-BCF7-4D42-856D-675342B2B3E9@vmware.com>
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


On Friday, June 3rd, 2022 at 17:32, Zack Rusin <zackr@vmware.com> wrote:

> > On Jun 3, 2022, at 11:22 AM, Simon Ser <contact@emersion.fr> wrote:
> > =E2=9A=A0 External Email
> >
> > On Friday, June 3rd, 2022 at 17:17, Zack Rusin <zackr@vmware.com> wrote=
:
> >
> >
> > >
> > >
> > > > On Jun 3, 2022, at 10:56 AM, Simon Ser <contact@emersion.fr> wrote:
> > > > =E2=9A=A0 External Email
> > > >
> > > > On Friday, June 3rd, 2022 at 16:38, Zack Rusin <zackr@vmware.com> w=
rote:
> > > >
> > > >
> > > > > > On Jun 3, 2022, at 10:32 AM, Simon Ser <contact@emersion.fr> wr=
ote:
> > > > > >
> > > > > > =E2=9A=A0 External Email
> > > > > >
> > > > > > On Friday, June 3rd, 2022 at 16:27, Zack Rusin <zackr@vmware.co=
m> wrote:
> > > > > >
> > > > > >
> > > > > > > > In particular: since the driver will ignore the KMS cursor =
plane
> > > > > > > > position set by user-space, I don't think it's okay to just=
 expose
> > > > > > > > without opt-in from user-space (e.g. with a DRM_CLIENT_CAP)=
.
> > > > > > > >
> > > > > > > > cc wayland-devel and Pekka for user-space feedback.
> > > > > > >
> > > > > > >
> > > > > > > I think Thomas expressed our concerns and reasons why those w=
ouldn=E2=80=99t
> > > > > > > work for us back then. Is there something else you=E2=80=
=99d like to add?
> > > > > >
> > > > > >
> > > > > > I disagreed, and I don't understand Thomas' reasoning.
> > > > > >
> > > > > > KMS clients will need an update to work correctly. Adding a new=
 prop
> > > > > > without a cap leaves existing KMS clients broken. Adding a cap =
allows
> > > > > > both existing KMS clients and updated KMS clients to work corre=
ctly.
> > > > >
> > > > >
> > > > > I=E2=80=99m not sure what you mean here. They are broken right no=
w. That=E2=80=99s what we=E2=80=99re
> > > > > fixing. That=E2=80=99s the reason why the virtualized drivers are=
 on deny-lists for
> > > > > all atomic kms. So nothing needs to be updated. If you have a kms=
 client that
> > > > > was using virtualized drivers with atomic kms then mouse clicks n=
ever worked
> > > > > correctly.
> > > > >
> > > > > So, yes, clients need to set cursor hotspot if they want mouse to=
 work
> > > > > correctly with virtualized drivers.
> > > >
> > > >
> > > > My proposal was:
> > > >
> > > > - Introduce DRM_CLIENT_CAP_CURSOR_PLANE_NO_POSITION (or a better na=
me). Only
> > > > user-space which supports the hotspot props will enable it.
> > > > - By default, don't expose a cursor plane, because current user-spa=
ce doesn't
> > > > support it (Weston might put a window in the cursor plane, and nobo=
dy can
> > > > report hotspot).
> > > > - If the KMS client enables the cap, advertise the cursor
> > > > plane, and make it so the plane doesn't have the CRTC_X/CRTC_Y prop=
erties
> > > > since the driver will pick the position.
> > > >
> > > > That way both old and new user-space are fixed.
> > >
> > >
> > > I don=E2=80=99t think I see how that fixes anything. In particular I =
don=E2=80=99t see a way
> > > of fixing the old user space at all. We require hotspot info, old use=
r space
> > > doesn=E2=80=99t set it because there=E2=80=99s no way of setting it o=
n atomic kms.
> >
> >
> > Old atomic user-space is fixed by removing the cursor plane. Then old
> > atomic user-space will fallback to drawing the cursor itself, e.g. via
> > OpenGL.
>
> But it=E2=80=99s not fixed, because the driver is still on a deny-list an=
d
> nothing implements this. You=E2=80=99re saying you could potentially =
=E2=80=9Cfix=E2=80=9D by
> implementing client side cursor handling in all kms clients? That=
=E2=80=99s a
> hard sell if the user space can just put the virtualized driver on
> deny-lists and fallback to use old kms which supports hotspots.

What deny-list are you referring to?

All compositors I know of implement a fallback when no cursor plane is
usable.

> > New user-space supports setting the hotspot prop, and is aware that it =
can't
> > set the cursor plane position, so the cursor plane can be exposed again=
 when
> > the cap is enabled.
>
> But we still use cursor plane position. Hotspots are offsets from
> cursor plane positions. Both are required.

No, VM drivers don't need and disregard the cursor position AFAIK. They
replace it with the host cursor's position.

This is what breaks Weston, breaks uAPI expectations, and IMHO is
unacceptable without KMS client opt-in.
