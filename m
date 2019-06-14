Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 26405453C0
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jun 2019 07:02:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CFF56892FB;
	Fri, 14 Jun 2019 05:02:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [1.203.163.78])
 by gabe.freedesktop.org (Postfix) with ESMTP id 1453F892FB
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jun 2019 05:02:10 +0000 (UTC)
X-UUID: 57caa488e5f3470f8aac425cc8cf59a1-20190614
X-UUID: 57caa488e5f3470f8aac425cc8cf59a1-20190614
Received: from mtkcas32.mediatek.inc [(172.27.4.253)] by mailgw01.mediatek.com
 (envelope-from <ck.hu@mediatek.com>)
 (mailgw01.mediatek.com ESMTP with TLS)
 with ESMTP id 2128396892; Fri, 14 Jun 2019 13:02:09 +0800
Received: from mtkcas09.mediatek.inc (172.21.101.178) by
 MTKMBS31N1.mediatek.inc (172.27.4.69) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Fri, 14 Jun 2019 13:02:07 +0800
Received: from [172.21.77.4] (172.21.77.4) by mtkcas09.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Fri, 14 Jun 2019 13:02:07 +0800
Message-ID: <1560488527.16718.17.camel@mtksdaap41>
Subject: Re: [PATCH v3, 18/27] drm/medaitek: add layer_nr for ovl private data
From: CK Hu <ck.hu@mediatek.com>
To: <yongqiang.niu@mediatek.com>
Date: Fri, 14 Jun 2019 13:02:07 +0800
In-Reply-To: <1559734986-7379-19-git-send-email-yongqiang.niu@mediatek.com>
References: <1559734986-7379-1-git-send-email-yongqiang.niu@mediatek.com>
 <1559734986-7379-19-git-send-email-yongqiang.niu@mediatek.com>
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
YW5nLm5pdUBtZWRpYXRlay5jb20+Cj4gCj4gVGhpcyBwYXRjaCBhZGQgbGF5ZXJfbnIgZm9yIG92
bCBwcml2YXRlIGRhdGEKPiBvdmxfMmwgYWxtb3N0IHNhbWUgd2l0aCB3aXRoIG92bCBoYXJkd2Fy
ZSwgZXhjZXB0IHRoZQo+IGxheWVyIG51bWJlciBmb3Igb3ZsXzJsIGlzIDIgYW5kIG92bCBpcyA0
Lgo+IHRoaXMgcGF0Y2ggaXMgYSBwcmVwYXJhdGlvbiBmb3Igb3ZsLTJsIGFuZAo+IG92bCBzaGFy
ZSB0aGUgc2FtZSBkcml2ZXIuCgpUaGlzIHBhdGNoIGlzIGlkZW50aWNhbCB0byB2MiwgYW5kIEkn
dmUgZ2l2ZSBhICdSZXZpZXdlZC1ieScgZm9yIHYyLApzbyB5b3Ugc2hvdWxkIGtlZXAgdGhpcyAn
UmV2aWV3ZWQtYnknIHRhZyBpbiB0aGlzIHBhdGNoLCBzbyBJIHN0aWxsIGdpdmUKeW91IGEKClJl
dmlld2VkLWJ5OiBDSyBIdSA8Y2suaHVAbWVkaWF0ZWsuY29tPgoKPiAKPiBTaWduZWQtb2ZmLWJ5
OiBZb25ncWlhbmcgTml1IDx5b25ncWlhbmcubml1QG1lZGlhdGVrLmNvbT4KPiAtLS0KPiAgZHJp
dmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kaXNwX292bC5jIHwgNyArKysrKystCj4gIDEgZmls
ZSBjaGFuZ2VkLCA2IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKPiAKPiBkaWZmIC0tZ2l0
IGEvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kaXNwX292bC5jIGIvZHJpdmVycy9ncHUv
ZHJtL21lZGlhdGVrL210a19kaXNwX292bC5jCj4gaW5kZXggYWZiMzEzYy4uYTBhYjc2MCAxMDA2
NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2Rpc3Bfb3ZsLmMKPiArKysg
Yi9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2Rpc3Bfb3ZsLmMKPiBAQCAtNjAsNiArNjAs
NyBAQAo+ICBzdHJ1Y3QgbXRrX2Rpc3Bfb3ZsX2RhdGEgewo+ICAJdW5zaWduZWQgaW50IGFkZHI7
Cj4gIAl1bnNpZ25lZCBpbnQgZ21jX2JpdHM7Cj4gKwl1bnNpZ25lZCBpbnQgbGF5ZXJfbnI7Cj4g
IAlib29sIGZtdF9yZ2I1NjVfaXNfMDsKPiAgfTsKPiAgCj4gQEAgLTEzNyw3ICsxMzgsOSBAQCBz
dGF0aWMgdm9pZCBtdGtfb3ZsX2NvbmZpZyhzdHJ1Y3QgbXRrX2RkcF9jb21wICpjb21wLCB1bnNp
Z25lZCBpbnQgdywKPiAgCj4gIHN0YXRpYyB1bnNpZ25lZCBpbnQgbXRrX292bF9sYXllcl9ucihz
dHJ1Y3QgbXRrX2RkcF9jb21wICpjb21wKQo+ICB7Cj4gLQlyZXR1cm4gNDsKPiArCXN0cnVjdCBt
dGtfZGlzcF9vdmwgKm92bCA9IGNvbXBfdG9fb3ZsKGNvbXApOwo+ICsKPiArCXJldHVybiBvdmwt
PmRhdGEtPmxheWVyX25yOwo+ICB9Cj4gIAo+ICBzdGF0aWMgdm9pZCBtdGtfb3ZsX2xheWVyX29u
KHN0cnVjdCBtdGtfZGRwX2NvbXAgKmNvbXAsIHVuc2lnbmVkIGludCBpZHgpCj4gQEAgLTM0Miwx
MiArMzQ1LDE0IEBAIHN0YXRpYyBpbnQgbXRrX2Rpc3Bfb3ZsX3JlbW92ZShzdHJ1Y3QgcGxhdGZv
cm1fZGV2aWNlICpwZGV2KQo+ICBzdGF0aWMgY29uc3Qgc3RydWN0IG10a19kaXNwX292bF9kYXRh
IG10MjcwMV9vdmxfZHJpdmVyX2RhdGEgPSB7Cj4gIAkuYWRkciA9IERJU1BfUkVHX09WTF9BRERS
X01UMjcwMSwKPiAgCS5nbWNfYml0cyA9IDgsCj4gKwkubGF5ZXJfbnIgPSA0LAo+ICAJLmZtdF9y
Z2I1NjVfaXNfMCA9IGZhbHNlLAo+ICB9Owo+ICAKPiAgc3RhdGljIGNvbnN0IHN0cnVjdCBtdGtf
ZGlzcF9vdmxfZGF0YSBtdDgxNzNfb3ZsX2RyaXZlcl9kYXRhID0gewo+ICAJLmFkZHIgPSBESVNQ
X1JFR19PVkxfQUREUl9NVDgxNzMsCj4gIAkuZ21jX2JpdHMgPSA4LAo+ICsJLmxheWVyX25yID0g
NCwKPiAgCS5mbXRfcmdiNTY1X2lzXzAgPSB0cnVlLAo+ICB9Owo+ICAKCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0
CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3Rv
cC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
