Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BA9D783F4CB
	for <lists+dri-devel@lfdr.de>; Sun, 28 Jan 2024 10:25:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B1CD61124C9;
	Sun, 28 Jan 2024 09:24:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 022A51124C7;
 Sun, 28 Jan 2024 09:24:41 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id EC57960EF8;
 Sun, 28 Jan 2024 09:24:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 16448C433C7;
 Sun, 28 Jan 2024 09:24:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1706433846;
 bh=vAmi5VfiuPfMgpUzWVLhzkemLp43TOQ6SblaolpCpeU=;
 h=Date:From:To:Subject:References:In-Reply-To:From;
 b=lMwxc7Qu0oHVJPI91GXXDLoO+fz95+HJ9gMP4NbphuEoMcrSG9m0cDtYmdaL+mc0D
 8ye0Pm1XOyX9C0eEm4+3RXpCD8HukjES5r/RWWVh5RBrFE1QEr34M6pLtJ6mU12Cx/
 WxDJ9Bm8MQ+X83R1CtubiX91LIAJfvlQhQy5CByGrKE+rxGUx9bNv5cjkB8jMxb0x6
 TXVe0Vx2dgish6qtjHNFUfU+5Ts1N8aIDd3OUWbCJaqGkgngaV+Chgypy+iQySjVXr
 wTsOyO73lllXi3Hi1f9ROIg1cIYPW2pREtE4baRZUzOm69tHS8lo9OLj/Q4+7k6XW2
 jONH1sldIYSlQ==
Date: Sun, 28 Jan 2024 10:24:02 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Jason-JH Lin =?utf-8?B?KOael+edv+elpSk=?= <Jason-JH.Lin@mediatek.com>, 
 "manasi.d.navare@intel.com" <manasi.d.navare@intel.com>, 
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
 "michel@daenzer.net" <michel@daenzer.net>, 
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>, 
 "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
 "mikita.lipski@amd.com" <mikita.lipski@amd.com>, 
 "dmitry.baryshkov@linaro.org" <dmitry.baryshkov@linaro.org>,
 "tzimmermann@suse.de" <tzimmermann@suse.de>, 
 "daniel.vetter@intel.com" <daniel.vetter@intel.com>,
 "nicholas.kazlauskas@amd.com" <nicholas.kazlauskas@amd.com>, 
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "quic_abhinavk@quicinc.com" <quic_abhinavk@quicinc.com>, 
 Project_Global_Chrome_Upstream_Group
 <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 "lucas.demarchi@intel.com" <lucas.demarchi@intel.com>, 
 "sean@poorly.run" <sean@poorly.run>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>, 
 "dmitry.osipenko@collabora.com" <dmitry.osipenko@collabora.com>,
 "fshao@chromium.org" <fshao@chromium.org>, 
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "jani.nikula@intel.com" <jani.nikula@intel.com>, 
 "angelogioacchino.delregno@collabora.com"
 <angelogioacchino.delregno@collabora.com>, 
 "freedreno@lists.freedesktop.org" <freedreno@lists.freedesktop.org>
Subject: Re: Re: [PATCH] drm/atomic-helpers: remove legacy_cursor_update hacks
Message-ID: <vyh5wg2ltmrtqw2mhtyj2lii6i4eccrjjlynzpfg7x63tkrav6@cxbz3sasvjjm>
References: <20230216111214.3489223-1-daniel.vetter@ffwll.ch>
 <20230307145613.xvhru3fpcudlpazt@houat>
 <aac416742920953999a9ce230ac68139bf5b9790.camel@mediatek.com>
 <ZbKlsTEvGPiGtzS3@phenom.ffwll.local>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="ogyu5zjbyc4numbu"
Content-Disposition: inline
In-Reply-To: <ZbKlsTEvGPiGtzS3@phenom.ffwll.local>
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


--ogyu5zjbyc4numbu
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 25, 2024 at 07:17:21PM +0100, Daniel Vetter wrote:
> On Tue, Jan 23, 2024 at 06:09:05AM +0000, Jason-JH Lin (=E6=9E=97=E7=9D=
=BF=E7=A5=A5) wrote:
> > Hi Maxime, Daniel,
> >=20
> > We encountered similar issue with mediatek SoCs.
> >=20
> > We have found that in drm_atomic_helper_commit_rpm(), when disabling
> > the cursor plane, the old_state->legacy_cursor_update in
> > drm_atomic_wait_for_vblank() is set to true.
> > As the result, we are not actually waiting for a vlbank to wait for our
> > hardware to close the cursor plane. Subsequently, the execution
> > proceeds to drm_atomic_helper_cleanup_planes() to  free the cursor
> > buffer. This can lead to use-after-free issues with our hardware.
> >=20
> > Could you please apply this patch to fix our problem?
> > Or are there any considerations for not applying this patch?
>=20
> Mostly it needs someone to collect a pile of acks/tested-by and then land
> it.
>=20
> I'd be _very_ happy if someone else can take care of that ...
>=20
> There's also the potential issue that it might slow down some of the
> legacy X11 use-cases that really needed a non-blocking cursor, but I think
> all the drivers where this matters have switched over to the async plane
> update stuff meanwhile. So hopefully that's good.

I think there was also a regression with msm no one really figured out?

Maxime

--ogyu5zjbyc4numbu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZbYdMgAKCRDj7w1vZxhR
xSJlAP95bsUAyxzHt1gZmvkN8tKWAggATAYm9apK9+8NFj/3MAEAnkts/Yh2y6zr
dzc9/lsQ2HaDBNTsjGfOxrlJGX+aKwE=
=2xdS
-----END PGP SIGNATURE-----

--ogyu5zjbyc4numbu--
