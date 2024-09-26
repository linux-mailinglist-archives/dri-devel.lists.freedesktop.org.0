Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 36281986C14
	for <lists+dri-devel@lfdr.de>; Thu, 26 Sep 2024 07:34:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8DDE310E118;
	Thu, 26 Sep 2024 05:34:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=samsung.com header.i=@samsung.com header.b="i5cT+yIJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout1.samsung.com (mailout1.samsung.com [203.254.224.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F7B010E118
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Sep 2024 05:34:53 +0000 (UTC)
Received: from epcas1p2.samsung.com (unknown [182.195.41.46])
 by mailout1.samsung.com (KnoxPortal) with ESMTP id
 20240926053452epoutp015e49bdc95802e606f3a4342cb724f739~4tHm6s_PL0967109671epoutp01a
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Sep 2024 05:34:52 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com
 20240926053452epoutp015e49bdc95802e606f3a4342cb724f739~4tHm6s_PL0967109671epoutp01a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1727328892;
 bh=swXyTAcLgwrpOR7vwZIp8q1pyVRfiEN01n1XjACumU4=;
 h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
 b=i5cT+yIJpWuYg8ayC/EMU15wlvMH2VIbUs5utAx6s+jYofMb8ezLl8GYp/4KZqJkH
 9GpZipF24hzsqRiE3+7RRyyjJEkYibLG8oOq9+04iC4J43/q62tEh+1KWO5dQdGio1
 Rgx12/ACxTAi3YIFTj7pbXw0tTeBKEA6wFk7W23U=
Received: from epsnrtp1.localdomain (unknown [182.195.42.162]) by
 epcas1p4.samsung.com (KnoxPortal) with ESMTP id
 20240926053451epcas1p4c26022781b0e48c369a986b2e79b0e02~4tHmcMMla0679906799epcas1p48;
 Thu, 26 Sep 2024 05:34:51 +0000 (GMT)
Received: from epsmges1p3.samsung.com (unknown [182.195.38.237]) by
 epsnrtp1.localdomain (Postfix) with ESMTP id 4XDj3G0Plcz4x9Q8; Thu, 26 Sep
 2024 05:34:50 +0000 (GMT)
Received: from epcas1p2.samsung.com ( [182.195.41.46]) by
 epsmges1p3.samsung.com (Symantec Messaging Gateway) with SMTP id
 01.7F.09725.972F4F66; Thu, 26 Sep 2024 14:34:49 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
 epcas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20240926053449epcas1p2e8596f64b7ee5d3b8cdf565bacdc6510~4tHkoAwy11368013680epcas1p2f;
 Thu, 26 Sep 2024 05:34:49 +0000 (GMT)
Received: from epsmgmcp1.samsung.com (unknown [182.195.42.82]) by
 epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20240926053449epsmtrp115837797407d31f4abe8a41f921962b0~4tHknD2Wt0333203332epsmtrp1I;
 Thu, 26 Sep 2024 05:34:49 +0000 (GMT)
X-AuditID: b6c32a37-1f3ff700000025fd-48-66f4f279057b
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
 epsmgmcp1.samsung.com (Symantec Messaging Gateway) with SMTP id
 8F.49.19367.972F4F66; Thu, 26 Sep 2024 14:34:49 +0900 (KST)
Received: from [10.113.111.204] (unknown [10.113.111.204]) by
 epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20240926053449epsmtip12248e1a358afba040f90ca5bfa99b6d0~4tHkRAQg_0521205212epsmtip1K;
 Thu, 26 Sep 2024 05:34:49 +0000 (GMT)
Message-ID: <d2a6b8d16b001b72fd01cfc5b4895e6fee0b7032.camel@samsung.com>
Subject: Re: [PATCH 6/6] dt-bindings: display: samsung,exynos7-decon: add
 exynos7870 compatible
From: Kwanghoon Son <k.son@samsung.com>
To: Kaustabh Chakraborty <kauschluss@disroot.org>, Krzysztof Kozlowski
 <krzk@kernel.org>
Cc: airlied@gmail.com, alim.akhtar@samsung.com, conor@kernel.org,
 devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 inki.dae@samsung.com, kyungmin.park@samsung.com, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-samsung-soc@vger.kernel.org, maarten.lankhorst@linux.intel.com, 
 mripard@kernel.org, robh@kernel.org, simona@ffwll.ch,
 sw0312.kim@samsung.com,  tzimmermann@suse.de
