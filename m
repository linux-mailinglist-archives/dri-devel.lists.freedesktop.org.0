Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D28B64D868
	for <lists+dri-devel@lfdr.de>; Thu, 15 Dec 2022 10:18:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B51CA10E509;
	Thu, 15 Dec 2022 09:17:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com
 [IPv6:2a00:1450:4864:20::232])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4254C10E509;
 Thu, 15 Dec 2022 09:17:43 +0000 (UTC)
Received: by mail-lj1-x232.google.com with SMTP id s10so9324174ljg.1;
 Thu, 15 Dec 2022 01:17:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:message-id:subject:cc:to:from
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=CZa1tQeal7WxUPbkZznUJr94JvZw1/WR/slI556+nZo=;
 b=Mv29BTqC3MeaL1e5F86OYaM77bnehrzUJjrj1r/nGLN8jiEKIYZQjzI021hCuy3nrW
 9yDgpTGbi4DYoN/C6w3HU4c3wvlq4b71NPj8ywQy53lf6TnR9rNGuZmyIGQCJYERQXNr
 Wl5Bz2D9Wk0sD6oyLeqK3Z43xBcxlGgFbmx0JGgaVPdv2Credpkk/0j/t34mx5Wsb+Cz
 q5dlkGLsu2p8OTiCrdFaQFeenyho6W8HliO/8kzAMq91O82KwnVGX21ztXCV02+W4Ps4
 sJlJ0EAYU0Db0cNgrNaDzd3OwY6kYBWsagAanP+zJciYt9qPdSZiT+ptqjXjXtwcx5lF
 0uNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=mime-version:references:in-reply-to:message-id:subject:cc:to:from
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=CZa1tQeal7WxUPbkZznUJr94JvZw1/WR/slI556+nZo=;
 b=m137ce1AeKQ1Eaz14LpU+kDnPe4qaoJdyrHyY70eotdRTzIEJi1de/8hK+LjApJ11i
 jgX8thDesnAoOTbeCU/8O2DrEO7NF9Mo0vudcCa4/j+qjylHPR9/LMdg6jjkxGjtwK99
 pwNuHRYL0e77GKiv7iVV4imGUfN3W5CRV99h5sWH/6slGM2cad51hbCQONqxrb4XU+va
 at7EiLchibZ1zVS8PxSK1w1Vp3Ooj0pCiO6W7V6F11wnPjdLg2wWtCKrAtGsyaYM5GER
 DVRgIg4kSEuitR5gXCAgykdK6ULbwvFJw4vCAg0oH1lN8HBx9HlLy0hRc+mpEzWgJjMC
 VBrQ==
X-Gm-Message-State: ANoB5pkVypqU+74QV2ktCQ3wLlkTotK9zwD1Ar3eaEZZyyfWNa4NxZuv
 EE77lxzAni44waxdvZz273A=
X-Google-Smtp-Source: AA0mqf6bmeSfEW1dQxlzn3Zvb1qqOci1aXuqfAR7c3qVWfYNIKYQVeIbeMIaO+Fv/No2oPlbTyScxA==
X-Received: by 2002:a2e:a90f:0:b0:277:3cb2:da16 with SMTP id
 j15-20020a2ea90f000000b002773cb2da16mr6919740ljq.38.1671095861366; 
 Thu, 15 Dec 2022 01:17:41 -0800 (PST)
Received: from eldfell ([194.136.85.206]) by smtp.gmail.com with ESMTPSA id
 t25-20020a05651c205900b0027a17f86998sm786551ljo.127.2022.12.15.01.17.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Dec 2022 01:17:40 -0800 (PST)
