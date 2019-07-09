Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D5A54637F5
	for <lists+dri-devel@lfdr.de>; Tue,  9 Jul 2019 16:33:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B6CB46E069;
	Tue,  9 Jul 2019 14:33:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com
 [210.118.77.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B8FEF6E069
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Jul 2019 14:33:00 +0000 (UTC)
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id
 20190709143259euoutp02bf9951d76abcc36369aa545e148fbde7~vw7Vpj1uL2293322933euoutp02P
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Jul 2019 14:32:59 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com
 20190709143259euoutp02bf9951d76abcc36369aa545e148fbde7~vw7Vpj1uL2293322933euoutp02P
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTP id
 20190709143258eucas1p2731cedd3ee1b3ba2a69b4fafb47e06eb~vw7VBYU9s2641726417eucas1p23;
 Tue,  9 Jul 2019 14:32:58 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
 eusmges3new.samsung.com (EUCPMTA) with SMTP id 32.E5.04325.A95A42D5; Tue,  9
 Jul 2019 15:32:58 +0100 (BST)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20190709143258eucas1p16d402a7f3b160503997a3118a9500ba2~vw7UT8UnC2341523415eucas1p1H;
 Tue,  9 Jul 2019 14:32:58 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
 eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20190709143257eusmtrp206ed2dc8c4e27ff7c0d5f6a615453b8d~vw7UF13yW0900609006eusmtrp23;
 Tue,  9 Jul 2019 14:32:57 +0000 (GMT)
X-AuditID: cbfec7f5-b75ff700000010e5-de-5d24a59a5ba3
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
 eusmgms1.samsung.com (EUCPMTA) with SMTP id 42.B9.04146.995A42D5; Tue,  9
 Jul 2019 15:32:57 +0100 (BST)
Received: from [106.120.51.74] (unknown [106.120.51.74]) by
 eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20190709143257eusmtip17f20f1e9adffff237829e12a42147e26~vw7TsYHZY3080730807eusmtip13;
 Tue,  9 Jul 2019 14:32:57 +0000 (GMT)
Subject: Re: [PATCH 07/60] drm/bridge: simple-bridge: Add support for the TI
 OP362
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 dri-devel@lists.freedesktop.org
From: Andrzej Hajda <a.hajda@samsung.com>
Message-ID: <619bbaf8-148a-696a-b6ea-316f3a954dd1@samsung.com>
Date: Tue, 9 Jul 2019 16:32:56 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.0
MIME-Version: 1.0
In-Reply-To: <20190707181937.6250-4-laurent.pinchart@ideasonboard.com>
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrLKsWRmVeSWpSXmKPExsWy7djP87qzlqrEGszaqG7xf9tEZosrX9+z
 WXROXMJusfDjVhaLBy/3M1rcnXwESLz2s1g//xabA4fHvDXVHjvuLmH02PttAYvH7I6ZrB7z
 TgZ63O8+zuRxfNctdo/jN7YzBXBEcdmkpOZklqUW6dslcGU0bdrMVrCFo+LqUuEGxk9sXYyc
 HBICJhI/tx1k6WLk4hASWMEocXJ5CzOE84VR4tzcP1DOZ0aJ95N3McO03P70hhEisZxRYkXT
 BVYI5y2jxOyXd9hBqoQFQiR6T7WCdYgIREvs2rAXrIhZoJVJYuKsl6wgCTYBTYm/m2+CXcIr
 YCexvvMwWJxFQEXi2dk3YINEBcIkfi7ohKoRlDg58wkLiM0p4CZxeOM1sDizgLxE89bZzBC2
 uMStJ/OZQJZJCBxjl/h9/igTxN0uEg++n4J6W1ji1fEt7BC2jMT/nfOhauol7q+AhICEQAej
 xNYNO6GetpY4fPwi0HUcQBs0Jdbv0ocIO0r8vbuVDSQsIcAnceOtIMQNfBKTtk1nhgjzSnS0
 CUFUK0rcP7sVaqC4xNILX9kmMCrNQvLZLCTfzELyzSyEvQsYWVYxiqeWFuempxYb56WW6xUn
 5haX5qXrJefnbmIEJqrT/45/3cG470/SIUYBDkYlHl6JFpVYIdbEsuLK3EOMEhzMSiK8+9yV
 Y4V4UxIrq1KL8uOLSnNSiw8xSnOwKInzVjM8iBYSSE8sSc1OTS1ILYLJMnFwSjUweoVta310
 9ImgXiWb2ZqLc32+vrKxOp52eUG78I0le1dIvWn2vTVvpeLeT7GdR623nJ+ydFXS8SD7K+ci
 3F7sWVplm/+wSuf66g2tgmWTcz7Mq0yd/ygr4Rn3LtWjijPE4lfEeKz8Jae/g2/3uQ0n7z6d
 4Ok43UPsbJFW2+F/J5a6fv57t7E7dY8SS3FGoqEWc1FxIgDF9G7JUAMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrHIsWRmVeSWpSXmKPExsVy+t/xu7ozl6rEGrz+amHxf9tEZosrX9+z
 WXROXMJusfDjVhaLBy/3M1rcnXwESLz2s1g//xabA4fHvDXVHjvuLmH02PttAYvH7I6ZrB7z
 TgZ63O8+zuRxfNctdo/jN7YzBXBE6dkU5ZeWpCpk5BeX2CpFG1oY6RlaWugZmVjqGRqbx1oZ
 mSrp29mkpOZklqUW6dsl6GU0bdrMVrCFo+LqUuEGxk9sXYycHBICJhK3P71h7GLk4hASWMoo
 cXnDYhaIhLjE7vlvmSFsYYk/17rYIIpeM0pcXLkHLCEsECLRe6oVzBYRiJY4c+gwmM0s0M4k
 0bjWAKJhIpPE92PXwRJsApoSfzffBFvNK2Ansb7zMCuIzSKgIvHs7Bv2LkYODlGBMImjJ/Ig
 SgQlTs58AnYQp4CbxOGN19gg5qtL/Jl3CWqXvETz1tlQtrjErSfzmSYwCs1C0j4LScssJC2z
 kLQsYGRZxSiSWlqcm55bbKhXnJhbXJqXrpecn7uJERiX24793LyD8dLG4EOMAhyMSjy8Ei0q
 sUKsiWXFlbmHGCU4mJVEePe5K8cK8aYkVlalFuXHF5XmpBYfYjQF+m0is5Rocj4wZeSVxBua
 GppbWBqaG5sbm1koifN2CByMERJITyxJzU5NLUgtgulj4uCUamBMeMlhs2jz/7bthzOeNHgv
 6Ml8de6euExuzXYG166bN2Iil8zRsVqwvzppipfBXCY1F51VOrJPr9clyc3cXF2/fkHUo1rJ
 dvsKbvE9oo+91D8lH4+2O1alZJB1p/aFrs+neS8fVN3pmGBxZAtXpvilG32cO/w2XXHxDZMT
 sX716n7TO60vewuVWIozEg21mIuKEwFc9AXn4QIAAA==
X-CMS-MailID: 20190709143258eucas1p16d402a7f3b160503997a3118a9500ba2
X-Msg-Generator: CA
X-RootMTR: 20190707182158epcas2p4eef06c281138dc9911f27a106b0d5d78
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20190707182158epcas2p4eef06c281138dc9911f27a106b0d5d78
References: <20190707180852.5512-1-laurent.pinchart@ideasonboard.com>
 <20190707181937.6250-1-laurent.pinchart@ideasonboard.com>
 <CGME20190707182158epcas2p4eef06c281138dc9911f27a106b0d5d78@epcas2p4.samsung.com>
 <20190707181937.6250-4-laurent.pinchart@ideasonboard.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=samsung.com; 
 s=mail20170921; t=1562682779;
 bh=PuXG5/OFCz3+DqFfMU8ao7Jn+U4/lVfCHZOP8CIFgvk=;
 h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
 b=ajc+JRLwSJ/FrZcDTykh85jGf1CtgUqEcmoTOzco0Yq3+s3iP1ah2yC1Pqjs5aOau
 O8haC5FaJukqW5T0NG9HCc1iZAJ5bHpv7v5Jx2UUZpOyQ5L850F4aEPuE7bTOWJLY2
 YmnqIV+ptN5aqiGv8EYMb9+hCdbomJG+v37lPut4=
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
Cc: Maxime Ripard <maxime.ripard@bootlin.com>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 Tomi Valkeinen <tomi.valkeinen@ti.com>, Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMDcuMDcuMjAxOSAyMDoxOCwgTGF1cmVudCBQaW5jaGFydCB3cm90ZToKPiBUaGUgVEkgT1Az
NjIgaXMgYW4gYW5hbG9nIHZpZGVvIGFtcGxpZmllciBjb250cm9sbGVkIHRocm91Z2ggYSBHUElP
LiBBZGQKPiBzdXBwb3J0IGZvciBpdCB0byB0aGUgc2ltcGxlLWJyaWRnZSBkcml2ZXIuCj4KPiBT
aWduZWQtb2ZmLWJ5OiBMYXVyZW50IFBpbmNoYXJ0IDxsYXVyZW50LnBpbmNoYXJ0QGlkZWFzb25i
b2FyZC5jb20+ClJldmlld2VkLWJ5OiBBbmRyemVqIEhhamRhIDxhLmhhamRhQHNhbXN1bmcuY29t
PgoKwqAtLQpSZWdhcmRzCkFuZHJ6ZWoKCj4gLS0tCj4gIGRyaXZlcnMvZ3B1L2RybS9icmlkZ2Uv
c2ltcGxlLWJyaWRnZS5jIHwgNSArKysrKwo+ICAxIGZpbGUgY2hhbmdlZCwgNSBpbnNlcnRpb25z
KCspCj4KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9zaW1wbGUtYnJpZGdl
LmMgYi9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL3NpbXBsZS1icmlkZ2UuYwo+IGluZGV4IGE3ZWRm
M2MzOTYyNy4uNzQ5NWI5YmVmODY1IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9icmlk
Z2Uvc2ltcGxlLWJyaWRnZS5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9zaW1wbGUt
YnJpZGdlLmMKPiBAQCAtMjk2LDYgKzI5NiwxMSBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IG9mX2Rl
dmljZV9pZCBzaW1wbGVfYnJpZGdlX21hdGNoW10gPSB7Cj4gIAkJCS50aW1pbmdzID0gJmRlZmF1
bHRfYnJpZGdlX3RpbWluZ3MsCj4gIAkJCS50eXBlID0gRFJNX01PREVfQ09OTkVDVE9SX1ZHQSwK
PiAgCQl9LAo+ICsJfSwgewo+ICsJCS5jb21wYXRpYmxlID0gInRpLG9wYTM2MiIsCj4gKwkJLmRh
dGEgPSAmKGNvbnN0IHN0cnVjdCBzaW1wbGVfYnJpZGdlX2luZm8pIHsKPiArCQkJLnR5cGUgPSBE
Uk1fTU9ERV9DT05ORUNUT1JfQ29tcG9zaXRlLAo+ICsJCX0sCj4gIAl9LCB7Cj4gIAkJLmNvbXBh
dGlibGUgPSAidGksdGhzODEzNSIsCj4gIAkJLmRhdGEgPSAmKGNvbnN0IHN0cnVjdCBzaW1wbGVf
YnJpZGdlX2luZm8pIHsKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3Rv
cC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmkt
ZGV2ZWw=
