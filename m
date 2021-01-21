Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E5F622FE46F
	for <lists+dri-devel@lfdr.de>; Thu, 21 Jan 2021 08:56:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 60DFB6E4EA;
	Thu, 21 Jan 2021 07:56:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C4116E055
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Jan 2021 07:56:00 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 9160AB01F;
 Thu, 21 Jan 2021 07:55:58 +0000 (UTC)
Subject: Re: [PATCH] drm/ast: Update the sequence of Clearing Fast-reset
To: KuoHsiang Chou <kuohsiang_chou@aspeedtech.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20210118085755.107804-1-kuohsiang_chou@aspeedtech.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
Message-ID: <fe524173-058a-1e6b-503a-6c2294e7594a@suse.de>
Date: Thu, 21 Jan 2021 08:55:56 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210118085755.107804-1-kuohsiang_chou@aspeedtech.com>
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
Cc: airlied@linux.ie, jenmin_yuan@aspeedtech.com, tommy_huang@aspeedtech.com,
 arc_sung@aspeedtech.com, airlied@redhat.com
Content-Type: multipart/mixed; boundary="===============1619852723=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============1619852723==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="jy2BE2ZYsb1zsRwZk39lCNO7PfOwVDQUQ"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--jy2BE2ZYsb1zsRwZk39lCNO7PfOwVDQUQ
Content-Type: multipart/mixed; boundary="M3FbcYwRAQp89Zilv0UF9VVrvnXMVGqkQ";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: KuoHsiang Chou <kuohsiang_chou@aspeedtech.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Cc: airlied@linux.ie, tommy_huang@aspeedtech.com, jenmin_yuan@aspeedtech.com,
 airlied@redhat.com, arc_sung@aspeedtech.com
Message-ID: <fe524173-058a-1e6b-503a-6c2294e7594a@suse.de>
Subject: Re: [PATCH] drm/ast: Update the sequence of Clearing Fast-reset
References: <20210118085755.107804-1-kuohsiang_chou@aspeedtech.com>
In-Reply-To: <20210118085755.107804-1-kuohsiang_chou@aspeedtech.com>

--M3FbcYwRAQp89Zilv0UF9VVrvnXMVGqkQ
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi

Am 18.01.21 um 09:57 schrieb KuoHsiang Chou:
> [Bug][AST2500]
> If SCU00 is not unlocked, just enter its password again.
> It is unnecessary to clear AHB lock condition and restore WDT default
> setting again, before Fast-reset clearing.
>=20
> Signed-off-by: KuoHsiang Chou <kuohsiang_chou@aspeedtech.com>

Is this a separate issue? This patch looks like a fix for the previous=20
patch. [1] Can you add this change to v3 of the other patch?

Best regards
Thomas

[1]=20
https://lore.kernel.org/dri-devel/20210112075811.9354-1-kuohsiang_chou@as=
peedtech.com/

> ---
>   drivers/gpu/drm/ast/ast_post.c | 5 +----
>   1 file changed, 1 insertion(+), 4 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/ast/ast_post.c b/drivers/gpu/drm/ast/ast_p=
ost.c
> index 1f0007daa005..4f194c5fd2c2 100644
> --- a/drivers/gpu/drm/ast/ast_post.c
> +++ b/drivers/gpu/drm/ast/ast_post.c
> @@ -2030,7 +2030,6 @@ void ast_patch_ahb_2500(struct ast_private *ast)
>   {
>   	u32	data;
>=20
> -patch_ahb_lock:
>   	/* Clear bus lock condition */
>   	ast_moutdwm(ast, 0x1e600000, 0xAEED1A03);
>   	ast_moutdwm(ast, 0x1e600084, 0x00010000);
> @@ -2044,11 +2043,9 @@ void ast_patch_ahb_2500(struct ast_private *ast)=

>   		ast_moutdwm(ast, 0x1E78500c, 0x00000033);
>   		udelay(1000);
>   	}
> -	ast_moutdwm(ast, 0x1e6e2000, 0x1688A8A8);
>   	do {
> +		ast_moutdwm(ast, 0x1e6e2000, 0x1688A8A8);
>   		data =3D ast_mindwm(ast, 0x1e6e2000);
> -		if (data =3D=3D 0xffffffff)
> -			goto patch_ahb_lock;
>   	}	while (data !=3D 1);
>   	ast_moutdwm(ast, 0x1e6e207c, 0x08000000);	/* clear fast reset */
>   }
> --
> 2.18.4
>=20
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


--M3FbcYwRAQp89Zilv0UF9VVrvnXMVGqkQ--

--jy2BE2ZYsb1zsRwZk39lCNO7PfOwVDQUQ
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmAJM4wFAwAAAAAACgkQlh/E3EQov+D8
Iw//eqodlyeLvpazsZHTUz0gOm6zdWC0w48m+hINGXQGbMlTaH+B5xC1Mbd4v+YQhbKfkWvfpEt/
MMhvMZY4eKSzZyCCkj9g3HBXZiqTlOSIwERv09yms2H0SSa/ABw8ks9JjZDe9Og8w6JRvWWPIq6g
JIB8+E18rfMuydQH8PwtnLsNTYoq30m27SXU+cs5v7tpgw2Fle4JYcUWgPs5SxNWpmFLlmNOlGvz
DEe3l/CKRz7XhRkrEZC5tJL6ELbzTG6t1EGH5CnHJgYpVSRaSGinnxVq8dp+Fq2qd59sC/86Xv7S
XKYG3MbG81vB2ABCMQFAwfC7+nZFhL/gv73dTYbJC49APA4YUVZKzTkvVN2Wh0bQIhX4U2St3LGd
PdKP32e8M1p7j5ZcDzDxPlO5qjBQJUgvyeNIu2b9/QaXvPKxbjpXqQHhmOA25OI5yJ1FE9bMZ64J
toyWIt0TclR/9RTO0w2+Gvu/8SKdpUTcHeeEe6SPw8xyKki+BElGCaTgiL/nbevFt29XlBUP0Ggr
uUs8SE3EstjawrOyaGAXbE3E+QNhTTt3DxZ0OMntguJpDUTJKvI+CTlBGV8UfAZ5x79DfLhHIqbE
1ROryPbBqpxSh5Z5LHCOB/XqF9pTi/I/8flw58fVmQiRvaMgNlIl6OBvRRmw8TdfSfMIF//GVYRr
OSk=
=RPCY
-----END PGP SIGNATURE-----

--jy2BE2ZYsb1zsRwZk39lCNO7PfOwVDQUQ--

--===============1619852723==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1619852723==--
