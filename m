Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B858FA8B182
	for <lists+dri-devel@lfdr.de>; Wed, 16 Apr 2025 09:03:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 768BB10E84E;
	Wed, 16 Apr 2025 07:03:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=samsung.com header.i=@samsung.com header.b="lCDOCEGq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 334 seconds by postgrey-1.36 at gabe;
 Wed, 16 Apr 2025 02:34:16 UTC
Received: from mailout1.samsung.com (mailout1.samsung.com [203.254.224.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 371CF10E821
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Apr 2025 02:34:16 +0000 (UTC)
Received: from epcas1p3.samsung.com (unknown [182.195.41.47])
 by mailout1.samsung.com (KnoxPortal) with ESMTP id
 20250416022837epoutp018dbe588e191336c7344eed93a79f60a2~2q4qU88a22824428244epoutp01X
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Apr 2025 02:28:37 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com
 20250416022837epoutp018dbe588e191336c7344eed93a79f60a2~2q4qU88a22824428244epoutp01X
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1744770517;
 bh=0WxuiN1Es5GCFOc2Kimqm5n+6q45fsvnvzSj9TxWCiU=;
 h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
 b=lCDOCEGql5AKw2m+EndZzADOjk8pHHfDqlsABOqqgR9PBc1qDlcyJBSdAov1sx19P
 /cyLg3+syrPrOK2uc7SsF/UlX2t8WgiEUQxAmYDjysJFKnkhN60OMoFNkruDU+et03
 OWwA/9RpFI+K8YUXPjCJY3fYNtpDkE9q51X1BFcI=
Received: from epsnrtp01.localdomain (unknown [182.195.42.153]) by
 epcas1p3.samsung.com (KnoxPortal) with ESMTPS id
 20250416022836epcas1p302970f87172dbe801a9ccc0f0698a2e5~2q4p8VjNJ2814928149epcas1p3F;
 Wed, 16 Apr 2025 02:28:36 +0000 (GMT)
Received: from epsmgec1p1.samsung.com (unknown [182.195.36.227]) by
 epsnrtp01.localdomain (Postfix) with ESMTP id 4ZclM842Ctz6B9m4; Wed, 16 Apr
 2025 02:28:36 +0000 (GMT)
Received: from epcas1p2.samsung.com ( [182.195.41.46]) by
 epsmgec1p1.samsung.com (Symantec Messaging Gateway) with SMTP id
 00.ED.09912.4D51FF76; Wed, 16 Apr 2025 11:28:36 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
 epcas1p3.samsung.com (KnoxPortal) with ESMTPA id
 20250416022835epcas1p3bec0438e0950669f9f0b423970fcb8d4~2q4o_xSSs2814928149epcas1p3D;
 Wed, 16 Apr 2025 02:28:35 +0000 (GMT)
Received: from epsmgmcp1.samsung.com (unknown [182.195.42.82]) by
 epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20250416022835epsmtrp147d059c874edc77322235215edc3a940~2q4o91DbP1848718487epsmtrp1F;
 Wed, 16 Apr 2025 02:28:35 +0000 (GMT)
X-AuditID: b6c32a36-d05a3240000026b8-d8-67ff15d4a0b1
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
 epsmgmcp1.samsung.com (Symantec Messaging Gateway) with SMTP id
 A7.DB.19478.3D51FF76; Wed, 16 Apr 2025 11:28:35 +0900 (KST)
Received: from jaewon31kim02 (unknown [10.253.104.100]) by
 epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20250416022835epsmtip2f5d593402a092f0d37e6d2708f9a4595~2q4otXI232683726837epsmtip2t;
 Wed, 16 Apr 2025 02:28:35 +0000 (GMT)
From: =?utf-8?B?6rmA7J6s7JuQ?= <jaewon31.kim@samsung.com>
To: "'T.J. Mercier'" <tjmercier@google.com>, "'Juan Yescas'"
 <jyescas@google.com>
Cc: "'Sumit Semwal'" <sumit.semwal@linaro.org>, "'Benjamin Gaignard'"
 <benjamin.gaignard@collabora.com>, "'Brian Starkey'"
 <Brian.Starkey@arm.com>, "'John Stultz'" <jstultz@google.com>,
 =?utf-8?Q?'Christian_K=C3=B6nig'?= <christian.koenig@amd.com>,
 <linux-media@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <linaro-mm-sig@lists.linaro.org>, <linux-kernel@vger.kernel.org>,
 <baohua@kernel.org>, <dmitry.osipenko@collabora.com>,
 <Guangming.Cao@mediatek.com>, <surenb@google.com>, <kaleshsingh@google.com>
In-Reply-To: <CABdmKX3Ht=bCcPFxK5mGX2qD4riXQ7Ucw6H_-+1PupXy-1ABGQ@mail.gmail.com>
Subject: RE: [PATCH] dma-buf: heaps: Set allocation orders for larger page
 sizes
Date: Wed, 16 Apr 2025 11:28:35 +0900
Message-ID: <106c301dbae77$414454a0$c3ccfde0$@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 15.0
Thread-Index: AQDKWerKEeG60YHjLHi495x9XrZiDgIBaXUGAUclY0W1rfX84A==
Content-Language: ko
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrBJsWRmVeSWpSXmKPExsWy7bCmnu4V0f/pBi9/ylg8OdTLbLHlymxm
 i0enLjBavL2/m9Xi5JPr7BZXvr5ns2h/dpHd4s+JjWwWp+ccYLFo2jeT3eLLlYdMFpd3zWGz
 6NmwldXi1N3P7BaTLy1gs3i3/gubg4BH66W/bB5r5q1h9Nhxdwmjx4JNpR6bVnWyedy5tofN
 4373cSaP2/8eM3u0nNzP4vF5k1wAV1S2TUZqYkpqkUJqXnJ+SmZeuq2Sd3C8c7ypmYGhrqGl
 hbmSQl5ibqqtkotPgK5bZg7QL0oKZYk5pUChgMTiYiV9O5ui/NKSVIWM/OISW6XUgpScArMC
 veLE3OLSvHS9vNQSK0MDAyNToMKE7IxbHS+ZCnrUK2a0nmZvYHyi2sXIySEhYCKx7uwe5i5G
 Lg4hgR2MEot+zWGEcD4xShyfcZAFpArMmftdBabj3pk/7BDxnYwSy54kQDS8YZRYuGA2I0iC
 TcBSYvfXY2DNIgLBErePzGUFKWIW6GGR2NXSxASS4BQIlFi64B9Yg7BAkMSxxVPZQGwWAVWJ
 Tz8/A23g4OAVsJKYNxGsnFdAUOLkzCdgM5kFtCWWLXzNDHGQgsTuT0dZIXY5SdxdcRCqRkRi
 dmcbVM1/Don93ZwgIyUEXCR69+hDhIUlXh3fwg5hS0m87G+DsoslOuYuZ4Ior5Ho3JgIEbaX
 WLG/kxUkzCygKbF+lz7EIj6Jd197WCGqeSU62oQgqtUkWp59ZYWwZST+/nsGZXtIbH/yi3UC
 o+IsJG/NQvLWLCTnz0JYtoCRZRWjWGpBcW56arFhgRE8opPzczcxgpO4ltkOxklvP+gdYmTi
 YDzEKMHBrCTCe878X7oQb0piZVVqUX58UWlOavEhRlNgOE9klhJNzgfmkbySeEMTSwMTMyMT
 C2NLYzMlcd49H5+mCwmkJ5akZqemFqQWwfQxcXBKNTAVLbfYvkTH2/RDJMsSryl/hKvraiXP
 GYTs8mx5vfXXKe+WWvdffX+cri/4pJc84UfVC70b9ots56ZezzF1dpot/+91rJltweQvr19y
 LPw4b8dmTZb7yWJ1X97NnKZ34pMhb57VOrNTpWF+DYfXGM45KT21xtKeibNYwcxGz6nS/F3e
 lLe/HrmuZ3j9bEN3XG/9t4PXEvPf6fZ+P/tNVZm1u8iwNmC+/MZwwXjbi75fT1WevPCXZaqm
 3/Wkmtd7xNWzt9xqVTRPr9R+dXbi9drlwVde2R05+OqCxPfMO6VSa805Whxuh3+ylfU5o2R7
 MeBaVPK/X51zpwn2mcmGNXZ+nL2UPWflH5cC/SmH29yVWIozEg21mIuKEwGcpTDwawQAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrCIsWRmVeSWpSXmKPExsWy7bCSvO5l0f/pBhPu61k8OdTLbLHlymxm
 i0enLjBavL2/m9Xi5JPr7BZXvr5ns2h/dpHd4s+JjWwWp+ccYLFo2jeT3eLLlYdMFpd3zWGz
 6NmwldXi1N3P7BaTLy1gs3i3/gubg4BH66W/bB5r5q1h9Nhxdwmjx4JNpR6bVnWyedy5tofN
 4373cSaP2/8eM3u0nNzP4vF5k1wAVxSXTUpqTmZZapG+XQJXxouF+9kL1khX/Dw0hamBsUGs
 i5GTQ0LAROLemT/sXYxcHEIC2xklLi04zwaRkJF4c/4pSxcjB5AtLHH4cDFEzStGibWbXjGD
 1LAJWErs/nqMBcQWEQiW2HV+FhNIEbPADBaJR03tLBAdFxgltp+bBtbBKRAosXTBP0YQW1gg
 QGLN2o3sIDaLgKrEp5+f2UG28QpYScybyAQS5hUQlDg58wnYAmYBbYmnN5/C2csWvmaGOFRB
 Yveno6wQRzhJ3F1xEKpGRGJ2ZxvzBEbhWUhGzUIyahaSUbOQtCxgZFnFKJpaUJybnptcYKhX
 nJhbXJqXrpecn7uJERzRWkE7GJet/6t3iJGJg/EQowQHs5II7znzf+lCvCmJlVWpRfnxRaU5
 qcWHGKU5WJTEeZVzOlOEBNITS1KzU1MLUotgskwcnFINTKypZn9WKQTv+sUlYOTnEXD5UXVQ
 gfSdrpPnCj5NXqldY8D+jcHoZqhR0/tJvbuWSHy7/0o1tfWEifr0fWxZKbMf77pwy+WnUfi5
 mqRDbZmsc99tvPdvN8+ChF0HtCYe//u29TNnivnFMAeWRucnZ97rpbXxbmO/w3Zv05O95wJ3
 n3tUpxOgNKM3S8hUNlI9o2qV19mnOcfbf/nK7TrhvU5WaqPCh/miS+TdWD6HJy+69cx9p4z5
 Jvs/2zpZnEOEg8rqY99UvtnhudjM5Paz/sZdhbd3nm09n+DYe473ot3ZklD721MfyyUtipHi
 TRK+9m0p/9MollNLdn0P/WNfyiPGP9Eoal9NbsGjlQtOdCmxFGckGmoxFxUnAgCtox99VwMA
 AA==
X-CMS-MailID: 20250416022835epcas1p3bec0438e0950669f9f0b423970fcb8d4
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 101P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250415205720epcas1p4a8bbb4ff1ad221a72776694d08801368
References: <20250415171954.3970818-1-jyescas@google.com>
 <CGME20250415205720epcas1p4a8bbb4ff1ad221a72776694d08801368@epcas1p4.samsung.com>
 <CABdmKX3Ht=bCcPFxK5mGX2qD4riXQ7Ucw6H_-+1PupXy-1ABGQ@mail.gmail.com>
X-Mailman-Approved-At: Wed, 16 Apr 2025 07:03:26 +0000
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



> -----Original Message-----
> From: T.J. Mercier =5Bmailto:tjmercier=40google.com=5D
> Sent: Wednesday, April 16, 2025 5:57 AM
> To: Juan Yescas <jyescas=40google.com>
> Cc: Sumit Semwal <sumit.semwal=40linaro.org>; Benjamin Gaignard
> <benjamin.gaignard=40collabora.com>; Brian Starkey <Brian.Starkey=40arm.c=
om>;
> John Stultz <jstultz=40google.com>; Christian K=C3=B6nig=0D=0A>=20<christ=
ian.koenig=40amd.com>;=20linux-media=40vger.kernel.org;=20dri-=0D=0A>=20dev=
el=40lists.freedesktop.org;=20linaro-mm-sig=40lists.linaro.org;=20linux-=0D=
=0A>=20kernel=40vger.kernel.org;=20baohua=40kernel.org;=20dmitry.osipenko=
=40collabora.com;=0D=0A>=20jaewon31.kim=40samsung.com;=20Guangming.Cao=40me=
diatek.com;=20surenb=40google.com;=0D=0A>=20kaleshsingh=40google.com=0D=0A>=
=20Subject:=20Re:=20=5BPATCH=5D=20dma-buf:=20heaps:=20Set=20allocation=20or=
ders=20for=20larger=20page=0D=0A>=20sizes=0D=0A>=20=0D=0A>=20On=20Tue,=20Ap=
r=2015,=202025=20at=2010:20=E2=80=AFAM=20Juan=20Yescas=20<jyescas=40google.=
com>=20wrote:=0D=0A>=20>=0D=0A>=20>=20This=20change=20sets=20the=20allocati=
on=20orders=20for=20the=20different=20page=20sizes=0D=0A>=20>=20(4k,=2016k,=
=2064k)=20based=20on=20PAGE_SHIFT.=20Before=20this=20change,=20the=20orders=
=20for=0D=0A>=20>=20large=20page=20sizes=20were=20calculated=20incorrectly,=
=20this=20caused=20system=20heap=0D=0A>=20>=20to=20allocate=20from=202%=20t=
o=204%=20more=20memory=20on=2016KiB=20page=20size=20kernels.=0D=0A>=20>=0D=
=0A>=20>=20This=20change=20was=20tested=20on=204k/16k=20page=20size=20kerne=
ls.=0D=0A>=20>=0D=0A>=20>=20Signed-off-by:=20Juan=20Yescas=20<jyescas=40goo=
gle.com>=0D=0A>=20=0D=0A>=20I=20think=20=22dma-buf:=20system_heap:=22=20wou=
ld=20be=20better=20for=20the=20subject=20since=20this=0D=0A>=20is=20specifi=
c=20to=20the=20system=20heap.=0D=0A>=20=0D=0A>=20Would=20you=20mind=20clean=
ing=20up=20the=20extra=20space=20on=20line=20321=20too?=0D=0A>=20=40=40=20-=
318,7=20+318,7=20=40=40=20static=20struct=20page=0D=0A>=20*alloc_largest_av=
ailable(unsigned=20long=20size,=0D=0A>=20=20=20=20=20=20=20=20=20int=20i;=
=0D=0A>=20=0D=0A>=20=20=20=20=20=20=20=20=20for=20(i=20=3D=200;=20i=20<=20N=
UM_ORDERS;=20i++)=20=7B=0D=0A>=20-=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20if=20(size=20<=20=20(PAGE_SIZE=20<<=20orders=5Bi=5D))=0D=0A>=20+=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20if=20(size=20<=20(PAGE_SIZE=20<<=
=20orders=5Bi=5D))=0D=0A>=20=0D=0A>=20With=20that,=0D=0A>=20Reviewed-by:=20=
T.J.=20Mercier=20<tjmercier=40google.com>=0D=0A>=20=0D=0A>=20Fixes:=20d963a=
b0f15fb=20(=22dma-buf:=20system_heap:=20Allocate=20higher=20order=20pages=
=20if=0D=0A>=20available=22)=20is=20also=20probably=20a=20good=20idea.=0D=
=0A>=20=0D=0A=0D=0A=0D=0AHi=20Juan.=0D=0A=0D=0AYes.=20This=20system_heap=20=
change=20should=20be=20changed=20for=2016KB=20page.=20Actually,=0D=0Awe=20m=
ay=20need=20to=20check=20other=20drivers=20using=20page=20order=20number.=
=20I=20guess=0D=0Agpu=20drivers=20may=20be=20one=20of=20them.=0D=0A=0D=0A>=
=20>=20---=0D=0A>=20>=20=20drivers/dma-buf/heaps/system_heap.c=20=7C=209=20=
++++++++-=0D=0A>=20>=20=201=20file=20changed,=208=20insertions(+),=201=20de=
letion(-)=0D=0A>=20>=0D=0A>=20>=20diff=20--git=20a/drivers/dma-buf/heaps/sy=
stem_heap.c=0D=0A>=20>=20b/drivers/dma-buf/heaps/system_heap.c=0D=0A>=20>=
=20index=2026d5dc89ea16..54674c02dcb4=20100644=0D=0A>=20>=20---=20a/drivers=
/dma-buf/heaps/system_heap.c=0D=0A>=20>=20+++=20b/drivers/dma-buf/heaps/sys=
tem_heap.c=0D=0A>=20>=20=40=40=20-50,8=20+50,15=20=40=40=20static=20gfp_t=
=20order_flags=5B=5D=20=3D=20=7BHIGH_ORDER_GFP,=0D=0A>=20HIGH_ORDER_GFP,=20=
LOW_ORDER_GFP=7D;=0D=0A>=20>=20=20=20*=20to=20match=20with=20the=20sizes=20=
often=20found=20in=20IOMMUs.=20Using=20order=204=20pages=0D=0A>=20instead=
=0D=0A>=20>=20=20=20*=20of=20order=200=20pages=20can=20significantly=20impr=
ove=20the=20performance=20of=20many=0D=0A>=20IOMMUs=0D=0A>=20>=20=20=20*=20=
by=20reducing=20TLB=20pressure=20and=20time=20spent=20updating=20page=20tab=
les.=0D=0A>=20>=20+=20*=0D=0A>=20>=20+=20*=20Note:=20When=20the=20order=20i=
s=200,=20the=20minimum=20allocation=20is=20PAGE_SIZE.=0D=0A>=20>=20+=20The=
=20possible=0D=0A>=20>=20+=20*=20page=20sizes=20for=20ARM=20devices=20could=
=20be=204K,=2016K=20and=2064K.=0D=0A>=20>=20=20=20*/=0D=0A>=20>=20-static=
=20const=20unsigned=20int=20orders=5B=5D=20=3D=20=7B8,=204,=200=7D;=0D=0A>=
=20>=20+=23define=20ORDER_1M=20(20=20-=20PAGE_SHIFT)=0D=0A>=20>=20+=23defin=
e=20ORDER_64K=20(16=20-=20PAGE_SHIFT)=0D=0A>=20>=20+=23define=20ORDER_FOR_P=
AGE_SIZE=20(0)=0D=0A>=20>=20+static=20const=20unsigned=20int=20orders=5B=5D=
=20=3D=20=7BORDER_1M,=20ORDER_64K,=0D=0A>=20>=20+ORDER_FOR_PAGE_SIZE=7D;=0D=
=0A>=20>=20+=0D=0A>=20>=20=20=23define=20NUM_ORDERS=20ARRAY_SIZE(orders)=0D=
=0A>=20>=0D=0A>=20>=20=20static=20struct=20sg_table=20*dup_sg_table(struct=
=20sg_table=20*table)=0D=0A>=20>=20--=0D=0A>=20>=202.49.0.604.gff1f9ca942-g=
oog=0D=0A>=20>=0D=0A=0D=0A
