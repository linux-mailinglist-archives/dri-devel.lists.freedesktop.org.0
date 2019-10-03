Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 12145C99D5
	for <lists+dri-devel@lfdr.de>; Thu,  3 Oct 2019 10:28:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E873B6E905;
	Thu,  3 Oct 2019 08:28:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E1E06E964
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Oct 2019 08:28:29 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id x938SNSY037716;
 Thu, 3 Oct 2019 03:28:23 -0500
Received: from DFLE105.ent.ti.com (dfle105.ent.ti.com [10.64.6.26])
 by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x938SN50117594
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Thu, 3 Oct 2019 03:28:23 -0500
Received: from DFLE111.ent.ti.com (10.64.6.32) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Thu, 3 Oct
 2019 03:28:23 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Thu, 3 Oct 2019 03:28:23 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id x938SMIP082976;
 Thu, 3 Oct 2019 03:28:23 -0500
From: Jean-Jacques Hiblot <jjhiblot@ti.com>
To: <jacek.anaszewski@gmail.com>, <pavel@ucw.cz>, <robh+dt@kernel.org>,
 <mark.rutland@arm.com>, <lee.jones@linaro.org>,
 <daniel.thompson@linaro.org>
Subject: [PATCH v8 3/5] leds: Add managed API to get a LED from a device driver
Date: Thu, 3 Oct 2019 10:28:10 +0200
Message-ID: <20191003082812.28491-4-jjhiblot@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191003082812.28491-1-jjhiblot@ti.com>
References: <20191003082812.28491-1-jjhiblot@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ti.com; s=ti-com-17Q1; t=1570091304;
 bh=JqcpVY+cllPhKIR7VpbA5/WIIYir2CvRhZ6o6hZeJBc=;
 h=From:To:CC:Subject:Date:In-Reply-To:References;
 b=WqbYuTBbYzVOBGPHUqutLCNuRrXp4QekcHPFTwhVFHtZYfSwqyazU0IS+wlvo0gzn
 5KzXXigt1Hysy3n3YN1fYkNxuu32Tvmmc7zy4vODfAR8dl/ztsLcBl3DvPUzgiggB9
 uPIPS7NoP+Oaf3SRnzN1Und5cbRkzcum1VoSTlTo=
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
bGVkcy9sZWQtY2xhc3MuYyB8IDQ5ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysKIGluY2x1ZGUvbGludXgvbGVkcy5oICAgICB8ICAyICsrCiAyIGZpbGVzIGNoYW5nZWQs
IDUxIGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2xlZHMvbGVkLWNsYXNzLmMg
Yi9kcml2ZXJzL2xlZHMvbGVkLWNsYXNzLmMKaW5kZXggNDU1NTQ1ZjVkNjYzLi44MGM5NmRkOTZh
ZmMgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvbGVkcy9sZWQtY2xhc3MuYworKysgYi9kcml2ZXJzL2xl
ZHMvbGVkLWNsYXNzLmMKQEAgLTI1OCw2ICsyNTgsNTUgQEAgdm9pZCBsZWRfcHV0KHN0cnVjdCBs
ZWRfY2xhc3NkZXYgKmxlZF9jZGV2KQogfQogRVhQT1JUX1NZTUJPTF9HUEwobGVkX3B1dCk7CiAK
K3N0YXRpYyB2b2lkIGRldm1fbGVkX3JlbGVhc2Uoc3RydWN0IGRldmljZSAqZGV2LCB2b2lkICpy
ZXMpCit7CisJc3RydWN0IGxlZF9jbGFzc2RldiAqKnAgPSByZXM7CisKKwlsZWRfcHV0KCpwKTsK
K30KKworLyoqCisgKiBkZXZtX29mX2xlZF9nZXQgLSBSZXNvdXJjZS1tYW5hZ2VkIHJlcXVlc3Qg
b2YgYSBMRUQgZGV2aWNlCisgKiBAZGV2OglMRUQgY29uc3VtZXIKKyAqIEBpbmRleDoJaW5kZXgg
b2YgdGhlIExFRCB0byBvYnRhaW4gaW4gdGhlIGNvbnN1bWVyCisgKgorICogVGhlIGRldmljZSBu
b2RlIG9mIHRoZSBkZXZpY2UgaXMgcGFyc2UgdG8gZmluZCB0aGUgcmVxdWVzdCBMRUQgZGV2aWNl
LgorICogVGhlIExFRCBkZXZpY2UgcmV0dXJuZWQgZnJvbSB0aGlzIGZ1bmN0aW9uIGlzIGF1dG9t
YXRpY2FsbHkgcmVsZWFzZWQKKyAqIG9uIGRyaXZlciBkZXRhY2guCisgKgorICogQHJldHVybiBh
IHBvaW50ZXIgdG8gYSBMRUQgZGV2aWNlIG9yIEVSUl9QVFIoZXJybm8pIG9uIGZhaWx1cmUuCisg
Ki8KK3N0cnVjdCBsZWRfY2xhc3NkZXYgKl9fbXVzdF9jaGVjayBkZXZtX29mX2xlZF9nZXQoc3Ry
dWN0IGRldmljZSAqZGV2LAorCQkJCQkJICBpbnQgaW5kZXgpCit7CisJc3RydWN0IGxlZF9jbGFz
c2RldiAqbGVkOworCXN0cnVjdCBsZWRfY2xhc3NkZXYgKipkcjsKKworCWlmICghZGV2KQorCQly
ZXR1cm4gRVJSX1BUUigtRUlOVkFMKTsKKworCS8qIE5vdCB1c2luZyBkZXZpY2UgdHJlZT8gKi8K
KwlpZiAoIUlTX0VOQUJMRUQoQ09ORklHX09GKSB8fCAhZGV2LT5vZl9ub2RlKQorCQlyZXR1cm4g
RVJSX1BUUigtRU5PVFNVUFApOworCisJbGVkID0gb2ZfbGVkX2dldChkZXYtPm9mX25vZGUsIGlu
ZGV4KTsKKwlpZiAoSVNfRVJSKGxlZCkpCisJCXJldHVybiBsZWQ7CisKKwlkciA9IGRldnJlc19h
bGxvYyhkZXZtX2xlZF9yZWxlYXNlLCBzaXplb2Yoc3RydWN0IGxlZF9jbGFzc2RldiAqKSwKKwkJ
CSAgR0ZQX0tFUk5FTCk7CisJaWYgKCFkcikgeworCQlsZWRfcHV0KGxlZCk7CisJCXJldHVybiBF
UlJfUFRSKC1FTk9NRU0pOworCX0KKworCSpkciA9IGxlZDsKKwlkZXZyZXNfYWRkKGRldiwgZHIp
OworCisJcmV0dXJuIGxlZDsKK30KK0VYUE9SVF9TWU1CT0xfR1BMKGRldm1fb2ZfbGVkX2dldCk7
CisKIHN0YXRpYyBpbnQgbGVkX2NsYXNzZGV2X25leHRfbmFtZShjb25zdCBjaGFyICppbml0X25h
bWUsIGNoYXIgKm5hbWUsCiAJCQkJICBzaXplX3QgbGVuKQogewpkaWZmIC0tZ2l0IGEvaW5jbHVk
ZS9saW51eC9sZWRzLmggYi9pbmNsdWRlL2xpbnV4L2xlZHMuaAppbmRleCA2ZjczNzFiYzc3NTcu
LjliOTRjZjc1MjAxMiAxMDA2NDQKLS0tIGEvaW5jbHVkZS9saW51eC9sZWRzLmgKKysrIGIvaW5j
bHVkZS9saW51eC9sZWRzLmgKQEAgLTE5OSw2ICsxOTksOCBAQCBleHRlcm4gdm9pZCBsZWRfY2xh
c3NkZXZfcmVzdW1lKHN0cnVjdCBsZWRfY2xhc3NkZXYgKmxlZF9jZGV2KTsKIAogZXh0ZXJuIHN0
cnVjdCBsZWRfY2xhc3NkZXYgKm9mX2xlZF9nZXQoc3RydWN0IGRldmljZV9ub2RlICpucCwgaW50
IGluZGV4KTsKIGV4dGVybiB2b2lkIGxlZF9wdXQoc3RydWN0IGxlZF9jbGFzc2RldiAqbGVkX2Nk
ZXYpOworc3RydWN0IGxlZF9jbGFzc2RldiAqX19tdXN0X2NoZWNrIGRldm1fb2ZfbGVkX2dldChz
dHJ1Y3QgZGV2aWNlICpkZXYsCisJCQkJCQkgIGludCBpbmRleCk7CiAKIC8qKgogICogbGVkX2Js
aW5rX3NldCAtIHNldCBibGlua2luZyB3aXRoIHNvZnR3YXJlIGZhbGxiYWNrCi0tIAoyLjE3LjEK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZl
bCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xp
c3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
