Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BC5A2B1B2
	for <lists+dri-devel@lfdr.de>; Mon, 27 May 2019 12:01:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 056968977A;
	Mon, 27 May 2019 10:01:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout4.samsung.com (mailout4.samsung.com [203.254.224.34])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F4848977A
 for <dri-devel@lists.freedesktop.org>; Mon, 27 May 2019 10:01:33 +0000 (UTC)
Received: from epcas1p1.samsung.com (unknown [182.195.41.45])
 by mailout4.samsung.com (KnoxPortal) with ESMTP id
 20190527100131epoutp0407a7b5c3053a7dbdb2f19f6923761e4c~igfCVyUR-0979409794epoutp04e
 for <dri-devel@lists.freedesktop.org>; Mon, 27 May 2019 10:01:31 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com
 20190527100131epoutp0407a7b5c3053a7dbdb2f19f6923761e4c~igfCVyUR-0979409794epoutp04e
Received: from epsmges1p2.samsung.com (unknown [182.195.40.152]) by
 epcas1p1.samsung.com (KnoxPortal) with ESMTP id
 20190527100128epcas1p11808b3392e68a7a868fdd33dbba6b285~ige--qLAF1474614746epcas1p1c;
 Mon, 27 May 2019 10:01:28 +0000 (GMT)
Received: from epcas1p4.samsung.com ( [182.195.41.48]) by
 epsmges1p2.samsung.com (Symantec Messaging Gateway) with SMTP id
 03.93.04142.875BBEC5; Mon, 27 May 2019 19:01:28 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
 epcas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20190527100128epcas1p2c82138a702c4730c275d25987ff1e2e4~ige-hgDuB2927629276epcas1p2b;
 Mon, 27 May 2019 10:01:28 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
 epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20190527100128epsmtrp2bb7c750f95386d70ec9e9160c4621cdc~ige-gyiXY2270722707epsmtrp2F;
 Mon, 27 May 2019 10:01:28 +0000 (GMT)
X-AuditID: b6c32a36-ce1ff7000000102e-8f-5cebb57899f8
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
 epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
 D3.E3.03692.875BBEC5; Mon, 27 May 2019 19:01:28 +0900 (KST)
Received: from [10.113.221.211] (unknown [10.113.221.211]) by
 epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20190527100128epsmtip2803e572ceb69043e86f1074e493823de~ige-Swbwm2357723577epsmtip2n;
 Mon, 27 May 2019 10:01:28 +0000 (GMT)
Subject: Re: [PATCH 04/13] drm/exynos: drop DRM_AUTH from DRM_RENDER_ALLOW
 ioctls
