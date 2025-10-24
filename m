Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CD235C080DD
	for <lists+dri-devel@lfdr.de>; Fri, 24 Oct 2025 22:26:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D68110EB3E;
	Fri, 24 Oct 2025 20:26:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=aol.com header.i=@aol.com header.b="YXKyMrqW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sonic310-51.consmr.mail.ne1.yahoo.com
 (sonic310-51.consmr.mail.ne1.yahoo.com [66.163.186.232])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7020410EB3C
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Oct 2025 20:26:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aol.com; s=a2048;
 t=1761337605; bh=7jJd9l8AlCuHHCTyDly9ZVuDv/7zOVuTGHL1EYdcET8=;
 h=Subject:From:To:Cc:Date:References:From:Subject:Reply-To;
 b=YXKyMrqWJacASh5C+T6nl0P/+WoVxmQbl+93GK47xq8aOoC7VFYs3RC5h6gpSwfFXJ4/bZToI4QtL//27PSgV9T13bzENAWxtW6JujIFAtjIOakz5bWWBTK0RtHFrnKVVLV8iWN4aG4ajrKj3HY4gbAfnnJ5U5NCh680Ppskqg8vtMi4bwGN1fbLiKvdT9fMVTDLDPLcvxw23ZJf5hBXj1tBOT5+OuJi3VLMpAWF6OpLf2A+Y828jym2ZRcXLz5VCjfNcXBo7VXKdeUnh8PuD5iPRO8tt0EJT/QcipmXT/NZiertiWpxYciS9Qj3FlDSNCpHP/gIAN3ltaUe4954JQ==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
 t=1761337605; bh=r4SkWjkcb1GJFwxKGjWmDu2Av/prTO9mcvaWHKsDKy+=;
 h=X-Sonic-MF:Subject:From:To:Date:From:Subject;
 b=Dxfx1E1msPPNMOQOBFlNeDnqiCGhPh9nKAO5YBJcbwzOUJLYMIS2qQ8uo4cagIJwxE3uLC7dHofKDnhOyC4OzqTD5CN5ivbiUIpZAA0UFF3ucb3w+oONzhHBZzFWDNq6Ot5gSLZqhK9H3srDPKMEr/QEzo6qjVmgVT6cwlE3t3lxejYT/Dx0T/k0/Bl6gUkv7UfQsW2DHeNGuBnXjnFQirqGJBoNBy5A0VoFzkAHvPXE2h9jOMXthHmeDtzRllfWgUfX+o0Hw8NYFM3fLBgZF3PDfso2ne17XGD1InOQW5avX8WaPKujI6gGkwGk0AA7ZQeSGbnm6dq/7ySEDSMPXA==