Date: Thu, 15 Dec 2022 11:17:29 +0200
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Alex Deucher <alexdeucher@gmail.com>
Subject: Re: [PATCH 16/16] drm/amd/display: Don't restrict bpc to 8 bpc
Message-ID: <20221215111729.50ee7808@eldfell>
In-Reply-To: <CADnq5_M8Z2QRze60AFtmF6jTw8zpTpM-MPPmgejoUCb7Rv1ZrA@mail.gmail.com>
References: <20221212182137.374625-1-harry.wentland@amd.com>
 <20221212182137.374625-17-harry.wentland@amd.com>
 <114c2e02-41c8-8576-f88d-1c50f41deb9e@mailbox.org>
 <20221214110128.1cd58dea@eldfell>
 <CADnq5_M8Z2QRze60AFtmF6jTw8zpTpM-MPPmgejoUCb7Rv1ZrA@mail.gmail.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/Q3Y9sJryo4WH73qHCcO18k1";
 protocol="application/pgp-signature"; micalg=pgp-sha256
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
Cc: Sebastian Wick <sebastian.wick@redhat.com>,
 Michel =?UTF-8?B?RMOkbnplcg==?= <michel.daenzer@mailbox.org>,
 amd-gfx@lists.freedesktop.org, Uma Shankar <uma.shankar@intel.com>,
 dri-devel@lists.freedesktop.org, Joshua Ashton <joshua@froggi.es>,
 Vitaly.Prosyak@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/Q3Y9sJryo4WH73qHCcO18k1
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed, 14 Dec 2022 10:46:55 -0500
Alex Deucher <alexdeucher@gmail.com> wrote:

> On Wed, Dec 14, 2022 at 4:01 AM Pekka Paalanen <ppaalanen@gmail.com> wrot=
e:
> >
> > On Tue, 13 Dec 2022 18:20:59 +0100
> > Michel D=C3=A4nzer <michel.daenzer@mailbox.org> wrote:
> > =20
> > > On 12/12/22 19:21, Harry Wentland wrote: =20
> > > > This will let us pass kms_hdr.bpc_switch.
> > > >
> > > > I don't see any good reasons why we still need to
> > > > limit bpc to 8 bpc and doing so is problematic when
> > > > we enable HDR.
> > > >
> > > > If I remember correctly there might have been some
> > > > displays out there where the advertised link bandwidth
> > > > was not large enough to drive the default timing at
> > > > max bpc. This would leave to an atomic commit/check
> > > > failure which should really be handled in compositors
> > > > with some sort of fallback mechanism.
> > > >
> > > > If this somehow turns out to still be an issue I
> > > > suggest we add a module parameter to allow users to
> > > > limit the max_bpc to a desired value. =20
> > >
> > > While leaving the fallback for user space to handle makes some sense
> > > in theory, in practice most KMS display servers likely won't handle
> > > it.
> > >
> > > Another issue is that if mode validation is based on the maximum bpc
> > > value, it may reject modes which would work with lower bpc.
> > >
> > >
> > > What Ville (CC'd) suggested before instead (and what i915 seems to be
> > > doing already) is that the driver should do mode validation based on
> > > the *minimum* bpc, and automatically make the effective bpc lower
> > > than the maximum as needed to make the rest of the atomic state work.=
 =20
> >
> > A driver is always allowed to choose a bpc lower than max_bpc, so it
> > very well should do so when necessary due to *known* hardware etc.
> > limitations.
> > =20
>=20
> In the amdgpu case, it's more of a preference thing.  The driver would
> enable higher bpcs at the expense of refresh rate and it seemed most
> users want higher refresh rates than higher bpc.

Hi Alex,

we already have userspace in explicit control of the refresh rate.
Userspace picks the refresh rate first, then the driver silently checks
what bpc is possible. Userspace preference wins, so bpc is chosen to
produce the desired refresh rate.

In what cases does the driver really pick a refresh rate on its own?

Or is this about display latency more than throughput, to send a full
frame in shorter time while not actually increasing refresh rate?

Even for VRR, userspace already explicitly chooses the max refresh
rate, I believe.

I suppose optimising power consumption by choosing a lower bpc than
what would work is a use case, but that's a bit awkward currently
because there is no way for userspace to opt-out of that. OTOH,
userspace can already opt-in for that by lowering max_bpc.

>  I guess the driver
> can select a lower bpc at its discretion to produce what it thinks is
> the best default, but what about users that don't want the default?