To: Emil Velikov <emil.l.velikov@gmail.com>, dri-devel@lists.freedesktop.org
From: Inki Dae <inki.dae@samsung.com>
Message-ID: <02cc4cce-c3ce-c9f6-71ed-090cec3d8c5e@samsung.com>
Date: Mon, 27 May 2019 19:02:24 +0900
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190527081741.14235-4-emil.l.velikov@gmail.com>
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprFJsWRmVeSWpSXmKPExsWy7bCmgW7F1tcxBtMadCyufH3PZrHn6j0m
 ixf3LrJYnG16w24xY/JLNou21R9YHdg8ds66y+5xv/s4k8e/Y+wefVtWMQawRGXbZKQmpqQW
 KaTmJeenZOal2yp5B8c7x5uaGRjqGlpamCsp5CXmptoqufgE6Lpl5gAtV1IoS8wpBQoFJBYX
 K+nb2RTll5akKmTkF5fYKqUWpOQUWBboFSfmFpfmpesl5+daGRoYGJkCFSZkZ2zp6WAuuCJR
 8fnxb/YGxiMiXYycHBICJhJrvi9i7GLk4hAS2MEoMX3nIVYI5xOjxP8HX1ggnG+MEk/XHmCF
 aWnZ/IkJIrGXUeLcwxdQLe8ZJb78WMcEUiUsECzxu/kCO4gtIuAjceP/LzaQImaBTYwSn/ZM
 ZgFJsAmoSkxccZ8NxOYVsJOY+mohmM0CFD/yZQdYs6hAhMT9YxtYIWoEJU7OfALWywlUf+HP
 BDCbWUBc4taT+UwQtrxE89bZzCDLJATOsEls3jmFDeJuF4mm19dZIGxhiVfHt7BD2FISn9/t
 haopl3j27hlQDQeQXSPxbW4FhGkscXFFCojJLKApsX6XPkSxosTO33MZIbbySbz72sMKUc0r
 0dEmBFGiJHHs4g1GCFtC4sKSiVB7PCSWtm5im8CoOAvJX7OQ/DILyS+zEBYvYGRZxSiWWlCc
 m55abFhghBzZmxjB6VLLbAfjonM+hxgFOBiVeHglzr6KEWJNLCuuzD3EKMHBrCTCa7oFKMSb
 klhZlVqUH19UmpNafIjRFBjsE5mlRJPzgak8ryTe0NTI2NjYwsTQzNTQUEmcN577ZoyQQHpi
 SWp2ampBahFMHxMHp1QDo9OWa3an7q8TXtLrsTWqb12R95fH5W2HvgaErli7h3WPTc8f6dmK
 V/W4lbZytvU1BnZFvF+8/909/+t7vYRDTuVvjv3Sx3S5Ym6n4EKeObu37VeZd6z5RphrCr/G
 tZDtFZM1fKRSkr7a/mU1W56/OH2f/TYP+aQqw2NyljekbUP2TX/TuNM6VImlOCPRUIu5qDgR
 AEfe0kitAwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrBLMWRmVeSWpSXmKPExsWy7bCSvG7F1tcxBm/beC2ufH3PZrHn6j0m
 ixf3LrJYnG16w24xY/JLNou21R9YHdg8ds66y+5xv/s4k8e/Y+wefVtWMQawRHHZpKTmZJal
 FunbJXBlbOnpYC64IlHx+fFv9gbGIyJdjJwcEgImEi2bPzGB2EICuxklnmzM72LkAIpLSGzZ
 ygFhCkscPlzcxcgFVPGWUWLK6yZWkHJhgWCJ380X2EFsEQEfiRv/f7GBFDELbGGUOLBpP9TM
 o4wSlya5gthsAqoSE1fcZwOxeQXsJKa+WghmswDFj3zZATZIVCBC4sz7FSwQNYISJ2c+AbM5
 geov/JkAZjMLqEv8mXeJGcIWl7j1ZD4ThC0v0bx1NvMERqFZSNpnIWmZhaRlFpKWBYwsqxgl
 UwuKc9Nziw0LDPNSy/WKE3OLS/PS9ZLzczcxguNDS3MH4+Ul8YcYBTgYlXh4C86/ihFiTSwr
 rsw9xCjBwawkwmu6BSjEm5JYWZValB9fVJqTWnyIUZqDRUmc92nesUghgfTEktTs1NSC1CKY
 LBMHp1QDY5hK2aoNSswLnl96lqrsvSUnhffdy6k3ajLWfe5zy9/8xvTdXffOfazJ37da532e
 sM25f3N45qp5rIYXfjo0+lwXMbbQaX1YKHmAZ0vj0+wH1aV7U5V1DDhWWltdWJm/g3HCF4uD
 72Y46NUGF3ZcCti8UjC8PPAZU43zBr9tqkpfF/396bv/vBJLcUaioRZzUXEiALySfeyLAgAA
