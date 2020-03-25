Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0188F192E0A
	for <lists+dri-devel@lfdr.de>; Wed, 25 Mar 2020 17:18:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 63E846E0AA;
	Wed, 25 Mar 2020 16:18:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 346716E0AA
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Mar 2020 16:18:23 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id a9so3393366wmj.4
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Mar 2020 09:18:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:autocrypt:organization:message-id
 :date:user-agent:mime-version:in-reply-to;
 bh=d8lOBBW528aCCx0dELp9561f8dChCOFbuQdYeuKHsRU=;
 b=FaOeCGisNVJMJdkm8rv19RZ5Pcun0dt8ZuXrUbnl7F2/IKXBg0ClYyrA9DL5XQfy9L
 vYOuw3iWVsJ8EVgs09h7nCyNhWrFO4eY6nxCS8te+Kr3Gl3H8bq8C92+fwEOW5deMDPz
 zfAqKBTEd5jjixlW7TtankcHIj6O9VfZSjUqUFnEfZkv3so4dZwPnOASzZZGAm1Qdl/H
 otpWGhGitj3z9NUbPI+jBcrhFZFF7a5pSJCEl6uLCL+C0ZFgudoVKtZoN2Ly1teItlL9
 oJHyYWONTDM+bmqPp2n5tKDSWfK4Tk2OpRW4kNgGfv3fWk2G9Ld4uI9KTM5TXnshtBJ3
 hBjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:autocrypt
 :organization:message-id:date:user-agent:mime-version:in-reply-to;
 bh=d8lOBBW528aCCx0dELp9561f8dChCOFbuQdYeuKHsRU=;
 b=PHKScO8ZB/5HcwV3oAyT10GD5eABus7urdNsbQXP6Dvc1E2hVHhp44aajgwaEBDoKj
 9ShsbMZM3nPxGfNkHlyr5x3vaz9V1jEh/2LInqBvDIQIZXW4iUW/QZOuDcSUSgtqREIz
 pTb/5ZBNTqR7lUAjEvWmZnpifsQr3XcoF2flsk8RCfB1Xcz1vKGRDQOQP9GX1gyujXTT
 lysVqnbeTZzbNweT+Bkn3OxDChvOFsfUfHs/s6+sWmwihuDWyD8uUo8Pk4DRiWEGThpk
 Cv4YfVhSJr42qLs7peZBWfvt4pN7McsTj8wXLwUF9vtgZIymPI8+ARrbhtin3alW/+Mk
 zE1w==
X-Gm-Message-State: ANhLgQ1rxScCNWTRiTSdmlT47T6B8vnnIH3jV4gSSfz02ur7q0OvuzP2
 9H08jmJESzxfbE0+OhwbFBi1EQ==
X-Google-Smtp-Source: ADFU+vta7vFiiLsgGcIf4NxQdqTKp+d2NdwuNxgzNaG4TvJNT/255+QjF1ee6JWfDbp7K+gfG/g2vg==
X-Received: by 2002:a1c:5604:: with SMTP id k4mr3975594wmb.57.1585153101589;
 Wed, 25 Mar 2020 09:18:21 -0700 (PDT)
Received: from ?IPv6:2a01:e35:2ec0:82b0:5c5f:613e:f775:b6a2?
 ([2a01:e35:2ec0:82b0:5c5f:613e:f775:b6a2])
 by smtp.gmail.com with ESMTPSA id z16sm17290219wrr.56.2020.03.25.09.18.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 25 Mar 2020 09:18:20 -0700 (PDT)
Subject: Re: [PATCH v4 7/8] drm/fourcc: amlogic: Add modifier definitions for
 the Scatter layout
