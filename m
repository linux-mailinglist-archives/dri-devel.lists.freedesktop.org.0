Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D6A1E7A4500
	for <lists+dri-devel@lfdr.de>; Mon, 18 Sep 2023 10:43:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 00A5510E1A1;
	Mon, 18 Sep 2023 08:43:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout3.samsung.com (mailout3.samsung.com [203.254.224.33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2483710E083
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Sep 2023 08:43:15 +0000 (UTC)
Received: from epcas1p2.samsung.com (unknown [182.195.41.46])
 by mailout3.samsung.com (KnoxPortal) with ESMTP id
 20230918084313epoutp03fd17b29df5d991007286644fa74f1811~F8bTdBebA2809028090epoutp03e
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Sep 2023 08:43:13 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com
 20230918084313epoutp03fd17b29df5d991007286644fa74f1811~F8bTdBebA2809028090epoutp03e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1695026593;
 bh=Mb9bGglKRsyVcgQ7ki2yiPUAzTTO8XQRTFwm5e8TNqc=;
 h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
 b=oyZ3c6Ea2HstbAn5prhc5zQqyQV+Hzb3gAoJPVAOrS99+Ml6x8k2iavM3aYiWmBHX
 a95pgCb/GrPhOQLhjgHd/k86Y4q9+s13q5xsu37IEsbVOV/LU9/bFhRmDEbWS3zBw2
 aD1PXdThxdfO+C01Q6MYW6Sh9fz7bCqh4+BDwSnc=
Received: from epsnrtp1.localdomain (unknown [182.195.42.162]) by
 epcas1p1.samsung.com (KnoxPortal) with ESMTP id
 20230918084313epcas1p17a9bf742524cbfbf82750fda3373025f~F8bS7LDpT0813608136epcas1p1y;
 Mon, 18 Sep 2023 08:43:13 +0000 (GMT)
Received: from epsmges1p5.samsung.com (unknown [182.195.36.133]) by
 epsnrtp1.localdomain (Postfix) with ESMTP id 4RpyxD0tJjz4x9QB; Mon, 18 Sep
 2023 08:43:12 +0000 (GMT)
Received: from epcas1p4.samsung.com ( [182.195.41.48]) by
 epsmges1p5.samsung.com (Symantec Messaging Gateway) with SMTP id
 D9.41.09567.F9D08056; Mon, 18 Sep 2023 17:43:12 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
 epcas1p3.samsung.com (KnoxPortal) with ESMTPA id
 20230918084311epcas1p39e0a88630968d140efab453ded49186f~F8bQ88iSN0377703777epcas1p3d;
 Mon, 18 Sep 2023 08:43:11 +0000 (GMT)
Received: from epsmgms1p2new.samsung.com (unknown [182.195.42.42]) by
 epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20230918084311epsmtrp11c2ad0ea8f607b37a9359910ab29fe4d~F8bQ3uzbu2138521385epsmtrp1L;
 Mon, 18 Sep 2023 08:43:11 +0000 (GMT)
X-AuditID: b6c32a39-955f97000000255f-a4-65080d9f03a7
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
 epsmgms1p2new.samsung.com (Symantec Messaging Gateway) with SMTP id
 01.22.08788.E9D08056; Mon, 18 Sep 2023 17:43:10 +0900 (KST)
Received: from inkidae001 (unknown [10.113.221.213]) by epsmtip1.samsung.com
 (KnoxPortal) with ESMTPA id
 20230918084310epsmtip13810d434e81f0566251df3696bbf66e8~F8bQl3ZDK2046420464epsmtip1e;
 Mon, 18 Sep 2023 08:43:10 +0000 (GMT)
From: =?UTF-8?B?64yA7J246riwL1RpemVuIFBsYXRmb3JtIExhYihTUikv7IK87ISx7KCE7J6Q?=
 <inki.dae@samsung.com>
To: "'Michael Tretter'" <m.tretter@pengutronix.de>
In-Reply-To: <20230908094758.GB767994@pengutronix.de>
Subject: RE: [PATCH 3/5] drm/bridge: samsung-dsim: update PLL reference clock
Date: Mon, 18 Sep 2023 17:42:57 +0900
Message-ID: <000001d9ea0c$27947c50$76bd74f0$@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQHTAiQ+eglt0lJc1nawqkA0YLlBTgFjoCjGAV05wlsB/C3hnwKY8tZ1A0Zlu/UBc4hLOK/NhXvw
Content-Language: ko
X-Brightmail-Tracker: H4sIAAAAAAAAA01TbUxTZxTm7b29LcySS2H4yibWOzcjA2wrhdsNZG5IbiJElm0mmhm4gWtL
 KG1tC5tGsy7bCB8OKIwBBRUnRdKEj6EiZSgONsSpWKDAMCAGYbOglA8lIc64losb/55zzvOc
 55z3g48IHVgQP11tYHRqWkVgPmhr9w5xWI2Az4irqhFy4vwSSk7n9yOk45kLI5+2FGPk32cb
 AXnz8RBKWstsKJlnquWRg+3VGNnw2ziPbK3v45Iu2z1AlpwZ5X4goBoWJriUzTzOo6pyK7nU
 +Q4nh2qx5mFUb/EAhxob7sCoiYIbHKrohZgqvGQF1FJLcNJrhzKilQydxuhEjDpVk5auVsQQ
 +z5J/ihZFimWhEnkZBQhUtOZTAwRl5AUFp+ucm9AiLJpVZY7lUTr9cTO3dE6TZaBESk1ekMM
 wWjTVFqZNlxPZ+qz1IpwNWN4TyIWS2VuYkqG0v71LUT7i+HLqdnLqBHUH80H3nyIR8Bzw51o
 PvDhC/E2AB+9aF4LFgGsaFtC2GAZwKXRGe4ryVCHc61wFcBCywLmKQhxJ4A/NMR7MIYr4HiB
 kePBAbgUjjT+zPNgBH+OQPPiGx7sjcvgS0vFKscf3w9NgzWIB6P42/B2UxnqwQJcDsf+6uax
 2A/erJxC2T7vwrpzswg7kAiuTNdxWa9DsGGxBGM5AbAqL2d1UIg/5sMLs3cBK4iDtnrrmtgf
 zty4xGNxEHQW5fBYQSmAYyP1KBtUANi9MrKm3gU7LaXusfluix2wqX0nm94Kbc9PA9bZF849
 O8X1UCAugLk5QpZCwJ7+P9e6QGivNWHFgDCv2828bjfzuh3M/5vVANQKAhmtPlPB6CVa2X/X
 narJbAGrzztE3gbKn8yHdwEOH3QByEeIAEGlBGOEgjT62HFGp0nWZakYfReQuU/bhAS9nqpx
 /w+1IVkSIRdHREp3RZCSSAmxUdD35Ps0Ia6gDUwGw2gZ3Ssdh+8dZORUj7yzueHwFfX1vRZH
 Y+LpW9u40BV3e3gwIVTTmRzRHJn41QPz9msm56Ye+X2X30nbfMI1y6Zo0U8LdZtLCyfDt9Q2
 fx5774J14Ozh7OkFe6dX4MbclL2BTvuxt35sM0sP3r94xd/12QPMy+F15/LVO6NbhkN+b1qO
 iv01Y8MGrvFuWev1L7KrCmqMpaWtM8RTWfX+mk9h+PvbD4S+zDCEdlhjpcRc8HJBygDvH3rS
 oTaecPXM5/oe+ObD3qiLvd8i8bpt7Q/32Y9UHxWdevMEtWL/rnwo5KGt/6S8j7CnxJC+RXOu
 no/3KA+OPZpchMGkX3xiydQfyt2g3Oe4ynhE4UhvI1C9kpaEIDo9/S8OPt3VZwQAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrHIsWRmVeSWpSXmKPExsWy7bCSnO48Xo5Ug5t7bCzuL/7MYvG06yKz
 xZWv79ksvmyawGbxfP46RouTb66yWKyaupPFonPiEnaLy7vmsFmsPXKX3WLbinOsFu933mK0
 mDTvJqsDr8faj/dZPXbOusvuMbtjJqvH4j0vmTw2repk8zgx4RKTx51re9g87ncfZ/Lo/2vg
 0bdlFaPH501yAdxRXDYpqTmZZalF+nYJXBmtE28wFXzxqXj88x9bA2O/VRcjJ4eEgInE1T0v
 mbsYuTiEBHYzSizcdgDI4QBKSEhs2coBYQpLHD5cDFHynFHi0dJ2dpBeNoFUiRufPoLZIgJG
 EtfXbWQHKWIWaGaR2PVpJyNExxRmiQMn1zKBVHEKmEr8XzoDzBYW8JXY+6sZrJtFQFXizPqp
 LCA2r4ClxJ1nh9khbEGJkzOfgMWZBbQleh+2MsLYyxa+Zob4QEHi59NlrBBXREms/TSJDaJG
 RGJ2ZxvzBEbhWUhGzUIyahaSUbOQtCxgZFnFKJlaUJybnltsWGCUl1quV5yYW1yal66XnJ+7
 iREcxVpaOxj3rPqgd4iRiYPxEKMEB7OSCO9MQ7ZUId6UxMqq1KL8+KLSnNTiQ4zSHCxK4rzf
 XvemCAmkJ5akZqemFqQWwWSZODilGpic/Isa2d/p/v/XY6NXzHMxpZE35+oLvkD5a8e/nv0Z
 WSn+1DTVecKx3JauZtOQqpLjudGTwqpleq6wZxy6GvZMuDTkquHZDu9PkXcEtP8v+WrIstv+
 j/bBQ8XXw5l/ScrkfV5x6UMQk+OKjnmnBR9Zdk69svJcf8fTNWkh18+Lc00O8tjArRV7Oanr
 leiEnY+9z4bGb/+sP+F4Vvzcz56H5W6XTdx5mP9yGWuOfNbNDBmdRReOcDw+9F/nvLjmuQx+
 NYPz+1sc8gN6d6/r9rDv3JAUlb3k7e+/R5PXGqap+uX38jxgn+nbNlGufN/VnS9OJLF92GZV
 9LZeTcA/wdx1N5fo14vnD/9OXrOXPUqJpTgj0VCLuag4EQDh/F2KUQMAAA==
X-CMS-MailID: 20230918084311epcas1p39e0a88630968d140efab453ded49186f
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
 <001001d9dfd8$3444bbb0$9cce3310$@samsung.com>
 <20230908094758.GB767994@pengutronix.de>
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
 'Robert Foss' <rfoss@kernel.org>, kernel@pengutronix.de, 'Jonas
 Karlman' <jonas@kwiboo.se>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, 'Jagan Teki' <jagan@amarulasolutions.com>,
 'Jernej Skrabec' <jernej.skrabec@gmail.com>,
 'Andrzej Hajda' <andrzej.hajda@intel.com>,
 'Marek Szyprowski' <m.szyprowski@samsung.com>,
 'Laurent Pinchart' <Laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



> -----Original Message-----
> From: Michael Tretter <m.tretter=40pengutronix.de>
> Sent: Friday, September 8, 2023 6:48 PM
> To: =EB=8C=80=EC=9D=B8=EA=B8=B0/Tizen=20Platform=20Lab(SR)/=EC=82=BC=EC=
=84=B1=EC=A0=84=EC=9E=90=20<inki.dae=40samsung.com>=0D=0A>=20Cc:=20'Inki=20=
Dae'=20<daeinki=40gmail.com>;=20'Neil=20Armstrong'=0D=0A>=20<neil.armstrong=
=40linaro.org>;=20'Robert=20Foss'=20<rfoss=40kernel.org>;=20'Jonas=0D=0A>=
=20Karlman'=20<jonas=40kwiboo.se>;=20dri-devel=40lists.freedesktop.org;=20l=
inux-=0D=0A>=20kernel=40vger.kernel.org;=20'Jernej=20Skrabec'=20<jernej.skr=
abec=40gmail.com>;=0D=0A>=20'Laurent=20Pinchart'=20<Laurent.pinchart=40idea=
sonboard.com>;=20'Andrzej=20Hajda'=0D=0A>=20<andrzej.hajda=40intel.com>;=20=
'Marek=20Szyprowski'=20<m.szyprowski=40samsung.com>;=0D=0A>=20kernel=40peng=
utronix.de;=20'Jagan=20Teki'=20<jagan=40amarulasolutions.com>=0D=0A>=20Subj=
ect:=20Re:=20=5BPATCH=203/5=5D=20drm/bridge:=20samsung-dsim:=20update=20PLL=
=20reference=0D=0A>=20clock=0D=0A>=20=0D=0A>=20On=20Tue,=2005=20Sep=202023=
=2018:06:06=20+0900,=20=EB=8C=80=EC=9D=B8=EA=B8=B0/Tizen=20Platform=20Lab(S=
R)/=EC=82=BC=EC=84=B1=EC=A0=84=EC=9E=90=0D=0A>=20wrote:=0D=0A>=20>=0D=0A>=
=20>=0D=0A>=20>=20>=20-----Original=20Message-----=0D=0A>=20>=20>=20From:=
=20dri-devel=20<dri-devel-bounces=40lists.freedesktop.org>=20On=20Behalf=20=
Of=0D=0A>=20>=20>=20Michael=20Tretter=0D=0A>=20>=20>=20Sent:=20Monday,=20Se=
ptember=204,=202023=208:15=20PM=0D=0A>=20>=20>=20To:=20Inki=20Dae=20<daeink=
i=40gmail.com>=0D=0A>=20>=20>=20Cc:=20Neil=20Armstrong=20<neil.armstrong=40=
linaro.org>;=20Robert=20Foss=0D=0A>=20>=20>=20<rfoss=40kernel.org>;=20Jonas=
=20Karlman=20<jonas=40kwiboo.se>;=20dri-=0D=0A>=20>=20>=20devel=40lists.fre=
edesktop.org;=20linux-kernel=40vger.kernel.org;=20Jernej=0D=0A>=20Skrabec=
=0D=0A>=20>=20>=20<jernej.skrabec=40gmail.com>;=20Laurent=20Pinchart=0D=0A>=
=20>=20>=20<Laurent.pinchart=40ideasonboard.com>;=20Andrzej=20Hajda=0D=0A>=
=20>=20>=20<andrzej.hajda=40intel.com>;=20Marek=20Szyprowski=20<m.szyprowsk=
i=40samsung.com>;=0D=0A>=20>=20>=20kernel=40pengutronix.de;=20Jagan=20Teki=
=20<jagan=40amarulasolutions.com>=0D=0A>=20>=20>=20Subject:=20Re:=20=5BPATC=
H=203/5=5D=20drm/bridge:=20samsung-dsim:=20update=20PLL=0D=0A>=20reference=
=0D=0A>=20>=20>=20clock=0D=0A>=20>=20>=0D=0A>=20>=20>=20On=20Mon,=2004=20Se=
p=202023=2014:44:41=20+0900,=20Inki=20Dae=20wrote:=0D=0A>=20>=20>=20>=20202=
3=EB=85=84=208=EC=9B=94=2029=EC=9D=BC=20(=ED=99=94)=20=EC=98=A4=EC=A0=84=20=
12:59,=20Michael=20Tretter=0D=0A>=20<m.tretter=40pengutronix.de>=0D=0A>=20>=
=20>=20=EB=8B=98=EC=9D=B4=20=EC=9E=91=EC=84=B1:=0D=0A>=20>=20>=20>=20>=0D=
=0A>=20>=20>=20>=20>=20The=20PLL=20requires=20a=20clock=20between=202=20MHz=
=20and=2030=20MHz=20after=20the=20pre-=0D=0A>=20>=20>=20divider.=0D=0A>=20>=
=20>=20>=20>=20The=20reference=20clock=20for=20the=20PLL=20may=20change=20d=
ue=20to=20changes=20to=20it's=0D=0A>=20>=20>=20parent=0D=0A>=20>=20>=20>=20=
>=20clock.=20Thus,=20the=20frequency=20may=20be=20out=20of=20range=20or=20u=
nsuited=20for=0D=0A>=20>=20>=20>=20>=20generating=20the=20high=20speed=20cl=
ock=20for=20MIPI=20DSI.=0D=0A>=20>=20>=20>=20>=0D=0A>=20>=20>=20>=20>=20Try=
=20to=20keep=20the=20pre-devider=20small,=20and=20set=20the=20reference=20c=
lock=0D=0A>=20close=0D=0A>=20>=20>=20to=0D=0A>=20>=20>=20>=20>=2030=20MHz=
=20before=20recalculating=20the=20PLL=20configuration.=20Use=20a=20divider=
=0D=0A>=20with=0D=0A>=20>=20>=20a=0D=0A>=20>=20>=20>=20>=20power=20of=20two=
=20for=20the=20reference=20clock=20as=20this=20seems=20to=20work=20best=20i=
n=0D=0A>=20>=20>=20>=20>=20my=20tests.=0D=0A>=20>=20>=20>=0D=0A>=20>=20>=20=
>=20Clock=20frequency=20is=20specific=20to=20SoC=20architecture=20so=20we=
=20have=20to=20handle=0D=0A>=20>=20>=20>=20it=20carefully=20because=20samsu=
ng-dsim.c=20is=20a=20common=20module=20for=20I.MX=20and=0D=0A>=20>=20>=20>=
=20Exynos=20series.=0D=0A>=20>=20>=20>=20You=20mentioned=20=22The=20PLL=20r=
equires=20a=20clock=20between=202=20MHz=20and=203MHz=20after=0D=0A>=20>=20>=
=20>=20pre-divider=22,=20and=20the=20clock=20means=20that=20fin_pll=20-=20P=
FD=20input=20frequency=0D=0A>=20-=0D=0A>=20>=20>=20>=20which=20can=20be=20c=
alculated=20with=20oscillator=20clock=20frequency=20/=20P=20value?=0D=0A>=
=20>=20>=20>=20According=20to=20Exynos=20datasheet,=20the=20fin_pll=20shoul=
d=20be=206=20=7E=2012Mhz.=0D=0A>=20>=20>=20>=0D=0A>=20>=20>=20>=20For=20exa=
mple,=0D=0A>=20>=20>=20>=20In=20case=20of=20Exyhos,=20we=20use=2024MHz=20as=
=20oscillator=20clock=20frequency,=20so=0D=0A>=20>=20>=20>=20fin_pll=20freq=
uency,=208MHz=20=3D=2024MHz=20/=20P(3).=0D=0A>=20>=20>=20>=0D=0A>=20>=20>=
=20>=20Can=20you=20tell=20me=20the=20source=20of=20the=20constraint=20that=
=20clocks=20must=20be=0D=0A>=20>=20>=20>=20between=202MHz=20and=2030MHz?=0D=
=0A>=20>=20>=0D=0A>=20>=20>=20The=20source=20is=20the=20i.MX8M=20Nano=20ref=
erence=20manual,=20Table=2013-40.=20DPHY=20PLL=0D=0A>=20>=20>=20Parameters.=
=20It=20documents=20that=20the=20P=20divider=20frequency=20(fin_pll)=20has=
=20a=0D=0A>=20>=20>=20frequency=20range=20of=202=20MHz=20to=2030=20MHz.=20A=
ccording=20to=20the=20same=20table,=20the=0D=0A>=20input=0D=0A>=20=0D=0A>=
=20Small=20clarification:=20These=20are=20the=20corrected=20limits=20of=20T=
RM=20rev.=201.=20In=20TRM=0D=0A>=20rev.=0D=0A>=200=20the=20limits=20are=20i=
ncorrectly=20specified=20as=206=20MHz=20to=2012=20MHz.=0D=0A>=20=0D=0A>=20>=
=0D=0A>=20>=20In=20case=20of=20Exynos,=20the=20range=20is=20from=206MHz=20t=
o=2012MHz=20according=20to=0D=0A>=20Exynos4212=20reference=20manual,=20Tabl=
e=201-5.=0D=0A>=20>=0D=0A>=20>=20>=20frequency=20(fin)=20has=20a=20range=20=
of=206=20MHz=20to=20300=20MHz.=0D=0A>=20>=0D=0A>=20>=20In=20case=20of=20Exy=
nos,=20the=20range=20is=20from=206MHz=20to=20200MHz.=0D=0A>=20>=0D=0A>=20>=
=20>=0D=0A>=20>=20>=20Is=20the=20table=20incorrect?=0D=0A>=20>=0D=0A>=20=0D=
=0A>=20>=20It's=20correct=20for=20I.MX=20but=20incorrect=20for=20Exynos.=20=
I=20think=20it=20would=20mean=0D=0A>=20that=0D=0A>=20>=20the=20valid=20rang=
e=20depends=20on=20SoC=20architecture.=20So=20I'd=20say=20that=20this=20pat=
ch=0D=0A>=20is=0D=0A>=20>=20specific=20to=20I.MX.=0D=0A>=20=0D=0A>=20I=20un=
derstand.=0D=0A>=20=0D=0A>=20>=20This=20was=20one=20of=20what=20I=20concert=
ed=20about=20when=20trying=20to=20move=0D=0A>=20>=20samsung-dsim.c=20module=
=20to=20bridge=20directory=20for=20common=20use=20between=20I.MX=0D=0A>=20a=
nd=0D=0A>=20>=20Exynos=20Platforms,=20and=20this=20will=20be=20what=20we=20=
have=20to=20solve=20together=20-=20I.MX=0D=0A>=20and=0D=0A>=20>=20Exynos=20=
engineers.=20How=20about=20using=20platform=20specific=20data=20-=0D=0A>=20=
>=20samsung_dsim_driver_data=20structure?=0D=0A>=20>=0D=0A>=20>=20I.e,=0D=
=0A>=20>=0D=0A>=20>=20static=20const=20struct=20samsung_dsim_driver_data=20=
imx8mm_dsi_driver_data=20=3D=20=7B=0D=0A>=20>=20=20=20=20=20...=0D=0A>=20>=
=20=20=20=20=20.min_fin_pll=20=3D=202,=0D=0A>=20>=20=20=20=20=20.max_fin_pl=
l=20=3D=2030,=0D=0A>=20>=20=20=20=20=20...=0D=0A>=20>=20=7D;=0D=0A>=20>=0D=
=0A>=20>=20static=20const=20struct=20samsung_dsim_driver_data=20exynosxxxx_=
dsi_driver_data=0D=0A>=20=3D=20=7B=0D=0A>=20>=20=20=20=20=20...=0D=0A>=20>=
=20=20=20=20=20.min_fin_pll=20=3D=206,=0D=0A>=20>=20=20=20=20=20.max_fin_pl=
l=20=3D=2012,=0D=0A>=20>=20=20=20=20=20...=0D=0A>=20>=20=7D;=0D=0A>=20=0D=
=0A>=20Extending=20the=20samsung_dsim_driver_data=20sounds=20reasonable.=20=
There=20are=0D=0A>=20already=0D=0A>=20other=20frequency=20limits=20specifie=
d.=20I=20will=20implement=20this=20in=20v2.=0D=0A>=20=0D=0A>=20>=0D=0A>=20>=
=20And=20then,=0D=0A>=20>=0D=0A>=20>=20while=20(fin=20>=20driver_data->max_=
fin_pll=20*=20MHZ)=0D=0A>=20>=20=20=20=20=20fin=20=3D=20fin=20/=202;=0D=0A>=
=20>=0D=0A>=20>=20>=0D=0A>=20>=20>=20I=20also=20tried=20to=20always=20set=
=20the=20reference=20clock=20to=2024=20MHz,=20but=0D=0A>=20depending=20on=
=0D=0A>=20>=20>=20the=0D=0A>=20>=20>=20display=20clock=20this=20isn't=20alw=
ays=20possible.=0D=0A>=20>=0D=0A>=20=0D=0A>=20>=20According=20to=20dt=20bin=
ding,=20if=20samsung,pll-clock-frequency=20exists=20then=20we=0D=0A>=20have=
=0D=0A>=20>=20to=20use=20it=20first.=20I'm=20not=20sure=20but=20could=20we=
=20check=20if=20the=20pll_clk_rate=20is=0D=0A>=20>=20valid=20or=20not=20dep=
ending=20on=20the=20given=20display=20clock=20in=20advance?=20If=20so=20the=
n=0D=0A>=20>=20maybe=20we=20could=20update=20the=20pll_clk_rate=20correctly=
=20by=20reading=20the=20pll_clk=0D=0A>=20>=20frequency=20again.=0D=0A>=20=
=0D=0A>=20If=20samsung,pll-clock-frequency=20is=20set,=20the=20driver=20wil=
l=20neither=20check=20nor=0D=0A>=20update=20the=20pll_clk,=20but=20assume=
=20that=20the=20clocks=20are=20configured=20correctly.=0D=0A>=20Thus,=0D=0A=
>=20the=20author=20of=20the=20device=20tree=20is=20responsible=20for=20sele=
cting=20and=20configuring=0D=0A>=20valid=20clocks.=0D=0A>=20=0D=0A>=20I=20o=
bserved=20that=20if=20I=20set=20pll_clk=20to=20any=20fixed=20value=20for=20=
different=20modes,=0D=0A>=20the=0D=0A>=20clock=20framework=20may=20use=20a=
=20different=20clock=20rate=20depending=20on=20what=20is=0D=0A>=20possible.=
=0D=0A>=20This=20may=20result=20in=20a=20reference=20clock=20that=20uses=20=
a=20fractional=20divider=20to=20get=0D=0A>=20the=0D=0A>=20pll_clk_rate=20or=
=20cannot=20exactly=20produce=20the=20hs_clock.=20These=20situations=0D=0A>=
=20cause=0D=0A>=20sync=20issues=20on=20the=20display.=0D=0A=0D=0AYes,=20it=
=20does.=20The=20actual=20clock=20can=20vary=20according=20to=20clock=20con=
figuration=20-=20which=20child=20clocks=20are=20used=20and=20divider=20valu=
es=20of=20the=20clock=20sources=20-=20of=20the=20pll_clk=20source.=20It=20w=
ould=20mean=20that=20the=20clock=20configuration=20depends=20on=20the=20mac=
hine,=20not=20the=20SoC,=20because=20the=20display=20panel=20may=20vary=20d=
epending=20on=20the=20machine.=0D=0A=0D=0AIn=20my=20opinion,=20a=20role=20o=
f=20the=20device=20driver=20would=20be=20to=20configure=20the=20clock=20sou=
rces=20properly,=20such=20as=20the=20current=20driver=20does,=20and=20we=20=
may=20need=20to=20find=20a=20proper=20divider=20value=20of=20each=20clock=
=20source=20and=20set=20it=20in=20the=20respective=20machine=20device=20tre=
e=20so=20that=20the=20actual=20clock=20frequency=20can=20be=20close=20to=20=
the=20given=20pixel=20clock=20frequency=20provided=20by=20the=20machine=20d=
evice=20tree=20as=20=22samsung,pll-clock-frequency=22.=0D=0A=0D=0AAs=20a=20=
result,=20even=20if=20the=20type=20of=20display=20attached=20to=20the=20mac=
hine=20varies=20I=20think=20the=20clock=20configuration=20method=20in=20the=
=20device=20driver=20code=20should=20not=20change.=0D=0A=0D=0AThanks,=0D=0A=
Inki=20Dae=0D=0A=0D=0A>=20=0D=0A>=20Checking,=20if=20the=20current=20pll_cl=
k_rate=20would=20involve=20the=20pix_clk,=20the=0D=0A>=20hs_clock,=0D=0A>=
=20and=20the=20parent=20of=20the=20pll_clk.=20It=20may=20be=20possible,=20b=
ut=20I=20don't=20see=20a=0D=0A>=20problem=0D=0A>=20with=20calculating=20a=
=20suitable=20pll_clk_rate,=20updating=20the=20pll_clk,=20and=20then=0D=0A>=
=20configuring=20the=20PLL=20to=20generate=20the=20hs_clock.=0D=0A>=20=0D=
=0A>=20Michael=0D=0A>=20=0D=0A>=20>=0D=0A>=20>=20Thanks,=0D=0A>=20>=20Inki=
=20Dae=0D=0A>=20>=0D=0A>=20>=20>=0D=0A>=20>=20>=20Michael=0D=0A>=20>=20>=0D=
=0A>=20>=20>=20>=0D=0A>=20>=20>=20>=20To=20other=20I.MX=20and=20Exynos=20en=
gineers,=20please=20do=20not=20merge=20this=20patch=0D=0A>=20>=20>=20>=20un=
til=20two=20SoC=20platforms=20are=20tested=20correctly.=0D=0A>=20>=20>=20>=
=0D=0A>=20>=20>=20>=20Thanks,=0D=0A>=20>=20>=20>=20Inki=20Dae=0D=0A>=20>=20=
>=20>=0D=0A>=20>=20>=20>=20>=0D=0A>=20>=20>=20>=20>=20Signed-off-by:=20Mich=
ael=20Tretter=20<m.tretter=40pengutronix.de>=0D=0A>=20>=20>=20>=20>=20---=
=0D=0A>=20>=20>=20>=20>=20=20drivers/gpu/drm/bridge/samsung-dsim.c=20=7C=20=
15=20+++++++++++++--=0D=0A>=20>=20>=20>=20>=20=201=20file=20changed,=2013=
=20insertions(+),=202=20deletions(-)=0D=0A>=20>=20>=20>=20>=0D=0A>=20>=20>=
=20>=20>=20diff=20--git=20a/drivers/gpu/drm/bridge/samsung-dsim.c=0D=0A>=20=
>=20>=20b/drivers/gpu/drm/bridge/samsung-dsim.c=0D=0A>=20>=20>=20>=20>=20in=
dex=20da90c2038042..4de6e4f116db=20100644=0D=0A>=20>=20>=20>=20>=20---=20a/=
drivers/gpu/drm/bridge/samsung-dsim.c=0D=0A>=20>=20>=20>=20>=20+++=20b/driv=
ers/gpu/drm/bridge/samsung-dsim.c=0D=0A>=20>=20>=20>=20>=20=40=40=20-611,10=
=20+611,21=20=40=40=20static=20unsigned=20long=0D=0A>=20samsung_dsim_set_pl=
l(struct=0D=0A>=20>=20>=20samsung_dsim=20*dsi,=0D=0A>=20>=20>=20>=20>=20=20=
=20=20=20=20=20=20=20u16=20m;=0D=0A>=20>=20>=20>=20>=20=20=20=20=20=20=20=
=20=20u32=20reg;=0D=0A>=20>=20>=20>=20>=0D=0A>=20>=20>=20>=20>=20-=20=20=20=
=20=20=20=20if=20(dsi->pll_clk)=0D=0A>=20>=20>=20>=20>=20+=20=20=20=20=20=
=20=20if=20(dsi->pll_clk)=20=7B=0D=0A>=20>=20>=20>=20>=20+=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20/*=0D=0A>=20>=20>=20>=20>=20+=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20*=20Ensure=20that=20the=20reference=20cloc=
k=20is=20generated=20with=20a=0D=0A>=20>=20>=20power=20of=0D=0A>=20>=20>=20=
>=20>=20+=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20*=20two=20divider=
=20from=20its=20parent,=20but=20close=20to=20the=20PLLs=0D=0A>=20>=20>=20up=
per=0D=0A>=20>=20>=20>=20>=20+=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20*=20limit=20of=20the=20valid=20range=20of=202=20MHz=20to=2030=20MHz.=0D=
=0A>=20>=20>=20>=20>=20+=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20*/=
=0D=0A>=20>=20>=20>=20>=20+=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20fin=
=20=3D=20clk_get_rate(clk_get_parent(dsi->pll_clk));=0D=0A>=20>=20>=20>=20>=
=20+=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20while=20(fin=20>=2030=20*=
=20MHZ)=0D=0A>=20>=20>=20>=20>=20+=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20fin=20=3D=20fin=20/=202;=0D=0A>=20>=20>=20>=
=20>=20+=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20clk_set_rate(dsi->pll_=
clk,=20fin);=0D=0A>=20>=20>=20>=20>=20+=0D=0A>=20>=20>=20>=20>=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20fin=20=3D=20clk_get_rate(dsi->pll_cl=
k);=0D=0A>=20>=20>=20>=20>=20-=20=20=20=20=20=20=20else=0D=0A>=20>=20>=20>=
=20>=20+=20=20=20=20=20=20=20=7D=20else=20=7B=0D=0A>=20>=20>=20>=20>=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20fin=20=3D=20dsi->pll_clk_rate;=
=0D=0A>=20>=20>=20>=20>=20+=20=20=20=20=20=20=20=7D=0D=0A>=20>=20>=20>=20>=
=20=20=20=20=20=20=20=20=20dev_dbg(dsi->dev,=20=22PLL=20ref=20clock=20freq=
=20%lu=5Cn=22,=20fin);=0D=0A>=20>=20>=20>=20>=0D=0A>=20>=20>=20>=20>=20=20=
=20=20=20=20=20=20=20fout=20=3D=20samsung_dsim_pll_find_pms(dsi,=20fin,=20f=
req,=20&p,=20&m,=20&s);=0D=0A>=20>=20>=20>=20>=0D=0A>=20>=20>=20>=20>=20--=
=0D=0A>=20>=20>=20>=20>=202.39.2=0D=0A>=20>=20>=20>=20>=0D=0A>=20>=20>=20>=
=0D=0A>=20>=0D=0A>=20>=0D=0A>=20>=0D=0A=0D=0A
