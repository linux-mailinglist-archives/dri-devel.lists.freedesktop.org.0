Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C14024D36
	for <lists+dri-devel@lfdr.de>; Tue, 21 May 2019 12:52:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2263589199;
	Tue, 21 May 2019 10:52:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com
 [210.118.77.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D6FD89199
 for <dri-devel@lists.freedesktop.org>; Tue, 21 May 2019 10:52:20 +0000 (UTC)
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id
 20190521105219euoutp0209de65382ff5a4df6583fcee5c4a4c97~grTrISoyV1479414794euoutp02N
 for <dri-devel@lists.freedesktop.org>; Tue, 21 May 2019 10:52:19 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com
 20190521105219euoutp0209de65382ff5a4df6583fcee5c4a4c97~grTrISoyV1479414794euoutp02N
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTP id
 20190521105218eucas1p223bcb596e0f5151933429035226d649c~grTqvaKul3024630246eucas1p2B;
 Tue, 21 May 2019 10:52:18 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
 eusmges1new.samsung.com (EUCPMTA) with SMTP id CE.05.04298.268D3EC5; Tue, 21
 May 2019 11:52:18 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20190521105217eucas1p19796d2969c1a568fecb0750818226241~grTp_qUlh0212202122eucas1p1L;
 Tue, 21 May 2019 10:52:17 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20190521105217eusmtrp10af3bb8c9b7bf448b194ab3dfa026eef~grTpvH-dp1584715847eusmtrp1S;
 Tue, 21 May 2019 10:52:17 +0000 (GMT)
X-AuditID: cbfec7f2-f13ff700000010ca-79-5ce3d86229b6
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
 eusmgms2.samsung.com (EUCPMTA) with SMTP id DA.F4.04140.168D3EC5; Tue, 21
 May 2019 11:52:17 +0100 (BST)
Received: from [106.120.51.71] (unknown [106.120.51.71]) by
 eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20190521105217eusmtip13906abf5ab5422044daf75a93ee3213b~grTpZV8cU2619726197eusmtip1F;
 Tue, 21 May 2019 10:52:17 +0000 (GMT)
From: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Subject: [PATCH v2] video: fbdev: atmel_lcdfb: add COMPILE_TEST support
To: Nicolas Ferre <nicolas.ferre@microchip.com>
Message-ID: <f9d56fc1-3e02-9716-b764-82e9600e5919@samsung.com>
Date: Tue, 21 May 2019 12:52:17 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrBKsWRmVeSWpSXmKPExsWy7djP87pJNx7HGFz7LmLR/m4Zu8WVr+/Z
 LDY9vsZqcaLvA6vF5V1z2CxerL3OarF980JmB3aPeWuqPe53H2fy2Lyk3uPOj6WMHp83yQWw
 RnHZpKTmZJalFunbJXBlbL62kqVgNlvFmy8rmBsYZ7N2MXJySAiYSJy8d5Spi5GLQ0hgBaPE
 8msTmCGcL4wSO9dNZAGpEhL4zCjRdtAPpmPh+ensEPHljBLHbopBNLxllDjw6TfYWDYBK4mJ
 7asYQWxhAXeJOY33gFZwcIgI6Ev86VIEqWcW+MQo0T5rLVgNr4CdxNRzO9hAbBYBVYnJP6aB
 zREViJC4f2wDK0SNoMTJmU/ADmIWEJe49WQ+E4QtL7H97RywqyUEprNLnF54ixniUheJL22v
 2CFsYYlXx7dA2TISpyf3sEA0rGOU+NvxAqp7OzAAJv9jg6iyljh8/CIryNnMApoS63fpQ4Qd
 JV48/MkIEpYQ4JO48VYQ4gg+iUnbpjNDhHklOtqEIKrVJDYs28AGs7Zr50qo0zwk3qz4xz6B
 UXEWktdmIXltFpLXZiHcsICRZRWjeGppcW56arFhXmq5XnFibnFpXrpecn7uJkZg+jn97/in
 HYxfLyUdYhTgYFTi4c2Y8ihGiDWxrLgy9xCjBAezkgjv6VNAId6UxMqq1KL8+KLSnNTiQ4zS
 HCxK4rzVDA+ihQTSE0tSs1NTC1KLYLJMHJxSDYzsulFGexkWLFRn4yw+x3/z5KOqUqcapTi7
 GPYDdezTA5ds7teOvLG2+NrbMP+lfz5omq6M8mubu+HUg4WbWvY8k34Yd/1vRLWNkd3TdL39
 F/09vOTy3wRZhfpM3jUnnv91xffGx++2iXxuLepr/BbHk2rSdShL6rBVmNa88BkNsqfWPuxt
 V1JiKc5INNRiLipOBAA6lT9SOwMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrEIsWRmVeSWpSXmKPExsVy+t/xu7qJNx7HGLxskLdof7eM3eLK1/ds
 FpseX2O1ONH3gdXi8q45bBYv1l5ntdi+eSGzA7vHvDXVHve7jzN5bF5S73Hnx1JGj8+b5AJY
 o/RsivJLS1IVMvKLS2yVog0tjPQMLS30jEws9QyNzWOtjEyV9O1sUlJzMstSi/TtEvQyNl9b
 yVIwm63izZcVzA2Ms1m7GDk5JARMJBaen87excjFISSwlFHi26ajjF2MHEAJGYnj68sgaoQl
 /lzrYoOoec0osaN1AxNIgk3ASmJi+ypGEFtYwF1iTuM9JpBeEQF9iT9diiD1zAKfGCV+PW8H
 q+EVsJOYem4HG4jNIqAqMfnHNLAjRAUiJM68X8ECUSMocXLmEzCbWUBd4s+8S8wQtrjErSfz
 mSBseYntb+cwT2AUmIWkZRaSlllIWmYhaVnAyLKKUSS1tDg3PbfYSK84Mbe4NC9dLzk/dxMj
 MH62Hfu5ZQdj17vgQ4wCHIxKPLwZUx7FCLEmlhVX5h5ilOBgVhLhPX0KKMSbklhZlVqUH19U
 mpNafIjRFOihicxSosn5wNjOK4k3NDU0t7A0NDc2NzazUBLn7RA4GCMkkJ5YkpqdmlqQWgTT
 x8TBKdXA2Ljyua/uNWaHaZsOxvNvPSk/e5V3/nYjS4dyhT0Cse97nmYk6N9JOO78O9ljWm4m
 L8+a4/XcGtHrf0/ROz8pfOf9T04dS3+tVp+rtnv1br5FAvOYQhMkFkxdt44ht599/vbkoLnq
 6SY1Ly0uXPO41/pxukmOxP0J1l9VrcoNZAOLc4032ZpqKbEUZyQaajEXFScCADhftqO1AgAA
X-CMS-MailID: 20190521105217eucas1p19796d2969c1a568fecb0750818226241
X-Msg-Generator: CA
X-RootMTR: 20190521105217eucas1p19796d2969c1a568fecb0750818226241
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20190521105217eucas1p19796d2969c1a568fecb0750818226241
References: <CGME20190521105217eucas1p19796d2969c1a568fecb0750818226241@eucas1p1.samsung.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=samsung.com; 
 s=mail20170921; t=1558435939;
 bh=a4rhZ7HDvqEXTse02KOkCIPOpiX/GoXFahUQjVRjFLg=;
 h=From:Subject:To:Cc:Date:References:From;
 b=NcJ+cu+aKZ3+h5RKQrrpUzr0mvBakOdHXoTYYtfxF609Eqv5N1Hq3heFaFm0fh2ue
 VqxXojXBwlTfohpZlVBgeciVnvatgkSCgS+Asv/O8xtuRLa0i84KjiP2nkR6XD0DFr
 WYeMXfZGd+8uIbNGoTbsK8ze1nmOqMFXuYYbM17U=
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Ludovic Desroches <ludovic.desroches@microchip.com>,
 linux-fbdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QWRkIENPTVBJTEVfVEVTVCBzdXBwb3J0IHRvIGF0bWVsX2xjZGZiIGRyaXZlciBmb3IgYmV0dGVy
IGNvbXBpbGUKdGVzdGluZyBjb3ZlcmFnZS4KClNpZ25lZC1vZmYtYnk6IEJhcnRsb21pZWogWm9s
bmllcmtpZXdpY3ogPGIuem9sbmllcmtpZUBzYW1zdW5nLmNvbT4KLS0tCnYyOiBhZGQgbWlzc2lu
ZyBIQVZFX0NMSyAmJiBIQVMgSU9NRU0gZGVwZW5kZW5jaWVzCgogZHJpdmVycy92aWRlby9mYmRl
di9LY29uZmlnIHwgICAgMyArKy0KIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDEg
ZGVsZXRpb24oLSkKCkluZGV4OiBiL2RyaXZlcnMvdmlkZW8vZmJkZXYvS2NvbmZpZwo9PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09Ci0tLSBhL2RyaXZlcnMvdmlkZW8vZmJkZXYvS2NvbmZpZworKysgYi9kcml2ZXJzL3ZpZGVv
L2ZiZGV2L0tjb25maWcKQEAgLTg1Niw3ICs4NTYsOCBAQCBjb25maWcgRkJfUzFEMTNYWFgKIAog
Y29uZmlnIEZCX0FUTUVMCiAJdHJpc3RhdGUgIkFUOTEgTENEIENvbnRyb2xsZXIgc3VwcG9ydCIK
LQlkZXBlbmRzIG9uIEZCICYmIE9GICYmIEhBVkVfRkJfQVRNRUwKKwlkZXBlbmRzIG9uIEZCICYm
IE9GICYmIEhBVkVfQ0xLICYmIEhBU19JT01FTQorCWRlcGVuZHMgb24gSEFWRV9GQl9BVE1FTCB8
fCBDT01QSUxFX1RFU1QKIAlzZWxlY3QgRkJfQkFDS0xJR0hUCiAJc2VsZWN0IEZCX0NGQl9GSUxM
UkVDVAogCXNlbGVjdCBGQl9DRkJfQ09QWUFSRUEKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4v
bGlzdGluZm8vZHJpLWRldmVs
