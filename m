Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D6CAD0A35
	for <lists+dri-devel@lfdr.de>; Wed,  9 Oct 2019 10:52:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D21C26E935;
	Wed,  9 Oct 2019 08:52:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9453C6E935
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Oct 2019 08:52:07 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id x998q3OP025343;
 Wed, 9 Oct 2019 03:52:03 -0500
Received: from DFLE103.ent.ti.com (dfle103.ent.ti.com [10.64.6.24])
 by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x998q3OH073709
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Wed, 9 Oct 2019 03:52:03 -0500
Received: from DFLE105.ent.ti.com (10.64.6.26) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Wed, 9 Oct
 2019 03:52:01 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Wed, 9 Oct 2019 03:52:01 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id x998q1dY099284;
 Wed, 9 Oct 2019 03:52:01 -0500
From: Jean-Jacques Hiblot <jjhiblot@ti.com>
To: <jacek.anaszewski@gmail.com>, <pavel@ucw.cz>, <sre@kernel.org>,
 <robh+dt@kernel.org>, <mark.rutland@arm.com>, <lee.jones@linaro.org>,
 <daniel.thompson@linaro.org>
Subject: [PATCH v10 4/6] dts-bindings: leds: Document the naming requirement
 for LED properties
Date: Wed, 9 Oct 2019 10:51:25 +0200
Message-ID: <20191009085127.22843-5-jjhiblot@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191009085127.22843-1-jjhiblot@ti.com>
References: <20191009085127.22843-1-jjhiblot@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ti.com; s=ti-com-17Q1; t=1570611123;
 bh=fC04mwblTajTVnvmoWMuLWLDn77q7UtTpBvMGssifP0=;
 h=From:To:CC:Subject:Date:In-Reply-To:References;
 b=m6J/yf6Yln5vRgh1xPXofEaMM4YH5h7VUj3yMlhagBLBREZEUPX5HV4ATAJ32LCVH
 a8VIyIC+KyV4srOS04PoevmYcsn5/HZPLHFnFvN44OXfNuVAsyB3ZYx+KSpJUR9HsO
 y7GpCbgP0jbFCGOvSTw/vzQcUVOek4V3cTXW4Zko=
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, tomi.valkeinen@ti.com, dmurphy@ti.com,
 Jean-Jacques Hiblot <jjhiblot@ti.com>, linux-leds@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

TEVEIHByb3BlcnRpZXMgbXVzdCBiZSBuYW1lZCAibGVkcyIgaW4gdGhlIHNhbWUgd2F5IHRoYXQg
UFdNLCBjbG9ja3Mgb3IKUEhZIHByb3BlcnRpZXMgYXJlIG5hbWVzIHJlc3BlY3RpdmVseSAicHdt
cyIsICJjbG9ja3MiIGFuZCAicGh5cyIuCgpDYzogZGV2aWNldHJlZUB2Z2VyLmtlcm5lbC5vcmcK
U2lnbmVkLW9mZi1ieTogSmVhbi1KYWNxdWVzIEhpYmxvdCA8ampoaWJsb3RAdGkuY29tPgotLS0K
IC4uLi9kZXZpY2V0cmVlL2JpbmRpbmdzL2xlZHMvY29tbW9uLnR4dCAgICAgICB8IDIwICsrKysr
KysrKysrKysrKystLS0KIDEgZmlsZSBjaGFuZ2VkLCAxNyBpbnNlcnRpb25zKCspLCAzIGRlbGV0
aW9ucygtKQoKZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9s
ZWRzL2NvbW1vbi50eHQgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbGVkcy9j
b21tb24udHh0CmluZGV4IDlmYTZmOTc5NWQ1MC4uMzFiOGMxZjY4ZDI3IDEwMDY0NAotLS0gYS9E
b2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbGVkcy9jb21tb24udHh0CisrKyBiL0Rv
Y3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9sZWRzL2NvbW1vbi50eHQKQEAgLTEwLDYg
KzEwLDkgQEAgY2FuIGluZmx1ZW5jZSB0aGUgd2F5IG9mIHRoZSBMRUQgZGV2aWNlIGluaXRpYWxp
emF0aW9uLCB0aGUgTEVEIGNvbXBvbmVudHMKIGhhdmUgdG8gYmUgdGlnaHRseSBjb3VwbGVkIHdp
dGggdGhlIExFRCBkZXZpY2UgYmluZGluZy4gVGhleSBhcmUgcmVwcmVzZW50ZWQKIGJ5IGNoaWxk
IG5vZGVzIG9mIHRoZSBwYXJlbnQgTEVEIGRldmljZSBiaW5kaW5nLgogCitMRUQgcHJvcGVydGll
cyBzaG91bGQgYmUgbmFtZWQgImxlZHMiLiBUaGUgZXhhY3QgbWVhbmluZyBvZiBlYWNoIGxlZHMK
K3Byb3BlcnR5IG11c3QgYmUgZG9jdW1lbnRlZCBpbiB0aGUgZGV2aWNlIHRyZWUgYmluZGluZyBm
b3IgZWFjaCBkZXZpY2UuCisKIAogT3B0aW9uYWwgcHJvcGVydGllcyBmb3IgY2hpbGQgbm9kZXM6
CiAtIGxlZC1zb3VyY2VzIDogTGlzdCBvZiBkZXZpY2UgY3VycmVudCBvdXRwdXRzIHRoZSBMRUQg
aXMgY29ubmVjdGVkIHRvLiBUaGUKQEAgLTE2NSw5ICsxNjgsMjAgQEAgbGVkLWNvbnRyb2xsZXJA
MzAgewogCQlmdW5jdGlvbi1lbnVtZXJhdG9yID0gPDI+OwogICAgICAgICB9OwogCi0gICAgICAg
IGxlZEAzIHsKKyAgICAgICAgYmtsX2xlZDA6IGxlZEAzIHsKIAkJcmVnID0gPDM+OwotCQlmdW5j
dGlvbiA9IExFRF9GVU5DVElPTl9JTkRJQ0FUT1I7Ci0JCWZ1bmN0aW9uLWVudW1lcmF0b3IgPSA8
Mz47CisJCWZ1bmN0aW9uID0gTEVEX0ZVTkNUSU9OX0JBQ0tMSUdIVDsKKwkJZnVuY3Rpb24tZW51
bWVyYXRvciA9IDwxPjsKICAgICAgICAgfTsKKworICAgICAgICBia2xfbGVkMTogbGVkQDQgewor
CQlyZWcgPSA8ND47CisJCWZ1bmN0aW9uID0gTEVEX0ZVTkNUSU9OX0JBQ0tMSUdIVDsKKwkJZnVu
Y3Rpb24tZW51bWVyYXRvciA9IDwyPjsKKyAgICAgICAgfTsKK307CisKKworYmFja2xpZ2h0QDQw
IHsKKwlsZWRzID0gPCZia2xfbGVkMD4gLCA8JmJrbF9sZWQxPjsKIH07Ci0tIAoyLjE3LjEKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBt
YWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3Rz
LmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
