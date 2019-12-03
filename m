Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BC1E510F77C
	for <lists+dri-devel@lfdr.de>; Tue,  3 Dec 2019 06:48:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF4846E047;
	Tue,  3 Dec 2019 05:48:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [1.203.163.81])
 by gabe.freedesktop.org (Postfix) with ESMTP id CE3A36E047
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Dec 2019 05:48:26 +0000 (UTC)
X-UUID: dc3af342ec4e472da01a7151a6f7f794-20191203
X-UUID: dc3af342ec4e472da01a7151a6f7f794-20191203
Received: from mtkcas36.mediatek.inc [(172.27.4.253)] by mailgw02.mediatek.com
 (envelope-from <ck.hu@mediatek.com>)
 (mailgw01.mediatek.com ESMTP with TLS)
 with ESMTP id 1988541687; Tue, 03 Dec 2019 13:48:22 +0800
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 MTKMBS31DR.mediatek.inc (172.27.6.102) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Tue, 3 Dec 2019 13:47:58 +0800
Received: from [172.21.77.4] (172.21.77.4) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Tue, 3 Dec 2019 13:48:03 +0800
Message-ID: <1575352101.2457.8.camel@mtksdaap41>
Subject: Re: [PATCH v1, 1/2] drm/mediatek: Fixup external display black
 screen issue
From: CK Hu <ck.hu@mediatek.com>
To: <yongqiang.niu@mediatek.com>
Date: Tue, 3 Dec 2019 13:48:21 +0800
In-Reply-To: <1574817475-22378-2-git-send-email-yongqiang.niu@mediatek.com>
References: <1574817475-22378-1-git-send-email-yongqiang.niu@mediatek.com>
 <1574817475-22378-2-git-send-email-yongqiang.niu@mediatek.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: ECDA7C700F230F49CC04960EDF378BA1B224B8EBA5C76FADE77E7DC3A6A045032000:8
X-MTK: N
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; d=mediatek.com; s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=6DCb7uPyQXGO0SVO2IKAV+0ziUuW5YDj4cnCAfRju/o=; 
 b=sxCKlzdjfRHL6C5d8mPBdmgCaPRG8xjIUtRb6McV9mH32ecfeulKjIynWzGQUmJEHDmVgjoamv1qz6TO/yf6BcAJjw9mpAZKfdXAHl1cpZ5/0Y9iQxtnQtuRGbvjvnul8X1NWfYl0CnutkbcPJZcHx6XZzfeTBAf+XjKhcLcHMk=;
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

