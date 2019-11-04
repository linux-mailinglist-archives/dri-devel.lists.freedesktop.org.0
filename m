Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 33DBFEE43A
	for <lists+dri-devel@lfdr.de>; Mon,  4 Nov 2019 16:50:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C7A446E249;
	Mon,  4 Nov 2019 15:50:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x841.google.com (mail-qt1-x841.google.com
 [IPv6:2607:f8b0:4864:20::841])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A8A246E5C8
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Nov 2019 15:50:17 +0000 (UTC)
Received: by mail-qt1-x841.google.com with SMTP id u22so24559599qtq.13
 for <dri-devel@lists.freedesktop.org>; Mon, 04 Nov 2019 07:50:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=kP1Dsw0pGBhULD74j5Sjmpym4D/yTZlUKtWObbsiHq4=;
 b=k3Maxkf577T9R68xLtLq/YpKPkf5BRbY4ewDTY8BahVdSetY94O7cyOVm/w5shuoS7
 GIhxDQLGOoOp4uQl7E7s0veRf0V09KhMoMre1cvlTSauORG5Er0L2u7WddDYaa4I32ZC
 7LHOMLXsmHqHb/Nf4rBYo44hZ9YEAt0h0lecag8guGq2CPLtjeHvEnxZi3az436ea6AB
 M/4t9/e/QcpdUv+7x7T2xhTt0QM5WroS68c8nyZa2RvCcRQ8kp0/Ny4g4wiMawiOr0FF
 i50n3cnT+qCMtmGstuUs9GSPa6U2IS6XdGvvyUOsGWOrA5PblvSC8I0AbE93XC+LOrDd
 xoMQ==
X-Gm-Message-State: APjAAAWrJZPDj8hrs2sFG2HVLFvGRe6NsOQIO1mnYwrRxeDt/nrEeQq7
 szjXUmPdIjRyt/q+eUMesvs=
X-Google-Smtp-Source: APXvYqyrimVjWSw/EKVn3HCyESovWIH32e5G3bolAeT1se236k1nrnEwMwOkvn+BhDb2AXYfV8eZMQ==
X-Received: by 2002:ac8:5485:: with SMTP id h5mr13011854qtq.16.1572882615816; 
 Mon, 04 Nov 2019 07:50:15 -0800 (PST)
Received: from smtp.gmail.com ([165.204.55.250])
 by smtp.gmail.com with ESMTPSA id a66sm8308420qkd.34.2019.11.04.07.50.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Nov 2019 07:50:15 -0800 (PST)
Date: Mon, 4 Nov 2019 10:50:13 -0500
From: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>
To: Gabriela Bittencourt <gabrielabittencourt00@gmail.com>
Subject: Re: [PATCH v2 VKMS 0/2] drm/vkms: Changing some words in 'blend'
 function documentation
Message-ID: <20191104155012.wdg25roebjqt4tiy@smtp.gmail.com>
References: <20191101214848.7574-1-gabrielabittencourt00@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20191101214848.7574-1-gabrielabittencourt00@gmail.com>
User-Agent: NeoMutt/20180716
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=kP1Dsw0pGBhULD74j5Sjmpym4D/yTZlUKtWObbsiHq4=;
 b=egXtoZb7MmoQ1HRgP9tQUpSPHXsTK+enkEWTl24Fk3OGYR/IOBbJiHQPQy98PTWtak
 QmdJXQBXQJP7sUhFBUnMEYnTikz5jW4KkkK9StBmCPX0mUZFuanD20UXFQFheD3spcHb
 CEuT1sDaWxqErg3SQ0xnbreybvvUCbm8BSDsNMnSD7WnlWuekBne0wJDC9Z1R05sC/jF
 /slklHPsyOfI3EaXdejEC1N3dB6X5oDBSJ06oU7zummvij6J3akUSE1zI0mPJCSdjEcB
 KC/Uwk37Tw+akwYLUtvCEviimV7d4e/sq1DkTjaD6MBSgmbm0qIXneJcjf/KAXNOr08y
 XQBQ==
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
Cc: hamohammed.sa@gmail.com, trivial@kernel.org, airlied@linux.ie,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 manasi.d.navare@intel.com, outreachy-kernel@googlegroups.com,
 lkcamp@lists.libreplanetbr.org
Content-Type: multipart/mixed; boundary="===============1221849480=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1221849480==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="arzbpojwlifr6sea"
Content-Disposition: inline


--arzbpojwlifr6sea
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Gabriela,

In the case of this series and the patch "drm/vkms: Fix typo in function
documentation", I recommend you to use a single patch. In general, If
your changes produce a lot of deltas, you need to split them into
individual patches that modify things in logical stages. In these
patches, you made changes to some files that belong to the same patch;
thus, a single logical change is contained within a single patch.[1]

Btw, thanks for fix these issues.

Best Regards

1. https://www.kernel.org/doc/html/v4.17/process/submitting-patches.html#se=
parate-your-changes

On 11/01, Gabriela Bittencourt wrote:
> Changes in v2:
> - Add fixing typo in word 'destination'
> - Add change of the preposition
> - In v1 the name of the function was wrong, fix it in this version
> - Add the patch changing the word 'TODO'
>=20
> I've tested the patches using kernel-doc
>=20
> Gabriela Bittencourt (2):
>   drm/vkms: Fix typo and preposion in function documentation
>   drm/vkms: Changing a 'Todo' to a 'TODO' in code comment
>=20
>  drivers/gpu/drm/vkms/vkms_composer.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>=20
> --=20
> 2.20.1
>=20

--=20
Rodrigo Siqueira
Software Engineer, Advanced Micro Devices (AMD)
https://siqueira.tech

--arzbpojwlifr6sea
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEE4tZ+ii1mjMCMQbfkWJzP/comvP8FAl3ASLQACgkQWJzP/com
vP8nuBAAtA6lod7nNzI304FKxAxD1+ZvfHaYc7MNdBouOK0OiYwKTA3yu2W97k2S
LO/lfqZc9fBLb8r4MgogGnRbQ6esN5A/lSUpPUsHltcD6HKWK/wdl1soebYYn+M0
LEyKFHsGptJuQyXLvBIo44UaXBmXzadRZxsaF62F/LLsbqDnHswM7OLrl832Wv3r
YMBp6P0siy6tJXUMy0FPYWD6/t/67Fq+Z287d7Xex9Kc6RJLly98mNlmfkvg9NcD
88NaSz3dVo0eUvUffiy3LWwRcUlVdZvE4jOjv9w+qzEJ5xKEMNHYCEd1Osqq/Q+x
HkfWuwXY4MtIs1UHaC8uR0eC47oaX/mWuZSoEqnbS7O60sKwbxZIUdHMcGJdMkLw
qDbJ5GXslD1nMzfOJzVyWljoLVS92ScFn+Q1f4x75j7aV5ioJW7A91GJytloLFDd
LBGa3maYQmuvWtjOLbiIQc9fqXt0Ef/Hiv57ZRCCbPBg5wui1EtqfLiWN73tLlKh
rEMAAFOhCDcsomnzkl6tMT37iHlhAgMSDBx0oXNtv+Pl+oo4QN5s4Gb0YBawOSTA
kqZak08Mci4zrBFqlarBjxlJirWO4f8fS3yVYQsm1vqXcV71hoa18SwDeTApUHh7
n3+5wK5xKmelhdgX+cJxZm8dI3NiW5+uER+cm9Kfbv7ZPusk4ro=
=5GmA
-----END PGP SIGNATURE-----

--arzbpojwlifr6sea--

--===============1221849480==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1221849480==--
