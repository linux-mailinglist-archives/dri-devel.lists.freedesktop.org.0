Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F36253DAB8
	for <lists+dri-devel@lfdr.de>; Sun,  5 Jun 2022 09:34:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 169431124AF;
	Sun,  5 Jun 2022 07:34:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-4323.proton.ch (mail-4323.proton.ch [185.70.43.23])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5BD921124AF;
 Sun,  5 Jun 2022 07:34:25 +0000 (UTC)
Date: Sun, 05 Jun 2022 07:34:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail2; t=1654414463; x=1654673663;
 bh=erf+qw9k5Dkarbem9sM6k0VTasiryG8Ihb4qPAslQBs=;
 h=Date:To:From:Cc:Reply-To:Subject:Message-ID:In-Reply-To:
 References:Feedback-ID:From:To:Cc:Date:Subject:Reply-To:
 Feedback-ID:Message-ID;
 b=SzOixiWJAn1X2EC2uMOaPxPTpwUKgF6s7/ifOJKBSMI2nlek1ZU2AMNpERQWDIMQt
 +DXhhR+r2vEoJoMdomAc2rsHYSCrIQd2NeAGMoSk0Bnw3iYyv23lc+2JqHsF5T0oQk
 q0XVWqQOtBhV6tUYDkMgpGhmuM4+BtLuW9thbeAXVsfmVxuSKM1xfX7/ND8PRSk95X
 RsLKRjwyzez3p8sGGd4eyGfOfRVbmgv7dfOaruTEPSSu/RrSyfHvI+/yE4ipMd7GAd
 Arz0r/h/J1i4swYxKjbiTEmAhXjMv8sI0F71k/YxAU8UHD5c8iGC+8hIxY3tgXPFev
 OqebHx2gmu0xQ==
To: Hans de Goede <hdegoede@redhat.com>
From: Simon Ser <contact@emersion.fr>
Subject: Re: [PATCH 0/6] drm: Add mouse cursor hotspot support to atomic KMS
Message-ID: <wTMZ85XGrc3v-Zsrfb6RM6v9g7TybRYmhAobFZ_JvfNNoG2enelzNNVD7owtlETlrsYvHMr8M4EA6_gmp1si-dEeqs7kTp5U6QKJa8jkhC4=@emersion.fr>
In-Reply-To: <18519d7e-6594-3b05-dfa5-9fcd580c8fea@redhat.com>
References: <20220602154243.1015688-1-zack@kde.org>
 <wRnf-Lm5zz6v1e-NlnFPteyARuLl-R98mOZZVjePHD5ue7QQNR_TSU7RwYBssgUa7xM5hf7Fe59-gMEj81ESrHY3mu_H7yE0dtGhFHFPTnc=@emersion.fr>
 <0F911D96-1C9B-4EF1-84D7-F5335B3FFEB7@vmware.com>
 <5Et1VowGX_0a0i5weC4YVMX7bhGDU45hQyiv4CjqyxQStY1CSUJs-xamBowRO8go8yCk1l_jgKmM_OrMB0Fdx166545AX5nL09NGsEYaBs0=@emersion.fr>
 <06E05345-758E-456A-803D-B50978A935CA@vmware.com>
 <wgIEdQpY_K8Qlq_xWBLy4DHOGwKi0P2c8a5dnTXM4dKOsA2hydYyT9DC6T1ldVZmi_mduaTPi4fnidg1msOofUUKkbnal0-Vv3VuTnfZh0s=@emersion.fr>
 <E53D9148-350D-4430-B4EF-689BBC1A9506@vmware.com>
 <GWQv37zd56Jok0LiKDGflZUSaHMYyk9Uad7M6-6-gqjeUGoT5dJOfsB9XDS4UuVEcZSI34GOTFa4XA0Cf2A1sGNhvbIsE16V7CyhxFne0d4=@emersion.fr>
 <18519d7e-6594-3b05-dfa5-9fcd580c8fea@redhat.com>
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
Cc: David Airlie <airlied@linux.ie>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Gurchetan Singh <gurchetansingh@chromium.org>,
 Martin Krastev <krastevm@vmware.com>, Pekka Paalanen <ppaalanen@gmail.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 wayland-devel <wayland-devel@lists.freedesktop.org>,
 Maaz Mombasawala <mombasawalam@vmware.com>, Gerd Hoffmann <kraxel@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Saturday, June 4th, 2022 at 23:19, Hans de Goede <hdegoede@redhat.com> w=
rote:

> >>> My proposal was:
> >>>
> >>> - Introduce DRM_CLIENT_CAP_CURSOR_PLANE_NO_POSITION (or a better name=
). Only
> >>> user-space which supports the hotspot props will enable it.
> >>> - By default, don't expose a cursor plane, because current user-space=
 doesn't
> >>> support it (Weston might put a window in the cursor plane, and nobody=
 can
> >>> report hotspot).
> >>> - If the KMS client enables the cap, advertise the cursor
> >>> plane, and make it so the plane doesn't have the CRTC_X/CRTC_Y proper=
ties
> >>> since the driver will pick the position.
> >>>
> >>> That way both old and new user-space are fixed.
> >>
> >> I don=E2=80=99t think I see how that fixes anything. In particular I d=
on=E2=80=99t see a way
> >> of fixing the old user space at all. We require hotspot info, old user=
 space
> >> doesn=E2=80=99t set it because there=E2=80=99s no way of setting it on=
 atomic kms.
> >
> > Old atomic user-space is fixed by removing the cursor plane. Then old
> > atomic user-space will fallback to drawing the cursor itself, e.g. via
> > OpenGL.
>
> That is just a terrible idea, the current situation is that userspace has=
 a
> hardcoded list of drivers which need hotspots, so it uses the old non-ato=
mic
> APIs on that "hw" since the atomic APIs don't support hotspots.

*Some* user-space does this (Mutter, KWin). There is also user-space which
doesn't (Weston, wlroots).

> The downsides I see to your proposal are:
>
> 1. Falling back to sw cursor rendering instead of using the old APIs woul=
d
> be a pretty significant regression in user experience. I know that in the=
ory
> sw rendering can be made to not flicker, but in practice it tends to be a
> flickery mess.

Old Mutter/KWin with the deny-lists cannot be updated and will still use th=
e
legacy uAPI. New Muter/KWin with support for atomic hotspot will not need a
deny-list anymore. No breakage here.

> 2. It does not help anything since userspace is still hardcoded to use
> the old, hotspot aware non-atomic API anyways. So it would only make thin=
gs
> worse since hiding the cursorplane for userspace which does not set the C=
AP
> would mean the the old non-atomic API also stops working. Or this would a=
dd
> extra complications in the kernel to still keep the old APIs working.

The cursor plane would only be hidden when user-space has enabled
DRM_CAP_UNIVERSAL_PLANES. IOW, user-space only supporting the legacy uAPI w=
ill
still work as it does today.
