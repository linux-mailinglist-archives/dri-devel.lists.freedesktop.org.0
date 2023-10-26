Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 35FA67D8609
	for <lists+dri-devel@lfdr.de>; Thu, 26 Oct 2023 17:31:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5582F10E82C;
	Thu, 26 Oct 2023 15:31:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 94F3F10E82C
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Oct 2023 15:31:08 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id A8F74B83577;
 Thu, 26 Oct 2023 15:31:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B3381C433C8;
 Thu, 26 Oct 2023 15:31:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1698334266;
 bh=0nTZHonXGwZvkGH7pE14VYvU1y0lNC0xABHRTpL5SaQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=TIevdTyzTjGfIq8vXD/vB726spCDkJlNsxf94bk1lYnrwSPxNSEsnFi42257zsqBr
 kbJ43Ie/0wGowI3LkGZwLDmvmPjKeBaGinymKC7WbHSiSeaeIBdELBJYOgVGWdgbt8
 /rAg5D0mKdtnM96EObEY865eT0+ANoTnJAx+bq+1ofbDwcO7dLyUNUxyMy+kno53Np
 bgrl04CYGs3qL7UKapwzU0rW21Qm/GKM785iwD9FwuboW8v8u9XhYzsEu/6Od+aa//
 70ibsFVlfAL2nzcycw1roIOP7nZSKLswwb+D3iCJ/TdUl1OE6zsJdyFAZfmu+41XPA
 GOEdeZPYLVt6w==
Date: Thu, 26 Oct 2023 17:31:03 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Helen Koike <helen.koike@collabora.com>
Subject: Re: (subset) [PATCH v2] drm/doc: ci: Require more context for flaky
 tests
Message-ID: <tfl6ugavysoukh7tynct6a56vwfcc56s372kmyxyd3rmad77ra@c7scmnjz2fid>
References: <20231025142441.745947-1-mripard@kernel.org>
 <169831793153.896759.13985615649031607361.b4-ty@kernel.org>
 <62542ca6-d2c2-4330-8423-3edbdc3b4bd8@collabora.com>
 <22723536-dc2e-4973-984b-1504367d84a0@collabora.com>
 <jufk7lzskhsz4dc4iiqsuuspno2772yowokw6e75dmrh5jvdt2@g6it5xcsd45k>
 <d7ad25bb-3391-4a2d-96df-f579bc38e183@collabora.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="vr55hum7mrutm4r7"
Content-Disposition: inline
In-Reply-To: <d7ad25bb-3391-4a2d-96df-f579bc38e183@collabora.com>
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
Cc: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@intel.com>,
 Vignesh Raman <vignesh.raman@collabora.com>, dri-devel@lists.freedesktop.org,
 Daniel Vetter <daniel.vetter@ffwll.ch>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--vr55hum7mrutm4r7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Thu, Oct 26, 2023 at 11:27:18AM -0300, Helen Koike wrote:
> On 26/10/2023 10:27, Maxime Ripard wrote:
> > On Thu, Oct 26, 2023 at 09:08:03AM -0300, Helen Koike wrote:
> > >=20
> > >=20
> > > On 26/10/2023 09:01, Helen Koike wrote:
> > > >=20
> > > >=20
> > > > On 26/10/2023 07:58, Maxime Ripard wrote:
> > > > > On Wed, 25 Oct 2023 16:24:41 +0200, Maxime Ripard wrote:
> > > > > > Flaky tests can be very difficult to reproduce after the facts,=
 which
> > > > > > will make it even harder to ever fix.
> > > > > >=20
> > > > > > Let's document the metadata we agreed on to provide more contex=
t to
> > > > > > anyone trying to address these fixes.
> > > > > >=20
> > > > > >=20
> > > > > > [...]
> > > > >=20
> > > > > Applied to drm/drm-misc (drm-misc-next).
> > > >=20
> > > > Thanks!
> > > >=20
> > > > Could you also apply https://patchwork.kernel.org/project/dri-devel=
/cover/20231024004525.169002-1-helen.koike@collabora.com/
> > > > (and the dependencies listed on it).
> > >=20
> > > For some reason, commit message 7/10 (drm/ci: increase i915 job timeo=
ut to
> > > 1h30m) looks incomplete in patchwork, but it looks fine in my branch:
> > >=20
> > > https://gitlab.freedesktop.org/helen.fornazier/linux/-/commits/for-dr=
m-misc-wip/
> > >=20
> > > Let me know if you prefer that I send it again or if you could pull f=
rom the
> > > branch.
> >=20
> > It was fine on lore.kernel.org and that's where I'm pulling from, so it=
 all worked out :)
> >=20
> > Everything you asked for should be applied now
> >=20
> > Maxime
>=20
> Awesome, thank you!
>=20
> Sorry, just another request, could you please pull this other one updating
> MAINTAINERS?
>=20
> https://patchwork.kernel.org/project/linux-arm-msm/patch/20230919182249.1=
53499-1-helen.koike@collabora.com/

I don't mind, but the expectation (the one I had at least) was that you wou=
ld do it :)

If you don't have drm-misc access, please create an account, you have
done way more than expected to get one already

Maxime

--vr55hum7mrutm4r7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZTqGNwAKCRDj7w1vZxhR
xQLZAP4wvwkRXXbnGUS6+Yv75UEDYZ1Pmla6JZ/BFGF2/HvLSQD+IdzA5Y1SXTUz
q7c5RK3buAZDZYib705AdHRVesOBIAQ=
=kBV6
-----END PGP SIGNATURE-----

--vr55hum7mrutm4r7--
