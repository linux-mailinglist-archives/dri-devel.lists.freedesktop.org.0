Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EC38C0826F
	for <lists+dri-devel@lfdr.de>; Fri, 24 Oct 2025 23:09:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F33FA10EB47;
	Fri, 24 Oct 2025 21:09:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=aol.com header.i=@aol.com header.b="mySVygt7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sonic307-36.consmr.mail.ne1.yahoo.com
 (sonic307-36.consmr.mail.ne1.yahoo.com [66.163.190.59])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7004B10EB44
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Oct 2025 21:09:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aol.com; s=a2048;
 t=1761340192; bh=Pzif7/mINQaZkLzqKOjPl3idhL7UrJsjv6sbK3ZyQBM=;
 h=Subject:From:To:Cc:Date:In-Reply-To:References:From:Subject:Reply-To;
 b=mySVygt7X6g6e70BWLdFr0zswkXrugVOhSk6Op3MBih5Haf3Nk8Ktn+DXaeWWdMlqTJjT7IqTVvwaO4Jf7PhRVUgAKinqW5wTiY89T/yab7LTRfFBo7zAxrYNRMStsNWQivnUiTDnuj2UsICPm5F3599U869kv9UXlcMymMDGJL0avLygCunjZPhydykXojUKhb4GhXnYfjJa14eotGyS6Va6ZTMeo3Se3wZvQz42dHe+iDfkz3QGwNgFL2oYfU+BQUJCqzakhXx82OViBH1GiSXvEtPN6LXm8OPpqUXFNQep0OJBphNnxyX+AHIDYuh7fTp7Zjnpgh4NX7Kv/4XYQ==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
 t=1761340192; bh=oMtXXqEBbE99pFS0wo3KolqZyOwjhQKLSHq6YEFVg7F=;
 h=X-Sonic-MF:Subject:From:To:Date:From:Subject;
 b=gnIWlFZ4V+S3D9PmFsVpbLtNNXKMkPLykSWPgbyIgwrttD0s/NNLiUACQxOKyTW5uObYec0Nl0Jv5fseSzo78n1D1HlqZyEn/VAVKjeL4y9/AYbQLocW3RVaJGyFqTMESPiFTrT6Ht/OhYmwVF/q8/2Pz/q+q7wnuUtXank2BGtKySOb/Hu66BHEx4qoqDZEJsbPBQtDiMwPzR5vEh3mMUHEt7kkljy+HF/PUYA9I6yT4BJWhOiiQ68yFKgxgVI46TO0vxXNpKXNfKKz/+iwLPs5+8yRBPG7gIuroCSoa9VYnqE9rsm6OJd8Z/jk71jh3OGBwS7sYBaQy5eQVP2Rtg==
