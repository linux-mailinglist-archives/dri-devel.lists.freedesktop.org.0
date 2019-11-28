Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 93C5410CD00
	for <lists+dri-devel@lfdr.de>; Thu, 28 Nov 2019 17:45:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E63996E862;
	Thu, 28 Nov 2019 16:45:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 76E846E862
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Nov 2019 16:45:40 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
 by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id xASGjcuD072267;
 Thu, 28 Nov 2019 10:45:38 -0600
Received: from DFLE103.ent.ti.com (dfle103.ent.ti.com [10.64.6.24])
 by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id xASGjcdh126096;
 Thu, 28 Nov 2019 10:45:38 -0600
Received: from DFLE105.ent.ti.com (10.64.6.26) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Thu, 28
 Nov 2019 10:45:36 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Thu, 28 Nov 2019 10:45:36 -0600
Received: from jadmar.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id xASGjZXQ122491;
 Thu, 28 Nov 2019 10:45:35 -0600
From: Jyri Sarha <jsarha@ti.com>
To: <dri-devel@lists.freedesktop.org>, <devicetree@vger.kernel.org>
Subject: [PATCH 1/2] dt-bindings: display: DT schema for rocktech,
 rk101ii01d-ct panel
Date: Thu, 28 Nov 2019 18:45:34 +0200
Message-ID: <bc69f06adb9e5e590ae58bdb47717699a0b404ff.1574959312.git.jsarha@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1574959312.git.jsarha@ti.com>
References: <cover.1574959312.git.jsarha@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ti.com; s=ti-com-17Q1; t=1574959538;
 bh=+cV/xaoWKni6uJVsXA8KD+nVtRVb9rRhaDXvqY781rI=;
 h=From:To:CC:Subject:Date:In-Reply-To:References;
 b=vRsb4zfdBWhOUDZnwkRRjj3FXSE+/YY12NF7BMOB8p8IBqiEslsn+LxFcTUwxQk43
 4//ruhYv2aYfNc8yYUW/0r2CcZzbwaU4qx1hTSc0UCrtCnG9/j3E1yahaOW4Stimgd
 dMfv8at3F5BeqX2jjiGYkWMTXxDN/fQQfufxESjM=
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
bApuZXcgZmlsZSBtb2RlIDEwMDY0NAppbmRleCAwMDAwMDAwMDAwMDAuLjA5Y2FlZWU4NzAxZAot
LS0gL2Rldi9udWxsCisrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNw
bGF5L3BhbmVsL3JvY2t0ZWNoLHJrMTAxaWkwMWQtY3QueWFtbApAQCAtMCwwICsxLDQ4IEBACisj
IFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiAoR1BMLTIuMCBPUiBCU0QtMi1DbGF1c2UpCislWUFN
TCAxLjIKKy0tLQorJGlkOiBodHRwOi8vZGV2aWNldHJlZS5vcmcvc2NoZW1hcy9kaXNwbGF5L3Bh
bmVsL2RsYyxkbGMwNzAweXpnLTEueWFtbCMKKyRzY2hlbWE6IGh0dHA6Ly9kZXZpY2V0cmVlLm9y
Zy9tZXRhLXNjaGVtYXMvY29yZS55YW1sIworCit0aXRsZTogUm9ja3RlY2ggRGlzcGxheXMgTHRk
IFJLMTAxSUkwMUQtQ1QgMTAuMSIgVEZUIDEyODB4ODAwIFBpeGVscworCittYWludGFpbmVyczoK
KyAgLSBKeXJpIFNhcmhhIDxqc2FyaGFAdGkuY29tPgorICAtIFRoaWVycnkgUmVkaW5nIDx0aGll
cnJ5LnJlZGluZ0BnbWFpbC5jb20+CisKK2FsbE9mOgorICAtICRyZWY6IHBhbmVsLWNvbW1vbi55
YW1sIworCitkZXNjcmlwdGlvbjogfAorICBSb2NrdGVjaCBEaXNwbGF5cyBMaW1pdGVkIFJLMTAx
SUkwMUQtQ1QgMTAuMSIgVEZUIDEyODB4ODAwIFBpeGVscworICB3aXRoIExWRFMgaW50ZXJmYWNl
LCBMRUQgQmFja2xpZ2h0IGFuZCBjYXBhY2l0aXZlIHRvdWNoIHBhbmVsLiBGb3IKKyAgdG91Y2gg
c2NyZWVuIGRldGFpbHMgc2VlICJnb29kaXgsZ3Q5MjgiIGluOgorICBEb2N1bWVudGF0aW9uL2Rl
dmljZXRyZWUvYmluZGluZ3MvaW5wdXQvdG91Y2hzY3JlZW4vZ29vZGl4LnR4dAorCitwcm9wZXJ0
aWVzOgorICBjb21wYXRpYmxlOgorICAgIGNvbnN0OiByb2NrdGVjaCxyazEwMWlpMDFkLWN0CisK
KyAgcmVzZXQtZ3Bpb3M6IHRydWUKKyAgZW5hYmxlLWdwaW9zOiB0cnVlCisgIGJhY2tsaWdodDog
dHJ1ZQorICBwb3J0OiB0cnVlCisKK3JlcXVpcmVkOgorICAtIGNvbXBhdGlibGUKKyAgLSBwb3dl
ci1zdXBwbHkKKworZXhhbXBsZXM6CisgIC0gfAorICAgICAgICBkaXNwbGF5MCB7CisgICAgICAg
ICAgICAgICAgY29tcGF0aWJsZSA9ICJyb2NrdGVjaCxyazEwMWlpMDFkLWN0IjsKKyAgICAgICAg
ICAgICAgICBiYWNrbGlnaHQgPSA8JmxjZF9ibD47CisgICAgICAgICAgICAgICAgZW5hYmxlLWdw
aW9zID0gPCZwY2E5NTU1IDggR1BJT19BQ1RJVkVfSElHSD47CisgICAgICAgICAgICAgICAgcG93
ZXItc3VwcGx5ID0gPCZkdW1teV9zdXBwbHk+OworCisgICAgICAgICAgICAgICAgcG9ydCB7Cisg
ICAgICAgICAgICAgICAgICAgICAgICBsY2RfaW4wOiBlbmRwb2ludCB7CisgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIHJlbW90ZS1lbmRwb2ludCA9IDwmb2xkaV9vdXQwPjsKKyAgICAg
ICAgICAgICAgICAgICAgICAgIH07CisgICAgICAgICAgICAgICAgfTsKKyAgICAgICAgfTsKLS0g
ClRleGFzIEluc3RydW1lbnRzIEZpbmxhbmQgT3ksIFBvcmtrYWxhbmthdHUgMjIsIDAwMTgwIEhl
bHNpbmtpLiBZLXR1bm51cy9CdXNpbmVzcyBJRDogMDYxNTUyMS00LiBLb3RpcGFpa2thL0RvbWlj
aWxlOiBIZWxzaW5raQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRl
dmVs
