Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A063D453BA
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jun 2019 06:59:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A4163892FB;
	Fri, 14 Jun 2019 04:59:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [1.203.163.78])
 by gabe.freedesktop.org (Postfix) with ESMTP id AA353892FB
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jun 2019 04:59:22 +0000 (UTC)
X-UUID: 8d78a5e826f1456bbf793690ac848444-20190614
X-UUID: 8d78a5e826f1456bbf793690ac848444-20190614
Received: from mtkcas35.mediatek.inc [(172.27.4.253)] by mailgw01.mediatek.com
 (envelope-from <ck.hu@mediatek.com>)
 (mailgw01.mediatek.com ESMTP with TLS)
 with ESMTP id 1817037482; Fri, 14 Jun 2019 12:59:15 +0800
Received: from mtkcas09.mediatek.inc (172.21.101.178) by
 MTKMBS31N1.mediatek.inc (172.27.4.69) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Fri, 14 Jun 2019 12:59:14 +0800
Received: from [172.21.77.4] (172.21.77.4) by mtkcas09.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Fri, 14 Jun 2019 12:59:13 +0800
Message-ID: <1560488354.16718.16.camel@mtksdaap41>
Subject: Re: [PATCH v3, 17/27] drm/mediatek: add gmc_bits for ovl private data
From: CK Hu <ck.hu@mediatek.com>
To: <yongqiang.niu@mediatek.com>
Date: Fri, 14 Jun 2019 12:59:14 +0800
In-Reply-To: <1559734986-7379-18-git-send-email-yongqiang.niu@mediatek.com>
References: <1559734986-7379-1-git-send-email-yongqiang.niu@mediatek.com>
 <1559734986-7379-18-git-send-email-yongqiang.niu@mediatek.com>
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
YW5nLm5pdUBtZWRpYXRlay5jb20+Cj4gCj4gVGhpcyBwYXRjaCBhZGQgZ21jX2JpdHMgZm9yIG92
bCBwcml2YXRlIGRhdGEKPiBHTUMgcmVnaXN0ZXIgd2FzIHNldCBSRE1BIHVsdHJhIGFuZCBwcmUt
dWx0cmEgdGhyZXNob2xkLgo+IDEwYml0IEdNQyByZWdpc3RlciBkZWZpbmUgaXMgZGlmZmVyZW50
IHdpdGggb3RoZXIgU09DLCBnbWNfdGhyc2hkX2wgbm90Cj4gdXNlZC4KClRoaXMgcGF0Y2ggaXMg
aWRlbnRpY2FsIHRvIHYyLCBhbmQgSSd2ZSBnaXZlIGEgJ1Jldmlld2VkLWJ5JyBmb3IgdjIsCnNv
IHlvdSBzaG91bGQga2VlcCB0aGlzICdSZXZpZXdlZC1ieScgdGFnIGluIHRoaXMgcGF0Y2gsIHNv
IEkgc3RpbGwgZ2l2ZQp5b3UgYQoKUmV2aWV3ZWQtYnk6IENLIEh1IDxjay5odUBtZWRpYXRlay5j
b20+Cgo+IAo+IFNpZ25lZC1vZmYtYnk6IFlvbmdxaWFuZyBOaXUgPHlvbmdxaWFuZy5uaXVAbWVk
aWF0ZWsuY29tPgo+IC0tLQo+ICBkcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2Rpc3Bfb3Zs
LmMgfCAyMyArKysrKysrKysrKysrKysrKysrKystLQo+ICAxIGZpbGUgY2hhbmdlZCwgMjEgaW5z
ZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUv
ZHJtL21lZGlhdGVrL210a19kaXNwX292bC5jIGIvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210
a19kaXNwX292bC5jCj4gaW5kZXggMjhkMTkxMS4uYWZiMzEzYyAxMDA2NDQKPiAtLS0gYS9kcml2
ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2Rpc3Bfb3ZsLmMKPiArKysgYi9kcml2ZXJzL2dwdS9k
cm0vbWVkaWF0ZWsvbXRrX2Rpc3Bfb3ZsLmMKPiBAQCAtMzksNyArMzksOSBAQAo+ICAjZGVmaW5l
IERJU1BfUkVHX09WTF9BRERSX01UODE3MwkJMHgwZjQwCj4gICNkZWZpbmUgRElTUF9SRUdfT1ZM
X0FERFIob3ZsLCBuKQkJKChvdmwpLT5kYXRhLT5hZGRyICsgMHgyMCAqIChuKSkKPiAgCj4gLSNk
ZWZpbmUJT1ZMX1JETUFfTUVNX0dNQwkweDQwNDAyMDIwCj4gKyNkZWZpbmUgR01DX1RIUkVTSE9M
RF9CSVRTCTE2Cj4gKyNkZWZpbmUgR01DX1RIUkVTSE9MRF9ISUdICSgoMSA8PCBHTUNfVEhSRVNI
T0xEX0JJVFMpIC8gNCkKPiArI2RlZmluZSBHTUNfVEhSRVNIT0xEX0xPVwkoKDEgPDwgR01DX1RI
UkVTSE9MRF9CSVRTKSAvIDgpCj4gIAo+ICAjZGVmaW5lIE9WTF9DT05fQllURV9TV0FQCUJJVCgy
NCkKPiAgI2RlZmluZSBPVkxfQ09OX01UWF9ZVVZfVE9fUkdCCSg2IDw8IDE2KQo+IEBAIC01Nyw2
ICs1OSw3IEBACj4gIAo+ICBzdHJ1Y3QgbXRrX2Rpc3Bfb3ZsX2RhdGEgewo+ICAJdW5zaWduZWQg
aW50IGFkZHI7Cj4gKwl1bnNpZ25lZCBpbnQgZ21jX2JpdHM7Cj4gIAlib29sIGZtdF9yZ2I1NjVf
aXNfMDsKPiAgfTsKPiAgCj4gQEAgLTE0MCw5ICsxNDMsMjMgQEAgc3RhdGljIHVuc2lnbmVkIGlu
dCBtdGtfb3ZsX2xheWVyX25yKHN0cnVjdCBtdGtfZGRwX2NvbXAgKmNvbXApCj4gIHN0YXRpYyB2
b2lkIG10a19vdmxfbGF5ZXJfb24oc3RydWN0IG10a19kZHBfY29tcCAqY29tcCwgdW5zaWduZWQg
aW50IGlkeCkKPiAgewo+ICAJdW5zaWduZWQgaW50IHJlZzsKPiArCXVuc2lnbmVkIGludCBnbWNf
dGhyc2hkX2w7Cj4gKwl1bnNpZ25lZCBpbnQgZ21jX3RocnNoZF9oOwo+ICsJdW5zaWduZWQgaW50
IGdtY192YWx1ZTsKPiArCXN0cnVjdCBtdGtfZGlzcF9vdmwgKm92bCA9IGNvbXBfdG9fb3ZsKGNv
bXApOwo+ICAKPiAgCXdyaXRlbCgweDEsIGNvbXAtPnJlZ3MgKyBESVNQX1JFR19PVkxfUkRNQV9D
VFJMKGlkeCkpOwo+IC0Jd3JpdGVsKE9WTF9SRE1BX01FTV9HTUMsIGNvbXAtPnJlZ3MgKyBESVNQ
X1JFR19PVkxfUkRNQV9HTUMoaWR4KSk7Cj4gKwo+ICsJZ21jX3RocnNoZF9sID0gR01DX1RIUkVT
SE9MRF9MT1cgPj4KPiArCQkgICAgICAoR01DX1RIUkVTSE9MRF9CSVRTIC0gb3ZsLT5kYXRhLT5n
bWNfYml0cyk7Cj4gKwlnbWNfdGhyc2hkX2ggPSBHTUNfVEhSRVNIT0xEX0hJR0ggPj4KPiArCQkg
ICAgICAoR01DX1RIUkVTSE9MRF9CSVRTIC0gb3ZsLT5kYXRhLT5nbWNfYml0cyk7Cj4gKwlpZiAo
b3ZsLT5kYXRhLT5nbWNfYml0cyA9PSAxMCkKPiArCQlnbWNfdmFsdWUgPSBnbWNfdGhyc2hkX2gg
fCBnbWNfdGhyc2hkX2ggPDwgMTY7Cj4gKwllbHNlCj4gKwkJZ21jX3ZhbHVlID0gZ21jX3RocnNo
ZF9sIHwgZ21jX3RocnNoZF9sIDw8IDggfAo+ICsJCQkgICAgZ21jX3RocnNoZF9oIDw8IDE2IHwg
Z21jX3RocnNoZF9oIDw8IDI0Owo+ICsJd3JpdGVsKGdtY192YWx1ZSwgY29tcC0+cmVncyArIERJ
U1BfUkVHX09WTF9SRE1BX0dNQyhpZHgpKTsKPiAgCj4gIAlyZWcgPSByZWFkbChjb21wLT5yZWdz
ICsgRElTUF9SRUdfT1ZMX1NSQ19DT04pOwo+ICAJcmVnID0gcmVnIHwgQklUKGlkeCk7Cj4gQEAg
LTMyNCwxMSArMzQxLDEzIEBAIHN0YXRpYyBpbnQgbXRrX2Rpc3Bfb3ZsX3JlbW92ZShzdHJ1Y3Qg
cGxhdGZvcm1fZGV2aWNlICpwZGV2KQo+ICAKPiAgc3RhdGljIGNvbnN0IHN0cnVjdCBtdGtfZGlz
cF9vdmxfZGF0YSBtdDI3MDFfb3ZsX2RyaXZlcl9kYXRhID0gewo+ICAJLmFkZHIgPSBESVNQX1JF
R19PVkxfQUREUl9NVDI3MDEsCj4gKwkuZ21jX2JpdHMgPSA4LAo+ICAJLmZtdF9yZ2I1NjVfaXNf
MCA9IGZhbHNlLAo+ICB9Owo+ICAKPiAgc3RhdGljIGNvbnN0IHN0cnVjdCBtdGtfZGlzcF9vdmxf
ZGF0YSBtdDgxNzNfb3ZsX2RyaXZlcl9kYXRhID0gewo+ICAJLmFkZHIgPSBESVNQX1JFR19PVkxf
QUREUl9NVDgxNzMsCj4gKwkuZ21jX2JpdHMgPSA4LAo+ICAJLmZtdF9yZ2I1NjVfaXNfMCA9IHRy
dWUsCj4gIH07Cj4gIAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1k
ZXZlbA==
