Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 51138A24B5A
	for <lists+dri-devel@lfdr.de>; Sat,  1 Feb 2025 19:03:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C2A5B10E307;
	Sat,  1 Feb 2025 18:03:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 573 seconds by postgrey-1.36 at gabe;
 Fri, 31 Jan 2025 18:11:10 UTC
Received: from c64.rulez.org (c64.rulez.org [79.139.58.36])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 36B3410E410
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Jan 2025 18:11:10 +0000 (UTC)
Received: from [192.168.0.73] (unknown [89.134.11.203])
 by c64.rulez.org (Postfix) with ESMTPSA id 06B44100F6;
 Fri, 31 Jan 2025 19:01:34 +0100 (CET)
Message-ID: <b9db8b64-0671-ac9d-bf6f-8489d59fa0e9@c64.rulez.org>
Date: Fri, 31 Jan 2025 19:01:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Content-Language: en-GB
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Andrew Morton <akpm@linux-foundation.org>
Cc: Jaya Kumar <jayakumar.lkml@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Helge Deller <deller@gmx.de>, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, Matthew Wilcox <willy@infradead.org>
References: <cover.1736809898.git.lorenzo.stoakes@oracle.com>
 <091e47e4-1d8b-4b9c-8e1c-2f748c3bff8a@lucifer.local>
From: =?UTF-8?Q?Kajt=c3=a1r_Zsolt?= <soci@c64.rulez.org>
Subject: Re: [RFC PATCH v2 0/3] expose mapping wrprotect, fix fb_defio use
In-Reply-To: <091e47e4-1d8b-4b9c-8e1c-2f748c3bff8a@lucifer.local>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------ZNY00lgD277lN900ocl01OpD"
X-Mailman-Approved-At: Sat, 01 Feb 2025 18:02:57 +0000
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

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------ZNY00lgD277lN900ocl01OpD
Content-Type: multipart/mixed; boundary="------------DBpai003ltingbzHns0OOmA8";
 protected-headers="v1"
From: =?UTF-8?Q?Kajt=c3=a1r_Zsolt?= <soci@c64.rulez.org>
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Andrew Morton <akpm@linux-foundation.org>
Cc: Jaya Kumar <jayakumar.lkml@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Helge Deller <deller@gmx.de>, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, Matthew Wilcox <willy@infradead.org>
Message-ID: <b9db8b64-0671-ac9d-bf6f-8489d59fa0e9@c64.rulez.org>
Subject: Re: [RFC PATCH v2 0/3] expose mapping wrprotect, fix fb_defio use
References: <cover.1736809898.git.lorenzo.stoakes@oracle.com>
 <091e47e4-1d8b-4b9c-8e1c-2f748c3bff8a@lucifer.local>
In-Reply-To: <091e47e4-1d8b-4b9c-8e1c-2f748c3bff8a@lucifer.local>

--------------DBpai003ltingbzHns0OOmA8
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

> +cc Kajtar, who has kindly smoke tested this series on real hardware an=
d
> confirmed things are working ostensibly the same as before.
>=20
> On this basis I will be un-RFC'ing this and, if Kajtar can reply to
> confirm, will add a Tested-by tag to patch 3/3.

No problem, I'm glad I could help. Using defio is required for higher
resolution modes anyway so I just had to code that part a bit earlier
than planned.

--------------DBpai003ltingbzHns0OOmA8--

--------------ZNY00lgD277lN900ocl01OpD
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEE8WlaH4v4aHNT2Bn0WOeEu4KftGsFAmedD/4FAwAAAAAACgkQWOeEu4KftGvH
SQgAmTscsXtGZWTBDKrl0ASsFmKSpdOgGhTKGhYTKAdhjz/+EFhumh/ZtdUw4YmxpIoXG8/hjmyo
k1WEEgGxuFbQPBHoqZEYJ/V0tZpT9re7Kh4voE0LGKTMbXehhgNFK12kV4IPQ1BrEln/PyqpqAHU
H5mKSBJA1gBHvMGB7trHXtGvTZZE1B8UaEdpbCDNmOnTPYYC5hpcZvImmQtaRaXlJDjcKKe6+eZo
iFsVATK3OozHZivfHAGqC86AdU3s6b6j3K2NC0MyWJKPWy1t0fOn5J6krKO+wQL70I3zqM9Hglo1
6Am+X7mXibkbthRHxo3VHHJkYOvmlDSF2HGL6BHaBA==
=ywva
-----END PGP SIGNATURE-----

--------------ZNY00lgD277lN900ocl01OpD--