X-YMail-OSG: HFyBv20VM1kNFfgsT7FndR0SFP_.uRYqNZjM5jmVdF17tBNSzSeetUpYg7TKzUW
 m1o6SEyXD6.YGTTdLhFudMbS35jiOuqIINSf9ogApEGLv2xCZXxIIfA8uNxKZ2hvZ9HNLugcJflf
 dGevH.ONpl.VDPRXiRIBV3GXtzHBQ6HICboArqG5SvDMQEw5JV_SsR60GWPITFz38eskHnZAsQEz
 .pn4rCApcxhodyVBvYP8M4oxaXIs.VJ1fdMCd_c2o_lVyCDkRuZGssKPr_oQ5gCckoqjYbScLPNN
 laEC2JuRTlcmlMQI8ubBrLifaIxB4TjKM2_kiybOfOP1gqCPb2SnXQsz8JsyJnCb8Xt3EPC0F4nq
 5spJEqsdA8ZSNDLqKHeEfbnSaBx.oan_lbUdlnyLg_KCDqyxvrOD0M.UTYLKzHAb3z41ffmQv0rG
 gwvkct8paIrRqaQN7uAvLZncRCQpihqz7s2b_fl0RA91RXzK80I3j7F0m0LGf355mx.0dQTZwmRw
 2RFRV1Pa6rLIoGaddkSk4ARNv4HBAdYgpz6lk9nXflZwHx.XvNkrQsxZ4jYXx4c7ayQ061s2Y5.X
 Vw8ctR20HfIwDA9GQj4kirPP.TzN84bykhj8JWZwBfy1uQD6_0jLUqdxSdrt2tw65.OZb8x42ady
 9BJr1KRehpByni.4F5i3sJx8jVRxtF6Qg.P75nuHgLBZU9hVgQJzUpPqoWQ72x6NfibBd9HUMacu
 Z00yOT1WyWQ0BjRiOFOwUVswZ3j6KeQZF50w4ONPlZLIU06Mu2DKpuS0q7SLIjFDcw1v4REG2ojw
 FKSO16tIuIXD0h.h4b2bnzpFmQ7HSvWSol84lwLB78.CW9Z3_gWJC8nByJQJhzltIbDM0xG1RPh_
 WX9LYvmFnPSVtiEg5r3rm4sf_8MBB.dl1XaWPO3bzh79PA5h7KaSccHw8vXH5QBIo9wahPlpIOb0
 Fi5SKYi2GzCbNaUA263nYdxFizADa0GHz_SIvJzEdix6gtbX.slfBKltob76f.uERZze.UWKS.fa
 ZPOE.1X9WCN_n8o6LUmfZptMPKQE0AAOC83mQ6GBL92W0cu93b8A_vjZJuoNj2DxRc5_kLH9Gmgt
 1UNb8h9CXzUpSfChl2PO6INyBNl9M2ixey8q2JOtX7cPbJmvHqwci.5LlkVt6X_0Of.v0UQYBiX8
 J9uGg.ydWwnQkJJNCBW5gqM7Jzv.1Wwz3ARoHoLA9aYjmnVHEcJiL.ZMAXf5TLgzOi.ayYKTevz3
 BOaozm4Var7Q2BZwcDgnAm6VEJUE0KF4G1WS0zR79sx0_TgFdNF2yld3hY1cwDiahd4Z.Lpt8xBp
 vI5Tu0YEhxy6tyFvQlM2P8.jaCRPYqxe6HFeKZqy4_Xn5MntIveSUUr4qoHoMZfw.9HidFZgV8yO
 uyqA29LJ18GyZtddk0fAfVgaZIft1iBHC.YEJ1RbXKJgjvz_rsUOFcJgBB3zoH8TtaqiACCcTz7h
 eHHj9OBAYH319C5NKlURFR5CMYLEK9pMOzKv_y8Ax5qDMirsksIR4cIo5GjRxMUbCrc_4Ih0nO7x
 NmJfhsmDaavu8t2rnLzT907ga.0WkLM.Z1fFf.1xTKjO4_ja4y_nG1cW4h_esL3ZXo9iOPt7L2mo
 H6oxGUQIS11BZLTv28_xT3nDkDZcFtiQljcPiiE8lUxlTJye..CKymQdqN6RNB3twqiLK0yLH8pq
 NyLdYmLtMymZT7dGqUS7YUHPppVJQjjYv2cQk2Mrja6Oo1oic_oqPWmn2hp45h4TPtJ4U_pW.1bT
 jpJikfFECiw8djIXhZ6BsvFr7dcOeY6eWDeuaxiRk3HHO0C.cfHHBR6eAdrV5s39HsJ6GzPQ9u8X
 q6UxwN_krcF4.tdwIb3e8odcDXU49X_FHy5d3d4TiWo8I3iH.8yaYRHbDOKop1P_dVKgkb1_tBE0
 J49z8F0ld34IU0SZU_PjsdcKN8K8q66s6Q4xcJe.m5NIvnmfGR4sgEh_LWyQe7fqykWPIyxTsuPQ
 sKT5GX6ysSHUkZHVA4.igaxX95cZBTNedSKHhRQLAJVp9TFY.V1apBm.e.Z7YaayTsxAov2rVoxP
 1MQTVT5auUZtF19TcNOSK.ubvhWyS2AQXw4z7EZXUnOvV2BtNpJwtjqGA2iLpMDoRXWC7J69_FM7
 oC3sHYNuhkjOhwWsNupI_1NZzI9zOIKkqV9nJYy6yiogkLloQdcBCC9FYXuFnpTVrk_V1d2bJXIU
 pJTVYWMWQ0mavD0pvbggJ3aL2uc7r4XmkVudNLrRGkrjayXYrtgOdClVA4qQSjp2_us3sjL4iTAn
 gIOp3RonluQQ0AqzCR7mUwwhtYO1uAWA-
