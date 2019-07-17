Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 82EBF6BDFA
	for <lists+dri-devel@lfdr.de>; Wed, 17 Jul 2019 16:15:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C10A16E193;
	Wed, 17 Jul 2019 14:15:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 50D3989174
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Jul 2019 14:15:26 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id x6HEFKFR067049;
 Wed, 17 Jul 2019 09:15:20 -0500
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
 by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x6HEFK5u116861
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Wed, 17 Jul 2019 09:15:20 -0500
Received: from DFLE111.ent.ti.com (10.64.6.32) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Wed, 17
 Jul 2019 09:15:20 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Wed, 17 Jul 2019 09:15:20 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id x6HEFJs2041032;
 Wed, 17 Jul 2019 09:15:19 -0500
From: Jean-Jacques Hiblot <jjhiblot@ti.com>
To: <jacek.anaszewski@gmail.com>, <pavel@ucw.cz>, <robh+dt@kernel.org>,
 <mark.rutland@arm.com>, <lee.jones@linaro.org>,
 <daniel.thompson@linaro.org>, <jingoohan1@gmail.com>
Subject: [PATCH v4 1/4] leds: Add of_led_get() and led_put()
Date: Wed, 17 Jul 2019 16:15:11 +0200
Message-ID: <20190717141514.21171-2-jjhiblot@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190717141514.21171-1-jjhiblot@ti.com>
References: <20190717141514.21171-1-jjhiblot@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ti.com; s=ti-com-17Q1; t=1563372920;
 bh=l2dct/vWgiYofb3iVx+3ZXVfVtqkj9gwW5dzRD/YKdc=;
 h=From:To:CC:Subject:Date:In-Reply-To:References;
 b=a+L4uNrASKS/c8EXytXkkxLm/uA3HDC6uXJopAzVuEo1ZWhTpv60E1qZocuPINjqa
 +W3wipRHJyOpAuykgUpAOvJvFTEOrkRqJan1AiokSBineMG3QgWeD7jlkc71JondvV
 gQLYPAwwfguwF1i5hCtnmeQcRa6kywc/GtlfCmyk=
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 tomi.valkeinen@ti.com, dmurphy@ti.com, Jean-Jacques Hiblot <jjhiblot@ti.com>,
 linux-leds@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogVG9taSBWYWxrZWluZW4gPHRvbWkudmFsa2VpbmVuQHRpLmNvbT4KClRoaXMgcGF0Y2gg
