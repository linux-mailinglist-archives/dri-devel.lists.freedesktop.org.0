Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C1AD39BD9F7
	for <lists+dri-devel@lfdr.de>; Wed,  6 Nov 2024 00:54:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 923FA10E62B;
	Tue,  5 Nov 2024 23:54:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=samsung.com header.i=@samsung.com header.b="YfC6RSr8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout3.samsung.com (mailout3.samsung.com [203.254.224.33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C25C10E04B
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Nov 2024 23:54:39 +0000 (UTC)
Received: from epcas1p1.samsung.com (unknown [182.195.41.45])
 by mailout3.samsung.com (KnoxPortal) with ESMTP id
 20241105235437epoutp03a57c58c6c925b17e01b44e7a1820a7c9~FN7PXtmWw0940409404epoutp03c
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Nov 2024 23:54:37 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com
 20241105235437epoutp03a57c58c6c925b17e01b44e7a1820a7c9~FN7PXtmWw0940409404epoutp03c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1730850877;
 bh=+0YNPE0BApDV8D9LH1clPl6cgfACiphUM10pWrK2zik=;
 h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
 b=YfC6RSr8pMJqek4b1i0i0xbRWN+GOb7iJM38rdTZW/mxQD7N/6phrRq6feVzJI3cL
 OLA3lU62mSJSthnrJcvZ9nul2XmC851uBz9hYzxRZ0m7supKfF7X6K6IxATwk2poA4
 WVm90h6PlZrrVGSQJO0yaD60PPKrWevCgr8TIpSg=
Received: from epsnrtp3.localdomain (unknown [182.195.42.164]) by
 epcas1p2.samsung.com (KnoxPortal) with ESMTP id
 20241105235436epcas1p2e04590c97bfe779e87e873d4e4e1ad2a~FN7OgGF8K0460104601epcas1p24;
 Tue,  5 Nov 2024 23:54:36 +0000 (GMT)
Received: from epsmgec1p1-new.samsung.com (unknown [182.195.38.236]) by
 epsnrtp3.localdomain (Postfix) with ESMTP id 4XjlYl3SDlz4x9Pt; Tue,  5 Nov
 2024 23:54:35 +0000 (GMT)
Received: from epcas1p3.samsung.com ( [182.195.41.47]) by
 epsmgec1p1-new.samsung.com (Symantec Messaging Gateway) with SMTP id
 43.6E.19363.B30BA276; Wed,  6 Nov 2024 08:54:35 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
 epcas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20241105235434epcas1p1069647697127465bc9f4dd832ee22271~FN7NKDP651947819478epcas1p1M;
 Tue,  5 Nov 2024 23:54:34 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
 epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20241105235434epsmtrp1aad7ef54cfaee17e5b54ac0a40f04a4f~FN7NIzozG2958329583epsmtrp1G;
 Tue,  5 Nov 2024 23:54:34 +0000 (GMT)
X-AuditID: b6c32a4c-02dff70000004ba3-50-672ab03be685
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
 epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
 08.41.35203.A30BA276; Wed,  6 Nov 2024 08:54:34 +0900 (KST)
Received: from inkidae001 (unknown [10.113.221.213]) by epsmtip1.samsung.com
 (KnoxPortal) with ESMTPA id
 20241105235434epsmtip17ee608fcfacf20d1619b46f6c0bdbf89~FN7M1kP6f3005730057epsmtip1h;
 Tue,  5 Nov 2024 23:54:34 +0000 (GMT)
From: =?UTF-8?B?64yA7J246riwL1RpemVuIFBsYXRmb3JtIExhYihTUikv7IK87ISx7KCE7J6Q?=
 <inki.dae@samsung.com>
To: "'Rob Herring'" <robh@kernel.org>
Cc: "'Kaustabh Chakraborty'" <kauschluss@disroot.org>, "'Seung-Woo Kim'"
 <sw0312.kim@samsung.com>, "'Kyungmin Park'" <kyungmin.park@samsung.com>,
 "'David	Airlie'" <airlied@gmail.com>, "'Simona Vetter'" <simona@ffwll.ch>,
 "'Krzysztof	Kozlowski'" <krzk@kernel.org>, "'Alim Akhtar'"
 <alim.akhtar@samsung.com>, "'Maarten	Lankhorst'"
 <maarten.lankhorst@linux.intel.com>, "'Maxime Ripard'" <mripard@kernel.org>,
 "'Thomas Zimmermann'" <tzimmermann@suse.de>, "'Conor Dooley'"
 <conor@kernel.org>, <dri-devel@lists.freedesktop.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-samsung-soc@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>
