Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4091553CC3B
	for <lists+dri-devel@lfdr.de>; Fri,  3 Jun 2022 17:22:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A4CE113AB9;
	Fri,  3 Jun 2022 15:22:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-4022.proton.ch (mail-4022.proton.ch [185.70.40.22])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 04EE2113ABB
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Jun 2022 15:22:33 +0000 (UTC)
Date: Fri, 03 Jun 2022 15:22:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail2; t=1654269750; x=1654528950;
 bh=bsjQLBBc89XMMvjG/B+sIoBT6v4IJUHC/VXbWqf78jA=;
 h=Date:To:From:Cc:Reply-To:Subject:Message-ID:In-Reply-To:
 References:Feedback-ID:From:To:Cc:Date:Subject:Reply-To:
 Feedback-ID:Message-ID;
 b=ptfviLBHCyXkSfPmows5oEeIwpjZdNJZxc1Aq+ZUD/I71cU1Rxv5En/ytqt8myVOt
 Fw+YXvXHIj0s1fz7F1fXRdkm5Hq6t3/NRBBk47jL4NHhknJ+KfLMtA+Pv6yN0WbJ/p
 w4yKowWcAuJq/nlpiycWVxpGpVd/f+ERrzGc+waxtomLsaDV12IzGuRAysw3sNRKZN
 mBtH7rv7JUEijqhPgTsLVtNJyq3kznLXubd7kzGvRQOxnXbqZPTbhxp8FO02oeI0Do
 hrk3fqu6m1P4t5qge67pToi+mnVY8o/Jv6AXiCQyeNApVrvRevn+WNdaU+T9uRDg1W
 ycAhLzE9ZWg3w==
To: Zack Rusin <zackr@vmware.com>
From: Simon Ser <contact@emersion.fr>
Subject: Re: [PATCH 0/6] drm: Add mouse cursor hotspot support to atomic KMS
Message-ID: <GWQv37zd56Jok0LiKDGflZUSaHMYyk9Uad7M6-6-gqjeUGoT5dJOfsB9XDS4UuVEcZSI34GOTFa4XA0Cf2A1sGNhvbIsE16V7CyhxFne0d4=@emersion.fr>
In-Reply-To: <E53D9148-350D-4430-B4EF-689BBC1A9506@vmware.com>
References: <20220602154243.1015688-1-zack@kde.org>
 <wRnf-Lm5zz6v1e-NlnFPteyARuLl-R98mOZZVjePHD5ue7QQNR_TSU7RwYBssgUa7xM5hf7Fe59-gMEj81ESrHY3mu_H7yE0dtGhFHFPTnc=@emersion.fr>
 <0F911D96-1C9B-4EF1-84D7-F5335B3FFEB7@vmware.com>
 <5Et1VowGX_0a0i5weC4YVMX7bhGDU45hQyiv4CjqyxQStY1CSUJs-xamBowRO8go8yCk1l_jgKmM_OrMB0Fdx166545AX5nL09NGsEYaBs0=@emersion.fr>
 <06E05345-758E-456A-803D-B50978A935CA@vmware.com>
 <wgIEdQpY_K8Qlq_xWBLy4DHOGwKi0P2c8a5dnTXM4dKOsA2hydYyT9DC6T1ldVZmi_mduaTPi4fnidg1msOofUUKkbnal0-Vv3VuTnfZh0s=@emersion.fr>
 <E53D9148-350D-4430-B4EF-689BBC1A9506@vmware.com>
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

On Friday, June 3rd, 2022 at 17:17, Zack Rusin <zackr@vmware.com> wrote:

>
> > On Jun 3, 2022, at 10:56 AM, Simon Ser <contact@emersion.fr> wrote:
> > =E2=9A=A0 External Email
> >
> > On Friday, June 3rd, 2022 at 16:38, Zack Rusin <zackr@vmware.com> wrote=
:
> >
> > > > On Jun 3, 2022, at 10:32 AM, Simon Ser <contact@emersion.fr> wrote:
> > > >
> > > > =E2=9A=A0 External Email
> > > >
> > > > On Friday, June 3rd, 2022 at 16:27, Zack Rusin <zackr@vmware.com> w=
rote:
> > > >
> > > > > > In particular: since the driver will ignore the KMS cursor plan=
e
> > > > > > position set by user-space, I don't think it's okay to just exp=
ose
> > > > > > without opt-in from user-space (e.g. with a DRM_CLIENT_CAP).
> > > > > >
> > > > > > cc wayland-devel and Pekka for user-space feedback.
> > > > >
> > > > > I think Thomas expressed our concerns and reasons why those would=
n=E2=80=99t
> > > > > work for us back then. Is there something else you=E2=80=99d like=
 to add?
> > > >
> > > > I disagreed, and I don't understand Thomas' reasoning.
> > > >
> > > > KMS clients will need an update to work correctly. Adding a new pro=
p
> > > > without a cap leaves existing KMS clients broken. Adding a cap allo=
ws
> > > > both existing KMS clients and updated KMS clients to work correctly=
.
> > >
> > > I=E2=80=99m not sure what you mean here. They are broken right now. T=
hat=E2=80=99s what we=E2=80=99re
> > > fixing. That=E2=80=99s the reason why the virtualized drivers are on =
deny-lists for
> > > all atomic kms. So nothing needs to be updated. If you have a kms cli=
ent that
> > > was using virtualized drivers with atomic kms then mouse clicks never=
 worked
> > > correctly.
> > >
> > > So, yes, clients need to set cursor hotspot if they want mouse to wor=
k
> > > correctly with virtualized drivers.
> >
> > My proposal was:
> >
> > - Introduce DRM_CLIENT_CAP_CURSOR_PLANE_NO_POSITION (or a better name).=
 Only
> > user-space which supports the hotspot props will enable it.
> > - By default, don't expose a cursor plane, because current user-space d=
oesn't
> > support it (Weston might put a window in the cursor plane, and nobody c=
an
> > report hotspot).
> > - If the KMS client enables the cap, advertise the cursor
> > plane, and make it so the plane doesn't have the CRTC_X/CRTC_Y properti=
es
> > since the driver will pick the position.
> >
> > That way both old and new user-space are fixed.
>
> I don=E2=80=99t think I see how that fixes anything. In particular I don=
=E2=80=99t see a way
> of fixing the old user space at all. We require hotspot info, old user sp=
ace
> doesn=E2=80=99t set it because there=E2=80=99s no way of setting it on at=
omic kms.

Old atomic user-space is fixed by removing the cursor plane. Then old
atomic user-space will fallback to drawing the cursor itself, e.g. via
OpenGL.

New user-space supports setting the hotspot prop, and is aware that it can'=
t
set the cursor plane position, so the cursor plane can be exposed again whe=
n
the cap is enabled.
