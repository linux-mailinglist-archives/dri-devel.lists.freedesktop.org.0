Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A5DFF807E9E
	for <lists+dri-devel@lfdr.de>; Thu,  7 Dec 2023 03:37:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E543210E17E;
	Thu,  7 Dec 2023 02:37:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout2.samsung.com (mailout2.samsung.com [203.254.224.25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C56F10E17E
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Dec 2023 02:37:50 +0000 (UTC)
Received: from epcas1p3.samsung.com (unknown [182.195.41.47])
 by mailout2.samsung.com (KnoxPortal) with ESMTP id
 20231207023748epoutp023b882249cc7151eaa6e1cd5260bf2302~ebDFJgspm0523605236epoutp02j
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Dec 2023 02:37:48 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com
 20231207023748epoutp023b882249cc7151eaa6e1cd5260bf2302~ebDFJgspm0523605236epoutp02j
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1701916668;
 bh=f7sCj3XqY11lkuEgwwgaZHokuEpzZ+mJuFoqP0hN7Og=;
 h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
 b=JQwQYsJl5w3WTukO4gzv3BKC5iPziYbN/eJ4FK19kz0DPaTN5wJr4m7uCIpiE40iV
 JdKfAnUmi/T9WYW9rWGFIzPnLRiaDeuUA4UPo5FAP/nCZF83O+gHmBm2tKHhStQguP
 6CENZo/JMjuLDK8/1P6kX2XCheDAFFn9IC0mUqtw=
Received: from epsnrtp2.localdomain (unknown [182.195.42.163]) by
 epcas1p2.samsung.com (KnoxPortal) with ESMTP id
 20231207023747epcas1p28eac7a3b6daeb9361d8f326b1ab7a4b8~ebDEmDXIn0621106211epcas1p2X;
 Thu,  7 Dec 2023 02:37:47 +0000 (GMT)
Received: from epsmges1p4.samsung.com (unknown [182.195.38.234]) by
 epsnrtp2.localdomain (Postfix) with ESMTP id 4Slz2f4Bdwz4x9QB; Thu,  7 Dec
 2023 02:37:46 +0000 (GMT)
Received: from epcas1p2.samsung.com ( [182.195.41.46]) by
 epsmges1p4.samsung.com (Symantec Messaging Gateway) with SMTP id
 B0.21.10211.AFF21756; Thu,  7 Dec 2023 11:37:46 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
 epcas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20231207023745epcas1p1801b9977ace0050def0369e817c50a67~ebDCw_GkP0362503625epcas1p1K;
 Thu,  7 Dec 2023 02:37:45 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
 epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20231207023745epsmtrp1af02390c5c87e2ae9efb360797b53c36~ebDCwPr3g1621716217epsmtrp1b;
 Thu,  7 Dec 2023 02:37:45 +0000 (GMT)
X-AuditID: b6c32a38-463ff700000027e3-26-65712ffa05a9
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
 epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
 F6.68.08755.9FF21756; Thu,  7 Dec 2023 11:37:45 +0900 (KST)
Received: from inkidae001 (unknown [10.113.221.213]) by epsmtip1.samsung.com
 (KnoxPortal) with ESMTPA id
 20231207023745epsmtip1ff9e3832d63cedbba717215195ff6de4~ebDCZtNBk3206032060epsmtip1r;
 Thu,  7 Dec 2023 02:37:45 +0000 (GMT)
From: =?UTF-8?B?64yA7J246riwL1RpemVuIFBsYXRmb3JtIExhYihTUikv7IK87ISx7KCE7J6Q?=
 <inki.dae@samsung.com>
To: =?UTF-8?Q?'Uwe_Kleine-K=C3=B6nig'?= <u.kleine-koenig@pengutronix.de>,
 "'Inki Dae'" <daeinki@gmail.com>
In-Reply-To: <20231128165505.wm4xs4ktycswthkt@pengutronix.de>
Subject: RE: [PATCH v3 08/16] drm/exynos: Convert to platform remove
 callback returning void
Date: Thu, 7 Dec 2023 11:37:44 +0900
Message-ID: <048901da28b6$5be8e700$13bab500$@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Content-Language: ko
Thread-Index: AQJLv750adbxiFum9lJy8ksO1H5K3QKZ/J94ArytniAB/cGOFwI3DJClAQidVSevZUm78A==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrKJsWRmVeSWpSXmKPExsWy7bCmnu4v/cJUg3XTFC1OXF/EZPFg3jY2
 i6ddF5kt/m+byGxx5et7NosVX2ayW6yaupPFYu/rrewWZ5vesFtsenyN1WLG+X1MFjMmv2Sz
 uD1xMqMDr8febwtYPHbOusvucefaHjaP+93HmTw2L6n36P9r4NG3ZRWjx+dNcgEcUdk2GamJ
 KalFCql5yfkpmXnptkrewfHO8aZmBoa6hpYW5koKeYm5qbZKLj4Bum6ZOUAXKymUJeaUAoUC
 EouLlfTtbIryS0tSFTLyi0tslVILUnIKTAv0ihNzi0vz0vXyUkusDA0MjEyBChOyM/ouTWIq
 OCZV8W3lZJYGxjeSXYycHBICJhLPf99i7WLk4hAS2MEocfXFcSjnE6PE/gkzmCCcb4wStx+f
 ZYFp2XVgKhtEYi+jxN2eyVDOS0aJGQfusIJUsQmkS9ztbmACsUUEciR6Tz9kASliFrjHLPH3
 92+wIk4BW4nbG2cyg9jCAnESNz//AFvBIqAicaFpF1gzr4ClxN/py1ggbEGJkzOfgNnMAtoS
 yxa+ZoY4SUHi59NlrBBxEYnZnW3MEIvDJHY3L4CqucEhMeNDHoTtIrFh0z1WCFtY4tXxLewQ
 tpTEy/42dpBDJQQmM0rcub6CBcKZwShx+Od1RogqY4n9SycDXccBtE1TYv0ufYiwosTO33MZ
 IY7gk3j3tYcVpERCgFeio00IokRJ4tjFG1BTJCQuLJnINoFRaRaS12YheW0WkndmISxbwMiy
 ilEstaA4Nz212LDABB7fyfm5mxjB6VnLYgfj3Lcf9A4xMnEwHmKU4GBWEuHNOZ+fKsSbklhZ
 lVqUH19UmpNafIjRFBjYE5mlRJPzgRkiryTe0MTSwMTMyNjEwtDMUEmc99ir3hQhgfTEktTs
 1NSC1CKYPiYOTqkGJpFdOptuJ0uuOHhTRdPv2skX+/7KrRCQzUtm8A/9lcm74eyar9nmGz64
 ZyunHvtc8pp7TmXF0mMPcxxdL1odv10Z9bVcZ0N9+rpqxpXTmj52Cm/Z/PpFVqOuTT/r+WOf
 2k0WcTDZeygmn7rHMr1fTHZZsIoXx4Hds18xa+wP7533nms9S+X0v8VmAcWeWTVFLJ3l2icO
 hm62q7XwWJgbfC5IdvUZhqecV4QkPZznqc1l8wkLSHrFJpC1ya+1Zd2lpN2eNxttjwoUxvzd
 WLD7bI/knrk9JqcUuNJ6vwdPf/B3Zahzub3aIsbVTrPaW+4wMWTPKMt+FKY2yb2h3yvJ9qsA
 Y+mhU3nPGtpY1CqUWIozEg21mIuKEwEjgMZoWAQAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrLIsWRmVeSWpSXmKPExsWy7bCSnO5P/cJUg+lrJCxOXF/EZPFg3jY2
 i6ddF5kt/m+byGxx5et7NosVX2ayW6yaupPFYu/rrewWZ5vesFtsenyN1WLG+X1MFjMmv2Sz
 uD1xMqMDr8febwtYPHbOusvucefaHjaP+93HmTw2L6n36P9r4NG3ZRWjx+dNcgEcUVw2Kak5
 mWWpRfp2CVwZNxtnsxS8FqrYOK+dtYFxPn8XIyeHhICJxK4DU9m6GLk4hAR2M0o8WPcIyOEA
 SkhIbNnKAWEKSxw+XAxR8pxR4umPbkaQXjaBVIkbnz6yg9giAjkSvacfsoAUMQs8Y5Z4vvo8
 E0hCSOAXk8SxHTkgNqeArcTtjTOZQWxhgRiJoysOg9ksAioSF5p2gdXzClhK/J2+jAXCFpQ4
 OfMJmM0soC3R+7CVEcZetvA1M8QDChI/ny5jhYiLSMzubGOGOChMYnfzAuYJjMKzkIyahWTU
 LCSjZiFpX8DIsopRMrWgODc9t9iwwDAvtVyvODG3uDQvXS85P3cTIzhGtTR3MG5f9UHvECMT
 B+MhRgkOZiUR3pzz+alCvCmJlVWpRfnxRaU5qcWHGKU5WJTEecVf9KYICaQnlqRmp6YWpBbB
 ZJk4OKUamEw1Z6W82D4p3Vuz843M2dAIzm3KEScqbNz+qu9PEnLNUvgReO7ilDMrN8nkMC70
 Z/I7uGvVxolFS5huPu5v3SnGH+leYPh5/fbVu6okF5lE3jkopyQdx3r/8NKV64+vafyUVCgx
 WV10UapMxT+tzVcSLs8rk5dZzjKvXeDV70/2a83/8c7bJpFuVLNZoPK85s1sDmcLw/QH6mel
 TF9cmH28Vl794vL6vYxbDAzb217OFI7j6lurqn+r4rRsb4vZsbMtv9+2Hn1+97mnldO2E6bF
 hz7U73jv/+hKe9aNs5/O+dVP0/l4uTeB9cLHsKk2X+7PmeZpqfXR9d9bxbO6zFJqlh1zZ3x7
 U/kkX++WbLMSS3FGoqEWc1FxIgBQfoz+QAMAAA==
X-CMS-MailID: 20231207023745epcas1p1801b9977ace0050def0369e817c50a67
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: SVC_REQ_APPROVE
CMS-TYPE: 101P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20231128165521epcas1p4993f7d2fab0723130a4612d810d254f8
References: <20231102165640.3307820-18-u.kleine-koenig@pengutronix.de>
 <20231102165640.3307820-26-u.kleine-koenig@pengutronix.de>
 <CAAQKjZOnVSaO6QHpSo_i=WgTaawTq0UFtzwTw8kQ5iHN4qiAtQ@mail.gmail.com>
 <20231108075454.3aivzrbvtr4en22e@pengutronix.de>
 <CGME20231128165521epcas1p4993f7d2fab0723130a4612d810d254f8@epcas1p4.samsung.com>
 <20231128165505.wm4xs4ktycswthkt@pengutronix.de>
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
Cc: linux-samsung-soc@vger.kernel.org, kernel@pengutronix.de,
 'Jingoo Han' <jingoohan1@gmail.com>, 'Seung-Woo Kim' <sw0312.kim@samsung.com>,
 'Krzysztof Kozlowski' <krzysztof.kozlowski@linaro.org>,
 'DRI mailing list' <dri-devel@lists.freedesktop.org>,
 'Kyungmin Park' <kyungmin.park@samsung.com>,
 'Alim Akhtar' <alim.akhtar@samsung.com>, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello Uwe Kleine-K=C3=B6nig,=0D=0A=0D=0A>=20-----Original=20Message-----=0D=
=0A>=20From:=20Uwe=20Kleine-K=C3=B6nig=20<u.kleine-koenig=40pengutronix.de>=
=0D=0A>=20Sent:=20Wednesday,=20November=2029,=202023=201:55=20AM=0D=0A>=20T=
o:=20Inki=20Dae=20<daeinki=40gmail.com>=0D=0A>=20Cc:=20linux-samsung-soc=40=
vger.kernel.org;=20Daniel=20Vetter=20<daniel=40ffwll.ch>;=0D=0A>=20Jingoo=
=20Han=20<jingoohan1=40gmail.com>;=20Seung-Woo=20Kim=20<sw0312.kim=40samsun=
g.com>;=0D=0A>=20Kyungmin=20Park=20<kyungmin.park=40samsung.com>;=20DRI=20m=
ailing=20list=20<dri-=0D=0A>=20devel=40lists.freedesktop.org>;=20Krzysztof=
=20Kozlowski=0D=0A>=20<krzysztof.kozlowski=40linaro.org>;=20kernel=40pengut=
ronix.de;=20Alim=20Akhtar=0D=0A>=20<alim.akhtar=40samsung.com>;=20David=20A=
irlie=20<airlied=40gmail.com>;=20linux-arm-=0D=0A>=20kernel=40lists.infrade=
ad.org=0D=0A>=20Subject:=20Re:=20=5BPATCH=20v3=2008/16=5D=20drm/exynos:=20C=
onvert=20to=20platform=20remove=0D=0A>=20callback=20returning=20void=0D=0A>=
=20=0D=0A>=20Hello=20Inki,=0D=0A>=20=0D=0A>=20On=20Wed,=20Nov=2008,=202023=
=20at=2008:54:54AM=20+0100,=20Uwe=20Kleine-K=C3=B6nig=20wrote:=0D=0A>=20>=
=20Hello=20Inki,=0D=0A>=20>=0D=0A>=20>=20On=20Wed,=20Nov=2008,=202023=20at=
=2001:16:18PM=20+0900,=20Inki=20Dae=20wrote:=0D=0A>=20>=20>=20Sorry=20for=
=20late.=20There=20was=20a=20merge=20conflict=20so=20I=20fixed=20it=20manua=
lly=20and=0D=0A>=20>=20>=20merged.=20And=20seems=20your=20patch=20descripti=
on=20is=20duplicated=20so=20dropped=0D=0A>=20>=20>=20duplicated=20one.=0D=
=0A>=20>=0D=0A>=20>=20Ah.=20I=20have=20a=20template=20that=20generates=20on=
e=20patch=20per=20driver.=20I=20guess=20this=0D=0A>=20>=20is=20the=20result=
=20of=20using=20squash=20instead=20of=20fixup=20while=20putting=20all=20exy=
nos=0D=0A>=20>=20changes=20into=20a=20single=20patch.=0D=0A>=20=0D=0A>=20Th=
is=20patch=20didn't=20make=20it=20into=20next=20yet=20even=20though=20it's=
=20included=20in=0D=0A>=20your=20exynos-drm-next=20branch=20at=0D=0A>=20htt=
ps://git.kernel.org/pub/scm/linux/kernel/git/daeinki/drm-exynos.git.=0D=0A>=
=20=0D=0A>=20Is=20this=20on=20purpose?=0D=0A=0D=0Adrm-exynos=20tree=20is=20=
not=20included=20in=20the=20next=20tree.=20It=20was=20previously=20included=
,=20but=20it=20has=20been=20removed.=20drm-exynos=20tree=20is=20merged=20in=
to=20the=20mainline=20through=20the=20drm-next=20tree,=20but=20when=20the=
=20drm-next=20is=20synchronized=20to=20the=20next=20tree,=20a=20conflict=20=
occurred=20between=20the=20exynos-drm=20tree=20and=20the=20drm-next=20tree.=
=20Therefore,=20I=20had=20requested=20that=20drm-exynos=20tree=20be=20remov=
ed=20from=20the=20next.=20Perhaps=20I=20was=20inexperienced=20in=20managing=
=20the=20git=20tree=20at=20that=20time.=20:)=0D=0A=0D=0AThanks,=0D=0AInki=
=20Dae=0D=0A=0D=0A>=20=0D=0A>=20Best=20regards=0D=0A>=20Uwe=0D=0A>=20=0D=0A=
>=20--=0D=0A>=20Pengutronix=20e.K.=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=7C=20Uwe=20Kleine-K=C3=B6nig=20=
=20=20=20=20=20=20=20=20=20=20=20=7C=0D=0A>=20Industrial=20Linux=20Solution=
s=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=7C=0D=0A>=20https://pr=
otect2.fireeye.com/v1/url?k=3D421afdc5-23671746-421b768a-=0D=0A>=2074fe4860=
0158-d04d6f7cf9d099c0&q=3D1&e=3D0938fb20-be8e-4a27-af6c-=0D=0A>=209e745ec73=
8c6&u=3Dhttps%3A%2F%2Fwww.pengutronix.de%2F=20=7C=0D=0A=0D=0A
