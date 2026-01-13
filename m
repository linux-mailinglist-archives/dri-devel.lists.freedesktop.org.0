Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C9291D19473
	for <lists+dri-devel@lfdr.de>; Tue, 13 Jan 2026 15:05:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D06D310E350;
	Tue, 13 Jan 2026 14:05:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=aol.com header.i=@aol.com header.b="bqlRAiZm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sonic306-20.consmr.mail.gq1.yahoo.com
 (sonic306-20.consmr.mail.gq1.yahoo.com [98.137.68.83])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B69C10E350
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Jan 2026 14:05:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aol.com; s=a2048;
 t=1768313141; bh=UXqT3OxvL4fWZ5v0F/aacWjVx/cPbj2b1GcMebuJ8wE=;
 h=Subject:From:To:Cc:Date:In-Reply-To:References:From:Subject:Reply-To;
 b=bqlRAiZm3ZfPqWpEX4BGKXPWbwh51+Cz3cmetWwekqPLeSo66ZbdowISE3Ls8g897LpS269yt+d58H/AB9b1aQ4eUMVDckuztpxkG5V4kLauPL4lEEdy9oBVX90Pwe9sKorehFppI1+hn9+ulTNbTls4mi+H6VPI3pEXMayZ3bSLiqEHa4pg6ypBq4tmQzxcNcav2vhfXSRWjDyB0jde1jT0gPHXttL+xrJIm0fqDO7SMsZZgywfnWghPFSpA2bjgU9xjoIP/SeHpzbbzbXEH88rpPQPds5joSlXPDdPyBce18WVjVI5e48xgtfucK+URe/5NbPYBzWmIIeFtsVXLg==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
 t=1768313141; bh=eMOtkEEOyEIBkosqnJ2b/wnvPGSnOtR3xRuqnUBIKvs=;
 h=X-Sonic-MF:Subject:From:To:Date:From:Subject;
 b=b0rmsEMEK9J8hswsEpaZC48T5dUrUUpvBC+bs4ivn0TYef9k7DN3MKDBuXcB29kjrFLlAMrmybmPjBxFcnEeupWkE6T3f8N/lGQDQ6MAB/w5VbqWO/6LQ74cDVSt1rOJVtDsMz+Batsq114RHTw5mWXeXpr6ET0aZIVbPGGpyek7YP4uUhxAV/Y24XPJdwqgC9N5TD7X63E1cLSjl1fqRHw4/GaVbOliMgpBCzPQGKgWrxuIV4KroF2Ay7ZDPfJQHO7nNnl1CdA2QBkf5qepy3T2GNfRuO1NHeSbYYs6WzzSaRIwnc6FmMhn0c90kuE8B9Vo4tkSNApNJgf4CDj8Ew==
