Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BBF1868CAB
	for <lists+dri-devel@lfdr.de>; Tue, 27 Feb 2024 10:51:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6741210E8CA;
	Tue, 27 Feb 2024 09:51:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=emersion.fr header.i=@emersion.fr header.b="o5SLQ+nN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-4022.proton.ch (mail-4022.proton.ch [185.70.40.22])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9BB9910E8CA
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Feb 2024 09:51:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail3; t=1709027473; x=1709286673;
 bh=CGl+EvHbLNT2KSVNK+ccuXN/jwNX9S5BY+R9cLKp0uk=;
 h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
 Message-ID:BIMI-Selector;
 b=o5SLQ+nNUHIYXSlkdLWq7CE9L6e916WyO3fMSmLkf4wa6q7dVastKsTR4fBOwGAbY
 5FC5HMyLz1zt3mxhdL4xpX2BxBvN8qVEnu/MnFayrsj32fThSw2UfP+5kcDLwO3tFS
 yBxArIBdG7hZEq64pIMhilKI8zzCUmQgUoy0f9grrrkVJkfLzT/koEyX+0rnwMS9XN
 3JlAVT/SdclbD3YWAdcOQ2ciRbomJu/anJbBrArO1PqGStq4vNMgkruzEe4Fx3XxdD
 pBZljhiaB12mOdNaZsSkTo1ZFO1TPP3RvftWr8GFR83GWpUAAtZjWk45D3QtljsiWL
 ti2byalFKVkSw==
Date: Tue, 27 Feb 2024 09:51:06 +0000
To: Dave Stevenson <dave.stevenson@raspberrypi.com>
From: Simon Ser <contact@emersion.fr>
Cc: Pekka Paalanen <pekka.paalanen@haloniitty.fi>,
 Maxime Ripard <mripard@kernel.org>, dri-devel@lists.freedesktop.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Nick Hollinghurst <nick.hollinghurst@raspberrypi.com>
Subject: Re: UAPI Re: [PATCH 1/3] drm: Add DRM_MODE_TV_MODE_MONOCHROME
Message-ID: <5us3AK9XJ5zu1AOKQeZxKWsK0f6Xtm7vHWttRTFPRo57Ph5WO62deVIK8TrkQIFmjFMrn-a2qusgP3W74dV6SKTA5OdTt4zncR7J2qQ_Qck=@emersion.fr>
In-Reply-To: <CAPY8ntCHi8joN-w3PNjMj31FSkCjqmJ4ZyhSDFZ1-PnfL4+FrQ@mail.gmail.com>
References: <20240216184857.245372-1-dave.stevenson@raspberrypi.com>
 <20240216184857.245372-2-dave.stevenson@raspberrypi.com>
 <20240221110751.48da8190@eldfell>
 <b43rdl7yebxn6z3pvyeyxbikccr7umrojo5kqw5i3ybloxktso@de4oxsbskkwp>
 <20240226171143.27e60c30@eldfell>
 <CAPY8ntCHi8joN-w3PNjMj31FSkCjqmJ4ZyhSDFZ1-PnfL4+FrQ@mail.gmail.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Monday, February 26th, 2024 at 18:23, Dave Stevenson <dave.stevenson@ras=
pberrypi.com> wrote:

> You want the commit text for a patch adding a new enum to state that
> the whole property isn't expected to be used through the UAPI? OK, I
> can roll a v2 if that is your desire.

By definition, anything new exposed by the kernel via KMS is new uAPI,
even if it's not expected to be used by most compositors.

> > You should expect that all KMS clients will work towards programming
> > all exposed KMS properties into known values. That's the only way to
> > achieve repeatable KMS behaviour, because there is no KMS reset ioctl.
> >=20
> > There are no two tiers of KMS properties AFAIK. You have to be the DRM
> > master to change anything. So, people cannot force any settings from
> > outside of a KMS client, they have to go through the KMS client, like
> > xrandr goes through Xorg (and only Xorg).
> >=20
> > I do fully expect Weston to gain support for this property, if anyone
> > cares of its value. That goes for all Wayland compositors.
>=20
> I don't know about Weston, but Wayfire / wlroots / sway have currently
> chosen to ignore all interlaced display modes [1].
> [2] is the wlroots devs basically calling interlaced output a dead end.

Note, part of this thread is missing on GitLab:
https://github.com/swaywm/wlroots/issues/3038

Also note that none of that is set in stone if someone comes with a
solid enough use-case.

> That makes the debate for controlling the colour encoding on a
> composite video rather redundant as they're almost always interlaced.
>=20
> [1] https://github.com/swaywm/sway/issues/3167
> [2] https://gitlab.freedesktop.org/wlroots/wlroots/-/issues/3038
>=20
> > You're correct in that a KMS client would probably not know to control
> > the value of this property automatically but it needs to come from
> > configuration. That would be each KMS client's configuration. I don't
> > understand how a script could achieve that.
> >=20
> > However, if you feel it is important to have KMS properties that
> > display servers must not touch, then they should be documented as such.
> > I do not know if that would actually lift the new-UAPI requirements,
> > that is for the DRM maintainers to decide and document. Is there such a
> > thing already?
> >=20
> > What are those "similar to xrandr" mechanisms? I don't think I've heard
> > of any,
>=20
> Boot to the console and run
> modetest -w <connector id>:"tv_mode":"NTSC"
>=20
> There is no reset mechanism for all properties, so that setting
> persists after modetest quits.

That is a hack. This hack is no guarantee to continue to work in the
future. KMS is not intended to be abused this way.

There is a single component in charge of managing the KMS properties:
the compositor. Any attempt to bypass it only works by chance, if it
works at all and doesn't result in fireworks.

> > and I've also completely missed any kernel command line
> > arguments manipulating KMS properties.
>=20
> "tv_mode" on the command line is handled in
> drm_mode_parse_cmdline_options() [3], as are rotate, reflect_x,
> reflect_y, margin_[left|right|top|bottom], and panel_orientation all
> to set the relevant KMS properties.
>=20
> Having "video=3DComposite-1:PAL,tv_mode=3DMono" on the kernel command lin=
e
> will set up connector Composite-1 with the standard 720x576 50Hz
> interlaced timings, and DRM_MODE_TV_MODE_MONOCHROME selected on the
> tv_mode property. Swap in different tv_mode descriptions as required
> (eg PAL,tv_mode=3DSECAM), although some make little sense.
>=20
> That's the main route I'm looking at for configuring this property,
> for situations such as having a black and white TV connected. You
> don't get the opportunity to interrogate a composite display over what
> it supports, so it has to be configured manually somewhere in the
> system. If your monitor doesn't support the system default, then you
> can't see a GUI in order to change the option, and there is no
> guaranteed supported configuration so the command line is about the
> only option.
>=20
> The use cases for runtime switching of the "tv_mode" are exceedingly
> rare, so IMHO the property doesn't need exposing through the UAPI.
> However it was added to the UAPI about 8 years ago for vc4 and sunxi,
> and is also now used by other drivers, so can't be reverted. Does that
> mean it can now never be changed without jumping through the hoop of
> creating some userspace user?

I don't know what the rules were 8 years ago, but the current uAPI rules
are what they are, and a new enum entry is new uAPI.
