Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6206D175BFF
	for <lists+dri-devel@lfdr.de>; Mon,  2 Mar 2020 14:44:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5FEA46E29D;
	Mon,  2 Mar 2020 13:44:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A7186E296;
 Mon,  2 Mar 2020 13:44:51 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 49FA1ACAE;
 Mon,  2 Mar 2020 13:44:48 +0000 (UTC)
Subject: Re: [PATCH 1/9] drm: Remove unused arg from drm_fb_helper_init
To: Pankaj Bharadiya <pankaj.laxminarayan.bharadiya@intel.com>,
 jani.nikula@linux.intel.com, daniel@ffwll.ch,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 "David (ChunMing) Zhou" <David1.Zhou@amd.com>,
 David Airlie <airlied@linux.ie>, Russell King <linux@armlinux.org.uk>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Inki Dae <inki.dae@samsung.com>,
 Joonyoung Shim <jy0922.shim@samsung.com>,
 Seung-Woo Kim <sw0312.kim@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>, Kukjin Kim <kgene@kernel.org>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Patrik Jakobsson <patrik.r.jakobsson@gmail.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>, Ben Skeggs <bskeggs@redhat.com>,
 Tomi Valkeinen <tomi.valkeinen@ti.com>, Sandy Huang <hjc@rock-chips.com>,
 =?UTF-8?Q?Heiko_St=c3=bcbner?= <heiko@sntech.de>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
 Emil Velikov <emil.velikov@collabora.com>,
 Andrey Grodzovsky <andrey.grodzovsky@amd.com>,
 Sam Ravnborg <sam@ravnborg.org>, Chris Wilson <chris@chris-wilson.co.uk>,
 =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>,
 Matthew Auld <matthew.auld@intel.com>
References: <20200302125649.61443-1-pankaj.laxminarayan.bharadiya@intel.com>
 <20200302125649.61443-2-pankaj.laxminarayan.bharadiya@intel.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
Autocrypt: addr=tzimmermann@suse.de; keydata=
 mQENBFs50uABCADEHPidWt974CaxBVbrIBwqcq/WURinJ3+2WlIrKWspiP83vfZKaXhFYsdg
 XH47fDVbPPj+d6tQrw5lPQCyqjwrCPYnq3WlIBnGPJ4/jreTL6V+qfKRDlGLWFjZcsrPJGE0
 BeB5BbqP5erN1qylK9i3gPoQjXGhpBpQYwRrEyQyjuvk+Ev0K1Jc5tVDeJAuau3TGNgah4Yc
 hdHm3bkPjz9EErV85RwvImQ1dptvx6s7xzwXTgGAsaYZsL8WCwDaTuqFa1d1jjlaxg6+tZsB
 9GluwvIhSezPgnEmimZDkGnZRRSFiGP8yjqTjjWuf0bSj5rUnTGiyLyRZRNGcXmu6hjlABEB
 AAG0J1Rob21hcyBaaW1tZXJtYW5uIDx0emltbWVybWFubkBzdXNlLmRlPokBVAQTAQgAPhYh
 BHIX+6yM6c9jRKFo5WgNwR1TC3ojBQJbOdLgAhsDBQkDwmcABQsJCAcCBhUKCQgLAgQWAgMB
 Ah4BAheAAAoJEGgNwR1TC3ojR80H/jH+vYavwQ+TvO8ksXL9JQWc3IFSiGpuSVXLCdg62AmR
 irxW+qCwNncNQyb9rd30gzdectSkPWL3KSqEResBe24IbA5/jSkPweJasgXtfhuyoeCJ6PXo
 clQQGKIoFIAEv1s8l0ggPZswvCinegl1diyJXUXmdEJRTWYAtxn/atut1o6Giv6D2qmYbXN7
 mneMC5MzlLaJKUtoH7U/IjVw1sx2qtxAZGKVm4RZxPnMCp9E1MAr5t4dP5gJCIiqsdrVqI6i
 KupZstMxstPU//azmz7ZWWxT0JzgJqZSvPYx/SATeexTYBP47YFyri4jnsty2ErS91E6H8os
 Bv6pnSn7eAq5AQ0EWznS4AEIAMYmP4M/V+T5RY5at/g7rUdNsLhWv1APYrh9RQefODYHrNRH
 UE9eosYbT6XMryR9hT8XlGOYRwKWwiQBoWSDiTMo/Xi29jUnn4BXfI2px2DTXwc22LKtLAgT
 RjP+qbU63Y0xnQN29UGDbYgyyK51DW3H0If2a3JNsheAAK+Xc9baj0LGIc8T9uiEWHBnCH+R
 dhgATnWWGKdDegUR5BkDfDg5O/FISymJBHx2Dyoklv5g4BzkgqTqwmaYzsl8UxZKvbaxq0zb
 ehDda8lvhFXodNFMAgTLJlLuDYOGLK2AwbrS3Sp0AEbkpdJBb44qVlGm5bApZouHeJ/+n+7r
 12+lqdsAEQEAAYkBPAQYAQgAJhYhBHIX+6yM6c9jRKFo5WgNwR1TC3ojBQJbOdLgAhsMBQkD
 wmcAAAoJEGgNwR1TC3ojpfcIAInwP5OlcEKokTnHCiDTz4Ony4GnHRP2fXATQZCKxmu4AJY2
 h9ifw9Nf2TjCZ6AMvC3thAN0rFDj55N9l4s1CpaDo4J+0fkrHuyNacnT206CeJV1E7NYntxU
 n+LSiRrOdywn6erjxRi9EYTVLCHcDhBEjKmFZfg4AM4GZMWX1lg0+eHbd5oL1as28WvvI/uI
 aMyV8RbyXot1r/8QLlWldU3NrTF5p7TMU2y3ZH2mf5suSKHAMtbE4jKJ8ZHFOo3GhLgjVrBW
 HE9JXO08xKkgD+w6v83+nomsEuf6C6LYrqY/tsZvyEX6zN8CtirPdPWu/VXNRYAl/lat7lSI
 3H26qrE=