To: Pekka Paalanen <ppaalanen@gmail.com>
References: <20200325085025.30631-1-narmstrong@baylibre.com>
 <20200325085025.30631-8-narmstrong@baylibre.com>
 <JgBZ7eZYMgXRNu_-E4ItS1bud9mEe15xptZEX_XhsM_h8_iIZTOmPokEVxPJYwX0wP0pmb5p-ymubyyZP3kVbcfuDNdmM0__L8wBR5IykfE=@emersion.fr>
 <b1386ef5-c3e3-c07b-5982-e3f02441b431@baylibre.com>
 <20200325154921.2a87930c@eldfell.localdomain>
From: Neil Armstrong <narmstrong@baylibre.com>
Autocrypt: addr=narmstrong@baylibre.com; prefer-encrypt=mutual; keydata=
 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
 BSwxi7g3Mu7u5kUByanqHyA=
Organization: Baylibre
Message-ID: <a385e2f6-52fa-e195-15e0-2132befc9f35@baylibre.com>
Date: Wed, 25 Mar 2020 17:18:15 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200325154921.2a87930c@eldfell.localdomain>
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
Cc: "mjourdan@baylibre.com" <mjourdan@baylibre.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Kevin Hilman <khilman@baylibre.com>,
 "linux-amlogic@lists.infradead.org" <linux-amlogic@lists.infradead.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Content-Type: multipart/mixed; boundary="===============1019807372=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============1019807372==
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature";
 boundary="XFdLrKDjHKkkr25qR6JRkWG0xNmx03epD"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--XFdLrKDjHKkkr25qR6JRkWG0xNmx03epD
Content-Type: multipart/mixed; boundary="xYRIM8FT5PkffJgu9IzYLanBQWKZrnDyH";
 protected-headers="v1"
From: Neil Armstrong <narmstrong@baylibre.com>
To: Pekka Paalanen <ppaalanen@gmail.com>
Cc: Simon Ser <contact@emersion.fr>,
 "mjourdan@baylibre.com" <mjourdan@baylibre.com>,
 Kevin Hilman <khilman@baylibre.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-amlogic@lists.infradead.org" <linux-amlogic@lists.infradead.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Message-ID: <a385e2f6-52fa-e195-15e0-2132befc9f35@baylibre.com>
Subject: Re: [PATCH v4 7/8] drm/fourcc: amlogic: Add modifier definitions for
 the Scatter layout
References: <20200325085025.30631-1-narmstrong@baylibre.com>
 <20200325085025.30631-8-narmstrong@baylibre.com>
 <JgBZ7eZYMgXRNu_-E4ItS1bud9mEe15xptZEX_XhsM_h8_iIZTOmPokEVxPJYwX0wP0pmb5p-ymubyyZP3kVbcfuDNdmM0__L8wBR5IykfE=@emersion.fr>
 <b1386ef5-c3e3-c07b-5982-e3f02441b431@baylibre.com>
 <20200325154921.2a87930c@eldfell.localdomain>
In-Reply-To: <20200325154921.2a87930c@eldfell.localdomain>

--xYRIM8FT5PkffJgu9IzYLanBQWKZrnDyH
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi,

On 25/03/2020 14:49, Pekka Paalanen wrote:
> On Wed, 25 Mar 2020 11:24:15 +0100
> Neil Armstrong <narmstrong@baylibre.com> wrote:
>=20
>> Hi,
>>
>> On 25/03/2020 10:04, Simon Ser wrote:
>>> On Wednesday, March 25, 2020 9:50 AM, Neil Armstrong <narmstrong@bayl=
ibre.com> wrote:
>>>  =20
>>>> Amlogic uses a proprietary lossless image compression protocol and f=
ormat
>>>> for their hardware video codec accelerators, either video decoders o=
r
>>>> video input encoders.
>>>>
>>>> This introduces the Scatter Memory layout, means the header contains=
 IOMMU
