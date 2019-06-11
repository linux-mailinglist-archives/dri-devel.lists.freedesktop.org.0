Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C2DCE3C571
	for <lists+dri-devel@lfdr.de>; Tue, 11 Jun 2019 09:54:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F3FF8914F;
	Tue, 11 Jun 2019 07:53:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A03318914F
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Jun 2019 07:53:57 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 2414EACC1;
 Tue, 11 Jun 2019 07:53:56 +0000 (UTC)
Subject: Re: [PATCH v1 3/4] drm/mga: drop use of drmP.h
To: Sam Ravnborg <sam@ravnborg.org>, dri-devel@lists.freedesktop.org
References: <20190608081923.6274-1-sam@ravnborg.org>
 <20190608081923.6274-4-sam@ravnborg.org>
From: Thomas Zimmermann <tzimmermann@suse.de>
Openpgp: preference=signencrypt
Autocrypt: addr=tzimmermann@suse.de; keydata=
 xsBNBFs50uABCADEHPidWt974CaxBVbrIBwqcq/WURinJ3+2WlIrKWspiP83vfZKaXhFYsdg
 XH47fDVbPPj+d6tQrw5lPQCyqjwrCPYnq3WlIBnGPJ4/jreTL6V+qfKRDlGLWFjZcsrPJGE0
 BeB5BbqP5erN1qylK9i3gPoQjXGhpBpQYwRrEyQyjuvk+Ev0K1Jc5tVDeJAuau3TGNgah4Yc
 hdHm3bkPjz9EErV85RwvImQ1dptvx6s7xzwXTgGAsaYZsL8WCwDaTuqFa1d1jjlaxg6+tZsB
 9GluwvIhSezPgnEmimZDkGnZRRSFiGP8yjqTjjWuf0bSj5rUnTGiyLyRZRNGcXmu6hjlABEB
 AAHNKFRob21hcyBaaW1tZXJtYW5uIDx0emltbWVybWFubkBzdXNlLmNvbT7CwJQEEwEIAD4W
 IQRyF/usjOnPY0ShaOVoDcEdUwt6IwUCWznTtgIbAwUJA8JnAAULCQgHAgYVCgkICwIEFgID
 AQIeAQIXgAAKCRBoDcEdUwt6I7D7CACBK42XW+7mCiK8ioXMEy1NzGbXC51RzGea8N83oEJS
 1KVUtQxrkDxgrW/WLSl/TfqHFsJpdEFOv1XubWbleun3uKPy0e5vZCd5UjZPkeNjnqfCYTDy
 hVVsdOuFbtWDppJyJrThLqr9AgSFmoCNNUt1SVpYEEOLNE6C32BhlnSq21VLC+YXTgO/ZHTa
 YXkq54hHj63jwrcjkBSCkXLh37kHeqnl++GHpN+3R+o3w2OpwHAlvVjdKPT27v1tVkiydsFG
 65Vd0n3m/ft+IOrGgxQM1C20uqKvsZGB4r3OGR50ekAybO7sjEJJ1Obl4ge/6RRqcvKz4LMb
 tGs85D6tPIeFzsBNBFs50uABCADGJj+DP1fk+UWOWrf4O61HTbC4Vr9QD2K4fUUHnzg2B6zU
 R1BPXqLGG0+lzK8kfYU/F5RjmEcClsIkAaFkg4kzKP14tvY1J5+AV3yNqcdg018HNtiyrSwI
 E0Yz/qm1Ot2NMZ0DdvVBg22IMsiudQ1tx9CH9mtyTbIXgACvl3PW2o9CxiHPE/bohFhwZwh/
 kXYYAE51lhinQ3oFEeQZA3w4OTvxSEspiQR8dg8qJJb+YOAc5IKk6sJmmM7JfFMWSr22satM
 23oQ3WvJb4RV6HTRTAIEyyZS7g2DhiytgMG60t0qdABG5KXSQW+OKlZRpuWwKWaLh3if/p/u
 69dvpanbABEBAAHCwHwEGAEIACYWIQRyF/usjOnPY0ShaOVoDcEdUwt6IwUCWznS4AIbDAUJ
 A8JnAAAKCRBoDcEdUwt6I6X3CACJ8D+TpXBCqJE5xwog08+Dp8uBpx0T9n1wE0GQisZruACW
 NofYn8PTX9k4wmegDLwt7YQDdKxQ4+eTfZeLNQqWg6OCftH5Kx7sjWnJ09tOgniVdROzWJ7c
 VJ/i0okazncsJ+nq48UYvRGE1Swh3A4QRIyphWX4OADOBmTFl9ZYNPnh23eaC9WrNvFr7yP7
 iGjMlfEW8l6Lda//EC5VpXVNza0xeae0zFNst2R9pn+bLkihwDLWxOIyifGRxTqNxoS4I1aw
 VhxPSVztPMSpIA/sOr/N/p6JrBLn+gui2K6mP7bGb8hF+szfArYqz3T1rv1VzUWAJf5Wre5U
 iNx9uqqx
