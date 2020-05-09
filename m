Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FBD71CBCDE
	for <lists+dri-devel@lfdr.de>; Sat,  9 May 2020 05:15:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE0776E183;
	Sat,  9 May 2020 03:14:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7CDCB6E183
 for <dri-devel@lists.freedesktop.org>; Sat,  9 May 2020 03:14:53 +0000 (UTC)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 49JskN5rBkz9sRf;
 Sat,  9 May 2020 13:14:36 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
 s=201702; t=1588994089;
 bh=Sr12Ya6sNtsYbXP7Gz0Y0ESEGjjzqQ70flvfpUON8qs=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=QuxExV91rxC96TVgaI9oTgNWRCiOCtkAQQl5asAhoQLFJXb/hESqI/CSglCV7nKwi
 KgXl3aLh+dtT6O21IVlVcwcjMwTtDzzY5VDpEaf0XANiknL183EMmQ76jfH9jQ3ysm
 ct566+72mGrBZhdDAMCPD6b5oSIx+zmdt5najo6E5biM1ffJkC1h7fhL/CBzdYTMrp
 G5ChFjzjNskDG26IObGff6KL6C+RRB5Ko2YwhM8LrCx5tkqZcckzB/Zt2ikh2w0rcG
 GGeUxfzCopQ14PYa8IZoFYu2YwQw7PIzbaXT4QqsN91A6JWe0b22yEdeOkEJ8TLLpe
 Vyowd30OjrvyA==
Date: Sat, 9 May 2020 13:14:34 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH] drm: vmwgfx: include linux/highmem.h
Message-ID: <20200509131434.27ddccb9@canb.auug.org.au>
In-Reply-To: <20200508220150.649044-1-arnd@arndb.de>
References: <20200508220150.649044-1-arnd@arndb.de>
MIME-Version: 1.0
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
Cc: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Dave Hansen <dave.hansen@linux.intel.com>, dri-devel@lists.freedesktop.org,
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
 Max Filippov <jcmvbkbc@gmail.com>, Huang Rui <ray.huang@amd.com>,
 Paul Mackerras <paulus@samba.org>, "H. Peter Anvin" <hpa@zytor.com>,
 Ira Weiny <ira.weiny@intel.com>, Christoph Hellwig <hch@lst.de>,
 Thomas Hellstrom <thellstrom@vmware.com>, Helge Deller <deller@gmx.de>,
 Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
 VMware Graphics <linux-graphics-maintainer@vmware.com>,
 Borislav Petkov <bp@alien8.de>, Al Viro <viro@zeniv.linux.org.uk>,
 Andy Lutomirski <luto@kernel.org>, Dan Williams <dan.j.williams@intel.com>,
 Chris Zankel <chris@zankel.net>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-kernel@vger.kernel.org,
 Christian =?UTF-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 Thomas Gleixner <tglx@linutronix.de>,
 Andrew Morton <akpm@linux-foundation.org>,
 "David S. Miller" <davem@davemloft.net>
Content-Type: multipart/mixed; boundary="===============0726207346=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============0726207346==
Content-Type: multipart/signed; boundary="Sig_/LruK9RrFyqBl+3yphC.Izb2";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/LruK9RrFyqBl+3yphC.Izb2
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Arnd,

On Sat,  9 May 2020 00:01:31 +0200 Arnd Bergmann <arnd@arndb.de> wrote:
>
> In order to call kmap_atomic() etc, we need to include linux/highmem.h:
>=20
> drivers/gpu/drm/vmwgfx/vmwgfx_blit.c: In function 'vmw_bo_cpu_blit_line':
> drivers/gpu/drm/vmwgfx/vmwgfx_blit.c:377:4: error: implicit declaration o=
f function 'kunmap_atomic'; did you mean 'in_atomic'? [-Werror=3Dimplicit-f=
unction-declaration]
>   377 |    kunmap_atomic(d->src_addr);
>       |    ^~~~~~~~~~~~~
>       |    in_atomic
> drivers/gpu/drm/vmwgfx/vmwgfx_blit.c:391:5: error: implicit declaration o=
f function 'kmap_atomic_prot' [-Werror=3Dimplicit-function-declaration]
>   391 |     kmap_atomic_prot(d->dst_pages[dst_page],
>       |     ^~~~~~~~~~~~~~~~
> drivers/gpu/drm/vmwgfx/vmwgfx_blit.c:390:16: warning: assignment to 'u8 *=
' {aka 'unsigned char *'} from 'int' makes pointer from integer without a c=
ast [-Wint-conversion]
>   390 |    d->dst_addr =3D
>       |                ^
> drivers/gpu/drm/vmwgfx/vmwgfx_blit.c:403:16: warning: assignment to 'u8 *=
' {aka 'unsigned char *'} from 'int' makes pointer from integer without a c=
ast [-Wint-conversion]
>   403 |    d->src_addr =3D
>       |                ^
>=20
> Fixes: 46385a895322 ("drm: remove drm specific kmap_atomic code")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>  drivers/gpu/drm/vmwgfx/vmwgfx_blit.c | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_blit.c b/drivers/gpu/drm/vmwgf=
x/vmwgfx_blit.c
> index 94d456a1d1a9..1629427d5734 100644
> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_blit.c
> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_blit.c
> @@ -27,6 +27,7 @@
>   ***********************************************************************=
***/
> =20
>  #include "vmwgfx_drv.h"
> +#include <linux/highmem.h>
> =20
>  /*
>   * Template that implements find_first_diff() for a generic
> --=20
> 2.26.0
>=20

Added to linux-next for Monday (in case Andrew doesn't get around to it).

--=20
Cheers,
Stephen Rothwell

--Sig_/LruK9RrFyqBl+3yphC.Izb2
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl62IBoACgkQAVBC80lX
0GwnAgf/UN+9W0C6W35cVuOUG1IADDrDP9dNx5i7CYj/hbyhYDo3V4Y7B1gtANBP
YIKfKxM4GuolXI6HhF6hj8ukF+UX3cI45+6adqA+1wD2MfHa8694yyrgj4sWE9wn
t4/7W2DTjKMuh0YDZOjs2ufEAECwgTOUIOH+AZiWvko4bqRwSjK6lqIqsbhZf842
mq7MGEs1R8Ke/Q2BpNGLvoj8HRw4/zdrTy+uR2nDdpEshacKE05UllaEcvOg8iWo
hAaakwFXIg44JuidWrwGH3pdr81cK3vBnYubx5rHdyxxlQ8GeIsIMrtcbvtMwWxQ
OaLntmpT6n0hTJKeFYoR5Zg7nXsHRA==
=0wW0
-----END PGP SIGNATURE-----

--Sig_/LruK9RrFyqBl+3yphC.Izb2--

--===============0726207346==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0726207346==--
