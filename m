Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 16C003842D
	for <lists+dri-devel@lfdr.de>; Fri,  7 Jun 2019 08:11:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8326A8984D;
	Fri,  7 Jun 2019 06:10:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com
 [210.118.77.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 113FD8984D
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Jun 2019 06:10:56 +0000 (UTC)
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20190607061055euoutp01c2284aebe6611934278502dc22a0049d~l1b1egQtS2829428294euoutp01I
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Jun 2019 06:10:55 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20190607061055euoutp01c2284aebe6611934278502dc22a0049d~l1b1egQtS2829428294euoutp01I
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTP id
 20190607061054eucas1p131b508aac74138e2cbf72f6431562bdd~l1b0yNpKW0324403244eucas1p1J;
 Fri,  7 Jun 2019 06:10:54 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
 eusmges3new.samsung.com (EUCPMTA) with SMTP id 45.35.04325.EEFF9FC5; Fri,  7
 Jun 2019 07:10:54 +0100 (BST)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20190607061053eucas1p230b6bcfdf9fc1c35f966dda20a76fdd5~l1bzwq0f30856808568eucas1p2U;
 Fri,  7 Jun 2019 06:10:53 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
 eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20190607061053eusmtrp23fac0fbb5cffd1e0022737b402e1a61a~l1bzg2FxW1706517065eusmtrp2L;
 Fri,  7 Jun 2019 06:10:53 +0000 (GMT)
X-AuditID: cbfec7f5-b8fff700000010e5-79-5cf9ffee5131
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
 eusmgms2.samsung.com (EUCPMTA) with SMTP id FF.A5.04140.DEFF9FC5; Fri,  7
 Jun 2019 07:10:53 +0100 (BST)
Received: from [106.120.51.74] (unknown [106.120.51.74]) by
 eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20190607061052eusmtip19fc68647439cbb0ce77d31ed7cd81e83~l1by4bHMK2554825548eusmtip1a;
 Fri,  7 Jun 2019 06:10:52 +0000 (GMT)
Subject: Re: [PATCH v4 09/15] drm/bridge: tc358767: Use reported AUX
 transfer size
To: Andrey Smirnov <andrew.smirnov@gmail.com>, dri-devel@lists.freedesktop.org
From: Andrzej Hajda <a.hajda@samsung.com>
Message-ID: <136db777-5d62-642b-a359-b06ade4518b8@samsung.com>
Date: Fri, 7 Jun 2019 08:10:44 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190607044550.13361-10-andrew.smirnov@gmail.com>
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA01SbUhTYRjtvfdu9zo3u27ansyKhhQFmX0Ql7Iv8cf9JRJBZgO76kVXOmXz
 swKHRi4ttQ8Nt0JXhqGlZmpOREhpM8RSjHILNyn/JNgkkzKcy+0a+e+c85zzvs95eSlcbhdF
 UBptHq/TclkqsYTosS292/vdt6SO8ZZJmTLjMaZ00CBifn8YIpjX/XaM+bDoETPTDx0Yc+N2
 E8lM9D0QM1OuYYJpb3CKT0rY6VofxlpNUyRrNtaLWHelHWOrvTGsffIVxi50bmPf1Y5iiVSy
 JDadz9IU8Lp9xy9IMj1dFiy3fkvRJ88bwoDmwitQEAX0ITDecmIVSELJ6acIPi7UIIH8RHC3
 7ppIIAurk5dtq4QKRMa79wp6M4IXFi8pkDkEjWU25D9XQZ+B9iaP2I/D6ET4UWoV+004PYJB
 ed9n3D8Q07vB+9IRMMno4zDfUxfQCToKHrfMBvRwOgnctg6R4AmFt/UzhB8H0SdgZNpO+jFO
 b4eybjMuYCU4ZxoChYB2kWCeGkdC03jo/zqBC1gBs/YuUsCR4LP6A35cAu6n13AhbETQ3WFd
 CxyFIft4oD++unV73z5BPgW2XjMpPEsITM6FCjuEwJ2e+7ggy8B4XS64d4B7tHvtQCU8GVsU
 1yCVaV0z07o2pnVtTP/vbUREC1Ly+frsDF5/UMsXRuu5bH2+NiM6LSe7E61+r5EV+2IvGlhO
 HUQ0hVRSGUsuqeUirkBfnD2IgMJVYbKCsd9quSydK77M63JSdPlZvH4QbaEIlVJ2ZcP0eTmd
 weXxl3g+l9f9m2JUUIQBPRuNmt/quiBKXjYcLipUJ1OFF92lpybLta3nGixcyKabp9ss96qW
 lZ5WxXBLcO6ugfmqkpNfLDsfzSp8jkgplK+44rlf5e0JBnKzN9Yh3fgtLniHSJrSdCShMcnZ
 33L1wI2aP6nVZ9OcPzUhvvAc1/vqhqoIDWGpVEzENRueqwh9Jrd/D67Tc38BjrvOFVoDAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrFIsWRmVeSWpSXmKPExsVy+t/xu7pv//+MMVj+ks2iucPWoulQA6vF
 jyuHWSwO7jnOZHHl63s2iwdzbzJZdE5cwm5xedccNou7906wWKyff4vNgcvjwdT/TB47Z91l
 95jdMZPV4373cSaP/r8GHsdvbGfy+LxJzuPc1LNMARxRejZF+aUlqQoZ+cUltkrRhhZGeoaW
 FnpGJpZ6hsbmsVZGpkr6djYpqTmZZalF+nYJehnvtyxkKpgpXXH9/VGWBsa3ol2MHBwSAiYS
 F7fqdjFycQgJLGWUuPDmCGsXIydQXFxi9/y3zBC2sMSfa11sEEWvGSV29UwESwgLhEgcOtLD
 AmKLCPhJdM07wARSxCxwlkni9+6dUB3HGCVmLP4G1sEmoCnxd/NNNhCbV8BO4sO2aWBxFgEV
 icWrXoHFRQUiJM68X8ECUSMocXLmEzCbU8Be4vSD4+wgNrOAusSfeZeYIWx5ieats6FscYlb
 T+YzTWAUmoWkfRaSlllIWmYhaVnAyLKKUSS1tDg3PbfYSK84Mbe4NC9dLzk/dxMjMF63Hfu5
 ZQdj17vgQ4wCHIxKPLwzmH7GCLEmlhVX5h5ilOBgVhLhLbvwI0aINyWxsiq1KD++qDQntfgQ
 oynQcxOZpUST84GpJK8k3tDU0NzC0tDc2NzYzEJJnLdD4GCMkEB6YklqdmpqQWoRTB8TB6dU
 A2Og2b0wH3k7ryuNW/MN1rN+Wt7/5t2W+qa397Knq8iXqH51vmE4d9FNoeo7ymcYSneqZfDb
 7lt3ZNl6zX+NyqXLDl6wcv7mumbZ03uPBSWWa3M4sK/5UCmcUf9rWZ2ey7PHlhcy+Q/u3e76
 oCh0LavojgkC1rLffipun/2qOu95q+2zdfGBFcVKLMUZiYZazEXFiQBN/buq7QIAAA==
X-CMS-MailID: 20190607061053eucas1p230b6bcfdf9fc1c35f966dda20a76fdd5
X-Msg-Generator: CA
X-RootMTR: 20190607044641epcas1p429ad931d59b2c1c083f41c29d86d1a12
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20190607044641epcas1p429ad931d59b2c1c083f41c29d86d1a12
References: <20190607044550.13361-1-andrew.smirnov@gmail.com>
 <CGME20190607044641epcas1p429ad931d59b2c1c083f41c29d86d1a12@epcas1p4.samsung.com>
 <20190607044550.13361-10-andrew.smirnov@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=samsung.com; 
 s=mail20170921; t=1559887855;
 bh=+uR4qgy3oYGxG+0KpS+F/2Aej6rAjh5RXeKhbh9N708=;
 h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
 b=t0CBwA4DqmDAGphyKeL4lji26zHP4IZJ54cNVOhqVx0LJsUN/pohoqo/Njd/lL0DT
 00e9Q08Agn7X09NNvLABtLfaTlt+X4QNj/s7ycdjUcmjtoL3X6h1Be0DnG0WefeHee
 956TRaMdMyswH1PRgJqIwCi+Ihp3Q8OAOeDGqxFg=
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
Cc: Cory Tusar <cory.tusar@zii.aero>,
 Andrey Gusakov <andrey.gusakov@cogentembedded.com>,
 linux-kernel@vger.kernel.org, Tomi Valkeinen <tomi.valkeinen@ti.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Chris Healy <cphealy@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMDcuMDYuMjAxOSAwNjo0NSwgQW5kcmV5IFNtaXJub3Ygd3JvdGU6Cj4gRG9uJ3QgYXNzdW1l
IHRoYXQgcmVxdWVzdGVkIGRhdGEgdHJhbnNmZXIgc2l6ZSBpcyB0aGUgc2FtZSBhcyBhbW91bnQK
PiBvZiBkYXRhIHRoYXQgd2FzIHRyYW5zZmVycmVkLiBDaGFuZ2UgdGhlIGNvZGUgdG8gZ2V0IHRo
YXQgaW5mb3JtYXRpb24KPiBmcm9tIERQMF9BVVhTVEFUVVMgaW5zdGVhZC4KPgo+IFNpbmNlIHRo
ZSBjaGVjayBmb3IgQVVYX0JVU1kgaW4gdGNfYXV4X2dldF9zdGF0dXMoKSBpcyBwb2ludGxlc3Mg
KGl0Cj4gd2lsbCBhbHdheXMgY2FsbGVkIGFmdGVyIHRjX2F1eF93YWl0X2J1c3koKSkgYW5kIHRo
ZXJlJ3Mgb25seSBvbmUgdXNlcgo+IG9mIGl0LCBpbmxpbmUgaXRzIGNvZGUgaW50byB0Y19hdXhf
dHJhbnNmZXIoKSBpbnN0ZWFkIG9mIHRyeWluZyB0bwo+IGFjY29tbW9kYXRlIHRoZSBjaGFuZ2Ug
YWJvdmUuCj4KPiBTaWduZWQtb2ZmLWJ5OiBBbmRyZXkgU21pcm5vdiA8YW5kcmV3LnNtaXJub3ZA
Z21haWwuY29tPgpSZXZpZXdlZC1ieTogQW5kcnplaiBIYWpkYSA8YS5oYWpkYUBzYW1zdW5nLmNv
bT4KCsKgLS0KUmVnYXJkcwpBbmRyemVqCj4gQ2M6IEFuZHJ6ZWogSGFqZGEgPGEuaGFqZGFAc2Ft
c3VuZy5jb20+Cj4gQ2M6IExhdXJlbnQgUGluY2hhcnQgPExhdXJlbnQucGluY2hhcnRAaWRlYXNv
bmJvYXJkLmNvbT4KPiBDYzogVG9taSBWYWxrZWluZW4gPHRvbWkudmFsa2VpbmVuQHRpLmNvbT4K
PiBDYzogQW5kcmV5IEd1c2Frb3YgPGFuZHJleS5ndXNha292QGNvZ2VudGVtYmVkZGVkLmNvbT4K
PiBDYzogUGhpbGlwcCBaYWJlbCA8cC56YWJlbEBwZW5ndXRyb25peC5kZT4KPiBDYzogQ29yeSBU
dXNhciA8Y29yeS50dXNhckB6aWkuYWVybz4KPiBDYzogQ2hyaXMgSGVhbHkgPGNwaGVhbHlAZ21h
aWwuY29tPgo+IENjOiBMdWNhcyBTdGFjaCA8bC5zdGFjaEBwZW5ndXRyb25peC5kZT4KPiBDYzog
ZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+IENjOiBsaW51eC1rZXJuZWxAdmdlci5r
ZXJuZWwub3JnCj4gLS0tCj4gIGRyaXZlcnMvZ3B1L2RybS9icmlkZ2UvdGMzNTg3NjcuYyB8IDQw
ICsrKysrKysrKystLS0tLS0tLS0tLS0tLS0tLS0tLS0KPiAgMSBmaWxlIGNoYW5nZWQsIDEyIGlu
c2VydGlvbnMoKyksIDI4IGRlbGV0aW9ucygtKQo+Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1
L2RybS9icmlkZ2UvdGMzNTg3NjcuYyBiL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2UvdGMzNTg3Njcu
Ywo+IGluZGV4IDhiNTNkYzg5MDhkMy4uN2QwZmJiMTIxOTViIDEwMDY0NAo+IC0tLSBhL2RyaXZl
cnMvZ3B1L2RybS9icmlkZ2UvdGMzNTg3NjcuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9icmlk
Z2UvdGMzNTg3NjcuYwo+IEBAIC0xNTIsMTAgKzE1MiwxMCBAQAo+ICAjZGVmaW5lIERQMF9BVVhX
REFUQShpKQkJKDB4MDY2YyArIChpKSAqIDQpCj4gICNkZWZpbmUgRFAwX0FVWFJEQVRBKGkpCQko
MHgwNjdjICsgKGkpICogNCkKPiAgI2RlZmluZSBEUDBfQVVYU1RBVFVTCQkweDA2OGMKPiAtI2Rl
ZmluZSBBVVhfU1RBVFVTX01BU0sJCQkweGYwCj4gLSNkZWZpbmUgQVVYX1NUQVRVU19TSElGVAkJ
NAo+IC0jZGVmaW5lIEFVWF9USU1FT1VUCQkJQklUKDEpCj4gLSNkZWZpbmUgQVVYX0JVU1kJCQlC
SVQoMCkKPiArI2RlZmluZSBBVVhfQllURVMJCUdFTk1BU0soMTUsIDgpCj4gKyNkZWZpbmUgQVVY
X1NUQVRVUwkJR0VOTUFTSyg3LCA0KQo+ICsjZGVmaW5lIEFVWF9USU1FT1VUCQlCSVQoMSkKPiAr
I2RlZmluZSBBVVhfQlVTWQkJQklUKDApCj4gICNkZWZpbmUgRFAwX0FVWEkyQ0FEUgkJMHgwNjk4
Cj4gIAo+ICAvKiBMaW5rIFRyYWluaW5nICovCj4gQEAgLTI5OCwyOSArMjk4LDYgQEAgc3RhdGlj
IGludCB0Y19hdXhfd2FpdF9idXN5KHN0cnVjdCB0Y19kYXRhICp0YywgdW5zaWduZWQgaW50IHRp
bWVvdXRfbXMpCj4gIAkJCSAgICAgICAxMDAwLCAxMDAwICogdGltZW91dF9tcyk7Cj4gIH0KPiAg
Cj4gLXN0YXRpYyBpbnQgdGNfYXV4X2dldF9zdGF0dXMoc3RydWN0IHRjX2RhdGEgKnRjLCB1OCAq
cmVwbHkpCj4gLXsKPiAtCWludCByZXQ7Cj4gLQl1MzIgdmFsdWU7Cj4gLQo+IC0JcmV0ID0gcmVn
bWFwX3JlYWQodGMtPnJlZ21hcCwgRFAwX0FVWFNUQVRVUywgJnZhbHVlKTsKPiAtCWlmIChyZXQg
PCAwKQo+IC0JCXJldHVybiByZXQ7Cj4gLQo+IC0JaWYgKHZhbHVlICYgQVVYX0JVU1kpIHsKPiAt
CQlkZXZfZXJyKHRjLT5kZXYsICJhdXggYnVzeSFcbiIpOwo+IC0JCXJldHVybiAtRUJVU1k7Cj4g
LQl9Cj4gLQo+IC0JaWYgKHZhbHVlICYgQVVYX1RJTUVPVVQpIHsKPiAtCQlkZXZfZXJyKHRjLT5k
ZXYsICJhdXggYWNjZXNzIHRpbWVvdXQhXG4iKTsKPiAtCQlyZXR1cm4gLUVUSU1FRE9VVDsKPiAt
CX0KPiAtCj4gLQkqcmVwbHkgPSAodmFsdWUgJiBBVVhfU1RBVFVTX01BU0spID4+IEFVWF9TVEFU
VVNfU0hJRlQ7Cj4gLQlyZXR1cm4gMDsKPiAtfQo+IC0KPiAgc3RhdGljIGludCB0Y19hdXhfd3Jp
dGVfZGF0YShzdHJ1Y3QgdGNfZGF0YSAqdGMsIGNvbnN0IHZvaWQgKmRhdGEsCj4gIAkJCSAgICAg
c2l6ZV90IHNpemUpCj4gIHsKPiBAQCAtMzU2LDYgKzMzMyw3IEBAIHN0YXRpYyBzc2l6ZV90IHRj
X2F1eF90cmFuc2ZlcihzdHJ1Y3QgZHJtX2RwX2F1eCAqYXV4LAo+ICAJc3RydWN0IHRjX2RhdGEg
KnRjID0gYXV4X3RvX3RjKGF1eCk7Cj4gIAlzaXplX3Qgc2l6ZSA9IG1pbl90KHNpemVfdCwgRFBf
QVVYX01BWF9QQVlMT0FEX0JZVEVTIC0gMSwgbXNnLT5zaXplKTsKPiAgCXU4IHJlcXVlc3QgPSBt
c2ctPnJlcXVlc3QgJiB+RFBfQVVYX0kyQ19NT1Q7Cj4gKwl1MzIgYXV4c3RhdHVzOwo+ICAJaW50
IHJldDsKPiAgCj4gIAlpZiAoc2l6ZSA9PSAwKQo+IEBAIC0zOTMsMTAgKzM3MSwxNiBAQCBzdGF0
aWMgc3NpemVfdCB0Y19hdXhfdHJhbnNmZXIoc3RydWN0IGRybV9kcF9hdXggKmF1eCwKPiAgCWlm
IChyZXQpCj4gIAkJcmV0dXJuIHJldDsKPiAgCj4gLQlyZXQgPSB0Y19hdXhfZ2V0X3N0YXR1cyh0
YywgJm1zZy0+cmVwbHkpOwo+ICsJcmV0ID0gcmVnbWFwX3JlYWQodGMtPnJlZ21hcCwgRFAwX0FV
WFNUQVRVUywgJmF1eHN0YXR1cyk7Cj4gIAlpZiAocmV0KQo+ICAJCXJldHVybiByZXQ7Cj4gIAo+
ICsJaWYgKGF1eHN0YXR1cyAmIEFVWF9USU1FT1VUKQo+ICsJCXJldHVybiAtRVRJTUVET1VUOwo+
ICsKPiArCXNpemUgPSBGSUVMRF9HRVQoQVVYX0JZVEVTLCBhdXhzdGF0dXMpOwo+ICsJbXNnLT5y
ZXBseSA9IEZJRUxEX0dFVChBVVhfU1RBVFVTLCBhdXhzdGF0dXMpOwo+ICsKPiAgCXN3aXRjaCAo
cmVxdWVzdCkgewo+ICAJY2FzZSBEUF9BVVhfTkFUSVZFX1JFQUQ6Cj4gIAljYXNlIERQX0FVWF9J
MkNfUkVBRDoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcK
aHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
