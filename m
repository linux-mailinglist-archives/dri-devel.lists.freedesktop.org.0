Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 305346581B
	for <lists+dri-devel@lfdr.de>; Thu, 11 Jul 2019 15:52:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D99D06E247;
	Thu, 11 Jul 2019 13:52:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 29A8E6E248
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Jul 2019 13:52:23 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id x6BDqM4a075829;
 Thu, 11 Jul 2019 08:52:22 -0500
Received: from DFLE102.ent.ti.com (dfle102.ent.ti.com [10.64.6.23])
 by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x6BDqM3F106776
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Thu, 11 Jul 2019 08:52:22 -0500
Received: from DFLE111.ent.ti.com (10.64.6.32) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Thu, 11
 Jul 2019 08:52:22 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Thu, 11 Jul 2019 08:52:21 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id x6BDqLfw019590;
 Thu, 11 Jul 2019 08:52:21 -0500
From: Jean-Jacques Hiblot <jjhiblot@ti.com>
To: <tomi.valkeinen@ti.com>
Subject: [PATCH] drm/omap: Add 'alpha' and 'pixel blend mode' plane properties
Date: Thu, 11 Jul 2019 15:52:19 +0200
Message-ID: <20190711135219.23402-1-jjhiblot@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ti.com; s=ti-com-17Q1; t=1562853142;
 bh=ymiH0R8rGaXDGNyGzJJpstHEYruHajGcyfFDcx1Wm6g=;
 h=From:To:CC:Subject:Date;
 b=TmWHzKr3gYv/E+qbSn51IClf3DxICIMrHAlKMNjzBf+TT33876fhvOH7Fg96lEZwp
 g9TWJtzKJTtQSj5VB7mWw7LVAuHsriTmHyIaNZCB8wm2e1h3+ACnnkWTefuNjo/xpy
 NfpPBr0MOw4H4qC7bc0fPIpJI3WXxO6cPCeqEGII=
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
Cc: Jean-Jacques Hiblot <jjhiblot@ti.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QWRkIHRoZSBmb2xsb3dpbmcgcHJvcGVydGllcyBmb3IgcGxhbmVzOgoqIGFscGhhCiogcGl4ZWwg
YmxlbmQgbW9kZS4gT25seSAiUHJlLW11bHRpcGxpZWQiIGFuZCAiQ292ZXJhZ2UiIGFyZSBzdXBw
b3J0ZWQKClNpZ25lZC1vZmYtYnk6IEplYW4tSmFjcXVlcyBIaWJsb3QgPGpqaGlibG90QHRpLmNv
bT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vb21hcGRybS9vbWFwX3BsYW5lLmMgfCA5ICsrKysrKysr
LQogMSBmaWxlIGNoYW5nZWQsIDggaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAt
LWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9vbWFwZHJtL29tYXBfcGxhbmUuYyBiL2RyaXZlcnMvZ3B1
L2RybS9vbWFwZHJtL29tYXBfcGxhbmUuYwppbmRleCA4NGUxYmU5ODFjZmUuLjczZWM5OTgxOWEz
ZCAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL29tYXBkcm0vb21hcF9wbGFuZS5jCisrKyBi
L2RyaXZlcnMvZ3B1L2RybS9vbWFwZHJtL29tYXBfcGxhbmUuYwpAQCAtNTMsOCArNTMsMTIgQEAg
c3RhdGljIHZvaWQgb21hcF9wbGFuZV9hdG9taWNfdXBkYXRlKHN0cnVjdCBkcm1fcGxhbmUgKnBs
YW5lLAogCW1lbXNldCgmaW5mbywgMCwgc2l6ZW9mKGluZm8pKTsKIAlpbmZvLnJvdGF0aW9uX3R5
cGUgPSBPTUFQX0RTU19ST1RfTk9ORTsKIAlpbmZvLnJvdGF0aW9uID0gRFJNX01PREVfUk9UQVRF
XzA7Ci0JaW5mby5nbG9iYWxfYWxwaGEgPSAweGZmOworCWluZm8uZ2xvYmFsX2FscGhhID0gc3Rh
dGUtPmFscGhhID4+IDg7CiAJaW5mby56b3JkZXIgPSBzdGF0ZS0+bm9ybWFsaXplZF96cG9zOwor
CWlmIChzdGF0ZS0+cGl4ZWxfYmxlbmRfbW9kZSA9PSBEUk1fTU9ERV9CTEVORF9QUkVNVUxUSSkK
KwkJaW5mby5wcmVfbXVsdF9hbHBoYSA9IDE7CisJZWxzZQorCQlpbmZvLnByZV9tdWx0X2FscGhh
ID0gMDsKIAogCS8qIHVwZGF0ZSBzY2Fub3V0OiAqLwogCW9tYXBfZnJhbWVidWZmZXJfdXBkYXRl
X3NjYW5vdXQoc3RhdGUtPmZiLCBzdGF0ZSwgJmluZm8pOwpAQCAtMjg1LDYgKzI4OSw5IEBAIHN0
cnVjdCBkcm1fcGxhbmUgKm9tYXBfcGxhbmVfaW5pdChzdHJ1Y3QgZHJtX2RldmljZSAqZGV2LAog
CiAJb21hcF9wbGFuZV9pbnN0YWxsX3Byb3BlcnRpZXMocGxhbmUsICZwbGFuZS0+YmFzZSk7CiAJ
ZHJtX3BsYW5lX2NyZWF0ZV96cG9zX3Byb3BlcnR5KHBsYW5lLCAwLCAwLCBudW1fcGxhbmVzIC0g
MSk7CisJZHJtX3BsYW5lX2NyZWF0ZV9hbHBoYV9wcm9wZXJ0eShwbGFuZSk7CisJZHJtX3BsYW5l
X2NyZWF0ZV9ibGVuZF9tb2RlX3Byb3BlcnR5KHBsYW5lLCBCSVQoRFJNX01PREVfQkxFTkRfUFJF
TVVMVEkpIHwKKwkJCQkJICAgICBCSVQoRFJNX01PREVfQkxFTkRfQ09WRVJBR0UpKTsKIAogCXJl
dHVybiBwbGFuZTsKIAotLSAKMi4xNy4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5m
cmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0
aW5mby9kcmktZGV2ZWw=
