Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 26FA7108E93
	for <lists+dri-devel@lfdr.de>; Mon, 25 Nov 2019 14:11:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B12689FC9;
	Mon, 25 Nov 2019 13:11:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B1D089FC3
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Nov 2019 13:11:20 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id xAPDBCI8126062;
 Mon, 25 Nov 2019 07:11:12 -0600
Received: from DLEE104.ent.ti.com (dlee104.ent.ti.com [157.170.170.34])
 by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id xAPDBCFv070827
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Mon, 25 Nov 2019 07:11:12 -0600
Received: from DLEE110.ent.ti.com (157.170.170.21) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Mon, 25
 Nov 2019 07:11:12 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Mon, 25 Nov 2019 07:11:12 -0600
Received: from deskari.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id xAPDB7rl113038;
 Mon, 25 Nov 2019 07:11:10 -0600
From: Tomi Valkeinen <tomi.valkeinen@ti.com>
To: <linux-omap@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <tony@atomide.com>
Subject: [PATCH 2/4] ARM: dts: am437x-epos-evm: add HDMI support
Date: Mon, 25 Nov 2019 15:10:58 +0200
Message-ID: <20191125131100.9839-2-tomi.valkeinen@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191125131100.9839-1-tomi.valkeinen@ti.com>
References: <20191125131100.9839-1-tomi.valkeinen@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ti.com; s=ti-com-17Q1; t=1574687472;
 bh=agMY92W2bwaR6RtyoJZToavWwnkd24a1j8kvLzHdN3Y=;
 h=From:To:CC:Subject:Date:In-Reply-To:References;
 b=pT7b1L03JH3AL788c+iiy6tBVoFRR49sN1ehmL6lcnh80MWtecUc+Zv0CUT41EAZE
 tf3d1178t0Hj0rNwzYHXu/BFgIrfBGhpL9xA1A5Hfv/6oWdQ4CQnwkkoLvdXnSBecu
 IGfAwj30f+8z9hcXQk7q9stngeSRUkOFgEekagHY=
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
 robh+dt@kernel.org, Jyri Sarha <jsarha@ti.com>,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogSnlyaSBTYXJoYSA8anNhcmhhQHRpLmNvbT4KCkFkZCBIRE1JIHN1cHBvcnQgZm9yIEFN
