Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F7CCD0B08
	for <lists+dri-devel@lfdr.de>; Wed,  9 Oct 2019 11:24:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 806C76E945;
	Wed,  9 Oct 2019 09:24:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [1.203.163.81])
 by gabe.freedesktop.org (Postfix) with ESMTP id C989D6E945
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Oct 2019 09:24:49 +0000 (UTC)
X-UUID: aee3e82328cc419caeedd6668d83c561-20191009
X-UUID: aee3e82328cc419caeedd6668d83c561-20191009
Received: from mtkcas36.mediatek.inc [(172.27.4.253)] by mailgw02.mediatek.com
 (envelope-from <ck.hu@mediatek.com>)
 (mailgw01.mediatek.com ESMTP with TLS)
 with ESMTP id 619512515; Wed, 09 Oct 2019 17:24:42 +0800
Received: from mtkcas09.mediatek.inc (172.21.101.178) by
 MTKMBS31N2.mediatek.inc (172.27.4.87) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Wed, 9 Oct 2019 17:24:38 +0800
Received: from [172.21.77.4] (172.21.77.4) by mtkcas09.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Wed, 9 Oct 2019 17:24:37 +0800
Message-ID: <1570613080.7713.6.camel@mtksdaap41>
Subject: Re: [PATCH v5, 21/32] drm/mediatek: add background color input
 select function for ovl/ovl_2l
