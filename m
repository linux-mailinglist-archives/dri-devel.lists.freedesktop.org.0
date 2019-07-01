Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E1105C4B6
	for <lists+dri-devel@lfdr.de>; Mon,  1 Jul 2019 22:59:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DBA7989D87;
	Mon,  1 Jul 2019 20:58:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB89B89498
 for <dri-devel@lists.freedesktop.org>; Mon,  1 Jul 2019 15:14:32 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
 by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x61FERSA124727;
 Mon, 1 Jul 2019 10:14:27 -0500
Received: from DLEE103.ent.ti.com (dlee103.ent.ti.com [157.170.170.33])
 by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x61FERJW055541
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Mon, 1 Jul 2019 10:14:27 -0500
Received: from DLEE100.ent.ti.com (157.170.170.30) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Mon, 1 Jul
 2019 10:14:26 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Mon, 1 Jul 2019 10:14:26 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id x61FEQDs043919;
 Mon, 1 Jul 2019 10:14:26 -0500
From: Jean-Jacques Hiblot <jjhiblot@ti.com>
To: <jacek.anaszewski@gmail.com>, <pavel@ucw.cz>, <robh+dt@kernel.org>,
 <mark.rutland@arm.com>, <lee.jones@linaro.org>,
 <daniel.thompson@linaro.org>, <jingoohan1@gmail.com>
Subject: [PATCH 0/4] Add a generic driver for LED-based backlight
Date: Mon, 1 Jul 2019 17:14:19 +0200
Message-ID: <20190701151423.30768-1-jjhiblot@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Mailman-Approved-At: Mon, 01 Jul 2019 20:58:29 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ti.com; s=ti-com-17Q1; t=1561994067;
 bh=8ZPMCskt8nRAXKm5rMG8eKdJwKab0ooefSSXjtYKA2w=;
 h=From:To:CC:Subject:Date;
 b=ecku1xWwcUY7k8zzijG0i0WVvjwfg/wYTo2GTb9ZFGj6PV7Ajm8qroD90sHlLA56C
 7bxb8XMqaZ5WJ0i73T+LXITf5/9cU0yq7EUMNV1kJeGHvN5NiSpYDA0kyPGXNDTYv/
 LzJPN0hog0Ni5E2XCZb+4RJbVpl6qwimqMqG6bUw=
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
a2VkIHRoZSB0aW1lIHRvIHdvcmsgb24gaXQuCgpUaGlzIHNlcmllcyB0YWtlcyBpdCBmcm9tIHRo
ZXJlIGFuZCBpbXBsZW1lbnRzIHRoZSBiaW5kaW5nIHRoYXQgd2FzCmRpc2N1c3NlZCBpbiBodHRw
czovL3BhdGNod29yay5rZXJuZWwub3JnL3BhdGNoLzcyOTM5OTEvLiBJbiB0aGlzIG5ldwpiaW5k
aW5nIHRoZSBiYWNrbGlnaHQgZGV2aWNlIGlzIGEgY2hpbGQgb2YgdGhlIExFRCBjb250cm9sbGVy
IGluc3RlYWQgb2YKYmVpbmcgYW5vdGhlciBwbGF0Zm9ybSBkZXZpY2UgdGhhdCB1c2VzIGEgcGhh
bmRsZSB0byByZWZlcmVuY2UgYSBMRUQuCgpKZWFuLUphY3F1ZXMgSGlibG90ICgyKToKICBsZWRz
OiBvZjogY3JlYXRlIGEgY2hpbGQgZGV2aWNlIGlmIHRoZSBMRUQgbm9kZSBjb250YWlucyBhCiAg
ICAiY29tcGF0aWJsZSIgc3RyaW5nCiAgZGV2aWNldHJlZTogVXBkYXRlIGxlZCBiaW5kaW5nCgpU
b21pIFZhbGtlaW5lbiAoMik6CiAgYmFja2xpZ2h0OiBhZGQgbGVkLWJhY2tsaWdodCBkcml2ZXIK
ICBkZXZpY2V0cmVlOiBBZGQgbGVkLWJhY2tsaWdodCBiaW5kaW5nCgogLi4uL2RldmljZXRyZWUv
YmluZGluZ3MvbGVkcy9jb21tb24udHh0ICAgICAgIHwgICAzICsKIC4uLi92aWRlby9iYWNrbGln
aHQvbGVkLWJhY2tsaWdodC50eHQgICAgICAgICB8ICAzOSArKysrCiBkcml2ZXJzL2xlZHMvbGVk
LWNsYXNzLmMgICAgICAgICAgICAgICAgICAgICAgfCAgMTYgKysKIGRyaXZlcnMvdmlkZW8vYmFj
a2xpZ2h0L0tjb25maWcgICAgICAgICAgICAgICB8ICAgNyArCiBkcml2ZXJzL3ZpZGVvL2JhY2ts
aWdodC9NYWtlZmlsZSAgICAgICAgICAgICAgfCAgIDEgKwogZHJpdmVycy92aWRlby9iYWNrbGln
aHQvbGVkX2JsLmMgICAgICAgICAgICAgIHwgMjE3ICsrKysrKysrKysrKysrKysrKwogaW5jbHVk
ZS9saW51eC9sZWRzLmggICAgICAgICAgICAgICAgICAgICAgICAgIHwgIDExICsKIDcgZmlsZXMg
Y2hhbmdlZCwgMjk0IGluc2VydGlvbnMoKykKIGNyZWF0ZSBtb2RlIDEwMDY0NCBEb2N1bWVudGF0
aW9uL2RldmljZXRyZWUvYmluZGluZ3MvdmlkZW8vYmFja2xpZ2h0L2xlZC1iYWNrbGlnaHQudHh0
CiBjcmVhdGUgbW9kZSAxMDA2NDQgZHJpdmVycy92aWRlby9iYWNrbGlnaHQvbGVkX2JsLmMKCi0t
IAoyLjE3LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpo
dHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
