Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A90B63775
	for <lists+dri-devel@lfdr.de>; Tue,  9 Jul 2019 16:08:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E65E897C5;
	Tue,  9 Jul 2019 14:08:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com
 [210.118.77.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A8A3E897C5
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Jul 2019 14:08:42 +0000 (UTC)
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id
 20190709140840euoutp02c6fc435ec879c4f39e3e3b7be5e1d23d~vwmHGfngk0820908209euoutp02Z
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Jul 2019 14:08:40 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com
 20190709140840euoutp02c6fc435ec879c4f39e3e3b7be5e1d23d~vwmHGfngk0820908209euoutp02Z
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTP id
 20190709140840eucas1p2f138de40507e9c70b9b6d809808e03c2~vwmGfxlt-1624816248eucas1p2D;
 Tue,  9 Jul 2019 14:08:40 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
 eusmges2new.samsung.com (EUCPMTA) with SMTP id 0E.61.04377.7EF942D5; Tue,  9
 Jul 2019 15:08:39 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20190709140839eucas1p2cd8d8dd669c21121c09f78c77cfb4433~vwmFyFGVE0992509925eucas1p2g;
 Tue,  9 Jul 2019 14:08:39 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20190709140839eusmtrp1d74bcb0b2560e6f0e1ef3565ce05ecc0~vwmFj-VHG0092400924eusmtrp1J;
 Tue,  9 Jul 2019 14:08:39 +0000 (GMT)
X-AuditID: cbfec7f4-12dff70000001119-ad-5d249fe728ad
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
 eusmgms1.samsung.com (EUCPMTA) with SMTP id 57.A6.04146.7EF942D5; Tue,  9
 Jul 2019 15:08:39 +0100 (BST)
Received: from [106.120.51.74] (unknown [106.120.51.74]) by
 eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20190709140838eusmtip298be7431bf4ae6221a4c4902fd4f6da8~vwmFHLTUO2361923619eusmtip20;
 Tue,  9 Jul 2019 14:08:38 +0000 (GMT)
Subject: Re: [PATCH 05/60] drm/bridge: simple-bridge: Add support for
 non-VGA bridges
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 dri-devel@lists.freedesktop.org
From: Andrzej Hajda <a.hajda@samsung.com>
Message-ID: <f6dc8515-8e4d-5d5b-9485-bd1e0509ba91@samsung.com>
Date: Tue, 9 Jul 2019 16:08:37 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.0
MIME-Version: 1.0
In-Reply-To: <20190707181937.6250-2-laurent.pinchart@ideasonboard.com>
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrDKsWRmVeSWpSXmKPExsWy7djPc7rP56vEGqx/bWPxf9tEZosrX9+z
 WXROXMJusfDjVhaLBy/3M1rcnXwESLz2s1g//xabA4fHvDXVHjvuLmH02PttAYvH7I6ZrB7z
 TgZ63O8+zuRxfNctdo/jN7YzBXBEcdmkpOZklqUW6dslcGV8ez2NreC7VMX0GfwNjDdFuxg5
 OSQETCQ6Zk1j7WLk4hASWMEoMen+TDYI5wujxPtl65kgnM+MEtsPfGWCaVm8/RcjRGI5o8Sf
 Rz1QzltGiZ0P2thAqoQFwiXOb54BZosIREvs2rAXbAmzQCuTxMRZL1lBEmwCmhJ/N98EK+IV
 sJNYOHsBM4jNIqAicfhqOwuILSoQJvFzQSdUjaDEyZlPgOIcHJwCbhJHduSDhJkF5CWat85m
 hrDFJW49mQ92toTAMXaJ4xsa2SDOdpH4caQH6gVhiVfHt7BD2DISpyf3sEDY9RL3V7QwQzR3
 MEps3bCTGSJhLXH4+EVWkMXMQEev36UPEXaUeLS8nwkkLCHAJ3HjrSDEDXwSk7ZNZ4YI80p0
 tAlBVCtK3D+7FWqguMTSC1/ZJjAqzULy2Cwk38xC8s0shL0LGFlWMYqnlhbnpqcWG+WllusV
 J+YWl+al6yXn525iBKap0/+Of9nBuOtP0iFGAQ5GJR5eiRaVWCHWxLLiytxDjBIczEoivPvc
 lWOFeFMSK6tSi/Lji0pzUosPMUpzsCiJ81YzPIgWEkhPLEnNTk0tSC2CyTJxcEo1MAbdY1G9
 8ynvGqP4BYGmSQnxn/axL2CPePL/oQTrpci3VjbfCtgfJmUUfnDt5yxIMFOw3NP2evJ7s++p
 km/id0qyptpF9NSz38rK+JR86tsZ7omHeSIdIyyMTRkOPzm93qlbn2e3fM9+l7bbu47OWHdv
 37rN2eG7zScUm/UpOWf+q718lv9njhJLcUaioRZzUXEiAKZpoFBPAwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrDIsWRmVeSWpSXmKPExsVy+t/xe7rP56vEGhw5yGXxf9tEZosrX9+z
 WXROXMJusfDjVhaLBy/3M1rcnXwESLz2s1g//xabA4fHvDXVHjvuLmH02PttAYvH7I6ZrB7z
 TgZ63O8+zuRxfNctdo/jN7YzBXBE6dkU5ZeWpCpk5BeX2CpFG1oY6RlaWugZmVjqGRqbx1oZ
 mSrp29mkpOZklqUW6dsl6GV8ez2NreC7VMX0GfwNjDdFuxg5OSQETCQWb//FCGILCSxllDg1
 WQwiLi6xe/5bZghbWOLPtS62LkYuoJrXjBKf9jxmA0kIC4RLfF+4BKxIRCBa4syhw2A2s0A7
 k0TjWgOIholMEi+f32QCSbAJaEr83XwTrJlXwE5i4ewFYA0sAioSh6+2s3QxcnCICoRJHD2R
 B1EiKHFy5hOwMKeAm8SRHfkQ49Ul/sy7BLVKXqJ562woW1zi1pP5TBMYhWYh6Z6FpGUWkpZZ
 SFoWMLKsYhRJLS3OTc8tNtQrTswtLs1L10vOz93ECIzJbcd+bt7BeGlj8CFGAQ5GJR5eiRaV
 WCHWxLLiytxDjBIczEoivPvclWOFeFMSK6tSi/Lji0pzUosPMZoCvTaRWUo0OR+YLvJK4g1N
 Dc0tLA3Njc2NzSyUxHk7BA7GCAmkJ5akZqemFqQWwfQxcXBKNTBm2SeJ6X2svZ68UuJ0ljjj
 qp3SPs/9vss9Vsp5EOAn88lNysvjlPEH+SsLfMTsD1vWb+XjWeTC2WZ05VW9nNGWzQ7CHP0K
 t++1sfMIT52bNn3d7BCp7P6ZN2SPOF3c/O2YTFfvM7lnQqoWvkxJkYdvOGqkWJiFs9j33Tyr
 MOvsh4Nfbhvv1lZiKc5INNRiLipOBABtAcSO3wIAAA==
X-CMS-MailID: 20190709140839eucas1p2cd8d8dd669c21121c09f78c77cfb4433
X-Msg-Generator: CA
X-RootMTR: 20190707182120epcas1p191dce1d646b90195c8f7b73e195238a8
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20190707182120epcas1p191dce1d646b90195c8f7b73e195238a8
References: <20190707180852.5512-1-laurent.pinchart@ideasonboard.com>
 <20190707181937.6250-1-laurent.pinchart@ideasonboard.com>
 <CGME20190707182120epcas1p191dce1d646b90195c8f7b73e195238a8@epcas1p1.samsung.com>
 <20190707181937.6250-2-laurent.pinchart@ideasonboard.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=samsung.com; 
 s=mail20170921; t=1562681320;
 bh=YWfLsnOpEsKMbrv2FqJxkCNEHEYMNjSjDwkbCgjXIps=;
 h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
 b=bu/qMR9NqepvEdz4LfcQ1PozZ2h1YcjKG/+XwG3tcBGuK7I7zaSeH00ZNRoFsz8Ct
 S7hUifP57Q6FrhN1YMFnm3I6jAVHyRhImlZR2RjD6gleA0eG3GV/rg+WqXTBVl/9no
 PUtAK5wULHhNMQrbFuckvNkd2yCySOE1IoVhLwvI=
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

T24gMDcuMDcuMjAxOSAyMDoxOCwgTGF1cmVudCBQaW5jaGFydCB3cm90ZToKPiBDcmVhdGUgYSBu
ZXcgc2ltcGxlX2JyaWRnZV9pbmZvIHN0cnVjdHVyZSB0aGF0IHN0b3JlcyBpbmZvcm1hdGlvbiBh
Ym91dAo+IHRoZSBicmlkZ2UgbW9kZWwsIGFuZCBzdG9yZSB0aGUgYnJpZGdlIHRpbWluZ3MgaW4g
dGhlcmUsIGFsb25nIHdpdGggdGhlCj4gY29ubmVjdG9yIHR5cGUuIFVzZSB0aGF0IG5ldyBzdHJ1
Y3R1cmUgZm9yIG9mX2RldmljZV9pZCBkYXRhLiBUaGlzCj4gZW5hYmxlcyBzdXBwb3J0IGZvciBu
b24tVkdBIGJyaWRnZXMuCj4KPiBTaWduZWQtb2ZmLWJ5OiBMYXVyZW50IFBpbmNoYXJ0IDxsYXVy
ZW50LnBpbmNoYXJ0QGlkZWFzb25ib2FyZC5jb20+CgoKUmV2aWV3ZWQtYnk6IEFuZHJ6ZWogSGFq
ZGEgPGEuaGFqZGFAc2Ftc3VuZy5jb20+CgrCoC0tClJlZ2FyZHMKQW5kcnplagoKCj4gLS0tCj4g
IGRyaXZlcnMvZ3B1L2RybS9icmlkZ2Uvc2ltcGxlLWJyaWRnZS5jIHwgNDEgKysrKysrKysrKysr
KysrKysrLS0tLS0tLS0KPiAgMSBmaWxlIGNoYW5nZWQsIDI5IGluc2VydGlvbnMoKyksIDEyIGRl
bGV0aW9ucygtKQo+Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2Uvc2ltcGxl
LWJyaWRnZS5jIGIvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9zaW1wbGUtYnJpZGdlLmMKPiBpbmRl
eCBkYTU0NzliZDU4NzguLmJmZjI0MGNmMjgzZCAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9k
cm0vYnJpZGdlL3NpbXBsZS1icmlkZ2UuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2Uv
c2ltcGxlLWJyaWRnZS5jCj4gQEAgLTE2LDEwICsxNiwxNyBAQAo+ICAjaW5jbHVkZSA8ZHJtL2Ry
bV9wcmludC5oPgo+ICAjaW5jbHVkZSA8ZHJtL2RybV9wcm9iZV9oZWxwZXIuaD4KPiAgCj4gK3N0
cnVjdCBzaW1wbGVfYnJpZGdlX2luZm8gewo+ICsJY29uc3Qgc3RydWN0IGRybV9icmlkZ2VfdGlt
aW5ncyAqdGltaW5nczsKPiArCXVuc2lnbmVkIGludCB0eXBlOwo+ICt9Owo+ICsKPiAgc3RydWN0
IHNpbXBsZV9icmlkZ2Ugewo+ICAJc3RydWN0IGRybV9icmlkZ2UJYnJpZGdlOwo+ICAJc3RydWN0
IGRybV9jb25uZWN0b3IJY29ubmVjdG9yOwo+ICAKPiArCWNvbnN0IHN0cnVjdCBzaW1wbGVfYnJp
ZGdlX2luZm8gKmluZm87Cj4gKwo+ICAJc3RydWN0IGkyY19hZGFwdGVyCSpkZGM7Cj4gIAlzdHJ1
Y3QgcmVndWxhdG9yCSp2ZGQ7Cj4gIH07Cj4gQEAgLTExMyw3ICsxMjAsNyBAQCBzdGF0aWMgaW50
IHNpbXBsZV9icmlkZ2VfYXR0YWNoKHN0cnVjdCBkcm1fYnJpZGdlICpicmlkZ2UpCj4gIAkJCQkg
JnNpbXBsZV9icmlkZ2VfY29uX2hlbHBlcl9mdW5jcyk7Cj4gIAlyZXQgPSBkcm1fY29ubmVjdG9y
X2luaXQoYnJpZGdlLT5kZXYsICZzYnJpZGdlLT5jb25uZWN0b3IsCj4gIAkJCQkgJnNpbXBsZV9i
cmlkZ2VfY29uX2Z1bmNzLAo+IC0JCQkJIERSTV9NT0RFX0NPTk5FQ1RPUl9WR0EpOwo+ICsJCQkJ
IHNicmlkZ2UtPmluZm8tPnR5cGUpOwo+ICAJaWYgKHJldCkgewo+ICAJCURSTV9FUlJPUigiRmFp
bGVkIHRvIGluaXRpYWxpemUgY29ubmVjdG9yXG4iKTsKPiAgCQlyZXR1cm4gcmV0Owo+IEBAIC0x
ODIsNiArMTg5LDggQEAgc3RhdGljIGludCBzaW1wbGVfYnJpZGdlX3Byb2JlKHN0cnVjdCBwbGF0
Zm9ybV9kZXZpY2UgKnBkZXYpCj4gIAkJcmV0dXJuIC1FTk9NRU07Cj4gIAlwbGF0Zm9ybV9zZXRf
ZHJ2ZGF0YShwZGV2LCBzYnJpZGdlKTsKPiAgCj4gKwlzYnJpZGdlLT5pbmZvID0gb2ZfZGV2aWNl
X2dldF9tYXRjaF9kYXRhKCZwZGV2LT5kZXYpOwo+ICsKPiAgCXNicmlkZ2UtPnZkZCA9IGRldm1f
cmVndWxhdG9yX2dldF9vcHRpb25hbCgmcGRldi0+ZGV2LCAidmRkIik7Cj4gIAlpZiAoSVNfRVJS
KHNicmlkZ2UtPnZkZCkpIHsKPiAgCQlpbnQgcmV0ID0gUFRSX0VSUihzYnJpZGdlLT52ZGQpOwo+
IEBAIC0yMDQsNyArMjEzLDcgQEAgc3RhdGljIGludCBzaW1wbGVfYnJpZGdlX3Byb2JlKHN0cnVj
dCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCj4gIAo+ICAJc2JyaWRnZS0+YnJpZGdlLmZ1bmNzID0g
JnNpbXBsZV9icmlkZ2VfYnJpZGdlX2Z1bmNzOwo+ICAJc2JyaWRnZS0+YnJpZGdlLm9mX25vZGUg
PSBwZGV2LT5kZXYub2Zfbm9kZTsKPiAtCXNicmlkZ2UtPmJyaWRnZS50aW1pbmdzID0gb2ZfZGV2
aWNlX2dldF9tYXRjaF9kYXRhKCZwZGV2LT5kZXYpOwo+ICsJc2JyaWRnZS0+YnJpZGdlLnRpbWlu
Z3MgPSBzYnJpZGdlLT5pbmZvLT50aW1pbmdzOwo+ICAKPiAgCWRybV9icmlkZ2VfYWRkKCZzYnJp
ZGdlLT5icmlkZ2UpOwo+ICAKPiBAQCAtMjY0LDE5ICsyNzMsMjcgQEAgc3RhdGljIGNvbnN0IHN0
cnVjdCBkcm1fYnJpZGdlX3RpbWluZ3MgdGlfdGhzODEzNV9icmlkZ2VfdGltaW5ncyA9IHsKPiAg
c3RhdGljIGNvbnN0IHN0cnVjdCBvZl9kZXZpY2VfaWQgc2ltcGxlX2JyaWRnZV9tYXRjaFtdID0g
ewo+ICAJewo+ICAJCS5jb21wYXRpYmxlID0gImR1bWItdmdhLWRhYyIsCj4gLQkJLmRhdGEgPSBO
VUxMLAo+IC0JfSwKPiAtCXsKPiArCQkuZGF0YSA9ICYoY29uc3Qgc3RydWN0IHNpbXBsZV9icmlk
Z2VfaW5mbykgewo+ICsJCQkudHlwZSA9IERSTV9NT0RFX0NPTk5FQ1RPUl9WR0EsCj4gKwkJfSwK
PiArCX0sIHsKPiAgCQkuY29tcGF0aWJsZSA9ICJhZGksYWR2NzEyMyIsCj4gLQkJLmRhdGEgPSAm
ZGVmYXVsdF9icmlkZ2VfdGltaW5ncywKPiAtCX0sCj4gLQl7Cj4gKwkJLmRhdGEgPSAmKGNvbnN0
IHN0cnVjdCBzaW1wbGVfYnJpZGdlX2luZm8pIHsKPiArCQkJLnRpbWluZ3MgPSAmZGVmYXVsdF9i
cmlkZ2VfdGltaW5ncywKPiArCQkJLnR5cGUgPSBEUk1fTU9ERV9DT05ORUNUT1JfVkdBLAo+ICsJ
CX0sCj4gKwl9LCB7Cj4gIAkJLmNvbXBhdGlibGUgPSAidGksdGhzODEzNSIsCj4gLQkJLmRhdGEg
PSAmdGlfdGhzODEzNV9icmlkZ2VfdGltaW5ncywKPiAtCX0sCj4gLQl7Cj4gKwkJLmRhdGEgPSAm
KGNvbnN0IHN0cnVjdCBzaW1wbGVfYnJpZGdlX2luZm8pIHsKPiArCQkJLnRpbWluZ3MgPSAmdGlf
dGhzODEzNV9icmlkZ2VfdGltaW5ncywKPiArCQkJLnR5cGUgPSBEUk1fTU9ERV9DT05ORUNUT1Jf
VkdBLAo+ICsJCX0sCj4gKwl9LCB7Cj4gIAkJLmNvbXBhdGlibGUgPSAidGksdGhzODEzNCIsCj4g
LQkJLmRhdGEgPSAmdGlfdGhzODEzNF9icmlkZ2VfdGltaW5ncywKPiArCQkuZGF0YSA9ICYoY29u
c3Qgc3RydWN0IHNpbXBsZV9icmlkZ2VfaW5mbykgewo+ICsJCQkudGltaW5ncyA9ICZ0aV90aHM4
MTM0X2JyaWRnZV90aW1pbmdzLAo+ICsJCQkudHlwZSA9IERSTV9NT0RFX0NPTk5FQ1RPUl9WR0Es
Cj4gKwkJfSwKPiAgCX0sCj4gIAl7fSwKPiAgfTsKCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBs
aXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1h
bi9saXN0aW5mby9kcmktZGV2ZWw=
