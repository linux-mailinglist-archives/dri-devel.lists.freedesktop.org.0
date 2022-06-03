Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C07853CBDA
	for <lists+dri-devel@lfdr.de>; Fri,  3 Jun 2022 16:56:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E10010FDCC;
	Fri,  3 Jun 2022 14:56:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-4323.proton.ch (mail-4323.proton.ch [185.70.43.23])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1894610FDCC
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Jun 2022 14:56:56 +0000 (UTC)
Date: Fri, 03 Jun 2022 14:56:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail2; t=1654268213; x=1654527413;
 bh=bU65XIP09imbruzLO2tCO38i7i3Q4sesLEEyph6EThQ=;
 h=Date:To:From:Cc:Reply-To:Subject:Message-ID:In-Reply-To:
 References:Feedback-ID:From:To:Cc:Date:Subject:Reply-To:
 Feedback-ID:Message-ID;
 b=RtIoQAm2VZ3GBt1zfuuaX6BgDUnFEjYKsU6xvd7Ggn1A9Ebw0fpQ7VCO1qyWE3+Oc
 RkQc17fbKF6RLgj30KmAseVySDEt4JkAkE2F576q+8mkFPo/2/6zCsMdcWgF4tUrrj
 By11l9aOK5oQUkLXy2/ocu1S1zi5CCPdBhzKWr0dfSIzaTjSrFM825FapPB3LvPo16
 SIcpFWGWv1P+oaZ1MD81K42iwGkSeV4DwQxoNB5KgPGQ53Qs1Cdm95yMJ4JQ3rDmPF
 o84XqW5csZEvLNiZNuwxCE69L6MAQGzewlXT7WvMFnNqR1w1jYjPmOvkseC2PDI21z
 e9690my2y7Dkg==
To: Zack Rusin <zackr@vmware.com>
From: Simon Ser <contact@emersion.fr>
Subject: Re: [PATCH 0/6] drm: Add mouse cursor hotspot support to atomic KMS
Message-ID: <wgIEdQpY_K8Qlq_xWBLy4DHOGwKi0P2c8a5dnTXM4dKOsA2hydYyT9DC6T1ldVZmi_mduaTPi4fnidg1msOofUUKkbnal0-Vv3VuTnfZh0s=@emersion.fr>
In-Reply-To: <06E05345-758E-456A-803D-B50978A935CA@vmware.com>
References: <20220602154243.1015688-1-zack@kde.org>
 <wRnf-Lm5zz6v1e-NlnFPteyARuLl-R98mOZZVjePHD5ue7QQNR_TSU7RwYBssgUa7xM5hf7Fe59-gMEj81ESrHY3mu_H7yE0dtGhFHFPTnc=@emersion.fr>
 <0F911D96-1C9B-4EF1-84D7-F5335B3FFEB7@vmware.com>
 <5Et1VowGX_0a0i5weC4YVMX7bhGDU45hQyiv4CjqyxQStY1CSUJs-xamBowRO8go8yCk1l_jgKmM_OrMB0Fdx166545AX5nL09NGsEYaBs0=@emersion.fr>
 <06E05345-758E-456A-803D-B50978A935CA@vmware.com>
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

On Friday, June 3rd, 2022 at 16:38, Zack Rusin <zackr@vmware.com> wrote:

> > On Jun 3, 2022, at 10:32 AM, Simon Ser <contact@emersion.fr> wrote:
> >
> > =E2=9A=A0 External Email
> >
> > On Friday, June 3rd, 2022 at 16:27, Zack Rusin <zackr@vmware.com> wrote=
:
> >
> >>> In particular: since the driver will ignore the KMS cursor plane
> >>> position set by user-space, I don't think it's okay to just expose
> >>> without opt-in from user-space (e.g. with a DRM_CLIENT_CAP).
> >>>
> >>> cc wayland-devel and Pekka for user-space feedback.
> >>
> >> I think Thomas expressed our concerns and reasons why those wouldn=
=E2=80=99t
> >> work for us back then. Is there something else you=E2=80=99d like to a=
dd?
> >
> > I disagreed, and I don't understand Thomas' reasoning.
> >
> > KMS clients will need an update to work correctly. Adding a new prop
> > without a cap leaves existing KMS clients broken. Adding a cap allows
> > both existing KMS clients and updated KMS clients to work correctly.
>
> I=E2=80=99m not sure what you mean here. They are broken right now. That=
=E2=80=99s what we=E2=80=99re
> fixing. That=E2=80=99s the reason why the virtualized drivers are on deny=
-lists for
> all atomic kms. So nothing needs to be updated. If you have a kms client =
that
> was using virtualized drivers with atomic kms then mouse clicks never wor=
ked
> correctly.
>
> So, yes, clients need to set cursor hotspot if they want mouse to work
> correctly with virtualized drivers.

My proposal was:

- Introduce DRM_CLIENT_CAP_CURSOR_PLANE_NO_POSITION (or a better name). Onl=
y
  user-space which supports the hotspot props will enable it.
- By default, don't expose a cursor plane, because current user-space doesn=
't
  support it (Weston might put a window in the cursor plane, and nobody can
  report hotspot).
- If the KMS client enables the cap, advertise the cursor
  plane, and make it so the plane doesn't have the CRTC_X/CRTC_Y properties
  since the driver will pick the position.

That way both old and new user-space are fixed.

> >>> On Thursday, June 2nd, 2022 at 17:42, Zack Rusin zack@kde.org wrote:
> >>>
> >>>> - all userspace code needs to hardcore a list of drivers which requi=
re
> >>>> hotspots because there's no way to query from drm "does this driver
> >>>> require hotspot"
> >>>
> >>> Can you elaborate? I'm not sure I understand what you mean here.
> >>
> >> Only some drivers require informations about cursor hotspot, user spac=
e
> >> currently has no way of figuring out which ones are those, i.e. amdgpu
> >> doesn=E2=80=99t care about hotspots, qxl does so when running on qxl w=
ithout
> >> properly set cursor hotspot atomic kms will result in a desktop where
> >> mouse clicks have incorrect coordinates.
> >>
> >> There=E2=80=99s no way to differentiate between drivers that do not ca=
re about
> >> cursor hotspots and ones that absolutely require it.
> >
> > Only VM drivers should expose the hotspot properties. Real drivers like
> > amdgpu must not expose it.
>
> Yes, that=E2=80=99s what I said. There=E2=80=99s no way to differentiate =
between amdgpu that
> doesn=E2=80=99t have those properties and virtio_gpu driver from a kernel=
 before
> hotspot properties were added.

See cap proposal above.