Message-ID: <9fe19f06-c732-351c-0d41-521ecab4e781@suse.de>
Date: Tue, 11 Jun 2019 09:53:51 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190608081923.6274-4-sam@ravnborg.org>
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
Cc: David Airlie <airlied@linux.ie>
Content-Type: multipart/mixed; boundary="===============2079848820=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============2079848820==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="FFxMMksCco43Y9cOqIFarepjTP3uosMVD"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--FFxMMksCco43Y9cOqIFarepjTP3uosMVD
Content-Type: multipart/mixed; boundary="GXj505p25BDar6K39WLqud7NPWeS7cPVo";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Sam Ravnborg <sam@ravnborg.org>, dri-devel@lists.freedesktop.org
Cc: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>
Message-ID: <9fe19f06-c732-351c-0d41-521ecab4e781@suse.de>
Subject: Re: [PATCH v1 3/4] drm/mga: drop use of drmP.h
References: <20190608081923.6274-1-sam@ravnborg.org>
 <20190608081923.6274-4-sam@ravnborg.org>
In-Reply-To: <20190608081923.6274-4-sam@ravnborg.org>

--GXj505p25BDar6K39WLqud7NPWeS7cPVo
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi

Am 08.06.19 um 10:19 schrieb Sam Ravnborg:
> Drop the use of the deprecated drmP.h header file.
> Clean up list of include files and sort them.
>=20
> Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: David Airlie <airlied@linux.ie>
> ---
>  drivers/gpu/drm/mga/mga_dma.c   | 2 --
>  drivers/gpu/drm/mga/mga_drv.c   | 7 +++----
>  drivers/gpu/drm/mga/mga_ioc32.c | 3 +--
>  drivers/gpu/drm/mga/mga_irq.c   | 2 --
>  drivers/gpu/drm/mga/mga_state.c | 2 --
>  drivers/gpu/drm/mga/mga_warp.c  | 4 +---
>  6 files changed, 5 insertions(+), 15 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/mga/mga_dma.c b/drivers/gpu/drm/mga/mga_dm=
a.c
> index 123be2f3a151..139554a3733d 100644
> --- a/drivers/gpu/drm/mga/mga_dma.c
> +++ b/drivers/gpu/drm/mga/mga_dma.c
> @@ -37,8 +37,6 @@
> =20
>  #include <linux/delay.h>
> =20
> -#include <drm/drmP.h>
> -#include <drm/mga_drm.h>
>  #include "mga_drv.h"
> =20
>  #define MGA_DEFAULT_USEC_TIMEOUT	10000
> diff --git a/drivers/gpu/drm/mga/mga_drv.c b/drivers/gpu/drm/mga/mga_dr=
v.c
> index 6e1d1054ad06..71128e6f6ae9 100644
> --- a/drivers/gpu/drm/mga/mga_drv.c
> +++ b/drivers/gpu/drm/mga/mga_drv.c
> @@ -31,12 +31,11 @@
> =20
>  #include <linux/module.h>
> =20
> -#include <drm/drmP.h>
> -#include <drm/mga_drm.h>
> -#include "mga_drv.h"
> -
> +#include <drm/drm_drv.h>
>  #include <drm/drm_pciids.h>
> =20
> +#include "mga_drv.h"
> +

Unless it violates an existing convention, I'd suggest the following
order for headers (here and in the other patches):

 c file header ("mga_foo.h" for mga_foo.c)
 driver header ("mga_drv.h")
 public linux/drm headers
 other driver headers ("mga_nonfoo.h", etc)

I know that it's nitpicking, but this maximizes the chance that the
driver's header files include all dependencies they need.

Best regards
Thomas


