Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D81E93C98F
	for <lists+dri-devel@lfdr.de>; Tue, 11 Jun 2019 12:58:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BEF1D89175;
	Tue, 11 Jun 2019 10:58:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A04FB89175
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Jun 2019 10:58:38 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 387D8AC54;
 Tue, 11 Jun 2019 10:58:37 +0000 (UTC)
Subject: Re: [PATCH v1 1/4] drm/mga: drop dependency on drm_os_linux.h
To: Sam Ravnborg <sam@ravnborg.org>
References: <20190608081923.6274-1-sam@ravnborg.org>
 <20190608081923.6274-2-sam@ravnborg.org>
 <2a7f442c-af70-9209-e678-0689469bb308@suse.de>
 <20190611104435.GA31250@ravnborg.org>
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
Message-ID: <57be61df-c7e4-73c7-6aba-0cf440cb3e60@suse.de>
Date: Tue, 11 Jun 2019 12:58:33 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190611104435.GA31250@ravnborg.org>
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
Cc: David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============0635058343=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============0635058343==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="IpmJlHwemzWyCZdHLof4lzXdwCeTLJGyE"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--IpmJlHwemzWyCZdHLof4lzXdwCeTLJGyE
Content-Type: multipart/mixed; boundary="UUYgK3O7mkxKL9v0HJZt951Vx3uwkmVF1";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Sam Ravnborg <sam@ravnborg.org>
Cc: David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org
Message-ID: <57be61df-c7e4-73c7-6aba-0cf440cb3e60@suse.de>
Subject: Re: [PATCH v1 1/4] drm/mga: drop dependency on drm_os_linux.h
References: <20190608081923.6274-1-sam@ravnborg.org>
 <20190608081923.6274-2-sam@ravnborg.org>
 <2a7f442c-af70-9209-e678-0689469bb308@suse.de>
 <20190611104435.GA31250@ravnborg.org>
In-Reply-To: <20190611104435.GA31250@ravnborg.org>

--UUYgK3O7mkxKL9v0HJZt951Vx3uwkmVF1
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi

Am 11.06.19 um 12:44 schrieb Sam Ravnborg:
> Hi Thomas.
>=20
>>> +#define MGA_READ8(reg) \
>>> +	readb(((void __iomem *)dev_priv->mmio->handle) + (reg))
>>> +#define MGA_READ(reg) \
>>> +	readl(((void __iomem *)dev_priv->mmio->handle) + (reg))
>>> +#define MGA_WRITE8(reg, val) \
>>> +	writeb(val, ((void __iomem *)dev_priv->mmio->handle) + (reg))
>>> +#define MGA_WRITE(reg, val) \
>>> +	writel(val, ((void __iomem *)dev_priv->mmio->handle) + (reg))
>>
>> Addition is not defined or implementation specific for type void* IIRC=
=2E
>> Compilers tend to treat it like u8*. Maybe cast mmio->handle to (u8
>> __iomem *) instead?
> I briefly looked at changing the type of mmio->handle
>=20
> Today:
>=20
> 	void *handle;            /**< User-space: "Handle" to pass to mmap() *=
/
>=20
> Proposal:
> 	void __iomem *handle;            /**< User-space: "Handle" to pass to =
mmap() */
>=20
> This would allow me to drop the cast in the code above, that is only
> added to make sparse happy.
> But the above triggered other sparse warnings and I ended up dropping
> this.
>=20
> As for (void *) versus (u8 *), then (void *) is what we do today.
> [What Daniel also says in another mail].
>=20
> Should we change the type I would prepfer a follow-up patch to do it.
>=20
> If you could test it I can type the patch, or you could do so when
> working with the driver.

I don't really do anything with mga, so my testing is as good as
anyone's. But it's not that important. Don't make this patch set depend
on such mostly cosmetic issues.

Best regards
Thomas


>=20
> 	Sam
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Linux GmbH, Maxfeldstrasse 5, 90409 Nuernberg, Germany
GF: Felix Imend=C3=B6rffer, Mary Higgins, Sri Rasiah
HRB 21284 (AG N=C3=BCrnberg)


--UUYgK3O7mkxKL9v0HJZt951Vx3uwkmVF1--

--IpmJlHwemzWyCZdHLof4lzXdwCeTLJGyE
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEchf7rIzpz2NEoWjlaA3BHVMLeiMFAlz/iVkACgkQaA3BHVML
eiMhAggAw0SQjoHO7NboRVgQTiveCytJUB35nYQwK12KxEf74E2Sl9Xw9rC22H/W
+Vbt2AWYrPvKujJIJ62sU0sPqopj/ImLKoVN3z61VyzTt/qiuMN0DVq3UTbCg9dh
za6V7ssFKY3/u/8rvoVwJ7QqAeOmHDOaIbK5q+gqss6k0TdfsxEnzNXRFaDxTpw8
xa64l2B0rkEUGAANfM8XoE15L81zDiZr6qltM2oj2SDZZT3ajCauNF9OV/OWdebF
ZPnw31iH8q2gVbRksTztR0fk6Krw2OjzlRF5ET0SgLv4TRZZAGZRh5rufu3Leoqy
8D3Up4OogbSGmtK4OWXy88iF/U1Jkw==
=LdFd
-----END PGP SIGNATURE-----

--IpmJlHwemzWyCZdHLof4lzXdwCeTLJGyE--

--===============0635058343==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0635058343==--
