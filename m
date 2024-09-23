Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 413EF97E76A
	for <lists+dri-devel@lfdr.de>; Mon, 23 Sep 2024 10:19:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BBF7C10E3A6;
	Mon, 23 Sep 2024 08:19:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="LeYVMNc/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E2E7910E3A7
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Sep 2024 08:19:50 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 4B5325C5816;
 Mon, 23 Sep 2024 08:19:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3CEB1C4CEC4;
 Mon, 23 Sep 2024 08:19:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1727079589;
 bh=gQ1xXXNFSQ0hMp/hqA4GAQ7kD/mpS6i/zp2Gmw3vPRw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=LeYVMNc/c1PpcDq/PGTNH8EeH683lhQ22/Ye7Wa4pPsxVuDDsLY7Q9JyzQS1As9ys
 1FxD65e/lBiV5VktoD0dv2pZ7FLgoeIFKJEwS9agXwshH7aqAKWq63ZP+UjytmPKLu
 yAIQUsTNGCMG1aQpwo4+9E1W77uhKT3AXbPHR4683BNeokwEgHhRfR2eHDuZoIv+nH
 WB483aJV+y58kgAC0/JTULv4RpA1WkJEg+q+q2T6+pLYIygf3JBmgW7xmVAplusijv
 wrTGbbhIB55EzaYYVnuIWO5abH1Uweoc6XHXEdDjVa2BsDSfs8pb/9aWkxwrnz6+mn
 A7DeNA4vO15LA==
Date: Mon, 23 Sep 2024 10:19:46 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
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
 Sascha Hauer <s.hauer@pengutronix.de>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 devicetree@vger.kernel.org, 
 kernel@collabora.com, Alexandre ARNOUD <aarnoud@me.com>, 
 Luis de Arquer <ldearquer@gmail.com>, Algea Cao <algea.cao@rock-chips.com>
Subject: Re: [PATCH v6 1/3] drm/bridge: synopsys: Add DW HDMI QP TX
 Controller support library
Message-ID: <20240923-spirited-wealthy-pelican-4e15dc@penduick>
References: <20240906-b4-rk3588-bridge-upstream-v6-0-a3128fb103eb@collabora.com>
 <20240906-b4-rk3588-bridge-upstream-v6-1-a3128fb103eb@collabora.com>
 <20240909-horned-congenial-curassow-ebc5fa@houat>
 <f8b17995-ce53-45ab-8e68-c7087dbc9786@collabora.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="bjmxjjuhmv2zdjhq"
Content-Disposition: inline
In-Reply-To: <f8b17995-ce53-45ab-8e68-c7087dbc9786@collabora.com>
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


--bjmxjjuhmv2zdjhq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Sep 14, 2024 at 10:12:29PM GMT, Cristian Ciocaltea wrote:
> Hi Maxime,
>=20
> On 9/9/24 6:13 PM, Maxime Ripard wrote:
> > Hi,
> >=20
> > On Fri, Sep 06, 2024 at 04:17:40AM GMT, Cristian Ciocaltea wrote:
> >> +static enum drm_connector_status
> >> +dw_hdmi_qp_bridge_detect(struct drm_bridge *bridge)
> >> +{
> >> +	struct dw_hdmi_qp *hdmi =3D bridge->driver_private;
> >> +	enum drm_connector_status status;
> >> +
> >> +	status =3D hdmi->phy.ops->read_hpd(hdmi, hdmi->phy.data);
> >> +
> >> +	dev_dbg(hdmi->dev, "%s conn=3D%d scramb=3D%d\n", __func__,
> >> +		status =3D=3D connector_status_connected, hdmi->scramb_enabled);
> >> +
> >> +	if (hdmi->scramb_enabled) {
> >> +		cancel_delayed_work_sync(&hdmi->scramb_work);
> >> +
> >> +		if (status =3D=3D connector_status_connected)
> >> +			dw_hdmi_qp_check_and_set_scramb(hdmi);
> >> +	}
> >> +
> >> +	return status;
> >> +}
> >=20
> > Unfortunately, that won't work. The HDMI Spec has (HDMI 2.0, Section
> > 6.1.3.1 - Scrambling Control):
> >=20
> > The minimum time period between the write to the Scrambling_Enable bit,
> > and the transmission of a scrambled video signal is not specified;
> > however the Source shall not begin transmission of a scrambled video
> > signal before writing a 1 to the Scrambling_Enable bit. The maximum time
> > period between the write to the Scrambling_Enable bit and the
> > transmission of a scrambled video signal shall be 100 ms.
> >=20
> > So you need to disable the output and enable it again.
> >=20
> > vc4 does just that, you can have a look here:
> > https://elixir.bootlin.com/linux/v6.10.9/source/drivers/gpu/drm/vc4/vc4=
_hdmi.c#L410
>=20
> Thanks for all the details and references!
>=20
> Unfortunately I had to drop the scrambling setup for now [1], as I
> encountered some issues while attempting to get this implemented as
> suggested.  Will get back to this and submit it separately when done.

Yeah, I think that's the best way forward for now :)

Maxime
--bjmxjjuhmv2zdjhq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCZvEkmgAKCRAnX84Zoj2+
dtqIAYCEGRZltZdX05vOCUhg+bOJmCXtzlvHsgM0R0lqKkF47Ts4/UIXsS4SIBrh
GzywXicBfA+E1AnqXzojQFvunTAvhnbNDmkORCYsD6W+6g1tpbLD2aeqkSlYNen/
ghfb0s5gfA==
=WJBj
-----END PGP SIGNATURE-----

--bjmxjjuhmv2zdjhq--
