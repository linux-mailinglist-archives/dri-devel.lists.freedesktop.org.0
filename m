Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A691B93178C
	for <lists+dri-devel@lfdr.de>; Mon, 15 Jul 2024 17:26:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED5A310E411;
	Mon, 15 Jul 2024 15:26:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="ltCWfPdf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5405310E40F;
 Mon, 15 Jul 2024 15:26:22 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 4B96ACE102B;
 Mon, 15 Jul 2024 15:26:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C9FF5C32782;
 Mon, 15 Jul 2024 15:26:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1721057179;
 bh=sNW/aSHX8YqWmU4H5l4JY22GHRxmk/j7ao32iwDx0qQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ltCWfPdfZnEyL/P+J/m5VDzukXMca/1bVQAaZkeIJNR6CE/Z700sIcX0KNGiJceuu
 aRN+0QaIyjm2F/I+vdOGhrR9U3LSB0ZBOxFgoEDbmN8tS0B43NpTp/cSyD5vh3P1/V
 LQcoUgFXK74LUfvIKqpoR/yMLvvEXZEjdKXwF4QSUCYAPTU73Ef4oMfmUcEs2CoDOL
 xkCmuPCmLQnoGoByhA6THeRTfXISmzgoCtz+gbiJWsrWPheRpSZgHrHuqgIJjnrKA7
 er6gwtuB4zbLASUosYTZ1iaA1WQGv3/cu8vZoRPgxSyYqSjwJgfVml2upejvxVmUXn
 gQKb5ZOHQ/aOw==
Date: Mon, 15 Jul 2024 16:26:12 +0100
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
Message-ID: <20240715-trickery-spongy-c9d8e246b4cc@spud>
References: <20240715-hdmi-tx-v6-0-d27f029627ad@freebox.fr>
 <20240715-hdmi-tx-v6-3-d27f029627ad@freebox.fr>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="OHR+9gzr+luxGuOP"
Content-Disposition: inline
In-Reply-To: <20240715-hdmi-tx-v6-3-d27f029627ad@freebox.fr>
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


--OHR+9gzr+luxGuOP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 15, 2024 at 02:21:16PM +0200, Marc Gonzalez wrote:
> Current driver already supports the msm8998 HDMI TX.
> We just need to add the compatible string.

Why is this required when the driver change suggests that this device is
compatible with the existing 8974?

>=20
> Signed-off-by: Marc Gonzalez <mgonzalez@freebox.fr>
> ---
>  drivers/gpu/drm/msm/hdmi/hdmi.c | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/drivers/gpu/drm/msm/hdmi/hdmi.c b/drivers/gpu/drm/msm/hdmi/h=
dmi.c
> index 24abcb7254cc4..0bfee41c2e71a 100644
> --- a/drivers/gpu/drm/msm/hdmi/hdmi.c
> +++ b/drivers/gpu/drm/msm/hdmi/hdmi.c
> @@ -549,6 +549,7 @@ static void msm_hdmi_dev_remove(struct platform_devic=
e *pdev)
>  }
> =20
>  static const struct of_device_id msm_hdmi_dt_match[] =3D {
> +	{ .compatible =3D "qcom,hdmi-tx-8998", .data =3D &hdmi_tx_8974_config },
>  	{ .compatible =3D "qcom,hdmi-tx-8996", .data =3D &hdmi_tx_8974_config },
>  	{ .compatible =3D "qcom,hdmi-tx-8994", .data =3D &hdmi_tx_8974_config },
>  	{ .compatible =3D "qcom,hdmi-tx-8084", .data =3D &hdmi_tx_8974_config },
>=20
> --=20
> 2.34.1
>=20

--OHR+9gzr+luxGuOP
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZpU/lAAKCRB4tDGHoIJi
0t3VAQCHN0LZCGVHMJwWGIelEtEm/eH6wIS85GY5SnC33zqgnAEA5k/oMJgRULQi
RaUAxvbASVC26bdW+BxCiMRezUdxewY=
=7Wal
-----END PGP SIGNATURE-----

--OHR+9gzr+luxGuOP--
