Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D26E52D0D6F
	for <lists+dri-devel@lfdr.de>; Mon,  7 Dec 2020 10:53:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F00E189E5F;
	Mon,  7 Dec 2020 09:53:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C0EC989E5F
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Dec 2020 09:53:49 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id F3BAFAD21;
 Mon,  7 Dec 2020 09:53:47 +0000 (UTC)
Subject: Re: [PATCH drm/hisilicon v2 1/2] drm/hisilicon: Use managed
 mode-config init
To: "tiantao (H)" <tiantao6@huawei.com>, Tian Tao <tiantao6@hisilicon.com>,
 airlied@linux.ie, daniel@ffwll.ch, kraxel@redhat.com,
 alexander.deucher@amd.com, tglx@linutronix.de,
 dri-devel@lists.freedesktop.org, xinliang.liu@linaro.org,
 linux-kernel@vger.kernel.org
References: <1607331906-19005-1-git-send-email-tiantao6@hisilicon.com>
 <1607331906-19005-2-git-send-email-tiantao6@hisilicon.com>
 <cf28147b-a506-3d72-fb71-bb30a801fd8d@suse.de>
 <0d60eccc-907d-6fc2-e1c2-c7fe0facd21e@huawei.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
Message-ID: <dac52155-b9bb-6a01-7e18-d4dd48f58844@suse.de>
Date: Mon, 7 Dec 2020 10:53:46 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <0d60eccc-907d-6fc2-e1c2-c7fe0facd21e@huawei.com>
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
Content-Type: multipart/mixed; boundary="===============1941644890=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============1941644890==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="0I72f04CKrbtKB6WYrp3kjWuNdq7hQS1M"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--0I72f04CKrbtKB6WYrp3kjWuNdq7hQS1M
Content-Type: multipart/mixed; boundary="iXbnfvtIHw4JjkM1Kf9QTPJwDkogkIii1";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: "tiantao (H)" <tiantao6@huawei.com>, Tian Tao <tiantao6@hisilicon.com>,
 airlied@linux.ie, daniel@ffwll.ch, kraxel@redhat.com,
 alexander.deucher@amd.com, tglx@linutronix.de,
 dri-devel@lists.freedesktop.org, xinliang.liu@linaro.org,
 linux-kernel@vger.kernel.org
Message-ID: <dac52155-b9bb-6a01-7e18-d4dd48f58844@suse.de>
Subject: Re: [PATCH drm/hisilicon v2 1/2] drm/hisilicon: Use managed
 mode-config init
References: <1607331906-19005-1-git-send-email-tiantao6@hisilicon.com>
 <1607331906-19005-2-git-send-email-tiantao6@hisilicon.com>
 <cf28147b-a506-3d72-fb71-bb30a801fd8d@suse.de>
 <0d60eccc-907d-6fc2-e1c2-c7fe0facd21e@huawei.com>
In-Reply-To: <0d60eccc-907d-6fc2-e1c2-c7fe0facd21e@huawei.com>

--iXbnfvtIHw4JjkM1Kf9QTPJwDkogkIii1
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi

Am 07.12.20 um 10:29 schrieb tiantao (H):
>=20
>=20
> =E5=9C=A8 2020/12/7 17:22, Thomas Zimmermann =E5=86=99=E9=81=93:
>> Hi
>>
>> Am 07.12.20 um 10:05 schrieb Tian Tao:
>>> Using drmm_mode_config_init() sets up managed release of modesetting
>>> resources.
>>>
>>
>> Individual patches usually contain a changelog to highlight the=20
>> difference to previous versions. Please add one before committing the =

>=20
> Just to be sure: I don't need to add a changlog to this individual=20
> patch, right?

You should. It's supposed to be good style to add a changelog for each=20
patch and also highlight the series' overall changes in the cover letter.=


Best regards
Thomas

>=20
>> patch.=C2=A0 Your cover letter for the series already does this correc=
tly.
>>
>>> Signed-off-by: Tian Tao <tiantao6@hisilicon.com>
>>
>> Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
>>
>> Thanks for all these updates.
>=20
> Thank you for your constant help with the review code and your careful =

> guidance!
>=20
>>
>>> ---
>>> =C2=A0 drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c | 14 +++------=
-----
>>> =C2=A0 drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.h |=C2=A0 1 -
>>> =C2=A0 2 files changed, 3 insertions(+), 12 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c=20
>>> b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c
>>> index 3687753..7f01213 100644
>>> --- a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c
>>> +++ b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c
>>> @@ -96,8 +96,9 @@ static int hibmc_kms_init(struct hibmc_drm_private =

>>> *priv)
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct drm_device *dev =3D &priv->dev;=

