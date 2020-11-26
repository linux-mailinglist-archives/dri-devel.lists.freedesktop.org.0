Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CBAB52C5508
	for <lists+dri-devel@lfdr.de>; Thu, 26 Nov 2020 14:12:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF20D6E943;
	Thu, 26 Nov 2020 13:12:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D99556E943
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Nov 2020 13:12:28 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 6E028AD21;
 Thu, 26 Nov 2020 13:12:27 +0000 (UTC)
Subject: Re: [PATCH drm/hisilicon 2/3] drm/irq: Add the new api to install irq
To: Tian Tao <tiantao6@hisilicon.com>, airlied@linux.ie, daniel@ffwll.ch,
 kraxel@redhat.com, alexander.deucher@amd.com, tglx@linutronix.de,
 dri-devel@lists.freedesktop.org, xinliang.liu@linaro.org,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org
References: <1606392140-57954-1-git-send-email-tiantao6@hisilicon.com>
 <1606392140-57954-3-git-send-email-tiantao6@hisilicon.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
Message-ID: <5bc0d7d1-4e7f-df67-f0ae-3d626c53b400@suse.de>
Date: Thu, 26 Nov 2020 14:12:26 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.3
MIME-Version: 1.0
In-Reply-To: <1606392140-57954-3-git-send-email-tiantao6@hisilicon.com>
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
Content-Type: multipart/mixed; boundary="===============1599774389=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============1599774389==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="wbepf0HwjeVr78zwhdQp4f0j7Ly3mYPOg"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--wbepf0HwjeVr78zwhdQp4f0j7Ly3mYPOg
Content-Type: multipart/mixed; boundary="wiOb7jS61Sjt3pPGRdizXDYBgqwqj2hqQ";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Tian Tao <tiantao6@hisilicon.com>, airlied@linux.ie, daniel@ffwll.ch,
 kraxel@redhat.com, alexander.deucher@amd.com, tglx@linutronix.de,
 dri-devel@lists.freedesktop.org, xinliang.liu@linaro.org,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org
Cc: linux-kernel@vger.kernel.org
Message-ID: <5bc0d7d1-4e7f-df67-f0ae-3d626c53b400@suse.de>
Subject: Re: [PATCH drm/hisilicon 2/3] drm/irq: Add the new api to install irq
References: <1606392140-57954-1-git-send-email-tiantao6@hisilicon.com>
 <1606392140-57954-3-git-send-email-tiantao6@hisilicon.com>
In-Reply-To: <1606392140-57954-3-git-send-email-tiantao6@hisilicon.com>

--wiOb7jS61Sjt3pPGRdizXDYBgqwqj2hqQ
Content-Type: multipart/mixed;
 boundary="------------F60183DC67D3638520370B21"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------F60183DC67D3638520370B21
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable

Hi