Date: Thu, 26 Sep 2024 14:34:49 +0900
In-Reply-To: <d8f5999921a31d7723e0aa9b12bb9eaf@disroot.org>
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
MIME-Version: 1.0
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrNJsWRmVeSWpSXmKPExsWy7bCmnm7lpy9pBgc2WlicuL6IyeLBvG1s
 FiunrmKzmH/kHKvFla/v2Swm3Z/AYvHn33k2i/PnN7BbnG16w26x6fE1VovLu+awWcw4v4/J
 YuHHrSwWbZ3LWC3+79nBbjH73X52ixmTX7JZbHkzkdVByOPkus1MHnu/LWDx2DnrLrvHplWd
 bB7zTgZ63O8+zuSxeUm9R9+WVYwem09Xe3zeJBfAFZVtk5GamJJapJCal5yfkpmXbqvkHRzv
 HG9qZmCoa2hpYa6kkJeYm2qr5OIToOuWmQP0k5JCWWJOKVAoILG4WEnfzqYov7QkVSEjv7jE
 Vim1ICWnwLRArzgxt7g0L10vL7XEytDAwMgUqDAhO2Pd4SmsBRt5Kua8m8DewHiTs4uRk0NC
 wETi8LMm5i5GLg4hgR2MEkdnrWWBcD4xStzaepUVpArM6Tsa18XIAdax/0IKRM1ORonH109B
 NbxnlFjWuIMVpIhXwEPi+a8kkF5hgUSJpQtb2UBsNgF1iSVta9lBbBGBKIn7qw+CbWYWWMMs
 sfH8ZWaQBIuAqsTn30fAFnMKWEu8md3FCGIzC2hLLFv4GqxGVEBeouHhCTCbV0BQ4uTMJ2BH
 SAh84JBY8LaZCeI3F4nZixawQNjCEq+Ob2GHsKUkXva3QdnZEkc/7mWDsEskrs9axAphG0vs
 XzqZCeQZZgFNifW79CFu4JN497WHFRIQvBIdbUIQprzErc5yiEZRiTNPP0IN9JB4e/I7EyR4
 mlgkpt/8zzaBUX4Wkm9mIflgFsKyBYzMqxjFUguKc9NTiw0LjOFxmpyfu4kRnKq1zHcwTnv7
 Qe8QIxMH4yFGCQ5mJRHeSTc/pgnxpiRWVqUW5ccXleakFh9iNAWG6URmKdHkfGC2yCuJNzSx
 NDAxMzI2sTA0M1QS5z1zpSxVSCA9sSQ1OzW1ILUIpo+Jg1Oqgalc01zo8tsS98Osj92UAl0E
 FaNv6zW+ZdosyBktlcaXUzuZ/9Jbjvs/nGctKClvumimKrHM//4ipzniC2zXdM2dbJ3UZX7O
 0OWZQe3zybEvp3pzf/ZVNG5h+XLudnXgwxyWGb8d9k2VefTsYAb/dLmF5jYdGvIKGdFTZ6+Q
 vXjGx9c16uTnrJWTF0+VT14QK/ZEunHCf+WmDrFXGyIvcprMjdLrefVjxg2bMIVnn+dWsy7M
 nj6Ze3rcssNdjiqrZK0EEmf+k3Blu3XSpSl69QbHTottjM3BX/ROJz+b0udinH1B0mPp+3KT
 M7aPZiv+17yQHHNkcQl/6YXKO+lR4ld5t7oo8D771b9eYfnFR0osxRmJhlrMRcWJAEa0uZRe
 BAAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrGIsWRmVeSWpSXmKPExsWy7bCSnG7lpy9pBvf/i1mcuL6IyeLBvG1s
 FiunrmKzmH/kHKvFla/v2Swm3Z/AYvHn33k2i/PnN7BbnG16w26x6fE1VovLu+awWcw4v4/J
 YuHHrSwWbZ3LWC3+79nBbjH73X52ixmTX7JZbHkzkdVByOPkus1MHnu/LWDx2DnrLrvHplWd
 bB7zTgZ63O8+zuSxeUm9R9+WVYwem09Xe3zeJBfAFcVlk5Kak1mWWqRvl8CV0XryBVPBCp6K
 nptbWRsYL3F2MXJwSAiYSOy/kNLFyMUhJLCdUeLV+adsXYycQHFRiY7LjYwQNcIShw8Xg4SF
 BN4ySsw5XAAS5hXwkHj+KwkkLCyQKLF0YStYJ5uAusSStrXsILaIQLTE+1cLmUDGMwusZZbo
 3LWMBSTBIqAq8fn3EVYQm1PAWuLN7C5GiBu2Mks8fXWWGSTBLKAp0br9NzuErS2xbOFrsLio
 gLxEw8MTYDavgKDEyZlPWCYwCs5C0jILScssJGULGJlXMYqmFhTnpucmFxjqFSfmFpfmpesl
 5+duYgRHpVbQDsZl6//qHWJk4mA8xCjBwawkwjvp5sc0Id6UxMqq1KL8+KLSnNTiQ4zSHCxK
 4rzKOZ0pQgLpiSWp2ampBalFMFkmDk6pBia3lwdduHpuX/qfFfaGb7fPT4OexWor7Jb57uyq
 ePjgAvcta/919yJ//eV5l742rjhEKWKpuuRdN6sl768sbt+reY5H0vuyA9+Mhy8fdf4/sCr6
 RPhVHp1rdpObvA/8ufX2jUDFjFM9k+b6z7cOuXXHewuXG6fJ6jjP+BseRtvufrVTvLR4pUje
 9agVF3W8rtq7Vxlsa1Sb0Rm2Le7cnZyGdYczrm5KFdgmc/Z33Zrl8579DbpgF7HxdcSv2xWB
 cR/tVyvUHM6t+bqb3eu3h0BY3al7pZP/R5b1h+zL/XKYe+uO7wcP852tMglLNN7pLv/i9O8f
 /Nbf+DbbHb+YNFOu2fFHsWnntYDmPecTGbhPK7EUZyQaajEXFScCAGYfEWY5AwAA
