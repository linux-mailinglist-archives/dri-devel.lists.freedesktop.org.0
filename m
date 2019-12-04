Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CE102112999
	for <lists+dri-devel@lfdr.de>; Wed,  4 Dec 2019 11:56:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 94CC56E8A1;
	Wed,  4 Dec 2019 10:56:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DFA5A6E8A1
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Dec 2019 10:56:04 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id xB4Atvdu007551;
 Wed, 4 Dec 2019 04:55:57 -0600
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
 by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id xB4AtvJC053258
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Wed, 4 Dec 2019 04:55:57 -0600
Received: from DLEE108.ent.ti.com (157.170.170.38) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Wed, 4 Dec
 2019 04:55:56 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Wed, 4 Dec 2019 04:55:56 -0600
Received: from jadmar.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id xB4AtsrZ081308;
 Wed, 4 Dec 2019 04:55:54 -0600
From: Jyri Sarha <jsarha@ti.com>
To: <dri-devel@lists.freedesktop.org>, <tony@atomide.com>,
 <bcousson@baylibre.com>, <devicetree@vger.kernel.org>,
 <linux-omap@vger.kernel.org>
Subject: [PATCH] ARM: dts: am335x-evmsk: Use drm simple-panel instead of
 tilcdc-panel
Date: Wed, 4 Dec 2019 12:55:54 +0200
Message-ID: <20191204105554.14212-1-jsarha@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ti.com; s=ti-com-17Q1; t=1575456957;
 bh=h5GEQ/bOy6qrn1uLO+MeHYnwvzdjeB/Vg3QaUt0L+kQ=;
 h=From:To:CC:Subject:Date;
 b=T1A5sWLRESMOAamKW8mEHG74z4sfakKoL47h8tZknq4RfGq3Q3rDPi3RoAdcbJSo4
 sMYznc7Rw6Y8SB+WpNTKn0u4etO+HlrUcJojDcD+23qK8CFu6/dYX8Vi+nNtjpbsQk
 BALnmySyDjOooC5uOOSSMjY4g0L81w5XdsSM46kE=
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
d2l0aCBhZGRlZAoibmV3aGF2ZW4sbmhkLTQuMy00ODAyNzJlZi1hdHhsIi1wYW5lbCBzdXBwb3J0
IGluIGRybSBwYW5lbC1zaW1wbGUuCgpTaWduZWQtb2ZmLWJ5OiBKeXJpIFNhcmhhIDxqc2FyaGFA
dGkuY29tPgotLS0KIGFyY2gvYXJtL2Jvb3QvZHRzL2FtMzM1eC1ldm1zay5kdHMgfCAzOCArKysr
KysrKysrLS0tLS0tLS0tLS0tLS0tLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCAxMiBpbnNlcnRpb25z
KCspLCAyNiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9hcmNoL2FybS9ib290L2R0cy9hbTMz
NXgtZXZtc2suZHRzIGIvYXJjaC9hcm0vYm9vdC9kdHMvYW0zMzV4LWV2bXNrLmR0cwppbmRleCBl
MjhhNWI4MmZkZjMuLmIxNDllNDg1MjBiNCAxMDA2NDQKLS0tIGEvYXJjaC9hcm0vYm9vdC9kdHMv
YW0zMzV4LWV2bXNrLmR0cworKysgYi9hcmNoL2FybS9ib290L2R0cy9hbTMzNXgtZXZtc2suZHRz
CkBAIC0xODMsMzYgKzE4MywxNiBAQAogCX07CiAKIAlwYW5lbCB7Ci0JCWNvbXBhdGlibGUgPSAi
dGksdGlsY2RjLHBhbmVsIjsKKwkJY29tcGF0aWJsZSA9ICJuZXdoYXZlbixuaGQtNC4zLTQ4MDI3
MmVmLWF0eGwiOworCiAJCXBpbmN0cmwtbmFtZXMgPSAiZGVmYXVsdCIsICJzbGVlcCI7CiAJCXBp
bmN0cmwtMCA9IDwmbGNkX3BpbnNfZGVmYXVsdD47CiAJCXBpbmN0cmwtMSA9IDwmbGNkX3BpbnNf
c2xlZXA+OwogCQliYWNrbGlnaHQgPSA8JmxjZF9ibD47Ci0JCXN0YXR1cyA9ICJva2F5IjsKLQkJ
cGFuZWwtaW5mbyB7Ci0JCQlhYy1iaWFzCQk9IDwyNTU+OwotCQkJYWMtYmlhcy1pbnRycHQJPSA8
MD47Ci0JCQlkbWEtYnVyc3Qtc3oJPSA8MTY+OwotCQkJYnBwCQk9IDwzMj47Ci0JCQlmZGQJCT0g
PDB4ODA+OwotCQkJc3luYy1lZGdlCT0gPDA+OwotCQkJc3luYy1jdHJsCT0gPDE+OwotCQkJcmFz
dGVyLW9yZGVyCT0gPDA+OwotCQkJZmlmby10aAkJPSA8MD47Ci0JCX07Ci0JCWRpc3BsYXktdGlt
aW5ncyB7Ci0JCQk0ODB4MjcyIHsKLQkJCQloYWN0aXZlCQk9IDw0ODA+OwotCQkJCXZhY3RpdmUJ
CT0gPDI3Mj47Ci0JCQkJaGJhY2stcG9yY2gJPSA8NDM+OwotCQkJCWhmcm9udC1wb3JjaAk9IDw4
PjsKLQkJCQloc3luYy1sZW4JPSA8ND47Ci0JCQkJdmJhY2stcG9yY2gJPSA8MTI+OwotCQkJCXZm
cm9udC1wb3JjaAk9IDw0PjsKLQkJCQl2c3luYy1sZW4JPSA8MTA+OwotCQkJCWNsb2NrLWZyZXF1
ZW5jeSA9IDw5MDAwMDAwPjsKLQkJCQloc3luYy1hY3RpdmUJPSA8MD47Ci0JCQkJdnN5bmMtYWN0
aXZlCT0gPDA+OworCisJCXBvcnQgeworCQkJcGFuZWxfMDogZW5kcG9pbnRAMCB7CisJCQkJcmVt
b3RlLWVuZHBvaW50ID0gPCZsY2RjXzA+OwogCQkJfTsKIAkJfTsKIAl9OwpAQCAtNzUwLDYgKzcz
MCwxMiBAQAogCXN0YXR1cyA9ICJva2F5IjsKIAogCWJsdWUtYW5kLXJlZC13aXJpbmcgPSAiY3Jv
c3NlZCI7CisKKwlwb3J0IHsKKwkJbGNkY18wOiBlbmRwb2ludEAwIHsKKwkJCXJlbW90ZS1lbmRw
b2ludCA9IDwmcGFuZWxfMD47CisJCX07CisJfTsKIH07CiAKICZydGMgewotLSAKVGV4YXMgSW5z
dHJ1bWVudHMgRmlubGFuZCBPeSwgUG9ya2thbGFua2F0dSAyMiwgMDAxODAgSGVsc2lua2kuIFkt
dHVubnVzL0J1c2luZXNzIElEOiAwNjE1NTIxLTQuIEtvdGlwYWlra2EvRG9taWNpbGU6IEhlbHNp
bmtpCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmkt
ZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6
Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
