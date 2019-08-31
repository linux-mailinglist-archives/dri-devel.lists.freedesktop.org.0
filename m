Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AAC2DA4133
	for <lists+dri-devel@lfdr.de>; Sat, 31 Aug 2019 02:05:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE5826E132;
	Sat, 31 Aug 2019 00:04:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [210.61.82.183])
 by gabe.freedesktop.org (Postfix) with ESMTP id 1AD4A6E132
 for <dri-devel@lists.freedesktop.org>; Sat, 31 Aug 2019 00:04:55 +0000 (UTC)
X-UUID: 67bc2bb3223f4ab19a3e4abadc4fed6e-20190831
X-UUID: 67bc2bb3223f4ab19a3e4abadc4fed6e-20190831
Received: from mtkcas06.mediatek.inc [(172.21.101.30)] by mailgw01.mediatek.com
 (envelope-from <ck.hu@mediatek.com>)
 (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
 with ESMTP id 136419460; Sat, 31 Aug 2019 08:04:53 +0800
Received: from mtkcas09.mediatek.inc (172.21.101.178) by
 mtkmbs05n2.mediatek.inc (172.21.101.140) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Sat, 31 Aug 2019 08:04:56 +0800
Received: from [172.21.77.4] (172.21.77.4) by mtkcas09.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Sat, 31 Aug 2019 08:04:50 +0800
Message-ID: <1567209886.18937.5.camel@mtksdaap41>
Subject: Re: [PATCH 2/2] drm/mediatek: Bypass atomic helpers for cursor updates
From: CK Hu <ck.hu@mediatek.com>
To: Bibby Hsieh <bibby.hsieh@mediatek.com>
Date: Sat, 31 Aug 2019 08:04:46 +0800
In-Reply-To: <20190830073819.16566-3-bibby.hsieh@mediatek.com>
References: <20190830073819.16566-1-bibby.hsieh@mediatek.com>
 <20190830073819.16566-3-bibby.hsieh@mediatek.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-MTK: N
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
Cc: drinkcat@chromium.org, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, tfiga@chromium.org,
 Thierry Reding <thierry.reding@gmail.com>, linux-mediatek@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGksIEJpYmJ5OgoKT24gRnJpLCAyMDE5LTA4LTMwIGF0IDE1OjM4ICswODAwLCBCaWJieSBIc2ll
aCB3cm90ZToKPiBNb3ZpbmcgdGhlIGRyaXZlciB0byBhdG9taWMgaGVscGVycyByZWdyZXNzZWQg
Y3Vyc29yIHJlc3BvbnNpdmVuZXNzLAo+IGJlY2F1c2UgY3Vyc29yIHVwZGF0ZXMgbmVlZCB0aGVp
ciBvd24gYXRvbWljIGNvbW1pdHMsIHdoaWNoIGhhdmUgdG8gYmUKPiBzZXJpYWxpemVkIHdpdGgg
b3RoZXIgY29tbWl0cywgdGhhdCBtaWdodCBpbmNsdWRlIGZlbmNlIHdhaXRzLiBUbyBhdm9pZAo+
IHRoaXMsIGluIGNlcnRhaW4gY29uZGl0aW9ucywgd2UgY2FuIGJ5cGFzcyB0aGUgYXRvbWljIGhl
bHBlcnMgZm9yIGxlZ2FjeQo+IGN1cnNvciB1cGRhdGUgSU9DVExzLiBDdXJyZW50bHkgdGhlIGNv
bmRpdGlvbnMgYXJlOgo+ICAtIG5vIGFzeW5jaHJvbm91cyBtb2RlIHNldHRpbmcgY29tbWl0IHBl
bmRpbmcsCj4gIC0gbm8gYXN5bmNocm9ub3VzIGNvbW1pdCB0aGF0IHVwZGF0ZXMgdGhlIGN1cnNv
ciBwbGFuZSBpcyBwZW5kaW5nLgo+IFdpdGggdGhlIGFib3ZlIHR3byBjb25kaXRpb25zIG1ldCwg
d2Uga25vdyB0aGF0IHRoZSBtYW51YWwgY3Vyc29yIHN0YXRlCj4gdXBkYXRlIHdpbGwgbm90IGNv
bmZsaWN0IHdpdGggYW55IHNjaGVkdWxlZCB1cGRhdGUuCj4gCj4gRml4ZXM6IDExOWY1MTczNjI4
YSAoImRybS9tZWRpYXRlazogQWRkIERSTSBEcml2ZXIgZm9yIE1lZGlhdGVrIFNvQyBNVDgxNzMu
IikKPiAKPiBTaWduZWQtb2ZmLWJ5OiBCaWJieSBIc2llaCA8YmliYnkuaHNpZWhAbWVkaWF0ZWsu
Y29tPgo+IFNpZ25lZC1vZmYtYnk6IERhbmllbCBLdXJ0eiA8ZGprdXJ0ekBjaHJvbWl1bS5vcmc+
Cj4gLS0tCj4gIGRyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHJtX2NydGMuYyAgfCA0MSAr
KysrKysrKysrKystCj4gIGRyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHJtX2NydGMuaCAg
fCAgMiArCj4gIGRyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHJtX2Rydi5jICAgfCAzNCAr
KysrKysrKysrLQo+ICBkcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RybV9kcnYuaCAgIHwg
IDMgKwo+ICBkcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RybV9wbGFuZS5jIHwgNzMgKysr
KysrKysrKysrKysrKysrKysrKystCj4gIDUgZmlsZXMgY2hhbmdlZCwgMTQ4IGluc2VydGlvbnMo
KyksIDUgZGVsZXRpb25zKC0pCj4gCgpbc25pcF0KCj4gKwo+ICtzdGF0aWMgaW50IG10a19wbGFu
ZV91cGRhdGUoc3RydWN0IGRybV9wbGFuZSAqcGxhbmUsCj4gKwkJCSAgICBzdHJ1Y3QgZHJtX2Ny
dGMgKmNydGMsCj4gKwkJCSAgICBzdHJ1Y3QgZHJtX2ZyYW1lYnVmZmVyICpmYiwKPiArCQkJICAg
IGludCBjcnRjX3gsIGludCBjcnRjX3ksCj4gKwkJCSAgICB1bnNpZ25lZCBpbnQgY3J0Y193LCB1
bnNpZ25lZCBpbnQgY3J0Y19oLAo+ICsJCQkgICAgdWludDMyX3Qgc3JjX3gsIHVpbnQzMl90IHNy
Y195LAo+ICsJCQkgICAgdWludDMyX3Qgc3JjX3csIHVpbnQzMl90IHNyY19oLAo+ICsJCQkgICAg
c3RydWN0IGRybV9tb2Rlc2V0X2FjcXVpcmVfY3R4ICpjdHgpCj4gK3sKPiArCXN0cnVjdCBtdGtf
ZHJtX3ByaXZhdGUgKnByaXZhdGUgPSBwbGFuZS0+ZGV2LT5kZXZfcHJpdmF0ZTsKPiArCXVpbnQz
Ml90IGNydGNfbWFzayA9ICgxIDw8IGRybV9jcnRjX2luZGV4KGNydGMpKTsKPiArCj4gKwlpZiAo
Y3J0YyAmJiBwbGFuZSA9PSBjcnRjLT5jdXJzb3IgJiYKPiArCSAgICBwbGFuZS0+c3RhdGUtPmNy
dGMgPT0gY3J0YyAmJgo+ICsJICAgICEocHJpdmF0ZS0+Y29tbWl0LmZsdXNoX2Zvcl9jdXJzb3Ig
JiBjcnRjX21hc2spKQo+ICsJCXJldHVybiBtdGtfcGxhbmVfY3Vyc29yX3VwZGF0ZShwbGFuZSwg
Y3J0YywgZmIsCj4gKwkJCQljcnRjX3gsIGNydGNfeSwgY3J0Y193LCBjcnRjX2gsCj4gKwkJCQlz
cmNfeCwgc3JjX3ksIHNyY193LCBzcmNfaCk7Cj4gKwo+ICsJcmV0dXJuIGRybV9hdG9taWNfaGVs
cGVyX3VwZGF0ZV9wbGFuZShwbGFuZSwgY3J0YywgZmIsCj4gKwkJCQkJICAgICAgY3J0Y194LCBj
cnRjX3ksIGNydGNfdywgY3J0Y19oLAo+ICsJCQkJCSAgICAgIHNyY194LCBzcmNfeSwgc3JjX3cs
IHNyY19oLCBjdHgpOwo+ICt9Cj4gKwo+ICBzdGF0aWMgY29uc3Qgc3RydWN0IGRybV9wbGFuZV9m
dW5jcyBtdGtfcGxhbmVfZnVuY3MgPSB7Cj4gLQkudXBkYXRlX3BsYW5lID0gZHJtX2F0b21pY19o
ZWxwZXJfdXBkYXRlX3BsYW5lLAo+ICsJLnVwZGF0ZV9wbGFuZSA9IG10a19wbGFuZV91cGRhdGUs
CgpJIHRoaW5rIGRybSBjb3JlIGhhcyBhbHJlYWR5IHByb2Nlc3MgY3Vyc29yIGFzeW5jIHByb2Js
ZW0uIEluIFsxXSwgeW91CmNvdWxkIHNlYXJjaCAnbGVnYWN5X2N1cnNvcl91cGRhdGUnIGFuZCBp
dCBuZWVkIGRyaXZlciB0byBpbXBsZW1lbnQKYXRvbWljX2FzeW5jX2NoZWNrKCkgYW5kIGF0b21p
Y19hc3luY191cGRhdGUoKSBjYWxsYmFjayBmdW5jdGlvbi4gWW91CmNvdWxkIHJlZmVyIHRvIFsy
XSBmb3IgdGhlIGltcGxlbWVudGF0aW9uLiAKCgpbMV0KaHR0cHM6Ly9naXQua2VybmVsLm9yZy9w
dWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvdG9ydmFsZHMvbGludXguZ2l0L3RyZWUvZHJpdmVycy9n
cHUvZHJtL2RybV9hdG9taWNfaGVscGVyLmM/aD12NS4zLXJjNgpbMl0KaHR0cHM6Ly9naXQua2Vy
bmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvdG9ydmFsZHMvbGludXguZ2l0L3RyZWUv
ZHJpdmVycy9ncHUvZHJtL3JvY2tjaGlwL3JvY2tjaGlwX2RybV92b3AuYz9oPXY1LjMtcmM2I245
NTUKClJlZ2FyZHMsCkNLCgo+ICAJLmRpc2FibGVfcGxhbmUgPSBkcm1fYXRvbWljX2hlbHBlcl9k
aXNhYmxlX3BsYW5lLAo+ICAJLmRlc3Ryb3kgPSBkcm1fcGxhbmVfY2xlYW51cCwKPiAgCS5yZXNl
dCA9IG10a19wbGFuZV9yZXNldCwKPiBAQCAtOTAsNyArMTU0LDEyIEBAIHN0YXRpYyBpbnQgbXRr
X3BsYW5lX2F0b21pY19jaGVjayhzdHJ1Y3QgZHJtX3BsYW5lICpwbGFuZSwKPiAgCWlmICghc3Rh
dGUtPmNydGMpCj4gIAkJcmV0dXJuIDA7Cj4gIAo+IC0JY3J0Y19zdGF0ZSA9IGRybV9hdG9taWNf
Z2V0X2NydGNfc3RhdGUoc3RhdGUtPnN0YXRlLCBzdGF0ZS0+Y3J0Yyk7Cj4gKwlpZiAoc3RhdGUt
PnN0YXRlKQo+ICsJCWNydGNfc3RhdGUgPSBkcm1fYXRvbWljX2dldF9leGlzdGluZ19jcnRjX3N0
YXRlKHN0YXRlLT5zdGF0ZSwKPiArCQkJCQkJCQlzdGF0ZS0+Y3J0Yyk7Cj4gKwllbHNlIC8qIFNw
ZWNpYWwgY2FzZSBmb3IgYXN5bmNocm9ub3VzIGN1cnNvciB1cGRhdGVzLiAqLwo+ICsJCWNydGNf
c3RhdGUgPSBzdGF0ZS0+Y3J0Yy0+c3RhdGU7Cj4gKwo+ICAJaWYgKElTX0VSUihjcnRjX3N0YXRl
KSkKPiAgCQlyZXR1cm4gUFRSX0VSUihjcnRjX3N0YXRlKTsKPiAgCgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApk
cmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Au
b3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
