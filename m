Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D72C27BDCB
	for <lists+dri-devel@lfdr.de>; Tue, 29 Sep 2020 09:14:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E70589BF5;
	Tue, 29 Sep 2020 07:14:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new3-smtp.messagingengine.com (new3-smtp.messagingengine.com
 [66.111.4.229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3726A89FD4
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Sep 2020 08:17:33 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.nyi.internal (Postfix) with ESMTP id D568858032E;
 Mon, 28 Sep 2020 04:17:29 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Mon, 28 Sep 2020 04:17:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm3; bh=Aop0cG/3iAtpEfm2VM1319UI65t
 /01Zx9Fr/lhAePig=; b=BkDfsRq9EYZqweDCrsP/WCUkdHgvk3sVc35MYGEXBXt
 /3r2c8BtnYY/mshqdcBDRRmGYRTDdOfSpXmxxRd5ipdvO/8wFkB/e4PhnyRY32r/
 bF8PFcTdQBOW79xsroCPJVPySsUniRi0cmSDa5a96GgYS72u3dD7Gc/C9B8CTskS
 0vYOgou/UIBlYCvQw3dNBKoSEbX78mFeUlXB+kt1IxM3u1O1ABGIWYeTjxJRBngS
 b/tMiRmEA4XYddpj8SkIAtTComLTedRY0exRSxJ5IGXaIpjMCrsg919a/EKYXsHs
 /lDpGw9W69c+nQqni4VZ9wqLlwoV2fBuSaeJC39AQ2g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=Aop0cG
 /3iAtpEfm2VM1319UI65t/01Zx9Fr/lhAePig=; b=Omo1jSgvT9Z3GWyo7yS362
 z9EXcv5t8HCEqV42q3B9ijIA/q0+1UC/V8hNGycVQ5apNBXZQ8gxsdZbdfqIqCA+
 2ul1vu45f80kzLd4XAQrqZ17bJdOgjZoaKpddJSpxno8jvmnzci09liE34ksJVAV
 8qu7D2cGrR/ePtPmiXLGbuYiUIC/oeZu6wFRaLt3BilcVXMsFt+TCIJIhVRg+1BY
 zgGQwazYciEiIihQV/ur1HnJyVSbApWF6PA/bczrAuANQBB1O2w7T9jwXqeS8xTv
 gvV2nLbkENL+Xny7VmoZr2eeB6NM0DG2ZSZwhjxUfuIGazSV6FCDkeiaCykiSAkA
 ==
X-ME-Sender: <xms:GJxxXwPUa7uAjuy3M9TMLA-HoWK7j__7KZk2yE92a2xNhbaMwI6m7Q>
 <xme:GJxxX28THgJeIWtAbNB6E4omoy2DFokOAma5x7wlnL-iD9SvaK5nRsoczZgu5rNLj
 LsBs08F-8iA75JKs1M>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrvdeigddtfecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvuffkfhggtggujgesghdtreertddtvdenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpeffteetveeijeetuefhffegkeetgffhieelheehtdduudethffhjedtvddtudel
 vdenucffohhmrghinhepuggvvhhitggvthhrvggvrdhorhhgnecukfhppeeltddrkeelrd
 eikedrjeeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhho
 mhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:GJxxX3RY-A-_5Q_hJpRmceVN1h6iwTGFlULjvSzIDMNTcjIQ-HLlsA>
 <xmx:GJxxX4tNCVTDgXVjz29VAahD55RZRRgoH5EG5Rg0TVVKrOAKqK4kmw>
 <xmx:GJxxX4eqCGb_ORpSLQ3i04Us2D8nEAIChuQKkPOw4QIztCMKuk-tfQ>
 <xmx:GZxxX_xF_spv8J_e406jw4EHnEm-msGLDLK1Bd5BHeEZogrJVAPUhA>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id AA8A7328005A;
 Mon, 28 Sep 2020 04:17:28 -0400 (EDT)
Date: Mon, 28 Sep 2020 10:17:26 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Kevin Tang <kevin3.tang@gmail.com>
Subject: Re: [PATCH RFC v7 1/6] dt-bindings: display: add Unisoc's drm master
 bindings
Message-ID: <20200928081726.hkh3rzbfr6m7jszt@gilmour.lan>
References: <1601274460-7866-1-git-send-email-kevin3.tang@gmail.com>
 <1601274460-7866-2-git-send-email-kevin3.tang@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1601274460-7866-2-git-send-email-kevin3.tang@gmail.com>
X-Mailman-Approved-At: Tue, 29 Sep 2020 07:12:58 +0000
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
Cc: mark.rutland@arm.com, airlied@linux.ie, zhang.lyra@gmail.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 robh+dt@kernel.org, orsonzhai@gmail.com, sean@poorly.run
Content-Type: multipart/mixed; boundary="===============1824256860=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1824256860==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="wsivn4n7yx76g6b5"
Content-Disposition: inline


--wsivn4n7yx76g6b5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

On Mon, Sep 28, 2020 at 02:27:35PM +0800, Kevin Tang wrote:
> From: Kevin Tang <kevin.tang@unisoc.com>
>=20
> The Unisoc DRM master device is a virtual device needed to list all
> DPU devices or other display interface nodes that comprise the
> graphics subsystem
>=20
> RFC v7:
>   - Fix DTC unit name warnings
>   - Fix the problem of maintainers
>=20
> Cc: Orson Zhai <orsonzhai@gmail.com>
> Cc: Chunyan Zhang <zhang.lyra@gmail.com>
> Signed-off-by: Kevin Tang <kevin.tang@unisoc.com>
> ---
>  .../display/sprd/sprd,display-subsystem.yaml       | 39 ++++++++++++++++=
++++++
>  1 file changed, 39 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/sprd/sprd,d=
isplay-subsystem.yaml
>=20
> diff --git a/Documentation/devicetree/bindings/display/sprd/sprd,display-=
subsystem.yaml b/Documentation/devicetree/bindings/display/sprd/sprd,displa=
y-subsystem.yaml
> new file mode 100644
> index 0000000..9487a39
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/sprd/sprd,display-subsyst=
em.yaml
> @@ -0,0 +1,39 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/sprd/sprd,display-subsystem.y=
aml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Unisoc DRM master device
> +
> +maintainers:
> +  - Kevin Tang <kevin.tang@unisoc.com>
> +
> +description: |
> +  The Unisoc DRM master device is a virtual device needed to list all
> +  DPU devices or other display interface nodes that comprise the
> +  graphics subsystem.
> +
> +properties:
> +  compatible:
> +    const: sprd,display-subsystem
> +
> +  ports:
> +    $ref: /schemas/types.yaml#/definitions/phandle-array
> +    description:
> +      Should contain a list of phandles pointing to display interface po=
rt
> +      of DPU devices.

Generally speaking, driver-specific properties should be prefixed by the
vendor name to avoid any conflict with generic properties (like the
OF-Graph ports subnode in this case)

Maxime

--wsivn4n7yx76g6b5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCX3GcFgAKCRDj7w1vZxhR
xS+CAPsHd2tToWbot1PTKDityictfpR+g452/h0gzCk21CJWUwEA6mST9Nu/gRFs
jq4u6HJkFAaCIllYK06QAD6PzFlFsg0=
=jHyL
-----END PGP SIGNATURE-----

--wsivn4n7yx76g6b5--

--===============1824256860==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1824256860==--
