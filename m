Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D6566B62B
	for <lists+dri-devel@lfdr.de>; Wed, 17 Jul 2019 07:58:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F3DC6E22E;
	Wed, 17 Jul 2019 05:58:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [1.203.163.81])
 by gabe.freedesktop.org (Postfix) with ESMTP id 4E0046E22E
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Jul 2019 05:58:41 +0000 (UTC)
X-UUID: 1c4504c22b254e189aaff84c84961911-20190717
X-UUID: 1c4504c22b254e189aaff84c84961911-20190717
Received: from mtkcas36.mediatek.inc [(172.27.4.253)] by mailgw02.mediatek.com
 (envelope-from <ck.hu@mediatek.com>)
 (mailgw01.mediatek.com ESMTP with TLS)
 with ESMTP id 14240893; Wed, 17 Jul 2019 13:58:33 +0800
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 MTKMBS31N1.mediatek.inc (172.27.4.69) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Wed, 17 Jul 2019 13:58:29 +0800
Received: from [172.21.77.4] (172.21.77.4) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Wed, 17 Jul 2019 13:58:29 +0800
Message-ID: <1563343109.29169.19.camel@mtksdaap41>
Subject: Re: [PATCH v4, 22/33] drm/mediatek: add background color input
 select function for ovl/ovl_2l
From: CK Hu <ck.hu@mediatek.com>
To: <yongqiang.niu@mediatek.com>
Date: Wed, 17 Jul 2019 13:58:29 +0800
In-Reply-To: <1562625253-29254-23-git-send-email-yongqiang.niu@mediatek.com>
References: <1562625253-29254-1-git-send-email-yongqiang.niu@mediatek.com>
 <1562625253-29254-23-git-send-email-yongqiang.niu@mediatek.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: AA45BD5AFD08249059BE630450E0D8590C726157CC07B85B922BBAE9C01B21812000:8
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

