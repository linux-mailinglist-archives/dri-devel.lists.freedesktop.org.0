Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B75A12C131
	for <lists+dri-devel@lfdr.de>; Tue, 28 May 2019 10:28:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C73989C1F;
	Tue, 28 May 2019 08:28:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D3AE189C1F
 for <dri-devel@lists.freedesktop.org>; Tue, 28 May 2019 08:28:06 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id x4S8S3cV125063;
 Tue, 28 May 2019 03:28:03 -0500
Received: from DLEE107.ent.ti.com (dlee107.ent.ti.com [157.170.170.37])
 by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x4S8S3kJ007830
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 28 May 2019 03:28:03 -0500
Received: from DLEE100.ent.ti.com (157.170.170.30) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Tue, 28
 May 2019 03:28:01 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Tue, 28 May 2019 03:28:01 -0500
Received: from deskari.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id x4S8RxuU125039;
 Tue, 28 May 2019 03:27:59 -0500
From: Tomi Valkeinen <tomi.valkeinen@ti.com>
To: <dri-devel@lists.freedesktop.org>, Andrzej Hajda <a.hajda@samsung.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Lucas Stach
 <l.stach@pengutronix.de>,
 Andrey Gusakov <andrey.gusakov@cogentembedded.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, Andrey Smirnov
 <andrew.smirnov@gmail.com>, Peter Ujfalusi <peter.ujfalusi@ti.com>, Jyri
 Sarha <jsarha@ti.com>, Benoit Parrot <bparrot@ti.com>
Subject: [PATCHv4 00/24] drm/bridge: tc358767: DP support
Date: Tue, 28 May 2019 11:27:23 +0300
Message-ID: <20190528082747.3631-1-tomi.valkeinen@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ti.com; s=ti-com-17Q1; t=1559032083;
 bh=R5sp09OHOWO5+KLSDKwjP3nxefsamy7OqDbkSedgpJE=;
 h=From:To:CC:Subject:Date;
 b=c3P45z3ZMmqsDb49UkA1gHuoVrZqn7xeNMVhrvBDfcmNckaRCXH4J6FC2EncF4Flc
 9m0ELolkiVqgoN9yIlzJpOnKY508veZNC8897w0o7CQ/9HDgg2kwfY1DV7XU19m9KP
 ki+hAwHkjbeKMl5s99eXKFLH+ff07MwIxb8BB/Xs=
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

