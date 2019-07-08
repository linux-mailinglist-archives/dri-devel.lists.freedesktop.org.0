Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A46CF61CE3
	for <lists+dri-devel@lfdr.de>; Mon,  8 Jul 2019 12:27:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BEA5C89C54;
	Mon,  8 Jul 2019 10:27:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8CB6689C54
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Jul 2019 10:27:13 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
 by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id x68AR7Mh046374;
 Mon, 8 Jul 2019 05:27:07 -0500
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
 by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x68AR7wg067624
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Mon, 8 Jul 2019 05:27:07 -0500
Received: from DFLE111.ent.ti.com (10.64.6.32) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Mon, 8 Jul
 2019 05:27:07 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Mon, 8 Jul 2019 05:27:07 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id x68AR6iR027045;
 Mon, 8 Jul 2019 05:27:06 -0500
From: Jean-Jacques Hiblot <jjhiblot@ti.com>
To: <jacek.anaszewski@gmail.com>, <pavel@ucw.cz>, <robh+dt@kernel.org>,
 <mark.rutland@arm.com>, <lee.jones@linaro.org>,
 <daniel.thompson@linaro.org>, <jingoohan1@gmail.com>
Subject: [PATCH v2 0/4] Add a generic driver for LED-based backlight
Date: Mon, 8 Jul 2019 12:26:56 +0200
Message-ID: <20190708102700.23138-1-jjhiblot@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ti.com; s=ti-com-17Q1; t=1562581627;
 bh=HwCXjka0RmqRpxs+JE1gaFV+rhErQ4TXr2QzAWjVo4c=;
 h=From:To:CC:Subject:Date;
 b=jX7CUX1tXXxMIRIotb4+unqebNpm42gFjFydr1TLL9mTSgL31TN7iw8W1O5zySCM+
 epIJHiMbmt3SLWT5a5Aur4XYvMwF6LsqcaENw6uf2NBwykB4nmjZi5LTGRgvJiU3rX
 5v4uFvwEB+UUuZWEqqX6DLOstZh+jhu77vnG1EI0=
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 tomi.valkeinen@ti.com, dmurphy@ti.com, Jean-Jacques Hiblot <jjhiblot@ti.com>,
 linux-leds@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhpcyBzZXJpZXMgYWltcyB0byBhZGQgYSBsZWQtYmFja2xpZ2h0IGRyaXZlciwgc2ltaWxhciB0
