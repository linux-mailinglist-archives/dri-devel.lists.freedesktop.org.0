Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E884453C9
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jun 2019 07:06:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 93211892FB;
	Fri, 14 Jun 2019 05:06:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [1.203.163.81])
 by gabe.freedesktop.org (Postfix) with ESMTP id 0D865892FB
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jun 2019 05:06:48 +0000 (UTC)
X-UUID: 7fd98b407f5a40f29073a7a6dfa2b499-20190614
X-UUID: 7fd98b407f5a40f29073a7a6dfa2b499-20190614
Received: from mtkcas35.mediatek.inc [(172.27.4.253)] by mailgw02.mediatek.com
 (envelope-from <ck.hu@mediatek.com>)
 (mailgw01.mediatek.com ESMTP with TLS)
 with ESMTP id 1599817428; Fri, 14 Jun 2019 13:06:37 +0800
Received: from mtkcas09.mediatek.inc (172.21.101.178) by
 MTKMBS31N1.mediatek.inc (172.27.4.69) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Fri, 14 Jun 2019 13:06:35 +0800
Received: from [172.21.77.4] (172.21.77.4) by mtkcas09.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Fri, 14 Jun 2019 13:06:35 +0800
Message-ID: <1560488795.16718.18.camel@mtksdaap41>
Subject: Re: [PATCH v3, 20/27] drm/mediatek: add background color input
 select function for ovl/ovl_2l
