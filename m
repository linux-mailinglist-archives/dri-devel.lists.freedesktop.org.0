Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 049F7C99D4
	for <lists+dri-devel@lfdr.de>; Thu,  3 Oct 2019 10:28:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C2DB6E962;
	Thu,  3 Oct 2019 08:28:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F1C536E889
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Oct 2019 08:28:28 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
 by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x938SLgb086242;
 Thu, 3 Oct 2019 03:28:21 -0500
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
 by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x938SLKH126572
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Thu, 3 Oct 2019 03:28:21 -0500
Received: from DFLE101.ent.ti.com (10.64.6.22) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Thu, 3 Oct
 2019 03:28:21 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE101.ent.ti.com
 (10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Thu, 3 Oct 2019 03:28:21 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id x938SKoB082944;
 Thu, 3 Oct 2019 03:28:21 -0500
From: Jean-Jacques Hiblot <jjhiblot@ti.com>
To: <jacek.anaszewski@gmail.com>, <pavel@ucw.cz>, <robh+dt@kernel.org>,
 <mark.rutland@arm.com>, <lee.jones@linaro.org>,
 <daniel.thompson@linaro.org>
Subject: [PATCH v8 2/5] leds: Add of_led_get() and led_put()
Date: Thu, 3 Oct 2019 10:28:09 +0200
Message-ID: <20191003082812.28491-3-jjhiblot@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191003082812.28491-1-jjhiblot@ti.com>
References: <20191003082812.28491-1-jjhiblot@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ti.com; s=ti-com-17Q1; t=1570091302;
 bh=yyKxKbudwxLXBSDguFTMwG1Eg09KWJYS2pNsYIzkHKo=;
 h=From:To:CC:Subject:Date:In-Reply-To:References;
 b=gudradjfj+O7Qb2WhJoH6cCDEZWElgyiQ1eB3T//DV6rsA8EMqwrVYSqus+RdYTlw
 4pAFjy69Dc7aBvt9yVpr3+u4W1tOjYv7pPrsbaqmlPK/zL9+kjGVAR5Hs8fBuf0plG
 F5LPLASVjiz5Xa6mGUDNoC2VTCiKuZGaPEzZ5HGw=
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
YW4tSmFjcXVlcyBIaWJsb3QgPGpqaGlibG90QHRpLmNvbT4KQWNrZWQtYnk6IFBhdmVsIE1hY2hl
ayA8cGF2ZWxAdWN3LmN6PgotLS0KIGRyaXZlcnMvbGVkcy9sZWQtY2xhc3MuYyB8IDQ0ICsrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysKIGluY2x1ZGUvbGludXgvbGVkcy5o
ICAgICB8ICA0ICsrKysKIDIgZmlsZXMgY2hhbmdlZCwgNDggaW5zZXJ0aW9ucygrKQoKZGlmZiAt
LWdpdCBhL2RyaXZlcnMvbGVkcy9sZWQtY2xhc3MuYyBiL2RyaXZlcnMvbGVkcy9sZWQtY2xhc3Mu
YwppbmRleCBjMjE2N2I2NmI2MWYuLjQ1NTU0NWY1ZDY2MyAxMDA2NDQKLS0tIGEvZHJpdmVycy9s
ZWRzL2xlZC1jbGFzcy5jCisrKyBiL2RyaXZlcnMvbGVkcy9sZWQtY2xhc3MuYwpAQCAtMTksNiAr
MTksNyBAQAogI2luY2x1ZGUgPGxpbnV4L3NwaW5sb2NrLmg+CiAjaW5jbHVkZSA8bGludXgvdGlt
ZXIuaD4KICNpbmNsdWRlIDx1YXBpL2xpbnV4L3VsZWRzLmg+CisjaW5jbHVkZSA8bGludXgvb2Yu
aD4KICNpbmNsdWRlICJsZWRzLmgiCiAKIHN0YXRpYyBzdHJ1Y3QgY2xhc3MgKmxlZHNfY2xhc3M7
CkBAIC0yMTQsNiArMjE1LDQ5IEBAIHN0YXRpYyBpbnQgbGVkX3Jlc3VtZShzdHJ1Y3QgZGV2aWNl
ICpkZXYpCiAKIHN0YXRpYyBTSU1QTEVfREVWX1BNX09QUyhsZWRzX2NsYXNzX2Rldl9wbV9vcHMs
IGxlZF9zdXNwZW5kLCBsZWRfcmVzdW1lKTsKIAorLyoqCisgKiBvZl9sZWRfZ2V0KCkgLSByZXF1
ZXN0IGEgTEVEIGRldmljZSB2aWEgdGhlIExFRCBmcmFtZXdvcmsKKyAqIEBucDogZGV2aWNlIG5v
ZGUgdG8gZ2V0IHRoZSBMRUQgZGV2aWNlIGZyb20KKyAqIEBpbmRleDogdGhlIGluZGV4IG9mIHRo
ZSBMRUQKKyAqCisgKiBSZXR1cm5zIHRoZSBMRUQgZGV2aWNlIHBhcnNlZCBmcm9tIHRoZSBwaGFu
ZGxlIHNwZWNpZmllZCBpbiB0aGUgImxlZHMiCisgKiBwcm9wZXJ0eSBvZiBhIGRldmljZSB0cmVl
IG5vZGUgb3IgYSBuZWdhdGl2ZSBlcnJvci1jb2RlIG9uIGZhaWx1cmUuCisgKi8KK3N0cnVjdCBs
ZWRfY2xhc3NkZXYgKm9mX2xlZF9nZXQoc3RydWN0IGRldmljZV9ub2RlICpucCwgaW50IGluZGV4
KQoreworCXN0cnVjdCBkZXZpY2UgKmxlZF9kZXY7CisJc3RydWN0IGxlZF9jbGFzc2RldiAqbGVk
X2NkZXY7CisJc3RydWN0IGRldmljZV9ub2RlICpsZWRfbm9kZTsKKworCWxlZF9ub2RlID0gb2Zf
cGFyc2VfcGhhbmRsZShucCwgImxlZHMiLCBpbmRleCk7CisJaWYgKCFsZWRfbm9kZSkKKwkJcmV0
dXJuIEVSUl9QVFIoLUVOT0VOVCk7CisKKwlsZWRfZGV2ID0gY2xhc3NfZmluZF9kZXZpY2VfYnlf
b2Zfbm9kZShsZWRzX2NsYXNzLCBsZWRfbm9kZSk7CisJb2Zfbm9kZV9wdXQobGVkX25vZGUpOwor
CisJaWYgKCFsZWRfZGV2KQorCQlyZXR1cm4gRVJSX1BUUigtRVBST0JFX0RFRkVSKTsKKworCWxl
ZF9jZGV2ID0gZGV2X2dldF9kcnZkYXRhKGxlZF9kZXYpOworCisJaWYgKCF0cnlfbW9kdWxlX2dl
dChsZWRfY2Rldi0+ZGV2LT5wYXJlbnQtPmRyaXZlci0+b3duZXIpKQorCQlyZXR1cm4gRVJSX1BU
UigtRU5PREVWKTsKKworCXJldHVybiBsZWRfY2RldjsKK30KK0VYUE9SVF9TWU1CT0xfR1BMKG9m
X2xlZF9nZXQpOworCisvKioKKyAqIGxlZF9wdXQoKSAtIHJlbGVhc2UgYSBMRUQgZGV2aWNlCisg
KiBAbGVkX2NkZXY6IExFRCBkZXZpY2UKKyAqLwordm9pZCBsZWRfcHV0KHN0cnVjdCBsZWRfY2xh
c3NkZXYgKmxlZF9jZGV2KQoreworCW1vZHVsZV9wdXQobGVkX2NkZXYtPmRldi0+cGFyZW50LT5k
cml2ZXItPm93bmVyKTsKK30KK0VYUE9SVF9TWU1CT0xfR1BMKGxlZF9wdXQpOworCiBzdGF0aWMg
aW50IGxlZF9jbGFzc2Rldl9uZXh0X25hbWUoY29uc3QgY2hhciAqaW5pdF9uYW1lLCBjaGFyICpu
YW1lLAogCQkJCSAgc2l6ZV90IGxlbikKIHsKZGlmZiAtLWdpdCBhL2luY2x1ZGUvbGludXgvbGVk
cy5oIGIvaW5jbHVkZS9saW51eC9sZWRzLmgKaW5kZXggYjhkZjcxMTkzMzI5Li42ZjczNzFiYzc3
NTcgMTAwNjQ0Ci0tLSBhL2luY2x1ZGUvbGludXgvbGVkcy5oCisrKyBiL2luY2x1ZGUvbGludXgv
bGVkcy5oCkBAIC0yMCw2ICsyMCw3IEBACiAKIHN0cnVjdCBkZXZpY2U7CiBzdHJ1Y3QgbGVkX3Bh
dHRlcm47CitzdHJ1Y3QgZGV2aWNlX25vZGU7CiAvKgogICogTEVEIENvcmUKICAqLwpAQCAtMTk2
LDYgKzE5Nyw5IEBAIGV4dGVybiB2b2lkIGRldm1fbGVkX2NsYXNzZGV2X3VucmVnaXN0ZXIoc3Ry
dWN0IGRldmljZSAqcGFyZW50LAogZXh0ZXJuIHZvaWQgbGVkX2NsYXNzZGV2X3N1c3BlbmQoc3Ry
dWN0IGxlZF9jbGFzc2RldiAqbGVkX2NkZXYpOwogZXh0ZXJuIHZvaWQgbGVkX2NsYXNzZGV2X3Jl
c3VtZShzdHJ1Y3QgbGVkX2NsYXNzZGV2ICpsZWRfY2Rldik7CiAKK2V4dGVybiBzdHJ1Y3QgbGVk
X2NsYXNzZGV2ICpvZl9sZWRfZ2V0KHN0cnVjdCBkZXZpY2Vfbm9kZSAqbnAsIGludCBpbmRleCk7
CitleHRlcm4gdm9pZCBsZWRfcHV0KHN0cnVjdCBsZWRfY2xhc3NkZXYgKmxlZF9jZGV2KTsKKwog
LyoqCiAgKiBsZWRfYmxpbmtfc2V0IC0gc2V0IGJsaW5raW5nIHdpdGggc29mdHdhcmUgZmFsbGJh
Y2sKICAqIEBsZWRfY2RldjogdGhlIExFRCB0byBzdGFydCBibGlua2luZwotLSAKMi4xNy4xCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwg
bWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
