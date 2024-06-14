Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 368CE90865D
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jun 2024 10:34:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E0B2010EC9A;
	Fri, 14 Jun 2024 08:34:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="nCTYyYFS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 663AD10E1F1
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jun 2024 08:34:53 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 9875ECE2A09;
 Fri, 14 Jun 2024 08:34:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6BB5DC2BD10;
 Fri, 14 Jun 2024 08:34:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1718354089;
 bh=5+vsvTPoSsGnlov0diQOja8u3p3y/iXbs53szWp5oUQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=nCTYyYFS6yudck+kRFg9JLllXg9Pw1hNipl0nYMA+E1/STCeSBtvsReI+J41omqOG
 XijQYcagfKs9qlTPL2BTu8PE4JBXgtbtlr5W8/jdr46SXYBxOYsEyx4QXJaSMQdfhq
 U+ubX+4OeKdWmtA393fu0Lpc7uQLrA6FTUKGquamb6UmDojuzD9n7jt79cqN9rNi02
 Cqko1X+JAIfDAy1R4BjMnrv0/CviudJWSIn8zisVkplkrRPmNdUWkFyhGhoTfVvWGn
 n23248IrPf8K1VV7eqoChlhyNfANPWRhg7/5rbLFNjEwYnNTr6dpxrDwk/nIKyygd0
 zVj0ie09LC5Ug==
Date: Fri, 14 Jun 2024 10:34:47 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Andy Yan <andyshrk@163.com>
Cc: neil.armstrong@linaro.org, 
 Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
 Sam Ravnborg <sam@ravnborg.org>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, Sandy Huang <hjc@rock-chips.com>, 
 Heiko =?utf-8?Q?St=C3=BCbner?= <heiko@sntech.de>,
 Andy Yan <andy.yan@rock-chips.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Mark Yao <markyao0591@gmail.com>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 devicetree@vger.kernel.org, 
 kernel@collabora.com, Alexandre ARNOUD <aarnoud@me.com>, 
 Luis de Arquer <ldearquer@gmail.com>, Algea Cao <algea.cao@rock-chips.com>
Subject: Re: [PATCH 13/14] drm/bridge: synopsys: Add DW HDMI QP TX controller
 driver
Message-ID: <20240614-neat-polecat-of-agreement-68e2df@houat>
References: <20240601-b4-rk3588-bridge-upstream-v1-0-f6203753232b@collabora.com>
 <20240601-b4-rk3588-bridge-upstream-v1-13-f6203753232b@collabora.com>
 <20240601143226.GA2003970@ravnborg.org>
 <59519381-2729-4839-9882-65a981a0c551@collabora.com>
 <20240604204110.GA84949@ravnborg.org>
 <f656c72e-fac8-4345-9b65-1031ebe81c25@collabora.com>
 <304b4602-8722-4ed0-a555-8dada573ee79@collabora.com>
 <5dc16b34-d638-4fab-84e1-cb7db08ad80e@linaro.org>
 <2d8e9235.68f3.19015881d35.Coremail.andyshrk@163.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="k3c77qnfy4wcw7us"
Content-Disposition: inline
In-Reply-To: <2d8e9235.68f3.19015881d35.Coremail.andyshrk@163.com>
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