In-Reply-To: <CAL_JsqL62AvDEu3pmRLoV=2yFbHr_DfwsubtHbFS6cwXEhngHw@mail.gmail.com>
Subject: RE: [PATCH 0/6] Samsung Exynos 7870 DECON driver support
Date: Wed, 6 Nov 2024 08:54:34 +0900
Message-ID: <000001db2fde$10bc1b50$323451f0$@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Content-Language: ko
Thread-Index: AQETcOy7JkGSF7VbGFg+ao1ZCztJewFhWZRKAdSMimcCXGuBibQMRcpA
X-Brightmail-Tracker: H4sIAAAAAAAAA01TfUxTVxzNfW1fW0zZa2HZTWcYPHGGbnxUKHswSubGyNskS43GOMeGL+Wt
 EKCt/ZAhyewYVFEnIhqg8uEHVEQCplREViRDJyB2ldmMZRkbrDAHIgsl4KqMreXhxn/nd3LO
 O79z7308lmgSFfNy1QZap6bycTSI3XUrKjb6zasSVVyNL5QYHL2AEOMNXShx+UwrSjTe/o5D
 uBf/RInlFRdKuFxXuYSzZJZL2Dw/cIgHPXUoUeO6iRDn56+xCXO5lUP84+jmEmfn+rhETdU0
 SthnKzlvCcmh9k6E7F06xyZvWMa4pK21HCUbhnaQvx4bQMjOpkPkCXsrIDuHi8kFW5giaG9e
 Sg5NZdO6cFqt1GTnqlVyfPvOrHeyZIlx0mhpEvEGHq6mCmg5npahiE7PzffXwcMPUPlGP6Wg
 9Ho8NjVFpzEa6PAcjd4gx2ltdr5Wpo3RUwV6o1oVo6YNydK4uK0yv3BfXo5veBzVNkk+m7x3
 CZjAF1FHAZ8HsQR4YaSPfRQE8USYA8CH170oM3gBbCm1cgMqEbYEoPPwhueOifu9XEbUC+Bf
 y5fXhmkAy9wjrIAKxVRw7JgJCeBQbDMssYyvZrAwKwdOLwyufpaP7YDVtydWDSHYNrhyow4E
 MBuLhB6n278HjyfAkqCnIihACzAhHKqdZAcwC3sNWs8/YjEbhUPflJXD8KHwbLmZxeSmw5lS
 HwjkQuwwH7q8M4AxpMH6lk6UwSFwZsDOZbAYTleYuYyhCsCfR1vYzFAD4C3f6Jo7HvY1VyGB
 7VhYFOzoiWWSg+Hc4nFOgIaYAB4xixg1Du+M/LjmhPB+UyXKSEj4Va3xJIiwrKtmWVfNsq6O
 5f+sc4DdCsS0Vl+gopVSrTRaTRf+d+NKTYENrD53SUY3eNLxd0w/QHigH0AeCw8VNNBbVCJB
 NlV0kNZpsnTGfFrfD2T+865kiV9Uavz/i9qQJU1IiktI3BqfQEgTpfhLgnvuA7QIU1EGOo+m
 tbTuuQ/h8cUmZGPyourVyIGHgpJtl5avN5v/CI3odjwrPsgLm5cWByePlex7t/bm1PsVe0/V
 3c19+0r6xY17Yk4u1NuHv/x4/MNDhUXLqsjc1FdGU7fUinuqFufu7m901zdrG09PTCj5KTUv
 yzrk3cH72yRm07fTE2kYJ1P++PchxwZvYapzN+I1bxI6TZua7jxJ+yapun3qyNLOTx8VNZ8Y
 eVAqr3j2edc1+rfuOkdtJjez7WvJ5oanOj5CTSqET0XCjJmQCM8v/e0vZKCe2e8lrZUf/JSV
 vXIcjMY3dIzMP6ZMHcYyxXb+GUJmtPWfTmsz6pyfuN4rUzsmw+yDvmSjrXrX67s/umKFe3C2
 PoeSSlg6PfUvhSPdYHcEAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrFIsWRmVeSWpSXmKPExsWy7bCSnK7VBq10g6s3TSxOXF/EZPFg3jY2
 i5VTV7FZzD9yjtXiytf3bBZ//p1nszh/fgO7xdmmN+wWmx5fY7W4vGsOm8WM8/uYLBZ+3Mpi
 0da5jNXi/54d7Baz3+1nt5gx+SWbxZY3E1kdBD1OrtvM5LH32wIWj52z7rJ7bFrVyeYx72Sg
 x/3u40wem5fUe/RtWcXosfl0tcfnTXIBXFFcNimpOZllqUX6dglcGSvW/mcp2CdXcW/nYpYG
 xk7JLkZODgkBE4mHF/aydzFycQgJ7GaUWNO4jqWLkQMoISGxZSsHhCkscfhwMUTJc0aJ32dW
 sID0sgmkStz49JEdxBYRUJVomvWABaSIWWATq8Tp9nYmiI5OJokrH18xglRxCgRKTD/ykBnE
 FhZwlPi3cw5YnEVAReLx2StsINt4BSwlHvdzgYR5BQQlTs58AraMWUBbovdhKyOMvWzha2aI
 BxQkfj5dxgoRF5GY3dnGDHGQm8Srlp+MExiFZyEZNQvJqFlIRs1C0r6AkWUVo2RqQXFuem6x
 YYFhXmq5XnFibnFpXrpecn7uJkZwdGtp7mDcvuqD3iFGJg7GQ4wSHMxKIrzzUtXThXhTEiur
 Uovy44tKc1KLDzFKc7AoifOKv+hNERJITyxJzU5NLUgtgskycXBKNTDN3f1l2t0TW+Zqnplx
 +HfJqqANv7rn1E+x0zyysnCL1Ale8yQupkJb2yc2bx8c4758LvBo+LVPmUJtS0z0S6Mm9S+J
 tlA5vaT4L29e3O1OywW7XNpL53yewqkdYDF3IY9HfGGX6ZnT+sf5PR3XiKxiv6KsUWrc0ypZ
 sZBnRVVk923ZRboH7Xd/61RlYu/3WM+c9l+/6LHB/fMnbRq4UiNnTnn3Wjh3xjSVct348AvT
 3u9m0p3Xf5B/mlZykWTcJSdGXXX/aSWWfA5bLLjky8WT0tT43i/ZonZrtd7JB5XJYrO2vW29
 rtCt+Mbjw9/mliMWtzK+h9vvfsswafXnAC7NbdOTflf+39X18YDuayklluKMREMt5qLiRACh
 MxUQXQMAAA==
