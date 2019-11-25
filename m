Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 29E05108E8E
	for <lists+dri-devel@lfdr.de>; Mon, 25 Nov 2019 14:11:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 01F2889F3B;
	Mon, 25 Nov 2019 13:11:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B80D89F3B
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Nov 2019 13:11:19 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id xAPDBBCc126044;
 Mon, 25 Nov 2019 07:11:11 -0600
Received: from DFLE106.ent.ti.com (dfle106.ent.ti.com [10.64.6.27])
 by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id xAPDBBl5024060
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Mon, 25 Nov 2019 07:11:11 -0600
Received: from DFLE106.ent.ti.com (10.64.6.27) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Mon, 25
 Nov 2019 07:11:10 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Mon, 25 Nov 2019 07:11:10 -0600
Received: from deskari.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id xAPDB7rk113038;
 Mon, 25 Nov 2019 07:11:08 -0600
From: Tomi Valkeinen <tomi.valkeinen@ti.com>
To: <linux-omap@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <tony@atomide.com>
Subject: [PATCH 1/4] ARM: dts: am437x-gp-evm: add HDMI support
Date: Mon, 25 Nov 2019 15:10:57 +0200
Message-ID: <20191125131100.9839-1-tomi.valkeinen@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ti.com; s=ti-com-17Q1; t=1574687471;
 bh=/brRrE34NIQuy6Eaoa29ZOs7K/pstknRZIZTGEFZBIA=;
 h=From:To:CC:Subject:Date;
 b=FFozQXDrca5FwzxDkFzhSZOkAson+KgPA52fGPgZY270Sdho3c9nRBLu8eeHqrRPU
 vcYQl4h9wn6rmfXKKh7pzGEaHoiTVEM8Tx5p98O/O2oi9I1bQ8xNK+KXtTexelOYyg
 KXT9Y2rUdNiIYEkx1OWKjqK2mSFbAVjLAcBSXd68=
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