byBwd20tYmFja2xpZ2h0LApidXQgdXNpbmcgYSBMRUQgY2xhc3MgZGV2aWNlIHVuZGVybmVhdGgu
CgpBIGZldyB5ZWFycyBhZ28gKDIwMTUpLCBUb21pIFZhbGtlaW5lbiBwb3N0ZWQgYSBzZXJpZXMg
aW1wbGVtZW50aW5nIGEKYmFja2xpZ2h0IGRyaXZlciBvbiB0b3Agb2YgYSBMRUQgZGV2aWNlOgpo
dHRwczovL3BhdGNod29yay5rZXJuZWwub3JnL3BhdGNoLzcyOTM5OTEvCmh0dHBzOi8vcGF0Y2h3
b3JrLmtlcm5lbC5vcmcvcGF0Y2gvNzI5NDAwMS8KaHR0cHM6Ly9wYXRjaHdvcmsua2VybmVsLm9y
Zy9wYXRjaC83MjkzOTgxLwoKVGhlIGRpc2N1c3Npb24gc3RvcHBlZCBiZWNhdXNlIFRvbWkgbGFj
a2VkIHRoZSB0aW1lIHRvIHdvcmsgb24gaXQuCgpUaGUgc2VyaWVzIGFmZmVjdHMgdGhlIExFRCBj
b3JlIGFuZCBhZGQgYSBuZXcgYmFja2xpZ2h0IGRyaXZlci4KCmNoYW5nZXMgaW4gdjI6Ci0gYmts
OiB0aGUgYmFja2xpZ2h0IGNhbiB1c2UgbW9yZSB0aGFuIG9uZSBMRUQuIEFzIGEgY29uc2VxdWVu
Y2UgZG9uJ3QgbWFrZQogIHRoZSBiYWNrbGlnaHQgZGV2aWNlIGEgY2hpbGQgb2YgYSBMRUQgY29u
dHJvbGxlci4KLSBia2w6IG1ha2UgYnJpZ2h0bmVzcy1sZXZlbHMgYW5kIGRlZmF1bHQtYnJpZ2h0
bmVzcy1sZXZlbCBvcHRpb25hbAotIGJrbDogcmVtb3ZlZCB0aGUgb3B0aW9uIHRvIHVzZSBhIEdQ
SU8gZW5hYmxlLgotIGJrbDogcmVtb3ZlZCB0aGUgb3B0aW9uIHRvIHVzZSBhIHJlZ3VsYXRvci4g
SXQgc2hvdWxkIGJlIGhhbmRsZWQgYnkgdGhlCiAgTEVEIGNvcmUKLSBsZWQ6IHJlbW92ZWQgdGhl
IG1lY2hhbmlzbSB0byBiaW5kIGEgY2hpbGQgZGV2aWNlIGZvciBlYWNoIExFRAotIGxlZDogaW1w
cm92ZSB0aGUgd2F5IG9mX2dldF9sZWQoKSB3b3JrcyBhbmQgYWRkIGEgbWFuYWdlZCB2ZXJzaW9u
IG9mIGl0CgpKZWFuLUphY3F1ZXMgSGlibG90ICgyKToKICBsZWRzOiBBZGQgbWFuYWdlZCBBUEkg
dG8gZ2V0IGEgTEVEIGZyb20gYSBkZXZpY2UgZHJpdmVyCiAgZHQtYmluZGluZ3M6IGJhY2tsaWdo
dDogQWRkIGxlZC1iYWNrbGlnaHQgYmluZGluZwoKVG9taSBWYWxrZWluZW4gKDIpOgogIGxlZHM6
IEFkZCBvZl9sZWRfZ2V0KCkgYW5kIGxlZF9wdXQoKQogIGJhY2tsaWdodDogYWRkIGxlZC1iYWNr
bGlnaHQgZHJpdmVyCgogLi4uL2JpbmRpbmdzL2xlZHMvYmFja2xpZ2h0L2xlZC1iYWNrbGlnaHQu
dHh0IHwgIDI5ICsrKwogZHJpdmVycy9sZWRzL2xlZC1jbGFzcy5jICAgICAgICAgICAgICAgICAg
ICAgIHwgIDkyICsrKysrKysKIGRyaXZlcnMvdmlkZW8vYmFja2xpZ2h0L0tjb25maWcgICAgICAg
ICAgICAgICB8ICAgNyArCiBkcml2ZXJzL3ZpZGVvL2JhY2tsaWdodC9NYWtlZmlsZSAgICAgICAg
ICAgICAgfCAgIDEgKwogZHJpdmVycy92aWRlby9iYWNrbGlnaHQvbGVkX2JsLmMgICAgICAgICAg
ICAgIHwgMjM1ICsrKysrKysrKysrKysrKysrKwogaW5jbHVkZS9saW51eC9sZWRzLmggICAgICAg
ICAgICAgICAgICAgICAgICAgIHwgICA2ICsKIDYgZmlsZXMgY2hhbmdlZCwgMzcwIGluc2VydGlv
bnMoKykKIGNyZWF0ZSBtb2RlIDEwMDY0NCBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGlu
Z3MvbGVkcy9iYWNrbGlnaHQvbGVkLWJhY2tsaWdodC50eHQKIGNyZWF0ZSBtb2RlIDEwMDY0NCBk
cml2ZXJzL3ZpZGVvL2JhY2tsaWdodC9sZWRfYmwuYwoKLS0gCjIuMTcuMQoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlz
dApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0
b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
