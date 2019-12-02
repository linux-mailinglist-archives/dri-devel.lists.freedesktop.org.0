Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F7E410EF9F
	for <lists+dri-devel@lfdr.de>; Mon,  2 Dec 2019 19:57:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 97C8A898FA;
	Mon,  2 Dec 2019 18:57:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E159A898FA
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Dec 2019 18:57:42 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
 by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id xB2IvZEH037270;
 Mon, 2 Dec 2019 12:57:35 -0600
Received: from DFLE105.ent.ti.com (dfle105.ent.ti.com [10.64.6.26])
 by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id xB2IvZae129273;
 Mon, 2 Dec 2019 12:57:35 -0600
Received: from DFLE105.ent.ti.com (10.64.6.26) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Mon, 2 Dec
 2019 12:57:32 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Mon, 2 Dec 2019 12:57:32 -0600
Received: from jadmar.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id xB2IvUI3057431;
 Mon, 2 Dec 2019 12:57:30 -0600
From: Jyri Sarha <jsarha@ti.com>
To: <dri-devel@lists.freedesktop.org>, <tony@atomide.com>,
 <bcousson@baylibre.com>, <devicetree@vger.kernel.org>,
 <linux-omap@vger.kernel.org>
Subject: [PATCH] ARM: dts: am335x-evm: Use drm simple-panel instead of
 tilcdc-panel
Date: Mon, 2 Dec 2019 20:57:29 +0200
Message-ID: <20191202185729.12921-1-jsarha@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ti.com; s=ti-com-17Q1; t=1575313055;
 bh=DWBbhnE6qXaM66hNWm292SwxJiicsKfBcrA4AX4NS6A=;
 h=From:To:CC:Subject:Date;
 b=eTB7v2lfyPJq2tA3EeQNWlMzZuvcPnGltujoflXNiLqLfDC+twyqJxeCYM3QCV3Jr
 O9vPOq7gq7sm/0hUn+I1c5R4jRtNOOXNdgtsGGnrWzYZZ8+DhKBTj0VlBp9fDPPISw
 20bw3sdBfQyqEUOU0HzqfkJvAq4Oa237RyTbm2ZU=
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
Cc: peter.ujfalusi@ti.com, tomi.valkeinen@ti.com,
 laurent.pinchart@ideasonboard.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

