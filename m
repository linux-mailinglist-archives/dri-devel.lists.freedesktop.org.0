Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BD08AD0AEA
	for <lists+dri-devel@lfdr.de>; Wed,  9 Oct 2019 11:20:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 253746E0DE;
	Wed,  9 Oct 2019 09:20:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [1.203.163.81])
 by gabe.freedesktop.org (Postfix) with ESMTP id 222D86E0DE
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Oct 2019 09:20:36 +0000 (UTC)
X-UUID: 6b5adf56ec59466eb2a069f0e00b456d-20191009
X-UUID: 6b5adf56ec59466eb2a069f0e00b456d-20191009
Received: from mtkcas34.mediatek.inc [(172.27.4.253)] by mailgw02.mediatek.com
 (envelope-from <ck.hu@mediatek.com>)
 (mailgw01.mediatek.com ESMTP with TLS)
 with ESMTP id 1432871242; Wed, 09 Oct 2019 17:20:31 +0800
Received: from mtkcas09.mediatek.inc (172.21.101.178) by
 MTKMBS31N2.mediatek.inc (172.27.4.87) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Wed, 9 Oct 2019 17:20:29 +0800
Received: from [172.21.77.4] (172.21.77.4) by mtkcas09.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Wed, 9 Oct 2019 17:20:29 +0800
Message-ID: <1570612831.7713.4.camel@mtksdaap41>
Subject: Re: [PATCH v5, 19/32] drm/medaitek: add layer_nr for ovl private data
From: CK Hu <ck.hu@mediatek.com>
To: <yongqiang.niu@mediatek.com>
Date: Wed, 9 Oct 2019 17:20:31 +0800
In-Reply-To: <1567090254-15566-20-git-send-email-yongqiang.niu@mediatek.com>
References: <1567090254-15566-1-git-send-email-yongqiang.niu@mediatek.com>
 <1567090254-15566-20-git-send-email-yongqiang.niu@mediatek.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: A5B33E426A6A22AF7CE56AB684BF57B97D9F0F8D5DE9B544F6874FCD68A276BC2000:8
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGksIFlvbmdxaWFuZzoKCk9uIFRodSwgMjAxOS0wOC0yOSBhdCAyMjo1MCArMDgwMCwgeW9uZ3Fp
YW5nLm5pdUBtZWRpYXRlay5jb20gd3JvdGU6Cj4gRnJvbTogWW9uZ3FpYW5nIE5pdSA8eW9uZ3Fp
YW5nLm5pdUBtZWRpYXRlay5jb20+Cj4gCj4gVGhpcyBwYXRjaCBhZGQgbGF5ZXJfbnIgZm9yIG92
bCBwcml2YXRlIGRhdGEKPiBvdmxfMmwgYWxtb3N0IHNhbWUgd2l0aCB3aXRoIG92bCBoYXJkd2Fy
ZSwgZXhjZXB0IHRoZQo+IGxheWVyIG51bWJlciBmb3Igb3ZsXzJsIGlzIDIgYW5kIG92bCBpcyA0
Lgo+IHRoaXMgcGF0Y2ggaXMgYSBwcmVwYXJhdGlvbiBmb3Igb3ZsLTJsIGFuZAo+IG92bCBzaGFy
ZSB0aGUgc2FtZSBkcml2ZXIuCj4gCgpBcHBsaWVkIHRvIG1lZGlhdGVrLWRybS1uZXh0LTUuNSBb
MV0sIHRoYW5rcy4KClsxXQpodHRwczovL2dpdGh1Yi5jb20vY2todS1tZWRpYXRlay9saW51eC5n
aXQtdGFncy9jb21taXRzL21lZGlhdGVrLWRybS1uZXh0LTUuNQoKUmVnYXJkcywKQ0sKCj4gU2ln
bmVkLW9mZi1ieTogWW9uZ3FpYW5nIE5pdSA8eW9uZ3FpYW5nLm5pdUBtZWRpYXRlay5jb20+Cj4g
UmV2aWV3ZWQtYnk6IENLIEh1IDxjay5odUBtZWRpYXRlay5jb20+Cj4gLS0tCj4gIGRyaXZlcnMv
Z3B1L2RybS9tZWRpYXRlay9tdGtfZGlzcF9vdmwuYyB8IDcgKysrKysrLQo+ICAxIGZpbGUgY2hh
bmdlZCwgNiBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCj4gCj4gZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZGlzcF9vdmwuYyBiL2RyaXZlcnMvZ3B1L2RybS9t
ZWRpYXRlay9tdGtfZGlzcF9vdmwuYwo+IGluZGV4IDgyZWFlZmQuLmJhZWYwNjYgMTAwNjQ0Cj4g
LS0tIGEvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kaXNwX292bC5jCj4gKysrIGIvZHJp
dmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kaXNwX292bC5jCj4gQEAgLTUyLDYgKzUyLDcgQEAK
PiAgc3RydWN0IG10a19kaXNwX292bF9kYXRhIHsKPiAgCXVuc2lnbmVkIGludCBhZGRyOwo+ICAJ
dW5zaWduZWQgaW50IGdtY19iaXRzOwo+ICsJdW5zaWduZWQgaW50IGxheWVyX25yOwo+ICAJYm9v
bCBmbXRfcmdiNTY1X2lzXzA7Cj4gIH07Cj4gIAo+IEBAIC0xMjksNyArMTMwLDkgQEAgc3RhdGlj
IHZvaWQgbXRrX292bF9jb25maWcoc3RydWN0IG10a19kZHBfY29tcCAqY29tcCwgdW5zaWduZWQg
aW50IHcsCj4gIAo+ICBzdGF0aWMgdW5zaWduZWQgaW50IG10a19vdmxfbGF5ZXJfbnIoc3RydWN0
IG10a19kZHBfY29tcCAqY29tcCkKPiAgewo+IC0JcmV0dXJuIDQ7Cj4gKwlzdHJ1Y3QgbXRrX2Rp
c3Bfb3ZsICpvdmwgPSBjb21wX3RvX292bChjb21wKTsKPiArCj4gKwlyZXR1cm4gb3ZsLT5kYXRh
LT5sYXllcl9ucjsKPiAgfQo+ICAKPiAgc3RhdGljIHZvaWQgbXRrX292bF9sYXllcl9vbihzdHJ1
Y3QgbXRrX2RkcF9jb21wICpjb21wLCB1bnNpZ25lZCBpbnQgaWR4KQo+IEBAIC0zMzQsMTIgKzMz
NywxNCBAQCBzdGF0aWMgaW50IG10a19kaXNwX292bF9yZW1vdmUoc3RydWN0IHBsYXRmb3JtX2Rl
dmljZSAqcGRldikKPiAgc3RhdGljIGNvbnN0IHN0cnVjdCBtdGtfZGlzcF9vdmxfZGF0YSBtdDI3
MDFfb3ZsX2RyaXZlcl9kYXRhID0gewo+ICAJLmFkZHIgPSBESVNQX1JFR19PVkxfQUREUl9NVDI3
MDEsCj4gIAkuZ21jX2JpdHMgPSA4LAo+ICsJLmxheWVyX25yID0gNCwKPiAgCS5mbXRfcmdiNTY1
X2lzXzAgPSBmYWxzZSwKPiAgfTsKPiAgCj4gIHN0YXRpYyBjb25zdCBzdHJ1Y3QgbXRrX2Rpc3Bf
b3ZsX2RhdGEgbXQ4MTczX292bF9kcml2ZXJfZGF0YSA9IHsKPiAgCS5hZGRyID0gRElTUF9SRUdf
T1ZMX0FERFJfTVQ4MTczLAo+ICAJLmdtY19iaXRzID0gOCwKPiArCS5sYXllcl9uciA9IDQsCj4g
IAkuZm10X3JnYjU2NV9pc18wID0gdHJ1ZSwKPiAgfTsKPiAgCgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmkt
ZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
L21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
