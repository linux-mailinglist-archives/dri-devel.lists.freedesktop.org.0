Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 20C7DC99D1
	for <lists+dri-devel@lfdr.de>; Thu,  3 Oct 2019 10:28:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D7D76E2DF;
	Thu,  3 Oct 2019 08:28:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C5A7E6E2DF
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Oct 2019 08:28:24 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id x938SJTt037686;
 Thu, 3 Oct 2019 03:28:19 -0500
Received: from DLEE101.ent.ti.com (dlee101.ent.ti.com [157.170.170.31])
 by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id x938SJoJ058528;
 Thu, 3 Oct 2019 03:28:19 -0500
Received: from DLEE107.ent.ti.com (157.170.170.37) by DLEE101.ent.ti.com
 (157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Thu, 3 Oct
 2019 03:28:07 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Thu, 3 Oct 2019 03:28:18 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id x938SIAn082890;
 Thu, 3 Oct 2019 03:28:18 -0500
From: Jean-Jacques Hiblot <jjhiblot@ti.com>
To: <jacek.anaszewski@gmail.com>, <pavel@ucw.cz>, <robh+dt@kernel.org>,
 <mark.rutland@arm.com>, <lee.jones@linaro.org>,
 <daniel.thompson@linaro.org>
Subject: [PATCH v8 1/5] leds: populate the device's of_node when possible
Date: Thu, 3 Oct 2019 10:28:08 +0200
Message-ID: <20191003082812.28491-2-jjhiblot@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191003082812.28491-1-jjhiblot@ti.com>
References: <20191003082812.28491-1-jjhiblot@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ti.com; s=ti-com-17Q1; t=1570091299;
 bh=zHZNeDL779jJyDu708ggzOFMfXOscN51xWhlBD7mkHE=;
 h=From:To:CC:Subject:Date:In-Reply-To:References;
 b=BQL/d8vhZh4aWHBwYpdSMgD+qbCIIX79p+KyCFfsWk8nQyFwTs/FrT3anI2CPNGdC
 B84Lq4nL1Q0/ZcjKG1k5fJ/LxWtyajMJP0lT1H8OaGwuowG4hY8fDLjpVYIewGpB9J
 qTlAqP/ZVaSmfTnC7MhIYqXHwBxJg1RlVvh7ba4g=
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
