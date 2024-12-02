Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 83B939DFF48
	for <lists+dri-devel@lfdr.de>; Mon,  2 Dec 2024 11:48:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D4D010E226;
	Mon,  2 Dec 2024 10:48:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="J68k75t5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F1AFD10E16E;
 Mon,  2 Dec 2024 10:48:38 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id DF1EB5C569D;
 Mon,  2 Dec 2024 10:47:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0CA7CC4CED1;
 Mon,  2 Dec 2024 10:48:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1733136517;
 bh=89vNuhLsrmdTY2Ip4W/JjkXrXXeOpOVt8Rb/LnmjjcM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=J68k75t5+80a42+Rzplg0Eg5PPZyRX+AuSFCOIQqr6e17yM/Tleo8+RyxqO2acLuk
 d/wTby0EgJD2AOTUTYVlPYFLLW5v3XWwcF8RxA6pMu5ifwMtFGZGH2Db79QQ9aJA2d
 2YnueY5LOzh1aQf2BQbX2Llr6QZMPJfFGHy2v1TC0ENliukF894D2LcjJDVzUSc9qi
 Ny7T3Ab2mBgrG95ZLUNlDBhkPBmhCvWZ17stKtROvnZpfXlVSFpVD02gHZmbJ/jwQa
 1ewVVPfQSJ2yirBHTv7DDhhMPda/v0hKXHR/GLL03VdJSPt0bo2g3Fa+XlmUbhfxNE
 LDy1lWDMWy5HA==
Date: Mon, 2 Dec 2024 11:48:34 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Imre Deak <imre.deak@intel.com>
Cc: intel-gfx@lists.freedesktop.org, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, 
 Dave Airlie <airlied@redhat.com>, Daniel Vetter <daniel.vetter@ffwll.ch>, 
 dri-devel@lists.freedesktop.org, Jani Nikula <jani.nikula@intel.com>, 
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: Re: [PATCH v2 1/4] drm/dp: Add a way to init/add a connector in
 separate steps
Message-ID: <20241202-real-benevolent-skunk-a9f5e0@houat>
References: <20241126161859.1858058-1-imre.deak@intel.com>
 <20241126161859.1858058-2-imre.deak@intel.com>
 <Z0nO-bwpbWPVryd6@ideak-desk.fi.intel.com>
 <20241129-wild-cobra-of-thunder-829d1f@houat>
 <Z0nn0VzawSCdOCKY@ideak-desk.fi.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="s7whx7f4sgh23yvn"
Content-Disposition: inline
In-Reply-To: <Z0nn0VzawSCdOCKY@ideak-desk.fi.intel.com>
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


--s7whx7f4sgh23yvn
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v2 1/4] drm/dp: Add a way to init/add a connector in
 separate steps
MIME-Version: 1.0

On Fri, Nov 29, 2024 at 06:12:01PM +0200, Imre Deak wrote:
> On Fri, Nov 29, 2024 at 03:46:28PM +0100, Maxime Ripard wrote:
> > On Fri, Nov 29, 2024 at 04:26:01PM +0200, Imre Deak wrote:
> > > Adding more people from DRM core domain. Any comment, objection to th=
is
> > > change?
> > >=20
> > > On Tue, Nov 26, 2024 at 06:18:56PM +0200, Imre Deak wrote:
> > > > Atm when the connector is added to the drm_mode_config::connector_l=
ist,
> > > > the connector may not be fully initialized yet. This is not a probl=
em
> > > > for user space, which will see the connector only after it's regist=
ered
> > > > later, it could be a problem for in-kernel users looking up connect=
ors
> > > > via the above list.
> >=20
> > It could be, or it actually is a problem? If so, in what situation?
>=20
> An actual problem is that after an MST connector is created and added to
> the connector list, the connector could be probed without the connector
> being fully initialized during a hotplug event handling along with all
> the other connectors on the list. The connector's helper functions could
> be still unset leading to a NULL deref while trying to call the
> connector's detect/detect_ctx callbacks, or if these callbacks are set
> already, the detect handler could see a connector which is not yet
> initialized fully.

Ack. Like I said to Jani, this needs to be in the commit log then.

> > > > To resolve the above issue, add a way to separately initialize the =
DRM
> > > > core specific parts of the connector and add it to the above list. =
This
> > > > will move adding the connector to the list after the properties on =
the
> > > > connector have been added, this is ok since these steps don't have a
> > > > dependency.
> > > >
> > > > v2: (Jani)
> > > > - Let initing DDC as well via drm_connector_init_core().
> > > > - Rename __drm_connector_init to drm_connector_init_core_and_add().
> > > >=20
> > > > Cc: Jani Nikula <jani.nikula@intel.com>
> > > > Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com> (v1)
> > > > Signed-off-by: Imre Deak <imre.deak@intel.com>
> >=20
> > If we do have an actual problem to solve, we'll need kunit tests too.
>=20
> I don't have a good idea for this. The problem is not in a parituclar
> function, rather in the order a connector is initialized and added to
> the connector list. The above is an actual problem though, so I don't
> think fixing that should be blocked by this.

It's not about whether we have a problem or not: you introduce new
framework functions, you need to have kunit tests to check their
behaviour.

Maxime

--s7whx7f4sgh23yvn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCZ02QggAKCRAnX84Zoj2+
dtTTAX4pXX18ZHkszooeoE6K3VyNoN/a8f3f35KH5P+Xn8Sx3qWaiBAd9DutE0kY
MfdYv0MBf1ajOaxcAaNa8Cxq2OgGWL+JYBBMckdDzO24Jei1QAOPfZCUbeUvLQZk
ELMK8wd4Hg==
=RWZk
-----END PGP SIGNATURE-----

--s7whx7f4sgh23yvn--
