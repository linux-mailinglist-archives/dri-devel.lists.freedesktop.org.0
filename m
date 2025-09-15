Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C176DB57AC0
	for <lists+dri-devel@lfdr.de>; Mon, 15 Sep 2025 14:24:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2BC0210E46E;
	Mon, 15 Sep 2025 12:24:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="qHMUwKE7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 33E5B10E46E
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Sep 2025 12:24:34 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 509E9601A3;
 Mon, 15 Sep 2025 12:24:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9A451C4CEF1;
 Mon, 15 Sep 2025 12:24:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1757939073;
 bh=Hp7M7Gahl7N2gfBFtmRijCr3OCP69I4VPawEaLwNfX4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=qHMUwKE7iLHX29f86VKCXT6/qUG/MRnVQK2KFDMkiKu5SsaoHq4F8GwKoYQrn3IYw
 lU+9CwPy3e3hjkygH2OBGoiv2uPB6N4SuConD69KHyWjqjbCbsr9Pa/TZ9vfwwjxuF
 oHB9I6GF9PZ2hGIB09PqZBkqM5w51r48yqHDa+gh8ewoBTjGF9Eee1e02rBfVeCE8S
 m/TVwhFNJOOQNrkEy9O1bSSzd1h02m3TtHXAHA6WroYSpNcysk3ih72Kle3rPpLt+r
 axssUkjnbwirs8HRJVEmpHutk5/rQdegZkL1S37F0F2Jh3XlMoUagpgtOWiykiaVd5
 RLzwevsE9QyLw==
Date: Mon, 15 Sep 2025 14:24:30 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: Swamil Jain <s-jain1@ti.com>, jyri.sarha@iki.fi, 
 maarten.lankhorst@linux.intel.com, tzimmermann@suse.de, airlied@gmail.com,
 simona@ffwll.ch, 
 aradhya.bhatia@linux.dev, h-shenoy@ti.com, devarsht@ti.com, vigneshr@ti.com, 
 praneeth@ti.com, u-kumar1@ti.com, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 3/3] drm/tidss: oldi: Add atomic_check hook for oldi
 bridge
Message-ID: <20250915-affable-melodic-antelope-db56c2@penduick>
References: <20250911110715.2873596-1-s-jain1@ti.com>
 <20250911110715.2873596-4-s-jain1@ti.com>
 <20250915-benevolent-military-penguin-d64871@penduick>
 <4f0a00d9-4edc-4114-aca6-70d6bb654767@ti.com>
 <b6be187a-6005-4de7-8844-66fb957e394e@ideasonboard.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="nlrxldzbqnlduxay"
Content-Disposition: inline
In-Reply-To: <b6be187a-6005-4de7-8844-66fb957e394e@ideasonboard.com>
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


--nlrxldzbqnlduxay
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v6 3/3] drm/tidss: oldi: Add atomic_check hook for oldi
 bridge
MIME-Version: 1.0

On Mon, Sep 15, 2025 at 01:17:52PM +0300, Tomi Valkeinen wrote:
> Hi,
>=20
> On 15/09/2025 11:55, Swamil Jain wrote:
> > Hi,
> >=20
> > On 9/15/25 13:27, Maxime Ripard wrote:
> >> On Thu, Sep 11, 2025 at 04:37:15PM +0530, Swamil Jain wrote:
> >>> From: Jayesh Choudhary <j-choudhary@ti.com>
> >>>
> >>> Since OLDI consumes DSS VP clock directly as serial clock, mode_valid=
()
> >>> check cannot be performed in tidss driver which should be checked
> >>> in OLDI driver.
> >>>
> >>> Fixes: 7246e0929945 ("drm/tidss: Add OLDI bridge support")
> >>> Tested-by: Michael Walle <mwalle@kernel.org>
> >>> Reviewed-by: Devarsh Thakkar <devarsht@ti.com>
> >>> Signed-off-by: Jayesh Choudhary <j-choudhary@ti.com>
> >>> Signed-off-by: Swamil Jain <s-jain1@ti.com>
> >>> ---
> >>> =A0 drivers/gpu/drm/tidss/tidss_oldi.c | 21 +++++++++++++++++++++
> >>> =A0 1 file changed, 21 insertions(+)
> >>>
> >>> diff --git a/drivers/gpu/drm/tidss/tidss_oldi.c b/drivers/gpu/drm/
> >>> tidss/tidss_oldi.c
> >>> index 7ecbb2c3d0a2..ada691839ef3 100644
> >>> --- a/drivers/gpu/drm/tidss/tidss_oldi.c
> >>> +++ b/drivers/gpu/drm/tidss/tidss_oldi.c
> >>> @@ -309,6 +309,26 @@ static u32
> >>> *tidss_oldi_atomic_get_input_bus_fmts(struct drm_bridge *bridge,
> >>> =A0=A0=A0=A0=A0 return input_fmts;
> >>> =A0 }
> >>> =A0 +static int tidss_oldi_atomic_check(struct drm_bridge *bridge,
> >>> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 struct drm_br=
idge_state *bridge_state,
> >>> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 struct drm_cr=
tc_state *crtc_state,
> >>> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 struct drm_co=
nnector_state *conn_state)
> >>> +{
> >>> +=A0=A0=A0 struct tidss_oldi *oldi =3D drm_bridge_to_tidss_oldi(bridg=
e);
> >>> +=A0=A0=A0 struct drm_display_mode *adjusted_mode;
> >>> +=A0=A0=A0 unsigned long round_clock;
> >>> +
> >>> +=A0=A0=A0 adjusted_mode =3D &crtc_state->adjusted_mode;
> >>> +=A0=A0=A0 round_clock =3D clk_round_rate(oldi->serial, adjusted_mode=
->clock
> >>> * 7 * 1000);
> >>> +=A0=A0=A0 /*
> >>> +=A0=A0=A0=A0 * To keep the check consistent with dispc_vp_set_clk_ra=
te(),
> >>> +=A0=A0=A0=A0 * we use the same 5% check here.
> >>> +=A0=A0=A0=A0 */
> >>> +=A0=A0=A0 if (dispc_pclk_diff(adjusted_mode->clock * 7 * 1000,
> >>> round_clock) > 5)
> >>> +=A0=A0=A0=A0=A0=A0=A0 return -EINVAL;
> >>> +=A0=A0=A0 return 0;
> >>> +}
> >>> +
> >>
> >> If you're introducing that check to tidss, please use .5% like everyone
> >> else. I understand that you don't want to change tilcdc to avoid any
> >> regression, but that's not the case here
> >>
> > This is just to make the tolerance check consistent for mode validation
> > and setting clock rate. This patch isn't introducing anything new, we
> > are following this as dispc_vp_set_clk_rate() and
> > tidss_oldi_set_serial_clk() are already checking for 5% tolerance while
> > setting clock. To remove/modify, this needs extensive testing with other
> > K3 and K2G SoCs and can be handled as a separate patch.
>=20
> I'd like to switch to 0.5%, but as Swamil said, I think it's better to
> do it on top.

Yeah, sorry, I thought it was a new thing.

Maxime

--nlrxldzbqnlduxay
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCaMgFfQAKCRAnX84Zoj2+
dnOZAX9PP4kpetQM/5eQ7S0xH8JjfC8wUFiRYmip082/cUTKZbftS6bCtf2F2y/X
PuTLirEBgLGzx9QXn77mzL33loungermgkmYSvtaErPSqdG1OkQYCIpL8swV3G2L
zFwEyMkmwA==
=bf2N
-----END PGP SIGNATURE-----

--nlrxldzbqnlduxay--
