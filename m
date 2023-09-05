Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 82361792147
	for <lists+dri-devel@lfdr.de>; Tue,  5 Sep 2023 11:06:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B9B2210E185;
	Tue,  5 Sep 2023 09:06:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout3.samsung.com (mailout3.samsung.com [203.254.224.33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B168C10E185
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Sep 2023 09:06:11 +0000 (UTC)
Received: from epcas1p2.samsung.com (unknown [182.195.41.46])
 by mailout3.samsung.com (KnoxPortal) with ESMTP id
 20230905090609epoutp031a957b743a0d4ba5493981abf9f7a344~B9WmzxvWo0396003960epoutp03E
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Sep 2023 09:06:09 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com
 20230905090609epoutp031a957b743a0d4ba5493981abf9f7a344~B9WmzxvWo0396003960epoutp03E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1693904769;
 bh=z88iN8chDRzmFryod6YOHa63RzQDFW+7GbXl/FfkhZY=;
 h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
 b=N+aVRkVUUiYIPWBjtkuxJiesn68kaRUZdzTf3r7j3Lbp6HZE0l1Xczi9/SwYaIB7F
 KenBgtcQB0HhSZiVUBXGFIay5DhK9Tq36k5bklCSNQ49JR7GO/HINN48SpHWWScgLv
 OX3EF3s0Ws2Of1jk75DpYjJcj5+XJqLR2Wt9yE+o=
Received: from epsnrtp3.localdomain (unknown [182.195.42.164]) by
 epcas1p4.samsung.com (KnoxPortal) with ESMTP id
 20230905090608epcas1p42f05491be0564e6287f648805a2171a6~B9WmEwpnG2278922789epcas1p4_;
 Tue,  5 Sep 2023 09:06:08 +0000 (GMT)
Received: from epsmgec1p1.samsung.com (unknown [182.195.38.235]) by
 epsnrtp3.localdomain (Postfix) with ESMTP id 4Rg03g3KSPz4x9Q0; Tue,  5 Sep
 2023 09:06:07 +0000 (GMT)
Received: from epcas1p4.samsung.com ( [182.195.41.48]) by
 epsmgec1p1.samsung.com (Symantec Messaging Gateway) with SMTP id
 F3.5C.09647.F7FE6F46; Tue,  5 Sep 2023 18:06:07 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
 epcas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20230905090607epcas1p147c8d5bd1f26ab68609195a164ad4b39~B9Wk0szaD1568915689epcas1p1T;
 Tue,  5 Sep 2023 09:06:07 +0000 (GMT)
Received: from epsmgmcp1.samsung.com (unknown [182.195.42.82]) by
 epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20230905090607epsmtrp2d369cb06a38d8f10d71cff36fb01762f~B9Wkz08FF0492304923epsmtrp2O;
 Tue,  5 Sep 2023 09:06:07 +0000 (GMT)
X-AuditID: b6c32a36-0d9ff700000025af-ee-64f6ef7f1ac7
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
 epsmgmcp1.samsung.com (Symantec Messaging Gateway) with SMTP id
 D9.54.18916.E7FE6F46; Tue,  5 Sep 2023 18:06:06 +0900 (KST)
Received: from inkidae001 (unknown [10.113.221.213]) by epsmtip1.samsung.com
 (KnoxPortal) with ESMTPA id
 20230905090606epsmtip1507b441f6b58b6a18a7bb474db13f93b~B9WkiChp11452914529epsmtip1o;
 Tue,  5 Sep 2023 09:06:06 +0000 (GMT)
From: =?UTF-8?B?64yA7J246riwL1RpemVuIFBsYXRmb3JtIExhYihTUikv7IK87ISx7KCE7J6Q?=
 <inki.dae@samsung.com>
To: "'Michael Tretter'" <m.tretter@pengutronix.de>, "'Inki Dae'"
 <daeinki@gmail.com>
In-Reply-To: <20230904111520.GC224131@pengutronix.de>
Subject: RE: [PATCH 3/5] drm/bridge: samsung-dsim: update PLL reference clock
Date: Tue, 5 Sep 2023 18:06:06 +0900
Message-ID: <001001d9dfd8$3444bbb0$9cce3310$@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQHTAiQ+eglt0lJc1nawqkA0YLlBTgFjoCjGAV05wlsB/C3hnwKY8tZ1r97T6wA=
Content-Language: ko
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrCJsWRmVeSWpSXmKPExsWy7bCmgW79+28pBuunSljcX/yZxeJp10Vm
 iytf37NZfNk0gc3i+fx1jBYn31xlsVg1dSeLRefEJewWl3fNYbNYe+Quu8W2FedYLd7vvMVo
 MWneTVYHXo+1H++zeuycdZfdY3bHTFaPxXteMnlsWtXJ5nFiwiUmjzvX9rB53O8+zuTR/9fA
 o2/LKkaPz5vkArijsm0yUhNTUosUUvOS81My89JtlbyD453jTc0MDHUNLS3MlRTyEnNTbZVc
 fAJ03TJzgD5QUihLzCkFCgUkFhcr6dvZFOWXlqQqZOQXl9gqpRak5BSYFugVJ+YWl+al6+Wl
 llgZGhgYmQIVJmRnTPy9gbngnkvF/OMv2RsYFzl1MXJySAiYSCxs/8DWxcjFISSwg1Fi9sp1
 UM4nRonHVxtY4ZyLH48zwbRMm38SKrGTUeLP5F1QzktGiZ7VN8Gq2ATSJe52NwDZHBwiAmES
 d/YYgtQwC1xnlnj7+BgzSA2ngKnEg+1TweqFBfwlJl5eABZnEVCR+PDsFVicV8BS4mj3BBYI
 W1Di5MwnYDazgLbEsoWvmSEuUpD4+XQZK8QuP4md+wsgSkQkZne2MYPslRB4wSFx9+dhqA9c
 JCZ2zmKFsIUlXh3fwg5hS0l8freXDaJhMqPEnesrWCCcGYwSh39eZ4SoMpbYv3Qy2GfMApoS
 63fpQ4QVJXb+nssIsZlP4t3XHrCDJAR4JTrahCBKlCSOXbwBNUVC4sKSiWwTGJVmIXltFpLX
 ZiH5YRbCsgWMLKsYxVILinPTU4sNC4zg0Z2cn7uJEZy8tcx2ME56+0HvECMTB+MhRgkOZiUR
 3nfy31KEeFMSK6tSi/Lji0pzUosPMZoCA3sis5Rocj4wf+SVxBuaWBqYmBkZm1gYmhkqifPO
 edybIiSQnliSmp2aWpBaBNPHxMEp1cAUMY2BS39/HteK+pXWcWnzPm33iy5/Iph7aeGijT8Z
 u3av3P906a9VZUc2SUle2XTbJFgoMkG/v3Pr3g3CASH3Pl551bVi9hnrr28SbfUvFNe4T3R9
 mmaVVtL6y+P81zIfSaa3V9nf1M22096uetH9bn7GxY2XfdZ3rEmdKmGUnvPuZqnDZJl9oWq8
 c1/dyFZ1Wj/3o6Cibslm7n2ha16/a1ONqJHxfKqd2ybZt1d5i3T8Ul4lrtk7anV1BY1K1UNv
 qL36c+/N06dlewP8Dh6a/txWKp3986W/vl4WWZLJyw5Na/AKdp6aLrpDSj6j2vl78CabHOtV
 +1ac+hzBHeOYftOqZMLOk4y+gcZcDnpKLMUZiYZazEXFiQAMbnCnZwQAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrOIsWRmVeSWpSXmKPExsWy7bCSnG7d+28pBnt/WVrcX/yZxeJp10Vm
 iytf37NZfNk0gc3i+fx1jBYn31xlsVg1dSeLRefEJewWl3fNYbNYe+Quu8W2FedYLd7vvMVo
 MWneTVYHXo+1H++zeuycdZfdY3bHTFaPxXteMnlsWtXJ5nFiwiUmjzvX9rB53O8+zuTR/9fA
 o2/LKkaPz5vkArijuGxSUnMyy1KL9O0SuDLurt7DVDBJr2LrzA2MDYwvlLoYOTkkBEwkps0/
 ydrFyMUhJLCdUeL0ks2MXYwcQAkJiS1bOSBMYYnDh4tByoUEnjNKbF/DBWKzCaRK3Pj0kR3E
 FhEIk9ix/R8ziM0scJ9Z4vQTG4iRe5kkdu/uAyviFDCVeLB9KhOILSzgK7H3VzNYnEVAReLD
 s1dgcV4BS4mj3RNYIGxBiZMzn7BADNWW6H3YyghjL1v4mhnifgWJn0+XsYLcKSLgJ7FzfwFE
 iYjE7M425gmMwrOQTJqFZNIsJJNmIWlZwMiyilE0taA4Nz03ucBQrzgxt7g0L10vOT93EyM4
 brWCdjAuW/9X7xAjEwfjIUYJDmYlEd538t9ShHhTEiurUovy44tKc1KLDzFKc7AoifMq53Sm
 CAmkJ5akZqemFqQWwWSZODilGpimPfoVdketa3JK34ntyqG72RVZpNfJBPBKhJor7nuhZqSS
 J/wz9LjEok6hTZND5v7+1z9TeNLGt60TmFKNbrJJBhw/LRBwl39u48eQ5g5HnuSMZC3z5pa6
 qWaXg9cv1w/yK2lQeaL/YtUhr6TQXR7bbSfs3XVbq7fyzvtOU/NFjtLrbM4mqa79tc7aatdF
 QYNjFo9bPJQ2NS+eUbfCaqPukzPnpSYxaN3mW/5wWtG8yA1r658tPnBwov3CHWzf857LWXgn
 3iuOqXh2aJ+QoGJG7c8g8cgrd1a/n7Wgmue4x8lKO8aXalr3+KQrXhtUvFd3P19Q3vbtwUTh
 togF3/6IeMxsSW9zdWZ6c0F6+SMlluKMREMt5qLiRAC0KxOfSgMAAA==
X-CMS-MailID: 20230905090607epcas1p147c8d5bd1f26ab68609195a164ad4b39
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: SVC_REQ_APPROVE
CMS-TYPE: 101P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20230904111544epcas1p13a72637ff0351af5760ad958e5d11de9
References: <20230818-samsung-dsim-v1-0-b39716db6b7a@pengutronix.de>
 <20230818-samsung-dsim-v1-3-b39716db6b7a@pengutronix.de>
 <CAAQKjZODcKE_O-Nb_qym0BqAZymUu9j24d+8-UXFsFQekJ=unw@mail.gmail.com>
 <CGME20230904111544epcas1p13a72637ff0351af5760ad958e5d11de9@epcas1p1.samsung.com>
 <20230904111520.GC224131@pengutronix.de>
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
Cc: 'Neil Armstrong' <neil.armstrong@linaro.org>,
 'Robert Foss' <rfoss@kernel.org>, kernel@pengutronix.de,
 'Jonas Karlman' <jonas@kwiboo.se>, linux-kernel@vger.kernel.org, 'Jernej
 Skrabec' <jernej.skrabec@gmail.com>, 'Jagan Teki' <jagan@amarulasolutions.com>,
 dri-devel@lists.freedesktop.org, 'Andrzej Hajda' <andrzej.hajda@intel.com>,
 'Marek Szyprowski' <m.szyprowski@samsung.com>,
 'Laurent Pinchart' <Laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



> -----Original Message-----
> From: dri-devel <dri-devel-bounces=40lists.freedesktop.org> On Behalf Of
> Michael Tretter
> Sent: Monday, September 4, 2023 8:15 PM
> To: Inki Dae <daeinki=40gmail.com>
> Cc: Neil Armstrong <neil.armstrong=40linaro.org>; Robert Foss
> <rfoss=40kernel.org>; Jonas Karlman <jonas=40kwiboo.se>; dri-
> devel=40lists.freedesktop.org; linux-kernel=40vger.kernel.org; Jernej Skr=
abec
> <jernej.skrabec=40gmail.com>; Laurent Pinchart
> <Laurent.pinchart=40ideasonboard.com>; Andrzej Hajda
> <andrzej.hajda=40intel.com>; Marek Szyprowski <m.szyprowski=40samsung.com=
>;
> kernel=40pengutronix.de; Jagan Teki <jagan=40amarulasolutions.com>
> Subject: Re: =5BPATCH 3/5=5D drm/bridge: samsung-dsim: update PLL referen=
ce
> clock
>=20
> On Mon, 04 Sep 2023 14:44:41 +0900, Inki Dae wrote:
> > 2023=EB=85=84=208=EC=9B=94=2029=EC=9D=BC=20(=ED=99=94)=20=EC=98=A4=EC=
=A0=84=2012:59,=20Michael=20Tretter=20<m.tretter=40pengutronix.de>=0D=0A>=
=20=EB=8B=98=EC=9D=B4=20=EC=9E=91=EC=84=B1:=0D=0A>=20>=20>=0D=0A>=20>=20>=
=20The=20PLL=20requires=20a=20clock=20between=202=20MHz=20and=2030=20MHz=20=
after=20the=20pre-=0D=0A>=20divider.=0D=0A>=20>=20>=20The=20reference=20clo=
ck=20for=20the=20PLL=20may=20change=20due=20to=20changes=20to=20it's=0D=0A>=
=20parent=0D=0A>=20>=20>=20clock.=20Thus,=20the=20frequency=20may=20be=20ou=
t=20of=20range=20or=20unsuited=20for=0D=0A>=20>=20>=20generating=20the=20hi=
gh=20speed=20clock=20for=20MIPI=20DSI.=0D=0A>=20>=20>=0D=0A>=20>=20>=20Try=
=20to=20keep=20the=20pre-devider=20small,=20and=20set=20the=20reference=20c=
lock=20close=0D=0A>=20to=0D=0A>=20>=20>=2030=20MHz=20before=20recalculating=
=20the=20PLL=20configuration.=20Use=20a=20divider=20with=0D=0A>=20a=0D=0A>=
=20>=20>=20power=20of=20two=20for=20the=20reference=20clock=20as=20this=20s=
eems=20to=20work=20best=20in=0D=0A>=20>=20>=20my=20tests.=0D=0A>=20>=0D=0A>=
=20>=20Clock=20frequency=20is=20specific=20to=20SoC=20architecture=20so=20w=
e=20have=20to=20handle=0D=0A>=20>=20it=20carefully=20because=20samsung-dsim=
.c=20is=20a=20common=20module=20for=20I.MX=20and=0D=0A>=20>=20Exynos=20seri=
es.=0D=0A>=20>=20You=20mentioned=20=22The=20PLL=20requires=20a=20clock=20be=
tween=202=20MHz=20and=203MHz=20after=0D=0A>=20>=20pre-divider=22,=20and=20t=
he=20clock=20means=20that=20fin_pll=20-=20PFD=20input=20frequency=20-=0D=0A=
>=20>=20which=20can=20be=20calculated=20with=20oscillator=20clock=20frequen=
cy=20/=20P=20value?=0D=0A>=20>=20According=20to=20Exynos=20datasheet,=20the=
=20fin_pll=20should=20be=206=20=7E=2012Mhz.=0D=0A>=20>=0D=0A>=20>=20For=20e=
xample,=0D=0A>=20>=20In=20case=20of=20Exyhos,=20we=20use=2024MHz=20as=20osc=
illator=20clock=20frequency,=20so=0D=0A>=20>=20fin_pll=20frequency,=208MHz=
=20=3D=2024MHz=20/=20P(3).=0D=0A>=20>=0D=0A>=20>=20Can=20you=20tell=20me=20=
the=20source=20of=20the=20constraint=20that=20clocks=20must=20be=0D=0A>=20>=
=20between=202MHz=20and=2030MHz?=0D=0A>=20=0D=0A>=20The=20source=20is=20the=
=20i.MX8M=20Nano=20reference=20manual,=20Table=2013-40.=20DPHY=20PLL=0D=0A>=
=20Parameters.=20It=20documents=20that=20the=20P=20divider=20frequency=20(f=
in_pll)=20has=20a=0D=0A>=20frequency=20range=20of=202=20MHz=20to=2030=20MHz=
.=20According=20to=20the=20same=20table,=20the=20input=0D=0A=0D=0AIn=20case=
=20of=20Exynos,=20the=20range=20is=20from=206MHz=20to=2012MHz=20according=
=20to=20Exynos4212=20reference=20manual,=20Table=201-5.=0D=0A=0D=0A>=20freq=
uency=20(fin)=20has=20a=20range=20of=206=20MHz=20to=20300=20MHz.=0D=0A=0D=
=0AIn=20case=20of=20Exynos,=20the=20range=20is=20from=206MHz=20to=20200MHz.=
=0D=0A=0D=0A>=20=0D=0A>=20Is=20the=20table=20incorrect?=0D=0A=0D=0AIt's=20c=
orrect=20for=20I.MX=20but=20incorrect=20for=20Exynos.=20I=20think=20it=20wo=
uld=20mean=20that=20the=20valid=20range=20depends=20on=20SoC=20architecture=
.=20So=20I'd=20say=20that=20this=20patch=20is=20specific=20to=20I.MX.=20Thi=
s=20was=20one=20of=20what=20I=20concerted=20about=20when=20trying=20to=20mo=
ve=20samsung-dsim.c=20module=20to=20bridge=20directory=20for=20common=20use=
=20between=20I.MX=20and=20Exynos=20Platforms,=20and=20this=20will=20be=20wh=
at=20we=20have=20to=20solve=20together=20-=20I.MX=20and=20Exynos=20engineer=
s.=20How=20about=20using=20platform=20specific=20data=20-=20samsung_dsim_dr=
iver_data=20structure?=0D=0A=0D=0AI.e,=0D=0A=0D=0Astatic=20const=20struct=
=20samsung_dsim_driver_data=20imx8mm_dsi_driver_data=20=3D=20=7B=0D=0A=20=
=20=20=20...=0D=0A=20=20=20=20.min_fin_pll=20=3D=202,=0D=0A=20=20=20=20.max=
_fin_pll=20=3D=2030,=0D=0A=20=20=20=20...=0D=0A=7D;=0D=0A=0D=0Astatic=20con=
st=20struct=20samsung_dsim_driver_data=20exynosxxxx_dsi_driver_data=20=3D=
=20=7B=0D=0A=20=20=20=20...=0D=0A=20=20=20=20.min_fin_pll=20=3D=206,=0D=0A=
=20=20=20=20.max_fin_pll=20=3D=2012,=0D=0A=20=20=20=20...=0D=0A=7D;=0D=0A=
=0D=0AAnd=20then,=0D=0A=0D=0Awhile=20(fin=20>=20driver_data->max_fin_pll=20=
*=20MHZ)=0D=0A=20=20=20=20fin=20=3D=20fin=20/=202;=0D=0A=0D=0A>=20=0D=0A>=
=20I=20also=20tried=20to=20always=20set=20the=20reference=20clock=20to=2024=
=20MHz,=20but=20depending=20on=0D=0A>=20the=0D=0A>=20display=20clock=20this=
=20isn't=20always=20possible.=0D=0A=0D=0AAccording=20to=20dt=20binding,=20i=
f=20samsung,pll-clock-frequency=20exists=20then=20we=20have=20to=20use=20it=
=20first.=20I'm=20not=20sure=20but=20could=20we=20check=20if=20the=20pll_cl=
k_rate=20is=20valid=20or=20not=20depending=20on=20the=20given=20display=20c=
lock=20in=20advance?=20If=20so=20then=20maybe=20we=20could=20update=20the=
=20pll_clk_rate=20correctly=20by=20reading=20the=20pll_clk=20frequency=20ag=
ain.=0D=0A=0D=0AThanks,=0D=0AInki=20Dae=0D=0A=0D=0A>=20=0D=0A>=20Michael=0D=
=0A>=20=0D=0A>=20>=0D=0A>=20>=20To=20other=20I.MX=20and=20Exynos=20engineer=
s,=20please=20do=20not=20merge=20this=20patch=0D=0A>=20>=20until=20two=20So=
C=20platforms=20are=20tested=20correctly.=0D=0A>=20>=0D=0A>=20>=20Thanks,=
=0D=0A>=20>=20Inki=20Dae=0D=0A>=20>=0D=0A>=20>=20>=0D=0A>=20>=20>=20Signed-=
off-by:=20Michael=20Tretter=20<m.tretter=40pengutronix.de>=0D=0A>=20>=20>=
=20---=0D=0A>=20>=20>=20=20drivers/gpu/drm/bridge/samsung-dsim.c=20=7C=2015=
=20+++++++++++++--=0D=0A>=20>=20>=20=201=20file=20changed,=2013=20insertion=
s(+),=202=20deletions(-)=0D=0A>=20>=20>=0D=0A>=20>=20>=20diff=20--git=20a/d=
rivers/gpu/drm/bridge/samsung-dsim.c=0D=0A>=20b/drivers/gpu/drm/bridge/sams=
ung-dsim.c=0D=0A>=20>=20>=20index=20da90c2038042..4de6e4f116db=20100644=0D=
=0A>=20>=20>=20---=20a/drivers/gpu/drm/bridge/samsung-dsim.c=0D=0A>=20>=20>=
=20+++=20b/drivers/gpu/drm/bridge/samsung-dsim.c=0D=0A>=20>=20>=20=40=40=20=
-611,10=20+611,21=20=40=40=20static=20unsigned=20long=20samsung_dsim_set_pl=
l(struct=0D=0A>=20samsung_dsim=20*dsi,=0D=0A>=20>=20>=20=20=20=20=20=20=20=
=20=20u16=20m;=0D=0A>=20>=20>=20=20=20=20=20=20=20=20=20u32=20reg;=0D=0A>=
=20>=20>=0D=0A>=20>=20>=20-=20=20=20=20=20=20=20if=20(dsi->pll_clk)=0D=0A>=
=20>=20>=20+=20=20=20=20=20=20=20if=20(dsi->pll_clk)=20=7B=0D=0A>=20>=20>=
=20+=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20/*=0D=0A>=20>=20>=20+=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20*=20Ensure=20that=20the=20refe=
rence=20clock=20is=20generated=20with=20a=0D=0A>=20power=20of=0D=0A>=20>=20=
>=20+=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20*=20two=20divider=20fr=
om=20its=20parent,=20but=20close=20to=20the=20PLLs=0D=0A>=20upper=0D=0A>=20=
>=20>=20+=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20*=20limit=20of=20t=
he=20valid=20range=20of=202=20MHz=20to=2030=20MHz.=0D=0A>=20>=20>=20+=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20*/=0D=0A>=20>=20>=20+=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20fin=20=3D=20clk_get_rate(clk_get_parent(ds=
i->pll_clk));=0D=0A>=20>=20>=20+=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20while=20(fin=20>=2030=20*=20MHZ)=0D=0A>=20>=20>=20+=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20fin=20=3D=20fin=20/=202;=0D=
=0A>=20>=20>=20+=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20clk_set_rate(d=
si->pll_clk,=20fin);=0D=0A>=20>=20>=20+=0D=0A>=20>=20>=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20fin=20=3D=20clk_get_rate(dsi->pll_clk);=0D=0A=
>=20>=20>=20-=20=20=20=20=20=20=20else=0D=0A>=20>=20>=20+=20=20=20=20=20=20=
=20=7D=20else=20=7B=0D=0A>=20>=20>=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20fin=20=3D=20dsi->pll_clk_rate;=0D=0A>=20>=20>=20+=20=20=20=20=
=20=20=20=7D=0D=0A>=20>=20>=20=20=20=20=20=20=20=20=20dev_dbg(dsi->dev,=20=
=22PLL=20ref=20clock=20freq=20%lu=5Cn=22,=20fin);=0D=0A>=20>=20>=0D=0A>=20>=
=20>=20=20=20=20=20=20=20=20=20fout=20=3D=20samsung_dsim_pll_find_pms(dsi,=
=20fin,=20freq,=20&p,=20&m,=20&s);=0D=0A>=20>=20>=0D=0A>=20>=20>=20--=0D=0A=
>=20>=20>=202.39.2=0D=0A>=20>=20>=0D=0A>=20>=0D=0A=0D=0A
