Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DB345C1F46
	for <lists+dri-devel@lfdr.de>; Mon, 30 Sep 2019 12:39:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 725776E25B;
	Mon, 30 Sep 2019 10:39:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BFAF26E24B
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Sep 2019 10:38:56 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id x8UAcrem100908;
 Mon, 30 Sep 2019 05:38:53 -0500
Received: from DFLE105.ent.ti.com (dfle105.ent.ti.com [10.64.6.26])
 by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x8UAcrM8082922
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Mon, 30 Sep 2019 05:38:53 -0500
Received: from DFLE110.ent.ti.com (10.64.6.31) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Mon, 30
 Sep 2019 05:38:53 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Mon, 30 Sep 2019 05:38:53 -0500
Received: from deskari.lan (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id x8UAck1x011864;
 Mon, 30 Sep 2019 05:38:51 -0500
From: Tomi Valkeinen <tomi.valkeinen@ti.com>
To: <dri-devel@lists.freedesktop.org>, Laurent Pinchart
 <laurent.pinchart@ideasonboard.com>
Subject: [PATCHv2 3/7] drm/omap: tweak HDMI DDC timings
Date: Mon, 30 Sep 2019 13:38:36 +0300
Message-ID: <20190930103840.18970-4-tomi.valkeinen@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190930103840.18970-1-tomi.valkeinen@ti.com>
References: <20190930103840.18970-1-tomi.valkeinen@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ti.com; s=ti-com-17Q1; t=1569839933;
 bh=v4br9vLAElQIju3/I5Jyc3MIFXLM6Om8whf0tMowHd4=;
 h=From:To:CC:Subject:Date:In-Reply-To:References;
 b=i3oOJIzKeM4Qvme0uSGimehcY0q21VorPH0fnFUsEWppu+93OVRwlVic3tExqqNIE
 zLVX0SDiiPrSZTakHjYcLJLbRKrn3/siG7NItBJv4Rf4abry45B6vsqZBfSHHijoSv
 yG8KXGhKMfS1VljiLR6oPzxjR9kR37yG/OBLdFQg=
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
Cc: Alejandro Hernandez <ajhernandez@ti.com>,
 Tomi Valkeinen <tomi.valkeinen@ti.com>, Jyri Sarha <jsarha@ti.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogQWxlamFuZHJvIEhlcm5hbmRleiA8YWpoZXJuYW5kZXpAdGkuY29tPgoKQSAiSERNSSBJ
MkMgTWFzdGVyIEVycm9yIiBpcyBzb21ldGltZXMgcmVwb3J0ZWQgd2l0aCB0aGUgY3VycmVudCBE
REMgU0NMCnRpbWluZ3MuIFRoZSBjdXJyZW50IHNldHRpbmdzIGZvciBhIDEwdXMgU0NMIHBlcmlv
ZCAoMTAwIEtIeikgY2F1c2VzIHRoZQplcnJvciB3aXRoIHNvbWUgZGlzcGxheXMuICBUaGlzIHBh
dGNoIGluY3JlYXNlcyB0aGUgU0NMIHNpZ25hbCBwZXJpb2QKZnJvbSAxMHVzIHRvIDEwLjJ1cywg
d2l0aCB0aGUgbmV3IHNldHRpbmdzIHRoZSBlcnJvciBpcyBub3Qgb2JzZXJ2ZWQKClNpZ25lZC1v
ZmYtYnk6IEFsZWphbmRybyBIZXJuYW5kZXogPGFqaGVybmFuZGV6QHRpLmNvbT4KU2lnbmVkLW9m
Zi1ieTogVG9taSBWYWxrZWluZW4gPHRvbWkudmFsa2VpbmVuQHRpLmNvbT4KQWNrZWQtYnk6IExh
dXJlbnQgUGluY2hhcnQgPGxhdXJlbnQucGluY2hhcnRAaWRlYXNvbmJvYXJkLmNvbT4KLS0tCiBk
cml2ZXJzL2dwdS9kcm0vb21hcGRybS9kc3MvaGRtaTVfY29yZS5jIHwgNCArKy0tCiAxIGZpbGUg
Y2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvZ3B1L2RybS9vbWFwZHJtL2Rzcy9oZG1pNV9jb3JlLmMgYi9kcml2ZXJzL2dwdS9kcm0v
b21hcGRybS9kc3MvaGRtaTVfY29yZS5jCmluZGV4IDc0MDBmYjk5ZDQ1My4uNGM1ODhlYzc2MzRh
IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vb21hcGRybS9kc3MvaGRtaTVfY29yZS5jCisr
KyBiL2RyaXZlcnMvZ3B1L2RybS9vbWFwZHJtL2Rzcy9oZG1pNV9jb3JlLmMKQEAgLTM5LDggKzM5
LDggQEAgc3RhdGljIHZvaWQgaGRtaV9jb3JlX2RkY19pbml0KHN0cnVjdCBoZG1pX2NvcmVfZGF0
YSAqY29yZSkKIHsKIAl2b2lkIF9faW9tZW0gKmJhc2UgPSBjb3JlLT5iYXNlOwogCWNvbnN0IHVu
c2lnbmVkIGxvbmcgbG9uZyBpY2xrID0gMjY2MDAwMDAwOwkvKiBEU1MgTDMgSUNMSyAqLwotCWNv
bnN0IHVuc2lnbmVkIGludCBzc19zY2xfaGlnaCA9IDQ2MDA7CQkvKiBucyAqLwotCWNvbnN0IHVu
c2lnbmVkIGludCBzc19zY2xfbG93ID0gNTQwMDsJCS8qIG5zICovCisJY29uc3QgdW5zaWduZWQg
aW50IHNzX3NjbF9oaWdoID0gNDcwMDsJCS8qIG5zICovCisJY29uc3QgdW5zaWduZWQgaW50IHNz
X3NjbF9sb3cgPSA1NTAwOwkJLyogbnMgKi8KIAljb25zdCB1bnNpZ25lZCBpbnQgZnNfc2NsX2hp
Z2ggPSA2MDA7CQkvKiBucyAqLwogCWNvbnN0IHVuc2lnbmVkIGludCBmc19zY2xfbG93ID0gMTMw
MDsJCS8qIG5zICovCiAJY29uc3QgdW5zaWduZWQgaW50IHNkYV9ob2xkID0gMTAwMDsJCS8qIG5z
ICovCi0tIApUZXhhcyBJbnN0cnVtZW50cyBGaW5sYW5kIE95LCBQb3Jra2FsYW5rYXR1IDIyLCAw
MDE4MCBIZWxzaW5raS4KWS10dW5udXMvQnVzaW5lc3MgSUQ6IDA2MTU1MjEtNC4gS290aXBhaWtr
YS9Eb21pY2lsZTogSGVsc2lua2kKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2RyaS1kZXZlbA==