Am 26.11.20 um 13:02 schrieb Tian Tao:
> Add new api devm_drm_irq_install() to register interrupts,
> no need to call drm_irq_uninstall() when the drm module is removed.
>=20
> Signed-off-by: Tian Tao <tiantao6@hisilicon.com>
> ---
>   drivers/gpu/drm/drm_irq.c | 34 ++++++++++++++++++++++++++++++++++
>   include/drm/drm_irq.h     |  2 +-
>   2 files changed, 35 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/drm_irq.c b/drivers/gpu/drm/drm_irq.c
> index 09d6e9e..983ad6b 100644
> --- a/drivers/gpu/drm/drm_irq.c
> +++ b/drivers/gpu/drm/drm_irq.c
> @@ -214,6 +214,40 @@ int drm_irq_uninstall(struct drm_device *dev)
>   }
>   EXPORT_SYMBOL(drm_irq_uninstall);
>  =20
> +static void devm_drm_irq_uninstall(void *data)
> +{
> +	drm_irq_uninstall(data);
> +}
> +
> +/**
> + * devm_drm_irq_install - install IRQ handler
> + * @dev: DRM device
> + * @irq: IRQ number to install the handler for
> + *
> + * devm_drm_irq_install is the help function of drm_irq_install,

'the help' -> 'a helper'. I'd do a full stop with period at the end of=20
the line.

> + * when the driver uses devm_drm_irq_install, there is no need

when -> If

> + * to call drm_irq_uninstall when the drm module is uninstalled,

'is uninstalled' -> 'gets unloaded'

> + * and this will done automagically.

and -> as

> + *
> + * Returns:
> + * Zero on success or a negative error code on failure.
> + */
> +int devm_drm_irq_install(struct drm_device *dev, int irq)
> +{
> +	int ret;
> +
> +	ret =3D drm_irq_install(dev, irq);
> +	if (ret)
> +		return ret;
> +
> +	ret =3D devm_add_action(dev->dev, devm_drm_irq_uninstall, dev);
> +	if (ret)
> +		devm_drm_irq_uninstall(dev);

This pattern can be replaced by devm_add_action_or_reset()

With my comments addressed,

Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>

Best regards
Thomas

> +
> +	return ret;
> +}
> +EXPORT_SYMBOL(devm_drm_irq_install);
> +
>   #if IS_ENABLED(CONFIG_DRM_LEGACY)
>   int drm_legacy_irq_control(struct drm_device *dev, void *data,
>   			   struct drm_file *file_priv)
> diff --git a/include/drm/drm_irq.h b/include/drm/drm_irq.h
> index d77f6e6..631b22f 100644
> --- a/include/drm/drm_irq.h
> +++ b/include/drm/drm_irq.h
> @@ -28,5 +28,5 @@ struct drm_device;
>  =20
>   int drm_irq_install(struct drm_device *dev, int irq);
>   int drm_irq_uninstall(struct drm_device *dev);
> -
> +int devm_drm_irq_install(struct drm_device *dev, int irq);
>   #endif
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer

--------------F60183DC67D3638520370B21
Content-Type: application/pgp-keys;
 name="OpenPGP_0x680DC11D530B7A23.asc"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: attachment;
 filename="OpenPGP_0x680DC11D530B7A23.asc"

-----BEGIN PGP PUBLIC KEY BLOCK-----