>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 int ret;
>>> -=C2=A0=C2=A0=C2=A0 drm_mode_config_init(dev);
>>> -=C2=A0=C2=A0=C2=A0 priv->mode_config_initialized =3D true;
>>> +=C2=A0=C2=A0=C2=A0 ret =3D drmm_mode_config_init(dev);
>>> +=C2=A0=C2=A0=C2=A0 if (ret)
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return ret;
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dev->mode_config.min_width =3D 0;
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dev->mode_config.min_height =3D 0;
>>> @@ -125,14 +126,6 @@ static int hibmc_kms_init(struct=20
>>> hibmc_drm_private *priv)
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return 0;
>>> =C2=A0 }
>>> -static void hibmc_kms_fini(struct hibmc_drm_private *priv)
>>> -{
>>> -=C2=A0=C2=A0=C2=A0 if (priv->mode_config_initialized) {
>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 drm_mode_config_cleanup(&=
priv->dev);
>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 priv->mode_config_initial=
ized =3D false;
>>> -=C2=A0=C2=A0=C2=A0 }
>>> -}
>>> -
>>> =C2=A0 /*
>>> =C2=A0=C2=A0 * It can operate in one of three modes: 0, 1 or Sleep.
>>> =C2=A0=C2=A0 */
>>> @@ -262,7 +255,6 @@ static int hibmc_unload(struct drm_device *dev)
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 drm_atomic_helper_shutdown(dev);
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pci_disable_msi(dev->pdev);
>>> -=C2=A0=C2=A0=C2=A0 hibmc_kms_fini(priv);
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dev->dev_private =3D NULL;
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return 0;
>>> =C2=A0 }
>>> diff --git a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.h=20
>>> b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.h
>>> index a49c10e..7d263f4 100644
>>> --- a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.h
>>> +++ b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.h
>>> @@ -42,7 +42,6 @@ struct hibmc_drm_private {
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct drm_crtc crtc;
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct drm_encoder encoder;
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct hibmc_connector connector;
>>> -=C2=A0=C2=A0=C2=A0 bool mode_config_initialized;
>>> =C2=A0 };
>>> =C2=A0 static inline struct hibmc_connector *to_hibmc_connector(struc=
t=20
>>> drm_connector *connector)
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


--iXbnfvtIHw4JjkM1Kf9QTPJwDkogkIii1--

--0I72f04CKrbtKB6WYrp3kjWuNdq7hQS1M
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAl/N+6oFAwAAAAAACgkQlh/E3EQov+Cp
sQ/+KZGgJvYtL7bhwCJr8ENheu7nGVIe02n+kekMBJntRRmA+7/gLQsebp9F06zrefVcDj+Kv7Qc
s1F73YPr2SLwH1FgkzDCLd1IeVwgSVq/Eeprar3xziWrXC91d3ak3KavYMjQqHRszEbRMbK/oSqS
W3HW3LYSkVkhwtuDcfODYjWWlMLn2et7H0eNCam2tA8F34rydGrZA09E4q/OfYuUr7KAQfG9P97d
iCpl1pz/Z1yzg6/Dnpoxvv7o6oL9rHzo7/b2FJpaznXPEf56I/btGK01POrpXHzIEcFO+fMVbDdb
CzshuvEKHUMNhFzY0eFmk+ov9tpUv7fq6k4/87rwTOYT07cJ5kAx9mXHwAmW6auf+DS2bS657bT6
9YIJavqSiGW3GWQ1fztQeLi1QOQfehzGoJz5vBkYN7iLHj0V/hiS1GLUmTtTkJQ7g8jxzHxTyiRX
QteAS7hCfaHDasEtbq4ijhiEIMENOCF5uuyaYw1CaXilbxrlg3WtyQLG5jVwffEI3CkD1C+foujN
qHP3RewE+M5U6wn6gC6PX6YnaFRcM49YnyXf7G3GwD4hQAV15gUrWffZ8sxSqo75DVIJq6iE7PAP
ZuM0l6vJUUSr7DGqWcivcQfTxNJitMYfXcm1JyZZyFTMHiYY/EWOWF62DXNGdbwJsPlIH32SAK/h
ENM=
=qLU2
-----END PGP SIGNATURE-----

--0I72f04CKrbtKB6WYrp3kjWuNdq7hQS1M--

--===============1941644890==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1941644890==--