>>>> references to the compressed frames content to optimize memory acces=
s
>>>> and layout.
>>>>
>>>> In this mode, only the header memory address is needed, thus the con=
tent
>>>> memory organization is tied to the current producer execution and ca=
nnot
>>>> be saved/dumped neither transferrable between Amlogic SoCs supportin=
g this
>>>> modifier. =20
>>>
>>> I don't think this is suitable for modifiers. User-space relies on
>>> being able to copy a buffer from one machine to another over the
>>> network. It would be pretty annoying for user-space to have a blackli=
st
>>> of modifiers that don't work this way.
>>>
>>> Example of such user-space:
>>> https://gitlab.freedesktop.org/mstoeckl/waypipe/
>>>  =20
>>
>> I really understand your point, but this is one of the use-cases we ne=
ed solve.
>> This is why I split the fourcc patch and added an explicit comment.
>>
>> Please point me a way to display such buffer, the HW exists, works lik=
e that and
>> it's a fact and can't change.
>>
>> It will be the same for secure zero-copy buffers we can't map from use=
rspace, but
>> only the HW decoder can read/write and HW display can read.
>=20
> The comparison to secure buffers is a good one.
>=20
> Are buffers with the DRM_FORMAT_MOD_AMLOGIC_FBC_LAYOUT_SCATTER modifier=

> meaningfully mmappable to CPU always / sometimes / never /
> varies-and-cannot-know?

mmappable, yes in our WIP V4L2 driver in non-secure path, meaningful, abs=
olutely never.

So yeah, these should not be mmappable since not meaningful.

>=20
> Maybe this type should be handled similar to secure buffers, with the
> exception that they are not actually secured but only mostly
> inaccessible. Then again, I haven't looked at any of the secure buffer
> proposals.

Actually, the Amlogic platforms offers secure video path using these exac=
t
modifiers, AFAIK it doesn't support the NV12 dual-write output in secure.=


AFAIK last submission is from AMD, and it doesn't talk at all about mmapa=
bility
of the secure BOs.

Neil

>=20
>=20
> Thanks,
> pq
>=20



--xYRIM8FT5PkffJgu9IzYLanBQWKZrnDyH--

--XFdLrKDjHKkkr25qR6JRkWG0xNmx03epD
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEPVPGJshWBf4d9CyLd9zb2sjISdEFAl57hEoACgkQd9zb2sjI
SdFIbxAAxMVdsQPTW8kfXaPYRPJhtcKDE1Ob0peZcPDAFNcv9XDCrfOsRlwiHBSa
+SkIAa9OV5NTnQwIpwWB7SVxzu86ZMfNtMWmrI3WeViVuNEIVdkWmYosjlyBVa6k
aGMlSLiD3tNNMrELM4ad/YKkmIE0pbsgJd+tn4Kcgakq6v5oYZsskAuBAByZQScV
OPt+S8NPB5oMYtgKAd+NsGd7Jt7ZH+v7J/GXjvaMrM2UzD5eZNYu3BmeI6mAc7qV
LKG1XUHup2afAk0b6boNnZFZEKT3yo9IdK3n7lfaMPijue3zwKRagi0wI+EmSkRX
TyV/BWm3mp1YBYaEOM7wzpBKd97iHNWUo+SAuzrox26ebJF3hFg2WuGJDsOqH1x4
tUYMUiVA2c/9dfznx+AuzdK7+KkePj7JTrDIGyN9KwjBWlwDUw+dhsazAoGKnrY/
WCXYbxDpOS+lH/ClG7P61KYFUbAnbim5fnC+ZkjDdSi2qbYrcQOAZ14N8L8mbf6B
F1DK3kpeOKc3mu65az7RGMC3KKahgpDWaU6EZxvND20ZoeYqInXcWY0YccRR9i0z
mYA5WqhL42ZCPmH3PUBU2QSS3pCZUJOoNki2cTi4NfLhKlLHThV6v8VqVzQFFnp6
xC9HC+mpwhFQ8GZZKApjDxjGClZWLty14O3QMUWiN+Pa0imTDZ0=
=225J
-----END PGP SIGNATURE-----

--XFdLrKDjHKkkr25qR6JRkWG0xNmx03epD--

--===============1019807372==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1019807372==--
