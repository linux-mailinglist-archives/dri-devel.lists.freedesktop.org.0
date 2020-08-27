Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 970DA2541E2
	for <lists+dri-devel@lfdr.de>; Thu, 27 Aug 2020 11:20:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE95A6EB41;
	Thu, 27 Aug 2020 09:20:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B6F76EB41
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Aug 2020 09:20:36 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id C446CB70C;
 Thu, 27 Aug 2020 09:21:06 +0000 (UTC)
Subject: Re: [PATCH] drm/hisilicon: Removed the dependency on the mmu
To: Tian Tao <tiantao6@hisilicon.com>, airlied@linux.ie, daniel@ffwll.ch,
 kraxel@redhat.com, alexander.deucher@amd.com, tglx@linutronix.de,
 dri-devel@lists.freedesktop.org, xinliang.liu@linaro.org,
 linux-kernel@vger.kernel.org
References: <1598428528-49046-1-git-send-email-tiantao6@hisilicon.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
Message-ID: <6f0110db-e99c-f3aa-7384-0c94b103df46@suse.de>
Date: Thu, 27 Aug 2020 11:20:33 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <1598428528-49046-1-git-send-email-tiantao6@hisilicon.com>
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
Cc: linuxarm@huawei.com
Content-Type: multipart/mixed; boundary="===============0148811866=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============0148811866==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="KULVXC8S39wiYcq8slr4cOQpojIehEohB"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--KULVXC8S39wiYcq8slr4cOQpojIehEohB
Content-Type: multipart/mixed; boundary="qbNIdt43Js2p80Ombq6tt2QVpDl3hq9xC";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Tian Tao <tiantao6@hisilicon.com>, airlied@linux.ie, daniel@ffwll.ch,
 kraxel@redhat.com, alexander.deucher@amd.com, tglx@linutronix.de,
 dri-devel@lists.freedesktop.org, xinliang.liu@linaro.org,
 linux-kernel@vger.kernel.org
Cc: linuxarm@huawei.com
Message-ID: <6f0110db-e99c-f3aa-7384-0c94b103df46@suse.de>
Subject: Re: [PATCH] drm/hisilicon: Removed the dependency on the mmu
References: <1598428528-49046-1-git-send-email-tiantao6@hisilicon.com>
In-Reply-To: <1598428528-49046-1-git-send-email-tiantao6@hisilicon.com>

--qbNIdt43Js2p80Ombq6tt2QVpDl3hq9xC
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi

Am 26.08.20 um 09:55 schrieb Tian Tao:
> hibmc can only be used in ARM64 architectures, and mmu defaults to y
> in arch/arm64/Kconfig, so there is no need to add a dependency on mmu
> in hibmc's kconfig.
>=20
> Signed-off-by: Tian Tao <tiantao6@hisilicon.com>

Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>

> ---
>  drivers/gpu/drm/hisilicon/hibmc/Kconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/hisilicon/hibmc/Kconfig b/drivers/gpu/drm/=
hisilicon/hibmc/Kconfig
> index dfc5aef..43943e9 100644
> --- a/drivers/gpu/drm/hisilicon/hibmc/Kconfig
> +++ b/drivers/gpu/drm/hisilicon/hibmc/Kconfig
> @@ -1,7 +1,7 @@
>  # SPDX-License-Identifier: GPL-2.0-only
>  config DRM_HISI_HIBMC
>  	tristate "DRM Support for Hisilicon Hibmc"
> -	depends on DRM && PCI && MMU && ARM64
> +	depends on DRM && PCI && ARM64
>  	select DRM_KMS_HELPER
>  	select DRM_VRAM_HELPER
>  	select DRM_TTM
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--qbNIdt43Js2p80Ombq6tt2QVpDl3hq9xC--

--KULVXC8S39wiYcq8slr4cOQpojIehEohB
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQFIBAEBCAAyFiEEchf7rIzpz2NEoWjlaA3BHVMLeiMFAl9HeuEUHHR6aW1tZXJt
YW5uQHN1c2UuZGUACgkQaA3BHVMLeiNVLQgAhJP85eJllBaaDomuKaFMd771xpMM
oAASYd3aocuf0yMRW+VUsOKP93l0FrRCdgMX5PkcuUpUMfpRvX0z583IMjcKXP90
Kcf9wSiTr6UfFfMBWsCXpxwg6KbDJsDBO3D1cRWwhN0zU9ZI7Q/5yfiYT9/iZVY+
zxJJHzfxT+Mob59phfY1MVQJppLbQdtJAKyK4EU0o1FBC7EL6/TK4vvH8k1Hj7ts
rVPjaZRxUqmZnsgJRyrIEEqzHctiU71JMwjsWlKjfbcwnOONIdPKOhYakDQhyeyt
Fo0jACY0wr5e3qfIEuRWFCT98aeP1co/S4dhrIBPvwpGFDXh3Bw0HfeWog==
=rU1j
-----END PGP SIGNATURE-----

--KULVXC8S39wiYcq8slr4cOQpojIehEohB--

--===============0148811866==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0148811866==--
