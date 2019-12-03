Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DD8E10FA7E
	for <lists+dri-devel@lfdr.de>; Tue,  3 Dec 2019 10:11:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 87B166E439;
	Tue,  3 Dec 2019 09:11:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8ACEC6E439
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Dec 2019 09:11:30 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id xB39BNQ9103282;
 Tue, 3 Dec 2019 03:11:23 -0600
Received: from DLEE103.ent.ti.com (dlee103.ent.ti.com [157.170.170.33])
 by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id xB39BNM1129780;
 Tue, 3 Dec 2019 03:11:23 -0600
Received: from DLEE106.ent.ti.com (157.170.170.36) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Tue, 3 Dec
 2019 03:11:22 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE106.ent.ti.com
 (157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Tue, 3 Dec 2019 03:11:22 -0600
Received: from jadmar.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id xB39BJNg090065;
 Tue, 3 Dec 2019 03:11:20 -0600
From: Jyri Sarha <jsarha@ti.com>
To: <dri-devel@lists.freedesktop.org>, <tony@atomide.com>,
 <bcousson@baylibre.com>, <devicetree@vger.kernel.org>,
 <linux-omap@vger.kernel.org>
Subject: [PATCH v2] ARM: dts: am335x-evm: Use drm simple-panel instead of
 tilcdc-panel
Date: Tue, 3 Dec 2019 11:11:19 +0200
Message-ID: <20191203091119.3352-1-jsarha@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ti.com; s=ti-com-17Q1; t=1575364283;
 bh=Bw2S3+Umha1Z+hIKv1Ph4zlTyHuhz/OeMZsRMtvyaT0=;
 h=From:To:CC:Subject:Date;
 b=l3jVpkgGW5wzF2yD1eS723IXh3tU+ZCoftOOz2WiUYJllu/CYvU3PbYCzpvcWE8ze
 OfDSrBVnJLK0cqE/ZpTn+Mv1bLQxYgk8pAhiLArRrrf5DyOF1ghLJ85NTiDLr0xvj1
 k2KVkZkzCYrtV5WHAk4mUtkikEYb5Pc+GElyVaKM=
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
ZXZpZXdlZC1ieTogTGF1cmVudCBQaW5jaGFydCA8bGF1cmVudC5waW5jaGFydEBpZGVhc29uYm9h
cmQuY29tPgotLS0KInRmYyxzOTcwMHJ0d3Y0M3RyLTAxYiIgaW4gcGFuZWwtc2ltcGxlIGhhcyBi
ZWVuIGluIGZvciBzb21lIHRpbWUgbm93CnNvIGl0IGlzIGFib3V0IHRpbWUgdG8gZ2V0IHRoaXMg
aW4gdG9vLgoKU2luY2UgZmlyc3QgdmVyc2lvbjoKLSBkcm9wIHN0YXR1cyA9ICJva2F5IjsKLSBi
bGFuayBsaW5lIGJlZm9yZSBwb3J0IG5vZGUKLSBkcm9wIHBvcnRzIG5vZGUKLSBkcm9wIFRvbWkn
cyByZXZpZXdlZC1ieSBiZWNhdXNlIG9mIGFib3ZlIGNoYW5nZXMKLSBhZGQgTGF1cmVudCdzIHJl
dmlld2VkLWJ5CgogYXJjaC9hcm0vYm9vdC9kdHMvYW0zMzV4LWV2bS5kdHMgfCA0MCArKysrKysr
KysrKy0tLS0tLS0tLS0tLS0tLS0tLS0tLQogMSBmaWxlIGNoYW5nZWQsIDEzIGluc2VydGlvbnMo
KyksIDI3IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2FyY2gvYXJtL2Jvb3QvZHRzL2FtMzM1
eC1ldm0uZHRzIGIvYXJjaC9hcm0vYm9vdC9kdHMvYW0zMzV4LWV2bS5kdHMKaW5kZXggYTAwMTQ1
NzA1YzliLi44NGRmYzQwYWY3YzUgMTAwNjQ0Ci0tLSBhL2FyY2gvYXJtL2Jvb3QvZHRzL2FtMzM1
eC1ldm0uZHRzCisrKyBiL2FyY2gvYXJtL2Jvb3QvZHRzL2FtMzM1eC1ldm0uZHRzCkBAIC0xMTMs
NyArMTEzLDcgQEAKIAkJfTsKIAl9OwogCi0JYmFja2xpZ2h0IHsKKwliYWNrbGlnaHQ6IGJhY2ts
aWdodCB7CiAJCWNvbXBhdGlibGUgPSAicHdtLWJhY2tsaWdodCI7CiAJCXB3bXMgPSA8JmVjYXAw
IDAgNTAwMDAgMD47CiAJCWJyaWdodG5lc3MtbGV2ZWxzID0gPDAgNTEgNTMgNTYgNjIgNzUgMTAx
IDE1MiAyNTU+OwpAQCAtMTIxLDM1ICsxMjEsMTUgQEAKIAl9OwogCiAJcGFuZWwgewotCQljb21w
YXRpYmxlID0gInRpLHRpbGNkYyxwYW5lbCI7Ci0JCXN0YXR1cyA9ICJva2F5IjsKKwkJY29tcGF0
aWJsZSA9ICJ0ZmMsczk3MDBydHd2NDN0ci0wMWIiOworCiAJCXBpbmN0cmwtbmFtZXMgPSAiZGVm
YXVsdCI7CiAJCXBpbmN0cmwtMCA9IDwmbGNkX3BpbnNfczA+OwotCQlwYW5lbC1pbmZvIHsKLQkJ
CWFjLWJpYXMgICAgICAgICAgID0gPDI1NT47Ci0JCQlhYy1iaWFzLWludHJwdCAgICA9IDwwPjsK
LQkJCWRtYS1idXJzdC1zeiAgICAgID0gPDE2PjsKLQkJCWJwcCAgICAgICAgICAgICAgID0gPDMy
PjsKLQkJCWZkZCAgICAgICAgICAgICAgID0gPDB4ODA+OwotCQkJc3luYy1lZGdlICAgICAgICAg
PSA8MD47Ci0JCQlzeW5jLWN0cmwgICAgICAgICA9IDwxPjsKLQkJCXJhc3Rlci1vcmRlciAgICAg
ID0gPDA+OwotCQkJZmlmby10aCAgICAgICAgICAgPSA8MD47Ci0JCX07CisJCWJhY2tsaWdodCA9
IDwmYmFja2xpZ2h0PjsKIAotCQlkaXNwbGF5LXRpbWluZ3MgewotCQkJODAweDQ4MHA2MiB7Ci0J
CQkJY2xvY2stZnJlcXVlbmN5ID0gPDMwMDAwMDAwPjsKLQkJCQloYWN0aXZlID0gPDgwMD47Ci0J
CQkJdmFjdGl2ZSA9IDw0ODA+OwotCQkJCWhmcm9udC1wb3JjaCA9IDwzOT47Ci0JCQkJaGJhY2st
cG9yY2ggPSA8Mzk+OwotCQkJCWhzeW5jLWxlbiA9IDw0Nz47Ci0JCQkJdmJhY2stcG9yY2ggPSA8
Mjk+OwotCQkJCXZmcm9udC1wb3JjaCA9IDwxMz47Ci0JCQkJdnN5bmMtbGVuID0gPDI+OwotCQkJ
CWhzeW5jLWFjdGl2ZSA9IDwxPjsKLQkJCQl2c3luYy1hY3RpdmUgPSA8MT47CisJCXBvcnQgewor
CQkJcGFuZWxfMDogZW5kcG9pbnRAMCB7CisJCQkJcmVtb3RlLWVuZHBvaW50ID0gPCZsY2RjXzA+
OwogCQkJfTsKIAkJfTsKIAl9OwpAQCAtNTI1LDYgKzUwNSwxMiBAQAogCXN0YXR1cyA9ICJva2F5
IjsKIAogCWJsdWUtYW5kLXJlZC13aXJpbmcgPSAiY3Jvc3NlZCI7CisKKwlwb3J0IHsKKwkJbGNk
Y18wOiBlbmRwb2ludEAwIHsKKwkJCXJlbW90ZS1lbmRwb2ludCA9IDwmcGFuZWxfMD47CisJCX07
CisJfTsKIH07CiAKICZlbG0gewotLSAKVGV4YXMgSW5zdHJ1bWVudHMgRmlubGFuZCBPeSwgUG9y
a2thbGFua2F0dSAyMiwgMDAxODAgSGVsc2lua2kuIFktdHVubnVzL0J1c2luZXNzIElEOiAwNjE1
NTIxLTQuIEtvdGlwYWlra2EvRG9taWNpbGU6IEhlbHNpbmtpCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1k
ZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcv
bWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