That's what we need explicit bpc control KMS properties for, e.g.
min_bpc to complement max_bpc (I recall old discussions about this).
Only userspace could know what a particular end user wants.

To ask this differently: in what cases would max_bpc become the wanted
bpc in a way that it overrides the explicitly set video mode (refresh
rate), or would cause a modeset to fail if a lower bpc would make the
modeset succeed?

The very definition of max_bpc is that it's the upper limit, and not the
desired bpc. The UAPI documentation says:

max bpc:

    This range property is used by userspace to limit the bit depth.
    When used the driver would limit the bpc in accordance with the
    valid range supported by the hardware and sink. Drivers to use the
    function drm_connector_attach_max_bpc_property() to create and
    attach the property to the connector during initialization.

Git archaeology revealed that this property was first intended to work
around broken sinks and not for user preferences.


Thanks,
pq

>=20
> Alex
>=20
>=20
> > So things like mode validation cannot just look at a single max or min
> > bpc, but it needs to figure out if there is any usable bpc value that
> > makes the mode work.
> >
> > The max_bpc knob exists only for the cases where the sink undetectably
> > malfunctions unless the bpc is artificially limited more than seems
> > necessary. That malfunction requires a human to detect, and reconfigure
> > their system as we don't have a quirk database for this I think.
> >
> > The question of userspace wanting a specific bpc is a different matter
> > and an unsolved one. It also ties to userspace wanting to use the
> > current mode to avoid a mode switch between e.g. hand-off from firmware
> > boot splash to proper userspace. That's also unsolved AFAIK.
> >
> > OTOH, we have the discussion that concluded as
> > https://gitlab.freedesktop.org/wayland/weston/-/issues/612#note_1359898
> > which really puts userspace in charge of max_bpc, so the driver-chosen
> > default value does not have much impact as long as it makes the
> > firmware-chosen video mode to continue, as requested in
> > https://gitlab.freedesktop.org/wayland/weston/-/merge_requests/995
> > given that userspace cannot know what the actual bpc currently is nor
> > set the exact bpc to keep it the same.
> >
> >
> > Thanks,
> > pq =20


--Sig_/Q3Y9sJryo4WH73qHCcO18k1
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmOa5ikACgkQI1/ltBGq
qqeOlQ/+LoXfe8getXKELBMZTw9Cfhf9QLHpGEjQSCs7Up9RHUS2M3gIKiSYRZY3
y3bn4Q2yU2VNUawXPhphCe5h+TYgiHPZOsc6Mv+SFeNp0/xFPJaSguSUZ6Wkgb3g
RW1qSmMWG0SuM9mGMhhslryBoqGAsGUaf/l2LH+LylaO0+gOp34Xc+2niDifJz/V
9pu2CzWJmkcUJRgB5wmDqlfCA3GrVHb5aGRal8vnAJQ7SnEgwhnN3Vz+roICnVh9
p1fMxYtdhDH7n6/0UtZ2WEOy4UhgAfX2w73l7z7Q1SXkkFp6vbnZ517k//s//BHR
FK7b/pBv1yX3bksj28P6mzx0eoE95Ah2nwx1aj2CaJUaRewCMFn3iuJF6o8FTiax
gZv7I4+2+5b0M1dwriAceSqqMwOxmJHQ3cM6oBPnVH2cFszdN03N+Hdc5FLRxMkr
BOwQVFXa+ckwufzVW5ozlFp/YZD4HtxZiHZyX2c2plC34npSIO/ctHuymh+5gXQi
nTCyCvvoQO4p95kgbA9iG37MgzfmMZyJNPwxi5HkWv1giwtYLjjYB4aaJbpWAWK1
9HoifgpakZLe0jN0NB+Wlpa4ItGtfAdHyLcu9o5ZQj6JBs/p60Zg0hEYeP2/nGqx
RUYmSx5+M9A5ELmJu5N0WSggbSfepQIMLizuFg0pDCu5+OSXTTg=
=GyaW
-----END PGP SIGNATURE-----

--Sig_/Q3Y9sJryo4WH73qHCcO18k1--