SGksIFlvbmdxaWFuZzoKCk9uIFR1ZSwgMjAxOS0wNy0wOSBhdCAwNjozNCArMDgwMCwgeW9uZ3Fp
YW5nLm5pdUBtZWRpYXRlay5jb20gd3JvdGU6Cj4gRnJvbTogWW9uZ3FpYW5nIE5pdSA8eW9uZ3Fp
YW5nLm5pdUBtZWRpYXRlay5jb20+Cj4gCj4gVGhpcyBwYXRjaCBhZGQgYmFja2dyb3VuZCBjb2xv
ciBpbnB1dCBzZWxlY3QgZnVuY3Rpb24gZm9yIG92bC9vdmxfMmwKPiAKPiBvdmwgaW5jbHVkZSA0
IERSQU0gbGF5ZXIgYW5kIDEgYmFja2dyb3VuZCBjb2xvciBsYXllcgo+IG92bF8ybCBpbmNsdWRl
IDQgRFJBTSBsYXllciBhbmQgMSBiYWNrZ3JvdW5kIGNvbG9yIGxheWVyCj4gRFJBTSBsYXllciBm
cmFtZSBidWZmZXIgZGF0YSBmcm9tIHJlbmRlciBoYXJkd2FyZSwgR1BVIGZvciBleGFtcGxlLgo+
IGJhY2tnb3VybmQgY29sb3IgbGF5ZXIgaXMgZW1iZWQgaW4gb3ZsL292bF8ybCwgd2UgY2FuIG9u
bHkgc2V0Cj4gaXQgY29sb3IsIGJ1dCBub3Qgc3VwcG9ydCBEUkFNIGZyYW1lIGJ1ZmZlci4KPiAK
PiBmb3Igb3ZsMC0+b3ZsMF8ybCBkaXJlY3QgbGluayB1c2VjYXNlLAo+IHdlIG5lZWQgc2V0IG92
bDBfMmwgYmFja2dyb3VuZCBjb2xvciBpbnRwdXQgc2VsZWN0IGZyb20gb3ZsMAo+IGlmIHJlbmRl
ciBzZW5kIERSQU0gYnVmZmVyIGxheWVyIG51bWJlciA8PTQsIGFsbCB0aGVzZSBsYXllciByZWFk
Cj4gYnkgb3ZsLgo+IGxheWVyMCBpcyBhdCB0aGUgYm90dG9tIG9mIGFsbCBsYXllcnMuCj4gbGF5
ZXIzIGlzIGF0IHRoZSB0b3Agb2YgYWxsIGxheWVycy4KPiBpZiByZW5kZXIgc2VuZCBEUkFNIGJ1
ZmZlciBsYXllciBudW1iZmVyID49NCAmJiA8PTYKPiBvdmwwIHJlYWQgbGF5ZXIwfjMKPiBvdmww
XzJsIHJlYWQgbGF5ZXI0fjUKPiBsYXllcjUgaXMgYXQgdGhlIHRvcCBvdCBhbGwgdGhlc2UgbGF5
ZXJzLgo+IAo+IHRoZSBkZWNpc2lvbiBvZiBob3cgdG8gc2V0dGluZyBvdmwwL292bDBfMmwgcmVh
ZCB0aGVzZSBsYXllciBkYXRhCj4gaXMgY29udHJvbGxlZCBpbiBtdGsgY3J0Yywgd2hpY2ggd2ls
bCBiZSBhbm90aGVyIHBhdGNoCj4gCgpSZXZpZXdlZC1ieTogQ0sgSHUgPGNrLmh1QG1lZGlhdGVr
LmNvbT4KCj4gU2lnbmVkLW9mZi1ieTogWW9uZ3FpYW5nIE5pdSA8eW9uZ3FpYW5nLm5pdUBtZWRp
YXRlay5jb20+Cj4gLS0tCj4gIGRyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZGlzcF9vdmwu
YyB8IDIyICsrKysrKysrKysrKysrKysrKysrKysKPiAgMSBmaWxlIGNoYW5nZWQsIDIyIGluc2Vy
dGlvbnMoKykKPiAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19k
aXNwX292bC5jIGIvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kaXNwX292bC5jCj4gaW5k
ZXggYTBhYjc2MC4uOGNhNDk2NSAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0
ZWsvbXRrX2Rpc3Bfb3ZsLmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2Rp
c3Bfb3ZsLmMKPiBAQCAtMjcsNiArMjcsOCBAQAo+ICAjZGVmaW5lIERJU1BfUkVHX09WTF9FTgkJ
CQkweDAwMGMKPiAgI2RlZmluZSBESVNQX1JFR19PVkxfUlNUCQkJMHgwMDE0Cj4gICNkZWZpbmUg
RElTUF9SRUdfT1ZMX1JPSV9TSVpFCQkJMHgwMDIwCj4gKyNkZWZpbmUgRElTUF9SRUdfT1ZMX0RB
VEFQQVRIX0NPTgkJMHgwMDI0Cj4gKyNkZWZpbmUgT1ZMX0JHQ0xSX1NFTF9JTgkJCQlCSVQoMikK
PiAgI2RlZmluZSBESVNQX1JFR19PVkxfUk9JX0JHQ0xSCQkJMHgwMDI4Cj4gICNkZWZpbmUgRElT
UF9SRUdfT1ZMX1NSQ19DT04JCQkweDAwMmMKPiAgI2RlZmluZSBESVNQX1JFR19PVkxfQ09OKG4p
CQkJKDB4MDAzMCArIDB4MjAgKiAobikpCj4gQEAgLTI0NSw2ICsyNDcsMjQgQEAgc3RhdGljIHZv
aWQgbXRrX292bF9sYXllcl9jb25maWcoc3RydWN0IG10a19kZHBfY29tcCAqY29tcCwgdW5zaWdu
ZWQgaW50IGlkeCwKPiAgCQltdGtfb3ZsX2xheWVyX29uKGNvbXAsIGlkeCk7Cj4gIH0KPiAgCj4g
K3N0YXRpYyB2b2lkIG10a19vdmxfYmdjbHJfaW5fb24oc3RydWN0IG10a19kZHBfY29tcCAqY29t
cCkKPiArewo+ICsJdW5zaWduZWQgaW50IHJlZzsKPiArCj4gKwlyZWcgPSByZWFkbChjb21wLT5y
ZWdzICsgRElTUF9SRUdfT1ZMX0RBVEFQQVRIX0NPTik7Cj4gKwlyZWcgPSByZWcgfCBPVkxfQkdD
TFJfU0VMX0lOOwo+ICsJd3JpdGVsKHJlZywgY29tcC0+cmVncyArIERJU1BfUkVHX09WTF9EQVRB
UEFUSF9DT04pOwo+ICt9Cj4gKwo+ICtzdGF0aWMgdm9pZCBtdGtfb3ZsX2JnY2xyX2luX29mZihz
dHJ1Y3QgbXRrX2RkcF9jb21wICpjb21wKQo+ICt7Cj4gKwl1bnNpZ25lZCBpbnQgcmVnOwo+ICsK
PiArCXJlZyA9IHJlYWRsKGNvbXAtPnJlZ3MgKyBESVNQX1JFR19PVkxfREFUQVBBVEhfQ09OKTsK
PiArCXJlZyA9IHJlZyAmIH5PVkxfQkdDTFJfU0VMX0lOOwo+ICsJd3JpdGVsKHJlZywgY29tcC0+
cmVncyArIERJU1BfUkVHX09WTF9EQVRBUEFUSF9DT04pOwo+ICt9Cj4gKwo+ICBzdGF0aWMgY29u
c3Qgc3RydWN0IG10a19kZHBfY29tcF9mdW5jcyBtdGtfZGlzcF9vdmxfZnVuY3MgPSB7Cj4gIAku
Y29uZmlnID0gbXRrX292bF9jb25maWcsCj4gIAkuc3RhcnQgPSBtdGtfb3ZsX3N0YXJ0LAo+IEBA
IC0yNTUsNiArMjc1LDggQEAgc3RhdGljIHZvaWQgbXRrX292bF9sYXllcl9jb25maWcoc3RydWN0
IG10a19kZHBfY29tcCAqY29tcCwgdW5zaWduZWQgaW50IGlkeCwKPiAgCS5sYXllcl9vbiA9IG10
a19vdmxfbGF5ZXJfb24sCj4gIAkubGF5ZXJfb2ZmID0gbXRrX292bF9sYXllcl9vZmYsCj4gIAku
bGF5ZXJfY29uZmlnID0gbXRrX292bF9sYXllcl9jb25maWcsCj4gKwkuYmdjbHJfaW5fb24gPSBt
dGtfb3ZsX2JnY2xyX2luX29uLAo+ICsJLmJnY2xyX2luX29mZiA9IG10a19vdmxfYmdjbHJfaW5f
b2ZmLAo+ICB9Owo+ICAKPiAgc3RhdGljIGludCBtdGtfZGlzcF9vdmxfYmluZChzdHJ1Y3QgZGV2
aWNlICpkZXYsIHN0cnVjdCBkZXZpY2UgKm1hc3RlciwKCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZl
bEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFp
bG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