X-YMail-OSG: xVyqyakVM1l2LTvpgywzlnekh9pzlo1E7acNdEeE4bMjr4z5GF66fXI67sj2iUN
 p6FqxzDdS7kheHylo1rYv5I9d1mdIXKdq5yDfimxaEALw_ZKl9nOpA_uofXzrzNHoY1DEonz71Sj
 It1Fzuo7eFVbnr85aE9AKKSZ1MWFN8iB4Dq8u5Mvj7wUnZSSYmlkl2iCB8pNdfGbWwxbyq8TAJ9b
 FEOoU69Hfn9np1fCUGcvHSg6Hq8YZ0TJYFwrds.LxFIFtvZXOAU7CmICxuVtj562u17SKRAQsxir
 byIluHw3MzxVBbpdsbKSZnuS7MnzVFp4k.MXDecLfd294TgTBBXrOcwboi5GTK0ECEG4T49t44Ci
 rJgPgx01ANU.q0wt4LN7ib5qvIX37dTbu2ucdU87yBqHbPXE5YBxeN9SELEVDUKWGLW34A4EvR3n
 qKugB1bssEkPYgjJpf4MK3_k9k9Vtti2MkZVfqoBlDhYB55UQXOS.XPLd1BTFAxX0TQM6kPpTBWg
 Q.dJ42_84JsNUaIBPTslISpuLXM.K21m9aly0cXiIKBiBqZvXOGbBOT7FDUeKAa5IHjeCmUYqXvo
 UXkIv3p_nnuWvwqjjfp3yxLhBexZdUg.leORLGASFZ3_lJgd6bd_RbGRZnbquPZEBK.27ckxkF9b
 zJqXxgo9tiNco7AmWoP4LC4.vCYaIjEsiVKSK3jtmsA4q04ovbkO0XDJke7U63Cxd9tgbdFqrXQG
 9gWHxK_WnSHpKVXFXxmj6HMBegW429cTXvIWZ4MwjSwI8RDxiK2L7Lz7mbM4QqYElgzB_3e8y5kG
 QVBrsLzb0Svjkmue7sxvYcPPYC1Nn2sVT8aB4ebeTxHmc.X15qNBQHyY2Kl2xc5N22G0ZtghSxnX
 tcW1mCKqulloxcr_bioGvgW3unW5JXaOXuOyPpd3lZkCbtnr59MmK5YjTHd7igWB7YOXJDWQxkhh
 AVKDg_u0_0W_TR.Sp8dSm8dKYh3I82sNEJH11NPoS7_c_qE91Fc.5UOhYNIfB.7VyrWZEIutOqCh
 gmcSLoqNgvZoYguDD26UlynfRRpVskLZusQ_YayI9RG5Yi_VKXbTprnHtFbAjne5uoMztef.4SJE
 DIbfLm.Uax9ldZ1NAVSeqA5pknTTG8t2HT5ASzXYpOFJqapBfl2UiyeQleUg7jpbPFfPDRfe2tOB
 tGO0iTNIzQdlt8NFFB2Yfmst.vVjkC0qHNGgC5T4J_5.impnXWazqSLJVjGDg5lc2kvW9BTvToWg
 9oy9cHIKMXIXUzdV2MZInALdIFTgHfMLQXLKBR4.499n.t6VsJ5vSAw75Pt4wWAMpX3pWVZSOpGM
 OxNRih_7eTebukDDXMbOYMdxRvcNs_OE18CHmKzVZaebNp4Gm4u8pDHjvOUMBuJUDe2wh2rwfNIj
 D2Qm8b5DXlM.tQR40k14SnJcry_WW5TG5x0lP1viCttqkX_VyYr.mG1bYg7Y5Vtk2xhghCG7wr5k
 rmMIUAcqQXG_CZyprEzyVjASwE7TqIL.EzI9bTY6rRwpGR0sxja7fKdwBlwEdy3L_9VyUWMFrKrC
 yT2ppHFwuwLwfLlBEr1NUojddMJ2cVM_Lw4z6uCdmey92tbWsOvrZb2b4B.nHpotc_vI5LnKJKUI
 NqL03iUyPJT7V9v8sZrhyvenF8_AjxcOPWZ4OGZEyJ4fW6fyWz4jrqlb_UywSByXyBEKysQ8SMnD
 6rrR5OkBc0J9ckSfXoGnba.gG9grUzbjErObvC0xbn8H4CAwoUr.pw0DvYbNpGdIwqQMpWm3C5Ts
 NElQBD.WtxSyY.wsGV6XTBkszh_PPiJWgbIAQypJxy75iWJAAAOT.y8.IaN1Sbw8ZDjBHTyo.2gQ
 GuG1CUinRnMoRDa5kly48hSoI7gNVp.zC8dpCi1s14htfvsTt3joK0zFsMMAciKLgO9OuRGFdfCi
 4k5KnKSUTHnmQ9Wo9SCyU9IFge7wWC2Re1vreYJpabdAzOr.DYDScLOWZslCqpRCdMA8obifr9qc
 jF25LkQGD4APs7seN05a7x2qhfNuUxMUA8ULUct7DfGYxo00FdRg55faTak.elj2JAjQXwcy1t37
 0DidKXDtaDc.OFFslLBfGT58vNoiBdhDAYnNaVpTpliXFS9o.541CKHledGBzltW.YtULDFGrA8.
 .F954AXn6qrohdIP_vUIu763aEiczIFE8EmRFSgJ7qaRBx5bhHBVlf4qIG1som.Stwa_QIEE5sS_
 fZ60rmmKBh2MLtW5kGEOlM2Onht_pRHRaHv9tQgECHql_W_1vv4Uxrisn3FhZwpjGlq0_A6h7dXD
 tLtYNHDFJBMQNktWO9NncwSD_ADeueh_1AOxb
X-Sonic-MF: <rubenru09@aol.com>
X-Sonic-ID: 80f41ea5-9943-4716-b635-6372104d91f1
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic307.consmr.mail.ne1.yahoo.com with HTTP; Fri, 24 Oct 2025 21:09:52 +0000
Received: by hermes--production-ir2-cdb597784-2lmvp (Yahoo Inc. Hermes SMTP
 Server) with ESMTPA ID e011724693602720a95d168ec1215754; 
 Fri, 24 Oct 2025 21:07:50 +0000 (UTC)
Message-ID: <aadbff4143672ac868a573ff9ac9a7e699ea46ca.camel@aol.com>
Subject: Re: dim issue with updating drm-misc/for-linux-next and drm-tip
From: Ruben Wauters <rubenru09@aol.com>
To: dri-devel@lists.freedesktop.org
Cc: dim-tools@lists.freedesktop.org
Date: Fri, 24 Oct 2025 22:07:48 +0100
In-Reply-To: <4f3512a259085f9f4222495955b13b3c1c389f90.camel@aol.com>
References: <4f3512a259085f9f4222495955b13b3c1c389f90.camel.ref@aol.com>
 <4f3512a259085f9f4222495955b13b3c1c389f90.camel@aol.com>
