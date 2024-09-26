Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F1A99876BE
	for <lists+dri-devel@lfdr.de>; Thu, 26 Sep 2024 17:43:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4FAEE10EB87;
	Thu, 26 Sep 2024 15:43:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="RB27zguB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB16B10EBA1
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Sep 2024 15:42:59 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 7A06CA4525D;
 Thu, 26 Sep 2024 15:42:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8B4A0C4CEC5;
 Thu, 26 Sep 2024 15:42:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1727365378;
 bh=Sc8fvXVB1aCNmxQD36fuOG91eO7FuqWYSK2bNIoNLmA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=RB27zguB93RPqKdJw/VZJC6cZqQTJfKMa2RcktB0DLakxRYbFxJQN+9VbqtpKl8ge
 Qna+sbBbWHov4iqHSk7nzSpU1JO9idQHSFt27GxKKydQIUYOoz+VBWIoo1BAoy/t7i
 BcVLNyKoEca5UiQKzDSa3DbXaheWLzUrxXWTdWSmRX2g4jJCMd81zrfz7/gZx25sQe
 /+KWr9ZlDxjprpFQufiRK3yModdXNOHkFbPjsnLDU1abt6VD5aPYd9A0tXQ0MMhr4g
 xhPhkrxWGa249FTp3lhCmfE85jNzwCmJ1MMCkR1Sk69XyEBqKJS1GZfxZTHPDWFE64
 Fks5eZXw0Dnrg==
Date: Thu, 26 Sep 2024 16:42:53 +0100
From: Conor Dooley <conor@kernel.org>
To: Dzmitry Sankouski <dsankouski@gmail.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 1/2] dt-bindings: panel: add Samsung s6e3ha8
Message-ID: <20240926-emerald-parchment-29bf2dbd6ca6@spud>
References: <20240926-starqltechn_integration_upstream-v5-0-1cb0e43e623f@gmail.com>
 <20240926-starqltechn_integration_upstream-v5-1-1cb0e43e623f@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="P65Kks/bHhmaxPhk"
Content-Disposition: inline
In-Reply-To: <20240926-starqltechn_integration_upstream-v5-1-1cb0e43e623f@gmail.com>
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


--P65Kks/bHhmaxPhk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 26, 2024 at 02:29:26PM +0300, Dzmitry Sankouski wrote:
> Add binding for the Samsung s6e3ha8 panel found in the Samsung S9.
>=20
> Signed-off-by: Dzmitry Sankouski <dsankouski@gmail.com>
>=20
> ---
> Changes for v5:
> - fix required properties order
> - fix example indentation
>=20
> Changes in v4:
> - change dts example intendation from tabs
>  to spaces
> - remove reset-gpios description
> ---
>  Documentation/devicetree/bindings/display/panel/samsung,s6e3ha8.yaml | 7=
5 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
>  MAINTAINERS                                                          |  =
5 ++++
>  2 files changed, 80 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/display/panel/samsung,s6e3=
ha8.yaml b/Documentation/devicetree/bindings/display/panel/samsung,s6e3ha8.=
yaml
> new file mode 100644
> index 000000000000..05a78429aaea
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/panel/samsung,s6e3ha8.yaml
> @@ -0,0 +1,75 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/panel/samsung,s6e3ha8.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Samsung s6e3ha8 AMOLED DSI panel
> +
> +description: The s6e3ha8 is a 1440x2960 DPI display panel from Samsung M=
obile
> +  Displays (SMD).

if you respin, please start the text on the line after the description.
That's just a nit, so
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

--P65Kks/bHhmaxPhk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZvWA/QAKCRB4tDGHoIJi
0saMAQDBPHOWuygsfNgEC+MMK3RNo6tbBp4taeBLLvkieQIF2gEAqO+b87htOpor
yG+Ogr0J4PLu4VLRQpcgeTcL7/1K8wM=
=Wmqz
-----END PGP SIGNATURE-----

--P65Kks/bHhmaxPhk--
