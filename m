Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4213638430
	for <lists+dri-devel@lfdr.de>; Fri,  7 Jun 2019 08:13:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 18178899DB;
	Fri,  7 Jun 2019 06:13:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com
 [210.118.77.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 65CBE899DB
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Jun 2019 06:13:35 +0000 (UTC)
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20190607061334euoutp016952381bb3790f305852c042b64b0428~l1eJi0Rep3086330863euoutp01K
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Jun 2019 06:13:34 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20190607061334euoutp016952381bb3790f305852c042b64b0428~l1eJi0Rep3086330863euoutp01K
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTP id
 20190607061333eucas1p272a5a2820d275b3184631fd6a01e3ca2~l1eJJ_4Md0641406414eucas1p2U;
 Fri,  7 Jun 2019 06:13:33 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
 eusmges2new.samsung.com (EUCPMTA) with SMTP id 36.2D.04377.D800AFC5; Fri,  7
 Jun 2019 07:13:33 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20190607061332eucas1p2c4290d1bbd0970a34db5114ede6bb7ce~l1eIYI75b0641406414eucas1p2T;
 Fri,  7 Jun 2019 06:13:32 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20190607061332eusmtrp1f1ffcc682274f1ebc98b9fb1f1e2384a~l1eIIdZ1H0381503815eusmtrp1k;
 Fri,  7 Jun 2019 06:13:32 +0000 (GMT)
X-AuditID: cbfec7f4-12dff70000001119-83-5cfa008da2fb
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
 eusmgms2.samsung.com (EUCPMTA) with SMTP id 37.D5.04140.C800AFC5; Fri,  7
 Jun 2019 07:13:32 +0100 (BST)
Received: from [106.120.51.74] (unknown [106.120.51.74]) by
 eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20190607061331eusmtip1638d4530bab6b44407d46d2f883ecdad~l1eHY7X1j3106031060eusmtip1j;
 Fri,  7 Jun 2019 06:13:31 +0000 (GMT)
Subject: Re: [PATCH v4 10/15] drm/bridge: tc358767: Add support for
 address-only I2C transfers
To: Andrey Smirnov <andrew.smirnov@gmail.com>, dri-devel@lists.freedesktop.org
From: Andrzej Hajda <a.hajda@samsung.com>
Message-ID: <471cea60-0eb6-920d-bf2f-c34bc3a0b272@samsung.com>
Date: Fri, 7 Jun 2019 08:13:24 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190607044550.13361-11-andrew.smirnov@gmail.com>
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA01Se0hTcRj1d1+7jibXaezLJGlJklCujLpimkHEKIIeBllSLr1Ma1uymzOL
 aEyx5QMzezkNhRQtRc3HzOUfupHTTDMrNPNFSdDDjErS0sx5lfzvfOec7/edAz8al7aRPnSC
 7hyn16k0ckpMWNumn2/MdvsdrfiW5summsNYk91IslOvHATb2uzE2FeTExQ7evcNxl7NLRGx
 L22FFDs03E6w1UUDVIRYOXpzDlM2WYZEygJzPqkcyXRiypxZhdLZ34gpf9SuUXbf7MIO0MfE
 O+I4TYKB0weFx4jjczPbycQWON96v4o0omdeGcidBmYr5AwW4RlITEuZcgS/zR+QMPxEMFs5
 RwrDDwSVtTNoaeVWxT2RC0uZMgQfSg4LpnEEpvwv8wJNezExYC1Z8HszB+C7qYlyeXCmE4Mr
 tre4S6CYDTBb94ZyYQkTDkNPrAs8wfhDl71mYXklcxRG2mpIweMJHfljhAu7MzsheyxnIQTO
 +EFqQwEuYBkMjBVhrmPADIvgc08jJaTeDRMlTxcbeMEnZ71IwL7QmZdFCPgyjJSn4cKyGUFD
 TRMuCKHgcL4gXc3w+dTVtiCB3gXvjfXIRQPjAf3jnkIGD7huvY0LtATM6VLBvRZGuhoWH5RB
 ac8kdQ3JLcuaWZa1sSxrY/l/txgRD5CMS+K1ao7fouOSN/EqLZ+kU2+KPautRfO/q/Ov8+cj
 ZJs5ZUcMjeQrJBFu09FSUmXgU7R2BDQu95YYeqaipZI4VcoFTn/2pD5Jw/F2tJom5DLJRbfR
 41JGrTrHneG4RE6/pGK0u48RQWSFOjTZ5vfLnr49oeV0gNSfn9DsJcgow9fJXsq79J1nQCu6
 NHli1Yq4qPRDirmPmcmYBm7IoquCI73+KIYNxWErra2V6wpf1/f17WupC9GnDW58VnEnb33W
 kS7H42CzKLDYsdWxP7LMh91j0m7rduuItXFW3cPIg8G9g80hcoKPV20OxPW86h8CSd7/WQMA
 AA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrJIsWRmVeSWpSXmKPExsVy+t/xu7o9DL9iDPomalo0d9haNB1qYLX4
 ceUwi8XBPceZLK58fc9m8WDuTSaLzolL2C0u75rDZnH33gkWi/Xzb7E5cHk8mPqfyWPnrLvs
 HrM7ZrJ63O8+zuTR/9fA4/iN7UwenzfJeZybepYpgCNKz6Yov7QkVSEjv7jEVina0MJIz9DS
 Qs/IxFLP0Ng81srIVEnfziYlNSezLLVI3y5BL2Ni9wnWggMSFQdXrmNtYDwj3MXIySEhYCIx
 bfVi9i5GLg4hgaWMEr9afjJDJMQlds9/C2ULS/y51sUGYgsJvGaU6Ntr2cXIwSEskCCxbQkj
 SFhEwE+ia94BJpA5zAJnmSR+797JBjH0GKPE0reT2EGq2AQ0Jf5uvgk2iFfATuLu0W1gC1gE
 VCTOHtoANklUIELizPsVLBA1ghInZz4BszkF7CV6n/SDzWEWUJf4M+8SM4QtL9G8dTaULS5x
 68l8pgmMQrOQtM9C0jILScssJC0LGFlWMYqklhbnpucWG+kVJ+YWl+al6yXn525iBEbrtmM/
 t+xg7HoXfIhRgINRiYd3BtPPGCHWxLLiytxDjBIczEoivGUXfsQI8aYkVlalFuXHF5XmpBYf
 YjQFem4is5Rocj4wkeSVxBuaGppbWBqaG5sbm1koifN2CByMERJITyxJzU5NLUgtgulj4uCU
 amC0cr8fo3pltv1+/sm8i7gzLGI7mB8cmLSUN3q/kYaxQLZwv3zdya6DPAYdMzezfrvyarOG
 8Zcm5ddRAtnp1/dnHee+t9y4mfnfK59ld2eZlzI9SLA9yq/y+PmjV/MFGSTef+s765nlkzp9
 6nLN+pCb22XcdYyK8zxPmgdtO6Y8/9WK6DvvWQ4osRRnJBpqMRcVJwIAcivIAuwCAAA=
X-CMS-MailID: 20190607061332eucas1p2c4290d1bbd0970a34db5114ede6bb7ce
X-Msg-Generator: CA
X-RootMTR: 20190607044643epcas3p288c95d8f86c74056677b22b27ca2fe30
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20190607044643epcas3p288c95d8f86c74056677b22b27ca2fe30
References: <20190607044550.13361-1-andrew.smirnov@gmail.com>
 <CGME20190607044643epcas3p288c95d8f86c74056677b22b27ca2fe30@epcas3p2.samsung.com>
 <20190607044550.13361-11-andrew.smirnov@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=samsung.com; 
 s=mail20170921; t=1559888014;
 bh=rY1LsFvS8wHdYvQgg3J28EeOngDObvqh8vabpmaHDEE=;
 h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
 b=BhKxYUCXikFGilgRAlYQ4xx+flCzIgGh+qmpVc+gNLOv18/9frJUonl1YfjZ37eg6
 2ea7oOxJJ7hWZBA4vywc3DI/5dZLCijVAyDSl6+ephYUGSfjmgXuVmGc4dzCE7Duk0
 1aM32DkiBqm/8/tdaX3Yulvar4dz5RKQUk6TgJSw=
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

T24gMDcuMDYuMjAxOSAwNjo0NSwgQW5kcmV5IFNtaXJub3Ygd3JvdGU6Cj4gVHJhbnNmZXIgc2l6
ZSBvZiB6ZXJvIG1lYW5zIGEgcmVxdWVzdCB0byBkbyBhbiBhZGRyZXNzLW9ubHkKPiB0cmFuc2Zl
ci4gU2luY2UgdGhlIEhXIHN1cHBvcnQgdGhpcywgd2UgcHJvYmFibHkgc2hvdWxkbid0IGJlIGp1
c3QKPiBpZ25vcmluZyBzdWNoIHJlcXVlc3RzLiBXaGlsZSBhdCBpdCBhbGxvdyBEUF9BVVhfSTJD
X01PVCBmbGFnIHRvIHBhc3MKPiB0aHJvdWdoLCBzaW5jZSBpdCBpcyBzdXBwb3J0ZWQgYnkgdGhl
IEhXIGFzIHdlbGwuCj4KPiBTaWduZWQtb2ZmLWJ5OiBBbmRyZXkgU21pcm5vdiA8YW5kcmV3LnNt
aXJub3ZAZ21haWwuY29tPgpSZXZpZXdlZC1ieTogQW5kcnplaiBIYWpkYSA8YS5oYWpkYUBzYW1z
dW5nLmNvbT4KCsKgLS0KUmVnYXJkcwpBbmRyemVqCj4gQ2M6IEFuZHJ6ZWogSGFqZGEgPGEuaGFq
ZGFAc2Ftc3VuZy5jb20+Cj4gQ2M6IExhdXJlbnQgUGluY2hhcnQgPExhdXJlbnQucGluY2hhcnRA
aWRlYXNvbmJvYXJkLmNvbT4KPiBDYzogVG9taSBWYWxrZWluZW4gPHRvbWkudmFsa2VpbmVuQHRp
LmNvbT4KPiBDYzogQW5kcmV5IEd1c2Frb3YgPGFuZHJleS5ndXNha292QGNvZ2VudGVtYmVkZGVk
LmNvbT4KPiBDYzogUGhpbGlwcCBaYWJlbCA8cC56YWJlbEBwZW5ndXRyb25peC5kZT4KPiBDYzog
Q29yeSBUdXNhciA8Y29yeS50dXNhckB6aWkuYWVybz4KPiBDYzogQ2hyaXMgSGVhbHkgPGNwaGVh
bHlAZ21haWwuY29tPgo+IENjOiBMdWNhcyBTdGFjaCA8bC5zdGFjaEBwZW5ndXRyb25peC5kZT4K
PiBDYzogZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+IENjOiBsaW51eC1rZXJuZWxA
dmdlci5rZXJuZWwub3JnCj4gLS0tCj4gIGRyaXZlcnMvZ3B1L2RybS9icmlkZ2UvdGMzNTg3Njcu
YyB8IDMwICsrKysrKysrKysrKysrKysrKysrKysrLS0tLS0tLQo+ICAxIGZpbGUgY2hhbmdlZCwg
MjMgaW5zZXJ0aW9ucygrKSwgNyBkZWxldGlvbnMoLSkKPgo+IGRpZmYgLS1naXQgYS9kcml2ZXJz
L2dwdS9kcm0vYnJpZGdlL3RjMzU4NzY3LmMgYi9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL3RjMzU4
NzY3LmMKPiBpbmRleCA3ZDBmYmIxMjE5NWIuLjRiYjliMTVlMTMyNCAxMDA2NDQKPiAtLS0gYS9k
cml2ZXJzL2dwdS9kcm0vYnJpZGdlL3RjMzU4NzY3LmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0v
YnJpZGdlL3RjMzU4NzY3LmMKPiBAQCAtMTQ1LDYgKzE0NSw4IEBACj4gIAo+ICAvKiBBVVggY2hh
bm5lbCAqLwo+ICAjZGVmaW5lIERQMF9BVVhDRkcwCQkweDA2NjAKPiArI2RlZmluZSBEUDBfQVVY
Q0ZHMF9CU0laRQlHRU5NQVNLKDExLCA4KQo+ICsjZGVmaW5lIERQMF9BVVhDRkcwX0FERFJfT05M
WQlCSVQoNCkKPiAgI2RlZmluZSBEUDBfQVVYQ0ZHMQkJMHgwNjY0Cj4gICNkZWZpbmUgQVVYX1JY
X0ZJTFRFUl9FTgkJQklUKDE2KQo+ICAKPiBAQCAtMzI3LDYgKzMyOSwxOCBAQCBzdGF0aWMgaW50
IHRjX2F1eF9yZWFkX2RhdGEoc3RydWN0IHRjX2RhdGEgKnRjLCB2b2lkICpkYXRhLCBzaXplX3Qg
c2l6ZSkKPiAgCXJldHVybiBzaXplOwo+ICB9Cj4gIAo+ICtzdGF0aWMgdTMyIHRjX2F1eGNmZzAo
c3RydWN0IGRybV9kcF9hdXhfbXNnICptc2csIHNpemVfdCBzaXplKQo+ICt7Cj4gKwl1MzIgYXV4
Y2ZnMCA9IG1zZy0+cmVxdWVzdDsKPiArCj4gKwlpZiAoc2l6ZSkKPiArCQlhdXhjZmcwIHw9IEZJ
RUxEX1BSRVAoRFAwX0FVWENGRzBfQlNJWkUsIHNpemUgLSAxKTsKPiArCWVsc2UKPiArCQlhdXhj
ZmcwIHw9IERQMF9BVVhDRkcwX0FERFJfT05MWTsKPiArCj4gKwlyZXR1cm4gYXV4Y2ZnMDsKPiAr
fQo+ICsKPiAgc3RhdGljIHNzaXplX3QgdGNfYXV4X3RyYW5zZmVyKHN0cnVjdCBkcm1fZHBfYXV4
ICphdXgsCj4gIAkJCSAgICAgICBzdHJ1Y3QgZHJtX2RwX2F1eF9tc2cgKm1zZykKPiAgewo+IEBA
IC0zMzYsOSArMzUwLDYgQEAgc3RhdGljIHNzaXplX3QgdGNfYXV4X3RyYW5zZmVyKHN0cnVjdCBk
cm1fZHBfYXV4ICphdXgsCj4gIAl1MzIgYXV4c3RhdHVzOwo+ICAJaW50IHJldDsKPiAgCj4gLQlp
ZiAoc2l6ZSA9PSAwKQo+IC0JCXJldHVybiAwOwo+IC0KPiAgCXJldCA9IHRjX2F1eF93YWl0X2J1
c3kodGMsIDEwMCk7Cj4gIAlpZiAocmV0KQo+ICAJCXJldHVybiByZXQ7Cj4gQEAgLTM2Miw4ICsz
NzMsNyBAQCBzdGF0aWMgc3NpemVfdCB0Y19hdXhfdHJhbnNmZXIoc3RydWN0IGRybV9kcF9hdXgg
KmF1eCwKPiAgCWlmIChyZXQpCj4gIAkJcmV0dXJuIHJldDsKPiAgCS8qIFN0YXJ0IHRyYW5zZmVy
ICovCj4gLQlyZXQgPSByZWdtYXBfd3JpdGUodGMtPnJlZ21hcCwgRFAwX0FVWENGRzAsCj4gLQkJ
CSAgICgoc2l6ZSAtIDEpIDw8IDgpIHwgcmVxdWVzdCk7Cj4gKwlyZXQgPSByZWdtYXBfd3JpdGUo
dGMtPnJlZ21hcCwgRFAwX0FVWENGRzAsIHRjX2F1eGNmZzAobXNnLCBzaXplKSk7Cj4gIAlpZiAo
cmV0KQo+ICAJCXJldHVybiByZXQ7Cj4gIAo+IEBAIC0zNzcsOCArMzg3LDE0IEBAIHN0YXRpYyBz
c2l6ZV90IHRjX2F1eF90cmFuc2ZlcihzdHJ1Y3QgZHJtX2RwX2F1eCAqYXV4LAo+ICAKPiAgCWlm
IChhdXhzdGF0dXMgJiBBVVhfVElNRU9VVCkKPiAgCQlyZXR1cm4gLUVUSU1FRE9VVDsKPiAtCj4g
LQlzaXplID0gRklFTERfR0VUKEFVWF9CWVRFUywgYXV4c3RhdHVzKTsKPiArCS8qCj4gKwkgKiBG
b3Igc29tZSByZWFzb24gYWRkcmVzcy1vbmx5IERQX0FVWF9JMkNfV1JJVEUgKE1PVCksIHN0aWxs
Cj4gKwkgKiByZXBvcnRzIDEgYnl0ZSB0cmFuc2ZlcnJlZCBpbiBpdHMgc3RhdHVzLiBUbyBkZWFs
IHdlIHRoYXQKPiArCSAqIHdlIGlnbm9yZSBhdXhfYnl0ZXMgZmllbGQgaWYgd2Uga25vdyB0aGF0
IHRoaXMgd2FzIGFuCj4gKwkgKiBhZGRyZXNzLW9ubHkgdHJhbnNmZXIKPiArCSAqLwo+ICsJaWYg
KHNpemUpCj4gKwkJc2l6ZSA9IEZJRUxEX0dFVChBVVhfQllURVMsIGF1eHN0YXR1cyk7Cj4gIAlt
c2ctPnJlcGx5ID0gRklFTERfR0VUKEFVWF9TVEFUVVMsIGF1eHN0YXR1cyk7Cj4gIAo+ICAJc3dp
dGNoIChyZXF1ZXN0KSB7CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJp
LWRldmVs