Autocrypt: addr=rubenru09@aol.com; prefer-encrypt=mutual;
 keydata=mQINBGQqWbcBEADD5YXfvC27D1wjh1hOmjTjSwAFjQDGynLtrhBBZpJ+NBsfu++ffR7HF
 d/AaSJ+hqJni6HBNr/DMxWYMC8fOAr6zCSAX6fD2Rvy6rq6emuLaGOFkAIWDyuFWw40anlSCPZN+f
 fXTKJvARo45ZpC9PcfNu9/iRl/CpzSdiB5U4O2YtggXPWyOm9ev+bysmn6sjS1d+IZ7iTs9Ef0O4v
 I+1VFXvZMaY0YzG7EoYnKfeeUD7IGLpI4EEkNqLaU4onLN/qkXUwjT+YTw/VtTxNCmtTVFf57RAg2
 toscC85JjcrOeGSXdpP3J9CPdcIDMpOlnE//KuJIA3QMkckPQgnYtRw3ZhbiVxLNNJSUYm7PuRd9L
 LyObX7dpi0YfsUhxmD2+grw+Yvh2YlPWFybBDBgzRIcSMMSw0ertL64hBof06aVIlT8+TBf1Sq7O+
 obGYoXUi2q6qAuz+0y11spGk0YOffx4ChGPMQGGGaXGaCcjRMuJ050MF4dtwep/mSWH/p8EJtIKY8
 LfP/2c6G8leikMddtb+wKSNUuGYE6ctgcUtlltssRt74ls/ajYE00K52dlhCiaKxd2y0KpYEfWXPE
 pfiQ8yd/P/6fZCaOleY4k8Y2/JmlVUfwfVcVmb3mKWxKQXaHhT3cEvv8yuFDZgkTvZInINKtxxzly
 1i3TlY/nn5mwwARAQABtCFSdWJlbiBXYXV0ZXJzIDxydWJlbnJ1MDlAYW9sLmNvbT6JAlQEEwEIAD
 4CGwMFCwkIBwICIgIGFQoJCAsCBBYCAwECHgcCF4AWIQTehs0109D1XkJCLZjSflDAUK4M4QUCaPU
 lLgIZAQAKCRDSflDAUK4M4bK/D/wOugk+nS1PVpk5XkoSB3BXpW0yEuu55EjxXuFfN7mGdtRDq6kn
 WIunzqN9vb7qBFcfz1uG9OxEQpiEhGTW7aIkgCCDbyCk//bb2uRKRy7nVHA9E8p6Zya+974iY0+LV
 LkzIN/CgDavmljWIKQvyPL280KU9PjH2blbH5g6skwAc6MU9pCp6H5W00DYFjMW1j5NCBk5d6UDQ9
 OLukHTU5lHURNB4y0EMZg1eHRjqPk/bxXQA7dAz6BtMKhY+ZY8qDd8XC0sA6Zjsr5r8Os4/mDIn8I
 mzcpVNBKiLU0wpZ58TOUuB0s8wUwXZgwyAkG0sMDqasrQAHx5aVZUfb62p3DosMALacVjHrnW4Kwp
 rwfV9lKxfxPyDoGxtcwCAEdA58fG1FsqFqDxB/qkhyvF/4fzEtcOAHcgEAXR9W5G4PU6KInEidNX1
 1B9IuXRV+5NX6pQ0JAYN10WP7TI5SVzx1ebu6+bdLM0etdLU/0urUJjrnIgfQlRItq091/Qb5k4x5
 WTTeD0Y5Ko5/LSUX95R9z06ZffKWKqrl3QpZbAJrOI9PmDwbV8E5PNsIFE84+O2iqfF01j2rXaj+I
 dRhLIkp2jnabmNTFJtCy/N0Yrx16Gd8FnbOxZkbAER8F49MAm1JBQWoIPRbjRrXKJdkAtJr43RCkS
 VabceKfcvFR7bPf9z7QdcmVkMDMxMDAwIDxydWJlbnJ1MDlAYW9sLmNvbT6JAlEEEwEIADsCGwMFC
 wkIBwICIgIGFQoJCAsCBBYCAwECHgcCF4AWIQTehs0109D1XkJCLZjSflDAUK4M4QUCaPUlJwAKCR
 DSflDAUK4M4YOiD/0au/ik0WOM0fwVYY6+PQbU9QeHAJ5kuVesCNA57Zwhe2eAeLvAkmh67hmUzTK
 XD46kqeu81cRYG4WlECv2pYUaEkPni9vmpSMTPpmXvpkekaVNrX1qgBVSd2vfP1xG3QmuQXcGiWZw
 gzPDbN/rCjs4iUqwjDrUpnb1c5va2bTfsqATAUfz4MKobkt+NGlJ7wpTY/TE2noeT2Q8v4NWcNkbM
 MMDkACUut0kyzrgeLxu5u8AS2d5TnWHaZwi5hy8egbGTe2FW/fz8GT4ZgOEExshNt2vs2Ay7CGyhm
 v8SJfsvoUQFoIjAKfQ+KLrjCL3nT27Cl1g0Xj6c16f6qH0/ns9uym6SisNr6FzxN4RauMCQsHBeRZ
 qFhJ5WYXaBBziPfa46Jrdnd385KvsQ7V5cGitM6mBx4tDo3cN0jzYqosuBVrwyiOewklRLYrf0go0
 wh31YtoJXeJ0ObH65oHINmT2gqyaii5ZHe+avPwnKE03W5pHwenGCbgSnOndy5eGeamSD7AgwKw4V
 j5r2FeK8K7tU8rpONWu0pkDqq3tMVOcDguTPufXIBFgLDQy4OoC7dHoJRplg8ull5wMjI9ERR0oaP
 8IVIXxGcFRph02eKbZfqK51lMtns3kTe5DgHao5vrE+2GseLnEWE37cWnBQDhYgjwxIWtjGVp6KG7
 eIvzsqg==
