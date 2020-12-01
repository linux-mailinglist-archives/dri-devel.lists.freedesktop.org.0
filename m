Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CD70E2CA2C4
	for <lists+dri-devel@lfdr.de>; Tue,  1 Dec 2020 13:36:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 789B789CAD;
	Tue,  1 Dec 2020 12:36:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5942989CAD
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Dec 2020 12:36:26 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id D5DB0ACC0;
 Tue,  1 Dec 2020 12:36:24 +0000 (UTC)
Subject: Re: [PATCH drm/hisilicon v2 1/4] drm/hisilicon: Assgin local variable
 to drm_device
To: "tiantao (H)" <tiantao6@huawei.com>, Tian Tao <tiantao6@hisilicon.com>,
 airlied@linux.ie, daniel@ffwll.ch, kraxel@redhat.com,
 alexander.deucher@amd.com, tglx@linutronix.de,
 dri-devel@lists.freedesktop.org, xinliang.liu@linaro.org,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org
References: <1606823754-52451-1-git-send-email-tiantao6@hisilicon.com>
 <1606823754-52451-2-git-send-email-tiantao6@hisilicon.com>
 <fc644426-67db-7128-5f73-8630373ab0e8@suse.de>
 <3f235e08-bb58-be41-8e92-ccd2dfd68b33@huawei.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
Message-ID: <389548c9-772c-d86b-700e-032f7d7bde1f@suse.de>
Date: Tue, 1 Dec 2020 13:36:22 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <3f235e08-bb58-be41-8e92-ccd2dfd68b33@huawei.com>
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
Cc: linux-kernel@vger.kernel.org
Content-Type: multipart/mixed; boundary="===============1720599392=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============1720599392==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="x2d7DFiRiPY134QtF4u86i5nmflirnT5p"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--x2d7DFiRiPY134QtF4u86i5nmflirnT5p
Content-Type: multipart/mixed; boundary="woR6XCC6iBKuSAIfUoOJlpIefUmfLp1dm";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: "tiantao (H)" <tiantao6@huawei.com>, Tian Tao <tiantao6@hisilicon.com>,
 airlied@linux.ie, daniel@ffwll.ch, kraxel@redhat.com,
 alexander.deucher@amd.com, tglx@linutronix.de,
 dri-devel@lists.freedesktop.org, xinliang.liu@linaro.org,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org
Cc: linux-kernel@vger.kernel.org
Message-ID: <389548c9-772c-d86b-700e-032f7d7bde1f@suse.de>
Subject: Re: [PATCH drm/hisilicon v2 1/4] drm/hisilicon: Assgin local variable
 to drm_device
References: <1606823754-52451-1-git-send-email-tiantao6@hisilicon.com>
 <1606823754-52451-2-git-send-email-tiantao6@hisilicon.com>
 <fc644426-67db-7128-5f73-8630373ab0e8@suse.de>
 <3f235e08-bb58-be41-8e92-ccd2dfd68b33@huawei.com>
In-Reply-To: <3f235e08-bb58-be41-8e92-ccd2dfd68b33@huawei.com>

--woR6XCC6iBKuSAIfUoOJlpIefUmfLp1dm
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi

Am 01.12.20 um 13:26 schrieb tiantao (H):
>=20
>=20
> =E5=9C=A8 2020/12/1 20:17, Thomas Zimmermann =E5=86=99=E9=81=93:
>> Hi
>>
>> Am 01.12.20 um 12:55 schrieb Tian Tao:
>>> Assign local variable to struct drm_device *dev because they are
>>> used multiple times within a function.
>>>
>>> Signed-off-by: Tian Tao <tiantao6@hisilicon.com>
>>> ---
>>> =C2=A0 drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_de.c=C2=A0=C2=A0 |=C2=
=A0 2 +-
>>> =C2=A0 drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c=C2=A0 | 30=20
>>> ++++++++++++------------
>>> =C2=A0 drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.h=C2=A0 |=C2=A0 =
2 +-
>>> =C2=A0 drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_vdac.c |=C2=A0 2 +-
>>> =C2=A0 drivers/gpu/drm/hisilicon/hibmc/hibmc_ttm.c=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 |=C2=A0 8 ++++---
>>> =C2=A0 5 files changed, 23 insertions(+), 21 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_de.c=20
>>> b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_de.c
>>> index ea962ac..096eea9 100644
>>> --- a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_de.c
>>> +++ b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_de.c
>>> @@ -499,7 +499,7 @@ static const struct drm_crtc_helper_funcs=20
>>> hibmc_crtc_helper_funcs =3D {
>>> =C2=A0 int hibmc_de_init(struct hibmc_drm_private *priv)
>>> =C2=A0 {
>>> -=C2=A0=C2=A0=C2=A0 struct drm_device *dev =3D priv->dev;
>>> +=C2=A0=C2=A0=C2=A0 struct drm_device *dev =3D &priv->dev;
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct drm_crtc *crtc =3D &priv->crtc;=

>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct drm_plane *plane =3D &priv->pri=
mary_plane;
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 int ret;
>>> diff --git a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c=20
>>> b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c
>>> index d845657..dd9fadc 100644
>>> --- a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c
>>> +++ b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c
>>> @@ -79,31 +79,32 @@ static const struct dev_pm_ops hibmc_pm_ops =3D {=

>>> =C2=A0 static int hibmc_kms_init(struct hibmc_drm_private *priv)
>>> =C2=A0 {
>>> +=C2=A0=C2=A0=C2=A0 struct drm_device *dev =3D &priv->dev;
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 int ret;
>>> -=C2=A0=C2=A0=C2=A0 drm_mode_config_init(priv->dev);
>>> +=C2=A0=C2=A0=C2=A0 drm_mode_config_init(dev);
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 priv->mode_config_initialized =3D true=
;
>>> -=C2=A0=C2=A0=C2=A0 priv->dev->mode_config.min_width =3D 0;
>>> -=C2=A0=C2=A0=C2=A0 priv->dev->mode_config.min_height =3D 0;
>>> -=C2=A0=C2=A0=C2=A0 priv->dev->mode_config.max_width =3D 1920;
>>> -=C2=A0=C2=A0=C2=A0 priv->dev->mode_config.max_height =3D 1200;
>>> +=C2=A0=C2=A0=C2=A0 dev->mode_config.min_width =3D 0;
>>> +=C2=A0=C2=A0=C2=A0 dev->mode_config.min_height =3D 0;
>>> +=C2=A0=C2=A0=C2=A0 dev->mode_config.max_width =3D 1920;
>>> +=C2=A0=C2=A0=C2=A0 dev->mode_config.max_height =3D 1200;
>>> -=C2=A0=C2=A0=C2=A0 priv->dev->mode_config.fb_base =3D priv->fb_base;=

>>> -=C2=A0=C2=A0=C2=A0 priv->dev->mode_config.preferred_depth =3D 32;
>>> -=C2=A0=C2=A0=C2=A0 priv->dev->mode_config.prefer_shadow =3D 1;
>>> +=C2=A0=C2=A0=C2=A0 dev->mode_config.fb_base =3D priv->fb_base;
>>> +=C2=A0=C2=A0=C2=A0 dev->mode_config.preferred_depth =3D 32;
>>> +=C2=A0=C2=A0=C2=A0 dev->mode_config.prefer_shadow =3D 1;
>>> -=C2=A0=C2=A0=C2=A0 priv->dev->mode_config.funcs =3D (void *)&hibmc_m=
ode_funcs;
>>> +=C2=A0=C2=A0=C2=A0 dev->mode_config.funcs =3D (void *)&hibmc_mode_fu=
ncs;
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ret =3D hibmc_de_init(priv);
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (ret) {
>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 drm_err(priv->dev, "faile=
d to init de: %d\n", ret);
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 drm_err(dev, "failed to i=
nit de: %d\n", ret);
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return ret;
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ret =3D hibmc_vdac_init(priv);
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (ret) {
>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 drm_err(priv->dev, "faile=
d to init vdac: %d\n", ret);
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 drm_err(dev, "failed to i=
nit vdac: %d\n", ret);
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return ret;
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>>> @@ -113,7 +114,7 @@ static int hibmc_kms_init(struct=20
>>> hibmc_drm_private *priv)
>>> =C2=A0 static void hibmc_kms_fini(struct hibmc_drm_private *priv)
>>> =C2=A0 {
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (priv->mode_config_initialized) {
>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 drm_mode_config_cleanup(p=
riv->dev);
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 drm_mode_config_cleanup(&=
priv->dev);
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 priv->mode_con=
fig_initialized =3D false;
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>>> =C2=A0 }
>>> @@ -202,7 +203,7 @@ static void hibmc_hw_config(struct=20
>>> hibmc_drm_private *priv)
>>> =C2=A0 static int hibmc_hw_map(struct hibmc_drm_private *priv)
>>> =C2=A0 {
>>> -=C2=A0=C2=A0=C2=A0 struct drm_device *dev =3D priv->dev;
>>> +=C2=A0=C2=A0=C2=A0 struct drm_device *dev =3D &priv->dev;
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct pci_dev *pdev =3D dev->pdev;
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 resource_size_t addr, size, ioaddr, io=
size;
>>> @@ -258,7 +259,7 @@ static int hibmc_unload(struct drm_device *dev)
>>> =C2=A0 static int hibmc_load(struct drm_device *dev)
>>> =C2=A0 {
>>> -=C2=A0=C2=A0=C2=A0 struct hibmc_drm_private *priv;
>>> +=C2=A0=C2=A0=C2=A0 struct hibmc_drm_private *priv =3D to_hibmc_drm_p=
rivate(dev);
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 int ret;
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 priv =3D drmm_kzalloc(dev, sizeof(*pri=
v), GFP_KERNEL);
>>> @@ -267,7 +268,6 @@ static int hibmc_load(struct drm_device *dev)
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return -ENOMEM=
;
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dev->dev_private =3D priv;
>>> -=C2=A0=C2=A0=C2=A0 priv->dev =3D dev;
>>
>> I'm sure this either does not build or does not work. There's a call=20
>> to drm_dev_alloc(), which initialized the DRM device. You need to=20
>> assign the returned device here. The embedding of dev only work after =

>> you switched to devm_drm_dev_alloc() in the next patch.
>>
>> For the patch at hand, just keep struct hibmc_drm_private.dev as a=20
>> pointer and you should be fine.
>>
> Changing drm_device *dev to drm_device dev and using devm_drm_dev_alloc=
=20
> does not easily split into two patches.
> The patch does not compile well on its own, but it will compile fine=20
> with patch #2.
> Can patch #1 and patch #2 be combined into a single patch,just like V1.=


Most of the code in this patch does

   struct drm_device *dev =3D &priv->dev;

to get dev as a local variable. Why don't you do

   struct drm_device *dev =3D priv->dev;

?

That's all that's really needed.

Best regards
Thomas

>> Best regards
>> Thomas
>>
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ret =3D hibmc_hw_init(priv);
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (ret)
>>> diff --git a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.h=20
>>> b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.h
>>> index f310a83..e35353a 100644
>>> --- a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.h
>>> +++ b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.h
>>> @@ -37,7 +37,7 @@ struct hibmc_drm_private {
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 resource_size_t=C2=A0 fb_size;
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* drm */
>>> -=C2=A0=C2=A0=C2=A0 struct drm_device=C2=A0 *dev;
>>> +=C2=A0=C2=A0=C2=A0 struct drm_device dev;
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct drm_plane primary_plane;
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct drm_crtc crtc;
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct drm_encoder encoder;
>>> diff --git a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_vdac.c=20
>>> b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_vdac.c
>>> index 74e26c2..d35548d 100644
>>> --- a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_vdac.c
>>> +++ b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_vdac.c
>>> @@ -96,7 +96,7 @@ static const struct drm_encoder_funcs=20
>>> hibmc_encoder_funcs =3D {
>>> =C2=A0 int hibmc_vdac_init(struct hibmc_drm_private *priv)
>>> =C2=A0 {
>>> -=C2=A0=C2=A0=C2=A0 struct drm_device *dev =3D priv->dev;
>>> +=C2=A0=C2=A0=C2=A0 struct drm_device *dev =3D &priv->dev;
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct hibmc_connector *hibmc_connecto=
r =3D &priv->connector;
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct drm_encoder *encoder =3D &priv-=
>encoder;
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct drm_connector *connector =3D &h=
ibmc_connector->base;
>>> diff --git a/drivers/gpu/drm/hisilicon/hibmc/hibmc_ttm.c=20
>>> b/drivers/gpu/drm/hisilicon/hibmc/hibmc_ttm.c
>>> index 602ece1..e84fb81 100644
>>> --- a/drivers/gpu/drm/hisilicon/hibmc/hibmc_ttm.c
>>> +++ b/drivers/gpu/drm/hisilicon/hibmc/hibmc_ttm.c
>>> @@ -25,7 +25,7 @@ int hibmc_mm_init(struct hibmc_drm_private *hibmc)
>>> =C2=A0 {
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct drm_vram_mm *vmm;
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 int ret;
>>> -=C2=A0=C2=A0=C2=A0 struct drm_device *dev =3D hibmc->dev;
>>> +=C2=A0=C2=A0=C2=A0 struct drm_device *dev =3D &hibmc->dev;
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 vmm =3D drm_vram_helper_alloc_mm(dev,
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 pci_resource_start(dev->pdev, 0),
>>> @@ -41,10 +41,12 @@ int hibmc_mm_init(struct hibmc_drm_private *hibmc=
)
>>> =C2=A0 void hibmc_mm_fini(struct hibmc_drm_private *hibmc)
>>> =C2=A0 {
>>> -=C2=A0=C2=A0=C2=A0 if (!hibmc->dev->vram_mm)
>>> +=C2=A0=C2=A0=C2=A0 struct drm_device *dev =3D &hibmc->dev;
>>> +
>>> +=C2=A0=C2=A0=C2=A0 if (!dev->vram_mm)
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return;
>>> -=C2=A0=C2=A0=C2=A0 drm_vram_helper_release_mm(hibmc->dev);
>>> +=C2=A0=C2=A0=C2=A0 drm_vram_helper_release_mm(dev);
>>> =C2=A0 }
>>> =C2=A0 int hibmc_dumb_create(struct drm_file *file, struct drm_device=
 *dev,
>>>
>>
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--woR6XCC6iBKuSAIfUoOJlpIefUmfLp1dm--

--x2d7DFiRiPY134QtF4u86i5nmflirnT5p
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAl/GOMYFAwAAAAAACgkQlh/E3EQov+DG
/w/+OqVMCrLsnDPUtYl4zb6IIub19d6CnT2x+6F8Z2400MPRaLrN/HAgCa07oWBkMBgkyWdr0emi
KY2BqkZVm8oFmMjxW9mD9Lotxr3AqMIDdcV/hUuaiCxz5nrFH5n2dCoCqWkaBLRo8KbkqmBeGOBg
KrZp0rVnJEW3xDGwGrCcmzRA9loIGpaFG1Z863KHHY6jsENws96EvgiUaBcEoN4ra3bPW51Edg4n
32btnblcg7AI6/zeHC9AYtZVYT5QQNxZAR8GTmx9KHNo5V9rfjAPXcLSTYKZGnQOgooZOcRQUgFi
nuX53rptIFlC+0ARzXG0thfUaYGAHvoZ89r1mURI5uRghejJICjRAmMqKlAY0eoBYUZ0Aym2FeCM
ge43PjBSXNkJqKRGTQrpMx0cmYfca2VPSNR5k1oBg7wVrqOKu+4WJYm4ofp0NIw42sKXcBiZdX0u
WBpo/oi0X1gTiZszy2sd+bVOmclbSCmqyoUNVatIMtFCtO4QrJfPWDCL2/tsFWjBgRTwTBywk9JV
xdkpl4uguwka0f8EFSdRBQV3OF7ycoN7CmY+WEa+MWJ7SxWwP4Xv+eQB+ck8oTHAvgjD6YA8qzMR
RyMMuL9qBGlns9vBMuS/Yc+35Epopp2/vZ5vidS9Vyfqi5pYPgmtarvbOoYaqQBwleGuXo07Y8jV
Rrg=
=3jxm
-----END PGP SIGNATURE-----

--x2d7DFiRiPY134QtF4u86i5nmflirnT5p--

--===============1720599392==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1720599392==--
