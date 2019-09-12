Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 12BF7B0AD9
	for <lists+dri-devel@lfdr.de>; Thu, 12 Sep 2019 11:04:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F3286EC7A;
	Thu, 12 Sep 2019 09:04:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [1.203.163.81])
 by gabe.freedesktop.org (Postfix) with ESMTP id 227486EC7B
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Sep 2019 09:04:13 +0000 (UTC)
X-UUID: 0abdc5f495c342769c8ae9b057f1da33-20190912
X-UUID: 0abdc5f495c342769c8ae9b057f1da33-20190912
Received: from mtkcas36.mediatek.inc [(172.27.4.253)] by mailgw02.mediatek.com
 (envelope-from <jitao.shi@mediatek.com>)
 (mailgw01.mediatek.com ESMTP with TLS)
 with ESMTP id 2122001776; Thu, 12 Sep 2019 17:04:09 +0800
Received: from MTKCAS32.mediatek.inc (172.27.4.184) by MTKMBS33DR.mediatek.inc
 (172.27.6.106) with Microsoft SMTP Server (TLS) id 15.0.1395.4;
 Thu, 12 Sep 2019 17:04:07 +0800
Received: from mszsdclx1018.gcn.mediatek.inc (172.27.4.253) by
 MTKCAS32.mediatek.inc (172.27.4.170) with Microsoft SMTP Server id
 15.0.1395.4 via Frontend Transport; Thu, 12 Sep 2019 17:04:06 +0800
From: Jitao Shi <jitao.shi@mediatek.com>
To: Sam Ravnborg <sam@ravnborg.org>, David Airlie <airlied@linux.ie>, "Daniel
 Vetter" <daniel@ffwll.ch>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>
Subject: [PATCH 1/3] drm/panel: panel-innolux: Allow 2 reset pins for panel
Date: Thu, 12 Sep 2019 17:04:02 +0800
Message-ID: <20190912090404.89822-2-jitao.shi@mediatek.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190912090404.89822-1-jitao.shi@mediatek.com>
References: <20190912090404.89822-1-jitao.shi@mediatek.com>
MIME-Version: 1.0
X-TM-AS-Product-Ver: SMEX-12.5.0.1684-8.5.1010-24906.005
X-TM-AS-Result: No-3.482500-8.000000-10
X-TMASE-MatchedRID: ddD75cirPhHnC5LyYJwD3+w8wbnnSw8bE1YUt4FjGjGOUV82NDH4AkAc
 6DyoS2rIR3nAM7y+sxETtSzome9IZ7CiYRGPyK4M8pRHzcG+oi3YuVu0X/rOkEjINjnv2/BMaeB
 VQN/hzxi+9mDuGGWszp+Jh3xpp8VmhHuyNMgLmzZuh7qwx+D6T215iJF8eE6rEcWQUCNHW2cqEb
 nPD99jLOLzNWBegCW2xl8lw85EaVQLbigRnpKlKZx+7GyJjhAUHVoP4CnZRLgKlej7lZNBBZnY9
 iocmdMNe2YXCayCdjwmnmSLDgNB1oXzGOuEat/KMrIruREPgvSMLZHCmHrIk/tVq5MU5p/aP3dL
 jnWr1vEPbJpLSCH/cqQVCHnxhZ/op8zfhMu4/LNfCOKFKuVYGg==
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--3.482500-8.000000
X-TMASE-Version: SMEX-12.5.0.1684-8.5.1010-24906.005
X-TM-SNTS-SMTP: E4F648F69210E4E188561AB3D0B1E5421CA2CF56404EA44D23DA6D017FC8E07B2000:8
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
Cc: Jitao
 Shi <jitao.shi@mediatek.com>, srv_heupstream@mediatek.com, stonea168@163.com,
 cawa.cheng@mediatek.com, yingjoe.chen@mediatek.com, eddie.huang@mediatek.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhpcyBpcyB1c2VmdWwgd2hlbiB0aGVyZSBpcyBhIGJyaWRnZSBiZXR3ZWVuIHRoZSBTb0MgYW5k
