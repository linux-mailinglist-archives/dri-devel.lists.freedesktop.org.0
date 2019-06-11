Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B99753C55E
	for <lists+dri-devel@lfdr.de>; Tue, 11 Jun 2019 09:48:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D26389153;
	Tue, 11 Jun 2019 07:48:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 19F5D8914F
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Jun 2019 07:48:23 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 6792CAD2A;
 Tue, 11 Jun 2019 07:48:21 +0000 (UTC)
Subject: Re: [PATCH v1 1/4] drm/mga: drop dependency on drm_os_linux.h
To: Sam Ravnborg <sam@ravnborg.org>, dri-devel@lists.freedesktop.org
References: <20190608081923.6274-1-sam@ravnborg.org>
 <20190608081923.6274-2-sam@ravnborg.org>
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
Message-ID: <2a7f442c-af70-9209-e678-0689469bb308@suse.de>
Date: Tue, 11 Jun 2019 09:48:16 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190608081923.6274-2-sam@ravnborg.org>
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
Content-Type: multipart/mixed; boundary="===============1333602335=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============1333602335==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="uoS6AW898rEgtX0HfMvrnggLppeukiv8y"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--uoS6AW898rEgtX0HfMvrnggLppeukiv8y
Content-Type: multipart/mixed; boundary="VWUtngvuR0Us1x39JOkNrBTBobksx9FtF";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Sam Ravnborg <sam@ravnborg.org>, dri-devel@lists.freedesktop.org
Cc: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>
Message-ID: <2a7f442c-af70-9209-e678-0689469bb308@suse.de>
Subject: Re: [PATCH v1 1/4] drm/mga: drop dependency on drm_os_linux.h
References: <20190608081923.6274-1-sam@ravnborg.org>
 <20190608081923.6274-2-sam@ravnborg.org>
In-Reply-To: <20190608081923.6274-2-sam@ravnborg.org>

--VWUtngvuR0Us1x39JOkNrBTBobksx9FtF
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi

Am 08.06.19 um 10:19 schrieb Sam Ravnborg:
> Opencode all macros used from the deprecated drm_os_linux.h header file=
=2E
> The DRM_WAIT_ON used 3 * HZ as timeout.
> This was translated to 30 msec.
>=20
> Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: David Airlie <airlied@linux.ie>
> ---
>  drivers/gpu/drm/mga/mga_dma.c   | 12 ++++++++----
>  drivers/gpu/drm/mga/mga_drv.h   | 12 ++++++++----
>  drivers/gpu/drm/mga/mga_irq.c   |  8 ++++----
>  drivers/gpu/drm/mga/mga_state.c |  6 +++---
>  4 files changed, 23 insertions(+), 15 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/mga/mga_dma.c b/drivers/gpu/drm/mga/mga_dm=
a.c
> index 1ffdafea27e4..123be2f3a151 100644
> --- a/drivers/gpu/drm/mga/mga_dma.c
> +++ b/drivers/gpu/drm/mga/mga_dma.c
> @@ -35,6 +35,8 @@
>   * \author Gareth Hughes <gareth@valinux.com>
>   */
> =20
> +#include <linux/delay.h>
> +
>  #include <drm/drmP.h>
>  #include <drm/mga_drm.h>
>  #include "mga_drv.h"
> @@ -62,7 +64,7 @@ int mga_do_wait_for_idle(drm_mga_private_t *dev_priv)=