Content-Type: multipart/signed; micalg="pgp-sha256";
 protocol="application/pgp-signature"; boundary="=-jBF5FIDhbLxNCr6AZuC7"
User-Agent: Evolution 3.56.2 
MIME-Version: 1.0
X-Mailer: WebService/1.1.24652
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


--=-jBF5FIDhbLxNCr6AZuC7
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2025-10-24 at 21:24 +0100, Ruben Wauters wrote:
> Hello
>=20
> I have recently attempted to setup dim to be able to push my patches to
> drm-misc-next.
>=20
> I have attempted to use my openpgp auth subkey as an ssh key and I
> believe I have somewhat succeeded, I managed to setup dim, and have
> managed to push my patch to drm-misc-next, however upon dim attempting
> to update for-linux-next/for-linux-next-fixes it no longer accepts my
> ssh key and asks for username and password. Entering my username and
> password appears to fail always, even if my password is correct.

Just an update on this, I seem to have fixed it by using an access
token.

I am now feeling somewhat silly as this was the obvious solution and
there was no need for this message at all.

Ruben

> This of course causes drm-tip to not be rebuilt as it fails before it
> reaches that point.
>=20
> It seems someone else has pushed a patch after mine so I beleive the
> issue this time has been resolved and for-linux-next and drm-tip seem
> to include my commit, however I would ideally like to not have this
> issue again, and resolve it.
>=20
> If anyone has any ideas I'm open to suggestions
>=20
> Thank you
>=20
> Ruben Wauters

--=-jBF5FIDhbLxNCr6AZuC7
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEE3obNNdPQ9V5CQi2Y0n5QwFCuDOEFAmj76qQACgkQ0n5QwFCu
DOHyeg/+JZ2B2dGU8yXr9H/9fOvD+5KHRT9yN/ih//a7KMddGpFSZNF2I98VI65F
CkBKNnkE0AGqBYFPlWhJEdlChY7KOuefIX20BigldQuQi1Mt2wqJ2n/4Jx85s92X
63y3AjlRc3DzZ8Ybd0uvrFUe/dU0kkxeaX9R/STQx51Ew9ZCwrH0eFJiWeXr+xlP
gCI7mBQmcqqVLszPZFYRnLGUz0rfzaDOxtXjiQPPjVcNpM6nOeN8jUnP3sRex/Se
URG9oRnkv4gh7yfA3sO8C9qInYIICTz/c+aLOiMc8OhSV/d5zRDJho7tCqFpBLSo
9Pxc8gw9M3+SF0MlQTFaz7Qe75bB/6EGzjwM6gGSWnUouGNNr7NvMbmzFMvXsyoW
HK4ihWgW80PRcdVE3dqcd6ziBgAkP+Kvo8c4gFZfyv2okLgOXgg4VgojwU+ALQHL
04n1aQuuDTenyP53+/8fkP4HOTQSGFKXv07T3FWh880qqpmygNhzMZ4Zs6eHCm1m
PxJYpPeIs9kq4MME48x1TPAYxuugiHgTeToB56hZzk02V5VX4v9rjJDFvYmbNrOo
99CdOZ27up3a50/pAXv5/T0RB6jXjNXMGltX30UFGYrgA1NGjhctr5IJtVPyzwcG
49kJux3Vrsk/pwlBlakO2KlTkuOGmQXGwDakrqhBzGVuyTB/Ngs=
=1R6H
-----END PGP SIGNATURE-----

--=-jBF5FIDhbLxNCr6AZuC7--
