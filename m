Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E83D31B6F9
	for <lists+dri-devel@lfdr.de>; Mon, 15 Feb 2021 11:21:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ECC3B6E15D;
	Mon, 15 Feb 2021 10:21:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B4486E15D
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Feb 2021 10:21:33 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id r5so2478632wmp.1
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Feb 2021 02:21:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:autocrypt:organization:message-id
 :date:user-agent:mime-version:in-reply-to;
 bh=ABuC49iXdqXh74NGoNx2M4YkQV12xGJt9P0pPOL2EKI=;
 b=F7PxDCFNznrOrBzO+5IX4QyacPn7kUI8Eis2laoGImIjGHVnrQore3UTNLtjPZ2dAj
 XfczZBrxcCs+9CYGZWavk0WM9TD7NimSsGaz7AKo2SvcS7bn12JUgcQ2S1sHRAbQ7WGM
 Hb0MmeMLOfxLe7l/k1nJwAm4QDQsbmS4ktQVBjrSXj+6FmeJfTUju1CvprTPOovcWyLx
 QUUkhHHTmXwpZAb1KI22D2x/gNGJNm7KGJ5g49RI0Tnbz255+FI3UkntC9+0eJ15e9nn
 yiA/UbK2TYHsUZjEG3zOPbKvxg/IyK2QCMPdux83qrcOJRc13QVrKOdfWKisxMPPausu
 NY9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:autocrypt
 :organization:message-id:date:user-agent:mime-version:in-reply-to;
 bh=ABuC49iXdqXh74NGoNx2M4YkQV12xGJt9P0pPOL2EKI=;
 b=ZkiZqDXiMryAomdRc9tAHhwkukJg1uEGKtMBh1PZrdOI+fwwrtDIeD+muyeoAOkpqE
 jwbFAXRCCn11cOd8w6aFEz/eDHUaMgUvDNX35EsN9IYVUc9tpbGSaEFMeQks9VnElk9P
 5NbI3apSpgjDyb4ErNDSJX54+EeJlHGwNY+VDwuZOTYNfrFvU6aA2NWZBZ368lVr93Q5
 +5BBx0UiLcepaeD/+78Br8Sm1ah3sGTc1V5IftX1Gxc0s83XZstraKHxmaLbmbDN/5+X
 byvNPwuGUrSGtgk6rQBKaJmPza5FYO710zkrHn5lTmW3FsxxDv2P4c3huSoziSqU93Vf
 U7mQ==
X-Gm-Message-State: AOAM533cy+MTn4IHQwy8+8WfteVZG/lTLUx5A+FOjUZkotCY6Fr1PhYI
 mWQX/BGP1YSZwsHhAiGF3m+7RPOK+ajPzLJc
X-Google-Smtp-Source: ABdhPJyFKLDoNzJ/a/qrxutjYVW9lELKquQyjx4gvpqgVCSq/PYU5VMhTOyMAicDh0vlTvmvaYs/lg==
X-Received: by 2002:a1c:bc89:: with SMTP id m131mr13872297wmf.32.1613384491653; 
 Mon, 15 Feb 2021 02:21:31 -0800 (PST)
Received: from ?IPv6:2a01:e0a:90c:e290:3627:e500:c425:5f5c?
 ([2a01:e0a:90c:e290:3627:e500:c425:5f5c])
 by smtp.gmail.com with ESMTPSA id x11sm18559434wrv.83.2021.02.15.02.21.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 15 Feb 2021 02:21:30 -0800 (PST)
Subject: Re: [PATCH 0/3] NVIDIA Tegra NVDEC support
To: Thierry Reding <thierry.reding@gmail.com>
References: <20210213101512.3275069-1-mperttunen@nvidia.com>
 <8a50f133-12ed-e81c-47a5-07c51924ec6a@baylibre.com>
 <YCpEA8K6vgxfz8uC@ulmo.localdomain>
From: Neil Armstrong <narmstrong@baylibre.com>
Autocrypt: addr=narmstrong@baylibre.com; prefer-encrypt=mutual; keydata=
 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
 ZaTUOEkgIor5losDrePdPgE=
Organization: Baylibre
Message-ID: <d634884e-e40e-50c7-40bb-75df64f281f2@baylibre.com>
Date: Mon, 15 Feb 2021 11:21:27 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <YCpEA8K6vgxfz8uC@ulmo.localdomain>
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
Cc: dri-devel@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============1365847244=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============1365847244==
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature";
 boundary="ascrEJw9NYp2Y48nhyqHiEq4sXPgtrWXo"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--ascrEJw9NYp2Y48nhyqHiEq4sXPgtrWXo