xsBNBFs50uABCADEHPidWt974CaxBVbrIBwqcq/WURinJ3+2WlIrKWspiP83vfZKaXhFYsdgX=
H47
fDVbPPj+d6tQrw5lPQCyqjwrCPYnq3WlIBnGPJ4/jreTL6V+qfKRDlGLWFjZcsrPJGE0BeB5B=
bqP
5erN1qylK9i3gPoQjXGhpBpQYwRrEyQyjuvk+Ev0K1Jc5tVDeJAuau3TGNgah4YchdHm3bkPj=
z9E
ErV85RwvImQ1dptvx6s7xzwXTgGAsaYZsL8WCwDaTuqFa1d1jjlaxg6+tZsB9GluwvIhSezPg=
nEm
imZDkGnZRRSFiGP8yjqTjjWuf0bSj5rUnTGiyLyRZRNGcXmu6hjlABEBAAHNKFRob21hcyBaa=
W1t
ZXJtYW5uIDx0emltbWVybWFubkBzdXNlLmNvbT7CwI4EEwEIADgCGwMFCwkIBwIGFQoJCAsCB=
BYC
AwECHgECF4AWIQRyF/usjOnPY0ShaOVoDcEdUwt6IwUCXvxIWAAKCRBoDcEdUwt6I+aZB/9ih=
Onf
G4Lgf1L87cvoXh95/bnaJ6aQhP6/ZeRleuCXflnyDajlm3c9loQr0r2bQUi7JeYwUKbBab2QS=
GJm
DMRGlLMnmzWB8mHmZ6bHAu+2Sth8SraE42p6BB9d8dlYEID+dl/D/xUBeulfkck5rloGtYqDi=
+1Q
DfkEZJaxVSZ6FFkXuQi/G9qcI4iklN2nv02iQ7mZe8WYAysix6s/6vIobhirEBreclSNxXqis=
p8n
91+v855JC11EgRdUXMRK81IAaCKXP8zLx3ixku7mvP9Om61yerHSbeU2HZbIggZYQlFh6llJm=
zF1
CjCWgPTJyk4t4kMTcNOw5ykD47vU/KW+wl0EEBECAB0WIQQn6OOmnzvP/7ktjmoud6EwEfXTw=
gUC
WzodVwAKCRAud6EwEfXTwidvAKDkOADDHfI0QNXqAZcg6i1kOndAYACeLXHBwpjnumkPSyoab=
IiL
+he8r3zCwHMEEAEIAB0WIQQeXZghmQijlU7YzFiqUDvJrg9HpwUCWznxsQAKCRCqUDvJrg9Hp=
42f
CADIvsZcAd04PDFclRltHr2huy6s7+ZZA6PgYlMblEBh4bJA+dNPBTvzpJ7FJv/bmHOa+phWy=
Urj
EpfFGuOKGuWAfzgVAEu52fMrW3/mm+O26z1AKIu8hiZ/x9OAe4AM71ZO2lZrV1/53ZdzWnRuO=
45N
GQcotU8oeVfT9okAfmozmWMmIMq7Q0K6bV8W3qiD5XfDNxjr2caxc/9WX1bZPUo3n0H23MNaA=
Tpy
Oz732UtDh6sKUAB1RfzBBd/REbjHD7+quwJGAdRScyDRncX1vNb2+wihy0ipA69XY3bkhR5iD=
u5r
A9enuiMe6J1IBMI1PZh+vOufB/M6cd2D9RULIJaJwsBzBBABCAAdFiEEuyNtt7Ge78bIRx1op=
/N8
GYw5MYEFAls6MrsACgkQp/N8GYw5MYEnLQf/dwqlDJVQL2q+i8FFaqTMAm0n9jLRV6pN8JxFH=
j0g
voyWUOnQuNdAFgtKd26ZhN8NkLoSMO8E19eBPfLoBIFK5yNNVmRHAZm07MzGbA0uNWINJhmdR=
bZM
RMh0nneXjcEU/IvUmd8TPFTAd24X2mbzHgcaHMLJSVx1ohd4alRJXHIqDobKmiVwekyPnInJn=
zWw
iuZUkIotTkQple1PT/dF3S+KtPXBL6ldQ4NkAeCjsz4wnzSa9+VKOxEhiHM0PMzXSbkCMP+4m=
Xy9
RMplBw9Dm9hN2PSouBPifIrSodiiSWZYXOEkzLiBAB0frCKR63Dnx9kvjCD9Pz5wLd/70rjqI=
cLA
jgQTAQgAOAIbAwULCQgHAgYVCgkICwIEFgIDAQIeAQIXgBYhBHIX+6yM6c9jRKFo5WgNwR1TC=
3oj
BQJftODHAAoJEGgNwR1TC3ojZSIIAIV3makffp4P4leU8JSLt0aTNewsOhy7VQzKUtlCw3PKD=
3l/
SuymZhQKgH+n6sijzFauZnZ+x0T+Oy+dDVZb3sNJuuMUDIHw18EO9daZBMcueaS54FGe73lAp=
HUl
7nxyocCxoqIG8+fP+75itV/ls2TSh5rJvjLvHC8J3NqfGlJ/jlSKrQUnzFbXfE5KGWiKNAn+I=
1a2
EE0I7uLpYgkdb8hcjtV9Rxr2ja+GWOaSoqB29P5GUzipkWo4144Q16JBO6QP2R9y/1ZK9VqH2=
5T8
lTKocLAaHCEdpDqY5KI15as9tIxlI1Vh+eqhTh/gwEm1ykO1gmrQ1zvGLDMB1EE6El3NJ1Rob=
21h
cyBaaW1tZXJtYW5uIDx0emltbWVybWFubkBzdXNlLmRlPsLAjgQTAQgAOAIbAwULCQgHAgYVC=
gkI
CwIEFgIDAQIeAQIXgBYhBHIX+6yM6c9jRKFo5WgNwR1TC3ojBQJe/EheAAoJEGgNwR1TC3ojq=
RgI
AIoegtTp1prPzfHgTAuEPd8v58ssHubwi9tg69a8IJ+iMNozhs4iUou84WOLBJNjSieXHZRa8=
fJj
//2/sTuABn38AQ9FcKX9/B49hrdCo6c0WHHKqlPrSTzuXNKYyOdmSFd/pDhBb2Bn5DTxxH5RP=
m/N
U/C9nUlwi7Y+FgBlDNa5h592wmJfv0cJAfvF56C+QL65jHFOFIW9xSaTOAxxMXHGJHXki6Iwa=
aTg
s7QQlKQcd5XvvED1bwLyQ7rq+MEZo5N7IygpQMM3qqGMlCnDdyQ3W95rd0HCWpfa0oVRCOwdu=
SL3
5hG7ONqBpvBj8z5GjSbt4HLJGvpeT0k37qzRExrCXQQQEQIAHRYhBCfo46afO8//uS2Oai53o=
TAR
9dPCBQJbOh1XAAoJEC53oTAR9dPC05AAoIy0HQ2DBDYugQ42P4HfyxfZTIvKAJ0fqNBcBFW9S=
tbR
DEP9cfpNVOv8YMLAcwQQAQgAHRYhBB5dmCGZCKOVTtjMWKpQO8muD0enBQJbOfGzAAoJEKpQO=
8mu
D0enL0wIAM2NTeUDCofBAkbWHGTZopclefbh0xGPYQEfttNyalp0hn1CrVO7OsX5eTjRqgyOa=
1C5
OAsNghCM4PUmrfv5cZ9+sNn9bRM50uVW9IFRlq8wwBY4+7QejJ5gs7DW/0tZIMZ6iTGKK0WEO=
7gd
2K9hXadPBScTdIqXeWH82meiqElnEQL+K9UeGUBrku+1EQIOxwziKwTDlTvhyJ+xmEKj0uWRc=
Ocl
27xLS9XOWPGXcNQBtlZhF8e/E1kFRt5CPP5UBdUCN8qydUadseXivSNDiYob9dyJSFt7G0Bq4=
/ac
Ret5ANtGRWsp8xYJQRossRMWL0w9P8SiIc2IY/JrQrpz29nCwHMEEAEIAB0WIQS7I223sZ7vx=
shH
HWin83wZjDkxgQUCWzoywAAKCRCn83wZjDkxgQaDCACyFuBLQWNvLT8GTDqTf/gETzmtoEM6Y=
r8O
4jbYg05xiFzAqMZctQsm3zHakx2JrimxDvQJRQJQzp5ICJ7J/BOuSL4FE1SPeQIfjm4jyBZGH=
P/W
vgHsT5e3+ZCPePPZO+3irarTKVhaaP70Tpka6EsOCZzO6L8D6tUDkhxMX0ymy7p8w9Yt1eD0o=
Ume
mxrKdS1ulpNJUTBw7gJN8bMowVnycEm6wntxOjrCxuwbkKhFLdn0ejcXQ0UkfbUFKfU64gGBu=
S53
ZlM8XlOhQEIw/FrdXszhR+Tg3Ag130cmJhOrghgOBLzvJfUd6OvDT5VIz0QGbAm8SWlAIIms1=
9Z8
kBsLwsCOBBMBCAA4AhsDBQsJCAcCBhUKCQgLAgQWAgMBAh4BAheAFiEEchf7rIzpz2NEoWjla=
A3B
HVMLeiMFAl+04McACgkQaA3BHVMLeiPHXAf/SEoZa6CKoOAs1ctEP/hN8cEQqbEiuZ+71nm3u=
/BQ
p/CEUvqGq+iVc8kkpClDbPz5fa9mb+yWwufsnXKOs6ygmEoAEOL7dBZZIaRobBEkB09VXIkx8=
lE0
00grBVtToHUGRfZcMoMZ98XhPGU6lJDN200j/2CV46hQDz6PLySecNjOME05mosbYW5N2JwFd=
uXP
Qx++DjWB32QLBhcOcP3WslTy3PKVe/TcTvk0JpPFMz4UFc+awBVhDgZiGGAW3xLZRYyhpoAEs=
N7u
XkV2ct0MRxuZ3y4tTYJobhbZwutRojiPPZduRw9CSpNDcQHruFiSOIQTpnLeCA6K2JAZyqmP/=
8LA
lAQTAQgAPhYhBHIX+6yM6c9jRKFo5WgNwR1TC3ojBQJbOdLgAhsDBQkDwmcABQsJCAcCBhUKC=
QgL
AgQWAgMBAh4BAheAAAoJEGgNwR1TC3ojR80H/jH+vYavwQ+TvO8ksXL9JQWc3IFSiGpuSVXLC=
dg6
2AmRirxW+qCwNncNQyb9rd30gzdectSkPWL3KSqEResBe24IbA5/jSkPweJasgXtfhuyoeCJ6=
PXo
clQQGKIoFIAEv1s8l0ggPZswvCinegl1diyJXUXmdEJRTWYAtxn/atut1o6Giv6D2qmYbXN7m=
neM
C5MzlLaJKUtoH7U/IjVw1sx2qtxAZGKVm4RZxPnMCp9E1MAr5t4dP5gJCIiqsdrVqI6iKupZs=
tMx
stPU//azmz7ZWWxT0JzgJqZSvPYx/SATeexTYBP47YFyri4jnsty2ErS91E6H8osBv6pnSn7e=
ArO
wE0EWznS4AEIAMYmP4M/V+T5RY5at/g7rUdNsLhWv1APYrh9RQefODYHrNRHUE9eosYbT6XMr=
yR9
hT8XlGOYRwKWwiQBoWSDiTMo/Xi29jUnn4BXfI2px2DTXwc22LKtLAgTRjP+qbU63Y0xnQN29=
UGD
bYgyyK51DW3H0If2a3JNsheAAK+Xc9baj0LGIc8T9uiEWHBnCH+RdhgATnWWGKdDegUR5BkDf=
Dg5
O/FISymJBHx2Dyoklv5g4BzkgqTqwmaYzsl8UxZKvbaxq0zbehDda8lvhFXodNFMAgTLJlLuD=
YOG
LK2AwbrS3Sp0AEbkpdJBb44qVlGm5bApZouHeJ/+n+7r12+lqdsAEQEAAcLAfAQYAQgAJhYhB=
HIX
+6yM6c9jRKFo5WgNwR1TC3ojBQJbOdLgAhsMBQkDwmcAAAoJEGgNwR1TC3ojpfcIAInwP5Olc=
EKo
kTnHCiDTz4Ony4GnHRP2fXATQZCKxmu4AJY2h9ifw9Nf2TjCZ6AMvC3thAN0rFDj55N9l4s1C=
paD
o4J+0fkrHuyNacnT206CeJV1E7NYntxUn+LSiRrOdywn6erjxRi9EYTVLCHcDhBEjKmFZfg4A=
M4G
ZMWX1lg0+eHbd5oL1as28WvvI/uIaMyV8RbyXot1r/8QLlWldU3NrTF5p7TMU2y3ZH2mf5suS=
KHA
MtbE4jKJ8ZHFOo3GhLgjVrBWHE9JXO08xKkgD+w6v83+nomsEuf6C6LYrqY/tsZvyEX6zN8Ct=
irP
dPWu/VXNRYAl/lat7lSI3H26qrHCwHYEGAEIACACGwwWIQRyF/usjOnPY0ShaOVoDcEdUwt6I=
wUC
X7Th+gAKCRBoDcEdUwt6I1UpCAC6QD5CCT0KFET29VVo4d+JdB5YJZmB72bMyVk12MGrx0fPp=
OgW
muh+7n1zULU4UciMSa0C1uq1eZZu044X3xIcVQp9+/nINM2d4+8yLEktK8f2jMIulYRSQOYX5=
909
E7a4oyj+AEgEDvcQ9WZPf+tSVpPDsrLiIezF5JdH8W0SlhPd13kAYSCR0H53PmAS6a3Z8UeOO=
kof
Fp/9g2GvHGr7ln9s6wenGbq7NOPMXtFG0luQDkqOFfTNI82COJ2ak5j8WMl25t9Cr5s9K2FUW=
orW
CeJMmGDIblC76yQzI2Ub2jXudrZCgLzHr3Bnbd/B+CklVwMpaskDluc7z3OP7KvXzsFNBF+04=
RMB
EADSYkyG/50PjD4CAbEnwQYZl61RVMBb3jug1j2dDPmOcQSYbw7pKLLLUoHCwnZXeEhRdiZ5w=
qMo
fW6DNo9irHecDc0815aN5RMxUQIqX7W6L4lI2qdKsaEcMtYQVdxbdf1cjcMGGO6oxlQE0FO3C=
E/8
y4G/kndDT0APK9jb6SatTJyPJxXwNmR+HYrkbWr4RAVM6et0pQmMZ8sak+QEM0kBlKbI0sodQ=
OXs
7Y9acMYJ5F+xfWU9JVAaOs2TOmQavDZMr6MeOpe/UKFjAZvcvv5yF8v7l3U+kWrpj4wc1bbRp=
pDp
5k5RlCckAJ3QBNW6Im/YlgieJCK9ns0So1yVxrmjNZu4Un3UGFnndI+dvp1vahkjTZNRo2FzP=
GUl
k2oF+juZn26c0YAQSv16BPTVkTQGuFfrVF+P76qg5dJvjuBdhmLOhLu1i63nUYMIw7jBf1Qir=
0H6
98oyLfdGYtdHB0MN5IXSVpkgymIHp6b7H36OMeem4onzoeiMUv8IX+fwQMeJ8fBsl+yTtA1J1=
Lon
gjXxBkbvEG2AUjpDv73ZuMcu0WcHc5ajfM4wixTght+OgZ7Md5LtpTbV+qmaGo5nw+KDujdF3=
bNq
RMI7nwnyVvbAi3QZqiw+Tr7EZY8r+77ecNvF0hdbcoUGsSLPvLBSbcHwpYnbn36uehXBaxFws=
bC0
KwARAQABwsKsBBgBCAAgFiEEchf7rIzpz2NEoWjlaA3BHVMLeiMFAl+04RMCGwICQAkQaA3BH=
VML
eiPBdCAEGQEIAB0WIQTGd2b9+m4xR3BgUWiWH8TcRCi/4AUCX7ThEwAKCRCWH8TcRCi/4JMoE=
AC0
B6V5uOWXzAg8e7v3e60R/0exHxFeTgKEvfNSJM204K2/c+mGH4UKh/kdiJoKF/y6Lu80o8ndt=
vyG
mQJ0yhypFyBSDNbgdeOHagIt7VvwXovwknYg+w2NavdhG5envhqX902XQE0mNNH1XizDRZ422=
8wl
V/fixCmAETZu5GKIFSTHOQrlZlwZ/RRRd3IqEb6bmpbPJZbBXOFolASXw3zs41xMar9zjLSY9=
LKp
SrF3Zy5F27QJhLxWsalLjtWcEwkxn5a5/4OAvAoNIn5NMGRoBmEYp3ZCRNbzkGT2gyOxrTcSf=
g7M
eHy//LX+1rpN02erf6HyoY6vLFFQlYZ5cnf97o67g7vz4cMGAbB4zZ/j5h3ggkSbjlsCmqXX4=
x/Z
7bB1078lwQdg9x+zo+0vxzk10TU1FoWsSAiravlw0riSjr+wjXr5IzBeMm0A7K1MZ2lne+mKj=
T72
bz2KE6isyrpIn4xlzLMQuh1OCthrHKb6GiJO4JWg/jWIt3yBov4EdFDXOnJl7Tq2CkpwrDTsH=
Dgi
Sw4xK+mHW3QFztsMQi6p7qaPCUSYAPIY4xzOTqExhMj/3Pgyg6hTvdGIpV9VzfMXIR68Pmw79=
BGZ
tEWaVXS+1ja+6kBOFIQ37sqOBorOGfp6c6Di+IN8mkEHyt9s2Q/YqpPdedm+58tinuaBSBeUk=
mhM
B/9rSzQXr84M1rhAehbaqDE+UYw8sfsQXiJkZYZz9BHp0YfhD9J5iwgGhYj+LU6dW1+eEsgcq=
fMH
Dexdvr9koHXeuMNaXa40++GX9cY9DU8RHbeYxGj35eVY793F4gfAAsD5DCF5pCcd7mhicp5eD=
rIq
258874hM7w1aSwMS+0K+oppSlIfdogKM/l8RA6oDGZySTkwxXQ8RAYb/ddVc5Ua2gzXccODBz=
JuT
a+aY+BxmIdz4oMzaNCiK3gedGKoRjnrGguEO+YL/Ji3NhHOXRKu/QVTFDmgpmA0oQTfY+iaLz=
bFk
keWD97V4vo2flZ8ii37fcKNX4daGGnRRFUh4BrBG
=3DskgE
-----END PGP PUBLIC KEY BLOCK-----

