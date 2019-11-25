Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C5E47108E92
	for <lists+dri-devel@lfdr.de>; Mon, 25 Nov 2019 14:11:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 44B7189FC3;
	Mon, 25 Nov 2019 13:11:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ADA0389FC9
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Nov 2019 13:11:20 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
 by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id xAPDBFJK027628;
 Mon, 25 Nov 2019 07:11:15 -0600
Received: from DLEE103.ent.ti.com (dlee103.ent.ti.com [157.170.170.33])
 by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id xAPDBESQ078281
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Mon, 25 Nov 2019 07:11:15 -0600
Received: from DLEE108.ent.ti.com (157.170.170.38) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Mon, 25
 Nov 2019 07:11:14 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Mon, 25 Nov 2019 07:11:14 -0600
Received: from deskari.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id xAPDB7rm113038;
 Mon, 25 Nov 2019 07:11:12 -0600
From: Tomi Valkeinen <tomi.valkeinen@ti.com>
To: <linux-omap@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <tony@atomide.com>
Subject: [PATCH 3/4] ARM: dts: dra76-evm: add HDMI output
Date: Mon, 25 Nov 2019 15:10:59 +0200
Message-ID: <20191125131100.9839-3-tomi.valkeinen@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191125131100.9839-1-tomi.valkeinen@ti.com>
References: <20191125131100.9839-1-tomi.valkeinen@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ti.com; s=ti-com-17Q1; t=1574687475;
 bh=HLyUGkQcTk4X5+NEK1dNs6pfu56MCJ/7tTgfWWwUJFg=;
 h=From:To:CC:Subject:Date:In-Reply-To:References;
 b=aIR/PgJCG2ihazg8uoli5c1ohRYege4QTb4CznVWi05lo3YjQx2BRzOODVyOH5WgP
 yyJkXIs9Ft64I5aPX3WhYpnConX2GPM2euaI5PlxMtKBHsLxaUI1616HILb1Gn8pe3
 uEPJj6llwzFJPuJ05o8lZMU45WVxLzTgL7AOsP8o=
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
Cc: mark.rutland@arm.com, Tomi Valkeinen <tomi.valkeinen@ti.com>,
 robh+dt@kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QWRkIERSQTc2IEVWTSBIRE1JIG91dHB1dCBmb3IgdGhlIGJhc2UgYm9hcmQuCgpTaWduZWQtb2Zm