--k3c77qnfy4wcw7us
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Fri, Jun 14, 2024 at 02:56:00PM GMT, Andy Yan wrote:
> At 2024-06-05 19:48:09, "Neil Armstrong" <neil.armstrong@linaro.org> wrot=
e:
> >On 05/06/2024 12:11, Cristian Ciocaltea wrote:
> >> On 6/5/24 12:34 AM, Cristian Ciocaltea wrote:
> >>> On 6/4/24 11:41 PM, Sam Ravnborg wrote:
> >>>> Hi Cristian.
> >>>>
> >>>> On Tue, Jun 04, 2024 at 10:32:04PM +0300, Cristian Ciocaltea wrote:
> >>>>> Hi Sam,
> >>>>>
> >>>>> On 6/1/24 5:32 PM, Sam Ravnborg wrote:
> >>>>>> Hi Cristian,
> >>>>>>
> >>>>>> a few drive-by comments below.
> >>>>>>
> >>>>>> 	Sam
> >>>>>>
> >>>>>>
> >>>>>>> +
> >>>>>>> +static const struct drm_connector_funcs dw_hdmi_qp_connector_fun=
cs =3D {
> >>>>>>> +	.fill_modes =3D drm_helper_probe_single_connector_modes,
> >>>>>>> +	.detect =3D dw_hdmi_connector_detect,
> >>>>>>> +	.destroy =3D drm_connector_cleanup,
> >>>>>>> +	.force =3D dw_hdmi_qp_connector_force,
> >>>>>>> +	.reset =3D drm_atomic_helper_connector_reset,
> >>>>>>> +	.atomic_duplicate_state =3D drm_atomic_helper_connector_duplica=
te_state,
> >>>>>>> +	.atomic_destroy_state =3D drm_atomic_helper_connector_destroy_s=
tate,
> >>>>>>> +};
> >>>>>>> +
> >>>>>>> +static int dw_hdmi_qp_bridge_attach(struct drm_bridge *bridge,
> >>>>>>> +				    enum drm_bridge_attach_flags flags)
> >>>>>>> +{
> >>>>>>> +	struct dw_hdmi *hdmi =3D bridge->driver_private;
> >>>>>>> +
> >>>>>>> +	if (flags & DRM_BRIDGE_ATTACH_NO_CONNECTOR)
> >>>>>>> +		return drm_bridge_attach(bridge->encoder, hdmi->next_bridge,
> >>>>>>> +					 bridge, flags);
> >>>>>>> +
> >>>>>>> +	return dw_hdmi_connector_create(hdmi, &dw_hdmi_qp_connector_fun=
cs);
> >>>>>>> +}
> >>>>>>
> >>>>>> Are there any users left that requires the display driver to creat=
e the
> >>>>>> connector?
> >>>>>> In other words - could this driver fail if DRM_BRIDGE_ATTACH_NO_CO=
NNECTOR
> >>>>>> is not passed and drop dw_hdmi_connector_create()?
> >>>>>>
> >>>>>> I did not try to verify this - just a naive question.
> >>>>>
> >>>>> I've just tested this and it doesn't work - dw_hdmi_connector_creat=
e()
> >>>>> is still needed.
> >>>>
> >>>> Hmm, seems the display driver or some other bridge driver fails to
> >>>> support "DRM_BRIDGE_ATTACH_NO_CONNECTOR".
> >>>> what other drivers are involved?
> >>>
> >>> Could it be related to the glue driver (updated in the next patch) wh=
ich
> >>> is also responsible for setting up the encoder?
> >>>
> >>>> Note that my comments here should be seen as potential future
> >>>> improvements, and do not block the patch from being used.
> >>>
> >>> Thanks for the heads up! Will try to get back to this soon and invest=
igate.
> >>  =20
> >> IIUC, modern bridges should not create the connector but rely on displ=
ay
> >> drivers to take care of, which in this case is the VOP2 driver. Howeve=
r,
> >> it also handles some of the older SoCs relying on the non-QP variant of
> >> DW HDMI IP. Hence the existing dw-hdmi driver would be also impacted in
> >> order to come up with a proper solution.
> >>=20
> >> A quick check shows there are several users of this IP:
> >>=20
> >> $ git grep -E '=3D dw_hdmi_(bind|probe)\('
> >> drivers/gpu/drm/bridge/imx/imx8mp-hdmi-tx.c:    hdmi->dw_hdmi =3D dw_h=
dmi_probe(pdev, plat_data);
> >> drivers/gpu/drm/bridge/synopsys/dw-hdmi.c:      hdmi =3D dw_hdmi_probe=
(pdev, plat_data);
> >> drivers/gpu/drm/imx/ipuv3/dw_hdmi-imx.c:        hdmi->hdmi =3D dw_hdmi=
_probe(pdev, match->data);
> >> drivers/gpu/drm/ingenic/ingenic-dw-hdmi.c:      hdmi =3D dw_hdmi_probe=
(pdev, &ingenic_dw_hdmi_plat_data);
> >> drivers/gpu/drm/meson/meson_dw_hdmi.c:  meson_dw_hdmi->hdmi =3D dw_hdm=
i_probe(pdev, &meson_dw_hdmi->dw_plat_data);
> >> drivers/gpu/drm/renesas/rcar-du/rcar_dw_hdmi.c: hdmi =3D dw_hdmi_probe=
(pdev, &rcar_dw_hdmi_plat_data);
> >> drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c:            hdmi->hdmi =3D=
 dw_hdmi_bind(pdev, encoder, plat_data);
> >> drivers/gpu/drm/sun4i/sun8i_dw_hdmi.c:  hdmi->hdmi =3D dw_hdmi_bind(pd=
ev, encoder, plat_data);
> >>=20
> >> I didn't check which display drivers would be involved, I'd guess there
> >> are quite a few of them as well. So it seems this ends up being a pret=
ty
> >> complex task.
> >
> >If this would be a brand new driver, then it should only support DRM_BRI=
DGE_ATTACH_NO_CONNECTOR,
> >so you should not create a connector from the driver.
> >
> >The fact dw-hdmi accepts an attach without the flag is for legacy purpose
> >since some DRM drivers haven't switched to DRM_BRIDGE_ATTACH_NO_CONNECTO=
R yes,
> >but it's a requirement for new bridges so at some point you'll need to m=
ake
> >sure the rockchip glue and drm driver supports DRM_BRIDGE_ATTACH_NO_CONN=
ECTOR.
> >
> >This will greatly simplify the driver!
>=20
> Based on the previous discussion=EF=BC=8C the DW HDMI QP drivers will be =
implemented like this=EF=BC=9A
>=20
> Core bridge library=EF=BC=9A=20
>  drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c
> Rockchip platform specific glue=EF=BC=9A
> drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c

Note that the bridge HDMI helpers Dmitry was mentioning have now been
merged, so I'd expect the core bridge library to be fairly minimal. And
the new driver should obviously use it as much as it can.

Maxime

--k3c77qnfy4wcw7us
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZmwApgAKCRDj7w1vZxhR
xT0IAP4/kmfWDAzASkD4k7DBXB/yo/pfsaXLvK+zrDWYsFYe6wD+LtPFo+ws3cz9
4CjYg+ksCPXRokUjsMds5ojnZJpfVwk=
=JElF
-----END PGP SIGNATURE-----

--k3c77qnfy4wcw7us--
