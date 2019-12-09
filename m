Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A90E1170CE
	for <lists+dri-devel@lfdr.de>; Mon,  9 Dec 2019 16:45:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D5616E4B3;
	Mon,  9 Dec 2019 15:45:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 130736E4B3
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Dec 2019 15:45:44 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
 by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id xB9Fjhxn013555;
 Mon, 9 Dec 2019 09:45:43 -0600
Received: from DFLE103.ent.ti.com (dfle103.ent.ti.com [10.64.6.24])
 by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id xB9FjgrI079227
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Mon, 9 Dec 2019 09:45:43 -0600
Received: from DFLE112.ent.ti.com (10.64.6.33) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Mon, 9 Dec
 2019 09:45:42 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Mon, 9 Dec 2019 09:45:42 -0600
Received: from jadmar.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id xB9Fjf5I112084;
 Mon, 9 Dec 2019 09:45:41 -0600
From: Jyri Sarha <jsarha@ti.com>
To: <dri-devel@lists.freedesktop.org>, <devicetree@vger.kernel.org>
Subject: [PATCH v2 1/2] dt-bindings: display: DT schema for rocktech,
 rk101ii01d-ct panel
Date: Mon, 9 Dec 2019 17:45:40 +0200
Message-ID: <60034f9cd4580bf3b7c8c5c87bb9247fdc3f345a.1575903975.git.jsarha@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1575903975.git.jsarha@ti.com>
References: <cover.1575903975.git.jsarha@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ti.com; s=ti-com-17Q1; t=1575906343;
 bh=4Q9QtNIx1DUqHBCmQZLSWE7fPvofI6doebRsNcHjlSg=;
 h=From:To:CC:Subject:Date:In-Reply-To:References;
 b=YmoFYuB9zYYo0cCGVVwEoN5RKzmoLZ5c+7qXgeSutFRgm95mpUuwrX5gxGvXI0C+X
 wzlQ06FjXwljk2eRjJp6uV26vbVTAW1y9m9uTgdkFEZ0z7n7cd4mwHkSaa0X1c0FcR
 rvNg1VGZ3VkozNxBI0HtVTu+T+1Y9wYkOmL8a9DQ=
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
Cc: tomi.valkeinen@ti.com, thierry.reding@gmail.com, robh+dt@kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QWRkIERUIHNjaGVtYSBiaW5kaW5nIGZvciBSb2NrdGVjaCBEaXNwbGF5cyBMaW1pdGVkIFJLMTAx
SUkwMUQtQ1QKMTAuMSIgVEZUIDEyODB4ODAwIFBpeGVscyB3aXRoIExWRFMgaW50ZXJmYWNlLCBM
RUQgQmFja2xpZ2h0IGFuZApjYXBhY2l0aXZlIHRvdWNoIHBhbmVsLgoKU2lnbmVkLW9mZi1ieTog
SnlyaSBTYXJoYSA8anNhcmhhQHRpLmNvbT4KLS0tCiAuLi4vZGlzcGxheS9wYW5lbC9yb2NrdGVj
aCxyazEwMWlpMDFkLWN0LnlhbWwgfCA0OCArKysrKysrKysrKysrKysrKysrCiAxIGZpbGUgY2hh
bmdlZCwgNDggaW5zZXJ0aW9ucygrKQogY3JlYXRlIG1vZGUgMTAwNjQ0IERvY3VtZW50YXRpb24v
ZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L3BhbmVsL3JvY2t0ZWNoLHJrMTAxaWkwMWQtY3Qu
eWFtbAoKZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNw
bGF5L3BhbmVsL3JvY2t0ZWNoLHJrMTAxaWkwMWQtY3QueWFtbCBiL0RvY3VtZW50YXRpb24vZGV2
aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L3BhbmVsL3JvY2t0ZWNoLHJrMTAxaWkwMWQtY3QueWFt
bApuZXcgZmlsZSBtb2RlIDEwMDY0NAppbmRleCAwMDAwMDAwMDAwMDAuLmIzN2Y4OWNhNGJkMAot
LS0gL2Rldi9udWxsCisrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNw
bGF5L3BhbmVsL3JvY2t0ZWNoLHJrMTAxaWkwMWQtY3QueWFtbApAQCAtMCwwICsxLDQ4IEBACisj
IFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiAoR1BMLTIuMCBPUiBCU0QtMi1DbGF1c2UpCislWUFN
TCAxLjIKKy0tLQorJGlkOiBodHRwOi8vZGV2aWNldHJlZS5vcmcvc2NoZW1hcy9kaXNwbGF5L3Bh
bmVsL3JvY2t0ZWNoLHJrMTAxaWkwMWQtY3QueWFtbCMKKyRzY2hlbWE6IGh0dHA6Ly9kZXZpY2V0
cmVlLm9yZy9tZXRhLXNjaGVtYXMvY29yZS55YW1sIworCit0aXRsZTogUm9ja3RlY2ggRGlzcGxh
eXMgTHRkIFJLMTAxSUkwMUQtQ1QgMTAuMSIgVEZUIDEyODB4ODAwIFBpeGVscworCittYWludGFp
bmVyczoKKyAgLSBKeXJpIFNhcmhhIDxqc2FyaGFAdGkuY29tPgorICAtIFRoaWVycnkgUmVkaW5n
IDx0aGllcnJ5LnJlZGluZ0BnbWFpbC5jb20+CisKK2FsbE9mOgorICAtICRyZWY6IHBhbmVsLWNv
bW1vbi55YW1sIworCitkZXNjcmlwdGlvbjogfAorICBSb2NrdGVjaCBEaXNwbGF5cyBMaW1pdGVk
IFJLMTAxSUkwMUQtQ1QgMTAuMSIgVEZUIDEyODB4ODAwIFBpeGVscworICB3aXRoIExWRFMgaW50
ZXJmYWNlLCBMRUQgQmFja2xpZ2h0IGFuZCBjYXBhY2l0aXZlIHRvdWNoIHBhbmVsLiBGb3IKKyAg
dG91Y2ggc2NyZWVuIGRldGFpbHMgc2VlICJnb29kaXgsZ3Q5MjgiIGluOgorICBEb2N1bWVudGF0
aW9uL2RldmljZXRyZWUvYmluZGluZ3MvaW5wdXQvdG91Y2hzY3JlZW4vZ29vZGl4LnR4dAorCitw
cm9wZXJ0aWVzOgorICBjb21wYXRpYmxlOgorICAgIGNvbnN0OiByb2NrdGVjaCxyazEwMWlpMDFk
LWN0CisKKyAgcmVzZXQtZ3Bpb3M6IHRydWUKKyAgZW5hYmxlLWdwaW9zOiB0cnVlCisgIGJhY2ts
aWdodDogdHJ1ZQorICBwb3J0OiB0cnVlCisKK3JlcXVpcmVkOgorICAtIGNvbXBhdGlibGUKKyAg
LSBwb3dlci1zdXBwbHkKKworZXhhbXBsZXM6CisgIC0gfAorICAgICAgICBkaXNwbGF5MCB7Cisg
ICAgICAgICAgICAgICAgY29tcGF0aWJsZSA9ICJyb2NrdGVjaCxyazEwMWlpMDFkLWN0IjsKKyAg
ICAgICAgICAgICAgICBiYWNrbGlnaHQgPSA8JmxjZF9ibD47CisgICAgICAgICAgICAgICAgZW5h
YmxlLWdwaW9zID0gPCZwY2E5NTU1IDggR1BJT19BQ1RJVkVfSElHSD47CisgICAgICAgICAgICAg
ICAgcG93ZXItc3VwcGx5ID0gPCZkdW1teV9zdXBwbHk+OworCisgICAgICAgICAgICAgICAgcG9y
dCB7CisgICAgICAgICAgICAgICAgICAgICAgICBsY2RfaW4wOiBlbmRwb2ludCB7CisgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIHJlbW90ZS1lbmRwb2ludCA9IDwmb2xkaV9vdXQwPjsK
KyAgICAgICAgICAgICAgICAgICAgICAgIH07CisgICAgICAgICAgICAgICAgfTsKKyAgICAgICAg
fTsKLS0gClRleGFzIEluc3RydW1lbnRzIEZpbmxhbmQgT3ksIFBvcmtrYWxhbmthdHUgMjIsIDAw
MTgwIEhlbHNpbmtpLiBZLXR1bm51cy9CdXNpbmVzcyBJRDogMDYxNTUyMS00LiBLb3RpcGFpa2th
L0RvbWljaWxlOiBIZWxzaW5raQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8v
ZHJpLWRldmVs
