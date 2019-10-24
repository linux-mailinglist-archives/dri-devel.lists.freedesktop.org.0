Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D5592E3167
	for <lists+dri-devel@lfdr.de>; Thu, 24 Oct 2019 13:50:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 03C1D6E2FF;
	Thu, 24 Oct 2019 11:50:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CED7A6E2FF
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Oct 2019 11:50:23 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id g7so2482256wmk.4
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Oct 2019 04:50:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=dTaYwp4qZXlJvMAwS4iXKftIgoAUkmfWWcCon6/YMJg=;
 b=SxJFUfg1yliVQKgL14g45myVmEHrH4zIP9IsWHutJB7oXIrJqk4tXSRxzOGi7Vk30K
 Cd9zPmsI5Tv9iduTgwnCwx7nxgN4CpHSGYr2lsZF6l1JuxqLgbHpMrCyrJwSnnOg234s
 Fp4pd2wjTzBLai0G4p2fV3XxrJpwP5mAbxvy+ef1mYrn91YVO+1z6wVPGcColWxvRhMq
 ivZMn6GCivf3yhH+ntyN51wQyCKgYP5g9SvkDCFrNiNbJlTc2WfO4hJarIp/SPPGXK3U
 JxPQKaOIt0b3E9FK+mU7TglIcloTAObKoYTCK9yPs+q/t2/klLXYKcU0ECruqbIv0kUb
 3OYQ==
X-Gm-Message-State: APjAAAXAtjSgx0t5SNXacpRUrPkAEhp98a05RgXsynRAMp7HW/iQQUy9
 6A3FtlbNjBD1cMAO/84C968=
X-Google-Smtp-Source: APXvYqxBPbJJRTAt4tbFmXMSYKLVZkQ5Z1Ry8t3R4o4pNtsOWPojoX4Y8SURN7kbq91D+f3FQ1WfZA==
X-Received: by 2002:a05:600c:22ce:: with SMTP id
 14mr4396831wmg.71.1571917822265; 
 Thu, 24 Oct 2019 04:50:22 -0700 (PDT)
Received: from localhost (p2E5BE2CE.dip0.t-ipconnect.de. [46.91.226.206])
 by smtp.gmail.com with ESMTPSA id z189sm2833364wmc.25.2019.10.24.04.50.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Oct 2019 04:50:17 -0700 (PDT)
Date: Thu, 24 Oct 2019 13:50:16 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH v1 1/3] gpu: host1x: Remove implicit IOMMU backing on
 client's registration
Message-ID: <20191024115016.GA2924027@ulmo>
References: <20190623173743.24088-1-digetx@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20190623173743.24088-1-digetx@gmail.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=dTaYwp4qZXlJvMAwS4iXKftIgoAUkmfWWcCon6/YMJg=;
 b=aDgBQuLIIoqRlDd/Y3c+xWyM81CmMvlByTYclS93SsJVQqIN3nLJgUrH0S4PieBKXN
 k1rVnqdVpgKOU2/ITuTKF24yvCDzfJJKxiT7Po/KlGPbqtGOnLfYT+kgGePav63jbt14
 jh8QYj907cxiRu77a8sIMb493q3bRcaQ2AukPvb3gn1Dzc8q9r6VInJpD29NRcUK3VKi
 /8Uq1MWtRQFwmdWW2LPoK5LCD9ggyfvmiM16AWwEW0STET0e7v8+j3ADnGlwcn48dyiV
 k71jwi+/8YqM9KkRYfwmd/V4VepIlP+s4w3pGemdpRgoy2gAQV2SD+JqdCoT6QOBOWbV
 CmFQ==
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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
Cc: linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============2107129195=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============2107129195==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="bp/iNruPH9dso1Pn"
Content-Disposition: inline


--bp/iNruPH9dso1Pn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Jun 23, 2019 at 08:37:41PM +0300, Dmitry Osipenko wrote:
> On ARM32 we don't want any of the clients device to be backed by the
> implicit domain, simply because we can't afford such a waste on older
> Tegra SoCs that have very few domains available in total. The recent IOMMU
> support addition for the Video Decoder hardware uncovered the problem
> that an unfortunate drivers probe order results in the DRM driver probe
> failure if CONFIG_ARM_DMA_USE_IOMMU=3Dy due to a shortage of IOMMU domains
> caused by the implicit backing. The host1x_client_register() is a common
> function that is invoked by all of the relevant DRM drivers during theirs
> probe and hence it is convenient to remove the implicit backing there,
> resolving the problem.
>=20
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  drivers/gpu/host1x/bus.c | 19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)

