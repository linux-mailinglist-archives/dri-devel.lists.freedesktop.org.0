Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 95D8E10CCFD
	for <lists+dri-devel@lfdr.de>; Thu, 28 Nov 2019 17:45:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B9306E864;
	Thu, 28 Nov 2019 16:45:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C8CA6E862
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Nov 2019 16:45:02 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id xASGj0xj050976;
 Thu, 28 Nov 2019 10:45:00 -0600
Received: from DLEE106.ent.ti.com (dlee106.ent.ti.com [157.170.170.36])
 by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id xASGj0aK124457;
 Thu, 28 Nov 2019 10:45:00 -0600
Received: from DLEE110.ent.ti.com (157.170.170.21) by DLEE106.ent.ti.com
 (157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Thu, 28
 Nov 2019 10:44:59 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Thu, 28 Nov 2019 10:44:59 -0600
Received: from jadmar.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id xASGiwDu120495;
 Thu, 28 Nov 2019 10:44:59 -0600
From: Jyri Sarha <jsarha@ti.com>
To: <dri-devel@lists.freedesktop.org>
Subject: [PATCH 0/2] drm/panel: simple: Rocktech RK101II01D-CT + binding
Date: Thu, 28 Nov 2019 18:44:58 +0200
Message-ID: <cover.1574959312.git.jsarha@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ti.com; s=ti-com-17Q1; t=1574959500;
 bh=Jl7zea189+aod4JNMbLwlsGpEPXrUXayUvE7XpAoFI0=;
 h=From:To:CC:Subject:Date;
 b=nixI5ZQeeMGTTTx6v/ZzBK4Y5b+EwivN5O8XK4EqhYZrrWEhoSNEPw0HsdFgsRcHN
 K1ewTM2juhxo5jce1u6frKI9U4j0MTnI5erO12DxBrUjE8/zEpwrgx81u2b40YmkL7
 8mggrQDcyfP9PoQW87ysQGMJ7heR479P+X5TO/Dk=
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

QWRkIHN1cHBvcnQgZm9yIFJvY2t0ZWNoIFJLMTAxSUkwMUQtQ1QgcGFuZWwgdG8gcGFuZWwtc2lt
cGxlIGFuZCBhZGQKeWFtbCBiaW5kaW5nIGZvciBpdC4KCkp5cmkgU2FyaGEgKDIpOgogIGR0LWJp
bmRpbmdzOiBkaXNwbGF5OiBEVCBzY2hlbWEgZm9yIHJvY2t0ZWNoLHJrMTAxaWkwMWQtY3QgcGFu
ZWwKICBkcm0vcGFuZWw6IHNpbXBsZTogQWRkIFJvY2t0ZWNoIFJLMTAxSUkwMUQtQ1QgcGFuZWwK
CiAuLi4vZGlzcGxheS9wYW5lbC9yb2NrdGVjaCxyazEwMWlpMDFkLWN0LnlhbWwgfCA0OCArKysr
KysrKysrKysrKysrKysrCiBkcml2ZXJzL2dwdS9kcm0vcGFuZWwvcGFuZWwtc2ltcGxlLmMgICAg
ICAgICAgfCAzMiArKysrKysrKysrKysrCiAyIGZpbGVzIGNoYW5nZWQsIDgwIGluc2VydGlvbnMo
KykKIGNyZWF0ZSBtb2RlIDEwMDY0NCBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mv
ZGlzcGxheS9wYW5lbC9yb2NrdGVjaCxyazEwMWlpMDFkLWN0LnlhbWwKCi0tIApUZXhhcyBJbnN0
cnVtZW50cyBGaW5sYW5kIE95LCBQb3Jra2FsYW5rYXR1IDIyLCAwMDE4MCBIZWxzaW5raS4gWS10
dW5udXMvQnVzaW5lc3MgSUQ6IDA2MTU1MjEtNC4gS290aXBhaWtrYS9Eb21pY2lsZTogSGVsc2lu
a2kKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1k
ZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczov
L2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
