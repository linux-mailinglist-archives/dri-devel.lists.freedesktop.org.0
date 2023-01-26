Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CB86867C474
	for <lists+dri-devel@lfdr.de>; Thu, 26 Jan 2023 07:20:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A9B210E089;
	Thu, 26 Jan 2023 06:20:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout1.samsung.com (mailout1.samsung.com [203.254.224.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E52010E8EA
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Jan 2023 06:20:42 +0000 (UTC)
Received: from epcas1p2.samsung.com (unknown [182.195.41.46])
 by mailout1.samsung.com (KnoxPortal) with ESMTP id
 20230126062040epoutp01582f195327fdb425a395c94cebc4727f~9x4vnHM301147911479epoutp01b
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Jan 2023 06:20:40 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com
 20230126062040epoutp01582f195327fdb425a395c94cebc4727f~9x4vnHM301147911479epoutp01b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1674714040;
 bh=BzwzS4n8VEHQ62w09yKv4JMlAQPeaYZ77o7h6FSbOU0=;
 h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
 b=rnG8jJShyPtkpLAS08boFysrDV0JqH1jK/kJvHlZVTp98HuFe35ARRqLb1DPgpOh+
 S02xkIqbyrLdpR3srB9S7oNt5psFTJEZml8oXB7iAndVnyQrhp6BUXq1+FzUR+qJRC
 U08ovPvu06H/D1GfWG/iBBRe+33s+r6TpXbLipPM=
Received: from epsnrtp3.localdomain (unknown [182.195.42.164]) by
 epcas1p3.samsung.com (KnoxPortal) with ESMTP id
 20230126062039epcas1p3919cd2ea0729a89832fc8a787f0a3383~9x4vG-q0Y2493424934epcas1p3V;
 Thu, 26 Jan 2023 06:20:39 +0000 (GMT)
Received: from epsmges1p5.samsung.com (unknown [182.195.38.233]) by
 epsnrtp3.localdomain (Postfix) with ESMTP id 4P2VvB4VRVz4x9Pt; Thu, 26 Jan
 2023 06:20:38 +0000 (GMT)
Received: from epcas1p4.samsung.com ( [182.195.41.48]) by
 epsmges1p5.samsung.com (Symantec Messaging Gateway) with SMTP id
 3D.CF.54823.6BB12D36; Thu, 26 Jan 2023 15:20:38 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
 epcas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20230126062038epcas1p2d2f898be360f8400521d2de81c01b8f6~9x4tvU7DO2754827548epcas1p2P;
 Thu, 26 Jan 2023 06:20:38 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
 epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20230126062038epsmtrp12575439365fc005c85674c9394aa23f1~9x4tuiP3y2855228552epsmtrp1Y;
 Thu, 26 Jan 2023 06:20:38 +0000 (GMT)
X-AuditID: b6c32a39-d01fc7000000d627-51-63d21bb6fc8d
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
 epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
 6D.3F.05839.5BB12D36; Thu, 26 Jan 2023 15:20:38 +0900 (KST)
Received: from inkidae002 (unknown [10.113.221.213]) by epsmtip2.samsung.com
 (KnoxPortal) with ESMTPA id
 20230126062037epsmtip222c02d6b642e5b6df3c6ddcfa979a1e8~9x4tg7enQ0395603956epsmtip2N;
 Thu, 26 Jan 2023 06:20:37 +0000 (GMT)
From: =?UTF-8?B?64yA7J246riwL1RpemVuIFBsYXRmb3JtIExhYihTUikv7IK87ISx7KCE7J6Q?=
 <inki.dae@samsung.com>
To: "'Jagan Teki'" <jagan@amarulasolutions.com>
In-Reply-To: <CAMty3ZD=RDY_NH6rt+ibY_4drEenmHhxKpn=BRD551jRoK=MxQ@mail.gmail.com>
Subject: RE: [PATCH v11 0/3] drm: exynos: dsi: Restore the bridge chain
Date: Thu, 26 Jan 2023 15:20:37 +0900
Message-ID: <001501d9314e$4eb1de30$ec159a90$@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQIgyi8WHi+AM2s4a5bnyovkxHh4sgE7ee16AjPDcKMB0WyXlgHxeuPsred1yjA=
Content-Language: ko
X-Brightmail-Tracker: H4sIAAAAAAAAA01Te0xbdRT2115ub0nKrh0bP9m61Jtgthmg3Vq8ZZRNxa0JSljmZGocuynX
 Qiht7YPXhABqxUFGCY7REpDH2OgIOnGPguPVztYtwbEhshhqnW5KKZOXLEGMse1lyn/fOec7
 5/vO74Gx+bfQWCxPY6T1GkpNoJHIVdcuUfzVbXeVIsvcDtLXuYyQ36/Mo+SffRaUHKua45AX
 LEMo2XR7iEX23vByyDlzJSDvfupCySXbfTbZvXoFkE0NfpRcHWhFDvAUvYu+CEWr7VtE0W/z
 chSd1/0sxfQP11GFr8bDUpxrnEQVpy9fBIrlvh2Z3LfyU3JpKofWC2mNUpuTp1HJifQj2S9n
 S5NE4nixjHyBEGqoAlpOpL2aGX8wTx00TggLKbUpmMqkDAYiMTVFrzUZaWGu1mCUE7QuR62T
 6hIMVIHBpFElaGhjslgk2iMNEk/k537cPYzoJgTFK2c+AxXg3vZTgItBXAKHxpzoKRCJ8XEH
 gNdmXEiowMeXAJz5OZYpPAZwqN0CnnTUTk4iTGEQwJGxkfXAD2Cr5+9wO4qroLemghXC0Xgi
 HHE2hjEbr0TgBwv7QpiLH4YTPaNoCG/GD8GuRmtYAcHjYMDhiAhhHi6DK1/+xWHw0/Cm9QHC
 zHkenm8PsBlHQrj68HyQjwW1MmDLYzZDiYbNn5jZIW8Qn8Hg/e9GEYafBmcH+lEGb4aznssc
 BsdCf52ZwzQ0ADg91Y0wQROArtWp9f33wuGuBlZIjY3vgl8MJDLpZ2H/WgtglKPgHyu1YUMQ
 58FqM5+hENB95976FAjHz9WjFkDYNqxm27CabcMOtv/F2gByEWyldYYCFW0Q66T/3bZSW9AH
 wo96t8wBzj5aSHACFgacAGJsIppX23xbyeflUCWltF6brTepaYMTSIOHXc+O3aLUBn+Fxpgt
 lshEkqQ9eyWkOElMxPBi5DeVfFxFGel8mtbR+id9LIwbW8Ha9nDnUmKR2W/t9NcFFtKfqUr9
 dVNcfUCsK91pr/vn8Oj2G2C2qMf9u7MjP6q0uqyPe3y/IEv7qOFOakDw1HyxpDfdGBAdzRS8
 FmXdurw2UaKraTvt1F3SX/qquVDWITPVp+VGfPOG3xMzMpVBucuSy1kOumz6vWv9pFCaYcc+
 T/Z0vX2sWir/aVCrOOB+sFZe7RGc4Pi43cLn1s7y00pWkxbbE0Zf6jgUUzFX6JYehdaTKXaJ
 PHLGe7JZ+XVl3SvpysH39y362oqOv/jLMMG/1RLx4ZV33j1zYf/BoU328SO/HfvRvqUcowXu
 17NSed75uNEs+WxxT1XTm4vjSx+NuwjEkEuJd7P1BupfGK4KUF0EAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrMIsWRmVeSWpSXmKPExsWy7bCSvO426UvJBm/nMVvcX/yZxeLK1/ds
 Fl82TWCzONv0ht1i+YR9bBYzzu9jslh75C67xZu2RkaLS1MOs1l8mvWQ2WLFz62MFjMmv2Sz
 +LlrHosDr8faj/dZPebNOsHisXPWXXaPxXteMnncubaHzeN+93EmjyXTrrJ59G1ZxejxeZNc
 AGcUl01Kak5mWWqRvl0CV8aqxzMYC9aJVrz/0sHWwLhRsIuRk0NCwESi5+pVli5GLg4hgd2M
 Eq2ntrF1MXIAJSQktmzlgDCFJQ4fLgYpFxJ4zihx40w0iM0mkCpx49NHdhBbREBf4sChaUwg
 Y5gFOlkk7v74zQwx8ySTxPmrf1hAqjgFAiUurz7IBmILC7hLLJ02kxHEZhFQlXi9YwcriM0r
 YCnxdeMvdghbUOLkzCdgvcwC2hK9D1sZYexlC18zQzygIPHz6TJWkENFBPwk5n5jhigRkZjd
 2cY8gVF4FpJJs5BMmoVk0iwkLQsYWVYxSqYWFOem5xYbFhjmpZbrFSfmFpfmpesl5+duYgTH
 q5bmDsbtqz7oHWJk4mA8xCjBwawkwtsz+3yyEG9KYmVValF+fFFpTmrxIUZpDhYlcd4LXSfj
 hQTSE0tSs1NTC1KLYLJMHJxSDUwnrnPsffVfZt8WlQM1r2sLPDI3XquaXX7V3Zbr1BMtlsg0
 Bu3Z7PKG/bcWtm0zWG/95MS5xV1K3ll/JhXoNkR62jFXKs6/eZOxWZJpj9SR5rPL8nQsol48
 O+kV7/M7xi576we/qdPCFrBf+6Ka+X3mTpfYUI//XwtfPjP6ceVmxKfEd2nFH0wfekzcf9nl
 9ZWq+ICvtavYF3MVft5VyDV7P8/x1Ve35zZ3L+5u2D3v12llX/eHU+/qas/6fGm9xfvXh4rc
 1l5w7MpeP6PouXvh9B0z3E00tQ/HvZPkOLf3a92sE7Jbbx6RTrzJYDuJwYC18NnFj/53VV4y
 Vq16dJVHxvlH6OYG70D715nNM5q2KLEUZyQaajEXFScCAC15FSBGAwAA
X-CMS-MailID: 20230126062038epcas1p2d2f898be360f8400521d2de81c01b8f6
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: SVC_REQ_APPROVE
CMS-TYPE: 101P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20230106175722epcas1p152dacb511ee08d563c51bb8a8deb0bfe
References: <20221212182923.29155-1-jagan@amarulasolutions.com>
 <CGME20230106175722epcas1p152dacb511ee08d563c51bb8a8deb0bfe@epcas1p1.samsung.com>
 <CAMty3ZDGu-acuZ9Bhp_=JcTYn5YWKVZnEUf3nC28Spm8v4+KQg@mail.gmail.com>
 <000001d9262d$42bc49c0$c834dd40$@samsung.com>
 <CAMty3ZD=RDY_NH6rt+ibY_4drEenmHhxKpn=BRD551jRoK=MxQ@mail.gmail.com>
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
Cc: 'Marek Vasut' <marex@denx.de>, linux-samsung-soc@vger.kernel.org,
 'linux-amarula' <linux-amarula@amarulasolutions.com>,
 'Seung-Woo Kim' <sw0312.kim@samsung.com>,
 'Neil	Armstrong' <narmstrong@linaro.org>,
 'Robert Foss' <robert.foss@linaro.org>,
 'Kyungmin Park' <kyungmin.park@samsung.com>, thierry.reding@gmail.com,
 dri-devel@lists.freedesktop.org, 'Andrzej Hajda' <andrzej.hajda@intel.com>,
 'Sam
 Ravnborg' <sam@ravnborg.org>, 'Marek Szyprowski' <m.szyprowski@samsung.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Jagan Teki,

> -----Original Message-----
> From: Jagan Teki <jagan=40amarulasolutions.com>
> Sent: Friday, January 20, 2023 3:19 AM
> To: =EB=8C=80=EC=9D=B8=EA=B8=B0/Tizen=20Platform=20Lab(SR)/=EC=82=BC=EC=
=84=B1=EC=A0=84=EC=9E=90=20<inki.dae=40samsung.com>=0D=0A>=20Cc:=20Marek=20=
Szyprowski=20<m.szyprowski=40samsung.com>;=20Seung-Woo=20Kim=0D=0A>=20<sw03=
12.kim=40samsung.com>;=20Kyungmin=20Park=20<kyungmin.park=40samsung.com>;=
=20Neil=0D=0A>=20Armstrong=20<narmstrong=40linaro.org>;=20Robert=20Foss=20<=
robert.foss=40linaro.org>;=0D=0A>=20Andrzej=20Hajda=20<andrzej.hajda=40inte=
l.com>;=20Sam=20Ravnborg=20<sam=40ravnborg.org>;=0D=0A>=20thierry.reding=40=
gmail.com;=20Marek=20Vasut=20<marex=40denx.de>;=20linux-samsung-=0D=0A>=20s=
oc=40vger.kernel.org;=20dri-devel=40lists.freedesktop.org;=20linux-amarula=
=20<linux-=0D=0A>=20amarula=40amarulasolutions.com>=0D=0A>=20Subject:=20Re:=
=20=5BPATCH=20v11=200/3=5D=20drm:=20exynos:=20dsi:=20Restore=20the=20bridge=
=20chain=0D=0A>=20=0D=0A>=20Hi=20Inki=20Dae,=0D=0A>=20=0D=0A>=20On=20Thu,=
=20Jan=2012,=202023=20at=207:56=20AM=20=EB=8C=80=EC=9D=B8=EA=B8=B0/Tizen=20=
Platform=20Lab(SR)/=EC=82=BC=EC=84=B1=EC=A0=84=EC=9E=90=0D=0A>=20<inki.dae=
=40samsung.com>=20wrote:=0D=0A>=20>=0D=0A>=20>=20Hi=20Jagan=20Teki,=0D=0A>=
=20>=0D=0A>=20>=20Sorry=20for=20late.=0D=0A>=20>=0D=0A>=20>=20>=20-----Orig=
inal=20Message-----=0D=0A>=20>=20>=20From:=20Jagan=20Teki=20<jagan=40amarul=
asolutions.com>=0D=0A>=20>=20>=20Sent:=20Saturday,=20January=207,=202023=20=
2:56=20AM=0D=0A>=20>=20>=20To:=20Marek=20Szyprowski=20<m.szyprowski=40samsu=
ng.com>;=20Inki=20Dae=0D=0A>=20>=20>=20<inki.dae=40samsung.com>;=20Seung-Wo=
o=20Kim=20<sw0312.kim=40samsung.com>;=20Kyungmin=0D=0A>=20Park=0D=0A>=20>=
=20>=20<kyungmin.park=40samsung.com>;=20Neil=20Armstrong=20<narmstrong=40li=
naro.org>;=0D=0A>=20Robert=0D=0A>=20>=20>=20Foss=20<robert.foss=40linaro.or=
g>;=20Andrzej=20Hajda=20<andrzej.hajda=40intel.com>;=0D=0A>=20Sam=0D=0A>=20=
>=20>=20Ravnborg=20<sam=40ravnborg.org>=0D=0A>=20>=20>=20Cc:=20Marek=20Vasu=
t=20<marex=40denx.de>;=20linux-samsung-soc=40vger.kernel.org;=20dri-=0D=0A>=
=20>=20>=20devel=40lists.freedesktop.org;=20linux-amarula=20<linux-=0D=0A>=
=20>=20>=20amarula=40amarulasolutions.com>=0D=0A>=20>=20>=20Subject:=20Re:=
=20=5BPATCH=20v11=200/3=5D=20drm:=20exynos:=20dsi:=20Restore=20the=20bridge=
=20chain=0D=0A>=20>=20>=0D=0A>=20>=20>=20On=20Mon,=20Dec=2012,=202022=20at=
=2011:59=20PM=20Jagan=20Teki=20<jagan=40amarulasolutions.com>=0D=0A>=20wrot=
e:=0D=0A>=20>=20>=20>=0D=0A>=20>=20>=20>=20Split=20the=20Exynos=20DSI=20bri=
dge=20chain=20update=20patches=20from=20Samsung=20DSIM=0D=0A>=20>=20>=20>=
=20bridge=20driver=20for=20easy=20to=20apply.=0D=0A>=20>=20>=20>=0D=0A>=20>=
=20>=20>=20Changes=20for=20v11:=0D=0A>=20>=20>=20>=20-=20enable=20bridge.pr=
e_enable_prev_first=0D=0A>=20>=20>=20>=20Changes=20for=20v10:=0D=0A>=20>=20=
>=20>=20-=20collect=20Marek.V=20Review=20tag=0D=0A>=20>=20>=0D=0A>=20>=20>=
=20Any=20update=20on=20this?=0D=0A>=20>=20>=0D=0A>=20>=0D=0A>=20>=20Added=
=20Thierry=20Reding=20who=20is=20a=20maintainer=20of=20DRM=20panel=20driver=
s.=0D=0A>=20>=0D=0A>=20>=20I=20will=20pick=20this=20patch=20series=20-=20in=
cluding=20panel=20and=20bride=20patches=20-=20up.=0D=0A>=20>=0D=0A>=20>=20T=
hierry=20and=20Andrzej,=20please=20let=20me=20know=20if=20any=20problem.=0D=
=0A>=20=0D=0A>=20Any=20further=20update=20on=20this?=0D=0A=0D=0AAlready=20m=
erged=20to=20exynos-drm-next=20so=20this=20patch=20series=20will=20go=20to=
=20-next=20as=20long=20as=20no=20feedback=20from=20Thierry=20and=20Andrzej.=
=0D=0AI=20will=20request=20a=20PR=20this=20or=20next=20week.=0D=0A=0D=0ATha=
nks,=0D=0AInki=20Dae=0D=0A=0D=0A>=20=0D=0A>=20Thanks,=0D=0A>=20Jagan.=0D=0A=
=0D=0A