I don't really want to do this in a central place like this. If we
really do need this, why can't we do it in the individual drivers? Also,
we already call host1x_client_iommu_attach() from all the drivers and
that detaches from the IOMMU as well. So I'm not sure I understand why
this is needed.

Thierry

>=20
> diff --git a/drivers/gpu/host1x/bus.c b/drivers/gpu/host1x/bus.c
> index 742aa9ff21b8..559df3974afb 100644
> --- a/drivers/gpu/host1x/bus.c
> +++ b/drivers/gpu/host1x/bus.c
> @@ -14,6 +14,10 @@
>  #include "bus.h"
>  #include "dev.h"
> =20
> +#if IS_ENABLED(CONFIG_ARM_DMA_USE_IOMMU)
> +#include <asm/dma-iommu.h>
> +#endif
> +
>  static DEFINE_MUTEX(clients_lock);
>  static LIST_HEAD(clients);
> =20
> @@ -710,6 +714,21 @@ int host1x_client_register(struct host1x_client *cli=
ent)
>  	struct host1x *host1x;
>  	int err;
> =20
> +#if IS_ENABLED(CONFIG_ARM_DMA_USE_IOMMU)
> +	/*
> +	 * The client's driver could be backed by implicit IOMMU mapping
> +	 * and we don't want to have that because all of current Tegra
> +	 * drivers are managing IOMMU by themselves. This is a convenient
> +	 * place for unmapping of the implicit mapping because this function
> +	 * is called by all host1x drivers during theirs probe.
> +	 */
> +	if (client->dev->archdata.mapping) {
> +		struct dma_iommu_mapping *mapping =3D
> +			to_dma_iommu_mapping(client->dev);
> +		arm_iommu_detach_device(client->dev);
> +		arm_iommu_release_mapping(mapping);
> +	}
> +#endif
>  	mutex_lock(&devices_lock);
> =20
>  	list_for_each_entry(host1x, &devices, list) {
> --=20
> 2.22.0
>=20

--bp/iNruPH9dso1Pn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl2xj/UACgkQ3SOs138+
s6HkpA//YOpfeYtP6xh+CQ5j2ZbD2rIvdDo20CunZvL5l67FbNp+cPfNZ5Pi6oZ2
dkOn/d+D9+xSOA5ix6QA4/wz2wb0mzpw/FKv45y09hWl9znqrdB6SNiZPXIewFp7
/CPbN/7MsZOA/s8VO2oJV/iDXjp7RHMXQANRe2myanv/PMcP9MNNtv192rQoevkS
Co1WCPbmJjeGIe0Cv+nBtqc53+YW6zb4vNKzLQ9l3aE6AZW61C3rS65y0bhdqCYh
yYr7Rfd3lagKZbBoLShqMDijO/OntWsoPb2aqHOfJrRwYEzrgquhfkGyzxEYlOZz
O9eAxL0bO8R9hswcUAh2pNyYqpWDPA/97JffHDV71xvyQUzqgSACi0+3p1mQrVfz
6sCx8c0pJ3OesuZIQBWjdyNAgJXoKeGTlg/GKO2U2uu2PBbqQLRtagQnwkL+VJ4b
YD8OWcrtwjcFWxsqYesZecAi359jdNWsvtnaJxbyFtsXPmldBq7u8/aKskbCSfDZ
GgvaJlk9BTRYeU7gGVS30s4gY0SIwNmt5oDQ3VzaEGuwHDDzdt8+JMT97LmfDq5S
mFD7sDlfoGAAI8TQBaqFVP3lJ0n65bN24Nye1z9zDE13Yb+mmylyB7wsXw2J/JZr
N6PjGf93wqnopXfUpDU7r+CoC/VOLHuou6CNipxhKA+bbslRKrk=
=/3Lb
-----END PGP SIGNATURE-----

--bp/iNruPH9dso1Pn--

--===============2107129195==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============2107129195==--