X-CMS-MailID: 20241105235434epcas1p1069647697127465bc9f4dd832ee22271
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 101P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20240919151130epcas1p10a885b3364250f5ff4e06975cfef13e4
References: <CGME20240919151130epcas1p10a885b3364250f5ff4e06975cfef13e4@epcas1p1.samsung.com>
 <20240919-exynosdrm-decon-v1-0-6c5861c1cb04@disroot.org>
 <000001db2c1c$12e86c50$38b944f0$@samsung.com>
 <CAL_JsqL62AvDEu3pmRLoV=2yFbHr_DfwsubtHbFS6cwXEhngHw@mail.gmail.com>
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

Hi Rob Herring,

> -----Original Message-----
> From: Rob Herring <robh=40kernel.org>
> Sent: Wednesday, November 6, 2024 5:11 AM
> To: =EB=8C=80=EC=9D=B8=EA=B8=B0/Tizen=20Platform=20Lab(SR)/=EC=82=BC=EC=
=84=B1=EC=A0=84=EC=9E=90=20<inki.dae=40samsung.com>=0D=0A>=20Cc:=20Kaustabh=
=20Chakraborty=20<kauschluss=40disroot.org>;=20Seung-Woo=20Kim=0D=0A>=20<sw=
0312.kim=40samsung.com>;=20Kyungmin=20Park=20<kyungmin.park=40samsung.com>;=
=20David=0D=0A>=20Airlie=20<airlied=40gmail.com>;=20Simona=20Vetter=20<simo=
na=40ffwll.ch>;=20Krzysztof=0D=0A>=20Kozlowski=20<krzk=40kernel.org>;=20Ali=
m=20Akhtar=20<alim.akhtar=40samsung.com>;=0D=0A>=20Maarten=20Lankhorst=20<m=
aarten.lankhorst=40linux.intel.com>;=20Maxime=20Ripard=0D=0A>=20<mripard=40=
kernel.org>;=20Thomas=20Zimmermann=20<tzimmermann=40suse.de>;=20Conor=0D=0A=
>=20Dooley=20<conor=40kernel.org>;=20dri-devel=40lists.freedesktop.org;=20l=
inux-arm-=0D=0A>=20kernel=40lists.infradead.org;=20linux-samsung-soc=40vger=
.kernel.org;=20linux-=0D=0A>=20kernel=40vger.kernel.org;=20devicetree=40vge=
r.kernel.org=0D=0A>=20Subject:=20Re:=20=5BPATCH=200/6=5D=20Samsung=20Exynos=
=207870=20DECON=20driver=20support=0D=0A>=20=0D=0A>=20On=20Fri,=20Nov=201,=
=202024=20at=2012:08=E2=80=AFAM=20=EB=8C=80=EC=9D=B8=EA=B8=B0/Tizen=20Platf=
orm=20Lab(SR)/=EC=82=BC=EC=84=B1=EC=A0=84=EC=9E=90=0D=0A>=20<inki.dae=40sam=
sung.com>=20wrote:=0D=0A>=20>=0D=0A>=20>=20Hi=20Kaustabh=20Chakraborty,=0D=
=0A>=20>=0D=0A>=20>=20Sorry=20for=20late.=0D=0A>=20>=0D=0A>=20>=20>=20-----=
Original=20Message-----=0D=0A>=20>=20>=20From:=20Kaustabh=20Chakraborty=20<=
kauschluss=40disroot.org>=0D=0A>=20>=20>=20Sent:=20Friday,=20September=2020=
,=202024=2012:11=20AM=0D=0A>=20>=20>=20To:=20Inki=20Dae=20<inki.dae=40samsu=
ng.com>;=20Seung-Woo=20Kim=0D=0A>=20>=20>=20<sw0312.kim=40samsung.com>;=20K=
yungmin=20Park=20<kyungmin.park=40samsung.com>;=0D=0A>=20David=0D=0A>=20>=
=20>=20Airlie=20<airlied=40gmail.com>;=20Simona=20Vetter=20<simona=40ffwll.=
ch>;=20Krzysztof=0D=0A>=20>=20>=20Kozlowski=20<krzk=40kernel.org>;=20Alim=
=20Akhtar=20<alim.akhtar=40samsung.com>;=0D=0A>=20>=20>=20Maarten=20Lankhor=
st=20<maarten.lankhorst=40linux.intel.com>;=20Maxime=20Ripard=0D=0A>=20>=20=
>=20<mripard=40kernel.org>;=20Thomas=20Zimmermann=20<tzimmermann=40suse.de>=
;=20Rob=0D=0A>=20Herring=0D=0A>=20>=20>=20<robh=40kernel.org>;=20Conor=20Do=
oley=20<conor=40kernel.org>=0D=0A>=20>=20>=20Cc:=20dri-devel=40lists.freede=
sktop.org;=20linux-arm-=0D=0A>=20kernel=40lists.infradead.org;=0D=0A>=20>=
=20>=20linux-samsung-soc=40vger.kernel.org;=20linux-kernel=40vger.kernel.or=
g;=0D=0A>=20>=20>=20devicetree=40vger.kernel.org;=20Kaustabh=20Chakraborty=
=0D=0A>=20<kauschluss=40disroot.org>=0D=0A>=20>=20>=20Subject:=20=5BPATCH=
=200/6=5D=20Samsung=20Exynos=207870=20DECON=20driver=20support=0D=0A>=20>=
=20>=0D=0A>=20>=20>=20This=20patch=20series=20aims=20at=20adding=20support=
=20for=20Exynos7870's=20DECON=20in=20the=0D=0A>=20>=20>=20Exynos7=20DECON=
=20driver.=20It=20introduces=20a=20driver=20data=20struct=20so=20that=0D=0A=
>=20support=0D=0A>=20>=20>=20for=20DECON=20on=20other=20SoCs=20can=20be=20a=
dded=20to=20it=20in=20the=20future.=0D=0A>=20>=20>=0D=0A>=20>=20>=20It=20al=
so=20fixes=20a=20few=20bugs=20in=20the=20driver,=20such=20as=20functions=20=
recieving=0D=0A>=20bad=0D=0A>=20>=20>=20pointers.=0D=0A>=20>=20>=0D=0A>=20>=
=20>=20Tested=20on=20Samsung=20Galaxy=20J7=20Prime=20and=20Samsung=20Galaxy=
=20A2=20Core.=0D=0A>=20>=20>=0D=0A>=20>=20>=20Signed-off-by:=20Kaustabh=20C=
hakraborty=20<kauschluss=40disroot.org>=0D=0A>=20>=20>=20---=0D=0A>=20>=20>=
=20Kaustabh=20Chakraborty=20(6):=0D=0A>=20>=20>=20=20=20=20=20=20=20drm/exy=
nos:=20exynos7_drm_decon:=20fix=20uninitialized=20crtc=20reference=0D=0A>=
=20in=0D=0A>=20>=20>=20functions=0D=0A>=20>=20>=20=20=20=20=20=20=20drm/exy=
nos:=20exynos7_drm_decon:=20fix=20suspended=20condition=20in=0D=0A>=20>=20>=
=20decon_commit()=0D=0A>=20>=20>=20=20=20=20=20=20=20drm/exynos:=20exynos7_=
drm_decon:=20fix=20ideal_clk=20by=20converting=20it=20to=0D=0A>=20Hz=0D=0A>=
=20>=20>=20=20=20=20=20=20=20drm/exynos:=20exynos7_drm_decon:=20properly=20=
clear=20channels=20during=0D=0A>=20bind=0D=0A>=20>=20>=20=20=20=20=20=20=20=
drm/exynos:=20exynos7_drm_decon:=20add=20driver=20data=20and=20support=20fo=
r=0D=0A>=20>=20>=20Exynos7870=0D=0A>=20>=20>=20=20=20=20=20=20=20dt-binding=
s:=20display:=20samsung,exynos7-decon:=20add=20exynos7870=0D=0A>=20>=20>=20=
compatible=0D=0A>=20>=0D=0A>=20>=20I=20will=20apply=20all=20except=20for=20=
the=20two=20patches=20below,=0D=0A>=20>=20=5BPATCH=202/6=5D=20drm/exynos:=
=20exynos7_drm_decon:=20fix=20suspended=20condition=20in=0D=0A>=20decon_com=
mit()=0D=0A>=20>=20=5BPATCH=206/6=5D=20dt-bindings:=20display:=20samsung,ex=
ynos7-decon:=20add=20exynos7870=0D=0A>=20compatible=0D=0A>=20=0D=0A>=20Now=
=20we=20have=20a=20warning=20in=20linux-next=20that=20samsung,exynos7870-de=
con=20is=0D=0A>=20not=20documented.=0D=0A>=20=0D=0A>=20Please=20apply=20the=
=20binding=20patch.=20Or=20let=20me=20know=20if=20it=20missed=206.13=20for=
=0D=0A>=20DRM=20tree=20and=20I'll=20apply=20it.=0D=0A>=20=0D=0A=0D=0AAh...=
=20sorry=20for=20this.=20I=20didn't=20check=20the=20warning.=20Will=20apply=
=20the=20binding=20patch.=20I=20was=20awaiting=20the=20submission=20of=20DT=
S.=0D=0A=0D=0AThanks,=0D=0AInki=20Dae=0D=0A=0D=0A>=20Rob=0D=0A=0D=0A=0D=0A
