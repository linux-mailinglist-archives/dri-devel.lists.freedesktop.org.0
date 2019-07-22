Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E69F17081A
	for <lists+dri-devel@lfdr.de>; Mon, 22 Jul 2019 20:06:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 02A1E8845B;
	Mon, 22 Jul 2019 18:06:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from anholt.net (anholt.net [50.246.234.109])
 by gabe.freedesktop.org (Postfix) with ESMTP id 41E8C8845B
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Jul 2019 18:06:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by anholt.net (Postfix) with ESMTP id E793110A2890;
 Mon, 22 Jul 2019 11:06:14 -0700 (PDT)
X-Virus-Scanned: Debian amavisd-new at anholt.net
Received: from anholt.net ([127.0.0.1])
 by localhost (kingsolver.anholt.net [127.0.0.1]) (amavisd-new, port 10024)
 with LMTP id g4GTRphUwdzt; Mon, 22 Jul 2019 11:06:13 -0700 (PDT)
Received: from eliezer.anholt.net (localhost [127.0.0.1])
 by anholt.net (Postfix) with ESMTP id BA68510A13E4;
 Mon, 22 Jul 2019 11:06:13 -0700 (PDT)
Received: by eliezer.anholt.net (Postfix, from userid 1000)
 id 3BAD62FE2547; Mon, 22 Jul 2019 11:06:16 -0700 (PDT)
From: Eric Anholt <eric@anholt.net>
To: Noralf =?utf-8?Q?Tr=C3=B8nnes?= <noralf@tronnes.org>,
 dri-devel@lists.freedesktop.org
Subject: Re: [PATCH 0/6] drm/tinydrm: Move mipi_dbi
In-Reply-To: <20190720134709.15186-1-noralf@tronnes.org>
References: <20190720134709.15186-1-noralf@tronnes.org>
User-Agent: Notmuch/0.22.2+1~gb0bcfaa (http://notmuchmail.org) Emacs/26.1
 (x86_64-pc-linux-gnu)
Date: Mon, 22 Jul 2019 11:06:15 -0700
Message-ID: <877e8aeyg8.fsf@anholt.net>
MIME-Version: 1.0
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
Cc: david@lechnology.com
Content-Type: multipart/mixed; boundary="===============2133247879=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============2133247879==
Content-Type: multipart/signed; boundary="=-=-=";
	micalg=pgp-sha512; protocol="application/pgp-signature"

--=-=-=
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Noralf Tr=C3=B8nnes <noralf@tronnes.org> writes:

> This series ticks off the last tinydrm todo entry and moves out mipi_dbi
> to be a core helper.
>
> It splits struct mipi_dbi into an interface part and a display pipeline
> part (upload framebuffer over SPI). I also took the opportunity to
> rename the ambiguous 'mipi' variable name to 'dbi'. This lines up with
> the use of the 'dsi' variable name in the MIPI DSI helper.
>
> Note:
> This depends on series: drm/tinydrm: Remove tinydrm.ko
>
> Series is also available here:
> https://github.com/notro/linux/tree/move_mipi_dbi

Congratulations on making it to this stage.  This looks like a fine
conclusion to tinydrm.

Acked-by: Eric Anholt <eric@anholt.net>

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEE/JuuFDWp9/ZkuCBXtdYpNtH8nugFAl01+xgACgkQtdYpNtH8
nuiHLQ//WJiNyn+Lb5XRE56oFr7AYAFl59OwhJ45JqfWzMY9J+VaYOJeMsLOu5es
eVSdbWQmP/7ziblrZTSSwL+Pw0dcipLik7u7SID4wpm3ci3Kucr/boT+BbUfwAf+
7K8BoHz6lFle7NuFtgtqnOO+X9ic7dxk/cpQrhtyPqb1MajwLZxkg+zwfr424XkO
FLSO0J/GxQT6wxBDCGZhGpI6sDJy3lk+x/qj1wYZk0d+MuNA6oL9BY34qNAS18oK
i5/zgMXidn4isjeSsLFWhZ2+u+4cCxmL0ZXQhqN68Z7otPtSd5zz5A8aXPtOR35N
3NJRorSH1n24Z081OMLMURC2y8dwEPkz9oA1sfnFXjUzkbKcAjRLwxXwj6ABHT78
2HFvez8xRpUKMPr1G02NKmyaIxJw2q/ML6aFVlcp9UgO7gIyeHIWitUFLPtgPMA+
2q82xukEWGzSR1FPxkMcsVCc+7euxcF62Vxf8v6wdZi6r3sRB4tP6URM3S93j1SI
8CNyGbl1munGXbPHISy2U0ZQTOLS4eoicCuZxjaVoXKtye/lqYHY8l1+R+0c9ypu
x8kDCUMsrVAqPq/ZA+gdpJ+pfe+qpwAwKvhJscdBGNjxmdr26a8BRsAsmBUK/hLE
Jtqo5TLCsyFPWf6CHM1dpTo/Pqn2p47gOh1rB9QiUEv/VOSP99Q=
=hkaX
-----END PGP SIGNATURE-----
--=-=-=--

--===============2133247879==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============2133247879==--
