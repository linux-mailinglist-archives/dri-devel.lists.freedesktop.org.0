Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7737D1678CA
	for <lists+dri-devel@lfdr.de>; Fri, 21 Feb 2020 09:52:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 695F16E21E;
	Fri, 21 Feb 2020 08:52:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB8656E21E
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Feb 2020 08:52:08 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 7330BAAB8;
 Fri, 21 Feb 2020 08:52:06 +0000 (UTC)
Subject: Re: [PATCH] drm/hisilicon: Fixed pcie resource conflict using the
 general API
To: Xinliang Liu <xinliang.liu@linaro.org>, Tian Tao <tiantao6@hisilicon.com>
References: <1582264523-61170-1-git-send-email-tiantao6@hisilicon.com>
 <CAKoKPbztX8--gWgLDYJFQX1=Wf1jiFKx+H2_RFN90fxOpr_RdQ@mail.gmail.com>
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
Message-ID: <e65e3728-406e-ff9c-a8ef-6829666fa573@suse.de>
Date: Fri, 21 Feb 2020 09:52:01 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <CAKoKPbztX8--gWgLDYJFQX1=Wf1jiFKx+H2_RFN90fxOpr_RdQ@mail.gmail.com>
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
Cc: airlied@linux.ie, puck.chen@hisilicon.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linuxarm@huawei.com, kraxel@redhat.com,
 alexander.deucher@amd.com, tglx@linutronix.de
Content-Type: multipart/mixed; boundary="===============1811769230=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============1811769230==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="iynYgojkQVb3wztvybX8DcPKnDzpVeDTz"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--iynYgojkQVb3wztvybX8DcPKnDzpVeDTz
Content-Type: multipart/mixed; boundary="dWd4QpDv00Fahsdc4n185aYcPsdrURE5E";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Xinliang Liu <xinliang.liu@linaro.org>, Tian Tao <tiantao6@hisilicon.com>
Cc: puck.chen@hisilicon.com, airlied@linux.ie, Daniel Vetter
 <daniel@ffwll.ch>, kraxel@redhat.com, alexander.deucher@amd.com,
 tglx@linutronix.de, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linuxarm@huawei.com
Message-ID: <e65e3728-406e-ff9c-a8ef-6829666fa573@suse.de>
Subject: Re: [PATCH] drm/hisilicon: Fixed pcie resource conflict using the
 general API
References: <1582264523-61170-1-git-send-email-tiantao6@hisilicon.com>
 <CAKoKPbztX8--gWgLDYJFQX1=Wf1jiFKx+H2_RFN90fxOpr_RdQ@mail.gmail.com>
In-Reply-To: <CAKoKPbztX8--gWgLDYJFQX1=Wf1jiFKx+H2_RFN90fxOpr_RdQ@mail.gmail.com>

--dWd4QpDv00Fahsdc4n185aYcPsdrURE5E
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi

Am 21.02.20 um 08:06 schrieb Xinliang Liu:
> Hi tao,
> Are you sending a wrong patch?
> Function hibmc_remove_framebuffers is added by your prior reviewing pat=
ch.
> Please send patch based on=C2=A0drm-misc-next branch[1] or linux-next.

There's drm_fb_helper_remove_conflicting_pci_framebuffers() which
already implements the functionality. I asked to try using it instead of
creating an own implementation.

Best regards
Thomas

