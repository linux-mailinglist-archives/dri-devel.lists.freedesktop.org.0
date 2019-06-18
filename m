Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 326484B29B
	for <lists+dri-devel@lfdr.de>; Wed, 19 Jun 2019 09:10:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 394096E29E;
	Wed, 19 Jun 2019 07:10:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from inva020.nxp.com (inva020.nxp.com [92.121.34.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B48046E185
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jun 2019 13:30:48 +0000 (UTC)
Received: from inva020.nxp.com (localhost [127.0.0.1])
 by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 560CF1A03B3;
 Tue, 18 Jun 2019 15:30:47 +0200 (CEST)
Received: from inva024.eu-rdc02.nxp.com (inva024.eu-rdc02.nxp.com
 [134.27.226.22])
 by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 48EBD1A03AB;
 Tue, 18 Jun 2019 15:30:47 +0200 (CEST)
Received: from fsr-ub1664-046.ea.freescale.net
 (fsr-ub1664-046.ea.freescale.net [10.171.96.34])
 by inva024.eu-rdc02.nxp.com (Postfix) with ESMTP id 353A020633;
 Tue, 18 Jun 2019 15:30:47 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by fsr-ub1664-046.ea.freescale.net (Postfix) with ESMTP id 096CB55B2;
 Tue, 18 Jun 2019 16:30:47 +0300 (EEST)
Received: from fsr-ub1664-046.ea.freescale.net ([127.0.0.1])
 by localhost (fsr-ub1664-046.ea.freescale.net [127.0.0.1]) (amavisd-new,
 port 10032)
 with ESMTP id eRSH-LX3U0vf; Tue, 18 Jun 2019 16:30:46 +0300 (EEST)
Received: from localhost (localhost [127.0.0.1])
 by fsr-ub1664-046.ea.freescale.net (Postfix) with ESMTP id 9994A4D1D;
 Tue, 18 Jun 2019 16:30:46 +0300 (EEST)
X-Virus-Scanned: amavisd-new at ea.freescale.net
Received: from fsr-ub1664-046.ea.freescale.net ([127.0.0.1])
 by localhost (fsr-ub1664-046.ea.freescale.net [127.0.0.1]) (amavisd-new,
 port 10026)
 with ESMTP id yXSNJ-mYYNVK; Tue, 18 Jun 2019 16:30:46 +0300 (EEST)
Received: from fsr-ub1664-120.ea.freescale.net
 (fsr-ub1664-120.ea.freescale.net [10.171.82.81])
 by fsr-ub1664-046.ea.freescale.net (Postfix) with ESMTP id 5A86855B1;
 Tue, 18 Jun 2019 16:30:46 +0300 (EEST)
From: Robert Chiras <robert.chiras@nxp.com>
To: Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Subject: [PATCH v2 1/2] dt-bindings: display: panel: Add support for Raydium
 RM67191 panel
Date: Tue, 18 Jun 2019 16:30:45 +0300
Message-Id: <1560864646-1468-2-git-send-email-robert.chiras@nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1560864646-1468-1-git-send-email-robert.chiras@nxp.com>
References: <1560864646-1468-1-git-send-email-robert.chiras@nxp.com>
MIME-Version: 1.0
X-Virus-Scanned: ClamAV using ClamSMTP
X-Mailman-Approved-At: Wed, 19 Jun 2019 07:10:14 +0000
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
Cc: Robert Chiras <robert.chiras@nxp.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-imx@nxp.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QWRkIGR0LWJpbmRpbmdzIGRvY3VtZW50YXRpb24gZm9yIFJheWRpdW0gUk02NzE5MSBEU0kgcGFu
ZWwuCgpTaWduZWQtb2ZmLWJ5OiBSb2JlcnQgQ2hpcmFzIDxyb2JlcnQuY2hpcmFzQG54cC5jb20+
Ci0tLQogLi4uL2JpbmRpbmdzL2Rpc3BsYXkvcGFuZWwvcmF5ZGl1bSxybTY3MTkxLnR4dCAgICAg
fCA0MyArKysrKysrKysrKysrKysrKysrKysrCiAxIGZpbGUgY2hhbmdlZCwgNDMgaW5zZXJ0aW9u
cygrKQogY3JlYXRlIG1vZGUgMTAwNjQ0IERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5n
cy9kaXNwbGF5L3BhbmVsL3JheWRpdW0scm02NzE5MS50eHQKCmRpZmYgLS1naXQgYS9Eb2N1bWVu
dGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9wYW5lbC9yYXlkaXVtLHJtNjcxOTEu
dHh0IGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvcGFuZWwvcmF5
ZGl1bSxybTY3MTkxLnR4dApuZXcgZmlsZSBtb2RlIDEwMDY0NAppbmRleCAwMDAwMDAwLi4wOTUy
NjEwCi0tLSAvZGV2L251bGwKKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdz
L2Rpc3BsYXkvcGFuZWwvcmF5ZGl1bSxybTY3MTkxLnR4dApAQCAtMCwwICsxLDQzIEBACitSYXlk
aXVtIFJNNjcxNzEgT0xFRCBMQ0QgcGFuZWwgd2l0aCBNSVBJLURTSSBwcm90b2NvbAorCitSZXF1
aXJlZCBwcm9wZXJ0aWVzOgorLSBjb21wYXRpYmxlOiAJCSJyYXlkaXVtLHJtNjcxOTEiCistIHJl
ZzoJCQl2aXJ0dWFsIGNoYW5uZWwgZm9yIE1JUEktRFNJIHByb3RvY29sCisJCQltdXN0IGJlIDww
PgorLSBkc2ktbGFuZXM6CQludW1iZXIgb2YgRFNJIGxhbmVzIHRvIGJlIHVzZWQKKwkJCW11c3Qg
YmUgPDM+IG9yIDw0PgorLSBwb3J0OiAJCWlucHV0IHBvcnQgbm9kZSB3aXRoIGVuZHBvaW50IGRl
ZmluaXRpb24gYXMKKwkJCWRlZmluZWQgaW4gRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRp
bmdzL2dyYXBoLnR4dDsKKwkJCXRoZSBpbnB1dCBwb3J0IHNob3VsZCBiZSBjb25uZWN0ZWQgdG8g
YSBNSVBJLURTSSBkZXZpY2UKKwkJCWRyaXZlcgorCitPcHRpb25hbCBwcm9wZXJ0aWVzOgorLSBy
ZXNldC1ncGlvczoJCWEgR1BJTyBzcGVjIGZvciB0aGUgUlNUX0IgR1BJTyBwaW4KKy0gcGluY3Ry
bC0wCQlwaGFuZGxlIHRvIHRoZSBwaW4gc2V0dGluZ3MgZm9yIHRoZSByZXNldCBwaW4KKy0gd2lk
dGgtbW06CQlwaHlzaWNhbCBwYW5lbCB3aWR0aCBbbW1dCistIGhlaWdodC1tbToJCXBoeXNpY2Fs
IHBhbmVsIGhlaWdodCBbbW1dCistIGRpc3BsYXktdGltaW5nczoJdGltaW5ncyBmb3IgdGhlIGNv
bm5lY3RlZCBwYW5lbCBhY2NvcmRpbmcgdG8gWzFdCistIHZpZGVvLW1vZGU6CQkwIC0gYnVyc3Qt
bW9kZQorCQkJMSAtIG5vbi1idXJzdCB3aXRoIHN5bmMgZXZlbnQKKwkJCTIgLSBub24tYnVyc3Qg
d2l0aCBzeW5jIHB1bHNlCisKK1sxXTogRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdz
L2Rpc3BsYXkvcGFuZWwvZGlzcGxheS10aW1pbmcudHh0CisKK0V4YW1wbGU6CisKKwlwYW5lbEAw
IHsKKwkJY29tcGF0aWJsZSA9ICJyYXlkaXVtLHJtNjcxOTEiOworCQlyZWcgPSA8MD47CisJCXBp
bmN0cmwtMCA9IDwmcGluY3RybF9taXBpX2RzaV8wXzFfZW4+OworCQlwaW5jdHJsLW5hbWVzID0g
ImRlZmF1bHQiOworCQlyZXNldC1ncGlvcyA9IDwmZ3BpbzEgNyBHUElPX0FDVElWRV9MT1c+Owor
CQlkc2ktbGFuZXMgPSA8ND47CisJCXdpZHRoLW1tID0gPDY4PjsKKwkJaGVpZ2h0LW1tID0gPDEy
MT47CisKKwkJcG9ydCB7CisJCQlwYW5lbF9pbjogZW5kcG9pbnQgeworCQkJCXJlbW90ZS1lbmRw
b2ludCA9IDwmbWlwaV9vdXQ+OworCQkJfTsKKwkJfTsKKwl9OwotLSAKMi43LjQKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5n
IGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVk
ZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
