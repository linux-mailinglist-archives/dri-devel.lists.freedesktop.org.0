Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A192498DA
	for <lists+dri-devel@lfdr.de>; Tue, 18 Jun 2019 08:25:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 303FE6E0E3;
	Tue, 18 Jun 2019 06:25:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from pio-pvt-msa2.bahnhof.se (pio-pvt-msa2.bahnhof.se [79.136.2.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE2B56E0DF
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jun 2019 06:25:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by pio-pvt-msa2.bahnhof.se (Postfix) with ESMTP id 3DEEA3F7C7;
 Tue, 18 Jun 2019 08:25:10 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bahnhof.se
X-Spam-Flag: NO
X-Spam-Score: -3.099
X-Spam-Level: 
X-Spam-Status: No, score=-3.099 tagged_above=-999 required=6.31
 tests=[ALL_TRUSTED=-1, BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 URIBL_BLOCKED=0.001] autolearn=ham autolearn_force=no
Received: from pio-pvt-msa2.bahnhof.se ([127.0.0.1])
 by localhost (pio-pvt-msa2.bahnhof.se [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8E_T_wjB2TVa; Tue, 18 Jun 2019 08:24:57 +0200 (CEST)
Received: from mail1.shipmail.org (h-205-35.A357.priv.bahnhof.se
 [155.4.205.35]) (Authenticated sender: mb878879)
 by pio-pvt-msa2.bahnhof.se (Postfix) with ESMTPA id 7CF633F5C8;
 Tue, 18 Jun 2019 08:24:57 +0200 (CEST)
Received: from localhost.localdomain.localdomain
 (h-205-35.A357.priv.bahnhof.se [155.4.205.35])
 by mail1.shipmail.org (Postfix) with ESMTPSA id 1278B3601C4;
 Tue, 18 Jun 2019 08:24:57 +0200 (CEST)
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m=20=28VMware=29?= <thomas@shipmail.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 2/4] drm/vmwgfx: Add debug message for layout change ioctl
Date: Tue, 18 Jun 2019 08:24:40 +0200
Message-Id: <20190618062442.14647-2-thomas@shipmail.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190618062442.14647-1-thomas@shipmail.org>
References: <20190618062442.14647-1-thomas@shipmail.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=shipmail.org; s=mail; 
 t=1560839097; bh=BL/h+1uZoqs3EL/F8qvIylOmqMT4oDHE9MRQUyDQAMM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=mCx3ghO97HoU55Hn56q40E3N/i9taLb1KkvnNH38qPa/HqIHhoOwhwPHk2fO4wYI4
 ikYhkFqBHLpGHYw4e7Xgib1hdTuwndxJxO/UpZvjlnrPK5/LOaavaezul5mbJcsvSN
 smT0llDB5V23jmpw+kQODvEplwXsXXL/WWIDrRwM=
X-Mailman-Original-Authentication-Results: pio-pvt-msa2.bahnhof.se;
 dkim=pass (1024-bit key;
 unprotected) header.d=shipmail.org header.i=@shipmail.org header.b=mCx3ghO9; 
 dkim-atps=neutral
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
Cc: pv-drivers@vmware.com, Thomas Hellstrom <thellstrom@vmware.com>,
 Deepak Rawat <drawat@vmware.com>, linux-graphics-maintainer@vmware.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogRGVlcGFrIFJhd2F0IDxkcmF3YXRAdm13YXJlLmNvbT4KCkFkZCBkZWJ1ZyBjb2RlIHRv
IGNoZWNrIHVzZXItc3BhY2UgbGF5b3V0IGNoYW5nZSByZXF1ZXN0LgoKU2lnbmVkLW9mZi1ieTog
RGVlcGFrIFJhd2F0IDxkcmF3YXRAdm13YXJlLmNvbT4KUmV2aWV3ZWQtYnk6IFRob21hcyBIZWxs
c3Ryb20gPHRoZWxsc3Ryb21Adm13YXJlLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vdm13Z2Z4
L3Ztd2dmeF9kcnYuaCB8IDggKysrKysrKysKIGRyaXZlcnMvZ3B1L2RybS92bXdnZngvdm13Z2Z4
X2ttcy5jIHwgOCArKysrKysrKwogMiBmaWxlcyBjaGFuZ2VkLCAxNiBpbnNlcnRpb25zKCspCgpk
aWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3Ztd2dmeC92bXdnZnhfZHJ2LmggYi9kcml2ZXJz
L2dwdS9kcm0vdm13Z2Z4L3Ztd2dmeF9kcnYuaAppbmRleCA1OTcxYzBkNDc1MDcuLmI0Yzg4MTdk
YzI2NyAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL3Ztd2dmeC92bXdnZnhfZHJ2LmgKKysr
IGIvZHJpdmVycy9ncHUvZHJtL3Ztd2dmeC92bXdnZnhfZHJ2LmgKQEAgLTE0MjQsNiArMTQyNCwx
NCBAQCBpbnQgdm13X2hvc3RfbG9nKGNvbnN0IGNoYXIgKmxvZyk7CiAjZGVmaW5lIFZNV19ERUJV
R19VU0VSKGZtdCwgLi4uKSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICBcCiAJRFJNX0RFQlVHX0RSSVZFUihmbXQsICMjX19WQV9BUkdTX18pCiAKKy8qKgorICog
Vk1XX0RFQlVHX0tNUyAtIERlYnVnIG91dHB1dCBmb3Iga2VybmVsIG1vZGUtc2V0dGluZworICoK
KyAqIFRoaXMgbWFjcm8gaXMgZm9yIGRlYnVnZ2luZyB2bXdnZnggbW9kZS1zZXR0aW5nIGNvZGUu
CisgKi8KKyNkZWZpbmUgVk1XX0RFQlVHX0tNUyhmbXQsIC4uLikgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIFwKKwlEUk1fREVCVUdfRFJJVkVSKGZtdCwgIyNf
X1ZBX0FSR1NfXykKKwogLyogUmVzb3VyY2UgZGlydHlpbmcgLSB2bXdnZnhfcGFnZV9kaXJ0eS5j
ICovCiB2b2lkIHZtd19ib19kaXJ0eV9zY2FuKHN0cnVjdCB2bXdfYnVmZmVyX29iamVjdCAqdmJv
KTsKIGludCB2bXdfYm9fZGlydHlfYWRkKHN0cnVjdCB2bXdfYnVmZmVyX29iamVjdCAqdmJvKTsK
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS92bXdnZngvdm13Z2Z4X2ttcy5jIGIvZHJpdmVy
cy9ncHUvZHJtL3Ztd2dmeC92bXdnZnhfa21zLmMKaW5kZXggYjk3YmM4ZTU5NDRiLi43ZjkyNjRh
NzJlMWQgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS92bXdnZngvdm13Z2Z4X2ttcy5jCisr
KyBiL2RyaXZlcnMvZ3B1L2RybS92bXdnZngvdm13Z2Z4X2ttcy5jCkBAIC0yMzQ3LDYgKzIzNDcs
OSBAQCBpbnQgdm13X2ttc191cGRhdGVfbGF5b3V0X2lvY3RsKHN0cnVjdCBkcm1fZGV2aWNlICpk
ZXYsIHZvaWQgKmRhdGEsCiAKIAlpZiAoIWFyZy0+bnVtX291dHB1dHMpIHsKIAkJc3RydWN0IGRy
bV9yZWN0IGRlZl9yZWN0ID0gezAsIDAsIDgwMCwgNjAwfTsKKwkJVk1XX0RFQlVHX0tNUygiRGVm
YXVsdCBsYXlvdXQgeDEgPSAlZCB5MSA9ICVkIHgyID0gJWQgeTIgPSAlZFxuIiwKKwkJCSAgICAg
IGRlZl9yZWN0LngxLCBkZWZfcmVjdC55MSwKKwkJCSAgICAgIGRlZl9yZWN0LngyLCBkZWZfcmVj
dC55Mik7CiAJCXZtd19kdV91cGRhdGVfbGF5b3V0KGRldl9wcml2LCAxLCAmZGVmX3JlY3QpOwog
CQlyZXR1cm4gMDsKIAl9CkBAIC0yMzY3LDYgKzIzNzAsNyBAQCBpbnQgdm13X2ttc191cGRhdGVf
bGF5b3V0X2lvY3RsKHN0cnVjdCBkcm1fZGV2aWNlICpkZXYsIHZvaWQgKmRhdGEsCiAKIAlkcm1f
cmVjdHMgPSAoc3RydWN0IGRybV9yZWN0ICopcmVjdHM7CiAKKwlWTVdfREVCVUdfS01TKCJMYXlv
dXQgY291bnQgPSAldVxuIiwgYXJnLT5udW1fb3V0cHV0cyk7CiAJZm9yIChpID0gMDsgaSA8IGFy
Zy0+bnVtX291dHB1dHM7IGkrKykgewogCQlzdHJ1Y3QgZHJtX3Ztd19yZWN0IGN1cnJfcmVjdDsK
IApAQCAtMjM4Myw2ICsyMzg3LDEwIEBAIGludCB2bXdfa21zX3VwZGF0ZV9sYXlvdXRfaW9jdGwo
c3RydWN0IGRybV9kZXZpY2UgKmRldiwgdm9pZCAqZGF0YSwKIAkJZHJtX3JlY3RzW2ldLngyID0g
Y3Vycl9yZWN0LnggKyBjdXJyX3JlY3QudzsKIAkJZHJtX3JlY3RzW2ldLnkyID0gY3Vycl9yZWN0
LnkgKyBjdXJyX3JlY3QuaDsKIAorCQlWTVdfREVCVUdfS01TKCIgIHgxID0gJWQgeTEgPSAlZCB4
MiA9ICVkIHkyID0gJWRcbiIsCisJCQkgICAgICBkcm1fcmVjdHNbaV0ueDEsIGRybV9yZWN0c1tp
XS55MSwKKwkJCSAgICAgIGRybV9yZWN0c1tpXS54MiwgZHJtX3JlY3RzW2ldLnkyKTsKKwogCQkv
KgogCQkgKiBDdXJyZW50bHkgdGhpcyBjaGVjayBpcyBsaW1pdGluZyB0aGUgdG9wb2xvZ3kgd2l0
aGluCiAJCSAqIG1vZGVfY29uZmlnLT5tYXggKHdoaWNoIGFjdHVhbGx5IGlzIG1heCB0ZXh0dXJl
IHNpemUKLS0gCjIuMjAuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJp
LWRldmVs
