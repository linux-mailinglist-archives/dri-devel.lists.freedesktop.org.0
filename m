Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 35A422A6517
	for <lists+dri-devel@lfdr.de>; Wed,  4 Nov 2020 14:27:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6428C6ED07;
	Wed,  4 Nov 2020 13:27:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com
 [210.118.77.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C6A76ED07
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Nov 2020 13:27:32 +0000 (UTC)
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id
 20201104132721euoutp02579fe327335a9329409bcc70a63798c6~EUQMpcMsN0084900849euoutp02f
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Nov 2020 13:27:21 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com
 20201104132721euoutp02579fe327335a9329409bcc70a63798c6~EUQMpcMsN0084900849euoutp02f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1604496441;
 bh=oieoMezIQiMNV5YqAfnKGRVm058j0qgbcmHKQB7ZhZM=;
 h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
 b=WSURXd7Utpz3DQir0TMTvt9gmX/X2DjRIaHU56VnzMjqtrlOtoo+D/33dBU4W6tid
 uKUFRq0ZjxZoEcLR8vp2blUKrobC4UmkEwUwBVe5raXQiN/gB72jsp1iQLP4WfI5m/
 PSo6V3KNuKkuJ0uIu0l2tdvAkxkrJFHDRk+tWmO8=
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTP id
 20201104132715eucas1p1db76eb64aef8abce39adb69752d91849~EUQHswlx80734507345eucas1p1q;
 Wed,  4 Nov 2020 13:27:15 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
 eusmges2new.samsung.com (EUCPMTA) with SMTP id DD.0D.05997.33CA2AF5; Wed,  4
 Nov 2020 13:27:15 +0000 (GMT)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20201104132715eucas1p2ecb797ebb381ce4edf66f67680d7500a~EUQG_hUss1056010560eucas1p2g;
 Wed,  4 Nov 2020 13:27:15 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20201104132715eusmtrp1f533a233be927a45fbb2fddfee4e05e6~EUQG9s2k51807818078eusmtrp1m;
 Wed,  4 Nov 2020 13:27:15 +0000 (GMT)
X-AuditID: cbfec7f4-677ff7000000176d-74-5fa2ac3310bb
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
 eusmgms2.samsung.com (EUCPMTA) with SMTP id 9B.C0.06017.33CA2AF5; Wed,  4
 Nov 2020 13:27:15 +0000 (GMT)
Received: from [106.210.123.115] (unknown [106.210.123.115]) by
 eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20201104132713eusmtip23508d058e272409090e63214ddf47f0e~EUQFqeAzw2190421904eusmtip2V;
 Wed,  4 Nov 2020 13:27:13 +0000 (GMT)
Subject: Re: [PATCH v8 3/7] MAINTAINERS: Add entry for Samsung interconnect
 drivers
To: Krzysztof Kozlowski <krzk@kernel.org>
From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Message-ID: <3fb7eb6b-6b3a-e170-92c3-910e31190d64@samsung.com>
Date: Wed, 4 Nov 2020 14:27:13 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.1
MIME-Version: 1.0
In-Reply-To: <20201104122719.GB10157@kozik-lap>
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA01Se0hTcRTut/vYVZpdl+LJomAYYaCmFl5IrKxoQoXRg4hKZ15U0mm7aZZE
 K5v5TpR0+UjTQluWOU3Md2YukW2Q71ZqtBCTktBILTOv18j/vvOd8/2+8x1+FCa1EM5UhPIi
 q1IqImWkLV7XOWty864sDdqWW+3OjNzTIKZaW0UwA9NjBFPcYSKY3h+TJJPXrCeZ7JEsnDGb
 n4kZ/ad+gulpKCSZqYwOxGjNLSLmSccHMWO5XkEymuYOMaPNGSd303K9LoWUv+9vIuUjaQaR
 vObBNXlmrQ7Jp/QbA8lTtr6hbGREHKvy8Au2DU81mImYOXH857JypEZGMhXZUEBvB/XH23gq
 sqWkdAWCvsJWUiimEehGM8VCMYUgRTOBpSJqSdKv8RP4cgSPytMw/ikp/R3BnVsneLyWPg7D
 neYl3oF2hYH5nwQvwOgyDBYKbhB8g6Q9IeN1JuKxhPYD61sjzmOcdoE3Q7+XsCN9FrKqb+LC
 jD103bXi/BI2tAc8LrnK0xjtBO+sxSIBb4LE5wUY7wX0dQo0lfUiIec+6KqtQQJeC18MtWIB
 b4DunHRcECQiSG+0iIUiC8GIoWRZsRPem+ZI3hlbjFPV4CHQe6Co7REuXMUOBr/aC0vYQXZd
 3vKxJJCcJBWmXeCXLm95HWdIsy7gWUiWvyJZ/oo4+Svi5P/3LUG4DjmxsVxUGMt5KdlL7pwi
 iotVhrmfi47So8Uv1/3HMF2PGn6HtCOaQrLVkra6+0FSQhHHXY5qR0BhMgeJv7H7rFQSqrh8
 hVVFB6liI1muHa2ncJmTxLt0/IyUDlNcZM+zbAyr+tcVUTbOapT88FXuzKHOA37dgeot+6uG
 E4oCmqzhL0Zn5nNvhE04qksNhS9Sjgb4zDYelO1wO73L/uuHQOdf3/paXCdaXqqM/r5jEqRc
 05OkRIOVc61PuRAifqH3mrqt1+nw6MxJ7ZHJzaYCuTbWddacdsHLx96SMDT0w2L3bl1C4eix
 4Pq9q2Q4F67w3IqpOMVfgEWs3G4DAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrLIsWRmVeSWpSXmKPExsVy+t/xe7rGaxbFG9zYz2pxf14ro8XGGetZ
 La5/ec5qMf/IOVaLK1/fs1lM37uJzWLS/QksFufPb2C32PT4GqvF5V1z2Cw+9x5htJhxfh+T
 xdojd9ktbjeuYLNo3XuE3WLG5JdsDgIem1Z1snncubaHzeN+93Emj81L6j36tqxi9Pi8SS6A
 LUrPpii/tCRVISO/uMRWKdrQwkjP0NJCz8jEUs/Q2DzWyshUSd/OJiU1J7MstUjfLkEvo+v4
 edaCX+wVTxcvZ2xgPMvWxcjBISFgInGt1a6LkYtDSGApo0Rzz3x2iLiUxPwWpS5GTiBTWOLP
 tS42iJr3jBJzvq9nB0kIC4RK3Dt2nhnEFhHQlLj+9zsrSBGzwGJmiYZXC5ggOp4xSjQeXMcE
 UsUmYCjRe7SPEcTmFbCTeHLpLAuIzSKgInHi5h8wW1QgTuLHxF42iBpBiZMzn7CAXMQpoC+x
 ekEtSJhZQF3iz7xLzBC2uMStJ/OZIGx5ieats5knMArNQtI9C0nLLCQts5C0LGBkWcUoklpa
 nJueW2ykV5yYW1yal66XnJ+7iREY1duO/dyyg7HrXfAhRgEORiUe3gPbFsYLsSaWFVfmHmKU
 4GBWEuF1Ons6Tog3JbGyKrUoP76oNCe1+BCjKdBvE5mlRJPzgQknryTe0NTQ3MLS0NzY3NjM
 Qkmct0PgYIyQQHpiSWp2ampBahFMHxMHp1QD487lk559Zs/hmusQZfUhzzoncJdiwMu5tUv/
 CoSvOP57rvudGUlxa/ovRutzm/zdVvUsYKtQwryqEq0t6qtb+dsnO3pP/ZI5Ic9sQvYOkycG
 cfM274t+km7erFjS12x0MWPP4R2s4S3xex6c+/1XKaF9wt2HD+b0cCQzRcepG+icF7gRuojb
 WYmlOCPRUIu5qDgRACFlBbYAAwAA
X-CMS-MailID: 20201104132715eucas1p2ecb797ebb381ce4edf66f67680d7500a
X-Msg-Generator: CA
X-RootMTR: 20201104103722eucas1p1db939995e60d0bf2cd581070c14379f5
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20201104103722eucas1p1db939995e60d0bf2cd581070c14379f5
References: <20201104103657.18007-1-s.nawrocki@samsung.com>
 <CGME20201104103722eucas1p1db939995e60d0bf2cd581070c14379f5@eucas1p1.samsung.com>
 <20201104103657.18007-4-s.nawrocki@samsung.com>
 <20201104122719.GB10157@kozik-lap>
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
Cc: devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 b.zolnierkie@samsung.com, linux-pm@vger.kernel.org, sw0312.kim@samsung.com,
 a.swigon@samsung.com, robh+dt@kernel.org, linux-kernel@vger.kernel.org,
 cw00.choi@samsung.com, myungjoo.ham@samsung.com,
 dri-devel@lists.freedesktop.org, georgi.djakov@linaro.org,
 linux-arm-kernel@lists.infradead.org, m.szyprowski@samsung.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMDQuMTEuMjAyMCAxMzoyNywgS3J6eXN6dG9mIEtvemxvd3NraSB3cm90ZToKPiBPbiBXZWQs
IE5vdiAwNCwgMjAyMCBhdCAxMTozNjo1M0FNICswMTAwLCBTeWx3ZXN0ZXIgTmF3cm9ja2kgd3Jv
dGU6Cj4+IEFkZCBtYWludGFpbmVycyBlbnRyeSBmb3IgdGhlIFNhbXN1bmcgaW50ZXJjb25uZWN0
IGRyaXZlcnMsIHRoaXMgY3VycmVudGx5Cj4+IGluY2x1ZGVzIEV4eW5vcyBTb0MgZ2VuZXJpYyBp
bnRlcmNvbm5lY3QgZHJpdmVyLgo+Pgo+PiBTaWduZWQtb2ZmLWJ5OiBTeWx3ZXN0ZXIgTmF3cm9j
a2kgPHMubmF3cm9ja2lAc2Ftc3VuZy5jb20+Cgo+PiBkaWZmIC0tZ2l0IGEvTUFJTlRBSU5FUlMg
Yi9NQUlOVEFJTkVSUwo+PiBpbmRleCBlNzM2MzZiLi40YmJhZmVmIDEwMDY0NAo+PiAtLS0gYS9N
QUlOVEFJTkVSUwo+PiArKysgYi9NQUlOVEFJTkVSUwo+PiBAQCAtOTE1Niw2ICs5MTU2LDEzIEBA
IEY6CWluY2x1ZGUvZHQtYmluZGluZ3MvaW50ZXJjb25uZWN0Lwo+PiAgRjoJaW5jbHVkZS9saW51
eC9pbnRlcmNvbm5lY3QtcHJvdmlkZXIuaAo+PiAgRjoJaW5jbHVkZS9saW51eC9pbnRlcmNvbm5l
Y3QuaAo+PiAgCj4+ICtTQU1TVU5HIElOVEVSQ09OTkVDVCBEUklWRVJTCj4gCj4gRG9lcyBub3Qg
bG9vayBsaWtlIG9yZGVyZWQgYWxwaGFiZXRpY2FsbHkuCiAKPj4gK006CVN5bHdlc3RlciBOYXdy
b2NraSA8cy5uYXdyb2NraUBzYW1zdW5nLmNvbT4KPj4gK006CUFydHVyIFN3aWdvxYQgPGEuc3dp
Z29uQHNhbXN1bmcuY29tPgo+PiArTDoJbGludXgtcG1Admdlci5rZXJuZWwub3JnCj4gCj4gQWxz
bzoKPiBMOiBsaW51eC1zYW1zdW5nLXNvY0B2Z2VyLmtlcm5lbC5vcmcKCj4+ICtTOglTdXBwb3J0
ZWQKPj4gK0Y6CWRyaXZlcnMvaW50ZXJjb25uZWN0L3NhbXN1bmcKPiAKPiBBZGQgdHJhaWxpbmcg
Ly4KCkZpeGVkIGFsbCBpc3N1ZXMsIHRoYW5rcyBmb3IgeW91ciByZXZpZXchCgotLSAKUmVnYXJk
cywKU3lsd2VzdGVyCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9y
ZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZl
bAo=