SGksIFlvbmdxaWFuZzoNCg0KT24gV2VkLCAyMDE5LTExLTI3IGF0IDA5OjE3ICswODAwLCB5b25n
cWlhbmcubml1QG1lZGlhdGVrLmNvbSB3cm90ZToNCj4gRnJvbTogWW9uZ3FpYW5nIE5pdSA8eW9u
Z3FpYW5nLm5pdUBtZWRpYXRlay5jb20+DQo+IA0KPiBQcm9ibGVtOg0KPiBvdmVybGF5IGhhbmd1
cCB3aGVuIGV4dGVybmFsIGRpc3BsYXkgaG90cGx1dCB0ZXN0DQo+IA0KPiBGaXg6DQo+IGRpc2Fi
bGUgb3ZlcmxheSB3aGVuIGNydGMgZGlzYWJsZQ0KDQpJIHRoaW5rIHlvdSBkbyB0d28gdGhpbmdz
IGluIHRoaXMgcGF0Y2guIFRoZSBmaXJzdCBpcyB0byBjb25maWcgbGF5ZXINCmJlZm9yZSBjb21w
b25lbnQgc3RhcnQsIGFuZCB0aGUgc2Vjb25kIGlzIGRpc2FibGUgbGF5ZXIgd2hlbiBjcnRjDQpk
aXNhYmxlLiBTbyBzZXBhcmF0ZSB0byB0d28gcGF0Y2hlcy4NCg0KPiANCj4gU2lnbmVkLW9mZi1i
eTogWW9uZ3FpYW5nIE5pdSA8eW9uZ3FpYW5nLm5pdUBtZWRpYXRlay5jb20+DQo+IC0tLQ0KPiAg
ZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcm1fY3J0Yy5jIHwgMzkgKysrKysrKysrKysr
KysrKysrKysrLS0tLS0tLS0tLS0tDQo+ICAxIGZpbGUgY2hhbmdlZCwgMjUgaW5zZXJ0aW9ucygr
KSwgMTQgZGVsZXRpb25zKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL21l
ZGlhdGVrL210a19kcm1fY3J0Yy5jIGIvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcm1f
Y3J0Yy5jDQo+IGluZGV4IDRmYjM0NmMuLjdlY2EwMmYgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMv
Z3B1L2RybS9tZWRpYXRlay9tdGtfZHJtX2NydGMuYw0KPiArKysgYi9kcml2ZXJzL2dwdS9kcm0v
bWVkaWF0ZWsvbXRrX2RybV9jcnRjLmMNCj4gQEAgLTM2OSw2ICszNjksMjAgQEAgc3RhdGljIGlu
dCBtdGtfY3J0Y19kZHBfaHdfaW5pdChzdHJ1Y3QgbXRrX2RybV9jcnRjICptdGtfY3J0YykNCj4g
IAltdGtfZGlzcF9tdXRleF9hZGRfY29tcChtdGtfY3J0Yy0+bXV0ZXgsIG10a19jcnRjLT5kZHBf
Y29tcFtpXS0+aWQpOw0KPiAgCW10a19kaXNwX211dGV4X2VuYWJsZShtdGtfY3J0Yy0+bXV0ZXgp
Ow0KPiAgDQo+ICsJLyogSW5pdGlhbGx5IGNvbmZpZ3VyZSBhbGwgcGxhbmVzICovDQo+ICsJZm9y
IChpID0gMDsgaSA8IG10a19jcnRjLT5sYXllcl9ucjsgaSsrKSB7DQo+ICsJCXN0cnVjdCBkcm1f
cGxhbmUgKnBsYW5lID0gJm10a19jcnRjLT5wbGFuZXNbaV07DQo+ICsJCXN0cnVjdCBtdGtfcGxh
bmVfc3RhdGUgKnBsYW5lX3N0YXRlOw0KPiArCQlzdHJ1Y3QgbXRrX2RkcF9jb21wICpjb21wOw0K
PiArCQl1bnNpZ25lZCBpbnQgbG9jYWxfbGF5ZXI7DQo+ICsNCj4gKwkJcGxhbmVfc3RhdGUgPSB0
b19tdGtfcGxhbmVfc3RhdGUocGxhbmUtPnN0YXRlKTsNCj4gKwkJY29tcCA9IG10a19kcm1fZGRw
X2NvbXBfZm9yX3BsYW5lKGNydGMsIHBsYW5lLCAmbG9jYWxfbGF5ZXIpOw0KPiArCQlpZiAoY29t
cCkNCj4gKwkJCW10a19kZHBfY29tcF9sYXllcl9jb25maWcoY29tcCwgbG9jYWxfbGF5ZXIsDQo+
ICsJCQkJCQkgIHBsYW5lX3N0YXRlLCBOVUxMKTsNCj4gKwl9DQo+ICsNCj4gIAlmb3IgKGkgPSAw
OyBpIDwgbXRrX2NydGMtPmRkcF9jb21wX25yOyBpKyspIHsNCj4gIAkJc3RydWN0IG10a19kZHBf
Y29tcCAqY29tcCA9IG10a19jcnRjLT5kZHBfY29tcFtpXTsNCj4gIAkJZW51bSBtdGtfZGRwX2Nv
bXBfaWQgcHJldjsNCj4gQEAgLTM4NSwyMCArMzk5LDYgQEAgc3RhdGljIGludCBtdGtfY3J0Y19k
ZHBfaHdfaW5pdChzdHJ1Y3QgbXRrX2RybV9jcnRjICptdGtfY3J0YykNCj4gIAkJbXRrX2RkcF9j
b21wX3N0YXJ0KGNvbXApOw0KPiAgCX0NCj4gIA0KPiAtCS8qIEluaXRpYWxseSBjb25maWd1cmUg
YWxsIHBsYW5lcyAqLw0KPiAtCWZvciAoaSA9IDA7IGkgPCBtdGtfY3J0Yy0+bGF5ZXJfbnI7IGkr
Kykgew0KPiAtCQlzdHJ1Y3QgZHJtX3BsYW5lICpwbGFuZSA9ICZtdGtfY3J0Yy0+cGxhbmVzW2ld
Ow0KPiAtCQlzdHJ1Y3QgbXRrX3BsYW5lX3N0YXRlICpwbGFuZV9zdGF0ZTsNCj4gLQkJc3RydWN0
IG10a19kZHBfY29tcCAqY29tcDsNCj4gLQkJdW5zaWduZWQgaW50IGxvY2FsX2xheWVyOw0KPiAt
DQo+IC0JCXBsYW5lX3N0YXRlID0gdG9fbXRrX3BsYW5lX3N0YXRlKHBsYW5lLT5zdGF0ZSk7DQo+
IC0JCWNvbXAgPSBtdGtfZHJtX2RkcF9jb21wX2Zvcl9wbGFuZShjcnRjLCBwbGFuZSwgJmxvY2Fs
X2xheWVyKTsNCj4gLQkJaWYgKGNvbXApDQo+IC0JCQltdGtfZGRwX2NvbXBfbGF5ZXJfY29uZmln
KGNvbXAsIGxvY2FsX2xheWVyLA0KPiAtCQkJCQkJICBwbGFuZV9zdGF0ZSwgTlVMTCk7DQo+IC0J
fQ0KPiAtDQo+ICAJcmV0dXJuIDA7DQo+ICANCj4gIGVycl9tdXRleF91bnByZXBhcmU6DQo+IEBA
IC02MDcsMTAgKzYwNywyMSBAQCBzdGF0aWMgdm9pZCBtdGtfZHJtX2NydGNfYXRvbWljX2Rpc2Fi
bGUoc3RydWN0IGRybV9jcnRjICpjcnRjLA0KPiAgCWZvciAoaSA9IDA7IGkgPCBtdGtfY3J0Yy0+
bGF5ZXJfbnI7IGkrKykgew0KPiAgCQlzdHJ1Y3QgZHJtX3BsYW5lICpwbGFuZSA9ICZtdGtfY3J0
Yy0+cGxhbmVzW2ldOw0KPiAgCQlzdHJ1Y3QgbXRrX3BsYW5lX3N0YXRlICpwbGFuZV9zdGF0ZTsN
Cj4gKwkJc3RydWN0IG10a19kZHBfY29tcCAqY29tcCA9IG10a19jcnRjLT5kZHBfY29tcFswXTsN
Cj4gKwkJdW5zaWduZWQgaW50IGNvbXBfbGF5ZXJfbnIgPSBtdGtfZGRwX2NvbXBfbGF5ZXJfbnIo
Y29tcCk7DQo+ICsJCXVuc2lnbmVkIGludCBsb2NhbF9sYXllcjsNCj4gIA0KPiAgCQlwbGFuZV9z
dGF0ZSA9IHRvX210a19wbGFuZV9zdGF0ZShwbGFuZS0+c3RhdGUpOw0KPiAgCQlwbGFuZV9zdGF0
ZS0+cGVuZGluZy5lbmFibGUgPSBmYWxzZTsNCj4gIAkJcGxhbmVfc3RhdGUtPnBlbmRpbmcuY29u
ZmlnID0gdHJ1ZTsNCj4gKw0KPiArCQlpZiAoaSA+PSBjb21wX2xheWVyX25yKSB7DQo+ICsJCQlj
b21wID0gbXRrX2NydGMtPmRkcF9jb21wWzFdOw0KPiArCQkJbG9jYWxfbGF5ZXIgPSBpIC0gY29t
cF9sYXllcl9ucjsNCj4gKwkJfSBlbHNlDQo+ICsJCQlsb2NhbF9sYXllciA9IGk7DQo+ICsJCW10
a19kZHBfY29tcF9sYXllcl9jb25maWcoY29tcCwgbG9jYWxfbGF5ZXIsDQo+ICsJCQkJCSAgcGxh
bmVfc3RhdGUsIE5VTEwpOw0KDQpJJ20gY29uZnVzZWQgd2l0aCB0aGlzIHBhcnQuIFRoZSBkZXNp
Z24gb2YgdGhpcyBsb29wIGlzIHRvIHNldA0KcGxhbmVfc3RhdGUtPnBlbmRpbmcuZW5hYmxlID0g
ZmFsc2UgYW5kIHdhaXQgZm9yIGlycSBoYW5kbGVyIHRvIHdyaXRlDQpyZWdpc3Rlci4gV2h5IGRv
IHlvdSBkaXJlY3RseSB3cml0ZSByZWdpc3Rlcj8NCg0KUmVnYXJkcywNCkNLDQoNCj4gIAl9DQo+
ICAJbXRrX2NydGMtPnBlbmRpbmdfcGxhbmVzID0gdHJ1ZTsNCj4gIA0KDQpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0
CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3Rv
cC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
