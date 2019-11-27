Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 20FE110AB75
	for <lists+dri-devel@lfdr.de>; Wed, 27 Nov 2019 09:09:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A0B36E4C1;
	Wed, 27 Nov 2019 08:09:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTP id 22A096E1E2
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Nov 2019 01:18:06 +0000 (UTC)
X-UUID: b1d2e2b438744ddd84fe632dc4d218cf-20191127
X-UUID: b1d2e2b438744ddd84fe632dc4d218cf-20191127
Received: from mtkexhb01.mediatek.inc [(172.21.101.102)] by
 mailgw02.mediatek.com (envelope-from <yongqiang.niu@mediatek.com>)
 (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
 with ESMTP id 450978565; Wed, 27 Nov 2019 09:18:03 +0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs05n2.mediatek.inc (172.21.101.140) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Wed, 27 Nov 2019 09:17:49 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Wed, 27 Nov 2019 09:17:10 +0800
From: <yongqiang.niu@mediatek.com>
To: CK Hu <ck.hu@mediatek.com>, Philipp Zabel <p.zabel@pengutronix.de>, Rob
 Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
Subject: [PATCH v1,
 1/2] drm/mediatek: Fixup external display black screen issue
Date: Wed, 27 Nov 2019 09:17:54 +0800
Message-ID: <1574817475-22378-2-git-send-email-yongqiang.niu@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
In-Reply-To: <1574817475-22378-1-git-send-email-yongqiang.niu@mediatek.com>
References: <1574817475-22378-1-git-send-email-yongqiang.niu@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-Mailman-Approved-At: Wed, 27 Nov 2019 08:09:16 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; d=mediatek.com; s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=ukDKw46dJ6kUKB8fK1XW/KSDkxflYgyotMjPJ393R3U=; 
 b=grzPbgtOoaYuYOJcAIbOpqz1hVI4MKTPAvxuH57zO63yI/7B33G/kWWwgPTRKaJ860f+kFp6kEWJvM+2wxeSzPwgZuSl6V2Lt6BxV0sWUsHdF/HMTj15L4HMD9E3FYsGkZ4Ygwvu9wOYWFWKar8+H52dmls1CanI5jwjN3ghRoc=;
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
 Yongqiang Niu <yongqiang.niu@mediatek.com>, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogWW9uZ3FpYW5nIE5pdSA8eW9uZ3FpYW5nLm5pdUBtZWRpYXRlay5jb20+DQoNClByb2Js
ZW06DQpvdmVybGF5IGhhbmd1cCB3aGVuIGV4dGVybmFsIGRpc3BsYXkgaG90cGx1dCB0ZXN0DQoN
CkZpeDoNCmRpc2FibGUgb3ZlcmxheSB3aGVuIGNydGMgZGlzYWJsZQ0KDQpTaWduZWQtb2ZmLWJ5
OiBZb25ncWlhbmcgTml1IDx5b25ncWlhbmcubml1QG1lZGlhdGVrLmNvbT4NCi0tLQ0KIGRyaXZl
cnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHJtX2NydGMuYyB8IDM5ICsrKysrKysrKysrKysrKysr
KysrKy0tLS0tLS0tLS0tLQ0KIDEgZmlsZSBjaGFuZ2VkLCAyNSBpbnNlcnRpb25zKCspLCAxNCBk
ZWxldGlvbnMoLSkNCg0KZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtf
ZHJtX2NydGMuYyBiL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHJtX2NydGMuYw0KaW5k
ZXggNGZiMzQ2Yy4uN2VjYTAyZiAxMDA2NDQNCi0tLSBhL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRl
ay9tdGtfZHJtX2NydGMuYw0KKysrIGIvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcm1f
Y3J0Yy5jDQpAQCAtMzY5LDYgKzM2OSwyMCBAQCBzdGF0aWMgaW50IG10a19jcnRjX2RkcF9od19p
bml0KHN0cnVjdCBtdGtfZHJtX2NydGMgKm10a19jcnRjKQ0KIAltdGtfZGlzcF9tdXRleF9hZGRf
Y29tcChtdGtfY3J0Yy0+bXV0ZXgsIG10a19jcnRjLT5kZHBfY29tcFtpXS0+aWQpOw0KIAltdGtf
ZGlzcF9tdXRleF9lbmFibGUobXRrX2NydGMtPm11dGV4KTsNCiANCisJLyogSW5pdGlhbGx5IGNv
bmZpZ3VyZSBhbGwgcGxhbmVzICovDQorCWZvciAoaSA9IDA7IGkgPCBtdGtfY3J0Yy0+bGF5ZXJf
bnI7IGkrKykgew0KKwkJc3RydWN0IGRybV9wbGFuZSAqcGxhbmUgPSAmbXRrX2NydGMtPnBsYW5l
c1tpXTsNCisJCXN0cnVjdCBtdGtfcGxhbmVfc3RhdGUgKnBsYW5lX3N0YXRlOw0KKwkJc3RydWN0
IG10a19kZHBfY29tcCAqY29tcDsNCisJCXVuc2lnbmVkIGludCBsb2NhbF9sYXllcjsNCisNCisJ
CXBsYW5lX3N0YXRlID0gdG9fbXRrX3BsYW5lX3N0YXRlKHBsYW5lLT5zdGF0ZSk7DQorCQljb21w
ID0gbXRrX2RybV9kZHBfY29tcF9mb3JfcGxhbmUoY3J0YywgcGxhbmUsICZsb2NhbF9sYXllcik7
DQorCQlpZiAoY29tcCkNCisJCQltdGtfZGRwX2NvbXBfbGF5ZXJfY29uZmlnKGNvbXAsIGxvY2Fs
X2xheWVyLA0KKwkJCQkJCSAgcGxhbmVfc3RhdGUsIE5VTEwpOw0KKwl9DQorDQogCWZvciAoaSA9
IDA7IGkgPCBtdGtfY3J0Yy0+ZGRwX2NvbXBfbnI7IGkrKykgew0KIAkJc3RydWN0IG10a19kZHBf
Y29tcCAqY29tcCA9IG10a19jcnRjLT5kZHBfY29tcFtpXTsNCiAJCWVudW0gbXRrX2RkcF9jb21w
X2lkIHByZXY7DQpAQCAtMzg1LDIwICszOTksNiBAQCBzdGF0aWMgaW50IG10a19jcnRjX2RkcF9o
d19pbml0KHN0cnVjdCBtdGtfZHJtX2NydGMgKm10a19jcnRjKQ0KIAkJbXRrX2RkcF9jb21wX3N0
YXJ0KGNvbXApOw0KIAl9DQogDQotCS8qIEluaXRpYWxseSBjb25maWd1cmUgYWxsIHBsYW5lcyAq
Lw0KLQlmb3IgKGkgPSAwOyBpIDwgbXRrX2NydGMtPmxheWVyX25yOyBpKyspIHsNCi0JCXN0cnVj
dCBkcm1fcGxhbmUgKnBsYW5lID0gJm10a19jcnRjLT5wbGFuZXNbaV07DQotCQlzdHJ1Y3QgbXRr
X3BsYW5lX3N0YXRlICpwbGFuZV9zdGF0ZTsNCi0JCXN0cnVjdCBtdGtfZGRwX2NvbXAgKmNvbXA7
DQotCQl1bnNpZ25lZCBpbnQgbG9jYWxfbGF5ZXI7DQotDQotCQlwbGFuZV9zdGF0ZSA9IHRvX210
a19wbGFuZV9zdGF0ZShwbGFuZS0+c3RhdGUpOw0KLQkJY29tcCA9IG10a19kcm1fZGRwX2NvbXBf
Zm9yX3BsYW5lKGNydGMsIHBsYW5lLCAmbG9jYWxfbGF5ZXIpOw0KLQkJaWYgKGNvbXApDQotCQkJ
bXRrX2RkcF9jb21wX2xheWVyX2NvbmZpZyhjb21wLCBsb2NhbF9sYXllciwNCi0JCQkJCQkgIHBs
YW5lX3N0YXRlLCBOVUxMKTsNCi0JfQ0KLQ0KIAlyZXR1cm4gMDsNCiANCiBlcnJfbXV0ZXhfdW5w
cmVwYXJlOg0KQEAgLTYwNywxMCArNjA3LDIxIEBAIHN0YXRpYyB2b2lkIG10a19kcm1fY3J0Y19h
dG9taWNfZGlzYWJsZShzdHJ1Y3QgZHJtX2NydGMgKmNydGMsDQogCWZvciAoaSA9IDA7IGkgPCBt
dGtfY3J0Yy0+bGF5ZXJfbnI7IGkrKykgew0KIAkJc3RydWN0IGRybV9wbGFuZSAqcGxhbmUgPSAm
bXRrX2NydGMtPnBsYW5lc1tpXTsNCiAJCXN0cnVjdCBtdGtfcGxhbmVfc3RhdGUgKnBsYW5lX3N0
YXRlOw0KKwkJc3RydWN0IG10a19kZHBfY29tcCAqY29tcCA9IG10a19jcnRjLT5kZHBfY29tcFsw
XTsNCisJCXVuc2lnbmVkIGludCBjb21wX2xheWVyX25yID0gbXRrX2RkcF9jb21wX2xheWVyX25y
KGNvbXApOw0KKwkJdW5zaWduZWQgaW50IGxvY2FsX2xheWVyOw0KIA0KIAkJcGxhbmVfc3RhdGUg
PSB0b19tdGtfcGxhbmVfc3RhdGUocGxhbmUtPnN0YXRlKTsNCiAJCXBsYW5lX3N0YXRlLT5wZW5k
aW5nLmVuYWJsZSA9IGZhbHNlOw0KIAkJcGxhbmVfc3RhdGUtPnBlbmRpbmcuY29uZmlnID0gdHJ1
ZTsNCisNCisJCWlmIChpID49IGNvbXBfbGF5ZXJfbnIpIHsNCisJCQljb21wID0gbXRrX2NydGMt
PmRkcF9jb21wWzFdOw0KKwkJCWxvY2FsX2xheWVyID0gaSAtIGNvbXBfbGF5ZXJfbnI7DQorCQl9
IGVsc2UNCisJCQlsb2NhbF9sYXllciA9IGk7DQorCQltdGtfZGRwX2NvbXBfbGF5ZXJfY29uZmln
KGNvbXAsIGxvY2FsX2xheWVyLA0KKwkJCQkJICBwbGFuZV9zdGF0ZSwgTlVMTCk7DQogCX0NCiAJ
bXRrX2NydGMtPnBlbmRpbmdfcGxhbmVzID0gdHJ1ZTsNCiANCi0tIA0KMS44LjEuMS5kaXJ0eQ0K
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
