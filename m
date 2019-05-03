Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 721F712D8C
	for <lists+dri-devel@lfdr.de>; Fri,  3 May 2019 14:30:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C452589133;
	Fri,  3 May 2019 12:30:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E713689133
 for <dri-devel@lists.freedesktop.org>; Fri,  3 May 2019 12:30:42 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
 by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x43CUdaS032059;
 Fri, 3 May 2019 07:30:39 -0500
Received: from DFLE108.ent.ti.com (dfle108.ent.ti.com [10.64.6.29])
 by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x43CUd5G109815
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Fri, 3 May 2019 07:30:39 -0500
Received: from DFLE111.ent.ti.com (10.64.6.32) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Fri, 3 May
 2019 07:30:37 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Fri, 3 May 2019 07:30:37 -0500
Received: from deskari.lan (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id x43CUYti002029;
 Fri, 3 May 2019 07:30:35 -0500
From: Tomi Valkeinen <tomi.valkeinen@ti.com>
To: Andrzej Hajda <a.hajda@samsung.com>, Laurent Pinchart
 <Laurent.pinchart@ideasonboard.com>, Lucas Stach <l.stach@pengutronix.de>,
 Andrey Gusakov <andrey.gusakov@cogentembedded.com>, Philipp Zabel
 <p.zabel@pengutronix.de>, Andrey Smirnov <andrew.smirnov@gmail.com>, Peter
 Ujfalusi <peter.ujfalusi@ti.com>, Jyri Sarha <jsarha@ti.com>, Benoit Parrot
 <bparrot@ti.com>, <dri-devel@lists.freedesktop.org>
Subject: [PATCHv3 00/23] drm/bridge: tc358767: DP support
Date: Fri, 3 May 2019 15:29:26 +0300
Message-ID: <20190503122949.12266-1-tomi.valkeinen@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ti.com; s=ti-com-17Q1; t=1556886639;
 bh=pxJs6MXObe02Tpc2Yubrzu74isRM8jGP3RKsuDJkF38=;
 h=From:To:CC:Subject:Date;
 b=n55+BQnaloPPKoAOV41yJlnNYJW/NhZR/qGhWUG4XJQVONMQ3BNewTnfURKRPTcT3
 YdEgQVT1DQGGyrFaDrzUaZjKYi9xQ0lKjOi0qfkuDlWCJg4FZpV7jNdUOlKF0uCw5U
 pRUmd8qo5ZLPrs2YM33AYYDB18Q8Zty/mZKPx88k=
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
IGZvciBlRFAgcGFuZWxzCgogVG9taQoKVG9taSBWYWxrZWluZW4gKDIzKToKICBkcm0vYnJpZGdl
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
bnRlcgogIGRybS9icmlkZ2U6IHRjMzU4NzY3OiBhZGQgR1BJTyAmIGludGVycnVwdCByZWdpc3Rl
cnMKICBkcm0vYnJpZGdlOiB0YzM1ODc2NzogYWRkIElSUSBhbmQgSFBEIHN1cHBvcnQKICBkdC1i
aW5kaW5nczogdGMzNTg3Njc6IGFkZCBIUEQgc3VwcG9ydAoKIC4uLi9kaXNwbGF5L2JyaWRnZS90
b3NoaWJhLHRjMzU4NzY3LnR4dCAgICAgICB8ICAgMSArCiBkcml2ZXJzL2dwdS9kcm0vYnJpZGdl
L3RjMzU4NzY3LmMgICAgICAgICAgICAgfCA1ODkgKysrKysrKysrKystLS0tLS0tCiAyIGZpbGVz
IGNoYW5nZWQsIDM3OCBpbnNlcnRpb25zKCspLCAyMTIgZGVsZXRpb25zKC0pCgotLSAKVGV4YXMg
SW5zdHJ1bWVudHMgRmlubGFuZCBPeSwgUG9ya2thbGFua2F0dSAyMiwgMDAxODAgSGVsc2lua2ku
ClktdHVubnVzL0J1c2luZXNzIElEOiAwNjE1NTIxLTQuIEtvdGlwYWlra2EvRG9taWNpbGU6IEhl
bHNpbmtpCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpk
cmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