X-Sonic-MF: <rubenru09@aol.com>
X-Sonic-ID: 1e8a2c2a-c1d5-480b-bd1b-f362936ca91c
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic310.consmr.mail.ne1.yahoo.com with HTTP; Fri, 24 Oct 2025 20:26:45 +0000
Received: by hermes--production-ir2-cdb597784-h2szj (Yahoo Inc. Hermes SMTP
 Server) with ESMTPA ID eb6fdb12f5c6377b50ee37983239b705; 
 Fri, 24 Oct 2025 20:24:43 +0000 (UTC)
Message-ID: <4f3512a259085f9f4222495955b13b3c1c389f90.camel@aol.com>
Subject: dim issue with updating drm-misc/for-linux-next and drm-tip
From: Ruben Wauters <rubenru09@aol.com>
To: dri-devel@lists.freedesktop.org
Cc: dim-tools@lists.freedesktop.org
Date: Fri, 24 Oct 2025 21:24:42 +0100
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
 protocol="application/pgp-signature"; boundary="=-6GT4PrceAqxE6e6PX9Cx"
User-Agent: Evolution 3.56.2 
MIME-Version: 1.0
References: <4f3512a259085f9f4222495955b13b3c1c389f90.camel.ref@aol.com>
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


--=-6GT4PrceAqxE6e6PX9Cx
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello

I have recently attempted to setup dim to be able to push my patches to
drm-misc-next.

I have attempted to use my openpgp auth subkey as an ssh key and I
believe I have somewhat succeeded, I managed to setup dim, and have
managed to push my patch to drm-misc-next, however upon dim attempting
to update for-linux-next/for-linux-next-fixes it no longer accepts my
ssh key and asks for username and password. Entering my username and
password appears to fail always, even if my password is correct.

This of course causes drm-tip to not be rebuilt as it fails before it
reaches that point.

It seems someone else has pushed a patch after mine so I beleive the
issue this time has been resolved and for-linux-next and drm-tip seem
to include my commit, however I would ideally like to not have this
issue again, and resolve it.

If anyone has any ideas I'm open to suggestions

Thank you

Ruben Wauters

--=-6GT4PrceAqxE6e6PX9Cx
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEE3obNNdPQ9V5CQi2Y0n5QwFCuDOEFAmj74IoACgkQ0n5QwFCu
DOEq7xAAkmBYG2ToFj+ehQN372NLHfl5vvnLgEuJyqBG0aemlxKkELIpQLvfrq66
oQ++B1DArLM5eHnNfyQxDHs5T5RRAHkd4atOcYXvpCkxrRZzwL9n496c1ixPqJav
LNu7L8nJbNPsYC/GOJ5IErO1D1tAcTPXG6phfbEhVoYFGoX6nbnzdSe1gIe5xf/t
gi4FvESJ37FHlCTeCBmhBRJad3UDaU+ua2iVkh9SoNH92qXwMow3bU2qGO+1XUgV
O5MQ2jBb4FGOoLeelNEWmpncQD9PkL9Rh7YE15ZyKRLXJQ6mLXWvtz/8DTttQNyk
mtPiHwVGwygvk7LDf/tCgNUG8lim4uH2ML+dxQtebPsnzZhYdegoD3mGee7JLatf
kZERTt5XGDdDOY/nlWsxSNrcnzBTSMaFqPJWye1TfLNei8FWn8ET6umNWdqvyM31
8CZozFemdIYgLP9NvrEgi8QE60mLggP2ENhHpIKNWjzkxqsyo8uHC6zCM4wbyGkF
g9dqbKVFYGk/m6IJQhi8P2yDG4BPG78G+sg1VECWOqM/VKvtTlGkmKqjva1cwwvW
KLX02IzkB4jsNOzdHNjmeUJdMv+0TsCtlM6ASlziTto2E1vQpSvWe4kb9Mzq3ams
3cFnLV+2Cc06DVVT63EL1mHqbEkcIIyleo4FtVEAT6jTc3r9aZo=
=xkXW
-----END PGP SIGNATURE-----

--=-6GT4PrceAqxE6e6PX9Cx--
