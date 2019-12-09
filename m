Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BB69E1170CF
	for <lists+dri-devel@lfdr.de>; Mon,  9 Dec 2019 16:46:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 902166E4B5;
	Mon,  9 Dec 2019 15:46:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 808FD6E4B5
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Dec 2019 15:46:01 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id xB9Fk0XG089856;
 Mon, 9 Dec 2019 09:46:00 -0600
Received: from DLEE106.ent.ti.com (dlee106.ent.ti.com [157.170.170.36])
 by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id xB9Fk0lQ079527
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Mon, 9 Dec 2019 09:46:00 -0600
Received: from DLEE112.ent.ti.com (157.170.170.23) by DLEE106.ent.ti.com
 (157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Mon, 9 Dec
 2019 09:45:59 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Mon, 9 Dec 2019 09:45:59 -0600
Received: from jadmar.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id xB9Fjvb1056148;
 Mon, 9 Dec 2019 09:45:58 -0600
From: Jyri Sarha <jsarha@ti.com>
To: <dri-devel@lists.freedesktop.org>
Subject: [PATCH v2 2/2] drm/panel: simple: Add Rocktech RK101II01D-CT panel
Date: Mon, 9 Dec 2019 17:45:57 +0200
Message-ID: <705bc4aedbd949e0589014b7d17e94cba043122c.1575903975.git.jsarha@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1575903975.git.jsarha@ti.com>
References: <cover.1575903975.git.jsarha@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ti.com; s=ti-com-17Q1; t=1575906360;
 bh=v88TaKoKb9TYF7GNr6c2t+I9sWOxNUgqI/0s08TBN38=;
 h=From:To:CC:Subject:Date:In-Reply-To:References;
 b=B65gdYJ7uOHTE1S/qDyBEHy8S8JNg2GdgXgww8k/I7tmOy63BKE0ElxBfRseo0kmE
 wpTr1zDIFBhsh3+6WkpeNAz0/8YNfgGCNTjMqN/94zZIWBWzkK/8mzSHiH3tIyPU3U
 MF//yXZ2IuKqKSjTGCXhjJ3KV7R4L6Atpyl6zuZY=
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
Cc: tomi.valkeinen@ti.com, thierry.reding@gmail.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QWRkIHN1cHBvcnQgZm9yIFJvY2t0ZWNoIFJLMTAxSUkwMUQtQ1QsIDEwLjEiIDEyODB4ODAwIFRG
VCB3aXRoIExWRFMKaW50ZXJmYWNlLCBMRUQgYmFja2xpZ2h0IGFuZCBpbnRlZ3JhdGVkIEdvb2Rp
eCBHVDkyOCBjYXBhY2l0aXZlIHRvdWNoCnBhbmVsLgoKU2lnbmVkLW9mZi1ieTogSnlyaSBTYXJo
YSA8anNhcmhhQHRpLmNvbT4KUmV2aWV3ZWQtYnk6IFRvbWkgVmFsa2VpbmVuIDx0b21pLnZhbGtl
aW5lbkB0aS5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL3BhbmVsL3BhbmVsLXNpbXBsZS5jIHwg
MzIgKysrKysrKysrKysrKysrKysrKysrKysrKysrKwogMSBmaWxlIGNoYW5nZWQsIDMyIGluc2Vy
dGlvbnMoKykKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vcGFuZWwvcGFuZWwtc2ltcGxl
LmMgYi9kcml2ZXJzL2dwdS9kcm0vcGFuZWwvcGFuZWwtc2ltcGxlLmMKaW5kZXggNWQ0ODc2ODZk
MjVjLi40ODllMjE3MTAyZWEgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9wYW5lbC9wYW5l
bC1zaW1wbGUuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vcGFuZWwvcGFuZWwtc2ltcGxlLmMKQEAg
LTI0NzksNiArMjQ3OSwzNSBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IHBhbmVsX2Rlc2Mgcm9ja3Rl
Y2hfcmswNzBlcjk0MjcgPSB7CiAJLmJ1c19mb3JtYXQgPSBNRURJQV9CVVNfRk1UX1JHQjY2Nl8x
WDE4LAogfTsKIAorc3RhdGljIGNvbnN0IHN0cnVjdCBkcm1fZGlzcGxheV9tb2RlIHJvY2t0ZWNo
X3JrMTAxaWkwMWRfY3RfbW9kZSA9IHsKKwkuY2xvY2sgPSA3MTEwMCwKKwkuaGRpc3BsYXkgPSAx
MjgwLAorCS5oc3luY19zdGFydCA9IDEyODAgKyA0OCwKKwkuaHN5bmNfZW5kID0gMTI4MCArIDQ4
ICsgMzIsCisJLmh0b3RhbCA9IDEyODAgKyA0OCArIDMyICsgODAsCisJLnZkaXNwbGF5ID0gODAw
LAorCS52c3luY19zdGFydCA9IDgwMCArIDIsCisJLnZzeW5jX2VuZCA9IDgwMCArIDIgKyA1LAor
CS52dG90YWwgPSA4MDAgKyAyICsgNSArIDE2LAorCS52cmVmcmVzaCA9IDYwLAorfTsKKworc3Rh
dGljIGNvbnN0IHN0cnVjdCBwYW5lbF9kZXNjIHJvY2t0ZWNoX3JrMTAxaWkwMWRfY3QgPSB7CisJ
Lm1vZGVzID0gJnJvY2t0ZWNoX3JrMTAxaWkwMWRfY3RfbW9kZSwKKwkubnVtX21vZGVzID0gMSwK
Kwkuc2l6ZSA9IHsKKwkJLndpZHRoID0gMjE3LAorCQkuaGVpZ2h0ID0gMTM2LAorCX0sCisJLmRl
bGF5ID0geworCQkucHJlcGFyZSA9IDUwLAorCQkuZGlzYWJsZSA9IDUwLAorCX0sCisJLmJ1c19m
bGFncyA9IERSTV9CVVNfRkxBR19ERV9ISUdILAorCS5idXNfZm9ybWF0ID0gTUVESUFfQlVTX0ZN
VF9SR0I4ODhfMVg3WDRfU1BXRywKKwkuY29ubmVjdG9yX3R5cGUgPSBEUk1fTU9ERV9DT05ORUNU
T1JfTFZEUywKK307CisKIHN0YXRpYyBjb25zdCBzdHJ1Y3QgZHJtX2Rpc3BsYXlfbW9kZSBzYW1z
dW5nX2xzbjEyMmRsMDFfYzAxX21vZGUgPSB7CiAJLmNsb2NrID0gMjcxNTYwLAogCS5oZGlzcGxh
eSA9IDI1NjAsCkBAIC0zMzM4LDYgKzMzNjcsOSBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IG9mX2Rl
dmljZV9pZCBwbGF0Zm9ybV9vZl9tYXRjaFtdID0gewogCX0sIHsKIAkJLmNvbXBhdGlibGUgPSAi
cm9ja3RlY2gscmswNzBlcjk0MjciLAogCQkuZGF0YSA9ICZyb2NrdGVjaF9yazA3MGVyOTQyNywK
Kwl9LCB7CisJCS5jb21wYXRpYmxlID0gInJvY2t0ZWNoLHJrMTAxaWkwMWQtY3QiLAorCQkuZGF0
YSA9ICZyb2NrdGVjaF9yazEwMWlpMDFkX2N0LAogCX0sIHsKIAkJLmNvbXBhdGlibGUgPSAic2Ft
c3VuZyxsc24xMjJkbDAxLWMwMSIsCiAJCS5kYXRhID0gJnNhbXN1bmdfbHNuMTIyZGwwMV9jMDEs
Ci0tIApUZXhhcyBJbnN0cnVtZW50cyBGaW5sYW5kIE95LCBQb3Jra2FsYW5rYXR1IDIyLCAwMDE4
MCBIZWxzaW5raS4gWS10dW5udXMvQnVzaW5lc3MgSUQ6IDA2MTU1MjEtNC4gS290aXBhaWtrYS9E
b21pY2lsZTogSGVsc2lua2kKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNr
dG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Ry
aS1kZXZlbA==