SGksCgp0YzM1ODc2NyBicmlkZ2Ugd2FzIG9yaWdpbmFsbHkgaW1wbGVtZW50ZWQgZm9yIGVEUCB1
c2Ugd2l0aCBhbiBlbWJlZGRlZApwYW5lbC4gSSd2ZSBiZWVuIHdvcmtpbmcgdG8gYWRkIERQIGFu
ZCBIUEQgc3VwcG9ydCwgYW5kIHRoaXMgc2VyaWVzIGlzCnRoZSByZXN1bHQuIEkgZGlkIGhhdmUg
YSBsb3Qgb2YgaXNzdWVzIHdpdGggbGluayB0cmFpbmluZywgYnV0IHdpdGgKdGhlc2UsIGl0J3Mg
YmVlbiB3b3JraW5nIHJlbGlhYmx5IHdpdGggbXkgZGV2aWNlcy4KCkNoYW5nZXMgaW4gdjIKKiBE
cm9wICJpbXBsZW1lbnQgbmFpdmUgSFBEIGhhbmRsaW5nIiwgYW5kIGltcGxlbWVudCBIUEQgaW50
ZXJydXB0IGhhbmRsaW5nLgoKQ2hhbmdlcyBpbiB2MwoqIFZhcmlvdXMgc21hbGwgY29tbWVudCwg
ZGVzY3JpcHRpb24gYW5kIGZvcm1hdHRpbmcgY2hhbmdlcwoqICdocGQtbnVtJyBEVCBwcm9wZXJ0
eSByZW5hbWVkIHRvICd0b3NoaWJhLGhwZC1waW4nCiogQ2hlY2sgRFAwQ1RMID09IDAgYXQgdGhl
IGJlZ2lubmluZyBvZiB0Y19tYWluX2xpbmtfZW5hYmxlCiogRGlzYWJsZSBvbmx5IHRoZSB2aWRl
byBzdHJlYW0gaW4gdGNfc3RyZWFtX2Rpc2FibGUoKQoqIEZpeCB0Y19jb25uZWN0b3JfZGV0ZWN0
IGZvciBlRFAgcGFuZWxzCgpDaGFuZ2VzIGluIHY0CiogQWRkICJyZWFkIGRpc3BsYXlfcHJvcHMg
aW4gZ2V0X21vZGVzKCkiCiogUmVtb3ZlIHRoZSB0Y19nZXRfZGlzcGxheV9wcm9wcyBjYWxsIGZy
b20gZGV0ZWN0IGNhbGxiYWNrCiogRml4IHRoZSBEUDBDVEwgY2hlY2sgaW4gdGNfbWFpbl9saW5r
X2VuYWJsZS4gT25seSBjaGVjayBmb3IgRFBfRU4gYml0LAogIGFzIHdlIGNhbiBoYXZlIG90aGVy
IGJpdHMgc2V0IChlLmcuIGFmdGVyIHJlc2V0IFZJRF9NTl9HRU4gaXMgc2V0KQoqIEFkZGVkIHNv
bWUgcmV2aWV3ZWQtYnlzCgogVG9taQoKVG9taSBWYWxrZWluZW4gKDI0KToKICBkcm0vYnJpZGdl
OiB0YzM1ODc2NzogZml4IHRjX2F1eF9nZXRfc3RhdHVzIGVycm9yIGhhbmRsaW5nCiAgZHJtL2Jy
aWRnZTogdGMzNTg3Njc6IHJlc2V0IHZvbHRhZ2Utc3dpbmcgJiBwcmUtZW1waGFzaXMKICBkcm0v
YnJpZGdlOiB0YzM1ODc2NzogZml4IGFuc2kgOGIxMGIgdXNlCiAgZHJtL2JyaWRnZTogdGMzNTg3
Njc6IGNsZWFudXAgc3ByZWFkICYgc2NyYW1ibGVyX2RpcwogIGRybS9icmlkZ2U6IHRjMzU4NzY3
OiByZW1vdmUgdW51c2VkIHN3aW5nICYgcHJlZW1wCiAgZHJtL2JyaWRnZTogdGMzNTg3Njc6IGNs
ZWFudXAgYXV4X2xpbmtfc2V0dXAKICBkcm0vYnJpZGdlOiB0YzM1ODc2NzogbW92ZSB2aWRlbyBz
dHJlYW0gc2V0dXAgdG8gdGNfbWFpbl9saW5rX3N0cmVhbQogIGRybS9icmlkZ2U6IHRjMzU4NzY3
OiBzcGxpdCBzdHJlYW0gZW5hYmxlL2Rpc2FibGUKICBkcm0vYnJpZGdlOiB0YzM1ODc2NzogbW92
ZSBQWEwgUExMIGVuYWJsZS9kaXNhYmxlIHRvIHN0cmVhbQogICAgZW5hYmxlL2Rpc2FibGUKICBk
cm0vYnJpZGdlOiB0YzM1ODc2NzogYWRkIGxpbmsgZGlzYWJsZSBmdW5jdGlvbgogIGRybS9icmlk
Z2U6IHRjMzU4NzY3OiBkaXNhYmxlIG9ubHkgdmlkZW8gc3RyZWFtIGluIHRjX3N0cmVhbV9kaXNh
YmxlCiAgZHJtL2JyaWRnZTogdGMzNTg3Njc6IGVuc3VyZSBEUCBpcyBkaXNhYmxlZCBiZWZvcmUg
TFQKICBkcm0vYnJpZGdlOiB0YzM1ODc2NzogcmVtb3ZlIHVubmVjZXNzYXJ5IG1zbGVlcAogIGRy
bS9icmlkZ2U6IHRjMzU4NzY3OiB1c2UgbW9yZSByZWxpYWJsZSBzZXEgd2hlbiBmaW5pc2hpbmcg
TFQKICBkcm0vYnJpZGdlOiB0YzM1ODc2NzogY2xlYW51cCBMVCByZXN1bHQgY2hlY2sKICBkcm0v
YnJpZGdlOiB0YzM1ODc2NzogY2xlYW4tdXAgbGluayB0cmFpbmluZwogIGRybS9icmlkZ2U6IHRj
MzU4NzY3OiByZW1vdmUgY2hlY2sgZm9yIHZpZGVvIG1vZGUgaW4gbGluayBlbmFibGUKICBkcm0v
YnJpZGdlOiB0YzM1ODc2NzogdXNlIGJyaWRnZSBtb2RlX3ZhbGlkCiAgZHJtL2JyaWRnZTogdGMz
NTg3Njc6IHJlbW92ZSB0Y19jb25uZWN0b3JfYmVzdF9lbmNvZGVyCiAgZHJtL2JyaWRnZTogdGMz
NTg3Njc6IGNvcHkgdGhlIG1vZGUgZGF0YSwgaW5zdGVhZCBvZiBzdG9yaW5nIHRoZQogICAgcG9p
bnRlcgogIGRybS9icmlkZ2U6IHRjMzU4NzY3OiByZWFkIGRpc3BsYXlfcHJvcHMgaW4gZ2V0X21v
ZGVzKCkKICBkcm0vYnJpZGdlOiB0YzM1ODc2NzogYWRkIEdQSU8gJiBpbnRlcnJ1cHQgcmVnaXN0
ZXJzCiAgZHJtL2JyaWRnZTogdGMzNTg3Njc6IGFkZCBJUlEgYW5kIEhQRCBzdXBwb3J0CiAgZHQt
YmluZGluZ3M6IHRjMzU4NzY3OiBhZGQgSFBEIHN1cHBvcnQKCiAuLi4vZGlzcGxheS9icmlkZ2Uv
dG9zaGliYSx0YzM1ODc2Ny50eHQgICAgICAgfCAgIDEgKwogZHJpdmVycy9ncHUvZHJtL2JyaWRn
ZS90YzM1ODc2Ny5jICAgICAgICAgICAgIHwgNTkzICsrKysrKysrKysrLS0tLS0tLQogMiBmaWxl
cyBjaGFuZ2VkLCAzODIgaW5zZXJ0aW9ucygrKSwgMjEyIGRlbGV0aW9ucygtKQoKLS0KVGV4YXMg
SW5zdHJ1bWVudHMgRmlubGFuZCBPeSwgUG9ya2thbGFua2F0dSAyMiwgMDAxODAgSGVsc2lua2ku
ClktdHVubnVzL0J1c2luZXNzIElEOiAwNjE1NTIxLTQuIEtvdGlwYWlra2EvRG9taWNpbGU6IEhl
bHNpbmtpCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpk
cmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
