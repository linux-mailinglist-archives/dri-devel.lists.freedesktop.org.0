Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D881DAEB81
	for <lists+dri-devel@lfdr.de>; Tue, 10 Sep 2019 15:27:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1EB976E0BE;
	Tue, 10 Sep 2019 13:27:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2DAF86E0B7
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Sep 2019 13:27:44 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
 by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id x8ADRdkm025009;
 Tue, 10 Sep 2019 08:27:39 -0500
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
 by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x8ADRd6G086640
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 10 Sep 2019 08:27:39 -0500
Received: from DLEE111.ent.ti.com (157.170.170.22) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Tue, 10
 Sep 2019 08:27:39 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Tue, 10 Sep 2019 08:27:39 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id x8ADRcKu048670;
 Tue, 10 Sep 2019 08:27:38 -0500
From: Jean-Jacques Hiblot <jjhiblot@ti.com>
To: <jacek.anaszewski@gmail.com>, <pavel@ucw.cz>, <robh+dt@kernel.org>,
 <mark.rutland@arm.com>, <lee.jones@linaro.org>,
 <daniel.thompson@linaro.org>
Subject: [PATCH v6 2/4] leds: Add managed API to get a LED from a device driver
Date: Tue, 10 Sep 2019 15:27:32 +0200
Message-ID: <20190910132734.9544-3-jjhiblot@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190910132734.9544-1-jjhiblot@ti.com>
References: <20190910132734.9544-1-jjhiblot@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ti.com; s=ti-com-17Q1; t=1568122059;
 bh=d5veEZ1PcXAieWongpOg9OtCDdccu5gYAuMOT2iHat8=;
 h=From:To:CC:Subject:Date:In-Reply-To:References;
 b=sSXYxdiKY/JMCbuhm/iUxpx+DxRYN5lYkuEZBUvUalIXXfLYMQGVj5xMNOutvmwFn
 KL81w1wRhTrKnru18FNfiewYAv9dB5O3Jsf86SQd174PWQHz/5/RESmqoTXq4buxWU
 +92GuZOmeAeREQO5uR6BTb5pJSanW46oY3f08tWE=
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