--------------F60183DC67D3638520370B21--

--wiOb7jS61Sjt3pPGRdizXDYBgqwqj2hqQ--

--wbepf0HwjeVr78zwhdQp4f0j7Ly3mYPOg
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAl+/qboFAwAAAAAACgkQlh/E3EQov+CN
sA/8C7mzR8tKxq1J8pwIJz6cF+wKaRWWuxpD6rGwaPjVWDa1WU30DGD+D/nkd5YBgEL9NYBmX7ko
/dYQRaIZBTX1P123gEkonFjhS7f3cyxEd8Ms1hXeWWyGXcZjbtGtMdUW0iTmea6gwq0OzFX8JJf0
isdP//6hJu3Aw6eekGNVe1H8Fj4dxHDW0GmUXmdf6pX7p90VV9lCEnDgccNvo8xUnM80TlSAXmoG
7Z081P+SHnEBKC8u3kv3KzcCdk6WIux5bopsNob1+QUF9QlcSMHs2K6Y/CkH3a0C7S62q3eYj7/9
YAAMvWBV0L9geivGMpk2RzCzmqjwrinlyRtReTZGf7tBS1muxnUV65b/r8yAQnFCet8ZUvP8EQwj
OCzE0uGmG5jx3dERVySAdEHo6ewSZJCXU9S4qX0sESLAbUCk2T9gndhPaPLHBf/zPEVFv/4cfqvw
8M/g31x0DZYXET3IlxJYImw/WuJ05I2j1nxbNVfrCE6O2ik6m41Szqi43lNSIxOoPEcjFHfItmJQ
Df3Dyw5OGysFA2IagzUSCEuviLNXddGBZZ7YW9XqlK7PxL3n+lYlx2ITyEx64yvsEl5AbYgx9p2l
JVRQnnN3q0Vecva3y1kOittC248QgNgwzIvJf9Y0QZHi3ET4aJ3NW1UCGHDz0pUMAIQJfKhygIi6
Uo8=
=+KAK
-----END PGP SIGNATURE-----

--wbepf0HwjeVr78zwhdQp4f0j7Ly3mYPOg--

--===============1599774389==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1599774389==--