Message-ID: <0bd2ca42-399c-e840-9561-3416e5ddf399@suse.de>
Date: Mon, 2 Mar 2020 14:44:39 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200302125649.61443-2-pankaj.laxminarayan.bharadiya@intel.com>
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
Content-Type: multipart/mixed; boundary="===============1421980428=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============1421980428==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="7ojGdfS7GJoXfuQ6z4Lrtl5yONdyVDB0d"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--7ojGdfS7GJoXfuQ6z4Lrtl5yONdyVDB0d
Content-Type: multipart/mixed; boundary="rO31zXQHkxWodpx3dV9j6Bsv5TMazDcHy";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Pankaj Bharadiya <pankaj.laxminarayan.bharadiya@intel.com>,
 jani.nikula@linux.intel.com, daniel@ffwll.ch,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 "David (ChunMing) Zhou" <David1.Zhou@amd.com>,
 David Airlie <airlied@linux.ie>, Russell King <linux@armlinux.org.uk>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Inki Dae <inki.dae@samsung.com>,
 Joonyoung Shim <jy0922.shim@samsung.com>,
 Seung-Woo Kim <sw0312.kim@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>, Kukjin Kim <kgene@kernel.org>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Patrik Jakobsson <patrik.r.jakobsson@gmail.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>, Ben Skeggs <bskeggs@redhat.com>,
 Tomi Valkeinen <tomi.valkeinen@ti.com>, Sandy Huang <hjc@rock-chips.com>,
 =?UTF-8?Q?Heiko_St=c3=bcbner?= <heiko@sntech.de>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
 Emil Velikov <emil.velikov@collabora.com>,
 Andrey Grodzovsky <andrey.grodzovsky@amd.com>,
 Sam Ravnborg <sam@ravnborg.org>, Chris Wilson <chris@chris-wilson.co.uk>,
 =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>,
 Matthew Auld <matthew.auld@intel.com>