SWYgdGhlIExFRCBpcyBhY3F1aXJlZCBieSBhIGNvbnN1bWVyIGRldmljZSB3aXRoIGRldm1fbGVk
X2dldCgpLCBpdCBpcwphdXRvbWF0aWNhbGx5IHJlbGVhc2VkIHdoZW4gdGhlIGRldmljZSBpcyBk
ZXRhY2hlZC4KClNpZ25lZC1vZmYtYnk6IEplYW4tSmFjcXVlcyBIaWJsb3QgPGpqaGlibG90QHRp
LmNvbT4KQWNrZWQtYnk6IFBhdmVsIE1hY2hlayA8cGF2ZWxAdWN3LmN6PgotLS0KIGRyaXZlcnMv
bGVkcy9sZWQtY2xhc3MuYyB8IDQyICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysKIGluY2x1ZGUvbGludXgvbGVkcy5oICAgICB8ICAyICsrCiAyIGZpbGVzIGNoYW5nZWQs
IDQ0IGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2xlZHMvbGVkLWNsYXNzLmMg
Yi9kcml2ZXJzL2xlZHMvbGVkLWNsYXNzLmMKaW5kZXggZDRkMjJmNGI1MDUyLi42NjRjODFlMjUx
M2MgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvbGVkcy9sZWQtY2xhc3MuYworKysgYi9kcml2ZXJzL2xl
ZHMvbGVkLWNsYXNzLmMKQEAgLTI2Myw2ICsyNjMsNDggQEAgdm9pZCBsZWRfcHV0KHN0cnVjdCBs
ZWRfY2xhc3NkZXYgKmxlZF9jZGV2KQogfQogRVhQT1JUX1NZTUJPTF9HUEwobGVkX3B1dCk7CiAK
K3N0YXRpYyB2b2lkIGRldm1fbGVkX3JlbGVhc2Uoc3RydWN0IGRldmljZSAqZGV2LCB2b2lkICpy
ZXMpCit7CisJc3RydWN0IGxlZF9jbGFzc2RldiAqKnAgPSByZXM7CisKKwlsZWRfcHV0KCpwKTsK
K30KKworLyoqCisgKiBkZXZtX2xlZF9nZXQgLSBSZXNvdXJjZS1tYW5hZ2VkIHJlcXVlc3Qgb2Yg
YSBMRUQgZGV2aWNlCisgKiBAZGV2OglMRUQgY29uc3VtZXIKKyAqIEBpZHg6CWluZGV4IG9mIHRo
ZSBMRUQgdG8gb2J0YWluIGluIHRoZSBjb25zdW1lcgorICoKKyAqIFRoZSBkZXZpY2Ugbm9kZSBv
ZiB0aGUgZGV2aWNlIGlzIHBhcnNlIHRvIGZpbmQgdGhlIHJlcXVlc3QgTEVEIGRldmljZS4KKyAq
IFRoZSBMRUQgZGV2aWNlIHJldHVybmVkIGZyb20gdGhpcyBmdW5jdGlvbiBpcyBhdXRvbWF0aWNh
bGx5IHJlbGVhc2VkCisgKiBvbiBkcml2ZXIgZGV0YWNoLgorICoKKyAqIEByZXR1cm4gYSBwb2lu
dGVyIHRvIGEgTEVEIGRldmljZSBvciBFUlJfUFRSKGVycm5vKSBvbiBmYWlsdXJlLgorICovCitz
dHJ1Y3QgbGVkX2NsYXNzZGV2ICpfX211c3RfY2hlY2sgZGV2bV9sZWRfZ2V0KHN0cnVjdCBkZXZp
Y2UgKmRldiwKKwkJCQkJICAgICAgIGludCBpbmRleCkKK3sKKwlzdHJ1Y3QgbGVkX2NsYXNzZGV2
ICpsZWQ7CisJc3RydWN0IGxlZF9jbGFzc2RldiAqKmRyOworCisJbGVkID0gb2ZfbGVkX2dldChk
ZXYtPm9mX25vZGUsIGluZGV4KTsKKwlpZiAoSVNfRVJSKGxlZCkpCisJCXJldHVybiBsZWQ7CisK
KwlkciA9IGRldnJlc19hbGxvYyhkZXZtX2xlZF9yZWxlYXNlLCBzaXplb2Yoc3RydWN0IGxlZF9j
bGFzc2RldiAqKSwKKwkJCSAgR0ZQX0tFUk5FTCk7CisJaWYgKCFkcikgeworCQlsZWRfcHV0KGxl
ZCk7CisJCXJldHVybiBFUlJfUFRSKC1FTk9NRU0pOworCX0KKworCSpkciA9IGxlZDsKKwlkZXZy
ZXNfYWRkKGRldiwgZHIpOworCisJcmV0dXJuIGxlZDsKK30KK0VYUE9SVF9TWU1CT0xfR1BMKGRl
dm1fbGVkX2dldCk7CisKIHN0YXRpYyBpbnQgbWF0Y2hfbmFtZShzdHJ1Y3QgZGV2aWNlICpkZXYs
IGNvbnN0IHZvaWQgKmRhdGEpCiB7CiAJaWYgKCFkZXZfbmFtZShkZXYpKQpkaWZmIC0tZ2l0IGEv
aW5jbHVkZS9saW51eC9sZWRzLmggYi9pbmNsdWRlL2xpbnV4L2xlZHMuaAppbmRleCAwYTcxYzdj
ZGQxOTEuLjdmY2VjNTY2ZDc3NCAxMDA2NDQKLS0tIGEvaW5jbHVkZS9saW51eC9sZWRzLmgKKysr
IGIvaW5jbHVkZS9saW51eC9sZWRzLmgKQEAgLTE0OCw2ICsxNDgsOCBAQCBleHRlcm4gdm9pZCBs
ZWRfY2xhc3NkZXZfcmVzdW1lKHN0cnVjdCBsZWRfY2xhc3NkZXYgKmxlZF9jZGV2KTsKIAogZXh0
ZXJuIHN0cnVjdCBsZWRfY2xhc3NkZXYgKm9mX2xlZF9nZXQoc3RydWN0IGRldmljZV9ub2RlICpu
cCwgaW50IGluZGV4KTsKIGV4dGVybiB2b2lkIGxlZF9wdXQoc3RydWN0IGxlZF9jbGFzc2RldiAq
bGVkX2NkZXYpOworc3RydWN0IGxlZF9jbGFzc2RldiAqX19tdXN0X2NoZWNrIGRldm1fbGVkX2dl
dChzdHJ1Y3QgZGV2aWNlICpkZXYsCisJCQkJCSAgICAgICBpbnQgaW5kZXgpOwogCiAvKioKICAq
IGxlZF9ibGlua19zZXQgLSBzZXQgYmxpbmtpbmcgd2l0aCBzb2Z0d2FyZSBmYWxsYmFjawotLSAK
Mi4xNy4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpk
cmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