X-YMail-OSG: rxZL8cQVM1mKaBXGS2.SHA92D1KBUhJUkejW6wCtp.YpsAf1GgyfF4V3UsRQASh
 AccHnyHKAWCj24mWJ5pbEDHciTDjODcjctOdOInluMgq2IuJ2ZJGiAPJLIKgrNMDF4b6.PE57rAU
 PJrv52oRr4WTRyXxrYphVmEGUtYYlcbKa5t63PEYq4r7zRlLOYjg97QJSt0L6E1EtVJ7gBshQFAk
 SdmtGxk6rKG8QUsCXl_umvnA975lqkezGKfnaQxj0BEW6yNa1gCBNENN6ERO_RdEuU7B1O58uzwT
 JEEoe3Qkb6XGfWTaID5k2vfUUNAWpYvGW4G2L4CRxN4Z7YGYRX.s8t8tQo9MDCKe4f3M4s1EvKjQ
 Ux88Sf2Rmp6yRoCrtYOXmIRfPjPXdmpBqyqAJD1tCXb6ffZeJiqu6.S_kO9cMemd0LJK0HlHJCst
 fDIZ0aMGQ8tlRnyC7WeBLhijawoUrirq5RNv682dzwLHyvLL0WdYWpznCRzLRInXxi9raqBHg.zz
 O_1rgUBjBhehcPmiEvQlGeHc2zuG8dXjGwLqr0De9OjRpIvkrYvY.EolYCuT0rECOSvDUJBHcp0.
 yrNEJhb7A64Oj60xMdo.aHK1oL5PNhSrhGm4R0z1aD3kyZhpnsnrNhX.KrryDrp4a3zXKcfNfAcC
 ojWoVqalnHww7lzg7MEiL_pjNOFqnOCebaIIbP.HHOxW05x9kHDEUh34fwqYrLRh3J_V5OZuSXvX
 skxTwHIDjuGmRaiFlrW0RBDB7l7VzvKZgD3d9ct9hFRczB.p9xFXT.VHQjQ.ZT00oZfIYkCSXibF
 CmH3RW2hy9zZmlzh3QLiNLaSVvGnKsmZ_PmFMXTpzucAyUi6Fq5vRx5sxSblgPa1cQcAtbLclcNO
 K5X7aZqreIiKOIKstn7XoTZCRyUBtH3nQYpaBtqWG3d_NRopSnmYRp3zJnmO6Fwy7MXhb5UvBA84
 4MohFRg2h0TSuobYmmVj3HMBOK54ULoj2_BCxxCxR9cgv.01tC9gGCPwvOPwrQf5_3cETZ5OuIzX
 .C1faUh2hetYwgVRQw8T9Lu5U75vqQBu_pFuf1kT04zQ.viWg8b9oPiXq4fzq045b4bMe1aJsZPA
 1Epc_w8VVdXff6ClM.Pgyf77x0kNoKRNwGzngriJDu5BVWRmt8U8tJSxxDwphtQGYPKcOiaI1shS
 XozhboEhMCnua7yzdtnxJ6wzmANRF3VPCTJXHE3o9unC4STe48bDvY34O.JinzogfaD1KVT9awcs
 C6cngFq29gmfsHpVmpk0flJLGLYAOyJtzU5EcnhPd3HN8pfwHKrO7ulcw7UkKnFx_eI5JXQjmpVr
 SF41RWodYnBH9iYRxVVwE39ns3hfOizYdN3Lo08bOu8rotaIar0iIATo1OfMoBcZC_3V_mTyYdDA
 jOesmQX7HxvgmTMvD5qr8yP8w._wouBK5sfSR3YK6_huftpmpX0af0zFp8D0PQbH3JVYtUgQt60C
 3N02A9QdH_NUDbCA8pEFiDEdmta3zSTD8ZXte9xSAEHX6aKdlNcBpGvCvr1TclTsdAUm1eFlCaJI
 kgUs7f50TooEprx9wyPhBY8hNsNYJa5Um.maSDKOR5.Iwev.Qv5_eaPuY6btVCxnrBdiVwXV9WX_
 4wTeekAMSYBl.w0BvBYyA63FFNcRRk6HjzJyOHCipxB9FVbktEtaR3bA9SXZiWaBYOzjYpqSyPl5
 fCllfN4fWSLK87XGMTInUSrXF9E0E5sihVQPoBMKaZ9m1Ki2dL1XoE0iiUfsl.vTGDO57iuk6qPs
 BQJ2tXrbhpMVnXEx9XyKW5YeOt.COWHrjRpZdRBd0BcjUDCByxJqA.nilEcx4n8qoG_lz36KvL_L
 oN4I2bDbAqvrfQcLj1obpbng8nXkmTtGOcIQiY_fMDT0pfIJTRZPX6weA6WUQxWc0DIkZL6oaEKr
 ozOIXKo4vVkGZ6RK4Zi0.d9gk54suxJInfClbER8JJ91YVPMVRKYXx8Ui9V1meunRPMj7Uv.sFoq
 pjQuMiDsQBzduVfvlcRPguktgdFMhCTkQ39vx6s2hTHkj6ugT5IDLZK3gdVqI9ifxppWyS7exKs7
 wEoX5kbbU.MY8v3YXW3qCU6yOv4s82EYfd_KXabYIXvJZcBVzTengXwSjCdVfDDKxVw.wmsEHzMS
 dhvFMM6vTVmEqSAbF9c7M99MFQONcSEfsMCLOMbKJJ_x5SMPHuCCar9gAmj1eDbP3zeEkg0tIf9y
 5nrq505SmBCW39jrPJUVmTgXLeaILIRFZc_3BmOPey8E9VIzziiAYStCJNDL7R56Owc_3vZV1rVr
 cwA--
X-Sonic-MF: <rubenru09@aol.com>
X-Sonic-ID: 813af666-4f25-4c68-8622-4131645669d7
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic306.consmr.mail.gq1.yahoo.com with HTTP; Tue, 13 Jan 2026 14:05:41 +0000
Received: by hermes--production-ir2-6fcf857f6f-7nlzs (Yahoo Inc. Hermes SMTP
 Server) with ESMTPA ID 9b43bdbb810054b7366e75cd1eadd578; 
 Tue, 13 Jan 2026 14:05:38 +0000 (UTC)
Message-ID: <69a714228f562d399e78cd0e54a23769490336f9.camel@aol.com>
Subject: Re: [PATCH] drm/gud: fix NULL fb and crtc dereferences on USB
 disconnect
