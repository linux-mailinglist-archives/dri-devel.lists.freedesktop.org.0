Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 459E7750E68
	for <lists+dri-devel@lfdr.de>; Wed, 12 Jul 2023 18:24:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7BD2110E58E;
	Wed, 12 Jul 2023 16:24:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC81410E58E;
 Wed, 12 Jul 2023 16:24:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
 Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=2QjyHyWJBhLG4cpg/e0hytT+hb2i9rzXXaD4rzaFeiY=; b=DaYSlLxqkiS6QABe3zzC4aVg1H
 pqBwmtUS/T4K2s5WJHqbQ8Gd3BueiHebeMXZyXj2jk+SmlQFa42SlDsZhg/uVCmG4U3CaK38N5dbz
 nueypKGH+KGUHO9MCkXK+NJlqmgFvaykH/Cnowm0/7PLADlOibWyBTJiv3e75KGooXdOjM6ybtRPc
 YcV9J+kosyCQ1LHg/X590U9tkZo1rR3B8dMOJabGgzA/qVALLtr0aUUZY1sXs/w46P9UXwI5jdFMT
 LDOGWLbWbhA++UgwQdahRBZU0HCbzVKoEhtR9H7kFZPYmcUf78+rJ/LcJm/+131cx9YBMARv7qeCN
 r0Y3rMaQ==;
Received: from [38.44.68.151] (helo=mail.igalia.com)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1qJcdm-00DCga-Qr; Wed, 12 Jul 2023 18:24:34 +0200
Date: Wed, 12 Jul 2023 15:24:24 -0100
From: Melissa Wen <mwen@igalia.com>
To: "Pillai, Aurabindo" <Aurabindo.Pillai@amd.com>
Subject: Re: [PATCH] Revert "drm/amd/display: Program OTG vtotal min/max
 selectors unconditionally for DCN1+"
Message-ID: <20230712162424.z3yncg4ijoyvthqr@mail.igalia.com>
References: <20230702164407.6547-1-gpiccoli@igalia.com>
 <54092b91-a9c6-7276-1633-13b83a92524d@amd.com>
 <3e4892a5-f8a8-805b-aaf9-c9aec64d9607@igalia.com>
 <CH0PR12MB52846616C04D37205DD1B70C8B36A@CH0PR12MB5284.namprd12.prod.outlook.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="ksrthnjicoglqnzi"
Content-Disposition: inline
In-Reply-To: <CH0PR12MB52846616C04D37205DD1B70C8B36A@CH0PR12MB5284.namprd12.prod.outlook.com>
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
Cc: "cristian.ciocaltea@collabora.com" <cristian.ciocaltea@collabora.com>,
 =?utf-8?B?QW5kcsOp?= Almeida <andrealmeid@igalia.com>, "Patel,
 Swapnil" <Swapnil.Patel@amd.com>, "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 "Siqueira, Rodrigo" <Rodrigo.Siqueira@amd.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "Guilherme G. Piccoli" <gpiccoli@igalia.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "kernel-dev@igalia.com" <kernel-dev@igalia.com>, "Deucher,
 Alexander" <Alexander.Deucher@amd.com>, "Koenig,
 Christian" <Christian.Koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--ksrthnjicoglqnzi
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 07/12, Pillai, Aurabindo wrote:
> [Public]
>=20
> Hi Guilherme,
>=20
> Sorry there was one more patch which I missed to attach. Please add this =
3rd patch and retry.
>=20
> Reverting that patch would cause high power consumption on Navi2x GPU als=
o cause hangs on certain multi monitor configurations. With these 3 patches=
, you're getting the same effect as reverting the aforementioned patches, b=
ut it makes the reverted sequence available only for Steam deck hardware.
>=20

Hi Jay,

Thanks for looking at this issue.

You mention power consumption and multi-monitor configuration issues
that can affect a driver if we revert this OTG change, and both sounds
quite relevant to me. Can they not affect DCN301 too? Is there something
that needs further work so the DCN301 can benefit from this improvement
as well?

Also, let us know if we can contribute in any way.

Best Regards,

Melissa


