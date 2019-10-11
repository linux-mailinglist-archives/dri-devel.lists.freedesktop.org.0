Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CA934D3939
	for <lists+dri-devel@lfdr.de>; Fri, 11 Oct 2019 08:13:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB2B36E14F;
	Fri, 11 Oct 2019 06:12:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com
 [210.118.77.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 421DC6E14F
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Oct 2019 06:12:58 +0000 (UTC)
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20191011061256euoutp01edd0fad5bda00f5bbc192cafd708511b~MgvkSkx5U2961429614euoutp015
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Oct 2019 06:12:56 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20191011061256euoutp01edd0fad5bda00f5bbc192cafd708511b~MgvkSkx5U2961429614euoutp015
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTP id
 20191011061255eucas1p147055b1a6c8c3ce9bcc67fd4fdc23cab~MgvjwMMpp2546625466eucas1p1G;
 Fri, 11 Oct 2019 06:12:55 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
 eusmges3new.samsung.com (EUCPMTA) with SMTP id 67.18.04374.76D10AD5; Fri, 11
 Oct 2019 07:12:55 +0100 (BST)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20191011061255eucas1p264f567f307d35aba723ce008d14147c0~MgvjasKWm2882228822eucas1p2j;
 Fri, 11 Oct 2019 06:12:55 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
 eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20191011061255eusmtrp23eac7f98043aef9e24e7789f84a64933~MgvjZ-m633227932279eusmtrp2H;
 Fri, 11 Oct 2019 06:12:55 +0000 (GMT)
X-AuditID: cbfec7f5-4ddff70000001116-f8-5da01d67f5a3
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
 eusmgms2.samsung.com (EUCPMTA) with SMTP id 67.EA.04117.76D10AD5; Fri, 11
 Oct 2019 07:12:55 +0100 (BST)
Received: from [106.120.51.74] (unknown [106.120.51.74]) by
 eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20191011061254eusmtip1c0643197afb588d6c9f765ab14d367fd~MgviyY5Q42292522925eusmtip1P;
 Fri, 11 Oct 2019 06:12:54 +0000 (GMT)
Subject: Re: [PATCH v2 0/2] Add initial support for slimport anx7625
To: Xin Ji <xji@analogixsemi.com>, "devel@driverdev.osuosl.org"
 <devel@driverdev.osuosl.org>, Laurent Pinchart
 <laurent.pinchart@ideasonboard.com>
From: Andrzej Hajda <a.hajda@samsung.com>
Message-ID: <1544211b-d2c7-601c-93b3-a130178b8697@samsung.com>
Date: Fri, 11 Oct 2019 08:12:53 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <cover.1570760115.git.xji@analogixsemi.com>
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA01Sa1BMYRju2++c3bM7dufYMvtOorEzKEMYZhyDpmb6cf4wTDFoGp04itrK
 Hov4YaNMJV1EabsyqpXcSlFDyzaslbuaiZCZ3Gs12S5KSruH0b/nfd7nvTzvvBRW95De1K74
 vbw+novTShVEw/2Rp4uiZ5VHLHmQtYA58cQuYXrGCwhmoiEXM7cejcqYtsE+KXOxzUww7cNf
 MWPvbSeY9NzzMuZlU7GUsWaFM58uVZBM6dufOEjJltxuwmxfR6qMLTI+J9h3zS0Ee3uonGCL
 0gpJ9kHOCwl7Y+g9yXYdt0nY/o+vCfbOiTyCddbOXj9tq2L1Dj5u1z5evzgwUhEz+igLJ5Yo
 DtjGh7ER9ckykJwCejmkd5eQGUhBqWkzgrb004QYDCA4VpsqEQMngpQBpzQDUe4S+zsvka9C
 kDFqRWLgQFB3tBK7+nrSIWD8ki1zJbzofATXuofcrTBtwWDtP0u6VFLaH37XvZK6sJIOBGOV
 080T9FxI/WQmXeNm0JuhdZATJdPBXviBcGE5zUB+9RG3HNO+cMNRjEWsgdcfytyzgC6kwHIv
 jxSdhkDBKzMSsSd8s13/ewEfmGh0FbjwYegyp2CxOA1B/dVGLCZWQYvtuXshPLn0labFIh0M
 zyx1SDyLCjoc08UdVHCyoQCLtBLSjqlF9Rzoelz/t6EGKp4NSnOQ1jTFmWmKG9MUN6b/c8sR
 UY00vEHQRfPCsnh+f4DA6QRDfHTA9gRdLZp8wdZx2+BN1DwWZUU0hbTTlGd8yyLUJLdPSNJZ
 EVBY66U8ZyqOUCt3cEkHeX3CNr0hjhesaCZFaDXKQx7vw9V0NLeXj+X5RF7/Lyuh5N5G9NCn
 s9Ehz8/OLgntDlvo+cPHsLbKu9TIlYYmO150xspbNgSrTIJi5orEjSM5QZkrv2+b57Mn+bzA
 +l02JFlio5L9/APQlsgZOz/Pb07OvOCosviq6iplu9eF6TaNOU95nEm4W9M2d+eat/rw+o5f
 rbEm05vDmrAfRcG1Nb0x+5+otIQQwy1dgPUC9wcCV3Y6fgMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrHIsWRmVeSWpSXmKPExsVy+t/xu7rpsgtiDQ5OFLHoPXeSyeL1v+ks
 Fv+3TWS22HPmF7vFla/v2SxWX1nBYnH1+0tmi5NvrrJYdE5cwm5xedccNotDfdEWz9YuZbWY
 d/cHswOvx9y9u5g93t9oZfeY3XCRxePevsMsHnu/LWDxmN0xk9XjxIRLTB7bvz1g9bjffZzJ
 4+PTWyweB3ons3h83iQXwBOlZ1OUX1qSqpCRX1xiqxRtaGGkZ2hpoWdkYqlnaGwea2VkqqRv
 Z5OSmpNZllqkb5egl/HrTB9zwVyuiuP/vjM3ML5n72Lk4JAQMJE4eU+ki5GTQ0hgKaPEz4ex
 ILaEgLjE7vlvmSFsYYk/17rYuhi5gGpeM0r8OPODFSQhLOAi0fCinx0kISIwjVFiw9TXzCAO
 s8BBZomHE/4wQ7R0M0rMfnaHDaSFTUBT4u/mm2A2r4CdRMPyz2CjWARUJVqfrQCzRQUiJJ5v
 v8EIUSMocXLmExYQm1PAQmLaqiawGmYBdYk/8y4xQ9jyEtvfzoGyxSVuPZnPNIFRaBaS9llI
 WmYhaZmFpGUBI8sqRpHU0uLc9NxiI73ixNzi0rx0veT83E2MwLjfduznlh2MXe+CDzEKcDAq
 8fDOkJ8fK8SaWFZcmXuIUYKDWUmEd9GsObFCvCmJlVWpRfnxRaU5qcWHGE2BnpvILCWanA9M
 SXkl8YamhuYWlobmxubGZhZK4rwdAgdjhATSE0tSs1NTC1KLYPqYODilGhirF7B95Gh32aWo
 bffS+tu6nAXL1vUvtK+7P/WHa9fKa367b0cfXdDQZ6bCmSBVzcKVzvfpR/YK9fXZD6S8E9oX
 um/hlYi6IbIxznXB0sdNl0/JK93p1V/xS2lT6GYPra8n17RMDPxxyJH/AHfVFYO4F5eVNS6w
 mfHW7eqb+nbxcWmVWcUm1YuUWIozEg21mIuKEwGisOoEEQMAAA==
X-CMS-MailID: 20191011061255eucas1p264f567f307d35aba723ce008d14147c0
X-Msg-Generator: CA
X-RootMTR: 20191011022055epcas5p37790ed31cbe63d0be0f6b5786ce1392a
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20191011022055epcas5p37790ed31cbe63d0be0f6b5786ce1392a
References: <CGME20191011022055epcas5p37790ed31cbe63d0be0f6b5786ce1392a@epcas5p3.samsung.com>
 <cover.1570760115.git.xji@analogixsemi.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=samsung.com; 
 s=mail20170921; t=1570774376;
 bh=BFlpL/9spCtVhk+j4FpstZKi3lH6fRukIoRfiZqbsYM=;
 h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
 b=RioP0gsDSl3g7CxJ/FwuIsN46YiMhQRBqnjT+XZEz0NXTrk/+56mJhecVow7o2igu
 7mJUHOL3qEyIRxJzPKrRIDtV1K4Lfg4cF3+K6fJpe9KkB+r3URf38eY4aMTAQuRSNV
 TEd//DLlajASDQWnRQKVQsRX00GgoCLXjfAIhaHQ=
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
Cc: Jernej Skrabec <jernej.skrabec@siol.net>,
 Nicolas Boichat <drinkcat@chromium.org>, Jonas Karlman <jonas@kwiboo.se>,
 David Airlie <airlied@linux.ie>, Neil Armstrong <narmstrong@baylibre.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Sheng Pan <span@analogixsemi.com>, Dan Carpenter <dan.carpenter@oracle.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMTEuMTAuMjAxOSAwNDoyMCwgWGluIEppIHdyb3RlOgo+IEhpIGFsbCwKPgo+IFRoZSBmb2xs
b3dpbmcgc2VyaWVzIGFkZCBpbml0aWFsIHN1cHBvcnQgZm9yIHRoZSBTbGltcG9ydCBBTlg3NjI1
IHRyYW5zbWl0dGVyLCBhCj4gdWx0cmEtbG93IHBvd2VyIEZ1bGwtSEQgNEsgTUlQSSB0byBEUCB0
cmFuc21pdHRlciBkZXNpZ25lZCBmb3IgcG9ydGFibGUgZGV2aWNlLgo+Cj4gVGhpcyBpcyB0aGUg
aW5pdGlhbCB2ZXJzaW9uLCBhbnkgbWlzdGFrZXMsIHBsZWFzZSBsZXQgbWUga25vdywgSSB3aWxs
IGZpeCBpdCBpbgo+IHRoZSBuZXh0IHNlcmllcy4KPgo+IFRoYW5rcywKPiBYaW4KCgpOZXh0IHRp
bWUgcGxlYXNlIGluY3JlbWVudCBwYXRjaHNldCB2ZXJzaW9uIG51bWJlciAtIHRoaXMgaXMgdGhp
cmQKaXRlcmF0aW9uIG9mIHYyLgoKClJlZ2FyZHMKCkFuZHJ6ZWoKCgo+Cj4KPiBYaW4gSmkgKDIp
Ogo+ICAgZHQtYmluZGluZ3M6IGRybS9icmlkZ2U6IGFueDc2MjU6IE1JUEkgdG8gRFAgdHJhbnNt
aXR0ZXIgYmluZGluZwo+ICAgZHJtL2JyaWRnZTogYW54NzYyNTogQWRkIGFueDc2MjUgTUlQSSBE
U0kvRFBJIHRvIERQIGJyaWRnZSBkcml2ZXIKPgo+ICAuLi4vYmluZGluZ3MvZGlzcGxheS9icmlk
Z2UvYW54NzYyNS55YW1sICAgICAgICAgICB8ICAgOTYgKwo+ICBkcml2ZXJzL2dwdS9kcm0vYnJp
ZGdlL01ha2VmaWxlICAgICAgICAgICAgICAgICAgICB8ICAgIDIgKy0KPiAgZHJpdmVycy9ncHUv
ZHJtL2JyaWRnZS9hbmFsb2dpeC9LY29uZmlnICAgICAgICAgICAgfCAgICA2ICsKPiAgZHJpdmVy
cy9ncHUvZHJtL2JyaWRnZS9hbmFsb2dpeC9NYWtlZmlsZSAgICAgICAgICAgfCAgICAxICsKPiAg
ZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9hbmFsb2dpeC9hbng3NjI1LmMgICAgICAgICAgfCAyMTUz
ICsrKysrKysrKysrKysrKysrKysrCj4gIGRyaXZlcnMvZ3B1L2RybS9icmlkZ2UvYW5hbG9naXgv
YW54NzYyNS5oICAgICAgICAgIHwgIDQwNiArKysrCj4gIDYgZmlsZXMgY2hhbmdlZCwgMjY2MyBp
bnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCj4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBEb2N1bWVu
dGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9icmlkZ2UvYW54NzYyNS55YW1sCj4g
IGNyZWF0ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL2dwdS9kcm0vYnJpZGdlL2FuYWxvZ2l4L2FueDc2
MjUuYwo+ICBjcmVhdGUgbW9kZSAxMDA2NDQgZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9hbmFsb2dp
eC9hbng3NjI1LmgKPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRl
dmVs