From: Ruben Wauters <rubenru09@aol.com>
To: Shenghao Yang <me@shenghaoyang.info>, Thomas Zimmermann	
 <tzimmermann@suse.de>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>,  Maxime Ripard <mripard@kernel.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 stable@vger.kernel.org
Date: Tue, 13 Jan 2026 14:05:35 +0000
In-Reply-To: <65110c51-1f47-4382-ac92-518c7f157a06@shenghaoyang.info>
References: <20251231055039.44266-1-me@shenghaoyang.info>
 <28c39f1979452b24ddde4de97e60ca721334eb49.camel@aol.com>
 <938b5e8e-b849-4d12-8ee2-98312094fc1e@shenghaoyang.info>
 <571d40f4d3150e61dfb5d2beccdf5c40f3b5be2c.camel@aol.com>
 <c6324a66-5886-4fbb-ba7b-fc7782c0f790@suse.de>
 <229b5608222595bc69e7ca86509086a14501b2f7.camel@aol.com>
 <8929ff0f-c2e0-49e6-a0ce-c4b0dcebae99@suse.de>
 <65110c51-1f47-4382-ac92-518c7f157a06@shenghaoyang.info>
Autocrypt: addr=rubenru09@aol.com; prefer-encrypt=mutual;
 keydata=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
 eIvzsqg==
Content-Type: multipart/signed; micalg="pgp-sha256";
 protocol="application/pgp-signature"; boundary="=-WK1prZNvwrKcwvmDYqit"
User-Agent: Evolution 3.56.2 
MIME-Version: 1.0
X-Mailer: WebService/1.1.24866
 mail.backend.jedi.jws.acl:role.jedi.acl.token.atz.jws.hermes.aol
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--=-WK1prZNvwrKcwvmDYqit
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2026-01-08 at 21:39 +0800, Shenghao Yang wrote
Hi
> Hi Ruben, Thomas,
>=20
> On 7/1/26 23:56, Thomas Zimmermann wrote:
>=20
> >=20
> > No worries, DRM semantics can be murky. This is one of the cases that i=
s impossible to know unless you came across a patch like this one.
> >=20
> > Best regards
> > Thomas
> >=20
> > > > I think the patch is fine and IIRC we have similar logic in other d=
rivers.
> > > Reviewed-by: Ruben Wauters <rubenru09@aol.com>

Patch applied to drm-misc-fixes, thanks
> > >=20
> > > I believe Shenghao mentioned another oops that is present? if so it m=
ay
> > > be best to submit that in a separate patch rather than a v2 of this
> > > one.
> > >=20
> > > Ruben
>=20
>=20
> Thanks both! I'll split the patch for the second oops.
>=20
> Shenghao

--=-WK1prZNvwrKcwvmDYqit
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iQJPBAABCAA5FiEE3obNNdPQ9V5CQi2Y0n5QwFCuDOEFAmlmUS8bFIAAAAAABAAO
bWFudTIsMi41KzEuMTEsMiwyAAoJENJ+UMBQrgzhuogP/1FYmM6VabykYtv2eR2L
jVMsjHXGBVF3zpEZHxXsxCDf+csh27ZOdbfgE9Imbr1Z/0VEm8+He02X+fYNo/70
OkeCh3WKEWwiOhlYnuc+yoLvQUCFujXqy9AySMfDHpErGlVG0iksLCLzDKgDTYiW
cu4Jz7iXrVIwoLVtfG0Tzawe1JOmDDdHxFHxl8SbpPy2fy3W8496nMy1v/t5QvVX
lpsyUfh+qtwfn1JyzkzXcNYlwojUIqhTa000gDs2S+yltobOPosxrqA09icFovGK
IEqGO9kUU0HVM8c2uCJit3JME59z8gEL/3La46nFtoWuh620AtvvpcU0xk65wX9c
hN393S5s6ey2v5je+Ypk2//Oj9t1lZbQzclsqmbn1RpGL9KLdPTmsirbtMLRgRBM
ppYiC8Mo3YRyxPO4ra2gVl908JrtfjQhrIZ1MrhtxCqAgZgVtMzCOCjmusFT1cDl
kXdxFyjZKT8o6NATkNj5+NN5h2nhrkQiQh9B2I/vd5yZomgkvMkGHocw6xR8Lzi1
wP0HQ6UYy5zgi3nRTRZQz7bU0mG9caomrBC3zXcth5plqeqlLlAw4Q52hgu9a1J6
ovorUrc1YYeZbNJ+0xrBmLPwRcDaGeXKTCmr2GVuPhsp6TAGM5Nwrc22eBt2iytC
BvT2qdA2bVnEJI2uUhH7XjTj
=Exhg
-----END PGP SIGNATURE-----

--=-WK1prZNvwrKcwvmDYqit--