IHRoZQpwYW5lbC4KClNpZ25lZC1vZmYtYnk6IEppdGFvIFNoaSA8aml0YW8uc2hpQG1lZGlhdGVr
LmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vcGFuZWwvcGFuZWwtaW5ub2x1eC1wMDc5emNhLmMg
fCAzOSArKysrKysrKysrKystLS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgMjQgaW5zZXJ0aW9ucygr
KSwgMTUgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3BhbmVsL3Bh
bmVsLWlubm9sdXgtcDA3OXpjYS5jIGIvZHJpdmVycy9ncHUvZHJtL3BhbmVsL3BhbmVsLWlubm9s
dXgtcDA3OXpjYS5jCmluZGV4IGQ5MmQxYzk4ODc4Yy4uOGRiNDA0ZmI1ZWViIDEwMDY0NAotLS0g
YS9kcml2ZXJzL2dwdS9kcm0vcGFuZWwvcGFuZWwtaW5ub2x1eC1wMDc5emNhLmMKKysrIGIvZHJp
dmVycy9ncHUvZHJtL3BhbmVsL3BhbmVsLWlubm9sdXgtcDA3OXpjYS5jCkBAIC01NCw3ICs1NCw3
IEBAIHN0cnVjdCBpbm5vbHV4X3BhbmVsIHsKIAogCXN0cnVjdCBiYWNrbGlnaHRfZGV2aWNlICpi
YWNrbGlnaHQ7CiAJc3RydWN0IHJlZ3VsYXRvcl9idWxrX2RhdGEgKnN1cHBsaWVzOwotCXN0cnVj
dCBncGlvX2Rlc2MgKmVuYWJsZV9ncGlvOworCXN0cnVjdCBncGlvX2Rlc2MgKmVuYWJsZV9ncGlv
WzJdOwogCiAJYm9vbCBwcmVwYXJlZDsKIAlib29sIGVuYWJsZWQ7CkBAIC04Miw3ICs4Miw3IEBA
IHN0YXRpYyBpbnQgaW5ub2x1eF9wYW5lbF9kaXNhYmxlKHN0cnVjdCBkcm1fcGFuZWwgKnBhbmVs
KQogc3RhdGljIGludCBpbm5vbHV4X3BhbmVsX3VucHJlcGFyZShzdHJ1Y3QgZHJtX3BhbmVsICpw
YW5lbCkKIHsKIAlzdHJ1Y3QgaW5ub2x1eF9wYW5lbCAqaW5ub2x1eCA9IHRvX2lubm9sdXhfcGFu
ZWwocGFuZWwpOwotCWludCBlcnI7CisJaW50IGVyciwgaTsKIAogCWlmICghaW5ub2x1eC0+cHJl
cGFyZWQpCiAJCXJldHVybiAwOwpAQCAtMTAyLDcgKzEwMiw4IEBAIHN0YXRpYyBpbnQgaW5ub2x1
eF9wYW5lbF91bnByZXBhcmUoc3RydWN0IGRybV9wYW5lbCAqcGFuZWwpCiAJaWYgKGlubm9sdXgt
PmRlc2MtPnNsZWVwX21vZGVfZGVsYXkpCiAJCW1zbGVlcChpbm5vbHV4LT5kZXNjLT5zbGVlcF9t
b2RlX2RlbGF5KTsKIAotCWdwaW9kX3NldF92YWx1ZV9jYW5zbGVlcChpbm5vbHV4LT5lbmFibGVf
Z3BpbywgMCk7CisJZm9yIChpID0gMDsgaSA8IEFSUkFZX1NJWkUoaW5ub2x1eC0+ZW5hYmxlX2dw
aW8pOyBpKyspCisJCWdwaW9kX3NldF92YWx1ZV9jYW5zbGVlcChpbm5vbHV4LT5lbmFibGVfZ3Bp
b1tpXSwgMCk7CiAKIAlpZiAoaW5ub2x1eC0+ZGVzYy0+cG93ZXJfZG93bl9kZWxheSkKIAkJbXNs
ZWVwKGlubm9sdXgtPmRlc2MtPnBvd2VyX2Rvd25fZGVsYXkpOwpAQCAtMTIwLDIyICsxMjEsMjcg
QEAgc3RhdGljIGludCBpbm5vbHV4X3BhbmVsX3VucHJlcGFyZShzdHJ1Y3QgZHJtX3BhbmVsICpw
YW5lbCkKIHN0YXRpYyBpbnQgaW5ub2x1eF9wYW5lbF9wcmVwYXJlKHN0cnVjdCBkcm1fcGFuZWwg
KnBhbmVsKQogewogCXN0cnVjdCBpbm5vbHV4X3BhbmVsICppbm5vbHV4ID0gdG9faW5ub2x1eF9w
YW5lbChwYW5lbCk7Ci0JaW50IGVycjsKKwlpbnQgZXJyLCBpOwogCiAJaWYgKGlubm9sdXgtPnBy
ZXBhcmVkKQogCQlyZXR1cm4gMDsKIAotCWdwaW9kX3NldF92YWx1ZV9jYW5zbGVlcChpbm5vbHV4
LT5lbmFibGVfZ3BpbywgMCk7CisJZm9yIChpID0gMDsgaSA8IEFSUkFZX1NJWkUoaW5ub2x1eC0+
ZW5hYmxlX2dwaW8pOyBpKyspCisJCWdwaW9kX3NldF92YWx1ZV9jYW5zbGVlcChpbm5vbHV4LT5l
bmFibGVfZ3Bpb1tpXSwgMCk7CiAKIAllcnIgPSByZWd1bGF0b3JfYnVsa19lbmFibGUoaW5ub2x1
eC0+ZGVzYy0+bnVtX3N1cHBsaWVzLAogCQkJCSAgICBpbm5vbHV4LT5zdXBwbGllcyk7CiAJaWYg
KGVyciA8IDApCiAJCXJldHVybiBlcnI7CiAKLQkvKiBwMDc5emNhOiB0MiAoMjBtcyksIHAwOTdw
Zmc6IHQ0ICgxNW1zKSAqLwotCXVzbGVlcF9yYW5nZSgyMDAwMCwgMjEwMDApOworCWZvciAoaSA9
IDA7IGkgPCBBUlJBWV9TSVpFKGlubm9sdXgtPmVuYWJsZV9ncGlvKTsgaSsrKSB7CisJCWlmICgh
aW5ub2x1eC0+ZW5hYmxlX2dwaW9baV0pCisJCQlicmVhazsKIAotCWdwaW9kX3NldF92YWx1ZV9j
YW5zbGVlcChpbm5vbHV4LT5lbmFibGVfZ3BpbywgMSk7CisJCS8qIHAwNzl6Y2E6IHQyICgyMG1z
KSwgcDA5N3BmZzogdDQgKDE1bXMpICovCisJCXVzbGVlcF9yYW5nZSgyMDAwMCwgMjEwMDApOwor
CQlncGlvZF9zZXRfdmFsdWVfY2Fuc2xlZXAoaW5ub2x1eC0+ZW5hYmxlX2dwaW9baV0sIDEpOwor
CX0KIAogCS8qIHAwNzl6Y2E6IHQ0LCBwMDk3cGZnOiB0NSAqLwogCXVzbGVlcF9yYW5nZSgyMDAw
MCwgMjEwMDApOwpAQCAtMTk1LDcgKzIwMSw4IEBAIHN0YXRpYyBpbnQgaW5ub2x1eF9wYW5lbF9w
cmVwYXJlKHN0cnVjdCBkcm1fcGFuZWwgKnBhbmVsKQogCXJldHVybiAwOwogCiBwb3dlcm9mZjoK
LQlncGlvZF9zZXRfdmFsdWVfY2Fuc2xlZXAoaW5ub2x1eC0+ZW5hYmxlX2dwaW8sIDApOworCWZv
ciAoaSA9IDA7IGkgPCBBUlJBWV9TSVpFKGlubm9sdXgtPmVuYWJsZV9ncGlvKTsgaSsrKQorCQln
cGlvZF9zZXRfdmFsdWVfY2Fuc2xlZXAoaW5ub2x1eC0+ZW5hYmxlX2dwaW9baV0sIDApOwogCXJl
Z3VsYXRvcl9idWxrX2Rpc2FibGUoaW5ub2x1eC0+ZGVzYy0+bnVtX3N1cHBsaWVzLCBpbm5vbHV4
LT5zdXBwbGllcyk7CiAKIAlyZXR1cm4gZXJyOwpAQCAtNDc1LDEyICs0ODIsMTQgQEAgc3RhdGlj
IGludCBpbm5vbHV4X3BhbmVsX2FkZChzdHJ1Y3QgbWlwaV9kc2lfZGV2aWNlICpkc2ksCiAJaWYg
KGVyciA8IDApCiAJCXJldHVybiBlcnI7CiAKLQlpbm5vbHV4LT5lbmFibGVfZ3BpbyA9IGRldm1f
Z3Bpb2RfZ2V0X29wdGlvbmFsKGRldiwgImVuYWJsZSIsCi0JCQkJCQkgICAgICAgR1BJT0RfT1VU
X0hJR0gpOwotCWlmIChJU19FUlIoaW5ub2x1eC0+ZW5hYmxlX2dwaW8pKSB7Ci0JCWVyciA9IFBU
Ul9FUlIoaW5ub2x1eC0+ZW5hYmxlX2dwaW8pOwotCQlkZXZfZGJnKGRldiwgImZhaWxlZCB0byBn
ZXQgZW5hYmxlIGdwaW86ICVkXG4iLCBlcnIpOwotCQlpbm5vbHV4LT5lbmFibGVfZ3BpbyA9IE5V
TEw7CisJZm9yIChpID0gMDsgaSA8IEFSUkFZX1NJWkUoaW5ub2x1eC0+ZW5hYmxlX2dwaW8pOyBp
KyspIHsKKwkJaW5ub2x1eC0+ZW5hYmxlX2dwaW9baV0gPSBkZXZtX2dwaW9kX2dldF9pbmRleF9v
cHRpb25hbChkZXYsCisJCQkJCQkiZW5hYmxlIiwgaSwgR1BJT0RfT1VUX0hJR0gpOworCQlpZiAo
SVNfRVJSKGlubm9sdXgtPmVuYWJsZV9ncGlvW2ldKSkgeworCQkJZXJyID0gUFRSX0VSUihpbm5v
bHV4LT5lbmFibGVfZ3Bpb1tpXSk7CisJCQlkZXZfZXJyKGRldiwgImZhaWxlZCB0byBnZXQgZW5h
YmxlIGdwaW86ICVkXG4iLCBlcnIpOworCQkJaW5ub2x1eC0+ZW5hYmxlX2dwaW9baV0gPSBOVUxM
OworCQl9CiAJfQogCiAJaW5ub2x1eC0+YmFja2xpZ2h0ID0gZGV2bV9vZl9maW5kX2JhY2tsaWdo
dChkZXYpOwotLSAKMi4yMS4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9k
cmktZGV2ZWw=