X-CMS-MailID: 20240926053449epcas1p2e8596f64b7ee5d3b8cdf565bacdc6510
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 101P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20240926053449epcas1p2e8596f64b7ee5d3b8cdf565bacdc6510
References: <20240919-exynosdrm-decon-v1-0-6c5861c1cb04@disroot.org>
 <20240919-exynosdrm-decon-v1-6-8c3e3ccffad5@disroot.org>
 <32ae1188-196d-4fe8-8719-968e5149a771@kernel.org>
 <7e5caaea80390e8cf87ba0a74d9719f0@disroot.org>
 <1bc0ad48-03c0-4cf6-afb1-2296d1c259b9@kernel.org>
 <8e0672ad3fd72f69d2bdb5687e778c86@disroot.org>
 <ef786b8b-32c0-457a-9e14-ed7bd9f04172@kernel.org>
 <d8f5999921a31d7723e0aa9b12bb9eaf@disroot.org>
 <CGME20240926053449epcas1p2e8596f64b7ee5d3b8cdf565bacdc6510@epcas1p2.samsung.com>
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

On Wed, 2024-09-25 at 20:05 +0000, Kaustabh Chakraborty wrote:
> On 2024-09-25 19:56, Krzysztof Kozlowski wrote:
> > On 25/09/2024 21:36, Kaustabh Chakraborty wrote:
> > > On 2024-09-25 19:25, Krzysztof Kozlowski wrote:
> > > > On 25/09/2024 20:42, Kaustabh Chakraborty wrote:
> > > > > On 2024-09-20 12:39, Krzysztof Kozlowski wrote:
> > > > > > On 19/09/2024 17:20, Kaustabh Chakraborty wrote:
> > > > > > > Add the compatible string of Exynos7870 to the existing list.
> > > > > > >=20
> > > > > > > Signed-off-by: Kaustabh Chakraborty <kauschluss=40disroot.org=
>
> > > > > >=20
> > > > > > ... and the DTS is <please provide lore ink in changelog>?
> > > > >=20
> > > > > Didn't quite understand. The patch adds the compatible string
> > > > > for Exynos7870 DECON in documentation. There's no DTS involved
> > > > > in here, right?
> > > >=20
> > > > Provide lore link to the DTS submission.
> > >=20
> > > There aren't any DTS submissions *yet* which use the compatible.
> > > Is that an issue?
> > >=20
> >=20
> > Yeah, users are supposed to be upstream. Not downstream.
>=20
> I understand that. I had plans to submit it in the future.
> If that's how it's meant to be done, I'll have to revisit this
> submission at a later date then.

Hi, may I ask for reason that you don't submit dts?
I am asking because I wonder if there is an issue related to DPP.

https://lore.kernel.org/linux-samsung-soc/2e4d3d180f535e57d9cb98e7bac1d14b5=
1ffc5d4.camel=40gmail.com/=23t

Best regards,
kwang.

>=20
> >=20
> > Best regards,
> > Krzysztof