X-CMS-MailID: 20190527100128epcas1p2c82138a702c4730c275d25987ff1e2e4
X-Msg-Generator: CA
X-Sendblock-Type: SVC_REQ_APPROVE
CMS-TYPE: 101P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20190527081920epcas1p104a237551956f818641ea8d657d1502a
References: <20190527081741.14235-1-emil.l.velikov@gmail.com>
 <CGME20190527081920epcas1p104a237551956f818641ea8d657d1502a@epcas1p1.samsung.com>
 <20190527081741.14235-4-emil.l.velikov@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=samsung.com; 
 s=mail20170921; t=1558951291;
 bh=jB8JTAuGVzo88by0KS3FWI3rxPyMNRtxJuZc6XYr/PM=;
 h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
 b=X6BtlmthuwSt+XbrI8xt+wbFblYuv6CinUeC1JiNf1J68+EwpPrXJEmZoUQk9RbLY
 6zP7WMJ2X1I8fNwq+DWp6c6baduCyU7oziMHbQfUnAdLsBzu7Jx50TtUSDwEV4Uv2f
 s5Z1xc4zX1S8n6jPnhGCguvYTLcXdSlZFnllaVEY=
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
Cc: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Seung-Woo Kim <sw0312.kim@samsung.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgRW1pbCwKCjE5LiA1LiAyNy4g7Jik7ZuEIDU6MTfsl5AgRW1pbCBWZWxpa292IOydtCjqsIAp
IOyTtCDquIA6Cj4gRnJvbTogRW1pbCBWZWxpa292IDxlbWlsLnZlbGlrb3ZAY29sbGFib3JhLmNv
bT4KPiAKPiBUaGUgYXV0aGVudGljYXRpb24gY2FuIGJlIGNpcmN1bXZlbnRlZCwgYnkgZGVzaWdu
LCBieSB1c2luZyB0aGUgcmVuZGVyCj4gbm9kZS4KPiAKPj5Gcm9tIHRoZSBkcml2ZXIgUE9WIHRo
ZXJlIGlzIG5vIGRpc3RpbmN0aW9uIGJldHdlZW4gcHJpbWFyeSBhbmQgcmVuZGVyCj4gbm9kZXMs
IHRodXMgd2UgY2FuIGRyb3AgdGhlIHRva2VuLgo+IAo+IENjOiBJbmtpIERhZSA8aW5raS5kYWVA
c2Ftc3VuZy5jb20+Cj4gQ2M6IEpvb255b3VuZyBTaGltIDxqeTA5MjIuc2hpbUBzYW1zdW5nLmNv
bT4KPiBDYzogU2V1bmctV29vIEtpbSA8c3cwMzEyLmtpbUBzYW1zdW5nLmNvbT4KPiBDYzogS3l1
bmdtaW4gUGFyayA8a3l1bmdtaW4ucGFya0BzYW1zdW5nLmNvbT4KPiBDYzogVG9iaWFzIEpha29i
aSA8dGpha29iaUBtYXRoLnVuaS1iaWVsZWZlbGQuZGU+Cj4gU2lnbmVkLW9mZi1ieTogRW1pbCBW
ZWxpa292IDxlbWlsLnZlbGlrb3ZAY29sbGFib3JhLmNvbT4KPiAtLS0KPiBHZW50cywgSSd2ZSBs
b29rZWQgYXJvdW5kIGZvciB1c2Vyc3BhY2UgYW5kIGZvdW5kIG9ubHkgbGliZHJtIC0gdGhlCj4g
ZXh5bm9zIGxpYnJhcnkgKyBzaW1wbGUgYXBwcyBhbmQgdGhlIFggZHJpdmVyLiBBbGwgb2Ygd2hp
Y2ggYXJlIHNhZmUKPiB3aXRoIHRoaXMgcGF0Y2guCj4gCj4gUGxlYXNlIGhhdmUgYSBsb29rIHRo
cm91Z2ggb3RoZXIgc29tZSBvcGVuLXNvdXJjZSB1c2Vyc3BhY2UgdGhhdCB5b3UKPiBoYXZlIGFy
b3VuZC4KCkFja2VkLWJ5OiBJbmtpIERhZSA8aW5raS5kYWVAc2Ftc3VuZy5jb20+CgpUaGFua3Ms
Cklua2kgRGFlCgo+IAo+IFRvYmlhcywgeW91IG1lbnRpb25lZCB1c2Vyc3BhY2UgcHJvamVjdHMg
KG1wdiwgbGlicmV0cm8sIG90aGVyKSB3aGVyZQo+IHlvdSd2ZSBhZGRlZCBleHlub3MgYmFja2Vu
ZC4gQ2FuIHlvdSBwbGVhc2UgY2hlY2sgdGhleSB3b3JrIGZpbmUgd2l0aAo+IHRoaXMgcGF0Y2g/
Cj4gCj4gVGhhbmtzCj4gRW1pbAo+IC0tLQo+ICBkcml2ZXJzL2dwdS9kcm0vZXh5bm9zL2V4eW5v
c19kcm1fZHJ2LmMgfCAxOCArKysrKysrKystLS0tLS0tLS0KPiAgMSBmaWxlIGNoYW5nZWQsIDkg
aW5zZXJ0aW9ucygrKSwgOSBkZWxldGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9n
cHUvZHJtL2V4eW5vcy9leHlub3NfZHJtX2Rydi5jIGIvZHJpdmVycy9ncHUvZHJtL2V4eW5vcy9l
eHlub3NfZHJtX2Rydi5jCj4gaW5kZXggZTFlZjlkYzllYmYzLi5iNDYxZDg5YWNjZmYgMTAwNjQ0
Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2V4eW5vcy9leHlub3NfZHJtX2Rydi5jCj4gKysrIGIv
ZHJpdmVycy9ncHUvZHJtL2V4eW5vcy9leHlub3NfZHJtX2Rydi5jCj4gQEAgLTgxLDI5ICs4MSwy
OSBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IHZtX29wZXJhdGlvbnNfc3RydWN0IGV4eW5vc19kcm1f
Z2VtX3ZtX29wcyA9IHsKPiAgCj4gIHN0YXRpYyBjb25zdCBzdHJ1Y3QgZHJtX2lvY3RsX2Rlc2Mg
ZXh5bm9zX2lvY3Rsc1tdID0gewo+ICAJRFJNX0lPQ1RMX0RFRl9EUlYoRVhZTk9TX0dFTV9DUkVB
VEUsIGV4eW5vc19kcm1fZ2VtX2NyZWF0ZV9pb2N0bCwKPiAtCQkJRFJNX0FVVEggfCBEUk1fUkVO
REVSX0FMTE9XKSwKPiArCQkJRFJNX1JFTkRFUl9BTExPVyksCj4gIAlEUk1fSU9DVExfREVGX0RS
VihFWFlOT1NfR0VNX01BUCwgZXh5bm9zX2RybV9nZW1fbWFwX2lvY3RsLAo+IC0JCQlEUk1fQVVU
SCB8IERSTV9SRU5ERVJfQUxMT1cpLAo+ICsJCQlEUk1fUkVOREVSX0FMTE9XKSwKPiAgCURSTV9J
T0NUTF9ERUZfRFJWKEVYWU5PU19HRU1fR0VULCBleHlub3NfZHJtX2dlbV9nZXRfaW9jdGwsCj4g
IAkJCURSTV9SRU5ERVJfQUxMT1cpLAo+ICAJRFJNX0lPQ1RMX0RFRl9EUlYoRVhZTk9TX1ZJRElf
Q09OTkVDVElPTiwgdmlkaV9jb25uZWN0aW9uX2lvY3RsLAo+ICAJCQlEUk1fQVVUSCksCj4gIAlE
Uk1fSU9DVExfREVGX0RSVihFWFlOT1NfRzJEX0dFVF9WRVIsIGV4eW5vc19nMmRfZ2V0X3Zlcl9p
b2N0bCwKPiAtCQkJRFJNX0FVVEggfCBEUk1fUkVOREVSX0FMTE9XKSwKPiArCQkJRFJNX1JFTkRF
Ul9BTExPVyksCj4gIAlEUk1fSU9DVExfREVGX0RSVihFWFlOT1NfRzJEX1NFVF9DTURMSVNULCBl
eHlub3NfZzJkX3NldF9jbWRsaXN0X2lvY3RsLAo+IC0JCQlEUk1fQVVUSCB8IERSTV9SRU5ERVJf
QUxMT1cpLAo+ICsJCQlEUk1fUkVOREVSX0FMTE9XKSwKPiAgCURSTV9JT0NUTF9ERUZfRFJWKEVY
WU5PU19HMkRfRVhFQywgZXh5bm9zX2cyZF9leGVjX2lvY3RsLAo+IC0JCQlEUk1fQVVUSCB8IERS
TV9SRU5ERVJfQUxMT1cpLAo+ICsJCQlEUk1fUkVOREVSX0FMTE9XKSwKPiAgCURSTV9JT0NUTF9E
RUZfRFJWKEVYWU5PU19JUFBfR0VUX1JFU09VUkNFUywKPiAgCQkJZXh5bm9zX2RybV9pcHBfZ2V0
X3Jlc19pb2N0bCwKPiAtCQkJRFJNX0FVVEggfCBEUk1fUkVOREVSX0FMTE9XKSwKPiArCQkJRFJN
X1JFTkRFUl9BTExPVyksCj4gIAlEUk1fSU9DVExfREVGX0RSVihFWFlOT1NfSVBQX0dFVF9DQVBT
LCBleHlub3NfZHJtX2lwcF9nZXRfY2Fwc19pb2N0bCwKPiAtCQkJRFJNX0FVVEggfCBEUk1fUkVO
REVSX0FMTE9XKSwKPiArCQkJRFJNX1JFTkRFUl9BTExPVyksCj4gIAlEUk1fSU9DVExfREVGX0RS
VihFWFlOT1NfSVBQX0dFVF9MSU1JVFMsCj4gIAkJCWV4eW5vc19kcm1faXBwX2dldF9saW1pdHNf
aW9jdGwsCj4gLQkJCURSTV9BVVRIIHwgRFJNX1JFTkRFUl9BTExPVyksCj4gKwkJCURSTV9SRU5E
RVJfQUxMT1cpLAo+ICAJRFJNX0lPQ1RMX0RFRl9EUlYoRVhZTk9TX0lQUF9DT01NSVQsIGV4eW5v
c19kcm1faXBwX2NvbW1pdF9pb2N0bCwKPiAtCQkJRFJNX0FVVEggfCBEUk1fUkVOREVSX0FMTE9X
KSwKPiArCQkJRFJNX1JFTkRFUl9BTExPVyksCj4gIH07Cj4gIAo+ICBzdGF0aWMgY29uc3Qgc3Ry
dWN0IGZpbGVfb3BlcmF0aW9ucyBleHlub3NfZHJtX2RyaXZlcl9mb3BzID0gewo+IApfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGlu
ZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVl
ZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
