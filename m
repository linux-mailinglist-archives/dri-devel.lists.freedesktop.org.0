Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3064C3BC8DE
	for <lists+dri-devel@lfdr.de>; Tue,  6 Jul 2021 11:58:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE95D89DB9;
	Tue,  6 Jul 2021 09:58:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD21489DB9
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Jul 2021 09:58:11 +0000 (UTC)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.nyi.internal (Postfix) with ESMTP id C859B5C0184;
 Tue,  6 Jul 2021 05:58:10 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute1.internal (MEProxy); Tue, 06 Jul 2021 05:58:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm3; bh=KcG26SKvWpJEcYyrNGgxr2CComk
 cauGVOJ+d+NFX528=; b=u9htHH4WzUegTV0OfsgCdEDSldNsDtYGCmLMIGmjwka
 7NlWpg+2s/i3vuGr56A0n1xZULeyBb8iZhB4Oicv2voz9I5+t3cOXxUxDybx2ihj
 6CNdsdJ1y/+QIF9MmogUqIbUXnBdjgy6SBRAlPUuH1j4NEFhnJ7MKL0SSFOhY+wv
 38QKyMiic33L1Ohk+pDGBhuoRcqljfpwlMNqlFzDRwvcSG9p9eWtveXLftpEwLsH
 aD7LxiraVtmgzdOvSPAU3DQPqBqnfmBm3d5m3pXTsd9Q7dD3Lr5srMzZwMMyjHf/
 wKRfDKYg4iIIqvWYFNnSzDozg2bl0nYZw7/GQih6qjw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=KcG26S
 KvWpJEcYyrNGgxr2CComkcauGVOJ+d+NFX528=; b=i7ycfhllmuTE+agDDDECMs
 FuCgcBiybsM4TP2wyr32D2o90LvdCD/lomEr04wWwkV838GwmzdyyViVcmlDOJJO
 YQsqLz4tFfDXXvpGahNBnuUCCJH0BaU+UgX5yDblwUjQDW6yw5M+O2wM8NyWpxWz
 Op0mmyFHuEezmCqjGE1ROL+F0Zq4i9UkwM2fYeosPgly/rcX5WPC/aFbADxquWfm
 X2uyXu3fQ/wlWCPFypZhbVyUL04y4Pbu5ozWDIiED3DIepQszv52N0OmkftGRKXK
 lAeIVv2aRwYurVJYVcibUZVz0+AktEeSeIELYdVX7mCMoiSkpf2lHL0SeniwCQiQ
 ==
X-ME-Sender: <xms:MSnkYGvjlPTUFiAFlcDWbshHHq9C8k88JlPs0vOo2__9SOU7NEQzyQ>
 <xme:MSnkYLcSUaCLF_Upv438bzOhqmuEf8ylczxVeh-VhXyr4hHazhcFPJm9rEbGOo6Dj
 P4EliJpCPIHh_l0hlg>
X-ME-Received: <xmr:MSnkYBy6aQPAWGu52iE7kBnL3Zden8Lhoz3oTEHQ04BifhkRCzVNAbuGupFSTUTy99ydVatHH2NtFF35IClPSgsCTw7ri1KvFGy->
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrfeejiedgudekucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttddvnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepveevfeffudeviedtgeethffhteeuffetfeffvdehvedvheetteehvdelfffg
 jedvnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucevlhhushhtvghrufhiiigvpe
 dtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:MSnkYBPS7I8uQErYihFzvc-kmRwEbqHgCys4R6_j7rG_ih2H2nDcQA>
 <xmx:MSnkYG9IWmz3JlRV1HiNh2IvCQ9Ik2FOKWdqeGffMeWBpyewyf7Dbg>
 <xmx:MSnkYJUtv8iguaXrHPCWWNdac4FqNMNc3wif8xpxWDyQHEtiV-d-mQ>
 <xmx:MinkYGz5fRv1ZT-GIzIVIU4WS_RWASnRXThjYgEoc355qAj5l7qrKg>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 6 Jul 2021 05:58:09 -0400 (EDT)
Date: Tue, 6 Jul 2021 11:58:07 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Stefan Wahren <stefan.wahren@i2se.com>
Subject: Re: [PATCH RFC] drm/vc4: hdmi: Fix connector detect logic
Message-ID: <20210706095807.abx3v4wkc7ymwhjx@gilmour>
References: <1625520994-11065-1-git-send-email-stefan.wahren@i2se.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="uvpqq7zdyhlbgbv3"
Content-Disposition: inline
In-Reply-To: <1625520994-11065-1-git-send-email-stefan.wahren@i2se.com>
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
Cc: Nicolas Saenz Julienne <nsaenz@kernel.org>, Emma Anholt <emma@anholt.net>,
 David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 Nathan Chancellor <nathan@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--uvpqq7zdyhlbgbv3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Mon, Jul 05, 2021 at 11:36:34PM +0200, Stefan Wahren wrote:
> Commit "drm/vc4: hdmi: Convert to gpiod" changes the behavior of
> vc4_hdmi_connector_detect() which results into CPU hangs in case there
> is no HDMI connected. Let's restore the old behavior.
>=20
> Reported-by: Nathan Chancellor <nathan@kernel.org>
> Reported-by: Ojaswin Mujoo <ojaswin98@gmail.com>
> Fixes: 6800234ceee0 ("drm/vc4: hdmi: Convert to gpiod")
> Signed-off-by: Stefan Wahren <stefan.wahren@i2se.com>

I already sent this patch last week:

https://lore.kernel.org/dri-devel/20210628124257.140453-3-maxime@cerno.tech/

I'm not entirely sure how this could create a CPU hang though. Withouth
this patch, if the HPD GPIO is low, we would first try to retrieve the
EDID, and then if it doesn't we would read the hotplug register.

The first is using a separate i2c controller (and even if it was in the
same power domain, we have the pm_runtime_resume call), and the register
read should be fine too?

Maxime

>  drivers/gpu/drm/vc4/vc4_hdmi.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdm=
i.c
> index aab1b36..cf8339c 100644
> --- a/drivers/gpu/drm/vc4/vc4_hdmi.c
> +++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
> @@ -168,9 +168,9 @@ vc4_hdmi_connector_detect(struct drm_connector *conne=
ctor, bool force)
> =20
>  	WARN_ON(pm_runtime_resume_and_get(&vc4_hdmi->pdev->dev));
> =20
> -	if (vc4_hdmi->hpd_gpio &&
> -	    gpiod_get_value_cansleep(vc4_hdmi->hpd_gpio)) {
> -		connected =3D true;
> +	if (vc4_hdmi->hpd_gpio) {
> +		if (gpiod_get_value_cansleep(vc4_hdmi->hpd_gpio))
> +			connected =3D true;
>  	} else if (drm_probe_ddc(vc4_hdmi->ddc)) {
>  		connected =3D true;
>  	} else if (HDMI_READ(HDMI_HOTPLUG) & VC4_HDMI_HOTPLUG_CONNECTED) {
> --=20
> 2.7.4
>=20

--uvpqq7zdyhlbgbv3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYOQpLwAKCRDj7w1vZxhR
xY2SAP0RPU3h0m500q3z/V5MGfgtyuRiiyoxZJDcFKU/bi/GbQD+J3QujRwZFZyj
zUfGBPtRWbLn6/BMMwb2lvJ4eoO4BgM=
=UYc2
-----END PGP SIGNATURE-----

--uvpqq7zdyhlbgbv3--
