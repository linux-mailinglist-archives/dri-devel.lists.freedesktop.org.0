Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 10176D0C5D
	for <lists+dri-devel@lfdr.de>; Wed,  9 Oct 2019 12:14:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A189D6E95B;
	Wed,  9 Oct 2019 10:14:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [1.203.163.78])
 by gabe.freedesktop.org (Postfix) with ESMTP id CE5B46E95B
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Oct 2019 10:14:49 +0000 (UTC)
X-UUID: e7bd01d07a6c4a6b912af0f4af80ceb4-20191009
X-UUID: e7bd01d07a6c4a6b912af0f4af80ceb4-20191009
Received: from mtkcas35.mediatek.inc [(172.27.4.253)] by mailgw01.mediatek.com
 (envelope-from <ck.hu@mediatek.com>)
 (mailgw01.mediatek.com ESMTP with TLS)
 with ESMTP id 1468416911; Wed, 09 Oct 2019 17:19:44 +0800
Received: from mtkcas09.mediatek.inc (172.21.101.178) by
 MTKMBS31N1.mediatek.inc (172.27.4.69) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Wed, 9 Oct 2019 17:19:40 +0800
Received: from [172.21.77.4] (172.21.77.4) by mtkcas09.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Wed, 9 Oct 2019 17:19:40 +0800
Message-ID: <1570612783.7713.3.camel@mtksdaap41>
Subject: Re: [PATCH v5, 18/32] drm/mediatek: add gmc_bits for ovl private data
From: CK Hu <ck.hu@mediatek.com>
To: <yongqiang.niu@mediatek.com>
Date: Wed, 9 Oct 2019 17:19:43 +0800
In-Reply-To: <1567090254-15566-19-git-send-email-yongqiang.niu@mediatek.com>
References: <1567090254-15566-1-git-send-email-yongqiang.niu@mediatek.com>
 <1567090254-15566-19-git-send-email-yongqiang.niu@mediatek.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: F809891FCC3027FE8D3B12528026967FC17148ED97499028C44AAB64FEF7B7DB2000:8
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
YW5nLm5pdUBtZWRpYXRlay5jb20+Cj4gCj4gVGhpcyBwYXRjaCBhZGQgZ21jX2JpdHMgZm9yIG92
bCBwcml2YXRlIGRhdGEKPiBHTUMgcmVnaXN0ZXIgd2FzIHNldCBSRE1BIHVsdHJhIGFuZCBwcmUt
dWx0cmEgdGhyZXNob2xkLgo+IDEwYml0IEdNQyByZWdpc3RlciBkZWZpbmUgaXMgZGlmZmVyZW50
IHdpdGggb3RoZXIgU09DLCBnbWNfdGhyc2hkX2wgbm90Cj4gdXNlZC4KPiAKCkFwcGxpZWQgdG8g
bWVkaWF0ZWstZHJtLW5leHQtNS41IFsxXSwgdGhhbmtzLgoKWzFdCmh0dHBzOi8vZ2l0aHViLmNv
bS9ja2h1LW1lZGlhdGVrL2xpbnV4LmdpdC10YWdzL2NvbW1pdHMvbWVkaWF0ZWstZHJtLW5leHQt
NS41CgpSZWdhcmRzLApDSwoKPiBTaWduZWQtb2ZmLWJ5OiBZb25ncWlhbmcgTml1IDx5b25ncWlh
bmcubml1QG1lZGlhdGVrLmNvbT4KPiBSZXZpZXdlZC1ieTogQ0sgSHUgPGNrLmh1QG1lZGlhdGVr
LmNvbT4KPiAtLS0KPiAgZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kaXNwX292bC5jIHwg
MjMgKysrKysrKysrKysrKysrKysrKysrLS0KPiAgMSBmaWxlIGNoYW5nZWQsIDIxIGluc2VydGlv
bnMoKyksIDIgZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9t
ZWRpYXRlay9tdGtfZGlzcF9vdmwuYyBiL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZGlz
cF9vdmwuYwo+IGluZGV4IGM0ZjA3YzIuLjgyZWFlZmQgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9n
cHUvZHJtL21lZGlhdGVrL210a19kaXNwX292bC5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL21l
ZGlhdGVrL210a19kaXNwX292bC5jCj4gQEAgLTMxLDcgKzMxLDkgQEAKPiAgI2RlZmluZSBESVNQ
X1JFR19PVkxfQUREUl9NVDgxNzMJCTB4MGY0MAo+ICAjZGVmaW5lIERJU1BfUkVHX09WTF9BRERS
KG92bCwgbikJCSgob3ZsKS0+ZGF0YS0+YWRkciArIDB4MjAgKiAobikpCj4gIAo+IC0jZGVmaW5l
CU9WTF9SRE1BX01FTV9HTUMJMHg0MDQwMjAyMAo+ICsjZGVmaW5lIEdNQ19USFJFU0hPTERfQklU
UwkxNgo+ICsjZGVmaW5lIEdNQ19USFJFU0hPTERfSElHSAkoKDEgPDwgR01DX1RIUkVTSE9MRF9C
SVRTKSAvIDQpCj4gKyNkZWZpbmUgR01DX1RIUkVTSE9MRF9MT1cJKCgxIDw8IEdNQ19USFJFU0hP
TERfQklUUykgLyA4KQo+ICAKPiAgI2RlZmluZSBPVkxfQ09OX0JZVEVfU1dBUAlCSVQoMjQpCj4g
ICNkZWZpbmUgT1ZMX0NPTl9NVFhfWVVWX1RPX1JHQgkoNiA8PCAxNikKPiBAQCAtNDksNiArNTEs
NyBAQAo+ICAKPiAgc3RydWN0IG10a19kaXNwX292bF9kYXRhIHsKPiAgCXVuc2lnbmVkIGludCBh
ZGRyOwo+ICsJdW5zaWduZWQgaW50IGdtY19iaXRzOwo+ICAJYm9vbCBmbXRfcmdiNTY1X2lzXzA7
Cj4gIH07Cj4gIAo+IEBAIC0xMzIsOSArMTM1LDIzIEBAIHN0YXRpYyB1bnNpZ25lZCBpbnQgbXRr
X292bF9sYXllcl9ucihzdHJ1Y3QgbXRrX2RkcF9jb21wICpjb21wKQo+ICBzdGF0aWMgdm9pZCBt
dGtfb3ZsX2xheWVyX29uKHN0cnVjdCBtdGtfZGRwX2NvbXAgKmNvbXAsIHVuc2lnbmVkIGludCBp
ZHgpCj4gIHsKPiAgCXVuc2lnbmVkIGludCByZWc7Cj4gKwl1bnNpZ25lZCBpbnQgZ21jX3RocnNo
ZF9sOwo+ICsJdW5zaWduZWQgaW50IGdtY190aHJzaGRfaDsKPiArCXVuc2lnbmVkIGludCBnbWNf
dmFsdWU7Cj4gKwlzdHJ1Y3QgbXRrX2Rpc3Bfb3ZsICpvdmwgPSBjb21wX3RvX292bChjb21wKTsK
PiAgCj4gIAl3cml0ZWwoMHgxLCBjb21wLT5yZWdzICsgRElTUF9SRUdfT1ZMX1JETUFfQ1RSTChp
ZHgpKTsKPiAtCXdyaXRlbChPVkxfUkRNQV9NRU1fR01DLCBjb21wLT5yZWdzICsgRElTUF9SRUdf
T1ZMX1JETUFfR01DKGlkeCkpOwo+ICsKPiArCWdtY190aHJzaGRfbCA9IEdNQ19USFJFU0hPTERf
TE9XID4+Cj4gKwkJICAgICAgKEdNQ19USFJFU0hPTERfQklUUyAtIG92bC0+ZGF0YS0+Z21jX2Jp
dHMpOwo+ICsJZ21jX3RocnNoZF9oID0gR01DX1RIUkVTSE9MRF9ISUdIID4+Cj4gKwkJICAgICAg
KEdNQ19USFJFU0hPTERfQklUUyAtIG92bC0+ZGF0YS0+Z21jX2JpdHMpOwo+ICsJaWYgKG92bC0+
ZGF0YS0+Z21jX2JpdHMgPT0gMTApCj4gKwkJZ21jX3ZhbHVlID0gZ21jX3RocnNoZF9oIHwgZ21j
X3RocnNoZF9oIDw8IDE2Owo+ICsJZWxzZQo+ICsJCWdtY192YWx1ZSA9IGdtY190aHJzaGRfbCB8
IGdtY190aHJzaGRfbCA8PCA4IHwKPiArCQkJICAgIGdtY190aHJzaGRfaCA8PCAxNiB8IGdtY190
aHJzaGRfaCA8PCAyNDsKPiArCXdyaXRlbChnbWNfdmFsdWUsIGNvbXAtPnJlZ3MgKyBESVNQX1JF
R19PVkxfUkRNQV9HTUMoaWR4KSk7Cj4gIAo+ICAJcmVnID0gcmVhZGwoY29tcC0+cmVncyArIERJ
U1BfUkVHX09WTF9TUkNfQ09OKTsKPiAgCXJlZyA9IHJlZyB8IEJJVChpZHgpOwo+IEBAIC0zMTYs
MTEgKzMzMywxMyBAQCBzdGF0aWMgaW50IG10a19kaXNwX292bF9yZW1vdmUoc3RydWN0IHBsYXRm
b3JtX2RldmljZSAqcGRldikKPiAgCj4gIHN0YXRpYyBjb25zdCBzdHJ1Y3QgbXRrX2Rpc3Bfb3Zs
X2RhdGEgbXQyNzAxX292bF9kcml2ZXJfZGF0YSA9IHsKPiAgCS5hZGRyID0gRElTUF9SRUdfT1ZM
X0FERFJfTVQyNzAxLAo+ICsJLmdtY19iaXRzID0gOCwKPiAgCS5mbXRfcmdiNTY1X2lzXzAgPSBm
YWxzZSwKPiAgfTsKPiAgCj4gIHN0YXRpYyBjb25zdCBzdHJ1Y3QgbXRrX2Rpc3Bfb3ZsX2RhdGEg
bXQ4MTczX292bF9kcml2ZXJfZGF0YSA9IHsKPiAgCS5hZGRyID0gRElTUF9SRUdfT1ZMX0FERFJf
TVQ4MTczLAo+ICsJLmdtY19iaXRzID0gOCwKPiAgCS5mbXRfcmdiNTY1X2lzXzAgPSB0cnVlLAo+
ICB9Owo+ICAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcK
aHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
