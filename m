Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 039F5B380BB
	for <lists+dri-devel@lfdr.de>; Wed, 27 Aug 2025 13:21:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 80B9510E0E0;
	Wed, 27 Aug 2025 11:21:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="cJC70Usa";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B147F10E0E0;
 Wed, 27 Aug 2025 11:21:22 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id D4F5160267;
 Wed, 27 Aug 2025 11:21:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0964DC4CEEB;
 Wed, 27 Aug 2025 11:21:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1756293681;
 bh=dI7cWzfS/291OsvZ5V1she40+eGFmZ3jW+/Cg11WRzo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=cJC70Usa0leF1QY3kRLZEQxKcF196KNMy75izW4aF056588POf7hw8ooRR/BYccUU
 hU9/eXR/CV6+o9Z+vo5GnQZGlzUNvdatk4wTBdV6pDkwstzlB58X8zixd3rnd3uTJb
 7/DEwiq1/ZAueEQmIxSn/h6XGxOwhtanTNeto5o5/ZZ4nMR08APakzzUMgj0eQGEQ4
 OeJZkILfGtaz9mjvduDRlbaBL1NbRQ+NQLM/reY4aULl+yZO8Z99mbyNHZXjruf8wu
 21/tEqa7FP32zo66HWj9TO+BHinfCNKDEWOX2BuyUirMHlYwfGHZIXg1vEWDmy6F95
 WMOemtxOFxohQ==
Date: Wed, 27 Aug 2025 13:21:19 +0200
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
Message-ID: <20250827-enchanted-merciful-badger-d51816@houat>
References: <TY4PR01MB14432B688209B2AA416A95228983EA@TY4PR01MB14432.jpnprd01.prod.outlook.com>
 <aK1hPoCmLziaPPOd@xpredator>
 <TY4PR01MB1443219A9870877AF120FE63B9839A@TY4PR01MB14432.jpnprd01.prod.outlook.com>
 <20250827-imperial-mongrel-of-dignity-712fab@houat>
 <CAPj87rPhK+E2FP62fnNxFySDOkqqKxo_oa94i7DR3_6a1j1o1A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="refg77jsxnoyylwx"
Content-Disposition: inline
In-Reply-To: <CAPj87rPhK+E2FP62fnNxFySDOkqqKxo_oa94i7DR3_6a1j1o1A@mail.gmail.com>
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


--refg77jsxnoyylwx
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v2 0/2] Add "pixel_encoding" to switch between RGB & YUV
 color modes
MIME-Version: 1.0

On Wed, Aug 27, 2025 at 11:39:25AM +0100, Daniel Stone wrote:
> Hey,
>=20
> On Wed, 27 Aug 2025 at 10:41, Maxime Ripard <mripard@kernel.org> wrote:
> > On Wed, Aug 27, 2025 at 12:26:56AM +0800, Shengyu Qu wrote:
> > > 1.Can you send patch with only i915/amdgpu first? It's a long-needed =
feature
> > > to deal with some monitors/TVs with broken EDID.
> >
> > If it's to workaround broken monitors, then it's really not something we
> > should be doing using a property.
> >
> > Most likely, those monitors don't support YUV* output and will just need
> > to be forced to RGB, so it's not something that the user (or the
> > compositor, really) has to care about.
> >
> > And it would be broken with every driver, not just i915 and amdgpu.
> >
> > We already have some quirks infrastructure in place, the only thing we
> > need to do is create an EDID_QUIRK_NO_$FORMAT, clear
> > drm_display_info->color_formats based on it, and you're done. No uapi to
> > agree upon, support, test, and it works with every driver.
>=20
> There are other reasons to have uAPI though ...
>=20
> One is because you really care about the colour properties, and you'd
> rather have better fidelity than anything else, even if it means some
> modes are unusable.
>=20
> Another is for situations which static quirks can't handle. If you
> want to keep headroom on the link (either to free up bandwidth for
> other uses), or you accidentally bought a super-long cable so have a
> flaky link, you might well want to force it to use lower fidelity so
> you can negotiate a lower link rate.
>=20
> I'm all for just dtrt automatically, but there are definitely reasons
> to expose it to userspace regardless.

Oh, yeah, definitely.

But bringing the big guns and the requirements we have for those to
address the point initially discussed by the gitlab issues seems like
biting off more than they can chew.

Even more so since whatever uapi we come up with would still depend on
the EDIDs, and they would still be broken for these monitors.

Maxime

--refg77jsxnoyylwx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCaK7qKwAKCRAnX84Zoj2+
dh1AAX4wnbnflKisabavSbNpeVGKoV3UrpsXVW9imDQtcjm7YudXmfvfYqpuzSkp
94Pjwm0BfjRoTmFEeZpDWZ9/v0k4QqGl4uv3hYL5xuMnYs8wyX2fRrswvdyR3/nS
ZfHMj/I12w==
=HUUG
-----END PGP SIGNATURE-----

--refg77jsxnoyylwx--