NDN4IEVQT1MgRVZNLiBUaGUgSERNSSB1c2VzIFNpSTkwMjIgSERNSQplbmNvZGVyIGZvciBhdWRp
byBhbmQgZGlzcGxheSwgYW5kIGl0IGlzIG11dHVhbGx5IGV4Y2x1c2l2ZSB3aXRoIHRoZQpMQ0Qg
YW5kIGFuYWxvZ3VlIGF1ZGlvLiBUaGUgY2hvaWNlIGJldHdlZW4gTENEICsgYW5hbG9ndWUgYXVk
aW8gYW5kCkhETUkgKyBIRE1JLWF1ZGlvIGlzIG1hZGUgYnkgYm9vdGluZyBlaXRoZXIgd2l0aCBh
bTQzeC1lcG9zLWV2bS5kdGIgb3IKYW00M3gtZXBvcy1ldm0taGRtaS5kdGIuCgpTaWduZWQtb2Zm
LWJ5OiBKeXJpIFNhcmhhIDxqc2FyaGFAdGkuY29tPgpTaWduZWQtb2ZmLWJ5OiBUb21pIFZhbGtl
aW5lbiA8dG9taS52YWxrZWluZW5AdGkuY29tPgotLS0KIGFyY2gvYXJtL2Jvb3QvZHRzL01ha2Vm
aWxlICAgICAgICAgICAgICAgIHwgICAxICsKIGFyY2gvYXJtL2Jvb3QvZHRzL2FtNDN4LWVwb3Mt
ZXZtLWhkbWkuZHRzIHwgMTIwICsrKysrKysrKysrKysrKysrKysrKysKIDIgZmlsZXMgY2hhbmdl
ZCwgMTIxIGluc2VydGlvbnMoKykKIGNyZWF0ZSBtb2RlIDEwMDY0NCBhcmNoL2FybS9ib290L2R0
cy9hbTQzeC1lcG9zLWV2bS1oZG1pLmR0cwoKZGlmZiAtLWdpdCBhL2FyY2gvYXJtL2Jvb3QvZHRz
L01ha2VmaWxlIGIvYXJjaC9hcm0vYm9vdC9kdHMvTWFrZWZpbGUKaW5kZXggNjEyMTQ5MDY5MTgw
Li40M2JhNDY1NTk2YWQgMTAwNjQ0Ci0tLSBhL2FyY2gvYXJtL2Jvb3QvZHRzL01ha2VmaWxlCisr
KyBiL2FyY2gvYXJtL2Jvb3QvZHRzL01ha2VmaWxlCkBAIC03NzcsNiArNzc3LDcgQEAgZHRiLSQo
Q09ORklHX0FSQ0hfT01BUDQpICs9IFwKIAlvbWFwNC12YXItc3RrLW9tNDQuZHRiCiBkdGItJChD
T05GSUdfU09DX0FNNDNYWCkgKz0gXAogCWFtNDN4LWVwb3MtZXZtLmR0YiBcCisJYW00M3gtZXBv
cy1ldm0taGRtaS5kdGIgXAogCWFtNDM3eC1jbS10NDMuZHRiIFwKIAlhbTQzN3gtZ3AtZXZtLmR0
YiBcCiAJYW00Mzd4LWdwLWV2bS1oZG1pLmR0YiBcCmRpZmYgLS1naXQgYS9hcmNoL2FybS9ib290
L2R0cy9hbTQzeC1lcG9zLWV2bS1oZG1pLmR0cyBiL2FyY2gvYXJtL2Jvb3QvZHRzL2FtNDN4LWVw
b3MtZXZtLWhkbWkuZHRzCm5ldyBmaWxlIG1vZGUgMTAwNjQ0CmluZGV4IDAwMDAwMDAwMDAwMC4u
MzE0ZTllOGM1MTNjCi0tLSAvZGV2L251bGwKKysrIGIvYXJjaC9hcm0vYm9vdC9kdHMvYW00M3gt
ZXBvcy1ldm0taGRtaS5kdHMKQEAgLTAsMCArMSwxMjAgQEAKKy8vIFNQRFgtTGljZW5zZS1JZGVu
dGlmaWVyOiBHUEwtMi4wCisvKgorICogQ29weXJpZ2h0IChDKSAyMDE5IFRleGFzIEluc3RydW1l
bnRzIEluY29ycG9yYXRlZCAtIGh0dHA6Ly93d3cudGkuY29tLworICovCisKKy8qIEFNNDM3eCBF
UE9TIEVWTSB3aXRoIEhETUkgb3V0cHV0ICovCisKKyNpbmNsdWRlICJhbTQzeC1lcG9zLWV2bS5k
dHMiCisKKy9kZWxldGUtbm9kZS8gJmxjZDA7CisKKy8geworCWFsaWFzZXMgeworCQlkaXNwbGF5
MCA9ICZoZG1pOworCX07CisKKwloZG1pOiBjb25uZWN0b3IgeworCQljb21wYXRpYmxlID0gImhk
bWktY29ubmVjdG9yIjsKKwkJbGFiZWwgPSAiaGRtaSI7CisKKwkJdHlwZSA9ICJiIjsKKworCQlw
b3J0IHsKKwkJCWhkbWlfY29ubmVjdG9yX2luOiBlbmRwb2ludCB7CisJCQkJcmVtb3RlLWVuZHBv
aW50ID0gPCZzaWk5MDIyX291dD47CisJCQl9OworCQl9OworCX07CisKKwlzb3VuZEAxIHsKKwkJ
Y29tcGF0aWJsZSA9ICJzaW1wbGUtYXVkaW8tY2FyZCI7CisJCXNpbXBsZS1hdWRpby1jYXJkLG5h
bWUgPSAiSERNSSI7CisJCXNpbXBsZS1hdWRpby1jYXJkLGZvcm1hdCA9ICJpMnMiOworCQlzaW1w
bGUtYXVkaW8tY2FyZCxiaXRjbG9jay1tYXN0ZXIgPSA8JmhkbWlfZGFpbGlua19tYXN0ZXI+Owor
CQlzaW1wbGUtYXVkaW8tY2FyZCxmcmFtZS1tYXN0ZXIgPSA8JmhkbWlfZGFpbGlua19tYXN0ZXI+
OworCQloZG1pX2RhaWxpbmtfbWFzdGVyOiBzaW1wbGUtYXVkaW8tY2FyZCxjcHUgeworCQkJc291
bmQtZGFpID0gPCZtY2FzcDE+OworCQkJc3lzdGVtLWNsb2NrLWZyZXF1ZW5jeSA9IDwyNDAwMDAw
MD47CisJCQlzeXN0ZW0tY2xvY2stZGlyZWN0aW9uLW91dDsKKwkJfTsKKworCQlzaW1wbGUtYXVk
aW8tY2FyZCxjb2RlYyB7CisJCQlzb3VuZC1kYWkgPSA8JnNpaTkwMjI+OworCQl9OworCX07CisK
KwlzaWk5MDIyX21jbGs6IHNpaTkwMjJfbWNsayB7CisJCWNvbXBhdGlibGUgPSAiZml4ZWQtY2xv
Y2siOworCQkjY2xvY2stY2VsbHMgPSA8MD47CisJCWNsb2NrLWZyZXF1ZW5jeSA9IDwxMjAwMDAw
MD47CisJfTsKK307CisKKyZsY2RfYmwgeworCXN0YXR1cyA9ICJkaXNhYmxlZCI7Cit9OworCism
c291bmQwIHsKKwlzdGF0dXMgPSAiZGlzYWJsZWQiOworfTsKKworJnRsdjMyMGFpYzMxMTEgewor
CXN0YXR1cyA9ICJkaXNhYmxlZCI7Cit9OworCismYW00M3h4X3Bpbm11eCB7CisJc2lpOTAyMl9w
aW5zOiBzaWk5MDIyX3BpbnMgeworCQlwaW5jdHJsLXNpbmdsZSxwaW5zID0gPAorCQkJQU00Mzcy
X0lPUEFEKDB4ODQ4LCBQSU5fSU5QVVQgfCBNVVhfTU9ERTcpCS8qIGdwbWNfYTIuZ3BpbzFfMTgg
Ki8KKwkJPjsKKwl9OworfTsKKworJmkyYzIgeworCXNpaTkwMjI6IHNpaTkwMjJAM2IgeworCQkj
c291bmQtZGFpLWNlbGxzID0gPDA+OworCQljb21wYXRpYmxlID0gInNpbCxzaWk5MDIyIjsKKwkJ
cmVnID0gPDB4M2I+OworCisJCWludGVycnVwdC1wYXJlbnQgPSA8JmdwaW8xPjsKKwkJaW50ZXJy
dXB0cyA9IDwxOCBJUlFfVFlQRV9MRVZFTF9MT1c+OworCisJCXNpbCxpMnMtZGF0YS1sYW5lcyA9
IDwgMCA+OworCQljbG9ja3MgPSA8JnNpaTkwMjJfbWNsaz47CisJCWNsb2NrLW5hbWVzID0gIm1j
bGsiOworCisJCXBvcnRzIHsKKwkJCSNhZGRyZXNzLWNlbGxzID0gPDE+OworCQkJI3NpemUtY2Vs
bHMgPSA8MD47CisKKwkJCXBvcnRAMCB7CisJCQkJcmVnID0gPDA+OworCisJCQkJc2lpOTAyMl9p
bjogZW5kcG9pbnQgeworCQkJCQlyZW1vdGUtZW5kcG9pbnQgPSA8JmRwaV9vdXQ+OworCQkJCX07
CisJCQl9OworCisJCQlwb3J0QDEgeworCQkJCXJlZyA9IDwxPjsKKworCQkJCXNpaTkwMjJfb3V0
OiBlbmRwb2ludCB7CisJCQkJCXJlbW90ZS1lbmRwb2ludCA9IDwmaGRtaV9jb25uZWN0b3JfaW4+
OworCQkJCX07CisJCQl9OworCQl9OworCX07Cit9OworCismZHBpX291dCB7CisJcmVtb3RlLWVu
ZHBvaW50ID0gPCZzaWk5MDIyX2luPjsKKwlkYXRhLWxpbmVzID0gPDI0PjsKK307CisKKy8qIE92
ZXJyaWRlIFNlbExDRG9ySERNSSBmcm9tIGFtNDM3eC1lcG9zLWV2bS5kdHMgdG8gc2VsZWN0IEhE
TUkgKi8KKyZncGlvMiB7CisJcDEgeworCQlvdXRwdXQtbG93OworCX07Cit9OwotLSAKVGV4YXMg
SW5zdHJ1bWVudHMgRmlubGFuZCBPeSwgUG9ya2thbGFua2F0dSAyMiwgMDAxODAgSGVsc2lua2ku
ClktdHVubnVzL0J1c2luZXNzIElEOiAwNjE1NTIxLTQuIEtvdGlwYWlra2EvRG9taWNpbGU6IEhl
bHNpbmtpCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpk
cmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
