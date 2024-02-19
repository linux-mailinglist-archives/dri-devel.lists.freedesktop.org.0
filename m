Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 30D1A859F2F
	for <lists+dri-devel@lfdr.de>; Mon, 19 Feb 2024 10:06:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E5F910E199;
	Mon, 19 Feb 2024 09:06:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=haloniitty.fi header.i=@haloniitty.fi header.b="YOjQ3s7p";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from whm50.louhi.net (whm50.louhi.net [77.240.19.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 037DB10E15F;
 Mon, 19 Feb 2024 09:06:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=haloniitty.fi; s=default; h=Content-Type:MIME-Version:References:
 In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=zJd2/jY6apWwqOqaVrnaYHmAu95Wj50A02KcGcRg8FY=; b=YOjQ3s7pagONYvtf0BbS29bThl
 t0VySPGSezTNdCJj+Q7qtpXTjXN+7VpXV1sDgbTEPlkHfRswnD7AtLego+buBYMuMpZHoWC8J6OTb
 /XAZBZYKeHhOJywcqC8zRwtlcZbfxl05YGz8vteqhBpc+bTEmlsBkaKNaqR9ukMlA3oSzKdFYeeqy
 91VSFuTC4Au10IuSuUOWTD7vVO+WQfws60zgOqLldFvjjcS7IUcTex7dVvijD+3qnshHjQkSubgmu
 ps3ASrejKZjjX2l5TCCNmHGVkqDxbdqgY+XvvBWMikFwaBzm3+wH6pqpaQrVrYKxVb2KGg55RGpVs
 VoBkHbaQ==;
Received: from [194.136.85.206] (port=35564 helo=eldfell)
 by whm50.louhi.net with esmtpsa (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96.2)
 (envelope-from <pekka.paalanen@haloniitty.fi>) id 1rbzbB-0001JA-2x;
 Mon, 19 Feb 2024 11:06:05 +0200
Date: Mon, 19 Feb 2024 11:05:56 +0200
From: Pekka Paalanen <pekka.paalanen@haloniitty.fi>
To: Mario Limonciello <mario.limonciello@amd.com>
Cc: Harry Wentland <harry.wentland@amd.com>, Hamza Mahfooz
 <hamza.mahfooz@amd.com>, amd-gfx@lists.freedesktop.org, Leo Li
 <sunpeng.li@amd.com>, Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, Alex
 Deucher <alexander.deucher@amd.com>, Christian =?UTF-8?B?S8O2bmln?=
 <christian.koenig@amd.com>, "Pan, Xinhui" <Xinhui.Pan@amd.com>, David
 Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, Alex Hung
 <alex.hung@amd.com>, Srinivasan Shanmugam <srinivasan.shanmugam@amd.com>,
 Wayne Lin <wayne.lin@amd.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] drm/amd/display: add panel_power_savings sysfs entry
 to eDP connectors
Message-ID: <20240219110556.04a27591@eldfell>
In-Reply-To: <14cd1dee-94b7-48b4-96f4-b3c58512a605@amd.com>
References: <20240202152837.7388-1-hamza.mahfooz@amd.com>
 <20240216101936.2e210be2@eldfell>
 <82280a39-4e1d-41ee-82fb-758ceed953e4@amd.com>
 <20240216174242.15d07657@eldfell>
 <a25a6205-c43f-40ab-bb79-8199a8290912@amd.com>
 <d30e50bf-5b8e-47cb-8abf-e474f8490c99@amd.com>
 <14cd1dee-94b7-48b4-96f4-b3c58512a605@amd.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/iBK1dT1Ja+rNCM2/OJPAtU.";
 protocol="application/pgp-signature"; micalg=pgp-sha256
X-AntiAbuse: This header was added to track abuse,
 please include it with any abuse report
X-AntiAbuse: Primary Hostname - whm50.louhi.net
X-AntiAbuse: Original Domain - lists.freedesktop.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - haloniitty.fi
X-Get-Message-Sender-Via: whm50.louhi.net: authenticated_id:
 pekka.paalanen@haloniitty.fi
X-Authenticated-Sender: whm50.louhi.net: pekka.paalanen@haloniitty.fi
X-Source: 
X-Source-Args: 
X-Source-Dir: 
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

--Sig_/iBK1dT1Ja+rNCM2/OJPAtU.
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Fri, 16 Feb 2024 10:32:10 -0600
Mario Limonciello <mario.limonciello@amd.com> wrote:

> On 2/16/2024 10:13, Harry Wentland wrote:
> >=20
> >=20
> > On 2024-02-16 11:11, Harry Wentland wrote: =20
> >>
> >>
> >> On 2024-02-16 10:42, Pekka Paalanen wrote: =20
> >>> On Fri, 16 Feb 2024 09:33:47 -0500
> >>> Harry Wentland <harry.wentland@amd.com> wrote:
> >>> =20
> >>>> On 2024-02-16 03:19, Pekka Paalanen wrote: =20
> >>>>> On Fri, 2 Feb 2024 10:28:35 -0500
> >>>>> Hamza Mahfooz <hamza.mahfooz@amd.com> wrote:
> >>>>>     =20
> >>>>>> We want programs besides the compositor to be able to enable or di=
sable
> >>>>>> panel power saving features. =20
> >>>>>
> >>>>> Could you also explain why, in the commit message, please?
> >>>>>
> >>>>> It is unexpected for arbitrary programs to be able to override the =
KMS
> >>>>> client, and certainly new ways to do so should not be added without=
 an
> >>>>> excellent justification.
> >>>>>
> >>>>> Maybe debugfs would be more appropriate if the purpose is only test=
ing
> >>>>> rather than production environments?
> >>>>>     =20
> >>>>>> However, since they are currently only
> >>>>>> configurable through DRM properties, that isn't possible. So, to r=
emedy
> >>>>>> that issue introduce a new "panel_power_savings" sysfs attribute. =
=20
> >>>>>
> >>>>> When the DRM property was added, what was used as the userspace to
> >>>>> prove its workings?
> >>>>>     =20
> >>>>
> >>>> I don't think there ever was a userspace implementation and doubt any
> >>>> exists today. Part of that is on me. In hindsight, the KMS prop shou=
ld
> >>>> have never gone upstream.
> >>>>
> >>>> I suggest we drop the KMS prop entirely. =20
> >>>
> >>> Sounds good. What about the sysfs thing? Should it be a debugfs thing
> >>> instead, assuming the below question will be resolved?
> >>> =20
> >>
> >>
> >> It's intended to be used by the power profiles daemon (PPD). I don't t=
hink
> >> debugfs is the right choice. See
> >> https://gitlab.freedesktop.org/upower/power-profiles-daemon/-/commit/4=
1ed5d33a82b0ceb7b6d473551eb2aa62cade6bc
> >> =20
> >>>> As for the color accuracy topic, I think it is important that compos=
itors
> >>>> can have full control over that if needed, while it's also important
> >>>> for HW vendors to optimize for power when absolute color accuracy is=
 not
> >>>> needed. An average end-user writing code or working on their slides
> >>>> would rather have a longer battery life than a perfectly color-accur=
ate
> >>>> display. We should probably think of a solution that can support both
> >>>> use-cases. =20
> >>>
> >>> I agree. Maybe this pondering should start from "how would it work fr=
om
> >>> end user perspective"?
> >>>
> >>> "Automatically" is probably be most desirable answer. Some kind of =20
> >>
> >> I agree
> >> =20
> >>> desktop settings with options like "save power at the expense of image
> >>> quality":
> >>> - always
> >>> - not if watching movies/gaming
> >>> - on battery
> >>> - on battery, unless I'm watching movies/gaming
> >>> - never
> >>> =20
> >>
> >> It's interesting that you split out movies/gaming, specifically. AMD's
> >> ABM algorithm seems to have considered movies in particular when
> >> evaluating the power/fidelity trade-off.
> >>
> >> I wouldn't think consumer media is very particular about a specific
> >> color fidelity (despite what HDR specs try to make you believe). Where
> >> color fidelity would matter to me is when I'd want to edit pictures or
> >> video.
> >>
> >> The "abm_level" property that we expose is really just that, a setting
> >> for the strength of the power-savings effect, with 0 being off and 4 b=
eing
> >> maximum strength and power saving, at the expense of fidelity.
> >>
> >> Mario's work is to let the PPD control it and set the ABM levels based=
 on
> >> the selected power profile:
> >> 0 - Performance
> >> 1 - Balance
> >> 3 - Power
> >>
> >> And I believe we've looked at disabling ABM (setting it to 0) automati=
cally
> >> if we know we're on AC power.
> >> =20
> >>> Or maybe there already is something like that, and it only needs to be
> >>> plumbed through?
> >>>
> >>> Which would point towards KMS clients needing to control it, which
> >>> means a generic KMS prop rather than vendor specific?
> >>>
> >>> Or should the desktop compositor be talking to some daemon instead of
> >>> KMS for this? Maybe they already are?
> >>> =20
> >>
> >> I think the intention is for the PPD to be that daemon. Mario can elab=
orate.
> >> =20
> >=20
> > Some more details and screenshots on how the PPD is expected to work an=
d look:
> > https://linuxconfig.org/how-to-manage-power-profiles-over-d-bus-with-po=
wer-profiles-daemon-on-linux =20
>=20
> Right, thanks!
>=20
> The most important point is that the user indicates intent from the GUI.
> The daemon orchestrates the various knobs to get that intent.
>=20
> It's intentionally very coarse - 3 power states.  The policy of what to=20
> do for those states is managed by the daemon.
>=20
> In the case of ABM it will only apply the policy if the daemon detects=20
> the system is on battery.
>=20

Sounds like sysfs is the best option, and it should never have been a
KMS property, indeed.


Thanks,
pq

--Sig_/iBK1dT1Ja+rNCM2/OJPAtU.
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmXTGfQACgkQI1/ltBGq
qqdjHw/5AToq06LCDGYksSytCQJdqrFukKT5suSnJdaN43R1UsNSQu4dhu4m24om
aa0edR25V+07wYSCyRGmdC5s0S8flAahE6F9xW7pSBMEBh2GuV63C0/5Z9UfWn96
e/lWDYBxD3qaygfcd2e+QJ43hJVIhZXJRI+vs8xsf/tTjjB6msEzKg4QIji+IE3B
hIjIr7Y8VgBOK/QiCKMMpS6b7ZIgmp7GNYPsOXka/Mnq+8tVshRD3eGqsjqcdwpo
ZHHsXHwq65xAT+hoRpHLMAtCcCNpSfGZCUbfkZG7AKPAMg/x3ojJHv+u1zMIguhM
pvQuFoh3d9O3RNMjAj+geTwMYIkHhISLV8UlVgV2DPVwD17quWVu+imoozd+jiou
jYfhpmVBPd4HbvvoD31hPd20z9du3KpvUvsa/c7rkRLJDeHA2KldiNn2ERAVfmzP
StAKtSt84x+txvK5YxHN46Z938gvRgsxc7Q0j3yRGyedvyPvXMtRsYMK3MONcyCV
EZT/46LWPxnKeXUEjCwG34LEFR3wxo9M832o5PcWo/bwmJl3PsH7ZAnhrvLSUGwM
NaM0Xw3Sv+8D6pwTT8MPHOia3hT8OhL1/vftV+FktCXKUdTDk6ZeX1wdI/RUxQqa
OgEVqXQR56cE2SwR8BXPlPKulSi/Y0/XUbMl3+rygMoaxi3Xees=
=qd2V
-----END PGP SIGNATURE-----

--Sig_/iBK1dT1Ja+rNCM2/OJPAtU.--