TW92ZSB0byB1c2UgdGhlIG5ldyBkcm0gcGFuZWwgc3VwcG9ydCBpbiB0aWxjZGMgdG9nZXRoZXIg
d2l0aCBhZGRlZAoidGZjLHM5NzAwcnR3djQzdHItMDFiIi1wYW5lbCBzdXBwb3J0IGluIGRybSBw
YW5lbC1zaW1wbGUuCgpTaWduZWQtb2ZmLWJ5OiBKeXJpIFNhcmhhIDxqc2FyaGFAdGkuY29tPgpS
ZXZpZXdlZC1ieTogVG9taSBWYWxrZWluZW4gPHRvbWkudmFsa2VpbmVuQHRpLmNvbT4KLS0tCiJ0
ZmMsczk3MDBydHd2NDN0ci0wMWIiIGluIHBhbmVsLXNpbXBsZSBoYXMgYmVlbiBpbiBmb3Igc29t
ZSB0aW1lIG5vdwpzbyBpdCBpcyBhYm91dCB0aW1lIHRvIGdldCB0aGlzIGluIHRvby4KCiBhcmNo
L2FybS9ib290L2R0cy9hbTMzNXgtZXZtLmR0cyB8IDQ0ICsrKysrKysrKysrKystLS0tLS0tLS0t
LS0tLS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgMTggaW5zZXJ0aW9ucygrKSwgMjYgZGVsZXRpb25z
KC0pCgpkaWZmIC0tZ2l0IGEvYXJjaC9hcm0vYm9vdC9kdHMvYW0zMzV4LWV2bS5kdHMgYi9hcmNo
L2FybS9ib290L2R0cy9hbTMzNXgtZXZtLmR0cwppbmRleCBhMDAxNDU3MDVjOWIuLjBlMjg2YTFj
OWNjNSAxMDA2NDQKLS0tIGEvYXJjaC9hcm0vYm9vdC9kdHMvYW0zMzV4LWV2bS5kdHMKKysrIGIv
YXJjaC9hcm0vYm9vdC9kdHMvYW0zMzV4LWV2bS5kdHMKQEAgLTExMyw3ICsxMTMsNyBAQAogCQl9
OwogCX07CiAKLQliYWNrbGlnaHQgeworCWJhY2tsaWdodDogYmFja2xpZ2h0IHsKIAkJY29tcGF0
aWJsZSA9ICJwd20tYmFja2xpZ2h0IjsKIAkJcHdtcyA9IDwmZWNhcDAgMCA1MDAwMCAwPjsKIAkJ
YnJpZ2h0bmVzcy1sZXZlbHMgPSA8MCA1MSA1MyA1NiA2MiA3NSAxMDEgMTUyIDI1NT47CkBAIC0x
MjEsMzUgKzEyMSwxOSBAQAogCX07CiAKIAlwYW5lbCB7Ci0JCWNvbXBhdGlibGUgPSAidGksdGls
Y2RjLHBhbmVsIjsKKwkJY29tcGF0aWJsZSA9ICJ0ZmMsczk3MDBydHd2NDN0ci0wMWIiOworCiAJ
CXN0YXR1cyA9ICJva2F5IjsKKwogCQlwaW5jdHJsLW5hbWVzID0gImRlZmF1bHQiOwogCQlwaW5j
dHJsLTAgPSA8JmxjZF9waW5zX3MwPjsKLQkJcGFuZWwtaW5mbyB7Ci0JCQlhYy1iaWFzICAgICAg
ICAgICA9IDwyNTU+OwotCQkJYWMtYmlhcy1pbnRycHQgICAgPSA8MD47Ci0JCQlkbWEtYnVyc3Qt
c3ogICAgICA9IDwxNj47Ci0JCQlicHAgICAgICAgICAgICAgICA9IDwzMj47Ci0JCQlmZGQgICAg
ICAgICAgICAgICA9IDwweDgwPjsKLQkJCXN5bmMtZWRnZSAgICAgICAgID0gPDA+OwotCQkJc3lu
Yy1jdHJsICAgICAgICAgPSA8MT47Ci0JCQlyYXN0ZXItb3JkZXIgICAgICA9IDwwPjsKLQkJCWZp
Zm8tdGggICAgICAgICAgID0gPDA+OwotCQl9OwogCi0JCWRpc3BsYXktdGltaW5ncyB7Ci0JCQk4
MDB4NDgwcDYyIHsKLQkJCQljbG9jay1mcmVxdWVuY3kgPSA8MzAwMDAwMDA+OwotCQkJCWhhY3Rp
dmUgPSA8ODAwPjsKLQkJCQl2YWN0aXZlID0gPDQ4MD47Ci0JCQkJaGZyb250LXBvcmNoID0gPDM5
PjsKLQkJCQloYmFjay1wb3JjaCA9IDwzOT47Ci0JCQkJaHN5bmMtbGVuID0gPDQ3PjsKLQkJCQl2
YmFjay1wb3JjaCA9IDwyOT47Ci0JCQkJdmZyb250LXBvcmNoID0gPDEzPjsKLQkJCQl2c3luYy1s
ZW4gPSA8Mj47Ci0JCQkJaHN5bmMtYWN0aXZlID0gPDE+OwotCQkJCXZzeW5jLWFjdGl2ZSA9IDwx
PjsKKwkJYmFja2xpZ2h0ID0gPCZiYWNrbGlnaHQ+OworCQlwb3J0cyB7CisJCQlwb3J0IHsKKwkJ
CQlwYW5lbF8wOiBlbmRwb2ludEAwIHsKKwkJCQkJcmVtb3RlLWVuZHBvaW50ID0gPCZsY2RjXzA+
OworCQkJCX07CiAJCQl9OwogCQl9OwogCX07CkBAIC01MjUsNiArNTA5LDE0IEBACiAJc3RhdHVz
ID0gIm9rYXkiOwogCiAJYmx1ZS1hbmQtcmVkLXdpcmluZyA9ICJjcm9zc2VkIjsKKworCXBvcnRz
IHsKKwkJcG9ydCB7CisJCQlsY2RjXzA6IGVuZHBvaW50QDAgeworCQkJCXJlbW90ZS1lbmRwb2lu
dCA9IDwmcGFuZWxfMD47CisJCQl9OworCQl9OworCX07CiB9OwogCiAmZWxtIHsKLS0gClRleGFz
IEluc3RydW1lbnRzIEZpbmxhbmQgT3ksIFBvcmtrYWxhbmthdHUgMjIsIDAwMTgwIEhlbHNpbmtp
LiBZLXR1bm51cy9CdXNpbmVzcyBJRDogMDYxNTUyMS00LiBLb3RpcGFpa2thL0RvbWljaWxlOiBI
ZWxzaW5raQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
ZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0
dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
