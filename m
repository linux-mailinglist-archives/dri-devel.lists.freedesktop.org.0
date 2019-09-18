Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DDFEFB668E
	for <lists+dri-devel@lfdr.de>; Wed, 18 Sep 2019 16:57:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B95AA6F58C;
	Wed, 18 Sep 2019 14:57:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5EAF46F3D3
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Sep 2019 14:57:47 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
 by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id x8IEvgaf084990;
 Wed, 18 Sep 2019 09:57:42 -0500
Received: from DLEE103.ent.ti.com (dlee103.ent.ti.com [157.170.170.33])
 by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x8IEvgWL003176
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Wed, 18 Sep 2019 09:57:42 -0500
Received: from DLEE102.ent.ti.com (157.170.170.32) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Wed, 18
 Sep 2019 09:57:38 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Wed, 18 Sep 2019 09:57:39 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id x8IEvf5m091969;
 Wed, 18 Sep 2019 09:57:41 -0500
From: Jean-Jacques Hiblot <jjhiblot@ti.com>
To: <jacek.anaszewski@gmail.com>, <pavel@ucw.cz>, <robh+dt@kernel.org>,
 <mark.rutland@arm.com>, <lee.jones@linaro.org>,
 <daniel.thompson@linaro.org>
Subject: [PATCH v7 1/5] leds: populate the device's of_node when possible
Date: Wed, 18 Sep 2019 16:57:26 +0200
Message-ID: <20190918145730.22805-2-jjhiblot@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190918145730.22805-1-jjhiblot@ti.com>
References: <20190918145730.22805-1-jjhiblot@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ti.com; s=ti-com-17Q1; t=1568818662;
 bh=zHZNeDL779jJyDu708ggzOFMfXOscN51xWhlBD7mkHE=;
 h=From:To:CC:Subject:Date:In-Reply-To:References;
 b=Yv+8xg8b9T6T7OXzED6lcXrePQaHfDux9/FxyqZM4bbOma4NLiGBMF37UUfWVDUrV
 U2qpwFFM+IjTtw173jtmxjiH8XlgKyFmG/kg2ezkvCoxmD666XQXFL4JXa3zkVygpL
 ydKFgb6TCJ7ipVlU/ytCS3MZ8zZYGp84ny19SX+o=
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
 tomi.valkeinen@ti.com, dmurphy@ti.com, jjhiblot@ti.com,
 linux-leds@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SWYgaW5pdGlhbGl6YXRpb24gZGF0YSBpcyBhdmFpbGFibGUgYW5kIGl0cyBmd25vZGUgaXMgYWN0
dWFsbHkgYSBvZl9ub2RlLApzdG9yZSB0aGlzIGluZm9ybWF0aW9uIGluIHRoZSBsZWQgZGV2aWNl
J3Mgc3RydWN0dXJlLiBUaGlzIHdpbGwgYWxsb3cgdGhlCmRldmljZSB0byB1c2Ugb3IgcHJvdmlk
ZSBPRi1iYXNlZCBBUEkgc3VjaCAoZGV2bV94eHgpLgoKU2lnbmVkLW9mZi1ieTogSmVhbi1KYWNx
dWVzIEhpYmxvdCA8ampoaWJsb3RAdGkuY29tPgotLS0KIGRyaXZlcnMvbGVkcy9sZWQtY2xhc3Mu
YyB8IDUgKysrKy0KIDEgZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24o
LSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2xlZHMvbGVkLWNsYXNzLmMgYi9kcml2ZXJzL2xlZHMv
bGVkLWNsYXNzLmMKaW5kZXggNjQ3YjEyNjNjNTc5Li5jMjE2N2I2NmI2MWYgMTAwNjQ0Ci0tLSBh
L2RyaXZlcnMvbGVkcy9sZWQtY2xhc3MuYworKysgYi9kcml2ZXJzL2xlZHMvbGVkLWNsYXNzLmMK
QEAgLTI3Niw4ICsyNzYsMTEgQEAgaW50IGxlZF9jbGFzc2Rldl9yZWdpc3Rlcl9leHQoc3RydWN0
IGRldmljZSAqcGFyZW50LAogCQltdXRleF91bmxvY2soJmxlZF9jZGV2LT5sZWRfYWNjZXNzKTsK
IAkJcmV0dXJuIFBUUl9FUlIobGVkX2NkZXYtPmRldik7CiAJfQotCWlmIChpbml0X2RhdGEgJiYg
aW5pdF9kYXRhLT5md25vZGUpCisJaWYgKGluaXRfZGF0YSAmJiBpbml0X2RhdGEtPmZ3bm9kZSkg
ewogCQlsZWRfY2Rldi0+ZGV2LT5md25vZGUgPSBpbml0X2RhdGEtPmZ3bm9kZTsKKwkJaWYgKGlz
X29mX25vZGUoaW5pdF9kYXRhLT5md25vZGUpKQorCQkJbGVkX2NkZXYtPmRldi0+b2Zfbm9kZSA9
IHRvX29mX25vZGUoaW5pdF9kYXRhLT5md25vZGUpOworCX0KIAogCWlmIChyZXQpCiAJCWRldl93
YXJuKHBhcmVudCwgIkxlZCAlcyByZW5hbWVkIHRvICVzIGR1ZSB0byBuYW1lIGNvbGxpc2lvbiIs
Ci0tIAoyLjE3LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9y
ZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZl
bA==
