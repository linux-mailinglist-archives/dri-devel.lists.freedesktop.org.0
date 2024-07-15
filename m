Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B0020931795
	for <lists+dri-devel@lfdr.de>; Mon, 15 Jul 2024 17:28:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 19DAA10E413;
	Mon, 15 Jul 2024 15:28:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="o0kBacF9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1852910E40D;
 Mon, 15 Jul 2024 15:28:26 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 72993CE0E38;
 Mon, 15 Jul 2024 15:28:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E1927C32782;
 Mon, 15 Jul 2024 15:28:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1721057303;
 bh=wMcIDWrmGAfvryRlixL8w6f8KnHDW2Iqu7kAgZM/vXw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=o0kBacF92LbdiCs93gFwNPY1FfabN+E68VMrZgdO82AA0zEKsj1TLZd4UbDYoezIz
 UedRDekGi4ANFCCccOS5CIsByt5S+bYum5Llve43wrRgHD4LcELHl9TyvsjWXH5gqx
 QNjhQpwpy3uJUN5j03dstiME0Ou3BFNmEEERIIBgnCmM0z66A08TzL2JPnW0h6MmaQ
 aDGkhrggp3TEW3ZfNY8NUxwlieFOklBKDb3hHPpzUmxNN6ux2xf/Mk747654+EO2ey
 HqIRw4o4nRRdzP0LCbJ818Aaj31dv3XojbfnhHEId7uDYvZ7aYePb040ggppbN5/z0
 ScrqQPZTdJa4A==
Date: Mon, 15 Jul 2024 16:28:16 +0100
From: Conor Dooley <conor@kernel.org>
To: Marc Gonzalez <mgonzalez@freebox.fr>
Cc: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Rob Clark <robdclark@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
 devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, Arnaud Vrac <avrac@freebox.fr>,
 Pierre-Hugues Husson <phhusson@freebox.fr>,
 Jeffrey Hugo <quic_jhugo@quicinc.com>
Subject: Re: [PATCH v6 3/6] drm/msm/hdmi: add "qcom,hdmi-tx-8998" compatible
Message-ID: <20240715-stable-popsicle-7c6e2fa76644@spud>
References: <20240715-hdmi-tx-v6-0-d27f029627ad@freebox.fr>
 <20240715-hdmi-tx-v6-3-d27f029627ad@freebox.fr>
 <20240715-trickery-spongy-c9d8e246b4cc@spud>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="I/966nsfPxtlNaRp"
Content-Disposition: inline
In-Reply-To: <20240715-trickery-spongy-c9d8e246b4cc@spud>
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


--I/966nsfPxtlNaRp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 15, 2024 at 04:26:12PM +0100, Conor Dooley wrote:
> On Mon, Jul 15, 2024 at 02:21:16PM +0200, Marc Gonzalez wrote:
> > Current driver already supports the msm8998 HDMI TX.
> > We just need to add the compatible string.
>=20
> Why is this required when the driver change suggests that this device is
> compatible with the existing 8974?

(I know I reviewed the binding already, just noticing this which
suggests a fallback would be appropriate, despite the differing clocks
etc)

>=20
> >=20
> > Signed-off-by: Marc Gonzalez <mgonzalez@freebox.fr>
> > ---
> >  drivers/gpu/drm/msm/hdmi/hdmi.c | 1 +
> >  1 file changed, 1 insertion(+)
> >=20
> > diff --git a/drivers/gpu/drm/msm/hdmi/hdmi.c b/drivers/gpu/drm/msm/hdmi=
/hdmi.c
> > index 24abcb7254cc4..0bfee41c2e71a 100644
> > --- a/drivers/gpu/drm/msm/hdmi/hdmi.c
> > +++ b/drivers/gpu/drm/msm/hdmi/hdmi.c
> > @@ -549,6 +549,7 @@ static void msm_hdmi_dev_remove(struct platform_dev=
ice *pdev)
> >  }
> > =20
> >  static const struct of_device_id msm_hdmi_dt_match[] =3D {
> > +	{ .compatible =3D "qcom,hdmi-tx-8998", .data =3D &hdmi_tx_8974_config=
 },
> >  	{ .compatible =3D "qcom,hdmi-tx-8996", .data =3D &hdmi_tx_8974_config=
 },
> >  	{ .compatible =3D "qcom,hdmi-tx-8994", .data =3D &hdmi_tx_8974_config=
 },
> >  	{ .compatible =3D "qcom,hdmi-tx-8084", .data =3D &hdmi_tx_8974_config=
 },
> >=20
> > --=20
> > 2.34.1
> >=20



--I/966nsfPxtlNaRp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZpVAEAAKCRB4tDGHoIJi
0sU8AP4jM6fDhuBRN2MOUSxGHypHq+sAMObmuhoxsoBDNdo4awD/V9VWHT01TVJw
2JaoCyJhPin+XY9G0rHrT0tjTjiN4Ac=
=4QyH
-----END PGP SIGNATURE-----

--I/966nsfPxtlNaRp--
