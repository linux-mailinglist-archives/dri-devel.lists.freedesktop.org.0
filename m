Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 750EFB3816B
	for <lists+dri-devel@lfdr.de>; Wed, 27 Aug 2025 13:41:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 33BAA10E7E5;
	Wed, 27 Aug 2025 11:41:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Ip2F1tNP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B525E10E7E2;
 Wed, 27 Aug 2025 11:40:56 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 6357341B21;
 Wed, 27 Aug 2025 11:40:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C35E7C4CEEB;
 Wed, 27 Aug 2025 11:40:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1756294856;
 bh=j7JKN3Qxc8gOY3CGeEKvm2JllThAj0nwSwGpt/ZdFUs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Ip2F1tNPOmPTmdlUfxlgawt4/MvQbcBMAU5HrNLXaB2Uc1GWZSOXl7C7awQSv8+2r
 T+RgU8qvZsLzeAC26JINq4UZXamUuwPCKRrEVqhi9joV1Ea1nKYwnyJJ3eQEpWB/2v
 oE7sAvjdSpVlNxC3zP9tUVTL/2l391lP3CSde8VXqCpnUketo+At91daksdMMdXWQ/
 eUPRKsR3KGeJnBTmJnGafNWTA3q+rUYsBzVBi+RUW1bjWDFcHMTSayRGXgs4IULwfL
 avJ8BYTywObghm1f2Nj88UK5+B1n6TWgBfwqqIcI7I30OPVvKcrmqTRHb0EtYLDutW
 0bvjKpTHBdeOA==
Date: Wed, 27 Aug 2025 13:40:53 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Daniel Stone <daniel@fooishbar.org>
Cc: Shengyu Qu <wiagn233@outlook.com>, 
 Marius Vlad <marius.vlad@collabora.com>, alexander.deucher@amd.com,
 christian.koenig@amd.com, 
 airlied@gmail.com, simona@ffwll.ch, harry.wentland@amd.com, sunpeng.li@amd.com,
 siqueira@igalia.com, maarten.lankhorst@linux.intel.com, tzimmermann@suse.de, 
 contact@rafaelrc.com, lijo.lazar@amd.com, jesse.zhang@amd.com,
 tim.huang@amd.com, 
 dark_sylinc@yahoo.com.ar, mario.limonciello@amd.com, alex.hung@amd.com, 
 aurabindo.pillai@amd.com, sunil.khatri@amd.com, chiahsuan.chung@amd.com,
 mwen@igalia.com, 
 Roman.Li@amd.com, Wayne.Lin@amd.com, dominik.kaszewski@amd.com,
 alvin.lee2@amd.com, 
 Aric.Cyr@amd.com, Austin.Zheng@amd.com, Sung.Lee@amd.com, PeiChen.Huang@amd.com,
 dillon.varone@amd.com, Richard.Chiang@amd.com, ryanseto@amd.com,
 linux@treblig.org, 
 haoping.liu@amd.com, Relja.Vojvodic@amd.com, Yihan.Zhu@amd.com,
 Samson.Tam@amd.com, 
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, wayland-devel@lists.freedesktop.org
Subject: Re: [PATCH v2 0/2] Add "pixel_encoding" to switch between RGB & YUV
 color modes
Message-ID: <20250827-skilled-jasper-angelfish-853f26@houat>
References: <TY4PR01MB14432B688209B2AA416A95228983EA@TY4PR01MB14432.jpnprd01.prod.outlook.com>
 <aK1hPoCmLziaPPOd@xpredator>
 <TY4PR01MB1443219A9870877AF120FE63B9839A@TY4PR01MB14432.jpnprd01.prod.outlook.com>
 <20250827-imperial-mongrel-of-dignity-712fab@houat>
 <CAPj87rPhK+E2FP62fnNxFySDOkqqKxo_oa94i7DR3_6a1j1o1A@mail.gmail.com>
 <20250827-enchanted-merciful-badger-d51816@houat>
 <CAPj87rMDj-3ohEtXQYy25Rp0zNtZxQxS4Rmd-akgx9kkvB4Ysw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="kncuhvsrr3qnlsnj"
Content-Disposition: inline
In-Reply-To: <CAPj87rMDj-3ohEtXQYy25Rp0zNtZxQxS4Rmd-akgx9kkvB4Ysw@mail.gmail.com>
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


--kncuhvsrr3qnlsnj
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v2 0/2] Add "pixel_encoding" to switch between RGB & YUV
 color modes
MIME-Version: 1.0

On Wed, Aug 27, 2025 at 12:36:53PM +0100, Daniel Stone wrote:
> Hey,
>=20
> On Wed, 27 Aug 2025 at 12:21, Maxime Ripard <mripard@kernel.org> wrote:
> > On Wed, Aug 27, 2025 at 11:39:25AM +0100, Daniel Stone wrote:
> > > There are other reasons to have uAPI though ...
> > >
> > > One is because you really care about the colour properties, and you'd
> > > rather have better fidelity than anything else, even if it means some
> > > modes are unusable.
> > >
> > > Another is for situations which static quirks can't handle. If you
> > > want to keep headroom on the link (either to free up bandwidth for
> > > other uses), or you accidentally bought a super-long cable so have a
> > > flaky link, you might well want to force it to use lower fidelity so
> > > you can negotiate a lower link rate.
> > >
> > > I'm all for just dtrt automatically, but there are definitely reasons
> > > to expose it to userspace regardless.
> >
> > Oh, yeah, definitely.
> >
> > But bringing the big guns and the requirements we have for those to
> > address the point initially discussed by the gitlab issues seems like
> > biting off more than they can chew.
> >
> > Even more so since whatever uapi we come up with would still depend on
> > the EDIDs, and they would still be broken for these monitors.
>=20
> Sounds like we're agreeing with each other then.
>=20
> Shengyu's 'I want these broken panels to work' usecase is probably
> best served with an EDID quirk, yeah.
>=20
> The reason Marius is working on it is the reasons I said above though
> - some for uses where we'd rather clearly fail out and push an error
> to userspace than continue with visually-degraded output, and some for
> uses where people have bought a too-long cable (or bought a too-short
> one which is now at tension through a 180=B0 bend) so we want to force
> the lowest link rate possible, without dropping to a ridiculously low
> resolution.
>=20
> So I don't think these are in tension, and Marius should proceed with
> his work (complete with the proper userspace to back it up), and
> Shengyu should proceed with new in-kernel quirks, which will be
> effective when the properties are set to auto, but hard overridden by
> userspace if it decides otherwise.
>=20
> How does that sound?

Like a great plan :)

Maxime

--kncuhvsrr3qnlsnj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCaK7uxQAKCRAnX84Zoj2+
doZGAYDeBn4U42pxYflUBmNr4nmthfZRNjbO/t9qAtySVnQYrc+Y88V/FrBzvE24
Kzq7rV8BgNYxo8ee0B72lotJLyC5ir/zpX0Cpf2Itc46E4GudmvDK2a2nnUA2VOx
STT9RUM2Xw==
=r7ye
-----END PGP SIGNATURE-----

--kncuhvsrr3qnlsnj--