QWRkIEhETUkgc3VwcG9ydCBmb3IgQU00Mzd4IEdQIEVWTS4gVGhlIEhETUkgdXNlcyBTaUk5MDIy
IEhETUkgZW5jb2RlciwKYW5kIGlzIG11dHVhbGx5IGV4Y2x1c2l2ZSB3aXRoIHRoZSBMQ0QuIFRo
ZSBjaG9pY2UgYmV0d2VlbiBMQ0QgYW5kIEhETUkKaXMgbWFkZSBieSBib290aW5nIGVpdGhlciB3
aXRoIGFtNDM3eC1ncC1ldm0uZHRiIG9yCmFtNDM3eC1ncC1ldm0taGRtaS5kdGIuCgpTaWduZWQt
b2ZmLWJ5OiBUb21pIFZhbGtlaW5lbiA8dG9taS52YWxrZWluZW5AdGkuY29tPgotLS0KIGFyY2gv
YXJtL2Jvb3QvZHRzL01ha2VmaWxlICAgICAgICAgICAgICAgfCAgIDEgKwogYXJjaC9hcm0vYm9v
dC9kdHMvYW00Mzd4LWdwLWV2bS1oZG1pLmR0cyB8IDExMiArKysrKysrKysrKysrKysrKysrKysr
KwogMiBmaWxlcyBjaGFuZ2VkLCAxMTMgaW5zZXJ0aW9ucygrKQogY3JlYXRlIG1vZGUgMTAwNjQ0
IGFyY2gvYXJtL2Jvb3QvZHRzL2FtNDM3eC1ncC1ldm0taGRtaS5kdHMKCmRpZmYgLS1naXQgYS9h
cmNoL2FybS9ib290L2R0cy9NYWtlZmlsZSBiL2FyY2gvYXJtL2Jvb3QvZHRzL01ha2VmaWxlCmlu
ZGV4IGIyMWIzYTY0NjQxYS4uNjEyMTQ5MDY5MTgwIDEwMDY0NAotLS0gYS9hcmNoL2FybS9ib290
L2R0cy9NYWtlZmlsZQorKysgYi9hcmNoL2FybS9ib290L2R0cy9NYWtlZmlsZQpAQCAtNzc5LDYg
Kzc3OSw3IEBAIGR0Yi0kKENPTkZJR19TT0NfQU00M1hYKSArPSBcCiAJYW00M3gtZXBvcy1ldm0u
ZHRiIFwKIAlhbTQzN3gtY20tdDQzLmR0YiBcCiAJYW00Mzd4LWdwLWV2bS5kdGIgXAorCWFtNDM3
eC1ncC1ldm0taGRtaS5kdGIgXAogCWFtNDM3eC1pZGstZXZtLmR0YiBcCiAJYW00Mzd4LXNiYy10
NDMuZHRiIFwKIAlhbTQzN3gtc2stZXZtLmR0YgpkaWZmIC0tZ2l0IGEvYXJjaC9hcm0vYm9vdC9k
dHMvYW00Mzd4LWdwLWV2bS1oZG1pLmR0cyBiL2FyY2gvYXJtL2Jvb3QvZHRzL2FtNDM3eC1ncC1l
dm0taGRtaS5kdHMKbmV3IGZpbGUgbW9kZSAxMDA2NDQKaW5kZXggMDAwMDAwMDAwMDAwLi41ODBh
MWUzZTBkY2QKLS0tIC9kZXYvbnVsbAorKysgYi9hcmNoL2FybS9ib290L2R0cy9hbTQzN3gtZ3At
ZXZtLWhkbWkuZHRzCkBAIC0wLDAgKzEsMTEyIEBACisvLyBTUERYLUxpY2Vuc2UtSWRlbnRpZmll
cjogR1BMLTIuMAorLyoKKyAqIENvcHlyaWdodCAoQykgMjAxOSBUZXhhcyBJbnN0cnVtZW50cyBJ
bmNvcnBvcmF0ZWQgLSBodHRwOi8vd3d3LnRpLmNvbS8KKyAqLworCisvKiBBTTQzN3ggR1AgRVZN
IHdpdGggSERNSSBvdXRwdXQgKi8KKworI2luY2x1ZGUgImFtNDM3eC1ncC1ldm0uZHRzIgorCisv
ZGVsZXRlLW5vZGUvICZsY2QwOworCisvIHsKKwlhbGlhc2VzIHsKKwkJZGlzcGxheTAgPSAmaGRt
aTsKKwl9OworCisJaGRtaTogY29ubmVjdG9yIHsKKwkJY29tcGF0aWJsZSA9ICJoZG1pLWNvbm5l
Y3RvciI7CisJCWxhYmVsID0gImhkbWkiOworCisJCXR5cGUgPSAiYiI7CisKKwkJcG9ydCB7CisJ
CQloZG1pX2Nvbm5lY3Rvcl9pbjogZW5kcG9pbnQgeworCQkJCXJlbW90ZS1lbmRwb2ludCA9IDwm
c2lpOTAyMl9vdXQ+OworCQkJfTsKKwkJfTsKKwl9OworCisJc291bmRAMSB7CisJCWNvbXBhdGli
bGUgPSAic2ltcGxlLWF1ZGlvLWNhcmQiOworCQlzaW1wbGUtYXVkaW8tY2FyZCxuYW1lID0gIkhE
TUkiOworCQlzaW1wbGUtYXVkaW8tY2FyZCxmb3JtYXQgPSAiaTJzIjsKKwkJc2ltcGxlLWF1ZGlv
LWNhcmQsYml0Y2xvY2stbWFzdGVyID0gPCZoZG1pX2RhaWxpbmtfbWFzdGVyPjsKKwkJc2ltcGxl
LWF1ZGlvLWNhcmQsZnJhbWUtbWFzdGVyID0gPCZoZG1pX2RhaWxpbmtfbWFzdGVyPjsKKwkJaGRt
aV9kYWlsaW5rX21hc3Rlcjogc2ltcGxlLWF1ZGlvLWNhcmQsY3B1IHsKKwkJCXNvdW5kLWRhaSA9
IDwmbWNhc3AxPjsKKwkJCXN5c3RlbS1jbG9jay1mcmVxdWVuY3kgPSA8MjQwMDAwMDA+OworCQkJ
c3lzdGVtLWNsb2NrLWRpcmVjdGlvbi1vdXQ7CisJCX07CisKKwkJc2ltcGxlLWF1ZGlvLWNhcmQs
Y29kZWMgeworCQkJc291bmQtZGFpID0gPCZzaWk5MDIyPjsKKwkJfTsKKwl9OworCisJc2lpOTAy
Ml9tY2xrOiBzaWk5MDIyX21jbGsgeworCQljb21wYXRpYmxlID0gImZpeGVkLWNsb2NrIjsKKwkJ
I2Nsb2NrLWNlbGxzID0gPDA+OworCQljbG9jay1mcmVxdWVuY3kgPSA8MTIwMDAwMDA+OworCX07
Cit9OworCismbGNkX2JsIHsKKwlzdGF0dXMgPSAiZGlzYWJsZWQiOworfTsKKworJnNvdW5kMCB7
CisJc3RhdHVzID0gImRpc2FibGVkIjsKK307CisKKyZ0bHYzMjBhaWMzMTA2IHsKKwlzdGF0dXMg
PSAiZGlzYWJsZWQiOworfTsKKworJmkyYzEgeworCXNpaTkwMjI6IHNpaTkwMjJAM2IgeworCQkj
c291bmQtZGFpLWNlbGxzID0gPDA+OworCQljb21wYXRpYmxlID0gInNpbCxzaWk5MDIyIjsKKwkJ
cmVnID0gPDB4M2I+OworCisJCWludGVycnVwdC1wYXJlbnQgPSA8JmdwaW8zPjsKKwkJaW50ZXJy
dXB0cyA9IDwyNCBJUlFfVFlQRV9MRVZFTF9MT1c+OworCisJCXNpbCxpMnMtZGF0YS1sYW5lcyA9
IDwgMCA+OworCQljbG9ja3MgPSA8JnNpaTkwMjJfbWNsaz47CisJCWNsb2NrLW5hbWVzID0gIm1j
bGsiOworCisJCXBvcnRzIHsKKwkJCSNhZGRyZXNzLWNlbGxzID0gPDE+OworCQkJI3NpemUtY2Vs
bHMgPSA8MD47CisKKwkJCXBvcnRAMCB7CisJCQkJcmVnID0gPDA+OworCisJCQkJc2lpOTAyMl9p
bjogZW5kcG9pbnQgeworCQkJCQlyZW1vdGUtZW5kcG9pbnQgPSA8JmRwaV9vdXQ+OworCQkJCX07
CisJCQl9OworCisJCQlwb3J0QDEgeworCQkJCXJlZyA9IDwxPjsKKworCQkJCXNpaTkwMjJfb3V0
OiBlbmRwb2ludCB7CisJCQkJCXJlbW90ZS1lbmRwb2ludCA9IDwmaGRtaV9jb25uZWN0b3JfaW4+
OworCQkJCX07CisJCQl9OworCQl9OworCX07Cit9OworCismZHBpX291dCB7CisJcmVtb3RlLWVu
ZHBvaW50ID0gPCZzaWk5MDIyX2luPjsKKwlkYXRhLWxpbmVzID0gPDI0PjsKK307CisKKy8qIE92
ZXJyaWRlIFNlbExDRG9ySERNSSBmcm9tIGFtNDM3eC1ncC1ldm0uZHRzIHRvIHNlbGVjdCBIRE1J
ICovCismZ3BpbzUgeworCXA4IHsKKwkJb3V0cHV0LWxvdzsKKwl9OworfTsKLS0gClRleGFzIElu
c3RydW1lbnRzIEZpbmxhbmQgT3ksIFBvcmtrYWxhbmthdHUgMjIsIDAwMTgwIEhlbHNpbmtpLgpZ
LXR1bm51cy9CdXNpbmVzcyBJRDogMDYxNTUyMS00LiBLb3RpcGFpa2thL0RvbWljaWxlOiBIZWxz
aW5raQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJp
LWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBz
Oi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