Content-Type: multipart/mixed; boundary="aOZpHIJ6Amn7r0Q5U30cPgw8b2RkO9mnj";
 protected-headers="v1"
From: Neil Armstrong <narmstrong@baylibre.com>
To: Thierry Reding <thierry.reding@gmail.com>
Cc: dri-devel@lists.freedesktop.org
Message-ID: <d634884e-e40e-50c7-40bb-75df64f281f2@baylibre.com>
Subject: Re: [PATCH 0/3] NVIDIA Tegra NVDEC support
References: <20210213101512.3275069-1-mperttunen@nvidia.com>
 <8a50f133-12ed-e81c-47a5-07c51924ec6a@baylibre.com>
 <YCpEA8K6vgxfz8uC@ulmo.localdomain>
In-Reply-To: <YCpEA8K6vgxfz8uC@ulmo.localdomain>

--aOZpHIJ6Amn7r0Q5U30cPgw8b2RkO9mnj
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi Thierry,


On 15/02/2021 10:50, Thierry Reding wrote:
> On Mon, Feb 15, 2021 at 10:10:26AM +0100, Neil Armstrong wrote:
>> Hi,
>>
>> On 13/02/2021 11:15, Mikko Perttunen wrote:
>>> Hi all,
>>>
>>> with the release of documentation headers for Tegra multimedia engine=
s
>>> (NVDEC, NVENC, NVJPG) [1], I have started working on the correspondin=
g
>>> implementations. Here's the first one, NVDEC.
>>>
>>> The kernel driver is a simple Falcon boot driver based on the VIC
>>> driver. Some code sharing should be considered there in the future.
>>> The userspace driver to accompany this is a bit more complicated -
>>> I have expanded vaapi-tegra-driver[2] to support MPEG2 decoding.
>>> It should be noted that the implementation is still very clunky
>>> and has poor performance, but it's a start.
>>
>> Funny how all this tries to avoid all the DRM, remoteproc, V4L2-M2M st=
ateless & co
>> all the other vendors tries to make usage of...
>=20
> Care to elaborate why you think this is trying to avoid anything? Mikko=

> pointed you at the documentation for these engines, provided a link to
> an open-source (albeit work in progress) userspace driver and posts an
> extension to an existing DRM driver to add the required kernel
> functionality. That's a standard approach for submitting this kind of
> driver.

Thanks for the reply, I didn't look extensively at all the documents & us=
erspace
libraries, but I wonder why this couldn't fit in the V4L2-M2M approach an=
d avoid
having userspace drivers and specific libraries to handle this.

Neil

>=20
> Thierry
>=20



--aOZpHIJ6Amn7r0Q5U30cPgw8b2RkO9mnj--

--ascrEJw9NYp2Y48nhyqHiEq4sXPgtrWXo
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEPVPGJshWBf4d9CyLd9zb2sjISdEFAmAqSykACgkQd9zb2sjI
SdEViA/+MneSLS4qFmLHMd4uw7oLRc/jQ5MiROrHD9roh2jInQITfgyJP6JdmjmM
I6bUSu0bIe9pQZy0EhTjwkT3oG2e1X/OO1MU/r9ATRDj5liR4XW1jW3x6FrvCcET
9P34nbWNBDElAa49sMZ0hFDVGZjuDvDRPMrQKSf9mdyzuVekJp65bavZNEsR7XEZ
jq+GyY8XfKrYCyMsxMWNClwFh3dCzwjxbZWYB+O9mqsDKvKbV4JylT/12VUGo0xZ
vGScZ8TIOlNgkaPwEiEp6SJ1plhw9iJ7r6X4H0azu7gcLIL8SYaZCxUopkSd/vc4
YCBse+GDcMB/b2y3EhUoM5CY1LaCTfqWQA+VVS6lXUm8jR9PwHHZTfmoDiLY8fvk
H5QLjbc5azjp8atmOR+VnxdOELFPKd+z/vsHIj0NioholNCU+62Tw0xbDYv3tHae
qdj/623MrRrMqdvGbIr3n5HYlHNNqoPNpnjBUkPiBdCcOxaCZvj1iJV2gnYu4ZD+
lc2XtYHu64U7ZOts5p/nR8lRD2gMOZZmheWV6lk2E1y0WBqK0YQBiOrEbFTYJ390
k3KIZCUhRfOJip9xKMAEwVjv4inWakX5Om7GXQdW1gkcl3QEHU1AAWNGHnA1b5S7
gelXfym65756fGUrtSAaCueTAqxAsExC98G1kTu2h4GGWPYBjyE=
=/CyD
-----END PGP SIGNATURE-----

--ascrEJw9NYp2Y48nhyqHiEq4sXPgtrWXo--

--===============1365847244==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1365847244==--
