Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FED32C134
	for <lists+dri-devel@lfdr.de>; Tue, 28 May 2019 10:28:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 972AC89C37;
	Tue, 28 May 2019 08:28:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 58FFA89C21
 for <dri-devel@lists.freedesktop.org>; Tue, 28 May 2019 08:28:10 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id x4S8S7l0055231;
 Tue, 28 May 2019 03:28:07 -0500
Received: from DLEE104.ent.ti.com (dlee104.ent.ti.com [157.170.170.34])
 by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x4S8S79q082400
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 28 May 2019 03:28:07 -0500
Received: from DLEE111.ent.ti.com (157.170.170.22) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Tue, 28
 May 2019 03:28:06 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Tue, 28 May 2019 03:28:06 -0500
Received: from deskari.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id x4S8RxuW125039;
 Tue, 28 May 2019 03:28:04 -0500
From: Tomi Valkeinen <tomi.valkeinen@ti.com>
To: <dri-devel@lists.freedesktop.org>, Andrzej Hajda <a.hajda@samsung.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Lucas Stach
 <l.stach@pengutronix.de>,
 Andrey Gusakov <andrey.gusakov@cogentembedded.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, Andrey Smirnov
 <andrew.smirnov@gmail.com>, Peter Ujfalusi <peter.ujfalusi@ti.com>, Jyri
 Sarha <jsarha@ti.com>, Benoit Parrot <bparrot@ti.com>
Subject: [PATCHv4 02/24] drm/bridge: tc358767: reset voltage-swing &
 pre-emphasis
Date: Tue, 28 May 2019 11:27:25 +0300
Message-ID: <20190528082747.3631-3-tomi.valkeinen@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190528082747.3631-1-tomi.valkeinen@ti.com>
References: <20190528082747.3631-1-tomi.valkeinen@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ti.com; s=ti-com-17Q1; t=1559032087;
 bh=YyyGfoBNgg9NBCusJmpiXF4UBG9Bb/du7Yi65Y83ykg=;
 h=From:To:CC:Subject:Date:In-Reply-To:References;
 b=EKqn7IqwgvKneOy+ZZFaLvslowRpFhfKQLmKuF0bT4Mdu38b2BBgvXvQJZj3VVszh
 rKI01odeJC5S9BQGF62kqiFkyOnSqXOUq6F/ZYyvtPKb8awUECXZx8inGoLAvdSkY0
 WzOyV5InNCJMofjtBitMrG/6Y4kiJbZGd9PVO7Fg=
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
Cc: Tomi Valkeinen <tomi.valkeinen@ti.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

V2UgbmVlZCB0byByZXNldCBEUENEIHZvbHRhZ2Utc3dpbmcgJiBwcmUtZW1waGFzaXMgYmVmb3Jl
IHN0YXJ0aW5nIHRoZQpsaW5rIHRyYWluaW5nLCBhcyBvdGhlcndpc2UgdGMzNTg3Njcgd2lsbCB1
c2UgdGhlIHByZXZpb3VzIHZhbHVlcyBhcwptaW5pbXVtcy4KClNpZ25lZC1vZmYtYnk6IFRvbWkg
VmFsa2VpbmVuIDx0b21pLnZhbGtlaW5lbkB0aS5jb20+ClJldmlld2VkLWJ5OiBBbmRyemVqIEhh
amRhIDxhLmhhamRhQHNhbXN1bmcuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9icmlkZ2UvdGMz
NTg3NjcuYyB8IDcgKysrKysrKwogMSBmaWxlIGNoYW5nZWQsIDcgaW5zZXJ0aW9ucygrKQoKZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2UvdGMzNTg3NjcuYyBiL2RyaXZlcnMvZ3B1
L2RybS9icmlkZ2UvdGMzNTg3NjcuYwppbmRleCBiNmM0ZDEwNjNjY2IuLmM4YjA0ZjcxMWRiMyAx
MDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS90YzM1ODc2Ny5jCisrKyBiL2RyaXZl
cnMvZ3B1L2RybS9icmlkZ2UvdGMzNTg3NjcuYwpAQCAtOTU2LDYgKzk1NiwxMyBAQCBzdGF0aWMg
aW50IHRjX21haW5fbGlua19zZXR1cChzdHJ1Y3QgdGNfZGF0YSAqdGMpCiAJaWYgKHJldCA8IDAp
CiAJCWdvdG8gZXJyX2RwY2Rfd3JpdGU7CiAKKwkvKiBSZXNldCB2b2x0YWdlLXN3aW5nICYgcHJl
LWVtcGhhc2lzICovCisJdG1wWzBdID0gdG1wWzFdID0gRFBfVFJBSU5fVk9MVEFHRV9TV0lOR19M
RVZFTF8wIHwKKwkJCSAgRFBfVFJBSU5fUFJFX0VNUEhfTEVWRUxfMDsKKwlyZXQgPSBkcm1fZHBf
ZHBjZF93cml0ZShhdXgsIERQX1RSQUlOSU5HX0xBTkUwX1NFVCwgdG1wLCAyKTsKKwlpZiAocmV0
IDwgMCkKKwkJZ290byBlcnJfZHBjZF93cml0ZTsKKwogCXJldCA9IHRjX2xpbmtfdHJhaW5pbmco
dGMsIERQX1RSQUlOSU5HX1BBVFRFUk5fMSk7CiAJaWYgKHJldCkKIAkJZ290byBlcnI7Ci0tIApU
ZXhhcyBJbnN0cnVtZW50cyBGaW5sYW5kIE95LCBQb3Jra2FsYW5rYXR1IDIyLCAwMDE4MCBIZWxz
aW5raS4KWS10dW5udXMvQnVzaW5lc3MgSUQ6IDA2MTU1MjEtNC4gS290aXBhaWtrYS9Eb21pY2ls
ZTogSGVsc2lua2kKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9y
ZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZl
bA==
