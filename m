Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C0DF79A524
	for <lists+dri-devel@lfdr.de>; Mon, 11 Sep 2023 09:56:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C536810E11D;
	Mon, 11 Sep 2023 07:56:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D279710E11D
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Sep 2023 07:56:42 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id 0096ECE10B6;
 Mon, 11 Sep 2023 07:56:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B94B3C433C9;
 Mon, 11 Sep 2023 07:56:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1694418999;
 bh=J4By/wtMEr2AEoDW7IigfXfEKp7/CeZK5KPE57g83AQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ZfX6RyGjkbCon6qIymrUuDUmd4zyiw+oq+3UYAwwiRejb+bjeMBacGLrJVk1rq0/6
 Epnri0SlLSNT0lEAGHQvpMVuUcd2/RK9resXaAfohLmxGBCzZIIHrx7Agczwvu/Ee0
 31czy6K1CbffAHojh735ol2bgE4CnY66hmjm0pn6F1mBdWN8voaI8Q2HEOHpFLNRzl
 yvcxdQ6OE9Fl21SakZehyM4rsYmRvesVp8JReZTn2jV8YMCT5/x7nK38rZarLkg1A/
 1oa4bIIvcvkevd5EzXEXDw5eyXcW9i0t/nR43VM6KtPIonud2mgDSNbNgw3I3uFC5u
 oKb6l2ve2JxUQ==
Date: Mon, 11 Sep 2023 09:56:36 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Vignesh Raman <vignesh.raman@collabora.com>
Subject: Re: [PATCH v3 2/9] arm64: dts: qcom: apq8016-sbc: Add overlay for
 usb host mode
Message-ID: <n7pfq63xblrijh7azhqj4zytnq6tuym6dwdw6rrwznnizpoy5p@7vsgezhgs3jg>
References: <20230908152225.432139-1-vignesh.raman@collabora.com>
 <20230908152225.432139-3-vignesh.raman@collabora.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="gagdd2k3ghthyhjr"
Content-Disposition: inline
In-Reply-To: <20230908152225.432139-3-vignesh.raman@collabora.com>
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
Cc: emma@anholt.net, dri-devel@lists.freedesktop.org,
 virtualization@lists.linux-foundation.org, krzysztof.kozlowski+dt@linaro.org,
 robdclark@google.com, david.heidelberg@collabora.com,
 sergi.blanch.torne@collabora.com, gustavo.padovan@collabora.com,
 agross@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org,
 daniels@collabora.com, linux-arm-msm@vger.kernel.org,
 helen.koike@collabora.com, anholt@google.com,
 linux-mediatek@lists.infradead.org, robclark@freedesktop.org,
 matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com,
 andersson@kernel.org, linux-kernel@vger.kernel.org, konrad.dybcio@linaro.org,
 robh+dt@kernel.org, dmitry.baryshkov@linaro.org, guilherme.gallo@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--gagdd2k3ghthyhjr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 08, 2023 at 08:52:18PM +0530, Vignesh Raman wrote:
> Due to the presence of the fastboot micro cable in the CI farm,
> it causes the hardware to remain in gadget mode instead of host mode.
> So it doesn't find the network, which results in failure to mount root
> fs via NFS.
>=20
> Add an overlay dtso file that sets the dr_mode to host, allowing
> the USB controllers to work in host mode. This dtso file will be used
> in drm-ci, mesa-ci.
>=20
> Overlay DT file uses the sugar syntax [suggested by Dmitry Baryshkov and =
Maxime Ripard]
>=20
> Suggested-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Suggested-by: Maxime Ripard <mripard@kernel.org>
> Signed-off-by: Helen Koike <helen.koike@collabora.com>
> Signed-off-by: David Heidelberg <david.heidelberg@collabora.com>
> Signed-off-by: Vignesh Raman <vignesh.raman@collabora.com>
> ---
>=20
> v3:
>   - New patch in the series to add device tree overlay in arch/arm64/boot=
/dts/qcom
>=20
> ---
>  arch/arm64/boot/dts/qcom/apq8016-sbc-usb-host.dtso | 8 ++++++++
>  1 file changed, 8 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/qcom/apq8016-sbc-usb-host.dtso
>=20
> diff --git a/arch/arm64/boot/dts/qcom/apq8016-sbc-usb-host.dtso b/arch/ar=
m64/boot/dts/qcom/apq8016-sbc-usb-host.dtso
> new file mode 100644
> index 000000000000..a82c26b7eae8
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/apq8016-sbc-usb-host.dtso
> @@ -0,0 +1,8 @@
> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> +
> +/dts-v1/;
> +/plugin/;
> +
> +&usb {
> +         dr_mode =3D "host";
> +};
> --=20
> 2.40.1
>=20

You need to add it to the Makefile too

Maxime

--gagdd2k3ghthyhjr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZP7INAAKCRDj7w1vZxhR
xV6IAQCox48qewzlkPPyfIUdU1lcyOF2tjZGlIie1OkEy+YwewD9HSiqWhPcaU05
UcmcRvKlRMTRddoOLVSVlt6zHhBNPgI=
=Cw8P
-----END PGP SIGNATURE-----

--gagdd2k3ghthyhjr--