LWJ5OiBUb21pIFZhbGtlaW5lbiA8dG9taS52YWxrZWluZW5AdGkuY29tPgotLS0KIGFyY2gvYXJt
L2Jvb3QvZHRzL2RyYTc2LWV2bS5kdHMgfCA2NiArKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysKIDEgZmlsZSBjaGFuZ2VkLCA2NiBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvYXJj
aC9hcm0vYm9vdC9kdHMvZHJhNzYtZXZtLmR0cyBiL2FyY2gvYXJtL2Jvb3QvZHRzL2RyYTc2LWV2
bS5kdHMKaW5kZXggMWZiNmYxM2ZiNWUyLi44NmEzZTc5OTA5YTggMTAwNjQ0Ci0tLSBhL2FyY2gv
YXJtL2Jvb3QvZHRzL2RyYTc2LWV2bS5kdHMKKysrIGIvYXJjaC9hcm0vYm9vdC9kdHMvZHJhNzYt
ZXZtLmR0cwpAQCAtMTMsNiArMTMsMTMgQEAKIAltb2RlbCA9ICJUSSBEUkE3NjIgRVZNIjsKIAlj
b21wYXRpYmxlID0gInRpLGRyYTc2LWV2bSIsICJ0aSxkcmE3NjIiLCAidGksZHJhNyI7CiAKKwlh
bGlhc2VzIHsKKwkJZGlzcGxheTAgPSAmaGRtaTA7CisKKwkJc291bmQwID0gJnNvdW5kMDsKKwkJ
c291bmQxID0gJmhkbWk7CisJfTsKKwogCW1lbW9yeUAwIHsKIAkJZGV2aWNlX3R5cGUgPSAibWVt
b3J5IjsKIAkJcmVnID0gPDB4MCAweDgwMDAwMDAwIDB4MCAweDgwMDAwMDAwPjsKQEAgLTExNiw2
ICsxMjMsNDggQEAKIAkJcmVndWxhdG9yLW1pbi1taWNyb3ZvbHQgPSA8MTgwMDAwMD47CiAJCXJl
Z3VsYXRvci1tYXgtbWljcm92b2x0ID0gPDE4MDAwMDA+OwogCX07CisKKwloZG1pMDogY29ubmVj
dG9yIHsKKwkJY29tcGF0aWJsZSA9ICJoZG1pLWNvbm5lY3RvciI7CisJCWxhYmVsID0gImhkbWki
OworCisJCXR5cGUgPSAiYSI7CisKKwkJcG9ydCB7CisJCQloZG1pX2Nvbm5lY3Rvcl9pbjogZW5k
cG9pbnQgeworCQkJCXJlbW90ZS1lbmRwb2ludCA9IDwmdHBkMTJzMDE1X291dD47CisJCQl9Owor
CQl9OworCX07CisKKwl0cGQxMnMwMTU6IGVuY29kZXIgeworCQljb21wYXRpYmxlID0gInRpLHRw
ZDEyczAxNSI7CisKKwkJZ3Bpb3MgPSA8JmdwaW83IDMwIEdQSU9fQUNUSVZFX0hJR0g+LCAgIC8q
IGdwaW83XzMwLCBDVCBDUCBIUEQgKi8KKwkJCTwmZ3BpbzcgMzEgR1BJT19BQ1RJVkVfSElHSD4s
ICAgLyogZ3BpbzdfMzEsIExTIE9FICovCisJCQk8JmdwaW83IDEyIEdQSU9fQUNUSVZFX0hJR0g+
OyAgIC8qIGdwaW83XzEyL3NwMV9jczIsIEhQRCAqLworCisJCXBvcnRzIHsKKwkJCSNhZGRyZXNz
LWNlbGxzID0gPDE+OworCQkJI3NpemUtY2VsbHMgPSA8MD47CisKKwkJCXBvcnRAMCB7CisJCQkJ
cmVnID0gPDA+OworCisJCQkJdHBkMTJzMDE1X2luOiBlbmRwb2ludCB7CisJCQkJCXJlbW90ZS1l
bmRwb2ludCA9IDwmaGRtaV9vdXQ+OworCQkJCX07CisJCQl9OworCisJCQlwb3J0QDEgeworCQkJ
CXJlZyA9IDwxPjsKKworCQkJCXRwZDEyczAxNV9vdXQ6IGVuZHBvaW50IHsKKwkJCQkJcmVtb3Rl
LWVuZHBvaW50ID0gPCZoZG1pX2Nvbm5lY3Rvcl9pbj47CisJCQkJfTsKKwkJCX07CisJCX07CisJ
fTsKIH07CiAKICZpMmMxIHsKQEAgLTQxMSw2ICs0NjAsMjMgQEAKIAlwaHktc3VwcGx5ID0gPCZs
ZG8zX3JlZz47CiB9OwogCismZHNzIHsKKwlzdGF0dXMgPSAib2siOworCXZkZGFfdmlkZW8tc3Vw
cGx5ID0gPCZsZG81X3JlZz47Cit9OworCismaGRtaSB7CisJc3RhdHVzID0gIm9rIjsKKworCXZk
ZGEtc3VwcGx5ID0gPCZsZG8xX3JlZz47CisKKwlwb3J0IHsKKwkJaGRtaV9vdXQ6IGVuZHBvaW50
IHsKKwkJCXJlbW90ZS1lbmRwb2ludCA9IDwmdHBkMTJzMDE1X2luPjsKKwkJfTsKKwl9OworfTsK
KwogJnFzcGkgewogCXNwaS1tYXgtZnJlcXVlbmN5ID0gPDk2MDAwMDAwPjsKIAltMjVwODBAMCB7
Ci0tIApUZXhhcyBJbnN0cnVtZW50cyBGaW5sYW5kIE95LCBQb3Jra2FsYW5rYXR1IDIyLCAwMDE4
MCBIZWxzaW5raS4KWS10dW5udXMvQnVzaW5lc3MgSUQ6IDA2MTU1MjEtNC4gS290aXBhaWtrYS9E
b21pY2lsZTogSGVsc2lua2kKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNr
dG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Ry
aS1kZXZlbA==