> --
>=20
> Regards,
> Jay
> ________________________________
> From: Guilherme G. Piccoli <gpiccoli@igalia.com>
> Sent: Tuesday, July 11, 2023 7:15 PM
> To: Pillai, Aurabindo <Aurabindo.Pillai@amd.com>; Deucher, Alexander <Ale=
xander.Deucher@amd.com>
> Cc: amd-gfx@lists.freedesktop.org <amd-gfx@lists.freedesktop.org>; Koenig=
, Christian <Christian.Koenig@amd.com>; Pan, Xinhui <Xinhui.Pan@amd.com>; d=
ri-devel@lists.freedesktop.org <dri-devel@lists.freedesktop.org>; kernel-de=
v@igalia.com <kernel-dev@igalia.com>; cristian.ciocaltea@collabora.com <cri=
stian.ciocaltea@collabora.com>; Andr=E9 Almeida <andrealmeid@igalia.com>; M=
elissa Wen <mwen@igalia.com>; Siqueira, Rodrigo <Rodrigo.Siqueira@amd.com>
> Subject: Re: [PATCH] Revert "drm/amd/display: Program OTG vtotal min/max =
selectors unconditionally for DCN1+"
>=20
> On 11/07/2023 15:22, Aurabindo Pillai wrote:
> > [...]
> > Hi,
> >
> > Sorry for the delayed response, this patch went unnoticed. This revert =
would break asics. Could you try the attached patch without reverting this =
one ?
>=20
> Hi Aurabindo, thanks for your response!
>=20
> I've tried kernel 6.5-rc1, and it seems the issue is present, due to the
> patch being merged on Linus tree [as 1598fc576420 ("drm/amd/display:
> Program OTG vtotal min/max selectors unconditionally for DCN1+")].
>=20
> Then, I tried both your attached patches on top of that, and
> unfortunately, the behavior is the same: Steam Deck doesn't boot with
> graphics, and we can see the single error "amdgpu 0000:04:00.0: [drm]
> *ERROR* [CRTC:67:crtc-0] flip_done timed out" on dmesg.
>=20
> Do you / Alex think we could get this revert for 6.5-rc2, so at least we
> could boot mainline there while the issue is handled? It would be an
> intermediate fix. You mentioned it breaks some asics, but did they work
> until now, without your patch?
>=20
> Thanks,
>=20
>=20
> Guilherme



--ksrthnjicoglqnzi
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEd8WOo/JViG+Tu+XIwqF3j0dLehwFAmSu07EACgkQwqF3j0dL
ehxjjg/9GL442XCry+AcD00QF8O/9h2SnQSFoxWSNMSnfUhunzfBR56s4MMWneqf
bw//3dpq3BCN1tV9Y/4NUBgNB+ELYrHQX2J0wSZ+D6hySf8TqAJKvyAgiZyjAAo9
mE2OUF9GHquBAesNtm6ZA7Q7da8QqzNyruWB83/udZN9iIbvtoT//5AH2jb/pM+M
x7taAwH6+BcBsI6ef7VZ/Sa1Sx80j7fe3lIa9WACVILnfD3I6F9NEF2Qo4dwjg9f
jIj+yN3SnO+pVOw4y/VL3RVPGetglD/lJU3voh4p5oIZUerw5RHJqZUK0897j3Sg
px20Xa3IBP8RpsyeVyltCxv/AvMl/v7HV9ZBAZQl3MhyZL6uGDMLiO+IwryHRziI
fnpbEL+nV+XmwQUpr7Tozc+8Gz2YmrcWIQXGifg1/KzzXUnDXiYfzUJir+5/EnNI
OHQ4p4Poud3zf35OdFlc8yEpaQ/tZj4CisDjVNFhA/oAuApVK04n5zw6sJkVWwyO
+WV+oHIfK6n4AiZBMsR7OgpiYlddE6baJXixC0cB8msTF0fntfums7vEzYWArVr6
gLULewGeWzQ2qRUa/fq6F0B4Sth6ZxaiLSjJ8j/E6GrTEfRhLvbtt0oIhJBPNlp2
hmKb7IIZ3dT8gP3Keb7cRSHNZhfopFVeb2hP62RXJ+DsaRwYb0U=
=vrj0
-----END PGP SIGNATURE-----

--ksrthnjicoglqnzi--
