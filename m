Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A62DC9A9C27
	for <lists+dri-devel@lfdr.de>; Tue, 22 Oct 2024 10:15:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A56D210E302;
	Tue, 22 Oct 2024 08:15:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Ka8qOXVc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E5A6910E617
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Oct 2024 08:15:22 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 75DB75C5CB4;
 Tue, 22 Oct 2024 08:15:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 37DE2C4CEC3;
 Tue, 22 Oct 2024 08:15:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1729584921;
 bh=ED+LZhJhE26ThOoJvug3eIlGNitTZP5Mq2j85RJfjA0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Ka8qOXVcbwuemlUXAnev4yBNY0NkM0WPW5XLI2Xv4xxSRjyH2PXtU1NX3OeQQ1DqR
 ctV44H/93iiU+iazoEDmIAcF5UZlUtyLumdw5/bvqk7vAAeb2umOphDF2hdmITv4ld
 5Iq6FRxkQjSZIt1WfCG9ItMlVz6K7gqcLxGb4rgwoDr2ASCacNwpF3uanbgPb5c8pY
 dmIJzrGspNAFodoW1mSkKN/8r2EBNy0dgzSPREN8z22O5DGrXCZIL8ZzrHbShW5Vpq
 lwbDuU/CqHqZGvzLufVCMgNNZyoGCyFecBoChO1JyWdy2dvwbzlFK+QBWnObrV4fjq
 6YfyORkX7yN9Q==
Date: Tue, 22 Oct 2024 10:15:19 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Liu Ying <victor.liu@nxp.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, andrzej.hajda@intel.com,
 neil.armstrong@linaro.org, 
 rfoss@kernel.org, Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se, 
 jernej.skrabec@gmail.com, airlied@gmail.com, simona@ffwll.ch, 
 maarten.lankhorst@linux.intel.com, tzimmermann@suse.de, robh@kernel.org,
 krzk+dt@kernel.org, 
 conor+dt@kernel.org, quic_jesszhan@quicinc.com, mchehab@kernel.org, 
 shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de, 
 festevam@gmail.com, catalin.marinas@arm.com, will@kernel.org, 
 sakari.ailus@linux.intel.com, hverkuil@xs4all.nl,
 tomi.valkeinen@ideasonboard.com, 
 quic_bjorande@quicinc.com, geert+renesas@glider.be, dmitry.baryshkov@linaro.org,
 arnd@arndb.de, nfraprado@collabora.com, thierry.reding@gmail.com, 
 prabhakar.mahadev-lad.rj@bp.renesas.com, sam@ravnborg.org, marex@denx.de,
 biju.das.jz@bp.renesas.com
Subject: Re: [PATCH v3 12/15] drm/bridge: Add ITE IT6263 LVDS to HDMI converter
Message-ID: <20241022-amazing-fresh-agouti-fb6eda@houat>
References: <20241021064446.263619-1-victor.liu@nxp.com>
 <20241021064446.263619-13-victor.liu@nxp.com>
 <20241021-thick-cockle-of-popularity-c5e28c@houat>
 <889594b9-e6cb-4d90-b959-cd0258b2f166@nxp.com>
 <20241022-wondrous-fractal-lion-aedcd9@houat>
 <7a83230b-292c-4e28-813d-a07ea1b6a66a@nxp.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="u3pcdhq2tn2xfgvk"
Content-Disposition: inline
In-Reply-To: <7a83230b-292c-4e28-813d-a07ea1b6a66a@nxp.com>
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


--u3pcdhq2tn2xfgvk
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v3 12/15] drm/bridge: Add ITE IT6263 LVDS to HDMI
 converter
MIME-Version: 1.0

On Tue, Oct 22, 2024 at 04:10:51PM +0800, Liu Ying wrote:
> Hi Maxime,
>=20
> On 10/22/2024, Maxime Ripard wrote:
> > On Tue, Oct 22, 2024 at 03:36:47PM +0800, Liu Ying wrote:
> >> Hi Maxime,
> >>
> >> On 10/21/2024, Maxime Ripard wrote:
> >>> On Mon, Oct 21, 2024 at 02:44:43PM +0800, Liu Ying wrote:
> >>>> +static int it6263_bridge_atomic_check(struct drm_bridge *bridge,
> >>>> +				      struct drm_bridge_state *bridge_state,
> >>>> +				      struct drm_crtc_state *crtc_state,
> >>>> +				      struct drm_connector_state *conn_state)
> >>>> +{
> >>>> +	struct drm_display_mode *mode =3D &crtc_state->adjusted_mode;
> >>>> +	int ret;
> >>>> +
> >>>> +	ret =3D drm_atomic_helper_connector_hdmi_check(conn_state->connect=
or,
> >>>> +						     conn_state->state);
> >>>> +	if (ret)
> >>>> +		return ret;
> >>>> +
> >>>> +	return mode->clock > MAX_PIXEL_CLOCK_KHZ ? -EINVAL : 0;
> >>>
> >>> drm_atomic_helper_connector_hdmi_check will already make that check, =
so
> >>> it's redundant.
> >>
> >> MAX_PIXEL_CLOCK_KHZ is 150MHz. With 150MHz pixel clock rate, we'll get
> >> 150MHz HDMI character rate for 8bpc and 187.5MHz HDMI character rate
> >> for 10bpc, both are lower than MAX_HDMI_TMDS_CHAR_RATE_HZ =3D 225MHz.
> >=20
> > I guess? I have no idea how that's relevant though. Where are those
> > constraints coming from, and why aren't you checking for them in
> > tmds_char_rate_valid?
>=20
> All constraints come from IT6263 data sheet. They are also mentioned
> in IT6263 product link(commit message contains the link).
>=20
> https://www.ite.com.tw/en/product/cate1/IT6263
>=20
> "
> LVDS RX
> Support input clock rate up to 150 MHz
>=20
> HDMI TX
> Support link speeds of up to 2.25 Gbps (link clock rate of 225 MHz)=20
> "
>=20
> If no objection, I'll check mode clock rate against
> MAX_PIXEL_CLOCK_KHZ in tmds_char_rate_valid.

If you don't support bpc other than 8, and no other format than RGB,
then it's a good enough approximation.

It should be documented though

Maxime

--u3pcdhq2tn2xfgvk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCZxdfFgAKCRAnX84Zoj2+
dkBpAYCTeWy3zA6iD+/mbISTuTA/oxVJr3H30Y/l4YAaYrxfiRnjSilMM+ckG3ph
I3wUIxkBgO6JaDPbvX/C2fiSO1tM2GF/EadgjnJcVNSM3abhxJrUp3a2Z7LivwPC
xgrGePQkkQ==
=x6hs
-----END PGP SIGNATURE-----

--u3pcdhq2tn2xfgvk--