>  static struct pci_device_id pciidlist[] =3D {
>  	mga_PCI_IDS
>  };
> diff --git a/drivers/gpu/drm/mga/mga_ioc32.c b/drivers/gpu/drm/mga/mga_=
ioc32.c
> index 245fb2e359cf..6ccd270789c6 100644
> --- a/drivers/gpu/drm/mga/mga_ioc32.c
> +++ b/drivers/gpu/drm/mga/mga_ioc32.c
> @@ -30,10 +30,9 @@
>   * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALI=
NGS
>   * IN THE SOFTWARE.
>   */
> +
>  #include <linux/compat.h>
> =20
> -#include <drm/drmP.h>
> -#include <drm/mga_drm.h>
>  #include "mga_drv.h"
> =20
>  typedef struct drm32_mga_init {
> diff --git a/drivers/gpu/drm/mga/mga_irq.c b/drivers/gpu/drm/mga/mga_ir=
q.c
> index c6a3fab5b0c4..7c48f4d090ac 100644
> --- a/drivers/gpu/drm/mga/mga_irq.c
> +++ b/drivers/gpu/drm/mga/mga_irq.c
> @@ -31,8 +31,6 @@
>   *    Eric Anholt <anholt@FreeBSD.org>
>   */
> =20
> -#include <drm/drmP.h>
> -#include <drm/mga_drm.h>
>  #include "mga_drv.h"
> =20
>  u32 mga_get_vblank_counter(struct drm_device *dev, unsigned int pipe)
> diff --git a/drivers/gpu/drm/mga/mga_state.c b/drivers/gpu/drm/mga/mga_=
state.c
> index 296a1db7e5ee..77a0b006f066 100644
> --- a/drivers/gpu/drm/mga/mga_state.c
> +++ b/drivers/gpu/drm/mga/mga_state.c
> @@ -32,8 +32,6 @@
>   *    Gareth Hughes <gareth@valinux.com>
>   */
> =20
> -#include <drm/drmP.h>
> -#include <drm/mga_drm.h>
>  #include "mga_drv.h"
> =20
>  /* =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> diff --git a/drivers/gpu/drm/mga/mga_warp.c b/drivers/gpu/drm/mga/mga_w=
arp.c
> index 0b76352260a9..b5ef1d2c8b1c 100644
> --- a/drivers/gpu/drm/mga/mga_warp.c
> +++ b/drivers/gpu/drm/mga/mga_warp.c
> @@ -29,11 +29,9 @@
> =20
>  #include <linux/firmware.h>
>  #include <linux/ihex.h>
> -#include <linux/platform_device.h>
>  #include <linux/module.h>
> +#include <linux/platform_device.h>
> =20
> -#include <drm/drmP.h>
> -#include <drm/mga_drm.h>
>  #include "mga_drv.h"
> =20
>  #define FIRMWARE_G200 "matrox/g200_warp.fw"
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Linux GmbH, Maxfeldstrasse 5, 90409 Nuernberg, Germany
GF: Felix Imend=C3=B6rffer, Mary Higgins, Sri Rasiah
HRB 21284 (AG N=C3=BCrnberg)


--GXj505p25BDar6K39WLqud7NPWeS7cPVo--

--FFxMMksCco43Y9cOqIFarepjTP3uosMVD
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEchf7rIzpz2NEoWjlaA3BHVMLeiMFAlz/XhAACgkQaA3BHVML
eiMNiwf/ZsuM//NLg6DK+YhtS3ho8o8t/kDtkh1IhAgyJFkQj9bTj8IBMAxUTurJ
8NRCcRWtzJy7D3u7Ouq29AO36OkpFtLdqIp4W8vPZkH6U3IW8I2+oPguoJzjfFyY
RjOrhsarmsRMhkHlD/9HTwAKpcYVPCjwWTD+WKm37mBiALMNcXQ1WhfJpNVnPQ4g
LYcFWKfeGvKFnFTW87juvn7MbBrWiMqoV3usHDNQjithH4u41WxAWWA308fkGY2X
1KCzyQW2+hIWL0XCv+vf4XPzDeIzqCpp0OA1vjkZ+xhz2jqgG+Q/e7o+hc8FQjnJ
1/Y99mKExGufX2ZMda7DPafJJSjBJw==
=0VTL
-----END PGP SIGNATURE-----

--FFxMMksCco43Y9cOqIFarepjTP3uosMVD--

--===============2079848820==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============2079848820==--
