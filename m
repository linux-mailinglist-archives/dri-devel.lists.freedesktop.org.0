Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 02FF96465A
	for <lists+dri-devel@lfdr.de>; Wed, 10 Jul 2019 14:39:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CBFFA89789;
	Wed, 10 Jul 2019 12:39:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 88EB089745
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Jul 2019 12:39:43 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id x6ACdcQ5118639;
 Wed, 10 Jul 2019 07:39:38 -0500
Received: from DFLE104.ent.ti.com (dfle104.ent.ti.com [10.64.6.25])
 by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x6ACdblg038225
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Wed, 10 Jul 2019 07:39:38 -0500
Received: from DFLE107.ent.ti.com (10.64.6.28) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Wed, 10
 Jul 2019 07:39:37 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Wed, 10 Jul 2019 07:39:37 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id x6ACdaGP129983;
 Wed, 10 Jul 2019 07:39:37 -0500
From: Jean-Jacques Hiblot <jjhiblot@ti.com>
To: <jacek.anaszewski@gmail.com>, <pavel@ucw.cz>, <robh+dt@kernel.org>,
 <mark.rutland@arm.com>, <lee.jones@linaro.org>,
 <daniel.thompson@linaro.org>, <jingoohan1@gmail.com>
Subject: [PATCH v3 0/4]  Add a generic driver for LED-based backlight
Date: Wed, 10 Jul 2019 14:39:28 +0200
Message-ID: <20190710123932.28244-1-jjhiblot@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ti.com; s=ti-com-17Q1; t=1562762378;
 bh=BTg5sJ09hjAmyl9lV+ilPYbUgyB7pc/IyYE4O6pyJNg=;
 h=From:To:CC:Subject:Date;
 b=f+I7sA0qzyuQ2pQ8bnAoApuFmtKmigmtUkGL/TDv5ciZM7slZuci4K3w7mQAcOKLI
 NOMLwvSAJwPfhS7vwk2G2K/cXFNUrw0i9xLCnMrzpogtlaQBdKw7GjI6zWykqHy8zk
 429fY1PcdLlH35slyhOLN6BbHl3chdblMasKQZR0=
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
a2VkIHRoZSB0aW1lIHRvIHdvcmsgb24gaXQuCgpjaGFuZ2VzIGluIHYzOgotIGR0IGJpbmRpbmc6
IGRvbid0IGxpbWl0IHRoZSBicmlnaHRuZXNzIHJhbmdlIHRvIDAtMjU1LiBVc2UgdGhlIHJhbmdl
IG9mCiAgdGhlIHVuZGVybHlpbmcgTEVEcy4gYXMgYSBzaWRlLWVmZmVjdCwgYWxsIExFRHMgbXVz
dCBub3cgaGF2ZSB0aGUgc2FtZQogIHJhbmdlCi0gZHJpdmVyOiBBZGFwdCB0byBkdCBiaW5kaW5n
IHVwZGF0ZS4KLSBkcml2ZXI6IHJld29yayBwcm9iZSgpIGZvciBjbGFyaXR5IGFuZCByZW1vdmUg
dGhlIHJlbWFpbmluZyBnb3RvLgoKY2hhbmdlcyBpbiB2MjoKLSBoYW5kbGUgbW9yZSB0aGFuIG9u
ZSBMRUQuCi0gZG9uJ3QgbWFrZSB0aGUgYmFja2xpZ2h0IGRldmljZSBhIGNoaWxkIG9mIHRoZSBM
RUQgY29udHJvbGxlci4KLSBtYWtlIGJyaWdodG5lc3MtbGV2ZWxzIGFuZCBkZWZhdWx0LWJyaWdo
dG5lc3MtbGV2ZWwgb3B0aW9ubmFsCi0gcmVtb3ZlZCB0aGUgb3B0aW9uIHRvIHVzZSBhIEdQSU8g
ZW5hYmxlLgotIHJlbW92ZWQgdGhlIG9wdGlvbiB0byB1c2UgYSByZWd1bGF0b3IuIEl0IHNob3Vs
ZCBiZSBoYW5kbGVkIGJ5IHRoZSBMRUQgY29yZQotIGRvbid0IG1ha2UgYW55IGNoYW5nZSB0byB0
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
