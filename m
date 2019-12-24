Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 328F5129D93
	for <lists+dri-devel@lfdr.de>; Tue, 24 Dec 2019 05:53:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB97B6E0DF;
	Tue, 24 Dec 2019 04:53:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout3.samsung.com (mailout3.samsung.com [203.254.224.33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1EEAA6E0DF
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Dec 2019 04:53:31 +0000 (UTC)
Received: from epcas1p3.samsung.com (unknown [182.195.41.47])
 by mailout3.samsung.com (KnoxPortal) with ESMTP id
 20191224045329epoutp03ba625572943917349809b0d44b5948d1~jNZUywXI_0315703157epoutp03-
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Dec 2019 04:53:29 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com
 20191224045329epoutp03ba625572943917349809b0d44b5948d1~jNZUywXI_0315703157epoutp03-
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1577163209;
 bh=+MavX6V0fSjJ2hx2U3IVU9tdN5bV0kJVEfSN65G9Bag=;
 h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
 b=C3heL7nl4UxijwnhEm1TPnHxnNf4iNHNYDkqqobLrMyt1gNY5OEI5lVOVXChtndHC
 0AMRy+Y7HZgrelIaJ9I8Xa6rlwPF/ZqxvXW/Fn71Ml4iSHYU63Y+hFY5g3VY5dfdJu
 HLDPzkw5YtQ9vNiheljskseuLp9isEvMyGBixfQE=
Received: from epsnrtp3.localdomain (unknown [182.195.42.164]) by
 epcas1p4.samsung.com (KnoxPortal) with ESMTP id
 20191224045329epcas1p42a371233a0b53f54f5646bd87c540bda~jNZUfho-80985109851epcas1p4F;
 Tue, 24 Dec 2019 04:53:29 +0000 (GMT)
Received: from epsmges1p4.samsung.com (unknown [182.195.40.153]) by
 epsnrtp3.localdomain (Postfix) with ESMTP id 47hkPV5kBrzMqYks; Tue, 24 Dec
 2019 04:53:18 +0000 (GMT)
Received: from epcas1p1.samsung.com ( [182.195.41.45]) by
 epsmges1p4.samsung.com (Symantec Messaging Gateway) with SMTP id
 CF.ED.48019.CB9910E5; Tue, 24 Dec 2019 13:53:16 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
 epcas1p4.samsung.com (KnoxPortal) with ESMTPA id
 20191224045316epcas1p4b27534f3200f57fad70cf52c8c867f48~jNZIpAXjO0962409624epcas1p4X;
 Tue, 24 Dec 2019 04:53:16 +0000 (GMT)
Received: from epsmgms1p2new.samsung.com (unknown [182.195.42.42]) by
 epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20191224045316epsmtrp1aafafc08d5ce3dc89e9b3781b14c4840~jNZIoK0vQ2686226862epsmtrp1h;
 Tue, 24 Dec 2019 04:53:16 +0000 (GMT)
X-AuditID: b6c32a38-23fff7000001bb93-eb-5e0199bc809e
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
 epsmgms1p2new.samsung.com (Symantec Messaging Gateway) with SMTP id
 9F.83.06569.CB9910E5; Tue, 24 Dec 2019 13:53:16 +0900 (KST)
Received: from [10.113.221.211] (unknown [10.113.221.211]) by
 epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20191224045316epsmtip23aeb6e6c62cf0571538c300231d08c55~jNZIXRGaY2283022830epsmtip25;
 Tue, 24 Dec 2019 04:53:16 +0000 (GMT)
Subject: Re: [RFC PATCH v3 7/7] drm: exynos: mixer: Add interconnect support
To: =?UTF-8?B?QXJ0dXIgxZp3aWdvxYQ=?= <a.swigon@samsung.com>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-pm@vger.kernel.org, dri-devel@lists.freedesktop.org
From: Inki Dae <inki.dae@samsung.com>
Message-ID: <6e8aa13a-c831-a7ee-70d3-f6b08fe6fbc3@samsung.com>
Date: Tue, 24 Dec 2019 13:56:51 +0900
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191220115653.6487-8-a.swigon@samsung.com>
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA02Tf0xTVxTHve/1vT6MdW8V5cgShUdMJkmxD6i7qDCXGfOyEanxn2XJwBf6
 Bg39lb4WlJj4E2Q4RbJsQjfUEOM6KoqFGcDKHOKvEamdhjEGQtQwQS3xR9GoUVseRv77nHO+
 J/d7zr2XIbU36ETGbHNJTpto4ei5qjMXlut0gXqUrz/RpsMjhysQPl13isL/PP2fwkd6+ih8
 MzJJ40Pn/DQOBlvU2Dv8iML+O/0UvtH5C42f7O9BuC7YReDmnmE1/m+nl8Z1P4zTaz8Q/E3f
 0cJQf4AWRvZdJoTWY9uF0+F2QjjQ1oSEJ/4lRvXXJWuKJdEkOZMkW6HdZLYVZXNfbir4vMCw
 Us/r+Cz8CZdkE61SNrcu16hbb7ZEfXNJpaLFHU0ZRVnmVuSscdrdLimp2C67sjnJYbI4shxp
 smiV3baitEK7dRWv16cbosLNJcUVD4KUo2fxlq6LncQOdCu+GjEMsJkwETBVo7mMlm1HcP5K
 iFaCxwhGx5uQEkwhqAqfVFWjuOmOszUvZgrnEPj3t8y0TCJ49WMHiqkWsLlQuatFFSvEs28Q
 9B7/jYoFJDuIIFDTS8VUNLsMar0jdIw1bA48O+xXx1gVzXc/7KVjDheyX0FvRFQkH8LV+rvT
 NuLYLLjy9P60nGQTYPDuEULhpbD7959JxepxNXSNfabwOhh4MEUovAAmLrepFU6E8ZrKGS6D
 sfCYSlnMNphq2KJgBoS8phiS7HI41blCESdDx8sGpBw6H8KR7ylFrYGqSq0i4eBSaAApDHD9
 WC2tsACNzQfUB1GyZ9ZYnlmjeGaN4nl/8FGkakKLJIdsLZJk3pE5+6r9aPpBp+J2FOjL7UYs
 g7h5mpYLc/K1lFgqb7V2I2BILl7jc6J8rcYkbi2XnPYCp9siyd3IEF16LZm4sNAe/R42VwFv
 SM/IyMCZ/EoDz3MJGuZ56BstWyS6pBJJckjOd30EE5e4A6FGo1jliu9I8/17sGFjDt+3wVK5
 rTDPeHF9sneIeHHoo9Hb9QnPfjVH8KtLPsOYr7zaMLBp6tuPF0+klD8Knv9Dur3azCy6lpfi
 GW5Nj5A3q/ZUDGz+dPSnOaVtIS5/8OoXfw+7BTaUpReHyppfT5rHy+75wnv/DBA1f+X1m0vm
 cSq5WORTSacsvgUkAgvi5gMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrKIsWRmVeSWpSXmKPExsWy7bCSvO6emYxxBi92CVjcn9fKaLFxxnpW
 i+tfnrNazD9yjtXiytf3bBbT925iszh/fgO7xYq7H1ktNj2+xmpxedccNovPvUcYLWac38dk
 sfbIXXaL240r2CxmTH7J5sDvsWlVJ5vHnWt72Dzudx9n8ti8pN5j47sdTB59W1YxenzeJBfA
 HsVlk5Kak1mWWqRvl8CV0frmPGvBEcmKfUd3MTUw3hPpYuTkkBAwkdjd/4uxi5GLQ0hgN6NE
 98rXQA4HUEJCYstWDghTWOLw4WKIkreMEo8bPzCC9AoL+Ei0NW1gAUmICPxnlHjYdgxsELPA
 LUaJpl1TwKrApj7q0wGx2QRUJSauuM8GYvMK2El8n7eJHcRmAYofensaLC4qECHxfPsNRoga
 QYmTM5+wgNicApYSJ768BqtnFlCX+DPvEjOELS5x68l8JghbXqJ562zmCYxCs5C0z0LSMgtJ
 yywkLQsYWVYxSqYWFOem5xYbFhjlpZbrFSfmFpfmpesl5+duYgRHppbWDsYTJ+IPMQpwMCrx
 8EYcZIgTYk0sK67MPcQowcGsJMK7uogxTog3JbGyKrUoP76oNCe1+BCjNAeLkjivfP6xSCGB
 9MSS1OzU1ILUIpgsEwenVAOj390VKjyVmi86DMsul3snq1wsDXZda7WLUcsi6+jjuON/VdzC
 ODuktSfW/3DonWsmyHedx5i9Yn/atn8xxapLHQ60BuaZVRp2WrzbWW49cXtv+9JnzBXZ7Rq3
 d7SsWMl42Lwk4Lef9LNNaSy9UkueL+qS+heaKsqYrSASPMUmS/PuoU4XKyWW4oxEQy3mouJE
 AAReOPzIAgAA
X-CMS-MailID: 20191224045316epcas1p4b27534f3200f57fad70cf52c8c867f48
X-Msg-Generator: CA
X-Sendblock-Type: SVC_REQ_APPROVE
CMS-TYPE: 101P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20191220120146eucas1p22a7b0457be4f378b113f67dc25f2eba7
References: <20191220115653.6487-1-a.swigon@samsung.com>
 <CGME20191220120146eucas1p22a7b0457be4f378b113f67dc25f2eba7@eucas1p2.samsung.com>
 <20191220115653.6487-8-a.swigon@samsung.com>
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
Cc: b.zolnierkie@samsung.com, sw0312.kim@samsung.com, krzk@kernel.org,
 cw00.choi@samsung.com, myungjoo.ham@samsung.com, leonard.crestez@nxp.com,
 georgi.djakov@linaro.org, Marek Szyprowski <m.szyprowski@samsung.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGksCgoxOS4gMTIuIDIwLiDsmKTtm4QgODo1NuyXkCBBcnR1ciDFmndpZ2/FhCDsnbQo6rCAKSDs
k7Qg6riAOgo+IEZyb206IE1hcmVrIFN6eXByb3dza2kgPG0uc3p5cHJvd3NraUBzYW1zdW5nLmNv
bT4KPiAKPiBUaGlzIHBhdGNoIGFkZHMgaW50ZXJjb25uZWN0IHN1cHBvcnQgdG8gZXh5bm9zLW1p
eGVyLiBUaGUgbWl4ZXIgd29ya3MKPiB0aGUgc2FtZSBhcyBiZWZvcmUgd2hlbiBDT05GSUdfSU5U
RVJDT05ORUNUIGlzICduJy4KPiAKPiBDby1kZXZlbG9wZWQtYnk6IEFydHVyIMWad2lnb8WEIDxh
LnN3aWdvbkBzYW1zdW5nLmNvbT4KPiBTaWduZWQtb2ZmLWJ5OiBBcnR1ciDFmndpZ2/FhCA8YS5z
d2lnb25Ac2Ftc3VuZy5jb20+Cj4gU2lnbmVkLW9mZi1ieTogTWFyZWsgU3p5cHJvd3NraSA8bS5z
enlwcm93c2tpQHNhbXN1bmcuY29tPgo+IC0tLQo+ICBkcml2ZXJzL2dwdS9kcm0vZXh5bm9zL2V4
eW5vc19taXhlci5jIHwgNzEgKysrKysrKysrKysrKysrKysrKysrKysrKy0tCj4gIDEgZmlsZSBj
aGFuZ2VkLCA2NiBpbnNlcnRpb25zKCspLCA1IGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQg
YS9kcml2ZXJzL2dwdS9kcm0vZXh5bm9zL2V4eW5vc19taXhlci5jIGIvZHJpdmVycy9ncHUvZHJt
L2V4eW5vcy9leHlub3NfbWl4ZXIuYwo+IGluZGV4IDZjZmRiOTVmZWYyZi4uYTdlNzI0MGEwNTVm
IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9leHlub3MvZXh5bm9zX21peGVyLmMKPiAr
KysgYi9kcml2ZXJzL2dwdS9kcm0vZXh5bm9zL2V4eW5vc19taXhlci5jCj4gQEAgLTEzLDYgKzEz
LDcgQEAKPiAgI2luY2x1ZGUgPGxpbnV4L2NvbXBvbmVudC5oPgo+ICAjaW5jbHVkZSA8bGludXgv
ZGVsYXkuaD4KPiAgI2luY2x1ZGUgPGxpbnV4L2kyYy5oPgo+ICsjaW5jbHVkZSA8bGludXgvaW50
ZXJjb25uZWN0Lmg+Cj4gICNpbmNsdWRlIDxsaW51eC9pbnRlcnJ1cHQuaD4KPiAgI2luY2x1ZGUg
PGxpbnV4L2lycS5oPgo+ICAjaW5jbHVkZSA8bGludXgva2VybmVsLmg+Cj4gQEAgLTk3LDYgKzk4
LDcgQEAgc3RydWN0IG1peGVyX2NvbnRleHQgewo+ICAJc3RydWN0IGV4eW5vc19kcm1fY3J0Ywkq
Y3J0YzsKPiAgCXN0cnVjdCBleHlub3NfZHJtX3BsYW5lCXBsYW5lc1tNSVhFUl9XSU5fTlJdOwo+
ICAJdW5zaWduZWQgbG9uZwkJZmxhZ3M7Cj4gKwlzdHJ1Y3QgaWNjX3BhdGgJCSpzb2NfcGF0aDsK
PiAgCj4gIAlpbnQJCQlpcnE7Cj4gIAl2b2lkIF9faW9tZW0JCSptaXhlcl9yZWdzOwo+IEBAIC05
MzEsNiArOTMzLDQwIEBAIHN0YXRpYyB2b2lkIG1peGVyX2Rpc2FibGVfdmJsYW5rKHN0cnVjdCBl
eHlub3NfZHJtX2NydGMgKmNydGMpCj4gIAltaXhlcl9yZWdfd3JpdGVtYXNrKG1peGVyX2N0eCwg
TVhSX0lOVF9FTiwgMCwgTVhSX0lOVF9FTl9WU1lOQyk7Cj4gIH0KPiAgCj4gK3N0YXRpYyB2b2lk
IG1peGVyX3NldF9tZW1vcnlfYmFuZHdpZHRoKHN0cnVjdCBleHlub3NfZHJtX2NydGMgKmNydGMp
Cj4gK3sKPiArCXN0cnVjdCBkcm1fZGlzcGxheV9tb2RlICptb2RlID0gJmNydGMtPmJhc2Uuc3Rh
dGUtPmFkanVzdGVkX21vZGU7Cj4gKwlzdHJ1Y3QgbWl4ZXJfY29udGV4dCAqY3R4ID0gY3J0Yy0+
Y3R4Owo+ICsJdW5zaWduZWQgbG9uZyBidywgYmFuZHdpZHRoID0gMDsKPiArCWludCBpLCBqLCBz
dWI7Cj4gKwo+ICsJaWYgKCFjdHgtPnNvY19wYXRoKQo+ICsJCXJldHVybjsKPiArCj4gKwlmb3Ig
KGkgPSAwOyBpIDwgTUlYRVJfV0lOX05SOyBpKyspIHsKPiArCQlzdHJ1Y3QgZHJtX3BsYW5lICpw
bGFuZSA9ICZjdHgtPnBsYW5lc1tpXS5iYXNlOwo+ICsJCWNvbnN0IHN0cnVjdCBkcm1fZm9ybWF0
X2luZm8gKmZvcm1hdDsKPiArCj4gKwkJaWYgKHBsYW5lLT5zdGF0ZSAmJiBwbGFuZS0+c3RhdGUt
PmNydGMgJiYgcGxhbmUtPnN0YXRlLT5mYikgewo+ICsJCQlmb3JtYXQgPSBwbGFuZS0+c3RhdGUt
PmZiLT5mb3JtYXQ7Cj4gKwkJCWJ3ID0gbW9kZS0+aGRpc3BsYXkgKiBtb2RlLT52ZGlzcGxheSAq
Cj4gKwkJCQkJCQlkcm1fbW9kZV92cmVmcmVzaChtb2RlKTsKPiArCQkJaWYgKG1vZGUtPmZsYWdz
ICYgRFJNX01PREVfRkxBR19JTlRFUkxBQ0UpCj4gKwkJCQlidyAvPSAyOwo+ICsJCQlmb3IgKGog
PSAwOyBqIDwgZm9ybWF0LT5udW1fcGxhbmVzOyBqKyspIHsKPiArCQkJCXN1YiA9IGogPyAoZm9y
bWF0LT52c3ViICogZm9ybWF0LT5oc3ViKSA6IDE7Cj4gKwkJCQliYW5kd2lkdGggKz0gZm9ybWF0
LT5jcHBbal0gKiBidyAvIHN1YjsKPiArCQkJfQo+ICsJCX0KPiArCX0KPiArCj4gKwkvKiBhZGQg
MjAlIHNhZmV0eSBtYXJnaW4gKi8KPiArCWJhbmR3aWR0aCA9IGJhbmR3aWR0aCAvIDQgKiA1Owo+
ICsKPiArCWRldl9kYmcoY3R4LT5kZXYsICJleHlub3MtbWl4ZXI6IHNhZmUgYmFuZHdpZHRoICVs
ZCBCcHNcbiIsIGJhbmR3aWR0aCk7Cj4gKwlpY2Nfc2V0X2J3KGN0eC0+c29jX3BhdGgsIEJwc190
b19pY2MoYmFuZHdpZHRoKSwgMCk7Cj4gK30KPiArCj4gIHN0YXRpYyB2b2lkIG1peGVyX2F0b21p
Y19iZWdpbihzdHJ1Y3QgZXh5bm9zX2RybV9jcnRjICpjcnRjKQo+ICB7Cj4gIAlzdHJ1Y3QgbWl4
ZXJfY29udGV4dCAqY3R4ID0gY3J0Yy0+Y3R4Owo+IEBAIC05ODIsNiArMTAxOCw3IEBAIHN0YXRp
YyB2b2lkIG1peGVyX2F0b21pY19mbHVzaChzdHJ1Y3QgZXh5bm9zX2RybV9jcnRjICpjcnRjKQo+
ICAJaWYgKCF0ZXN0X2JpdChNWFJfQklUX1BPV0VSRUQsICZtaXhlcl9jdHgtPmZsYWdzKSkKPiAg
CQlyZXR1cm47Cj4gIAo+ICsJbWl4ZXJfc2V0X21lbW9yeV9iYW5kd2lkdGgoY3J0Yyk7Cj4gIAlt
aXhlcl9lbmFibGVfc3luYyhtaXhlcl9jdHgpOwo+ICAJZXh5bm9zX2NydGNfaGFuZGxlX2V2ZW50
KGNydGMpOwo+ICB9Cj4gQEAgLTEwMjksNiArMTA2Niw3IEBAIHN0YXRpYyB2b2lkIG1peGVyX2Rp
c2FibGUoc3RydWN0IGV4eW5vc19kcm1fY3J0YyAqY3J0YykKPiAgCWZvciAoaSA9IDA7IGkgPCBN
SVhFUl9XSU5fTlI7IGkrKykKPiAgCQltaXhlcl9kaXNhYmxlX3BsYW5lKGNydGMsICZjdHgtPnBs
YW5lc1tpXSk7Cj4gID4gKwltaXhlcl9zZXRfbWVtb3J5X2JhbmR3aWR0aChjcnRjKTsKCllvdXIg
aW50ZW50aW9uIGlzIHRvIHNldCBwZWFrIGFuZCBhdmVyYWdlIGJhbmR3aWR0aCB0byAwIGF0IGRp
c2FibGluZyBtaXhlciBkZXZpY2U/CgpUaGFua3MsCklua2kgRGFlCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJp
LWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