YWRkcyBiYXNpYyBzdXBwb3J0IGZvciBhIGtlcm5lbCBkcml2ZXIgdG8gZ2V0IGEgTEVEIGRldmlj
ZS4KVGhpcyB3aWxsIGJlIHVzZWQgYnkgdGhlIGxlZC1iYWNrbGlnaHQgZHJpdmVyLgoKT25seSBP
RiB2ZXJzaW9uIGlzIGltcGxlbWVudGVkIGZvciBub3csIGFuZCB0aGUgYmVoYXZpb3IgaXMgc2lt
aWxhciB0bwpQV00ncyBvZl9wd21fZ2V0KCkgYW5kIHB3bV9wdXQoKS4KClNpZ25lZC1vZmYtYnk6
IFRvbWkgVmFsa2VpbmVuIDx0b21pLnZhbGtlaW5lbkB0aS5jb20+ClNpZ25lZC1vZmYtYnk6IEpl
YW4tSmFjcXVlcyBIaWJsb3QgPGpqaGlibG90QHRpLmNvbT4KLS0tCiBkcml2ZXJzL2xlZHMvbGVk
LWNsYXNzLmMgfCA1MCArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrCiBp
bmNsdWRlL2xpbnV4L2xlZHMuaCAgICAgfCAgNCArKysrCiAyIGZpbGVzIGNoYW5nZWQsIDU0IGlu
c2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2xlZHMvbGVkLWNsYXNzLmMgYi9kcml2
ZXJzL2xlZHMvbGVkLWNsYXNzLmMKaW5kZXggY2FkZDQzYzMwZDUwLi45ZjQ4Nzk4YTcxM2QgMTAw
NjQ0Ci0tLSBhL2RyaXZlcnMvbGVkcy9sZWQtY2xhc3MuYworKysgYi9kcml2ZXJzL2xlZHMvbGVk
LWNsYXNzLmMKQEAgLTE4LDYgKzE4LDcgQEAKICNpbmNsdWRlIDxsaW51eC9zcGlubG9jay5oPgog
I2luY2x1ZGUgPGxpbnV4L3RpbWVyLmg+CiAjaW5jbHVkZSA8dWFwaS9saW51eC91bGVkcy5oPgor
I2luY2x1ZGUgPGxpbnV4L29mLmg+CiAjaW5jbHVkZSAibGVkcy5oIgogCiBzdGF0aWMgc3RydWN0
IGNsYXNzICpsZWRzX2NsYXNzOwpAQCAtMjEzLDYgKzIxNCw1NSBAQCBzdGF0aWMgaW50IGxlZF9y
ZXN1bWUoc3RydWN0IGRldmljZSAqZGV2KQogCiBzdGF0aWMgU0lNUExFX0RFVl9QTV9PUFMobGVk
c19jbGFzc19kZXZfcG1fb3BzLCBsZWRfc3VzcGVuZCwgbGVkX3Jlc3VtZSk7CiAKK3N0YXRpYyBp
bnQgbGVkX21hdGNoX2xlZF9ub2RlKHN0cnVjdCBkZXZpY2UgKmxlZF9kZXYsIGNvbnN0IHZvaWQg
KmRhdGEpCit7CisJcmV0dXJuIGxlZF9kZXYtPm9mX25vZGUgPT0gZGF0YTsKK30KKworLyoqCisg
KiBvZl9sZWRfZ2V0KCkgLSByZXF1ZXN0IGEgTEVEIGRldmljZSB2aWEgdGhlIExFRCBmcmFtZXdv
cmsKKyAqIEBucDogZGV2aWNlIG5vZGUgdG8gZ2V0IHRoZSBMRUQgZGV2aWNlIGZyb20KKyAqIEBp
bmRleDogdGhlIGluZGV4IG9mIHRoZSBMRUQKKyAqCisgKiBSZXR1cm5zIHRoZSBMRUQgZGV2aWNl
IHBhcnNlZCBmcm9tIHRoZSBwaGFuZGxlIHNwZWNpZmllZCBpbiB0aGUgImxlZHMiCisgKiBwcm9w
ZXJ0eSBvZiBhIGRldmljZSB0cmVlIG5vZGUgb3IgYSBuZWdhdGl2ZSBlcnJvci1jb2RlIG9uIGZh
aWx1cmUuCisgKi8KK3N0cnVjdCBsZWRfY2xhc3NkZXYgKm9mX2xlZF9nZXQoc3RydWN0IGRldmlj
ZV9ub2RlICpucCwgaW50IGluZGV4KQoreworCXN0cnVjdCBkZXZpY2UgKmxlZF9kZXY7CisJc3Ry
dWN0IGxlZF9jbGFzc2RldiAqbGVkX2NkZXY7CisJc3RydWN0IGRldmljZV9ub2RlICpsZWRfbm9k
ZTsKKworCWxlZF9ub2RlID0gb2ZfcGFyc2VfcGhhbmRsZShucCwgImxlZHMiLCBpbmRleCk7CisJ
aWYgKCFsZWRfbm9kZSkKKwkJcmV0dXJuIEVSUl9QVFIoLUVOT0VOVCk7CisKKwlsZWRfZGV2ID0g
Y2xhc3NfZmluZF9kZXZpY2UobGVkc19jbGFzcywgTlVMTCwgbGVkX25vZGUsCisJCWxlZF9tYXRj
aF9sZWRfbm9kZSk7CisJb2Zfbm9kZV9wdXQobGVkX25vZGUpOworCisJaWYgKCFsZWRfZGV2KQor
CQlyZXR1cm4gRVJSX1BUUigtRVBST0JFX0RFRkVSKTsKKworCWxlZF9jZGV2ID0gZGV2X2dldF9k
cnZkYXRhKGxlZF9kZXYpOworCisJaWYgKCF0cnlfbW9kdWxlX2dldChsZWRfY2Rldi0+ZGV2LT5w
YXJlbnQtPmRyaXZlci0+b3duZXIpKQorCQlyZXR1cm4gRVJSX1BUUigtRU5PREVWKTsKKworCXJl
dHVybiBsZWRfY2RldjsKK30KK0VYUE9SVF9TWU1CT0xfR1BMKG9mX2xlZF9nZXQpOworCisvKioK
KyAqIGxlZF9wdXQoKSAtIHJlbGVhc2UgYSBMRUQgZGV2aWNlCisgKiBAbGVkX2NkZXY6IExFRCBk
ZXZpY2UKKyAqLwordm9pZCBsZWRfcHV0KHN0cnVjdCBsZWRfY2xhc3NkZXYgKmxlZF9jZGV2KQor
eworCW1vZHVsZV9wdXQobGVkX2NkZXYtPmRldi0+cGFyZW50LT5kcml2ZXItPm93bmVyKTsKK30K
K0VYUE9SVF9TWU1CT0xfR1BMKGxlZF9wdXQpOworCiBzdGF0aWMgaW50IG1hdGNoX25hbWUoc3Ry
dWN0IGRldmljZSAqZGV2LCBjb25zdCB2b2lkICpkYXRhKQogewogCWlmICghZGV2X25hbWUoZGV2
KSkKZGlmZiAtLWdpdCBhL2luY2x1ZGUvbGludXgvbGVkcy5oIGIvaW5jbHVkZS9saW51eC9sZWRz
LmgKaW5kZXggYmVlOGUzZjhkZGRkLi4wYTcxYzdjZGQxOTEgMTAwNjQ0Ci0tLSBhL2luY2x1ZGUv
bGludXgvbGVkcy5oCisrKyBiL2luY2x1ZGUvbGludXgvbGVkcy5oCkBAIC0xOSw2ICsxOSw3IEBA
CiAKIHN0cnVjdCBkZXZpY2U7CiBzdHJ1Y3QgbGVkX3BhdHRlcm47CitzdHJ1Y3QgZGV2aWNlX25v
ZGU7CiAvKgogICogTEVEIENvcmUKICAqLwpAQCAtMTQ1LDYgKzE0Niw5IEBAIGV4dGVybiB2b2lk
IGRldm1fbGVkX2NsYXNzZGV2X3VucmVnaXN0ZXIoc3RydWN0IGRldmljZSAqcGFyZW50LAogZXh0
ZXJuIHZvaWQgbGVkX2NsYXNzZGV2X3N1c3BlbmQoc3RydWN0IGxlZF9jbGFzc2RldiAqbGVkX2Nk
ZXYpOwogZXh0ZXJuIHZvaWQgbGVkX2NsYXNzZGV2X3Jlc3VtZShzdHJ1Y3QgbGVkX2NsYXNzZGV2
ICpsZWRfY2Rldik7CiAKK2V4dGVybiBzdHJ1Y3QgbGVkX2NsYXNzZGV2ICpvZl9sZWRfZ2V0KHN0
cnVjdCBkZXZpY2Vfbm9kZSAqbnAsIGludCBpbmRleCk7CitleHRlcm4gdm9pZCBsZWRfcHV0KHN0
cnVjdCBsZWRfY2xhc3NkZXYgKmxlZF9jZGV2KTsKKwogLyoqCiAgKiBsZWRfYmxpbmtfc2V0IC0g
c2V0IGJsaW5raW5nIHdpdGggc29mdHdhcmUgZmFsbGJhY2sKICAqIEBsZWRfY2RldjogdGhlIExF
RCB0byBzdGFydCBibGlua2luZwotLSAKMi4xNy4xCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBs
aXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1h
bi9saXN0aW5mby9kcmktZGV2ZWw=