From: CK Hu <ck.hu@mediatek.com>
To: <yongqiang.niu@mediatek.com>
Date: Wed, 9 Oct 2019 17:24:40 +0800
In-Reply-To: <1567090254-15566-22-git-send-email-yongqiang.niu@mediatek.com>
References: <1567090254-15566-1-git-send-email-yongqiang.niu@mediatek.com>
 <1567090254-15566-22-git-send-email-yongqiang.niu@mediatek.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: B5C9C745579453C1F4ED3109BEA557BFB607994C68765150058BBB90A47201F22000:8
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
bCBiZSBhbm90aGVyIHBhdGNoCj4gCgpBcHBsaWVkIHRvIG1lZGlhdGVrLWRybS1uZXh0LTUuNSBb
MV0sIHRoYW5rcy4KClsxXQpodHRwczovL2dpdGh1Yi5jb20vY2todS1tZWRpYXRlay9saW51eC5n
aXQtdGFncy9jb21taXRzL21lZGlhdGVrLWRybS1uZXh0LTUuNQoKUmVnYXJkcywKQ0sKCj4gU2ln
bmVkLW9mZi1ieTogWW9uZ3FpYW5nIE5pdSA8eW9uZ3FpYW5nLm5pdUBtZWRpYXRlay5jb20+Cj4g
UmV2aWV3ZWQtYnk6IENLIEh1IDxjay5odUBtZWRpYXRlay5jb20+Cj4gLS0tCj4gIGRyaXZlcnMv
Z3B1L2RybS9tZWRpYXRlay9tdGtfZGlzcF9vdmwuYyB8IDIyICsrKysrKysrKysrKysrKysrKysr
KysKPiAgMSBmaWxlIGNoYW5nZWQsIDIyIGluc2VydGlvbnMoKykKPiAKPiBkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kaXNwX292bC5jIGIvZHJpdmVycy9ncHUvZHJt
L21lZGlhdGVrL210a19kaXNwX292bC5jCj4gaW5kZXggYmFlZjA2Ni4uZWIzYmY4NSAxMDA2NDQK
PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2Rpc3Bfb3ZsLmMKPiArKysgYi9k
cml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2Rpc3Bfb3ZsLmMKPiBAQCAtMTksNiArMTksOCBA
QAo+ICAjZGVmaW5lIERJU1BfUkVHX09WTF9FTgkJCQkweDAwMGMKPiAgI2RlZmluZSBESVNQX1JF
R19PVkxfUlNUCQkJMHgwMDE0Cj4gICNkZWZpbmUgRElTUF9SRUdfT1ZMX1JPSV9TSVpFCQkJMHgw
MDIwCj4gKyNkZWZpbmUgRElTUF9SRUdfT1ZMX0RBVEFQQVRIX0NPTgkJMHgwMDI0Cj4gKyNkZWZp
bmUgT1ZMX0JHQ0xSX1NFTF9JTgkJCQlCSVQoMikKPiAgI2RlZmluZSBESVNQX1JFR19PVkxfUk9J
X0JHQ0xSCQkJMHgwMDI4Cj4gICNkZWZpbmUgRElTUF9SRUdfT1ZMX1NSQ19DT04JCQkweDAwMmMK
PiAgI2RlZmluZSBESVNQX1JFR19PVkxfQ09OKG4pCQkJKDB4MDAzMCArIDB4MjAgKiAobikpCj4g
QEAgLTIzNyw2ICsyMzksMjQgQEAgc3RhdGljIHZvaWQgbXRrX292bF9sYXllcl9jb25maWcoc3Ry
dWN0IG10a19kZHBfY29tcCAqY29tcCwgdW5zaWduZWQgaW50IGlkeCwKPiAgCQltdGtfb3ZsX2xh
eWVyX29uKGNvbXAsIGlkeCk7Cj4gIH0KPiAgCj4gK3N0YXRpYyB2b2lkIG10a19vdmxfYmdjbHJf
aW5fb24oc3RydWN0IG10a19kZHBfY29tcCAqY29tcCkKPiArewo+ICsJdW5zaWduZWQgaW50IHJl
ZzsKPiArCj4gKwlyZWcgPSByZWFkbChjb21wLT5yZWdzICsgRElTUF9SRUdfT1ZMX0RBVEFQQVRI
X0NPTik7Cj4gKwlyZWcgPSByZWcgfCBPVkxfQkdDTFJfU0VMX0lOOwo+ICsJd3JpdGVsKHJlZywg
Y29tcC0+cmVncyArIERJU1BfUkVHX09WTF9EQVRBUEFUSF9DT04pOwo+ICt9Cj4gKwo+ICtzdGF0
aWMgdm9pZCBtdGtfb3ZsX2JnY2xyX2luX29mZihzdHJ1Y3QgbXRrX2RkcF9jb21wICpjb21wKQo+
ICt7Cj4gKwl1bnNpZ25lZCBpbnQgcmVnOwo+ICsKPiArCXJlZyA9IHJlYWRsKGNvbXAtPnJlZ3Mg
KyBESVNQX1JFR19PVkxfREFUQVBBVEhfQ09OKTsKPiArCXJlZyA9IHJlZyAmIH5PVkxfQkdDTFJf
U0VMX0lOOwo+ICsJd3JpdGVsKHJlZywgY29tcC0+cmVncyArIERJU1BfUkVHX09WTF9EQVRBUEFU
SF9DT04pOwo+ICt9Cj4gKwo+ICBzdGF0aWMgY29uc3Qgc3RydWN0IG10a19kZHBfY29tcF9mdW5j
cyBtdGtfZGlzcF9vdmxfZnVuY3MgPSB7Cj4gIAkuY29uZmlnID0gbXRrX292bF9jb25maWcsCj4g
IAkuc3RhcnQgPSBtdGtfb3ZsX3N0YXJ0LAo+IEBAIC0yNDcsNiArMjY3LDggQEAgc3RhdGljIHZv
aWQgbXRrX292bF9sYXllcl9jb25maWcoc3RydWN0IG10a19kZHBfY29tcCAqY29tcCwgdW5zaWdu
ZWQgaW50IGlkeCwKPiAgCS5sYXllcl9vbiA9IG10a19vdmxfbGF5ZXJfb24sCj4gIAkubGF5ZXJf
b2ZmID0gbXRrX292bF9sYXllcl9vZmYsCj4gIAkubGF5ZXJfY29uZmlnID0gbXRrX292bF9sYXll
cl9jb25maWcsCj4gKwkuYmdjbHJfaW5fb24gPSBtdGtfb3ZsX2JnY2xyX2luX29uLAo+ICsJLmJn
Y2xyX2luX29mZiA9IG10a19vdmxfYmdjbHJfaW5fb2ZmLAo+ICB9Owo+ICAKPiAgc3RhdGljIGlu
dCBtdGtfZGlzcF9vdmxfYmluZChzdHJ1Y3QgZGV2aWNlICpkZXYsIHN0cnVjdCBkZXZpY2UgKm1h
c3RlciwKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpk
cmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
