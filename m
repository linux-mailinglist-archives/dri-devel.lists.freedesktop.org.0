Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E16D5708CAD
	for <lists+dri-devel@lfdr.de>; Fri, 19 May 2023 02:12:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F07C310E595;
	Fri, 19 May 2023 00:12:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout3.samsung.com (mailout3.samsung.com [203.254.224.33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF23410E595
 for <dri-devel@lists.freedesktop.org>; Fri, 19 May 2023 00:12:03 +0000 (UTC)
Received: from epcas1p4.samsung.com (unknown [182.195.41.48])
 by mailout3.samsung.com (KnoxPortal) with ESMTP id
 20230519001200epoutp0382c940f6ebb18fdb8ad16ad98d4a4f71~gYwHet0b22929929299epoutp03W
 for <dri-devel@lists.freedesktop.org>; Fri, 19 May 2023 00:12:00 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com
 20230519001200epoutp0382c940f6ebb18fdb8ad16ad98d4a4f71~gYwHet0b22929929299epoutp03W
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1684455120;
 bh=pdrCdpi0TrlNeMlO99WBEqXhi0bqBL2vqptXjduU3Fg=;
 h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
 b=QOcdJVvPCY3wLkJF9p5yoSrHd9ibtbPZ7a4I60raZXczBYyYeAaBxQHljH1PSw4aa
 eAUnAvLNTjSIzRJhCOkrpztOgkSq57S1UnsaSTW08NTD46I9EYHuxR2bhpa7ojlvtN
 DHrYn3fVeVpTNX0vDzrxip840mhv8eCgEvYPc3Ak=
Received: from epsnrtp3.localdomain (unknown [182.195.42.164]) by
 epcas1p1.samsung.com (KnoxPortal) with ESMTP id
 20230519001159epcas1p1242440de8321226db32b707cea28c07c~gYwHFUCxM0973409734epcas1p1J;
 Fri, 19 May 2023 00:11:59 +0000 (GMT)
Received: from epsmges1p1.samsung.com (unknown [182.195.36.134]) by
 epsnrtp3.localdomain (Postfix) with ESMTP id 4QMnMf72TVz4x9Q2; Fri, 19 May
 2023 00:11:58 +0000 (GMT)
Received: from epcas1p1.samsung.com ( [182.195.41.45]) by
 epsmges1p1.samsung.com (Symantec Messaging Gateway) with SMTP id
 A5.C3.48828.ECEB6646; Fri, 19 May 2023 09:11:58 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
 epcas1p4.samsung.com (KnoxPortal) with ESMTPA id
 20230519001158epcas1p41cfc87f247676f7967c669ec023ae053~gYwFyvNPE1972419724epcas1p4f;
 Fri, 19 May 2023 00:11:58 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
 epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20230519001158epsmtrp137abd872c670078b7d5a89645d15a057~gYwFx1WLx2043620436epsmtrp13;
 Fri, 19 May 2023 00:11:58 +0000 (GMT)
X-AuditID: b6c32a35-6ddff7000000bebc-16-6466bece4a4a
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
 epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
 27.FD.27706.ECEB6646; Fri, 19 May 2023 09:11:58 +0900 (KST)
Received: from inkidae002 (unknown [10.113.221.213]) by epsmtip2.samsung.com
 (KnoxPortal) with ESMTPA id
 20230519001158epsmtip23a7849152ff7824401950dd8e42f8ce0~gYwFh-63i0492504925epsmtip23;
 Fri, 19 May 2023 00:11:58 +0000 (GMT)
From: =?UTF-8?B?64yA7J246riw?= <inki.dae@samsung.com>
To: =?UTF-8?Q?'Uwe_Kleine-K=C3=B6nig'?= <u.kleine-koenig@pengutronix.de>,
 "'Inki Dae'" <daeinki@gmail.com>
In-Reply-To: <20230515091602.7tyzortaowrzmqqo@pengutronix.de>
Subject: RE: [PATCH 18/53] drm/exynos: Convert to platform remove callback
 returning void
Date: Fri, 19 May 2023 09:11:58 +0900
Message-ID: <045001d989e6$86eb6f00$94c24d00$@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Content-Language: ko
Thread-Index: AQLBfj05bl7QXD49urpFGiutWxQ66wEDxV79AjqUxgMCCnDzEwGDhXi/rVpsNaA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrKJsWRmVeSWpSXmKPExsWy7bCmru65fWkpBifeG1k8mLeNzeJp10Vm
 iytf37NZrPgyk91i1dSdLBZ7X29ltzjb9IbdYtPja6wWM87vY7KYMfklm8XtiZMZHbg9ds66
 y+5x59oeNo/73ceZPDYvqffo/2vg0bdlFaPH501yAexR2TYZqYkpqUUKqXnJ+SmZeem2St7B
 8c7xpmYGhrqGlhbmSgp5ibmptkouPgG6bpk5QCcqKZQl5pQChQISi4uV9O1sivJLS1IVMvKL
 S2yVUgtScgpMC/SKE3OLS/PS9fJSS6wMDQyMTIEKE7IzJlzfyVxwWbri3KzDTA2M06S6GDk4
 JARMJHZscOxi5OIQEtjBKDF/7xxmCOcTo8Taey3sEM43Ron7q68ydTFygnVMm7iFBSKxl1Hi
 +OQXbBDOS0aJdcuWsIFUsQmYSuz42MwCYosI5Ej0nn4I1sEs8IdJ4uKpX8wgCU4BW4l9J46z
 g9jCAtESy1f8YgWxWQRUJf63TANr5hWwlDg+/xwrhC0ocXLmE7A4s4C2xLKFr5khTlKQ+Pl0
 GStEXERidmcbM8hzIgJ+Et965ED2Sggc4JDY8/0iO0S9i0TXtSVQvcISr45vgYpLSbzsb2OH
 aJjMKHHn+goWCGcGo8Thn9cZIaqMJfYvncwEsoFZQFNi/S59iLCixM7fcxkhjuCTePe1hxUS
 wrwSHW1CECVKEscu3oCaIiFxYclEtgmMSrOQvDYLyWuzkLwzC2HZAkaWVYxiqQXFuempxYYF
 hvDoTs7P3cQITr9apjsYJ779oHeIkYmD8RCjBAezkghvYF9yihBvSmJlVWpRfnxRaU5q8SFG
 U2BgT2SWEk3OB2aAvJJ4QxNLAxMzI2MTC0MzQyVx3i9PtVOEBNITS1KzU1MLUotg+pg4OKUa
 mCZMcU93P8KSOO1ysLLB0dtTLloWuBRzeoa8CmdfvI7tj/i0BvHwd3v3r+JKUQrzLMkp5M+R
 DZrz/c9zrYqEOWvs76Q2dAkaXHXj3/mN3TJ/z/qISs2fj84EzZOa/V3Tu/hVsGtxirq5Y922
 vq5duut3CbqlNe2+c1pjtlNPfrQ675owN45FF415u1qXT/H5ZVWYUdKSfjZ8Vw1jZpjv+uxl
 JzsWP/ia/9tx6upVlqvmOGm+bZnLd6LtzIFDhnsmbTrJUp2o37z9W+o/s7VXtS6tDxbbsSjs
 QImdeWlWw477ly5zbN7V5jSRW19SkadtktMxRea+WbdX6LwrL9Su+TjRY1P6lYvB69N73KYI
 KbEUZyQaajEXFScCAMgruIZIBAAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprLIsWRmVeSWpSXmKPExsWy7bCSvO65fWkpBq//ils8mLeNzeJp10Vm
 iytf37NZrPgyk91i1dSdLBZ7X29ltzjb9IbdYtPja6wWM87vY7KYMfklm8XtiZMZHbg9ds66
 y+5x59oeNo/73ceZPDYvqffo/2vg0bdlFaPH501yAexRXDYpqTmZZalF+nYJXBkz/01iK3gk
 UjF9WVoD4w2BLkZODgkBE4lpE7ewdDFycQgJ7GaUaHt0F8jhAEpISGzZygFhCkscPlwMUfKc
 UaKxYS4jSC+bgKnEjo/NLCC2iECORO/ph2BzmAWamCU+zp3ECNFxgkni3pMnzCBVnAK2EvtO
 HGcHsYUFIiWajk4Bi7MIqEr8b5kGNolXwFLi+PxzrBC2oMTJmU/A4swC2hK9D1sZYexlC18z
 Q3ygIPHz6TJWiLiIxOzONmaQq0UE/CS+9chNYBSehWTSLCSTZiGZNAtJ9wJGllWMkqkFxbnp
 ucWGBYZ5qeV6xYm5xaV56XrJ+bmbGMExqKW5g3H7qg96hxiZOBgPMUpwMCuJ8Ab2JacI8aYk
 VlalFuXHF5XmpBYfYpTmYFES573QdTJeSCA9sSQ1OzW1ILUIJsvEwSnVwHStaoJ4urbClKwf
 3Dp/F2imRl/7tqfN5Ebmov86m/ayfqs39dx1JqXt+ldX/u/s+6tC7tUeyfbf0NLBtUtFcm/z
 EZMCHrstz24smeqy5NiaBSs0PNS2iCXX/5t/dtPDPVe4ajK3HyhW2VXmGT5J16+vVEo4Jm/i
 d6ffV1aev3nJuktBddnVKdwTeqWOaH3/mNzybeaW2KlZd5fuSskJX7Dsw5PFFbz+MyxrLzD9
 2iJ2994JJW+OVU+Pl9w49VJ7yrW9HvZLV0i83SDJfNA0aVLaXBVZz6uTpz140F7qzdY+Sa9J
 88vVKVPvtSv7R1w4I2eYeXWnUHHmaa3F5aVP3xp9XflP/8XHzUc9P68UE9YIUGIpzkg01GIu
 Kk4EABBODZUwAwAA
X-CMS-MailID: 20230519001158epcas1p41cfc87f247676f7967c669ec023ae053
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: SVC_REQ_APPROVE
CMS-TYPE: 101P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20230515091619epcas1p28a77f182aecebba1f59acd4ee31af377
References: <20230507162616.1368908-1-u.kleine-koenig@pengutronix.de>
 <20230507162616.1368908-19-u.kleine-koenig@pengutronix.de>
 <CAAQKjZN0DpnjpybZaEYz=eS4khTbY7RdS4i0-rC_-O_jk1iY-g@mail.gmail.com>
 <CGME20230515091619epcas1p28a77f182aecebba1f59acd4ee31af377@epcas1p2.samsung.com>
 <20230515091602.7tyzortaowrzmqqo@pengutronix.de>
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
Cc: linux-samsung-soc@vger.kernel.org, 'Alim	Akhtar' <alim.akhtar@samsung.com>,
 'Jingoo Han' <jingoohan1@gmail.com>, 'Seung-Woo Kim' <sw0312.kim@samsung.com>,
 'Krzysztof	Kozlowski' <krzysztof.kozlowski@linaro.org>,
 dri-devel@lists.freedesktop.org, 'Kyungmin Park' <kyungmin.park@samsung.com>,
 kernel@pengutronix.de, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

> -----Original Message-----
> From: dri-devel <dri-devel-bounces=40lists.freedesktop.org> On Behalf Of =
Uwe
> Kleine-Konig
> Sent: Monday, May 15, 2023 6:16 PM
> To: Inki Dae <daeinki=40gmail.com>
> Cc: linux-samsung-soc=40vger.kernel.org; Jingoo Han <jingoohan1=40gmail.c=
om>;
> Seung-Woo Kim <sw0312.kim=40samsung.com>; Kyungmin Park
> <kyungmin.park=40samsung.com>; dri-devel=40lists.freedesktop.org; Krzyszt=
of
> Kozlowski <krzysztof.kozlowski=40linaro.org>; kernel=40pengutronix.de; Al=
im
> Akhtar <alim.akhtar=40samsung.com>; linux-arm-kernel=40lists.infradead.or=
g
> Subject: Re: =5BPATCH 18/53=5D drm/exynos: Convert to platform remove cal=
lback
> returning void
>=20
> On Mon, May 15, 2023 at 04:32:00PM +0900, Inki Dae wrote:
> > Hi,
> >
> > 2023=EB=85=84=205=EC=9B=94=208=EC=9D=BC=20(=EC=9B=94)=20=EC=98=A4=EC=A0=
=84=201:27,=20Uwe=20Kleine-K=C3=B6nig=20<u.kleine-=0D=0A>=20koenig=40pengut=
ronix.de>=EB=8B=98=EC=9D=B4=20=EC=9E=91=EC=84=B1:=0D=0A>=20>=20>=0D=0A>=20>=
=20>=20The=20.remove()=20callback=20for=20a=20platform=20driver=20returns=
=20an=20int=20which=20makes=0D=0A>=20>=20>=20many=20driver=20authors=20wron=
gly=20assume=20it's=20possible=20to=20do=20error=20handling=20by=0D=0A>=20>=
=20>=20returning=20an=20error=20code.=20However=20the=20value=20returned=20=
is=20(mostly)=20ignored=0D=0A>=20>=20>=20and=20this=20typically=20results=
=20in=20resource=20leaks.=20To=20improve=20here=20there=20is=20a=0D=0A>=20>=
=20>=20quest=20to=20make=20the=20remove=20callback=20return=20void.=20In=20=
the=20first=20step=20of=20this=0D=0A>=20>=20>=20quest=20all=20drivers=20are=
=20converted=20to=20.remove_new()=20which=20already=20returns=0D=0A>=20>=20=
>=20void.=0D=0A>=20>=20>=0D=0A>=20>=20>=20Trivially=20convert=20the=20exyno=
s=20drm=20drivers=20from=20always=20returning=20zero=20in=0D=0A>=20>=20>=20=
the=20remove=20callback=20to=20the=20void=20returning=20variant.=0D=0A>=20>=
=0D=0A>=20>=20Could=20you=20please=20update=20exynos_drm_vidi.c=20also?=20S=
eems=20you=20missed.=0D=0A>=20=0D=0A>=20This=20one=20cannot=20be=20triviall=
y=20converted=20as=20vidi_remove()=20doensn't=20return=0D=0A>=20zero=20in=
=20all=20cases.=20I=20didn't=20grok=20the=20details=20about=20ctx->raw_edid=
=20and=0D=0A>=20don't=20know=20if=20skipping=20component_del()=20is=20right=
=20or=20not.=0D=0A>=20=0D=0A>=20If=20you=20know=20the=20driver,=20feel=20fr=
ee=20to=20address=20this.=0D=0A=0D=0AI=20just=20posted=20one=20patch=5B1=5D=
=20which=20drops=20error=20return=20line=20from=20vidi_remove()=20because=
=20it's=20not=20an=20error=20case=20so=20it=20shouldn't=20return=20an=20err=
or.=0D=0AIf=20you=20subscribed=20dri-devel=20then=20the=20patch=20must=20be=
=20in=20your=20mail=20box.=20On=20top=20of=20this,=20you=20could=20update=
=20it.=0D=0A=0D=0A=5B1=5D=20=5BPATCH=5D=20drm/exynos:=20vidi:=20fix=20a=20w=
rong=20error=20return=0D=0A=0D=0AThanks,=0D=0AInki=20Dae=0D=0A=0D=0A>=20=0D=
=0A>=20Best=20regards=0D=0A>=20Uwe=0D=0A>=20=0D=0A>=20--=0D=0A>=20Pengutron=
ix=20e.K.=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=7C=20Uwe=20Kleine-K=C3=B6nig=20=20=20=20=20=20=20=20=20=20=
=20=20=7C=0D=0A>=20Industrial=20Linux=20Solutions=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=7C=0D=0A>=20https://protect2.fireeye.com/v1/url=
?k=3Dfb0b309c-9a709a0b-fb0abbd3-=0D=0A>=2074fe4860001d-c8cb2d724d092dbd&q=
=3D1&e=3D7188ced8-eb65-487a-8ba9-=0D=0A>=20420177df6b75&u=3Dhttps%3A%2F%2Fw=
ww.pengutronix.de%2F=20=7C=0D=0A=0D=0A
