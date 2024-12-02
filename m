Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EF6B79DFF3C
	for <lists+dri-devel@lfdr.de>; Mon,  2 Dec 2024 11:46:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 25B7610E6C1;
	Mon,  2 Dec 2024 10:46:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="sTNmHvVp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E72D10E1E2;
 Mon,  2 Dec 2024 10:46:00 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 61DE4A407FA;
 Mon,  2 Dec 2024 10:44:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 25CDFC4CED1;
 Mon,  2 Dec 2024 10:45:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1733136359;
 bh=xrN96fdErV4s1gRDe7t3sR05ZKmX50ty6+x42qmSEtI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=sTNmHvVpi4ZAMBtPeVBgKY4d+jhOjiSgrc3riUSEDTlBZLCzY70YEacSSGa2XonPo
 kIX5RpcmfkSjsnytKlbZAfVsEforoVahGR3UncI47wa3xkLfZRX7p+vM5ZO8UXZiOL
 xo6u9ueMzvEu7T9EAzdPmTZ+WboGzyTceFdU7Z8cEpqXXrEmhk28jLQj0y/mF2BnsH
 D8IFNI87P5WpmkcPB+ud3LftjXIseQip6sB4qh0fXi0OVtPwYHnGb7HRVhGFbIbxux
 IpHPmfEtbn7clQsJGjxH6TcCMEiDu1InnUdIhoS+qdakudJqUlpESLbyfudXijZRTg
 OxZOI74oZgjdA==
Date: Mon, 2 Dec 2024 11:45:56 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Jani Nikula <jani.nikula@intel.com>
Cc: Imre Deak <imre.deak@intel.com>, intel-gfx@lists.freedesktop.org, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, 
 Dave Airlie <airlied@redhat.com>, Daniel Vetter <daniel.vetter@ffwll.ch>, 
 dri-devel@lists.freedesktop.org, Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: Re: [PATCH v2 1/4] drm/dp: Add a way to init/add a connector in
 separate steps
Message-ID: <20241202-wandering-fantastic-ibex-cbd7c5@houat>
References: <20241126161859.1858058-1-imre.deak@intel.com>
 <20241126161859.1858058-2-imre.deak@intel.com>
 <Z0nO-bwpbWPVryd6@ideak-desk.fi.intel.com>
 <20241129-wild-cobra-of-thunder-829d1f@houat>
 <874j3q6ngf.fsf@intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="niwwnbkkzwtltxk4"
Content-Disposition: inline
In-Reply-To: <874j3q6ngf.fsf@intel.com>
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


--niwwnbkkzwtltxk4
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v2 1/4] drm/dp: Add a way to init/add a connector in
 separate steps
MIME-Version: 1.0

On Fri, Nov 29, 2024 at 05:58:56PM +0200, Jani Nikula wrote:
> On Fri, 29 Nov 2024, Maxime Ripard <mripard@kernel.org> wrote:
> > On Fri, Nov 29, 2024 at 04:26:01PM +0200, Imre Deak wrote:
> >> Adding more people from DRM core domain. Any comment, objection to this
> >> change?
> >>=20
> >> On Tue, Nov 26, 2024 at 06:18:56PM +0200, Imre Deak wrote:
> >> > Atm when the connector is added to the drm_mode_config::connector_li=
st,
> >> > the connector may not be fully initialized yet. This is not a problem
> >> > for user space, which will see the connector only after it's registe=
red
> >> > later, it could be a problem for in-kernel users looking up connecto=
rs
> >> > via the above list.
> >
> > It could be, or it actually is a problem? If so, in what situation?
>=20
> It's an actual problem.
>=20
> While in most cases connectors are created at probe, for DP MST they're
> created at runtime via the ->add_connector hook. We want to call
> drm_connector_init() on them soon in that hook, so we can pass the
> connector around and expect it to have connector->dev etc. initialized
> while we continue its initialization.
>=20
> But there's a race. As soon as we call drm_connector_init(), the
> connector gets added to dev->mode_config.connector_list, and any drm
> code may discover it. For example connector polling. And we might not be
> done with the initialization yet.

Ack. This should be in the commit log then.

> >> > To resolve the above issue, add a way to separately initialize the D=
RM
> >> > core specific parts of the connector and add it to the above list. T=
his
> >> > will move adding the connector to the list after the properties on t=
he
> >> > connector have been added, this is ok since these steps don't have a
> >> > dependency.
> >> >
> >> > v2: (Jani)
> >> > - Let initing DDC as well via drm_connector_init_core().
> >> > - Rename __drm_connector_init to drm_connector_init_core_and_add().
> >> >=20
> >> > Cc: Jani Nikula <jani.nikula@intel.com>
> >> > Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com> (v1)
> >> > Signed-off-by: Imre Deak <imre.deak@intel.com>
> >
> > If we do have an actual problem to solve, we'll need kunit tests too.
>=20
> That's not an unreasonable request, per se, but what exactly should they
> test? That the new init core didn't add stuff to the list, and the new
> add connector did?

Everything we test with drm_connector_init* already, plus the fact that
we now might have callers that call add without init, so we need to test
that too.

Maxime

--niwwnbkkzwtltxk4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCZ02P5AAKCRAnX84Zoj2+
docaAYC2jfEBGeSi+nobcFnIoA415/G6OWNYO7ISAIpiKsLeO9A7ySR7KKByEg/0
IbzobkUBgNrizwfT58uXkpgBTZT2aRsYuWJ1OqRc/OgTfNwxogHqJx1TvqSwiKzb
fEXbJnMBXQ==
=+iCW
-----END PGP SIGNATURE-----

--niwwnbkkzwtltxk4--
