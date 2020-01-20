Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 98DE414311A
	for <lists+dri-devel@lfdr.de>; Mon, 20 Jan 2020 18:51:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 53C986EA5B;
	Mon, 20 Jan 2020 17:51:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com
 [210.118.77.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F34D96EA5B
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Jan 2020 17:51:17 +0000 (UTC)
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20200120175116euoutp0179e65d6e8a0251992e677c175632c68d~rqbH7SxjQ0179201792euoutp01V
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Jan 2020 17:51:16 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20200120175116euoutp0179e65d6e8a0251992e677c175632c68d~rqbH7SxjQ0179201792euoutp01V
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1579542676;
 bh=LQu0WAK7L/G6p0pzpWUx1m8ZKHecfzvgq8NfbkxkCU0=;
 h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
 b=Ar8vgtECytJfvywEpNTjcLzPPy4YhgYqBqnmLZB+24xagcWdNkLH/qdm4tpq2nQgX
 ddj9O6xsUjNaRtLtSvOzqfDU0bWmlRfy4ctibvwTGQbakpLWOr1W3K2MG+XCJifRr/
 ZzrziM+Q0lmcxHW9wyeJXc2TG98tjgn/mMcFyZyQ=
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTP id
 20200120175116eucas1p2f7a33189967472123183610637356d7d~rqbHvE8lL3191431914eucas1p2m;
 Mon, 20 Jan 2020 17:51:16 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
 eusmges1new.samsung.com (EUCPMTA) with SMTP id AC.13.61286.398E52E5; Mon, 20
 Jan 2020 17:51:15 +0000 (GMT)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20200120175115eucas1p16442cb8229ee7e4c54459a67902e12ec~rqbHVEuxl3013830138eucas1p1Y;
 Mon, 20 Jan 2020 17:51:15 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
 eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20200120175115eusmtrp2079e2c08a928be485a3beb72e37b7782~rqbHUf0L83183031830eusmtrp2F;
 Mon, 20 Jan 2020 17:51:15 +0000 (GMT)
X-AuditID: cbfec7f2-ef1ff7000001ef66-e2-5e25e893b0d7
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
 eusmgms2.samsung.com (EUCPMTA) with SMTP id A8.B8.07950.398E52E5; Mon, 20
 Jan 2020 17:51:15 +0000 (GMT)
Received: from [106.120.51.71] (unknown [106.120.51.71]) by
 eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20200120175113eusmtip2d62b016876d122c0463336b601643865~rqbFXydCR2105521055eusmtip2J;
 Mon, 20 Jan 2020 17:51:13 +0000 (GMT)
Subject: Re: [PATCH] fbdev: wait for references go away
To: Gerd Hoffmann <kraxel@redhat.com>, dri-devel@lists.freedesktop.org
From: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Message-ID: <d143e43b-8a38-940e-3ae5-e7b830a74bb3@samsung.com>
Date: Mon, 20 Jan 2020 18:51:17 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20200120100014.23488-1-kraxel@redhat.com>
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprLKsWRmVeSWpSXmKPExsWy7djPc7qTX6jGGaz4ZGZx5et7Notnt04y
 W5zo+8BqcXnXHDaLz427WBxYPXr33WP3uN99nMnj/b6rbB6fN8kFsERx2aSk5mSWpRbp2yVw
 Zfz6s5CpYJ1wxeSnX1kaGF/zdzFyckgImEjMb//P3MXIxSEksIJR4uj9/UwQzhdGiWfbf7JC
 OJ8ZJeZ9WMEO0/Lq0hKoluWMElPmv2WBcN4ySqzbcpoZpEpYwFzi0YdXYLaIgJvE5RmrwYqY
 BXoYJV4fnAOWYBOwkpjYvooRxOYVsJN4dv0bE4jNIqAqse7QGzYQW1QgQuLTg8OsEDWCEidn
 PmEBsTmBFpw61ARWwywgLnHryXwmCFteonnrbGaIUxexS/yfVQhhu0h8+Hka6gVhiVfHt0DZ
 MhL/d84He1pCYB2jxN+OF8wQznZGieWT/7FBVFlL3Dn3C8jmANqgKbF+lz5E2FHiS9MSdpCw
 hACfxI23ghA38ElM2jadGSLMK9HRJgRRrSaxYdkGNpi1XTtXMk9gVJqF5LNZSL6ZheSbWQh7
 FzCyrGIUTy0tzk1PLTbMSy3XK07MLS7NS9dLzs/dxAhMNKf/Hf+0g/HrpaRDjAIcjEo8vA7T
 VOOEWBPLiitzDzFKcDArifAuaAIK8aYkVlalFuXHF5XmpBYfYpTmYFES5zVe9DJWSCA9sSQ1
 OzW1ILUIJsvEwSnVwDiho1misqlCL+bEMcuQV0ybmeYobAs4l6ry4abyntM/Req/7rzCrrv6
 k3nl/80Trc0PNXxU3JveLsAbHdR5O9XJjqlaq0Tn4/vbMrF9IauKWDv+l2y2U+kSf7nW57WX
 9rl0vhQj8yfdwou73srF6SlO+XWyhKNE9fLhwjUzX/34JNNdeyHcXImlOCPRUIu5qDgRAPmj
 oRYwAwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrPIsWRmVeSWpSXmKPExsVy+t/xe7qTX6jGGTx8I2dx5et7Notnt04y
 W5zo+8BqcXnXHDaLz427WBxYPXr33WP3uN99nMnj/b6rbB6fN8kFsETp2RTll5akKmTkF5fY
 KkUbWhjpGVpa6BmZWOoZGpvHWhmZKunb2aSk5mSWpRbp2yXoZfz6s5CpYJ1wxeSnX1kaGF/z
 dzFyckgImEi8urSEuYuRi0NIYCmjxO+H6xm7GDmAEjISx9eXQdQIS/y51sUGUfOaUeLqwaWM
 IAlhAXOJRx9eMYPYIgJuEpdnrGYBKWIW6GOUuLFnPztERxejxN15X8A62ASsJCa2rwKzeQXs
 JJ5d/8YEYrMIqEqsO/SGDcQWFYiQOLxjFlSNoMTJmU9YQGxOoG2nDjWB1TALqEv8mXeJGcIW
 l7j1ZD4ThC0v0bx1NvMERqFZSNpnIWmZhaRlFpKWBYwsqxhFUkuLc9Nzi430ihNzi0vz0vWS
 83M3MQIja9uxn1t2MHa9Cz7EKMDBqMTD6zBNNU6INbGsuDL3EKMEB7OSCO+CJqAQb0piZVVq
 UX58UWlOavEhRlOg5yYyS4km5wOjPq8k3tDU0NzC0tDc2NzYzEJJnLdD4GCMkEB6Yklqdmpq
 QWoRTB8TB6dUA6OuxtdCkZRrnVKb7NvK1j+xeaxurBa7fuVahvmmn+Y/eaK1rH7r8+JlSq48
 oY9r+xiWhOg4f+KKlhe12tD04oPLE/n1ye8K+d/rPq1dMS2nsD1mewjLtqKP6yK/Ju/s+9aa
 0SPCvOm4VvyHBxt4HR0EBS3PNH5N0psRu9p3HeMMBZFD+3YE6iuxFGckGmoxFxUnAgAK4CPR
 wgIAAA==
X-CMS-MailID: 20200120175115eucas1p16442cb8229ee7e4c54459a67902e12ec
X-Msg-Generator: CA
X-RootMTR: 20200120100025eucas1p21f5e2da0fd7c1fcb33cb47a97e9e645c
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20200120100025eucas1p21f5e2da0fd7c1fcb33cb47a97e9e645c
References: <CGME20200120100025eucas1p21f5e2da0fd7c1fcb33cb47a97e9e645c@eucas1p2.samsung.com>
 <20200120100014.23488-1-kraxel@redhat.com>
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
Cc: "open list:FRAMEBUFFER LAYER" <linux-fbdev@vger.kernel.org>,
 marmarek@invisiblethingslab.com, open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

CkhpLAoKT24gMS8yMC8yMCAxMTowMCBBTSwgR2VyZCBIb2ZmbWFubiB3cm90ZToKPiBQcm9ibGVt
OiBkb191bnJlZ2lzdGVyX2ZyYW1lYnVmZmVyKCkgbWlnaHQgcmV0dXJuIGJlZm9yZSB0aGUgZGV2
aWNlIGlzCj4gZnVsbHkgY2xlYW5lZCB1cCwgZHVlIHRvIHVzZXJzcGFjZSBoYXZpbmcgYSBmaWxl
IGhhbmRsZSBmb3IgL2Rldi9mYjAKCmRvX3VucmVnaXN0ZXJfZnJhbWVidWZmZXIoKSBkb2Vzbid0
IGd1YXJhbnRlZSB0aGF0IGZiX2luZm8gaXMgZnJlZWQgYWZ0ZXIKZnVuY3Rpb24ncyByZXR1cm4g
KGl0IG9ubHkgZHJvcHMgdGhlIGtlcm5lbCByZWZlcmVuY2Ugb24gZmJfaW5mbykuCgo+IG9wZW4u
ICBXaGljaCBjYW4gcmVzdWx0IGluIGRybSBkcml2ZXIgbm90IGJlaW5nIGFibGUgdG8gZ3JhYiBy
ZXNvdXJjZXMKPiAoYW5kIGZhaWwgaW5pdGlhbGl6YXRpb24pIGJlY2F1c2UgdGhlIGZpcm13YXJl
IGZyYW1lYnVmZmVyIHN0aWxsIGhvbGRzCj4gdGhlbS4gIFJlcG9ydGVkbHkgcGx5bW91dGggY2Fu
IHRyaWdnZXIgdGhpcy4KCkNvdWxkIHlvdSBwbGVhc2UgZGVzY3JpYmUgaXNzdWUgc29tZSBtb3Jl
PwoKSSBndWVzcyB0aGF0IGEgcHJvYmxlbSBpcyBoYXBwZW5pbmcgZHVyaW5nIERSTSBkcml2ZXIg
bG9hZCB3aGlsZSBmYmRldgpkcml2ZXIgaXMgbG9hZGVkPyBJIGFzc3VtZSBkb191bnJlZ2lzdGVy
X2ZyYW1lYnVmZmVyKCkgaXMgY2FsbGVkIGluc2lkZQpkb19yZW1vdmVfY29uZmxpY3RpbmdfZnJh
bWVidWZmZXJzKCk/CgpBdCBmaXJzdCBnbGFuY2UgaXQgc2VlbXMgdG8gYmUgYW4gdXNlci1zcGFj
ZSBpc3N1ZSBhcyBpdCBzaG91bGQgbm90IGJlCmhvbGRpbmcgcmVmZXJlbmNlcyBvbiAvZGV2L2Zi
MCB3aGlsZSBEUk0gZHJpdmVyIGlzIGJlaW5nIGxvYWRlZC4KCj4gRml4IHRoaXMgYnkgdHJ5aW5n
IHRvIHdhaXQgdW50aWwgYWxsIHJlZmVyZW5jZXMgYXJlIGdvbmUuICBEb24ndCB3YWl0Cj4gZm9y
ZXZlciB0aG91Z2ggZ2l2ZW4gdGhhdCB1c2Vyc3BhY2UgbWlnaHQga2VlcCB0aGUgZmlsZSBoYW5k
bGUgb3Blbi4KCldoZXJlIGRvZXMgdGhlIDFzIG1heGltdW0gZGVsYXkgY29tZSBmcm9tPwoKQmVz
dCByZWdhcmRzLAotLQpCYXJ0bG9taWVqIFpvbG5pZXJraWV3aWN6ClNhbXN1bmcgUiZEIEluc3Rp
dHV0ZSBQb2xhbmQKU2Ftc3VuZyBFbGVjdHJvbmljcwoKPiBSZXBvcnRlZC1ieTogTWFyZWsgTWFy
Y3p5a293c2tpLUfDs3JlY2tpIDxtYXJtYXJla0BpbnZpc2libGV0aGluZ3NsYWIuY29tPgo+IFNp
Z25lZC1vZmYtYnk6IEdlcmQgSG9mZm1hbm4gPGtyYXhlbEByZWRoYXQuY29tPgo+IC0tLQo+ICBk
cml2ZXJzL3ZpZGVvL2ZiZGV2L2NvcmUvZmJtZW0uYyB8IDcgKysrKysrKwo+ICAxIGZpbGUgY2hh
bmdlZCwgNyBpbnNlcnRpb25zKCspCj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvdmlkZW8vZmJk
ZXYvY29yZS9mYm1lbS5jIGIvZHJpdmVycy92aWRlby9mYmRldi9jb3JlL2ZibWVtLmMKPiBpbmRl
eCBkMDQ1NTQ5NTllYTcuLjJlYThhYzA1YjA2NSAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL3ZpZGVv
L2ZiZGV2L2NvcmUvZmJtZW0uYwo+ICsrKyBiL2RyaXZlcnMvdmlkZW8vZmJkZXYvY29yZS9mYm1l
bS5jCj4gQEAgLTM1LDYgKzM1LDcgQEAKPiAgI2luY2x1ZGUgPGxpbnV4L2ZiY29uLmg+Cj4gICNp
bmNsdWRlIDxsaW51eC9tZW1fZW5jcnlwdC5oPgo+ICAjaW5jbHVkZSA8bGludXgvcGNpLmg+Cj4g
KyNpbmNsdWRlIDxsaW51eC9kZWxheS5oPgo+ICAKPiAgI2luY2x1ZGUgPGFzbS9mYi5oPgo+ICAK
PiBAQCAtMTcwNyw2ICsxNzA4LDggQEAgc3RhdGljIHZvaWQgdW5saW5rX2ZyYW1lYnVmZmVyKHN0
cnVjdCBmYl9pbmZvICpmYl9pbmZvKQo+ICAKPiAgc3RhdGljIHZvaWQgZG9fdW5yZWdpc3Rlcl9m
cmFtZWJ1ZmZlcihzdHJ1Y3QgZmJfaW5mbyAqZmJfaW5mbykKPiAgewo+ICsJaW50IGxpbWl0ID0g
MTAwOwo+ICsKPiAgCXVubGlua19mcmFtZWJ1ZmZlcihmYl9pbmZvKTsKPiAgCWlmIChmYl9pbmZv
LT5waXhtYXAuYWRkciAmJgo+ICAJICAgIChmYl9pbmZvLT5waXhtYXAuZmxhZ3MgJiBGQl9QSVhN
QVBfREVGQVVMVCkpCj4gQEAgLTE3MjYsNiArMTcyOSwxMCBAQCBzdGF0aWMgdm9pZCBkb191bnJl
Z2lzdGVyX2ZyYW1lYnVmZmVyKHN0cnVjdCBmYl9pbmZvICpmYl9pbmZvKQo+ICAJZmJjb25fZmJf
dW5yZWdpc3RlcmVkKGZiX2luZm8pOwo+ICAJY29uc29sZV91bmxvY2soKTsKPiAgCj4gKwkvKiB0
cnkgd2FpdCB1bnRpbCBhbGwgcmVmZXJlbmNlcyBhcmUgZ29uZSAqLwo+ICsJd2hpbGUgKGF0b21p
Y19yZWFkKCZmYl9pbmZvLT5jb3VudCkgPiAxICYmIC0tbGltaXQgPiAwKQo+ICsJCW1zbGVlcCgx
MCk7Cj4gKwo+ICAJLyogdGhpcyBtYXkgZnJlZSBmYiBpbmZvICovCj4gIAlwdXRfZmJfaW5mbyhm
Yl9pbmZvKTsKPiAgfQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5v
cmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2
ZWwK
