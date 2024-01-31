Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 33C34843D6D
	for <lists+dri-devel@lfdr.de>; Wed, 31 Jan 2024 11:58:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A7FA113B50;
	Wed, 31 Jan 2024 10:57:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 35C61113B50;
 Wed, 31 Jan 2024 10:57:48 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 48B73CE1FC2;
 Wed, 31 Jan 2024 10:57:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 069D9C433F1;
 Wed, 31 Jan 2024 10:57:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1706698635;
 bh=HjxXQQTvclGKG5R5BVCKvlblWKeDppBCdGL0/w/TsH0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Pzkgeu3+p2MwLnWBo/i2Hgnqw/ZmlOWIqzaaR7eedKbxIAzKq5mXhLYKJTCXxLm+Y
 cgep8bB7Bzl7TaHLHcoqkNlKfAV+ZWTOYCotGp54EMnO/qLB+27hBCTMMPP3CYWiWx
 Fs8Ny/9DWl+gSo0c7kbWJ/Ounmmrdn+R8xid6thwW7YJsyskwVfa55AAKEU1x6xn+7
 ClWqPGH90dSSNpqDTYY32RT4CHWaYgiRyb3Q91LtZfmq2SoRsRAGTn/BdRcAAFwgcq
 8vcTU2+Idk+/eD87gBkVtXdM4BsoM0DfN8QN+jdZGuY8xEfWLFR0R4tWw0Ftk/rof/
 RPCaGEcDmLPKw==
Date: Wed, 31 Jan 2024 11:57:12 +0100
From: "mripard@kernel.org" <mripard@kernel.org>
To: Jason-JH Lin =?utf-8?B?KOael+edv+elpSk=?= <Jason-JH.Lin@mediatek.com>
Subject: Re: Re: Re: [PATCH] drm/atomic-helpers: remove legacy_cursor_update
 hacks
Message-ID: <fnhpycf6yf4jmoaaryjjhrjp3mnb442t3zpyqsfuze3x3scy7w@hpgz432aswar>
References: <20230216111214.3489223-1-daniel.vetter@ffwll.ch>
 <20230307145613.xvhru3fpcudlpazt@houat>
 <aac416742920953999a9ce230ac68139bf5b9790.camel@mediatek.com>
 <ZbKlsTEvGPiGtzS3@phenom.ffwll.local>
 <vyh5wg2ltmrtqw2mhtyj2lii6i4eccrjjlynzpfg7x63tkrav6@cxbz3sasvjjm>
 <afa82f2028296dbf586a5e61949179831d69af06.camel@mediatek.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="5hcnxgxxlxzr7qg7"
Content-Disposition: inline
In-Reply-To: <afa82f2028296dbf586a5e61949179831d69af06.camel@mediatek.com>
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
Cc: "fshao@chromium.org" <fshao@chromium.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "daniel.vetter@intel.com" <daniel.vetter@intel.com>,
 Project_Global_Chrome_Upstream_Group
 <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 "dmitry.osipenko@collabora.com" <dmitry.osipenko@collabora.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>,
 "jani.nikula@intel.com" <jani.nikula@intel.com>,
 "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
 "michel@daenzer.net" <michel@daenzer.net>,
 "lucas.demarchi@intel.com" <lucas.demarchi@intel.com>,
 "quic_abhinavk@quicinc.com" <quic_abhinavk@quicinc.com>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 "mikita.lipski@amd.com" <mikita.lipski@amd.com>,
 "sean@poorly.run" <sean@poorly.run>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "angelogioacchino.delregno@collabora.com"
 <angelogioacchino.delregno@collabora.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "manasi.d.navare@intel.com" <manasi.d.navare@intel.com>,
 "tzimmermann@suse.de" <tzimmermann@suse.de>,
 "dmitry.baryshkov@linaro.org" <dmitry.baryshkov@linaro.org>,
 "freedreno@lists.freedesktop.org" <freedreno@lists.freedesktop.org>,
 "nicholas.kazlauskas@amd.com" <nicholas.kazlauskas@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--5hcnxgxxlxzr7qg7
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Wed, Jan 31, 2024 at 05:27:14AM +0000, Jason-JH Lin (=E6=9E=97=E7=9D=BF=
=E7=A5=A5) wrote:
>=20
> On Sun, 2024-01-28 at 10:24 +0100, Maxime Ripard wrote:
> > On Thu, Jan 25, 2024 at 07:17:21PM +0100, Daniel Vetter wrote:
> > > On Tue, Jan 23, 2024 at 06:09:05AM +0000, Jason-JH Lin (=E6=9E=97=E7=
=9D=BF=E7=A5=A5) wrote:
> > > > Hi Maxime, Daniel,
> > > >=20
> > > > We encountered similar issue with mediatek SoCs.
> > > >=20
> > > > We have found that in drm_atomic_helper_commit_rpm(), when
> > > > disabling
> > > > the cursor plane, the old_state->legacy_cursor_update in
> > > > drm_atomic_wait_for_vblank() is set to true.
> > > > As the result, we are not actually waiting for a vlbank to wait
> > > > for our
> > > > hardware to close the cursor plane. Subsequently, the execution
> > > > proceeds to drm_atomic_helper_cleanup_planes() to  free the
> > > > cursor
> > > > buffer. This can lead to use-after-free issues with our hardware.
> > > >=20
> > > > Could you please apply this patch to fix our problem?
> > > > Or are there any considerations for not applying this patch?
> > >=20
> > > Mostly it needs someone to collect a pile of acks/tested-by and
> > > then land
> > > it.
> > >=20
> > > I'd be _very_ happy if someone else can take care of that ...
> > >=20
> > > There's also the potential issue that it might slow down some of
> > > the
> > > legacy X11 use-cases that really needed a non-blocking cursor, but
> > > I think
> > > all the drivers where this matters have switched over to the async
> > > plane
> > > update stuff meanwhile. So hopefully that's good.
> >=20
> > I think there was also a regression with msm no one really figured
> > out?
>=20
> OK...
> But I am only available on MediaTek platform.

I think most of us are in that situation, and which is part of the
reason it kind of stalled :)

> Does it also causes a regression with msn if I re-send a patch for
> drm_atomic_helper.c only?

Yes, that's my recollection at least.

Fortunately, Dmitry might be able to clear that up.

Maxime

--5hcnxgxxlxzr7qg7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZboniAAKCRDj7w1vZxhR
xYCCAP0csImA/YjD7JSlWCeV9u6MhNi6I3Xxd+iiSif3+wOZNAEAxvXjP7nLFw0A
7p53QCY/Y9Y7o9UlXM3Ql3BtsLQwnwU=
=jjPN
-----END PGP SIGNATURE-----

--5hcnxgxxlxzr7qg7--