>=20
> Thanks,
> -Xinliang
>=20
> [1]=C2=A0https://anongit.freedesktop.org/git/drm-misc.git
>=20
> On Fri, 21 Feb 2020 at 13:56, Tian Tao <tiantao6@hisilicon.com
> <mailto:tiantao6@hisilicon.com>> wrote:
>=20
>     the kernel provide the drm_fb_helper_remove_conflicting_pci_framebu=
ffer
>     to remvoe the pcie resource conflict,there is no need to driver it
>     again.
>=20
>     Signed-off-by: Tian Tao <tiantao6@hisilicon.com
>     <mailto:tiantao6@hisilicon.com>>
>     ---
>     =C2=A0drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c | 22
>     +++++-----------------
>     =C2=A01 file changed, 5 insertions(+), 17 deletions(-)
>=20
>     diff --git a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c
>     b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c
>     index 7ebe831..0f7dba7 100644
>     --- a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c
>     +++ b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c
>     @@ -47,22 +47,6 @@ static irqreturn_t hibmc_drm_interrupt(int irq,
>     void *arg)
>     =C2=A0 =C2=A0 =C2=A0 =C2=A0 return IRQ_HANDLED;
>     =C2=A0}
>=20
>     -static void hibmc_remove_framebuffers(struct pci_dev *pdev)
>     -{
>     -=C2=A0 =C2=A0 =C2=A0 =C2=A0struct apertures_struct *ap;
>     -
>     -=C2=A0 =C2=A0 =C2=A0 =C2=A0ap =3D alloc_apertures(1);
>     -=C2=A0 =C2=A0 =C2=A0 =C2=A0if (!ap)
>     -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return;
>     -
>     -=C2=A0 =C2=A0 =C2=A0 =C2=A0ap->ranges[0].base =3D pci_resource_sta=
rt(pdev, 0);
>     -=C2=A0 =C2=A0 =C2=A0 =C2=A0ap->ranges[0].size =3D pci_resource_len=
(pdev, 0);
>     -
>     -=C2=A0 =C2=A0 =C2=A0 =C2=A0drm_fb_helper_remove_conflicting_frameb=
uffers(ap,
>     "hibmcdrmfb", false);
>     -
>     -=C2=A0 =C2=A0 =C2=A0 =C2=A0kfree(ap);
>     -}
>     -
>     =C2=A0static struct drm_driver hibmc_driver =3D {
>     =C2=A0 =C2=A0 =C2=A0 =C2=A0 .driver_features=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =3D DRIVER_GEM | DRIVER_MODESET |
>     DRIVER_ATOMIC,
>     =C2=A0 =C2=A0 =C2=A0 =C2=A0 .fops=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D &hibmc_fops,
>     @@ -343,7 +327,11 @@ static int hibmc_pci_probe(struct pci_dev *pde=
v,
>     =C2=A0 =C2=A0 =C2=A0 =C2=A0 struct drm_device *dev;
>     =C2=A0 =C2=A0 =C2=A0 =C2=A0 int ret;
>=20
>     -=C2=A0 =C2=A0 =C2=A0 =C2=A0hibmc_remove_framebuffers(pdev);
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D drm_fb_helper_remove_conflictin=
g_pci_framebuffers(pdev,
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0
>     =C2=A0"hibmcdrmfb");
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0if (ret)
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return ret;=

>     +
>=20
>     =C2=A0 =C2=A0 =C2=A0 =C2=A0 dev =3D drm_dev_alloc(&hibmc_driver, &p=
dev->dev);
>     =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (IS_ERR(dev)) {
>     --=20
>     2.7.4
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--dWd4QpDv00Fahsdc4n185aYcPsdrURE5E--

--iynYgojkQVb3wztvybX8DcPKnDzpVeDTz
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEchf7rIzpz2NEoWjlaA3BHVMLeiMFAl5PmjIACgkQaA3BHVML
eiNcbQgAiKUIhgLpwCITPMQNdE3FHFb7GwEFbYPq2ULSgPUnDs6Kzx/bF72uRf/J
vx4N/C94JdQoa07fz/TRrjpgYIaH+F/w7TLhT7yV/VpOpbzzySDjmYd1X7uAAxsY
UNZOsRo/RqROUdIOKfRytndlK/Ivt1QZSknYUh6d3GptOnC8gBw6hbHn9TRa3rsl
KE1SSCPeRr2MZ6fzobJaIhUlQsYRKx01/R2RQgKOJhFN6tyjQ/8Y8EEwiIOnNMgA
8VDrf/xMAdfIWdv51ClJNLoxCIWF+HHlRPqzk2E3Jmjw+7tdkFPCxO9lp/Q3h21w
1S96jmWQXdAQurL2pxDDbabP/0HlYQ==
=NnDS
-----END PGP SIGNATURE-----

--iynYgojkQVb3wztvybX8DcPKnDzpVeDTz--

--===============1811769230==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1811769230==--
