Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A06B905F83
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jun 2024 02:05:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CEF9B10E108;
	Thu, 13 Jun 2024 00:05:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="VGWO3s68";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [46.235.227.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D24EE10E108
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jun 2024 00:05:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1718237103;
 bh=EgNRkgtKSQMKcbGvUe+V6oqG4AaVX1eRRYE+mhCHvzc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=VGWO3s68lz90z2VBw1rqhyNBsljHnWPPD4vU+WhwzTWyTxa+7Vg6Q6Wp1t/FtYZlw
 4g7qz3BIkNmGZ0GGWTo2U9U1ukx6L1bp60KaPD++3hbjnJyOUQgiDTkx0JFsmvm79q
 nWuCe/X7rOXxkwnfprLajkmBn+5YrG5jQ/PZccuPgf2XzIp4fyALbJ+FjcwrpSLjTg
 bwvARlbxf2ouUdMzLvASzTh7IM5cR6GcjQPgNI9vU2L/K0YRsFYGsSE6dAeNcEwGrk
 gtpWxmnztR7mK2uSjufE0qtb9Qtipyaqn+gMlj7XHdz1ndQhje3pPcYzVT8N0dU9et
 sM9g7S/FP4AJA==
Received: from mercury (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (No client certificate requested) (Authenticated sender: sre)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id 1B7FA3782172;
 Thu, 13 Jun 2024 00:05:03 +0000 (UTC)
Received: by mercury (Postfix, from userid 1000)
 id 8B55A10608F7; Thu, 13 Jun 2024 02:05:02 +0200 (CEST)
Date: Thu, 13 Jun 2024 02:05:02 +0200
From: Sebastian Reichel <sebastian.reichel@collabora.com>
To: Tomeu Vizoso <tomeu@tomeuvizoso.net>
Cc: Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>, 
 Robin Murphy <robin.murphy@arm.com>, Heiko Stuebner <heiko@sntech.de>,
 Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Oded Gabbay <ogabbay@kernel.org>, Tomeu Vizoso <tomeu.vizoso@tomeuvizoso.net>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, Philipp Zabel <p.zabel@pengutronix.de>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>, 
 iommu@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org
Subject: Re: [PATCH 2/9] iommu/rockchip: Attach multiple power domains
Message-ID: <ffviz6ak6qsn2reg5y35aerzy7wxfx6fzix6xjyminbhfcguus@clszdjakdcjd>
References: <20240612-6-10-rocket-v1-0-060e48eea250@tomeuvizoso.net>
 <20240612-6-10-rocket-v1-2-060e48eea250@tomeuvizoso.net>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="klltttveuxmaguyk"
Content-Disposition: inline
In-Reply-To: <20240612-6-10-rocket-v1-2-060e48eea250@tomeuvizoso.net>
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


--klltttveuxmaguyk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Wed, Jun 12, 2024 at 03:52:55PM GMT, Tomeu Vizoso wrote:
> IOMMUs with multiple base addresses can also have multiple power
> domains.
>=20
> The base framework only takes care of a single power domain, as some
> devices will need for these power domains to be powered on in a specific
> order.
>=20
> Use a helper function to stablish links in the order in which they are
> in the DT.
>=20
> This is needed by the IOMMU used by the NPU in the RK3588.
>=20
> Signed-off-by: Tomeu Vizoso <tomeu@tomeuvizoso.net>
> ---

To me it looks like this is multiple IOMMUs, which should each get
their own node. I don't see a good reason for merging these
together.

I will still review this assuming there is one. That would require
to first of all update the DT binding:

Documentation/devicetree/bindings/iommu/rockchip,iommu.yaml

1. It does not allow using "power-domain-names" property
2. It limits the number of allowed power-domains to 1
3. It limits the number of allowed base addresses to 2

Looking at the DT patch you also add more interrupts and clocks,
which are also limited by the binding. You should see a bunch of
warnings when you check the DTBS via 'make dtbs_check'

>  drivers/iommu/rockchip-iommu.c | 36 ++++++++++++++++++++++++++++++++++++
>  1 file changed, 36 insertions(+)
>=20
> diff --git a/drivers/iommu/rockchip-iommu.c b/drivers/iommu/rockchip-iomm=
u.c
> index f5629515bd78..673b0ebb6262 100644
> --- a/drivers/iommu/rockchip-iommu.c
> +++ b/drivers/iommu/rockchip-iommu.c
> @@ -6,6 +6,8 @@
>   *			Daniel Kurtz <djkurtz@chromium.org>
>   */
> =20
> +#include "linux/err.h"
> +#include "linux/pm_domain.h"
>  #include <linux/clk.h>
>  #include <linux/compiler.h>
>  #include <linux/delay.h>
> @@ -115,6 +117,7 @@ struct rk_iommu {
>  	struct iommu_device iommu;
>  	struct list_head node; /* entry in rk_iommu_domain.iommus */
>  	struct iommu_domain *domain; /* domain to which iommu is attached */
> +	struct dev_pm_domain_list *pmdomains;
>  };
> =20
>  struct rk_iommudata {
> @@ -1186,6 +1189,7 @@ static int rk_iommu_probe(struct platform_device *p=
dev)
>  	struct resource *res;
>  	const struct rk_iommu_ops *ops;
>  	int num_res =3D pdev->num_resources;
> +	int pm_domain_count;
>  	int err, i;
> =20
>  	iommu =3D devm_kzalloc(dev, sizeof(*iommu), GFP_KERNEL);
> @@ -1271,6 +1275,35 @@ static int rk_iommu_probe(struct platform_device *=
pdev)
>  	if (!dma_dev)
>  		dma_dev =3D &pdev->dev;
> =20
> +	pm_domain_count =3D of_property_count_strings(iommu->dev->of_node, "pow=
er-domain-names");

pm_domain_count =3D device_property_string_array_count(iommu->dev, "power-d=
omain-names");

When possible using device_property_ is prefered, since it allows
reusing code for systems not using DT.

> +	if (pm_domain_count > 0) {
> +		const char **pm_domains =3D kvmalloc_array(pm_domain_count, sizeof(*pm=
_domains), GFP_KERNEL);
> +		struct dev_pm_domain_attach_data pm_domain_data =3D {
> +			.pd_names =3D pm_domains,
> +			.num_pd_names =3D pm_domain_count,
> +			.pd_flags =3D PD_FLAG_DEV_LINK_ON,
> +		};
> +		int i;
> +
> +		if (!pm_domain_data.pd_names) {
> +			err =3D -ENOMEM;
> +			goto err_remove_sysfs;
> +		}
> +
> +		for (i =3D 0; i < pm_domain_count; i++) {
> +			err =3D of_property_read_string_index(iommu->dev->of_node, "power-dom=
ain-names", i, &pm_domains[i]);
> +			if (err) {
> +				kfree(pm_domains);
> +				goto err_remove_sysfs;
> +			}
> +		}

There is a helper to read a string array:

err =3D device_property_read_string_array(iommu->dev, "power-domain-names",=
 pm_domains, pm_domain_count);

-- Sebastian

> +
> +		err =3D dev_pm_domain_attach_list(iommu->dev, &pm_domain_data, &iommu-=
>pmdomains);
> +		kfree(pm_domains);
> +		if (err < 0)
> +			goto err_remove_sysfs;
> +	}
> +
>  	pm_runtime_enable(dev);
> =20
>  	for (i =3D 0; i < iommu->num_irq; i++) {
> @@ -1292,6 +1325,7 @@ static int rk_iommu_probe(struct platform_device *p=
dev)
>  	return 0;
>  err_pm_disable:
>  	pm_runtime_disable(dev);
> +	dev_pm_domain_detach_list(iommu->pmdomains);
>  err_remove_sysfs:
>  	iommu_device_sysfs_remove(&iommu->iommu);
>  err_unprepare_clocks:
> @@ -1310,6 +1344,8 @@ static void rk_iommu_shutdown(struct platform_devic=
e *pdev)
>  		devm_free_irq(iommu->dev, irq, iommu);
>  	}
> =20
> +	dev_pm_domain_detach_list(iommu->pmdomains);
> +
>  	pm_runtime_force_suspend(&pdev->dev);
>  }
> =20
>=20
> --=20
> 2.45.2
>=20
>=20

--klltttveuxmaguyk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAmZqN6sACgkQ2O7X88g7
+pqVmxAAg7JgRVo1N7aZb+AgIqo70yZ1n7UTJR7CiUdmCaLG0E03/qnaFUfttJqQ
CGGew5eHLIg83Frbx3+Ksg+G01emakM5YoT0lGHe/sL80Iz+VZAMldIsWxBJ9U6y
bArvV1dFuXik6ZqYfTQ05KhtY1SfCisXl2BuzxPFSFyMJBPiZS/n2QFFAu3KoNTa
EKA0I73nytEMoBsk/RmcJdU1wRMI7YgJlkjjIRH/YhzjHJfccyfBP53UemiEo4mV
ybb+/IqXhUqW3HQk4BYrovTMw2HaLknvR/C7Lz1PdVvOFWX9cStytD9JHZM3XGcn
PGcDHALBksgsIhgZaos55MgWPPdxwRA6VR0pQTaOzg52vuHShZKjgzQbKzlYLMfb
UzkEpRbJycI212XVJdwVGH+JhvIr+fd13yjd0RQbdEVUqnIzTBmUTW/CO3kX36Go
AMmGEg8UEHtZtJqzdtIXNJ9/Ef6iLVXxCNQ4pz6EzSOdKbotE2pUS+jOshcNJlFk
c3ePBJQ3DtKEWsFh3yGtH5Kg/m/LddhUeVoIMTmSlrz73vDecD2IASEE+of8Mho8
7y3+c/PqBfzyfPYVaqEFlO+//llf5xDeRLHXOW8Mm1BtIrMgyD/401KD4wj/63By
bLyO2NRg/FXI4kXtQFjBLq7wLmPxujL+S89RolLYMPbbbkxSlsQ=
=6VfK
-----END PGP SIGNATURE-----

--klltttveuxmaguyk--
