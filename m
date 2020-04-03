Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F3DC619D099
	for <lists+dri-devel@lfdr.de>; Fri,  3 Apr 2020 09:00:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C21B6EB0A;
	Fri,  3 Apr 2020 07:00:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C3B86EB0A
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Apr 2020 07:00:26 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id D9D00ADC1;
 Fri,  3 Apr 2020 07:00:22 +0000 (UTC)
Subject: Re: [PATCH 2/4] drm/hisilicon: Code cleanup for hibmc_drv_vdac
To: Xinliang Liu <xinliang.liu@linaro.org>, Tian Tao <tiantao6@hisilicon.com>
References: <1583466184-7060-1-git-send-email-tiantao6@hisilicon.com>
 <1583466184-7060-5-git-send-email-tiantao6@hisilicon.com>
 <CAKoKPbwgiFdvfLHXoD9wPJvJ5yzMMrxNEEJUArSEvNdx46+m9Q@mail.gmail.com>
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
Message-ID: <07040b3e-9137-10ef-9a18-381b0316fef9@suse.de>
Date: Fri, 3 Apr 2020 09:00:17 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <CAKoKPbwgiFdvfLHXoD9wPJvJ5yzMMrxNEEJUArSEvNdx46+m9Q@mail.gmail.com>
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
Cc: David Airlie <airlied@linux.ie>, Chen Feng <puck.chen@hisilicon.com>,
 lkml <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, linuxarm@huawei.com,
 kraxel@redhat.com, alexander.deucher@amd.com, tglx@linutronix.de
Content-Type: multipart/mixed; boundary="===============1626558569=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============1626558569==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="ZpAQgr4rgKRsm2Dtw09BFyu364lHgxHz7"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--ZpAQgr4rgKRsm2Dtw09BFyu364lHgxHz7
Content-Type: multipart/mixed; boundary="KvchZNwh6Mib540wOsZ1oZ0hUXcq6lXYi";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Xinliang Liu <xinliang.liu@linaro.org>, Tian Tao <tiantao6@hisilicon.com>
Cc: David Airlie <airlied@linux.ie>, Chen Feng <puck.chen@hisilicon.com>,
 lkml <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, linuxarm@huawei.com,
 kraxel@redhat.com, alexander.deucher@amd.com, tglx@linutronix.de
Message-ID: <07040b3e-9137-10ef-9a18-381b0316fef9@suse.de>
Subject: Re: [PATCH 2/4] drm/hisilicon: Code cleanup for hibmc_drv_vdac
References: <1583466184-7060-1-git-send-email-tiantao6@hisilicon.com>
 <1583466184-7060-5-git-send-email-tiantao6@hisilicon.com>
 <CAKoKPbwgiFdvfLHXoD9wPJvJ5yzMMrxNEEJUArSEvNdx46+m9Q@mail.gmail.com>
In-Reply-To: <CAKoKPbwgiFdvfLHXoD9wPJvJ5yzMMrxNEEJUArSEvNdx46+m9Q@mail.gmail.com>

--KvchZNwh6Mib540wOsZ1oZ0hUXcq6lXYi
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi

Am 03.04.20 um 04:26 schrieb Xinliang Liu:
> Hi Tao,
>=20
> On Fri, 6 Mar 2020 at 11:44, Tian Tao <tiantao6@hisilicon.com> wrote:
>>
>> code cleanup for hibmc_drv_vdac.c, no actual function changes.
>>
>> Signed-off-by: Tian Tao <tiantao6@hisilicon.com>
>> Signed-off-by: Gong junjie <gongjunjie2@huawei.com>
>> ---
>>  drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_vdac.c | 49 ++++++++-------=
---------
>>  1 file changed, 16 insertions(+), 33 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_vdac.c b/driver=
s/gpu/drm/hisilicon/hibmc/hibmc_drm_vdac.c
>> index 678ac2e..f0e6bb8 100644
>> --- a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_vdac.c
>> +++ b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_vdac.c
>> @@ -52,32 +52,6 @@ static const struct drm_connector_funcs hibmc_conne=
ctor_funcs =3D {
>>         .atomic_destroy_state =3D drm_atomic_helper_connector_destroy_=
state,
>>  };
>>
>> -static struct drm_connector *
>> -hibmc_connector_init(struct hibmc_drm_private *priv)
>> -{
>> -       struct drm_device *dev =3D priv->dev;
>> -       struct drm_connector *connector;
>> -       int ret;
>> -
>> -       connector =3D devm_kzalloc(dev->dev, sizeof(*connector), GFP_K=
ERNEL);
>> -       if (!connector) {
>> -               DRM_ERROR("failed to alloc memory when init connector\=
n");
>> -               return ERR_PTR(-ENOMEM);
>> -       }
>> -
>> -       ret =3D drm_connector_init(dev, connector,
>> -                                &hibmc_connector_funcs,
>> -                                DRM_MODE_CONNECTOR_VGA);
>> -       if (ret) {
>> -               DRM_ERROR("failed to init connector: %d\n", ret);
>> -               return ERR_PTR(ret);
>> -       }
>> -       drm_connector_helper_add(connector,
>> -                                &hibmc_connector_helper_funcs);
>> -
>> -       return connector;
>> -}
>> -
>>  static void hibmc_encoder_mode_set(struct drm_encoder *encoder,
>>                                    struct drm_display_mode *mode,
>>                                    struct drm_display_mode *adj_mode)
>> @@ -109,13 +83,6 @@ int hibmc_vdac_init(struct hibmc_drm_private *priv=
)
>>         struct drm_connector *connector;
>>         int ret;
>>
>> -       connector =3D hibmc_connector_init(priv);
>> -       if (IS_ERR(connector)) {
>> -               DRM_ERROR("failed to create connector: %ld\n",
>> -                         PTR_ERR(connector));
>> -               return PTR_ERR(connector);
>> -       }
>> -
>>         encoder =3D devm_kzalloc(dev->dev, sizeof(*encoder), GFP_KERNE=
L);
>>         if (!encoder) {
>>                 DRM_ERROR("failed to alloc memory when init encoder\n"=
);
>> @@ -131,6 +98,22 @@ int hibmc_vdac_init(struct hibmc_drm_private *priv=
)
>>         }
>>
>>         drm_encoder_helper_add(encoder, &hibmc_encoder_helper_funcs);
>> +       connector =3D devm_kzalloc(dev->dev, sizeof(*connector), GFP_K=
ERNEL);
>> +       if (!connector) {
>> +               DRM_ERROR("failed to alloc memory when init connector\=
n");
>> +               return -ENOMEM;
>> +       }
>> +
>> +       ret =3D drm_connector_init(dev, connector,
>> +                                &hibmc_connector_funcs,
>> +                                DRM_MODE_CONNECTOR_VGA);
>> +       if (ret) {
>> +               DRM_ERROR("failed to init connector: %d\n", ret);
>> +               return ret;
>> +       }
>> +
>> +       drm_connector_helper_add(connector, &hibmc_connector_helper_fu=
ncs);
>> +       drm_connector_register(connector);
>=20
> You don't need to register a non-hotplug connector as it will be
> registered at drm_dev_register automatically.
>=20
> See function definition:
>=20
>  488 /**
>  489  * drm_connector_register - register a connector
>  490  * @connector: the connector to register
>  491  *
>  492  * Register userspace interfaces for a connector. Only call this
> for connectors
>  493  * which can be hotplugged after drm_dev_register() has been
> called already,
>  494  * e.g. DP MST connectors. All other connectors will be
> registered automatically
>  495  * when calling drm_dev_register().
>  496  *
>  497  * Returns:
>  498  * Zero on success, error code on failure.
>  499  */
>  500 int drm_connector_register(struct drm_connector *connector)
>  501 {
>=20
>=20
> Besides, I don't think this patch cleans much things.

True. Although the auto-kfree of devm_kzalloc() does not work correctly
with DRM and should be replaced.

I'd like to suggest to either allocate the connector as part of struct
hibmc_drm_private, or implement drmm_connector_create() on top of DRM's
new auto-cleanup functionality.

Best regards
Thomas

>=20
> -Xinliang
>=20
>>         drm_connector_attach_encoder(connector, encoder);
>>
>>         return 0;
>> --
>> 2.7.4
>>
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--KvchZNwh6Mib540wOsZ1oZ0hUXcq6lXYi--

--ZpAQgr4rgKRsm2Dtw09BFyu364lHgxHz7
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEchf7rIzpz2NEoWjlaA3BHVMLeiMFAl6G3wUACgkQaA3BHVML
eiNy5wf+KuQNqGhClWLXXkwbsBxccUKZ2CknoocZyuQJoB2VzYt2xA5fG/arWnP4
rJSYX6gD7O+cPvRSrv4Lr8mmI5fe1iWhoRYYV4V5EBnUJA/QfD/dXc+U4RaKh6wx
4PKWLLBR8j8HonHcbHgHtOOlk+1nS6MS7Ly0kcvHXaShs09zbHsGKHflbISXYoPn
j1HD/hk956fjbZBEFulrmJ4EXs4mLGA4frwV1l9HAgFvn4HiRS8sv2HnUUwslOGk
MDawolF853coMHFiqtvrUPYeYWtuGfWehtmfzEYsHjnoUi9RnxvRbbKiT/k8ZF9j
8XqLslQdh4MA0tCXTQYRyu5MYN3YLg==
=i+iM
-----END PGP SIGNATURE-----

--ZpAQgr4rgKRsm2Dtw09BFyu364lHgxHz7--

--===============1626558569==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1626558569==--
