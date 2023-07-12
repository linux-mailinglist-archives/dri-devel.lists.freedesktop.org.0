Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 27F92750F17
	for <lists+dri-devel@lfdr.de>; Wed, 12 Jul 2023 18:57:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 761C910E59B;
	Wed, 12 Jul 2023 16:57:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A0C0210E59A;
 Wed, 12 Jul 2023 16:57:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
 Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=VtPDp9GqgY5iqt5dQKbjgObD2+aqy4Um1M9ri9si2wQ=; b=o1XFLjk/io0q7cNvwlavYY9YRi
 87p+LioReXYIqUmCDCB9k/JqQY3fJkmBcR3qwbMUv+r2/Op4TGBwRVRRbM8uDUhrLrQir9IgIyryX
 24mu4bQKFm+ZWMiTDtfrCEEsTH+MRhxHZHxdEtaD4vRtnA0GacQ4/equxytQBWwFxxWCYcS/9HbqJ
 0wLZqlKYwil9GPkavtgVM3zzInommZPyBTbaLF5JAvgH5Wn4Z6OPxTToqPjZmXtivgQvfhrR4TZft
 wF561gWhntSaTFEfOwqZJsSeKtbEL48RuOBEAKasdpatwlDE0P4nVBarPtc/WkljhTTHUnKZwS2hm
 4BJjSf4A==;
Received: from [38.44.68.151] (helo=mail.igalia.com)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1qJd9R-00DDIE-VG; Wed, 12 Jul 2023 18:57:18 +0200
Date: Wed, 12 Jul 2023 15:57:07 -0100
From: Melissa Wen <mwen@igalia.com>
To: Aurabindo Pillai <aurabindo.pillai@amd.com>
Subject: Re: [PATCH] Revert "drm/amd/display: Program OTG vtotal min/max
 selectors unconditionally for DCN1+"
Message-ID: <20230712165707.obgfbs4bjvju2imv@mail.igalia.com>
References: <20230702164407.6547-1-gpiccoli@igalia.com>
 <54092b91-a9c6-7276-1633-13b83a92524d@amd.com>
 <3e4892a5-f8a8-805b-aaf9-c9aec64d9607@igalia.com>
 <CH0PR12MB52846616C04D37205DD1B70C8B36A@CH0PR12MB5284.namprd12.prod.outlook.com>
 <20230712162424.z3yncg4ijoyvthqr@mail.igalia.com>
 <ca5fca94-619e-653a-4392-c4a5b6723fdc@amd.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="7whqmzkdhlvwhhke"
Content-Disposition: inline
In-Reply-To: <ca5fca94-619e-653a-4392-c4a5b6723fdc@amd.com>
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
Cc: =?utf-8?B?QW5kcsOp?= Almeida <andrealmeid@igalia.com>, "Patel,
 Swapnil" <Swapnil.Patel@amd.com>, "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 "Siqueira, Rodrigo" <Rodrigo.Siqueira@amd.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "Guilherme G. Piccoli" <gpiccoli@igalia.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "kernel-dev@igalia.com" <kernel-dev@igalia.com>,
 "cristian.ciocaltea@collabora.com" <cristian.ciocaltea@collabora.com>,
 "Deucher, Alexander" <Alexander.Deucher@amd.com>, "Koenig,
 Christian" <Christian.Koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--7whqmzkdhlvwhhke
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 07/12, Aurabindo Pillai wrote:
>=20
>=20
> On 7/12/2023 12:24 PM, Melissa Wen wrote:
> > On 07/12, Pillai, Aurabindo wrote:
> > > [Public]
> > >=20
> > > Hi Guilherme,
> > >=20
> > > Sorry there was one more patch which I missed to attach. Please add t=
his 3rd patch and retry.
> > >=20
> > > Reverting that patch would cause high power consumption on Navi2x GPU=
 also cause hangs on certain multi monitor configurations. With these 3 pat=
ches, you're getting the same effect as reverting the aforementioned patche=
s, but it makes the reverted sequence available only for Steam deck hardwar=
e.
> > >=20
> >=20
> > Hi Jay,
> >=20
> > Thanks for looking at this issue.
> >=20
> > You mention power consumption and multi-monitor configuration issues
> > that can affect a driver if we revert this OTG change, and both sounds
> > quite relevant to me. Can they not affect DCN301 too? Is there something
> > that needs further work so the DCN301 can benefit from this improvement
> > as well?
> >=20
> > Also, let us know if we can contribute in any way.
> >=20
>=20
> Hi Melissa,
>=20
> Unfortunately, DCN301 does not support Firmware Assisted Memory Clock
> Switching, which is the feature that gets blocked on Navi2x if we revert =
the
> patch in question.  This is the feature that enables lower power consumpt=
ion
> on some multi monitor configurations and high refresh rate single monitor
> configurations.
>=20
> Navi2x is configured to use FAMS in the driver, but without this change,
> firmware wont be able to actually enable the feature in DMCUB, which puts
> the driver in a unexpected state. On DCN301, this unexpected state will n=
ot
> occur, because there is no FAMS support in driver nor firmware.

Oh, got it. Sounds fine.
Many thanks for explaning the context of this change.

Best Regards,

Melissa

>=20
> --
> Jay
>=20
>=20
>=20

--7whqmzkdhlvwhhke
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEd8WOo/JViG+Tu+XIwqF3j0dLehwFAmSu21sACgkQwqF3j0dL
ehxvTA//TR0x135QFJ6hhTQ4s/0szZgTBQZ67LrKU5lxPmpa46qOnnvJ7VMJDx7q
tdaKuLXP+Z75dpWEP3/HBYidC6Idl8579BuQDC1LgHPX89RBdI+MJZolnLr4i4Kt
KBTxUigF6Q+Zai4C+P+heyd9VL6Zw/dWQAQILde8uHQnc5yr+wKp9I6y9UJw+jEL
qkOp8iQDC28wi5u0h8ZhBK/eRNv+/4M18XXSIL6ceccl07MPHyyAYHci92oemph2
7l8K5Z1eRUz5Vwn9tL1ED1juLOr7a9Jvi3VVwu8IS3iako/KHiAH6UjTFzEBO5uZ
Xcrlo0x+FYneBUKD4H2oIomNdV+UCIOqSvd6aTMS+L27U/3rFb9FAGLMR8/OSy5W
h3nE3tLHuenrGWswRCKahi/fnCff6y94NSfQUFdAuiS4bHBWsQTpurwAahmArPYS
RQArYxPQZvQQAWyf4KnUTvEDgfTUUY1fStvNJgsggnVgjL1oR4QRgUeS5JHAVqlw
SScqB7GCDnAxgwUyFBzKuCrmw6U/c/6CsuvvWGCijfUsrdgqHDOS5RWF58bmPiVO
5MCfxncYY72KInxtQEgdGVa3V9JB1zefC7Oz9P3x0DLys2NeddkzKIQNM5riYdVU
29lFR/gpgATfSUOxxqrg39DKbPRrKK+jY9ZgVqISpBq7J24S09g=
=qXWB
-----END PGP SIGNATURE-----

--7whqmzkdhlvwhhke--
