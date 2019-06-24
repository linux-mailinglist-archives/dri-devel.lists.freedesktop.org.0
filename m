Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6562850EDA
	for <lists+dri-devel@lfdr.de>; Mon, 24 Jun 2019 16:43:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C83A889BFE;
	Mon, 24 Jun 2019 14:43:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com
 [210.118.77.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 99E4189BFE
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jun 2019 14:43:11 +0000 (UTC)
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id
 20190624144310euoutp0252dcc29e2464a344b0f32fe3131d34c9~rKY8KCDma1038810388euoutp02k
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jun 2019 14:43:10 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com
 20190624144310euoutp0252dcc29e2464a344b0f32fe3131d34c9~rKY8KCDma1038810388euoutp02k
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTP id
 20190624144309eucas1p147e0e2e352967d2c14d71328663aa099~rKY7Z0__f0229402294eucas1p1c;
 Mon, 24 Jun 2019 14:43:09 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
 eusmges1new.samsung.com (EUCPMTA) with SMTP id 7B.97.04298.C71E01D5; Mon, 24
 Jun 2019 15:43:09 +0100 (BST)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20190624144308eucas1p118fe74e266dd911ab02c2c47011e7db0~rKY6WWa1E0229902299eucas1p1t;
 Mon, 24 Jun 2019 14:43:08 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
 eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20190624144307eusmtrp26434c8a6912fa4bf1339ac9d5114b1b1~rKY6ILf-e3216732167eusmtrp2Q;
 Mon, 24 Jun 2019 14:43:07 +0000 (GMT)
X-AuditID: cbfec7f2-f2dff700000010ca-3f-5d10e17cf279
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
 eusmgms2.samsung.com (EUCPMTA) with SMTP id BB.7E.04140.B71E01D5; Mon, 24
 Jun 2019 15:43:07 +0100 (BST)
Received: from [106.120.51.74] (unknown [106.120.51.74]) by
 eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20190624144307eusmtip176915b64526e17b7dd8bb86f57086396~rKY5lnUDV1498914989eusmtip1A;
 Mon, 24 Jun 2019 14:43:07 +0000 (GMT)
Subject: Re: [PATCH 2/4] drm/rockchip: Enable DRM InfoFrame support on
 RK3328 and RK3399
To: Jonas Karlman <jonas@kwiboo.se>, "Laurent.pinchart@ideasonboard.com"
 <Laurent.pinchart@ideasonboard.com>
From: Andrzej Hajda <a.hajda@samsung.com>
Message-ID: <9fb2998c-dc8f-6ec1-2a87-ce7298fa966e@samsung.com>
Date: Mon, 24 Jun 2019 16:43:06 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <VI1PR03MB42062F51FD88AEB6DADD8734AC1C0@VI1PR03MB4206.eurprd03.prod.outlook.com>
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA01SbUhTYRj13b3brsvJ67T2sNJoEFSWSwi6fSAJ/bg/JIQgLBNdeVPLTdnS
 MpMCv7VsalLNnFMcaWrKcpaCGEsyTTEtc7NIS6HMtEhnaJh5vUr+O8855znveeClCNlboYKK
 015kdVp1vFIkIZtfzPftSfuEI/baUum3rh8ieunzpJAuK0qjB39PEHTX90GSns9uEtC5hVVi
 +k3rfRE9OtGOaHtBOD1v7xPQDRmqIx7MD0emmDHVpTKNn2uFTGnOPSHz0jAgYEbyOwXMorGd
 ZJ7dLCaZJ+9MBDNj9QuVnJIcjmbj45JZnSooShJb4fpCJhokl/OyesTXUQuVh9wpwPtgvKQe
 5SEJJcPVCEatk0J+mEXwKGdOxA8zCAx2m2htZbrsI8kLDxAsmWfEnCDDUwjGRpYFivLGp6Ci
 dTtH+2AtlC+aViwENpBQMxfCYRHeCYuPnSuZUhwEfbVZBLdK4u3QWLeDozfiMJhtsSLe4gVd
 98ZJDrvjCLBULRB85FZIt5WuYjkMj5cLuGqAXWJ41GtDXCbgo9A/rOHre8O3ziYxj7fAUgvn
 5/A1GKnOIPjdHAS2xhaCFw7B885+IZdDLHduaFXxdDBk/J4j+HhPcEx58RU8oaj5ziothZws
 Ge/eBiO9ttVAOVheu0QGpDSuO8y47hjjumOM/981I/IhkrNJek0Mqw/UspcC9GqNPkkbE3A2
 QWNFy3/t1d/OX0+Ra+CMHWEKKT2k5g4cIROqk/UpGjsCilD6SC3qZUoarU65wuoSInVJ8aze
 jjZTpFIuTXUbDZfhGPVF9gLLJrK6NVVAuSuuI6l7Sb/zbpeyPNFpREmnVTVBm/x7TkYd72qL
 fp/84Vh3bemC7/mhjman753M+hCTs7UoN78+/WrRLfPsXN8QjFWO3o48HvJ1b+FJy8E63w24
 6dz0nxu6sND7PgpFqMnR4Iiq/MmGuNmDD6QXJ4dmm/1UQ/77C4Z2p1w70TbcbZMoSX2sOnAX
 odOr/wFFEgb5ZwMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrDIsWRmVeSWpSXmKPExsVy+t/xu7rVDwViDU48M7W48vU9m8X/R69Z
 LeZOqrW4+v0ls8XJN1dZLH62b2Gy6Jy4hN3i8q45bBYPXu5ntDjUF23x89B5Jov1LfoOPB7v
 b7Sye8xbU+2x4dFqVo/ZHTNZPU5MuMTkcb/7OJPH31n7WTwO9E5m8dh+bR6zx+dNcgFcUXo2
 RfmlJakKGfnFJbZK0YYWRnqGlhZ6RiaWeobG5rFWRqZK+nY2Kak5mWWpRfp2CXoZC78+ZymY
 wFXR1XaGvYFxJ0cXIyeHhICJxLu591i6GLk4hASWMkqc7JnPApEQl9g9/y0zhC0s8edaFxtE
 0WtGiddn77KBJIQFoiQ23t/FCmKLCORJzLo9B6yIWWACi8S+vU+gOpqZJB7vaGACqWIT0JT4
 u/kmWDevgJ3E+dVtQCs4OFgEVCU2rNEACYsKREjM3tXAAlEiKHFy5hMwm1MgVmLpkl9gFzEL
 qEv8mXcJypaXaN46G8oWl7j1ZD7TBEahWUjaZyFpmYWkZRaSlgWMLKsYRVJLi3PTc4uN9IoT
 c4tL89L1kvNzNzECY3rbsZ9bdjB2vQs+xCjAwajEw7vgiECsEGtiWXFl7iFGCQ5mJRHepYlA
 Id6UxMqq1KL8+KLSnNTiQ4ymQL9NZJYSTc4Hppu8knhDU0NzC0tDc2NzYzMLJXHeDoGDMUIC
 6YklqdmpqQWpRTB9TBycUg2M9bLKPVF8clPYuK/svtgiZrqC49LpR5mVcfolh+4L+pmoz03i
 mpDaue4kd+Dmb3rrebbG9lulV7zo8DLMmp4+R0hAYt7paZOseA6HPXqcPauu+fAznvOXGCXc
 nD+eV36YFbxTZ8Fjc4/WzwcarVdf05tYo8cvxLPajO9A1YzJofGsgozNMaxKLMUZiYZazEXF
 iQC3tcyY/wIAAA==
X-CMS-MailID: 20190624144308eucas1p118fe74e266dd911ab02c2c47011e7db0
X-Msg-Generator: CA
X-RootMTR: 20190526212010epcas2p4c6d5ea6f812959585fcc55d2bf04ad3c
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20190526212010epcas2p4c6d5ea6f812959585fcc55d2bf04ad3c
References: <VI1PR03MB420621617DDEAB3596700DE0AC1C0@VI1PR03MB4206.eurprd03.prod.outlook.com>
 <CGME20190526212010epcas2p4c6d5ea6f812959585fcc55d2bf04ad3c@epcas2p4.samsung.com>
 <VI1PR03MB42062F51FD88AEB6DADD8734AC1C0@VI1PR03MB4206.eurprd03.prod.outlook.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=samsung.com; 
 s=mail20170921; t=1561387390;
 bh=S9RCnb2EVI6dRCJRJYmUfdHCAyIzmct1AhV9SunnKk0=;
 h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
 b=rct59tpOa5d4WE7YUzWSyZP2IUdvnCGW9tJzc2cxSuqgDx89a19ygpjJ8zTuNl+Wf
 VN0z4hSeU3pOki2eRQBrTAnmq8bvENKSb+dtPEWYHRaiEgmofBAUl4kuOHwZYki7oU
 4/y+kzMvFx0u5Nt7g6RAHYtQ5EoM92oCpZpC/rFg=
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
Cc: "jernej.skrabec@siol.net" <jernej.skrabec@siol.net>,
 "narmstrong@baylibre.com" <narmstrong@baylibre.com>,
 "maxime.ripard@bootlin.com" <maxime.ripard@bootlin.com>,
 "khilman@baylibre.com" <khilman@baylibre.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "wens@csie.org" <wens@csie.org>,
 "zhengyang@rock-chips.com" <zhengyang@rock-chips.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMjYuMDUuMjAxOSAyMzoyMCwgSm9uYXMgS2FybG1hbiB3cm90ZToKPiBUaGlzIHBhdGNoIGVu
YWJsZXMgRHluYW1pYyBSYW5nZSBhbmQgTWFzdGVyaW5nIEluZm9GcmFtZSBvbiBSSzMzMjggYW5k
IFJLMzM5OS4KPgo+IENjOiBTYW5keSBIdWFuZyA8aGpjQHJvY2stY2hpcHMuY29tPgo+IENjOiBI
ZWlrbyBTdHVlYm5lciA8aGVpa29Ac250ZWNoLmRlPgo+IFNpZ25lZC1vZmYtYnk6IEpvbmFzIEth
cmxtYW4gPGpvbmFzQGt3aWJvby5zZT4KUmV2aWV3ZWQtYnk6IEFuZHJ6ZWogSGFqZGEgPGEuaGFq
ZGFAc2Ftc3VuZy5jb20+CgrCoC0tClJlZ2FyZHMKQW5kcnplago+IC0tLQo+ICBkcml2ZXJzL2dw
dS9kcm0vcm9ja2NoaXAvZHdfaGRtaS1yb2NrY2hpcC5jIHwgMiArKwo+ICAxIGZpbGUgY2hhbmdl
ZCwgMiBpbnNlcnRpb25zKCspCj4KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3JvY2tj
aGlwL2R3X2hkbWktcm9ja2NoaXAuYyBiL2RyaXZlcnMvZ3B1L2RybS9yb2NrY2hpcC9kd19oZG1p
LXJvY2tjaGlwLmMKPiBpbmRleCA0Y2RjOWY4NmMyZTUuLjFmMzFmMzcyNmYwNCAxMDA2NDQKPiAt
LS0gYS9kcml2ZXJzL2dwdS9kcm0vcm9ja2NoaXAvZHdfaGRtaS1yb2NrY2hpcC5jCj4gKysrIGIv
ZHJpdmVycy9ncHUvZHJtL3JvY2tjaGlwL2R3X2hkbWktcm9ja2NoaXAuYwo+IEBAIC00MDUsNiAr
NDA1LDcgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBkd19oZG1pX3BsYXRfZGF0YSByazMzMjhfaGRt
aV9kcnZfZGF0YSA9IHsKPiAgCS5waHlfb3BzID0gJnJrMzMyOF9oZG1pX3BoeV9vcHMsCj4gIAku
cGh5X25hbWUgPSAiaW5ub19kd19oZG1pX3BoeTIiLAo+ICAJLnBoeV9mb3JjZV92ZW5kb3IgPSB0
cnVlLAo+ICsJLmRybV9pbmZvZnJhbWUgPSB0cnVlLAo+ICB9Owo+ICAKPiAgc3RhdGljIHN0cnVj
dCByb2NrY2hpcF9oZG1pX2NoaXBfZGF0YSByazMzOTlfY2hpcF9kYXRhID0gewo+IEBAIC00MTks
NiArNDIwLDcgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBkd19oZG1pX3BsYXRfZGF0YSByazMzOTlf
aGRtaV9kcnZfZGF0YSA9IHsKPiAgCS5jdXJfY3RyICAgID0gcm9ja2NoaXBfY3VyX2N0ciwKPiAg
CS5waHlfY29uZmlnID0gcm9ja2NoaXBfcGh5X2NvbmZpZywKPiAgCS5waHlfZGF0YSA9ICZyazMz
OTlfY2hpcF9kYXRhLAo+ICsJLmRybV9pbmZvZnJhbWUgPSB0cnVlLAo+ICB9Owo+ICAKPiAgc3Rh
dGljIGNvbnN0IHN0cnVjdCBvZl9kZXZpY2VfaWQgZHdfaGRtaV9yb2NrY2hpcF9kdF9pZHNbXSA9
IHsKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmkt
ZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6
Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
