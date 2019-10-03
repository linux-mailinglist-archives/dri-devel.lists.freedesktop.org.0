Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C537C99D6
	for <lists+dri-devel@lfdr.de>; Thu,  3 Oct 2019 10:28:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 84B996E889;
	Thu,  3 Oct 2019 08:28:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5FAF36E889
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Oct 2019 08:28:31 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
 by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x938SQRB086271;
 Thu, 3 Oct 2019 03:28:26 -0500
Received: from DFLE106.ent.ti.com (dfle106.ent.ti.com [10.64.6.27])
 by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x938SPCH117638
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Thu, 3 Oct 2019 03:28:26 -0500
Received: from DFLE106.ent.ti.com (10.64.6.27) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Thu, 3 Oct
 2019 03:28:25 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Thu, 3 Oct 2019 03:28:25 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id x938SOCo033289;
 Thu, 3 Oct 2019 03:28:25 -0500
From: Jean-Jacques Hiblot <jjhiblot@ti.com>
To: <jacek.anaszewski@gmail.com>, <pavel@ucw.cz>, <robh+dt@kernel.org>,
 <mark.rutland@arm.com>, <lee.jones@linaro.org>,
 <daniel.thompson@linaro.org>
Subject: [PATCH v8 4/5] dt-bindings: backlight: Add led-backlight binding
Date: Thu, 3 Oct 2019 10:28:11 +0200
Message-ID: <20191003082812.28491-5-jjhiblot@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191003082812.28491-1-jjhiblot@ti.com>
References: <20191003082812.28491-1-jjhiblot@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ti.com; s=ti-com-17Q1; t=1570091306;
 bh=dPDBk1Y3qicoCPHxrSR9zQwbWp6dV0NX8yJNHPPSaTk=;
 h=From:To:CC:Subject:Date:In-Reply-To:References;
 b=r2EwsMNzy4BSoOo9hOPh2l02tzgU6W29EDaDiFn28O+lww1vR1tYRXgaygeKqIMmh
 DYlk0XOhHMce0f9BxdqlS/YaDDSNRzN3WG1R+YrCRn4q9xSYa/FyK+6f5tYzl/dTlF
 jC2SdhLbrVAtw4bZS1XVge9f6QSYjAFpoHmxQMK0=
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

QWRkIERUIGJpbmRpbmcgZm9yIGxlZC1iYWNrbGlnaHQuCgpTaWduZWQtb2ZmLWJ5OiBKZWFuLUph
Y3F1ZXMgSGlibG90IDxqamhpYmxvdEB0aS5jb20+ClJldmlld2VkLWJ5OiBEYW5pZWwgVGhvbXBz
b24gPGRhbmllbC50aG9tcHNvbkBsaW5hcm8ub3JnPgotLS0KIC4uLi9iaW5kaW5ncy9sZWRzL2Jh
Y2tsaWdodC9sZWQtYmFja2xpZ2h0LnR4dCB8IDI4ICsrKysrKysrKysrKysrKysrKysKIDEgZmls
ZSBjaGFuZ2VkLCAyOCBpbnNlcnRpb25zKCspCiBjcmVhdGUgbW9kZSAxMDA2NDQgRG9jdW1lbnRh
dGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2xlZHMvYmFja2xpZ2h0L2xlZC1iYWNrbGlnaHQudHh0
CgpkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2xlZHMvYmFj
a2xpZ2h0L2xlZC1iYWNrbGlnaHQudHh0IGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRp
bmdzL2xlZHMvYmFja2xpZ2h0L2xlZC1iYWNrbGlnaHQudHh0Cm5ldyBmaWxlIG1vZGUgMTAwNjQ0
CmluZGV4IDAwMDAwMDAwMDAwMC4uNGM3ZGZiZTdmNjdhCi0tLSAvZGV2L251bGwKKysrIGIvRG9j
dW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2xlZHMvYmFja2xpZ2h0L2xlZC1iYWNrbGln
aHQudHh0CkBAIC0wLDAgKzEsMjggQEAKK2xlZC1iYWNrbGlnaHQgYmluZGluZ3MKKworVGhpcyBi
aW5kaW5nIGlzIHVzZWQgdG8gZGVzY3JpYmUgYSBiYXNpYyBiYWNrbGlnaHQgZGV2aWNlIG1hZGUg
b2YgTEVEcy4KK0l0IGNhbiBhbHNvIGJlIHVzZWQgdG8gZGVzY3JpYmUgYSBiYWNrbGlnaHQgZGV2
aWNlIGNvbnRyb2xsZWQgYnkgdGhlIG91dHB1dCBvZgorYSBMRUQgZHJpdmVyLgorCitSZXF1aXJl
ZCBwcm9wZXJ0aWVzOgorICAtIGNvbXBhdGlibGU6ICJsZWQtYmFja2xpZ2h0IgorICAtIGxlZHM6
IGEgbGlzdCBvZiBMRURzCisKK09wdGlvbmFsIHByb3BlcnRpZXM6CisgIC0gYnJpZ2h0bmVzcy1s
ZXZlbHM6IEFycmF5IG9mIGRpc3RpbmN0IGJyaWdodG5lc3MgbGV2ZWxzLiBUaGUgbGV2ZWxzIG11
c3QgYmUKKyAgICAgICAgICAgICAgICAgICAgICAgaW4gdGhlIHJhbmdlIGFjY2VwdGVkIGJ5IHRo
ZSB1bmRlcmx5aW5nIExFRCBkZXZpY2VzLgorICAgICAgICAgICAgICAgICAgICAgICBUaGlzIGlz
IHVzZWQgdG8gdHJhbnNsYXRlIGEgYmFja2xpZ2h0IGJyaWdodG5lc3MgbGV2ZWwKKyAgICAgICAg
ICAgICAgICAgICAgICAgaW50byBhIExFRCBicmlnaHRuZXNzIGxldmVsLiBJZiBpdCBpcyBub3Qg
cHJvdmlkZWQsIHRoZQorICAgICAgICAgICAgICAgICAgICAgICBpZGVudGl0eSBtYXBwaW5nIGlz
IHVzZWQuCisKKyAgLSBkZWZhdWx0LWJyaWdodG5lc3MtbGV2ZWw6IFRoZSBkZWZhdWx0IGJyaWdo
dG5lc3MgbGV2ZWwuCisKK0V4YW1wbGU6CisKKwliYWNrbGlnaHQgeworCQljb21wYXRpYmxlID0g
ImxlZC1iYWNrbGlnaHQiOworCisJCWxlZHMgPSA8JmxlZDE+LCA8JmxlZDI+OworCQlicmlnaHRu
ZXNzLWxldmVscyA9IDwwIDQgOCAxNiAzMiA2NCAxMjggMjU1PjsKKwkJZGVmYXVsdC1icmlnaHRu
ZXNzLWxldmVsID0gPDY+OworCX07Ci0tIAoyLjE3LjEKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVs
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
