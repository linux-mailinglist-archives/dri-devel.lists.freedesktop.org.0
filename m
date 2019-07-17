Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C52C76BDF9
	for <lists+dri-devel@lfdr.de>; Wed, 17 Jul 2019 16:15:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D3EA16E0A2;
	Wed, 17 Jul 2019 14:15:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC11D89174
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Jul 2019 14:15:25 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
 by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id x6HEFJVe036361;
 Wed, 17 Jul 2019 09:15:19 -0500
Received: from DFLE103.ent.ti.com (dfle103.ent.ti.com [10.64.6.24])
 by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x6HEFJTe075585
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Wed, 17 Jul 2019 09:15:19 -0500
Received: from DFLE111.ent.ti.com (10.64.6.32) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Wed, 17
 Jul 2019 09:15:18 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Wed, 17 Jul 2019 09:15:18 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id x6HEFISC094769;
 Wed, 17 Jul 2019 09:15:18 -0500
From: Jean-Jacques Hiblot <jjhiblot@ti.com>
To: <jacek.anaszewski@gmail.com>, <pavel@ucw.cz>, <robh+dt@kernel.org>,
 <mark.rutland@arm.com>, <lee.jones@linaro.org>,
 <daniel.thompson@linaro.org>, <jingoohan1@gmail.com>
Subject: [PATCH v4 0/4] Add a generic driver for LED-based backlight
Date: Wed, 17 Jul 2019 16:15:10 +0200
Message-ID: <20190717141514.21171-1-jjhiblot@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ti.com; s=ti-com-17Q1; t=1563372919;
 bh=wmbVRRCj0IguumeyCLY5alwgve2QCszThM26fNaNT+Y=;
 h=From:To:CC:Subject:Date;
 b=FL+rfY1tSw0CRmepUeFIGKWqbgEIkpZ8eJccIH74o24uxCCleH9Zj51c4aCuwdP2Q
 uFDEUT4yOz8UC6L7x43DFU1HhdEs4ABUw2ArnBm3Qj2hcgltu8QBmD3z7wfQekmEiE
 GmAp5CHpQv0munbNjwly3GORfeXCHvNCtHsaBsIk=
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
a2VkIHRoZSB0aW1lIHRvIHdvcmsgb24gaXQuCgpjaGFuZ2VzIGluIHY0OgotIGZpeCBkZXZfZXJy
KCkgbWVzc2FnZXMgYW5kIGNvbW1pdCBsb2dzIGZvbGxvd2luZyB0aGUgYWR2aWNlcyBvZiBQYXZl
bAotIGNvc21ldGljIGNoYW5nZXMgKGluZGVudHMsIGdldHRpbmcgcmlkIG9mICAiPyAxIDogMCIg
aW4KICBsZWRfbWF0Y2hfbGVkX25vZGUoKSkKCmNoYW5nZXMgaW4gdjM6Ci0gZHQgYmluZGluZzog
ZG9uJ3QgbGltaXQgdGhlIGJyaWdodG5lc3MgcmFuZ2UgdG8gMC0yNTUuIFVzZSB0aGUgcmFuZ2Ug
b2YKICB0aGUgdW5kZXJseWluZyBMRURzLiBhcyBhIHNpZGUtZWZmZWN0LCBhbGwgTEVEcyBtdXN0
IG5vdyBoYXZlIHRoZSBzYW1lCiAgcmFuZ2UKLSBkcml2ZXI6IEFkYXB0IHRvIGR0IGJpbmRpbmcg
dXBkYXRlLgotIGRyaXZlcjogcmV3b3JrIHByb2JlKCkgZm9yIGNsYXJpdHkgYW5kIHJlbW92ZSB0
aGUgcmVtYWluaW5nIGdvdG8uCgpjaGFuZ2VzIGluIHYyOgotIGhhbmRsZSBtb3JlIHRoYW4gb25l
IExFRC4KLSBkb24ndCBtYWtlIHRoZSBiYWNrbGlnaHQgZGV2aWNlIGEgY2hpbGQgb2YgdGhlIExF
RCBjb250cm9sbGVyLgotIG1ha2UgYnJpZ2h0bmVzcy1sZXZlbHMgYW5kIGRlZmF1bHQtYnJpZ2h0
bmVzcy1sZXZlbCBvcHRpb25hbAotIHJlbW92ZWQgdGhlIG9wdGlvbiB0byB1c2UgYSBHUElPIGVu
YWJsZS4KLSByZW1vdmVkIHRoZSBvcHRpb24gdG8gdXNlIGEgcmVndWxhdG9yLiBJdCBzaG91bGQg
YmUgaGFuZGxlZCBieSB0aGUgTEVECiAgY29yZQotIGRvbid0IG1ha2UgYW55IGNoYW5nZSB0byB0
aGUgTEVEIGNvcmUgKG5vdCBuZWVkZWQgYW55bW9yZSkKCkplYW4tSmFjcXVlcyBIaWJsb3QgKDIp
OgogIGxlZHM6IEFkZCBtYW5hZ2VkIEFQSSB0byBnZXQgYSBMRUQgZnJvbSBhIGRldmljZSBkcml2
ZXIKICBkdC1iaW5kaW5nczogYmFja2xpZ2h0OiBBZGQgbGVkLWJhY2tsaWdodCBiaW5kaW5nCgpU
b21pIFZhbGtlaW5lbiAoMik6CiAgbGVkczogQWRkIG9mX2xlZF9nZXQoKSBhbmQgbGVkX3B1dCgp
CiAgYmFja2xpZ2h0OiBhZGQgbGVkLWJhY2tsaWdodCBkcml2ZXIKCiAuLi4vYmluZGluZ3MvbGVk
cy9iYWNrbGlnaHQvbGVkLWJhY2tsaWdodC50eHQgfCAgMjggKysKIGRyaXZlcnMvbGVkcy9sZWQt
Y2xhc3MuYyAgICAgICAgICAgICAgICAgICAgICB8ICA5MiArKysrKysKIGRyaXZlcnMvdmlkZW8v
YmFja2xpZ2h0L0tjb25maWcgICAgICAgICAgICAgICB8ICAgNyArCiBkcml2ZXJzL3ZpZGVvL2Jh
Y2tsaWdodC9NYWtlZmlsZSAgICAgICAgICAgICAgfCAgIDEgKwogZHJpdmVycy92aWRlby9iYWNr
bGlnaHQvbGVkX2JsLmMgICAgICAgICAgICAgIHwgMjY4ICsrKysrKysrKysrKysrKysrKwogaW5j
bHVkZS9saW51eC9sZWRzLmggICAgICAgICAgICAgICAgICAgICAgICAgIHwgICA2ICsKIDYgZmls
ZXMgY2hhbmdlZCwgNDAyIGluc2VydGlvbnMoKykKIGNyZWF0ZSBtb2RlIDEwMDY0NCBEb2N1bWVu
dGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbGVkcy9iYWNrbGlnaHQvbGVkLWJhY2tsaWdodC50
eHQKIGNyZWF0ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL3ZpZGVvL2JhY2tsaWdodC9sZWRfYmwuYwoK
LS0gCjIuMTcuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
Cmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