Message-ID: <0bd2ca42-399c-e840-9561-3416e5ddf399@suse.de>
Subject: Re: [PATCH 1/9] drm: Remove unused arg from drm_fb_helper_init
References: <20200302125649.61443-1-pankaj.laxminarayan.bharadiya@intel.com>
 <20200302125649.61443-2-pankaj.laxminarayan.bharadiya@intel.com>
In-Reply-To: <20200302125649.61443-2-pankaj.laxminarayan.bharadiya@intel.com>

--rO31zXQHkxWodpx3dV9j6Bsv5TMazDcHy
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi

Am 02.03.20 um 13:56 schrieb Pankaj Bharadiya:
> The max connector argument for drm_fb_helper_init() isn't used anymore
> hence remove it.
>=20
> All the drm_fb_helper_init() calls are modified with below sementic
> patch.
>=20
> @@
> expression E1, E2, E3;
> @@
> -  drm_fb_helper_init(E1,E2, E3)
> +  drm_fb_helper_init(E1,E2)
>=20
> Signed-off-by: Pankaj Bharadiya <pankaj.laxminarayan.bharadiya@intel.co=
m>

Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>

> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_fb.c        | 3 +--
>  drivers/gpu/drm/armada/armada_fbdev.c         | 2 +-
>  drivers/gpu/drm/drm_fb_helper.c               | 6 ++----
>  drivers/gpu/drm/exynos/exynos_drm_fbdev.c     | 2 +-
>  drivers/gpu/drm/gma500/framebuffer.c          | 2 +-
>  drivers/gpu/drm/i915/display/intel_fbdev.c    | 2 +-
>  drivers/gpu/drm/msm/msm_fbdev.c               | 2 +-
>  drivers/gpu/drm/nouveau/nouveau_fbcon.c       | 2 +-
>  drivers/gpu/drm/omapdrm/omap_fbdev.c          | 2 +-
>  drivers/gpu/drm/radeon/radeon_fb.c            | 3 +--
>  drivers/gpu/drm/rockchip/rockchip_drm_fbdev.c | 2 +-
>  drivers/gpu/drm/tegra/fb.c                    | 2 +-
>  include/drm/drm_fb_helper.h                   | 6 ++----
>  13 files changed, 15 insertions(+), 21 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_fb.c b/drivers/gpu/drm/a=
md/amdgpu/amdgpu_fb.c
> index 2672dc64a310..579d614c7b70 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_fb.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_fb.c
> @@ -336,8 +336,7 @@ int amdgpu_fbdev_init(struct amdgpu_device *adev)
>  	drm_fb_helper_prepare(adev->ddev, &rfbdev->helper,
>  			&amdgpu_fb_helper_funcs);
> =20
> -	ret =3D drm_fb_helper_init(adev->ddev, &rfbdev->helper,
> -				 AMDGPUFB_CONN_LIMIT);
> +	ret =3D drm_fb_helper_init(adev->ddev, &rfbdev->helper);
>  	if (ret) {
>  		kfree(rfbdev);
>  		return ret;
> diff --git a/drivers/gpu/drm/armada/armada_fbdev.c b/drivers/gpu/drm/ar=
mada/armada_fbdev.c
> index ac8a78bfda03..6254353c00ae 100644
> --- a/drivers/gpu/drm/armada/armada_fbdev.c
> +++ b/drivers/gpu/drm/armada/armada_fbdev.c
> @@ -129,7 +129,7 @@ int armada_fbdev_init(struct drm_device *dev)
> =20
>  	drm_fb_helper_prepare(dev, fbh, &armada_fb_helper_funcs);
> =20
> -	ret =3D drm_fb_helper_init(dev, fbh, 1);
> +	ret =3D drm_fb_helper_init(dev, fbh);
>  	if (ret) {
>  		DRM_ERROR("failed to initialize drm fb helper\n");
>  		goto err_fb_helper;
> diff --git a/drivers/gpu/drm/drm_fb_helper.c b/drivers/gpu/drm/drm_fb_h=
elper.c
> index 490a99de6ec1..a9771de4d17e 100644
> --- a/drivers/gpu/drm/drm_fb_helper.c
> +++ b/drivers/gpu/drm/drm_fb_helper.c
> @@ -450,7 +450,6 @@ EXPORT_SYMBOL(drm_fb_helper_prepare);
>   * drm_fb_helper_init - initialize a &struct drm_fb_helper
>   * @dev: drm device
>   * @fb_helper: driver-allocated fbdev helper structure to initialize
> - * @max_conn_count: max connector count (not used)
>   *
>   * This allocates the structures for the fbdev helper with the given l=
imits.
>   * Note that this won't yet touch the hardware (through the driver int=
erfaces)
> @@ -463,8 +462,7 @@ EXPORT_SYMBOL(drm_fb_helper_prepare);
>   * Zero if everything went ok, nonzero otherwise.
>   */
>  int drm_fb_helper_init(struct drm_device *dev,
> -		       struct drm_fb_helper *fb_helper,
> -		       int max_conn_count)
> +		       struct drm_fb_helper *fb_helper)
>  {
>  	int ret;
> =20
> @@ -2125,7 +2123,7 @@ static int drm_fbdev_client_hotplug(struct drm_cl=
ient_dev *client)
> =20
>  	drm_fb_helper_prepare(dev, fb_helper, &drm_fb_helper_generic_funcs);
> =20
> -	ret =3D drm_fb_helper_init(dev, fb_helper, 0);
> +	ret =3D drm_fb_helper_init(dev, fb_helper);
>  	if (ret)
>  		goto err;
> =20
> diff --git a/drivers/gpu/drm/exynos/exynos_drm_fbdev.c b/drivers/gpu/dr=
m/exynos/exynos_drm_fbdev.c
> index 647a1fd1d815..5afecb6a30ad 100644
> --- a/drivers/gpu/drm/exynos/exynos_drm_fbdev.c
> +++ b/drivers/gpu/drm/exynos/exynos_drm_fbdev.c
> @@ -200,7 +200,7 @@ int exynos_drm_fbdev_init(struct drm_device *dev)
> =20
>  	drm_fb_helper_prepare(dev, helper, &exynos_drm_fb_helper_funcs);
> =20
> -	ret =3D drm_fb_helper_init(dev, helper, MAX_CONNECTOR);
> +	ret =3D drm_fb_helper_init(dev, helper);
>  	if (ret < 0) {
>  		DRM_DEV_ERROR(dev->dev,
>  			      "failed to initialize drm fb helper.\n");
> diff --git a/drivers/gpu/drm/gma500/framebuffer.c b/drivers/gpu/drm/gma=
500/framebuffer.c
> index 1459076d1980..fe892e1243db 100644
> --- a/drivers/gpu/drm/gma500/framebuffer.c
> +++ b/drivers/gpu/drm/gma500/framebuffer.c
> @@ -513,7 +513,7 @@ int psb_fbdev_init(struct drm_device *dev)
> =20
>  	drm_fb_helper_prepare(dev, fb_helper, &psb_fb_helper_funcs);
> =20
> -	ret =3D drm_fb_helper_init(dev, fb_helper, INTELFB_CONN_LIMIT);
> +	ret =3D drm_fb_helper_init(dev, fb_helper);
>  	if (ret)
>  		goto free;
> =20
> diff --git a/drivers/gpu/drm/i915/display/intel_fbdev.c b/drivers/gpu/d=
rm/i915/display/intel_fbdev.c
> index b6ee0d902003..8f65963266a3 100644
> --- a/drivers/gpu/drm/i915/display/intel_fbdev.c
> +++ b/drivers/gpu/drm/i915/display/intel_fbdev.c
> @@ -452,7 +452,7 @@ int intel_fbdev_init(struct drm_device *dev)
>  	if (!intel_fbdev_init_bios(dev, ifbdev))
>  		ifbdev->preferred_bpp =3D 32;
> =20
> -	ret =3D drm_fb_helper_init(dev, &ifbdev->helper, 4);
> +	ret =3D drm_fb_helper_init(dev, &ifbdev->helper);
>  	if (ret) {
>  		kfree(ifbdev);
>  		return ret;
> diff --git a/drivers/gpu/drm/msm/msm_fbdev.c b/drivers/gpu/drm/msm/msm_=
fbdev.c
> index db48867df47d..b4f44146d9de 100644
> --- a/drivers/gpu/drm/msm/msm_fbdev.c
> +++ b/drivers/gpu/drm/msm/msm_fbdev.c
> @@ -160,7 +160,7 @@ struct drm_fb_helper *msm_fbdev_init(struct drm_dev=
ice *dev)
> =20
>  	drm_fb_helper_prepare(dev, helper, &msm_fb_helper_funcs);
> =20
> -	ret =3D drm_fb_helper_init(dev, helper, priv->num_connectors);
> +	ret =3D drm_fb_helper_init(dev, helper);
>  	if (ret) {
>  		DRM_DEV_ERROR(dev->dev, "could not init fbdev: ret=3D%d\n", ret);
>  		goto fail;
> diff --git a/drivers/gpu/drm/nouveau/nouveau_fbcon.c b/drivers/gpu/drm/=
nouveau/nouveau_fbcon.c
> index 0c5cdda3c336..21fc7c63e2f7 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_fbcon.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_fbcon.c
> @@ -558,7 +558,7 @@ nouveau_fbcon_init(struct drm_device *dev)
> =20
>  	drm_fb_helper_prepare(dev, &fbcon->helper, &nouveau_fbcon_helper_func=
s);
> =20
> -	ret =3D drm_fb_helper_init(dev, &fbcon->helper, 4);
> +	ret =3D drm_fb_helper_init(dev, &fbcon->helper);
>  	if (ret)
>  		goto free;
> =20
> diff --git a/drivers/gpu/drm/omapdrm/omap_fbdev.c b/drivers/gpu/drm/oma=
pdrm/omap_fbdev.c
> index b06e5cbfd03a..eba57ac31cc6 100644
> --- a/drivers/gpu/drm/omapdrm/omap_fbdev.c
> +++ b/drivers/gpu/drm/omapdrm/omap_fbdev.c
> @@ -242,7 +242,7 @@ void omap_fbdev_init(struct drm_device *dev)
> =20
>  	drm_fb_helper_prepare(dev, helper, &omap_fb_helper_funcs);
> =20
> -	ret =3D drm_fb_helper_init(dev, helper, priv->num_pipes);
> +	ret =3D drm_fb_helper_init(dev, helper);
>  	if (ret)
>  		goto fail;
> =20
> diff --git a/drivers/gpu/drm/radeon/radeon_fb.c b/drivers/gpu/drm/radeo=
n/radeon_fb.c
> index ec0b7d6c994d..85548cf2529a 100644
> --- a/drivers/gpu/drm/radeon/radeon_fb.c
> +++ b/drivers/gpu/drm/radeon/radeon_fb.c
> @@ -354,8 +354,7 @@ int radeon_fbdev_init(struct radeon_device *rdev)
>  	drm_fb_helper_prepare(rdev->ddev, &rfbdev->helper,
>  			      &radeon_fb_helper_funcs);
> =20
> -	ret =3D drm_fb_helper_init(rdev->ddev, &rfbdev->helper,
> -				 RADEONFB_CONN_LIMIT);
> +	ret =3D drm_fb_helper_init(rdev->ddev, &rfbdev->helper);
>  	if (ret)
>  		goto free;
> =20
> diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_fbdev.c b/drivers/gp=
u/drm/rockchip/rockchip_drm_fbdev.c
> index 521fe42ac5e2..6ad4cce17089 100644
> --- a/drivers/gpu/drm/rockchip/rockchip_drm_fbdev.c
> +++ b/drivers/gpu/drm/rockchip/rockchip_drm_fbdev.c
> @@ -124,7 +124,7 @@ int rockchip_drm_fbdev_init(struct drm_device *dev)=

> =20
>  	drm_fb_helper_prepare(dev, helper, &rockchip_drm_fb_helper_funcs);
> =20
> -	ret =3D drm_fb_helper_init(dev, helper, ROCKCHIP_MAX_CONNECTOR);
> +	ret =3D drm_fb_helper_init(dev, helper);
>  	if (ret < 0) {
>  		DRM_DEV_ERROR(dev->dev,
>  			      "Failed to initialize drm fb helper - %d.\n",
> diff --git a/drivers/gpu/drm/tegra/fb.c b/drivers/gpu/drm/tegra/fb.c
> index 84f0e01e3428..feefe62be8dd 100644
> --- a/drivers/gpu/drm/tegra/fb.c
> +++ b/drivers/gpu/drm/tegra/fb.c
> @@ -314,7 +314,7 @@ static int tegra_fbdev_init(struct tegra_fbdev *fbd=
ev,
>  	struct drm_device *drm =3D fbdev->base.dev;
>  	int err;
> =20
> -	err =3D drm_fb_helper_init(drm, &fbdev->base, max_connectors);
> +	err =3D drm_fb_helper_init(drm, &fbdev->base);
>  	if (err < 0) {
>  		dev_err(drm->dev, "failed to initialize DRM FB helper: %d\n",
>  			err);
> diff --git a/include/drm/drm_fb_helper.h b/include/drm/drm_fb_helper.h
> index 1c6633da0f91..62e8dda6d1d1 100644
> --- a/include/drm/drm_fb_helper.h
> +++ b/include/drm/drm_fb_helper.h
> @@ -213,8 +213,7 @@ drm_fb_helper_from_client(struct drm_client_dev *cl=
ient)
>  #ifdef CONFIG_DRM_FBDEV_EMULATION
>  void drm_fb_helper_prepare(struct drm_device *dev, struct drm_fb_helpe=
r *helper,
>  			   const struct drm_fb_helper_funcs *funcs);
> -int drm_fb_helper_init(struct drm_device *dev,
> -		       struct drm_fb_helper *helper, int max_conn);
> +int drm_fb_helper_init(struct drm_device *dev, struct drm_fb_helper *h=
elper);
>  void drm_fb_helper_fini(struct drm_fb_helper *helper);
>  int drm_fb_helper_blank(int blank, struct fb_info *info);
>  int drm_fb_helper_pan_display(struct fb_var_screeninfo *var,
> @@ -279,8 +278,7 @@ static inline void drm_fb_helper_prepare(struct drm=
_device *dev,
>  }
> =20
>  static inline int drm_fb_helper_init(struct drm_device *dev,
> -		       struct drm_fb_helper *helper,
> -		       int max_conn)
> +		       struct drm_fb_helper *helper)
>  {
>  	/* So drivers can use it to free the struct */
>  	helper->dev =3D dev;
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--rO31zXQHkxWodpx3dV9j6Bsv5TMazDcHy--

--7ojGdfS7GJoXfuQ6z4Lrtl5yONdyVDB0d
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEchf7rIzpz2NEoWjlaA3BHVMLeiMFAl5dDccACgkQaA3BHVML
eiNyCwf9EVb7F2BCp3tMCaJLK1MCZ7RPdpIunUROBfxakI+uJLsKJltHbZkVi1Ww
whLS6RTC1bq/t7iAh4/N+u+6/mrTMB5nnyu1KAen/xvMd2lv/AEQ/bOYh4Z+0Vcc
ygZFR//StZF8EQGca55do3bu9Uccaheh7QoB8rkNf9YKuYlcS8X+lzSG1NyBnCrm
4NJ1IXy/0WpaDJp1Q9pkE7vdigsloZ1X5g70VYKgkLTVYVx6RCZ0074q/hSd60MD
+zLWf9FgeBBb1V6jwh6A2mSnELcJGu//ML13uxuDBORKTq3mLQgMwjoJifrsq9ZO
+zdrMP7Apd6Q74x85HmAR4bzQrQR8Q==
=peoN
-----END PGP SIGNATURE-----

--7ojGdfS7GJoXfuQ6z4Lrtl5yONdyVDB0d--

--===============1421980428==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1421980428==--