>  			MGA_WRITE8(MGA_CRTC_INDEX, 0);
>  			return 0;
>  		}
> -		DRM_UDELAY(1);
> +		udelay(1);
>  	}
> =20
>  #if MGA_DMA_DEBUG
> @@ -114,7 +116,7 @@ void mga_do_dma_flush(drm_mga_private_t *dev_priv)
>  		status =3D MGA_READ(MGA_STATUS) & MGA_ENGINE_IDLE_MASK;
>  		if (status =3D=3D MGA_ENDPRDMASTS)
>  			break;
> -		DRM_UDELAY(1);
> +		udelay(1);
>  	}
> =20
>  	if (primary->tail =3D=3D primary->last_flush) {
> @@ -1120,7 +1122,7 @@ int mga_dma_buffers(struct drm_device *dev, void =
*data,
>  	 */
>  	if (d->send_count !=3D 0) {
>  		DRM_ERROR("Process %d trying to send %d buffers via drmDMA\n",
> -			  DRM_CURRENTPID, d->send_count);
> +			  task_pid_nr(current), d->send_count);
>  		return -EINVAL;
>  	}
> =20
> @@ -1128,7 +1130,9 @@ int mga_dma_buffers(struct drm_device *dev, void =
*data,
>  	 */
>  	if (d->request_count < 0 || d->request_count > dma->buf_count) {
>  		DRM_ERROR("Process %d trying to get %d buffers (of %d max)\n",
> -			  DRM_CURRENTPID, d->request_count, dma->buf_count);
> +			  task_pid_nr(current),
> +			  d->request_count,
> +			  dma->buf_count);
>  		return -EINVAL;
>  	}
> =20
> diff --git a/drivers/gpu/drm/mga/mga_drv.h b/drivers/gpu/drm/mga/mga_dr=
v.h
> index a45bb22275a7..7844a9e463f6 100644
> --- a/drivers/gpu/drm/mga/mga_drv.h
> +++ b/drivers/gpu/drm/mga/mga_drv.h
> @@ -199,10 +199,14 @@ extern long mga_compat_ioctl(struct file *filp, u=
nsigned int cmd,
> =20
>  #define mga_flush_write_combine()	wmb()
> =20
> -#define MGA_READ8(reg)		DRM_READ8(dev_priv->mmio, (reg))
> -#define MGA_READ(reg)		DRM_READ32(dev_priv->mmio, (reg))
> -#define MGA_WRITE8(reg, val)	DRM_WRITE8(dev_priv->mmio, (reg), (val))
> -#define MGA_WRITE(reg, val)	DRM_WRITE32(dev_priv->mmio, (reg), (val))
> +#define MGA_READ8(reg) \
> +	readb(((void __iomem *)dev_priv->mmio->handle) + (reg))
> +#define MGA_READ(reg) \
> +	readl(((void __iomem *)dev_priv->mmio->handle) + (reg))
> +#define MGA_WRITE8(reg, val) \
> +	writeb(val, ((void __iomem *)dev_priv->mmio->handle) + (reg))
> +#define MGA_WRITE(reg, val) \
> +	writel(val, ((void __iomem *)dev_priv->mmio->handle) + (reg))

Addition is not defined or implementation specific for type void* IIRC.
Compilers tend to treat it like u8*. Maybe cast mmio->handle to (u8
__iomem *) instead?

Best regards
Thomas

> =20
>  #define DWGREG0		0x1c00
>  #define DWGREG0_END	0x1dff
> diff --git a/drivers/gpu/drm/mga/mga_irq.c b/drivers/gpu/drm/mga/mga_ir=
q.c
> index 693ba708cfed..c6a3fab5b0c4 100644
> --- a/drivers/gpu/drm/mga/mga_irq.c
> +++ b/drivers/gpu/drm/mga/mga_irq.c
> @@ -122,19 +122,19 @@ int mga_driver_fence_wait(struct drm_device *dev,=
 unsigned int *sequence)
>  {
>  	drm_mga_private_t *dev_priv =3D (drm_mga_private_t *) dev->dev_privat=
e;
>  	unsigned int cur_fence;
> -	int ret =3D 0;
> =20
>  	/* Assume that the user has missed the current sequence number
>  	 * by about a day rather than she wants to wait for years
>  	 * using fences.
>  	 */
> -	DRM_WAIT_ON(ret, dev_priv->fence_queue, 3 * HZ,
> +	wait_event_timeout(dev_priv->fence_queue,
>  		    (((cur_fence =3D atomic_read(&dev_priv->last_fence_retired))
> -		      - *sequence) <=3D (1 << 23)));
> +		      - *sequence) <=3D (1 << 23)),
> +		    msecs_to_jiffies(30));
> =20
>  	*sequence =3D cur_fence;
> =20
> -	return ret;
> +	return 0;
>  }
> =20
>  void mga_driver_irq_preinstall(struct drm_device *dev)
> diff --git a/drivers/gpu/drm/mga/mga_state.c b/drivers/gpu/drm/mga/mga_=
state.c
> index e5f6b735f575..296a1db7e5ee 100644
> --- a/drivers/gpu/drm/mga/mga_state.c
> +++ b/drivers/gpu/drm/mga/mga_state.c
> @@ -1016,7 +1016,7 @@ int mga_getparam(struct drm_device *dev, void *da=
ta, struct drm_file *file_priv)
>  		return -EINVAL;
>  	}
> =20
> -	DRM_DEBUG("pid=3D%d\n", DRM_CURRENTPID);
> +	DRM_DEBUG("pid=3D%d\n", task_pid_nr(current));
> =20
>  	switch (param->param) {
>  	case MGA_PARAM_IRQ_NR:
> @@ -1048,7 +1048,7 @@ static int mga_set_fence(struct drm_device *dev, =
void *data, struct drm_file *fi
>  		return -EINVAL;
>  	}
> =20
> -	DRM_DEBUG("pid=3D%d\n", DRM_CURRENTPID);
> +	DRM_DEBUG("pid=3D%d\n", task_pid_nr(current));
> =20
>  	/* I would normal do this assignment in the declaration of fence,
>  	 * but dev_priv may be NULL.
> @@ -1077,7 +1077,7 @@ file_priv)
>  		return -EINVAL;
>  	}
> =20
> -	DRM_DEBUG("pid=3D%d\n", DRM_CURRENTPID);
> +	DRM_DEBUG("pid=3D%d\n", task_pid_nr(current));
> =20
>  	mga_driver_fence_wait(dev, fence);
>  	return 0;
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Linux GmbH, Maxfeldstrasse 5, 90409 Nuernberg, Germany
GF: Felix Imend=C3=B6rffer, Mary Higgins, Sri Rasiah
HRB 21284 (AG N=C3=BCrnberg)


--VWUtngvuR0Us1x39JOkNrBTBobksx9FtF--

--uoS6AW898rEgtX0HfMvrnggLppeukiv8y
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEchf7rIzpz2NEoWjlaA3BHVMLeiMFAlz/XMQACgkQaA3BHVML
eiP4MQf9HV7UQsWyMX3eyve+6Ir4jgDrcAAN6/gMUM1mffV7n4CgAXbKfiKAJ2n5
vR/eEI+4MeHJvzXzEuIoz7rSEiQqukzCfCaLgPKbG2j2jo4tRrbvOEAab+SbeQdu
8DvrxOFmlDdfRZ2QBZSsJuAblkstzJ+rR6X20nJVOjawlTt2Whqy32lbEg9RyEAZ
iujZBKdiuzx+xXtf8QeOr2wG5AfIvYr1yVK1XxCnt7LK06YE0sRdqQoguU2yIX1d
PAUtKusODcvFU/iwNK9zn49CsHxtu8ZoFUJsqavGG1kNCLUdJTyQ4S/p6DH86Pgt
6bFvBIj/AmndayZ+u30JQiVMXqNL3w==
=6Hho
-----END PGP SIGNATURE-----

--uoS6AW898rEgtX0HfMvrnggLppeukiv8y--

--===============1333602335==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1333602335==--
