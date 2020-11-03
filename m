Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 916E02A5F5A
	for <lists+dri-devel@lfdr.de>; Wed,  4 Nov 2020 09:23:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2FDBD89CB5;
	Wed,  4 Nov 2020 08:22:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com
 [64.147.123.25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E91736E8A6
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Nov 2020 09:52:09 +0000 (UTC)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailout.west.internal (Postfix) with ESMTP id 5A5D9B7A;
 Tue,  3 Nov 2020 04:52:08 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute6.internal (MEProxy); Tue, 03 Nov 2020 04:52:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm1; bh=eDQ3z6R7HELxuV1aufq8yOfVMPt
 p2cGpDjOIGR+8JmM=; b=I3SUt8wWwADbU6MU/c2Rae3H24rPiVeyyJeN3vtoZrs
 kqVmUGPHOwNWZ5tUnaS156kBAi48dhDlJP8/N4AWuXlw5U7oJLdYWy6XnUh4nC9B
 qwLzuv0QaBAdr5QN3kkIA7ARaGjkzszRDbGkO5qoMUIEZFzJ4V0WSroJLu0ubREp
 aQnGTzVYm1UlexzsRS7ce7nffOJOs5WibiS7SbbhuY8ywx3GL+HhKnbXvF8shY4L
 LgCmn3qBgj62ik6exEJJp+V8i2hZH4xPMCfBc1nabPn9fq2ln2coz/ks1FAogC4W
 /uD9K6+K5dZQ7GJuLcAR/ztySG1b/NzXRd+B2ty7+JA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=eDQ3z6
 R7HELxuV1aufq8yOfVMPtp2cGpDjOIGR+8JmM=; b=lxU1ZyChE1RJZCuRZZAESM
 OdGFL6WvqEk6looiCqrMDNesm5OOoD4mHT4sjBxUMR4e8D/DCrNWT+tPOi2dJMbq
 cGAcvsjoUZHYjuAcRaREbYpW93RBtxpvvSFj+o8acQPEg/94EwnJgM6vSHAh8KU7
 u1L5eHcvhi7J6hZ3CdDABEYC+F0fqUO82htz0pvPDXhPT7Z3QGgmvi2qzfEzF6aI
 VOhUfAlxe9oEhpBS6n5/pFpUA6vujujHHhnE0qF54eFAIcwjKNr9w/F52zVJiAoo
 RoLpmbOKCQE3kCGst0GCsTFk7/4vcwpEJ77eMyBIvRxTptPyZ5N2qflLMT2RogDQ
 ==
X-ME-Sender: <xms:RiihX0jhkJtxb4G6RI_7zmxO2bF_Rx5WgO9TUUPqKija5pRwDS0P1w>
 <xme:RiihX9C3bM0Qn7iECZgKWKu_xu0C5I2AiKGwYjchs6UeVeUHo4jD3C5IvkgC-LOP9
 jwBo2k5gqdTa2Da7uE>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedruddtfedgtdelucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttddvnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepleekgeehhfdutdeljefgleejffehfffgieejhffgueefhfdtveetgeehieeh
 gedunecukfhppeeltddrkeelrdeikedrjeeinecuvehluhhsthgvrhfuihiivgeptdenuc
 frrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:RiihX8F7j-8E28eyza3ecFzXEITVk-aYN89jAUpDvhb8Y-LnP7typA>
 <xmx:RiihX1SDFqIcuF8z2Rii8bai6OhJz8SKkHMcc_K6p-A4HvU7dGEKdQ>
 <xmx:RiihXxwnR2OiRJW9mjqwkx_iSkBwZeTIGD5J9GzmU2Tf4B2xTZZsfg>
 <xmx:RyihXzvvPZG5U5HcvNPtVuyMhsEOnPg4eKMDzbnLKNX1sTCTy36gXg>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id 3CB1D3280069;
 Tue,  3 Nov 2020 04:52:06 -0500 (EST)
Date: Tue, 3 Nov 2020 10:52:05 +0100
From: Maxime Ripard <maxime@cerno.tech>
To: Tian Tao <tiantao6@hisilicon.com>
Subject: Re: [PATCH v2] drm: Add the new api to install irq
Message-ID: <20201103095205.ywabphbc2xbop6ae@gilmour.lan>
References: <1604369441-65254-1-git-send-email-tiantao6@hisilicon.com>
MIME-Version: 1.0
In-Reply-To: <1604369441-65254-1-git-send-email-tiantao6@hisilicon.com>
X-Mailman-Approved-At: Wed, 04 Nov 2020 08:22:13 +0000
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
Cc: tzimmermann@suse.de, airlied@linux.ie, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============0428834747=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0428834747==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="xs6ln5j4huqhrzhw"
Content-Disposition: inline


--xs6ln5j4huqhrzhw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 03, 2020 at 10:10:41AM +0800, Tian Tao wrote:
> Add new api devm_drm_irq_install() to register interrupts,
> no need to call drm_irq_uninstall() when the drm module is removed.
>=20
> v2:
> fixed the wrong parameter.
>=20
> Signed-off-by: Tian Tao <tiantao6@hisilicon.com>
> ---
>  drivers/gpu/drm/drm_drv.c | 23 +++++++++++++++++++++++
>  include/drm/drm_drv.h     |  3 ++-
>  2 files changed, 25 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/drm_drv.c b/drivers/gpu/drm/drm_drv.c
> index cd162d4..0fe5243 100644
> --- a/drivers/gpu/drm/drm_drv.c
> +++ b/drivers/gpu/drm/drm_drv.c
> @@ -39,6 +39,7 @@
>  #include <drm/drm_color_mgmt.h>
>  #include <drm/drm_drv.h>
>  #include <drm/drm_file.h>
> +#include <drm/drm_irq.h>
>  #include <drm/drm_managed.h>
>  #include <drm/drm_mode_object.h>
>  #include <drm/drm_print.h>
> @@ -678,6 +679,28 @@ static int devm_drm_dev_init(struct device *parent,
>  	return ret;
>  }
> =20
> +static void devm_drm_dev_irq_uninstall(void *data)
> +{
> +	drm_irq_uninstall(data);
> +}
> +
> +int devm_drm_irq_install(struct device *parent,
> +			 struct drm_device *dev, int irq)
> +{
> +	int ret;
> +
> +	ret =3D drm_irq_install(dev, irq);
> +	if (ret)
> +		return ret;
> +
> +	ret =3D devm_add_action(parent, devm_drm_dev_irq_uninstall, dev);
> +	if (ret)
> +		devm_drm_dev_irq_uninstall(dev);
> +
> +	return ret;
> +}
> +EXPORT_SYMBOL(devm_drm_irq_install);
> +

Shouldn't we tie the IRQ to the drm device (so with drmm_add_action)
instead of tying it to the underlying device?

Maxime
>=20

--xs6ln5j4huqhrzhw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCX6EoRAAKCRDj7w1vZxhR
xYkCAQC9VFY7e5GLo1YuFFmxexHLyg1jTL5G7fYo1CEBerCVbwD8DKPgZ4MI0x6P
C0AMlKKWSCWLXIBmLvIKJ1KxLqMYbA0=
=crER
-----END PGP SIGNATURE-----

--xs6ln5j4huqhrzhw--

--===============0428834747==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0428834747==--
