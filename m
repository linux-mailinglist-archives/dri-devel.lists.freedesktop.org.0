Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 436BD6F9A23
	for <lists+dri-devel@lfdr.de>; Sun,  7 May 2023 18:42:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 393B410E2AF;
	Sun,  7 May 2023 16:42:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 382 seconds by postgrey-1.36 at gabe;
 Sun, 07 May 2023 16:42:16 UTC
Received: from mailout3.samsung.com (mailout3.samsung.com [203.254.224.33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E388F10E2AF
 for <dri-devel@lists.freedesktop.org>; Sun,  7 May 2023 16:42:16 +0000 (UTC)
Received: from epcas5p2.samsung.com (unknown [182.195.41.40])
 by mailout3.samsung.com (KnoxPortal) with ESMTP id
 20230507163550epoutp0384817aa6394ba41d2d2a1f3eb5d1fb14~c6bsZYl4p1375813758epoutp03u
 for <dri-devel@lists.freedesktop.org>; Sun,  7 May 2023 16:35:50 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com
 20230507163550epoutp0384817aa6394ba41d2d2a1f3eb5d1fb14~c6bsZYl4p1375813758epoutp03u
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1683477350;
 bh=0Hn8Y0nrtRj/g9D5t6VfEF2rA99xx2VKGtzyVVS+j7U=;
 h=From:To:In-Reply-To:Subject:Date:References:From;
 b=vPtZs8HaKMny2gYH8WS7yIkPIunLlwfgTf8rpWqfXPrv+VqM0oG+3xVfubYxtk1xT
 jPPQb0JtsZVBQi7ah1Yp5+CziUJrB7Dsnu4SUT9gMRU2j8gnODfv5lGFt2RJ9ySirf
 yMeNLTPejRzTgp3537LzrhFdfjl2eql1WRnCkbNY=
Received: from epsnrtp1.localdomain (unknown [182.195.42.162]) by
 epcas5p3.samsung.com (KnoxPortal) with ESMTP id
 20230507163550epcas5p35b83960e8c6bf87520af178d8b6cee0d~c6br8yCg50863908639epcas5p3K;
 Sun,  7 May 2023 16:35:50 +0000 (GMT)
Received: from epsmges5p3new.samsung.com (unknown [182.195.38.179]) by
 epsnrtp1.localdomain (Postfix) with ESMTP id 4QDqmN5h5lz4x9Pr; Sun,  7 May
 2023 16:35:48 +0000 (GMT)
Received: from epcas5p1.samsung.com ( [182.195.41.39]) by
 epsmges5p3new.samsung.com (Symantec Messaging Gateway) with SMTP id
 F9.B4.55646.463D7546; Mon,  8 May 2023 01:35:48 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
 epcas5p4.samsung.com (KnoxPortal) with ESMTPA id
 20230507163548epcas5p46ca31e821ecf88679180933f66f895ed~c6bqTinWQ1276912769epcas5p4l;
 Sun,  7 May 2023 16:35:48 +0000 (GMT)
Received: from epsmgms1p2.samsung.com (unknown [182.195.42.42]) by
 epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20230507163548epsmtrp2d87b445c5df8deec136dcd29f23d1ea2~c6bqSq1mQ0344903449epsmtrp2J;
 Sun,  7 May 2023 16:35:48 +0000 (GMT)
X-AuditID: b6c32a4b-b71fa7000001d95e-bc-6457d3640d9f
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
 epsmgms1p2.samsung.com (Symantec Messaging Gateway) with SMTP id
 D2.43.28392.463D7546; Mon,  8 May 2023 01:35:48 +0900 (KST)
Received: from alimakhtar04 (unknown [107.122.12.5]) by epsmtip2.samsung.com
 (KnoxPortal) with ESMTPA id
 20230507163546epsmtip2223526e757a22c1ece5cf65a830f7efe~c6bowb0AI0363803638epsmtip2N;
 Sun,  7 May 2023 16:35:46 +0000 (GMT)
From: "Alim Akhtar" <alim.akhtar@samsung.com>
To: "'Krzysztof Kozlowski'" <krzysztof.kozlowski@linaro.org>, "'Inki Dae'"
 <inki.dae@samsung.com>, "'Seung-Woo Kim'" <sw0312.kim@samsung.com>,
 "'Kyungmin Park'" <kyungmin.park@samsung.com>, "'David Airlie'"
 <airlied@gmail.com>, "'Daniel Vetter'" <daniel@ffwll.ch>, "'Marek
 Szyprowski'" <m.szyprowski@samsung.com>, <dri-devel@lists.freedesktop.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-samsung-soc@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
In-Reply-To: <20230507144753.192959-1-krzysztof.kozlowski@linaro.org>
Subject: RE: [PATCH] drm/exynos: g2d: staticize stubs in header
Date: Sun, 7 May 2023 22:05:45 +0530
Message-ID: <004001d98101$fa5ed690$ef1c83b0$@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQHMQF+KV7mnVACdrNHe1vibu+C8KwKtLaCmr1QYABA=
Content-Language: en-us
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrGJsWRmVeSWpSXmKPExsWy7bCmum7K5fAUg6dTtC1OXF/EZPF/20Rm
 iytf37NZTLo/gcVi7+ut7BZnm96wW2x6fI3V4vKuOWwWM87vY7JYe+Quu8WMyS/ZHLg99n5b
 wOKxc9Zddo871/awedzvPs7ksXlJvUffllWMHp83yQWwR2XbZKQmpqQWKaTmJeenZOal2yp5
 B8c7x5uaGRjqGlpamCsp5CXmptoqufgE6Lpl5gDdqKRQlphTChQKSCwuVtK3synKLy1JVcjI
 Ly6xVUotSMkpMCnQK07MLS7NS9fLSy2xMjQwMDIFKkzIztj07RNbwU+RiqOLv7I0MN4Q7mLk
 5JAQMJF4+LqFsYuRi0NIYDejxLedl1ghnE+MEpcWPmeGcD4zSqz995gNpuXb/69QiV2MEjfW
 t7NBOC8ZJf7dWMwMUsUmoCuxY3EbWIeIwBVmiasnWUBsTgFXiXMP/7GD2MIC9hLLLrxi6mLk
 4GARUJGYckgAJMwrYCkxfc0kJghbUOLkzCdgrcwC2hLLFr5mhjhCQeLn02WsEOOtJG5u+sIO
 USMu8fLoEXaQeyQEdnBILPv4iQ1kvoSAi8TZy0EQvcISr45vYYewpSQ+v9sLVeIhseiPFEQ4
 Q+Lt8vWMELa9xIErc1hASpgFNCXW79KH2MQn0fv7CRNEJ69ER5sQRLWqRPO7qywQtrTExO5u
 VgjbQ2LJtjNMkICawShx9cEaxgmMCrOQPDkLyZOzkDwzC2HzAkaWVYySqQXFuempxaYFxnmp
 5fDoTs7P3cQITsBa3jsYHz34oHeIkYmD8RCjBAezkgjvqoSwFCHelMTKqtSi/Pii0pzU4kOM
 psCAn8gsJZqcD8wBeSXxhiaWBiZmZmYmlsZmhkrivOq2J5OFBNITS1KzU1MLUotg+pg4OKUa
 mKZoddjF7zyzjnV5nKuVHrvrwjXPLgZaHI/x/pW6IPV3ks4q1qM+hpsl5v1cx/Dwx/sCTX62
 9XW5Hjt+JHySPfWi8eVVv0lX9xb99SoV3azG6i61vrnXiC9ka3W/7LnF0WEnXn9eojDN0G2T
 3DSHdKnyqPgrIkYfenYUXM3N67i86/St2kbFi6a1pnvUz+UIba3rSau4UtVV/jvUPa3DKDRT
 KfzePflvbXPfaoqcOrOyidNyj/sBL1+J1RKvH8flNSo+6/l00FZqpmUNg+azG6Jvdh/KWrYx
 Xs5tLeMkbb27T/IP+xkrTNE+LPw80lrxiubT7hzvg/+W/C6YIxi4ONarp9drvmvQEfcUsU+m
 SizFGYmGWsxFxYkAwNsGyEkEAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprCIsWRmVeSWpSXmKPExsWy7bCSvG7K5fAUg923uC1OXF/EZPF/20Rm
 iytf37NZTLo/gcVi7+ut7BZnm96wW2x6fI3V4vKuOWwWM87vY7JYe+Quu8WMyS/ZHLg99n5b
 wOKxc9Zddo871/awedzvPs7ksXlJvUffllWMHp83yQWwR3HZpKTmZJalFunbJXBlTJ42g7Hg
 m0DFpk+/2RsY9/B1MXJySAiYSHz7/5W5i5GLQ0hgB6PE7VkLWSAS0hLXN05gh7CFJVb+ew5m
 Cwk8Z5RoXp8PYrMJ6ErsWNzGBtIsInCHWWLd/Y+MEJOmMUr8vviWGaSKU8BV4tzDf2DdwgL2
 EssuvGLqYuTgYBFQkZhySAAkzCtgKTF9zSQmCFtQ4uTMJ2BHMAtoS/Q+bGWEsZctfM0McZCC
 xM+ny1hBbBEBK4mbm76wQ9SIS7w8eoR9AqPQLCSjZiEZNQvJqFlIWhYwsqxilEwtKM5Nzy02
 LDDKSy3XK07MLS7NS9dLzs/dxAiOOC2tHYx7Vn3QO8TIxMF4iFGCg1lJhHdVQliKEG9KYmVV
 alF+fFFpTmrxIUZpDhYlcd4LXSfjhQTSE0tSs1NTC1KLYLJMHJxSDUx6l9NYbk23PGOyyZpr
 hvntWSZixZcl2FatLPl/gr+cvaz1krxipaKX6dRIwZQqbWXe/nV1urZ2hp5fw9Ps97aEr7+q
 nlOR0PVL7fT2jQu8fs9RPsNZ4LPKv5mV+9kcfv/jC3LlRMXz9E+Idn+9avXwmoL9B9WrE3e7
 SIR76Ll3puw9/SXff+qiYx3Bdi6M1ixckftXsa5wC7XlV31gWcEQfFFR+3TNhE9y3MY+fXNi
 px1cz1ky08aFVy37zI3t8Wk89m2Mew/lqlpWhkjlcO1cOuGrnHV1r9avOWr7QqQ3ZB2/96pr
 jf+RzTvurQ3Lu6jxrGbnLxsvOX3Lk4nLDl8O3L3b1/CVR6CYpnmvEktxRqKhFnNRcSIAS5O6
 jCcDAAA=
X-CMS-MailID: 20230507163548epcas5p46ca31e821ecf88679180933f66f895ed
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20230507144800epcas5p219717e5bf06b91772ee877c8dcee0940
References: <CGME20230507144800epcas5p219717e5bf06b91772ee877c8dcee0940@epcas5p2.samsung.com>
 <20230507144753.192959-1-krzysztof.kozlowski@linaro.org>
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

Hi Krzysztof,

> -----Original Message-----
> From: Krzysztof Kozlowski <krzysztof.kozlowski=40linaro.org>
> Sent: Sunday, May 7, 2023 8:18 PM
> To: Inki Dae <inki.dae=40samsung.com>; Seung-Woo Kim
> <sw0312.kim=40samsung.com>; Kyungmin Park
> <kyungmin.park=40samsung.com>; David Airlie <airlied=40gmail.com>; Daniel
> Vetter <daniel=40ffwll.ch>; Krzysztof Kozlowski
> <krzysztof.kozlowski=40linaro.org>; Alim Akhtar <alim.akhtar=40samsung.co=
m>;
> Marek Szyprowski <m.szyprowski=40samsung.com>; dri-
> devel=40lists.freedesktop.org; linux-arm-kernel=40lists.infradead.org; li=
nux-
> samsung-soc=40vger.kernel.org; linux-kernel=40vger.kernel.org
> Subject: =5BPATCH=5D drm/exynos: g2d: staticize stubs in header
>=20
> Stubs for =21CONFIG_DRM_EXYNOS_G2D case in the header should be static
> inline:
>=20
>   drivers/gpu/drm/exynos/exynos_drm_g2d.h:37:5: warning: no previous
> prototype for =E2=80=98g2d_open=E2=80=99=20=5B-Wmissing-prototypes=5D=0D=
=0A>=20=20=20drivers/gpu/drm/exynos/exynos_drm_g2d.h:42:6:=20warning:=20no=
=20previous=0D=0A>=20prototype=20for=20=E2=80=98g2d_close=E2=80=99=20=5B-Wm=
issing-prototypes=5D=0D=0A>=20=0D=0A>=20Fixes:=20eb4d9796fa34=20(=22drm/exy=
nos:=20g2d:=20Convert=20to=20driver=20component=20API=22)=0D=0A>=20Signed-o=
ff-by:=20Krzysztof=20Kozlowski=20<krzysztof.kozlowski=40linaro.org>=0D=0A>=
=20---=0D=0A=0D=0AReviewed-by:=20Alim=20Akhtar=20<alim.akhtar=40samsung.com=
>=0D=0A=0D=0A=0D=0A>=20=20drivers/gpu/drm/exynos/exynos_drm_g2d.h=20=7C=204=
=20++--=0D=0A>=20=201=20file=20changed,=202=20insertions(+),=202=20deletion=
s(-)=0D=0A>=20=0D=0A>=20diff=20--git=20a/drivers/gpu/drm/exynos/exynos_drm_=
g2d.h=0D=0A>=20b/drivers/gpu/drm/exynos/exynos_drm_g2d.h=0D=0A>=20index=207=
4ea3c26dead..1a5ae781b56c=20100644=0D=0A>=20---=20a/drivers/gpu/drm/exynos/=
exynos_drm_g2d.h=0D=0A>=20+++=20b/drivers/gpu/drm/exynos/exynos_drm_g2d.h=
=0D=0A>=20=40=40=20-34,11=20+34,11=20=40=40=20static=20inline=20int=20exyno=
s_g2d_exec_ioctl(struct=0D=0A>=20drm_device=20*dev,=20void=20*data,=0D=0A>=
=20=20=09return=20-ENODEV;=0D=0A>=20=20=7D=0D=0A>=20=0D=0A>=20-int=20g2d_op=
en(struct=20drm_device=20*drm_dev,=20struct=20drm_file=20*file)=0D=0A>=20+s=
tatic=20inline=20int=20g2d_open(struct=20drm_device=20*drm_dev,=20struct=20=
drm_file=20*file)=0D=0A>=20=20=7B=0D=0A>=20=20=09return=200;=0D=0A>=20=20=
=7D=0D=0A>=20=0D=0A>=20-void=20g2d_close(struct=20drm_device=20*drm_dev,=20=
struct=20drm_file=20*file)=0D=0A>=20+static=20inline=20void=20g2d_close(str=
uct=20drm_device=20*drm_dev,=20struct=20drm_file=20*file)=0D=0A>=20=20=7B=
=20=7D=0D=0A>=20=20=23endif=0D=0A>=20--=0D=0A>=202.34.1=0D=0A=0D=0A=0D=0A