From: CK Hu <ck.hu@mediatek.com>
To: <yongqiang.niu@mediatek.com>
Date: Fri, 14 Jun 2019 13:06:35 +0800
In-Reply-To: <1559734986-7379-21-git-send-email-yongqiang.niu@mediatek.com>
References: <1559734986-7379-1-git-send-email-yongqiang.niu@mediatek.com>
 <1559734986-7379-21-git-send-email-yongqiang.niu@mediatek.com>
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGksIFlvbmdxaWFuZzoKCk9uIFdlZCwgMjAxOS0wNi0wNSBhdCAxOTo0MiArMDgwMCwgeW9uZ3Fp
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
bCBiZSBhbm90aGVyIHBhdGNoCj4gCj4gU2lnbmVkLW9mZi1ieTogWW9uZ3FpYW5nIE5pdSA8eW9u
Z3FpYW5nLm5pdUBtZWRpYXRlay5jb20+Cj4gLS0tCj4gIGRyaXZlcnMvZ3B1L2RybS9tZWRpYXRl
ay9tdGtfZGlzcF9vdmwuYyB8IDIzICsrKysrKysrKysrKysrKysrKysrKysrCj4gIDEgZmlsZSBj
aGFuZ2VkLCAyMyBpbnNlcnRpb25zKCspCj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2Ry
bS9tZWRpYXRlay9tdGtfZGlzcF9vdmwuYyBiL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtf
ZGlzcF9vdmwuYwo+IGluZGV4IGEwYWI3NjAuLmI1YTk5MDcgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVy
cy9ncHUvZHJtL21lZGlhdGVrL210a19kaXNwX292bC5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJt
L21lZGlhdGVrL210a19kaXNwX292bC5jCj4gQEAgLTI3LDYgKzI3LDggQEAKPiAgI2RlZmluZSBE
SVNQX1JFR19PVkxfRU4JCQkJMHgwMDBjCj4gICNkZWZpbmUgRElTUF9SRUdfT1ZMX1JTVAkJCTB4
MDAxNAo+ICAjZGVmaW5lIERJU1BfUkVHX09WTF9ST0lfU0laRQkJCTB4MDAyMAo+ICsjZGVmaW5l
IERJU1BfUkVHX09WTF9EQVRBUEFUSF9DT04JCTB4MDAyNAo+ICsjZGVmaW5lIE9WTF9CR0NMUl9T
RUxfSU4JCQkJQklUKDIpCj4gICNkZWZpbmUgRElTUF9SRUdfT1ZMX1JPSV9CR0NMUgkJCTB4MDAy
OAo+ICAjZGVmaW5lIERJU1BfUkVHX09WTF9TUkNfQ09OCQkJMHgwMDJjCj4gICNkZWZpbmUgRElT
UF9SRUdfT1ZMX0NPTihuKQkJCSgweDAwMzAgKyAweDIwICogKG4pKQo+IEBAIC0yNDUsNiArMjQ3
LDI1IEBAIHN0YXRpYyB2b2lkIG10a19vdmxfbGF5ZXJfY29uZmlnKHN0cnVjdCBtdGtfZGRwX2Nv
bXAgKmNvbXAsIHVuc2lnbmVkIGludCBpZHgsCj4gIAkJbXRrX292bF9sYXllcl9vbihjb21wLCBp
ZHgpOwo+ICB9Cj4gIAo+ICtzdGF0aWMgdm9pZCBtdGtfb3ZsX2JnY2xyX2luX29uKHN0cnVjdCBt
dGtfZGRwX2NvbXAgKmNvbXAsCj4gKwkJCQllbnVtIG10a19kZHBfY29tcF9pZCBwcmV2KQoKcHJl
diBpcyB1c2VsZXNzLCBzbyByZW1vdmUgaXQuCgpSZWdhcmRzLApDSwoKPiArewo+ICsJdW5zaWdu
ZWQgaW50IHJlZzsKPiArCj4gKwlyZWcgPSByZWFkbChjb21wLT5yZWdzICsgRElTUF9SRUdfT1ZM
X0RBVEFQQVRIX0NPTik7Cj4gKwlyZWcgPSByZWcgfCBPVkxfQkdDTFJfU0VMX0lOOwo+ICsJd3Jp
dGVsKHJlZywgY29tcC0+cmVncyArIERJU1BfUkVHX09WTF9EQVRBUEFUSF9DT04pOwo+ICt9Cj4g
Kwo+ICtzdGF0aWMgdm9pZCBtdGtfb3ZsX2JnY2xyX2luX29mZihzdHJ1Y3QgbXRrX2RkcF9jb21w
ICpjb21wKQo+ICt7Cj4gKwl1bnNpZ25lZCBpbnQgcmVnOwo+ICsKPiArCXJlZyA9IHJlYWRsKGNv
bXAtPnJlZ3MgKyBESVNQX1JFR19PVkxfREFUQVBBVEhfQ09OKTsKPiArCXJlZyA9IHJlZyAmIH5P
VkxfQkdDTFJfU0VMX0lOOwo+ICsJd3JpdGVsKHJlZywgY29tcC0+cmVncyArIERJU1BfUkVHX09W
TF9EQVRBUEFUSF9DT04pOwo+ICt9Cj4gKwo+ICBzdGF0aWMgY29uc3Qgc3RydWN0IG10a19kZHBf
Y29tcF9mdW5jcyBtdGtfZGlzcF9vdmxfZnVuY3MgPSB7Cj4gIAkuY29uZmlnID0gbXRrX292bF9j
b25maWcsCj4gIAkuc3RhcnQgPSBtdGtfb3ZsX3N0YXJ0LAo+IEBAIC0yNTUsNiArMjc2LDggQEAg
c3RhdGljIHZvaWQgbXRrX292bF9sYXllcl9jb25maWcoc3RydWN0IG10a19kZHBfY29tcCAqY29t
cCwgdW5zaWduZWQgaW50IGlkeCwKPiAgCS5sYXllcl9vbiA9IG10a19vdmxfbGF5ZXJfb24sCj4g
IAkubGF5ZXJfb2ZmID0gbXRrX292bF9sYXllcl9vZmYsCj4gIAkubGF5ZXJfY29uZmlnID0gbXRr
X292bF9sYXllcl9jb25maWcsCj4gKwkuYmdjbHJfaW5fb24gPSBtdGtfb3ZsX2JnY2xyX2luX29u
LAo+ICsJLmJnY2xyX2luX29mZiA9IG10a19vdmxfYmdjbHJfaW5fb2ZmLAo+ICB9Owo+ICAKPiAg
c3RhdGljIGludCBtdGtfZGlzcF9vdmxfYmluZChzdHJ1Y3QgZGV2aWNlICpkZXYsIHN0cnVjdCBk
ZXZpY2UgKm1hc3RlciwKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3Rv
cC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmkt
ZGV2ZWw=
