Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 95733C22F7
	for <lists+dri-devel@lfdr.de>; Mon, 30 Sep 2019 16:16:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3473D6E44C;
	Mon, 30 Sep 2019 14:16:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 189526E44C
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Sep 2019 14:16:01 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id x8UEFul7007708;
 Mon, 30 Sep 2019 09:15:56 -0500
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
 by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x8UEFux8057433
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Mon, 30 Sep 2019 09:15:56 -0500
Received: from DFLE103.ent.ti.com (10.64.6.24) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Mon, 30
 Sep 2019 09:15:46 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Mon, 30 Sep 2019 09:15:55 -0500
Received: from jadmar.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id x8UEFrmV049308;
 Mon, 30 Sep 2019 09:15:54 -0500
From: Jyri Sarha <jsarha@ti.com>
To: <dri-devel@lists.freedesktop.org>
Subject: [PATCH] drm/tilcdc: include linux/pinctrl/consumer.h again
Date: Mon, 30 Sep 2019 17:15:53 +0300
Message-ID: <02b03f74cf941f52a941a36bdc8dabb4a69fd87e.1569852588.git.jsarha@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ti.com; s=ti-com-17Q1; t=1569852956;
 bh=aVxK7I0xRfnhiDOQVcPKr6uhDSx7s329of8siC22uEc=;
 h=From:To:CC:Subject:Date;
 b=lZHyYCoF+P1qGHrxR/JBQttlTw1NroZsbqGvhfvJvOxIUWPVQeR46YE1YXMiLN6K+
 j7Jkxs7BwkKI/5HylUUAaEAxIF8pOFLWm4nUGj4oeKQyMK62sgprW4MQeWHXAc2Aek
 ORYZMisOtyEzzdtx6G8GFaKA8ikwqlShI02LUjG0=
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
Cc: sam@ravnborg.org, arnd@arndb.de, laurent.pinchart@ideasonboard.com,
 jsarha@ti.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogQXJuZCBCZXJnbWFubiA8YXJuZEBhcm5kYi5kZT4KClRoaXMgd2FzIGFwcGFyZW50bHkg
ZHJvcHBlZCBieSBhY2NpZGVudCBpbiBhIHJlY2VudApjbGVhbnVwLCBjYXVzaW5nIGEgYnVpbGQg
ZmFpbHVyZSBpbiBzb21lIGNvbmZpZ3VyYXRpb25zIG5vdzoKCmRyaXZlcnMvZ3B1L2RybS90aWxj
ZGMvdGlsY2RjX3RmcDQxMC5jOjI5NjoxMjogZXJyb3I6IGltcGxpY2l0IGRlY2xhcmF0aW9uIG9m
IGZ1bmN0aW9uICdkZXZtX3BpbmN0cmxfZ2V0X3NlbGVjdF9kZWZhdWx0JyBbLVdlcnJvciwtV2lt
cGxpY2l0LWZ1bmN0aW9uLWRlY2xhcmF0aW9uXQoKRml4ZXM6IGZjYjU3NjY0MTcyZSAoImRybS90
aWxjZGM6IGRyb3AgdXNlIG9mIGRybVAuaCIpClNpZ25lZC1vZmYtYnk6IEFybmQgQmVyZ21hbm4g
PGFybmRAYXJuZGIuZGU+ClJldmlld2VkLWJ5OiBMYXVyZW50IFBpbmNoYXJ0IDxsYXVyZW50LnBp
bmNoYXJ0QGlkZWFzb25ib2FyZC5jb20+ClNpZ25lZC1vZmYtYnk6IEp5cmkgU2FyaGEgPGpzYXJo
YUB0aS5jb20+Ci0tLQpKdXN0IHJlb3JkZXJlZCB0aGUgaW5jbHVkZXMgaW4gYXBsaGFwZXRpY2Fs
IG9yZGVyIGFuZCBhcHBsaWVkCkxhdXJlbnQncyBSZXZpZXdlZC1ieS4gSSdsbCBhcHBseSB0aGlz
IHRvIGRybS1taXNjLW5leHQuCgogZHJpdmVycy9ncHUvZHJtL3RpbGNkYy90aWxjZGNfdGZwNDEw
LmMgfCAxICsKIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKQoKZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvZ3B1L2RybS90aWxjZGMvdGlsY2RjX3RmcDQxMC5jIGIvZHJpdmVycy9ncHUvZHJtL3Rp
bGNkYy90aWxjZGNfdGZwNDEwLmMKaW5kZXggNTI1ZGMxYzBmMWMxLi41MzBlZGIzYjUxY2MgMTAw
NjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS90aWxjZGMvdGlsY2RjX3RmcDQxMC5jCisrKyBiL2Ry
aXZlcnMvZ3B1L2RybS90aWxjZGMvdGlsY2RjX3RmcDQxMC5jCkBAIC03LDYgKzcsNyBAQAogI2lu
Y2x1ZGUgPGxpbnV4L2dwaW8uaD4KICNpbmNsdWRlIDxsaW51eC9tb2RfZGV2aWNldGFibGUuaD4K
ICNpbmNsdWRlIDxsaW51eC9vZl9ncGlvLmg+CisjaW5jbHVkZSA8bGludXgvcGluY3RybC9jb25z
dW1lci5oPgogI2luY2x1ZGUgPGxpbnV4L3BsYXRmb3JtX2RldmljZS5oPgogCiAjaW5jbHVkZSA8
ZHJtL2RybV9hdG9taWNfaGVscGVyLmg+Ci0tIApUZXhhcyBJbnN0cnVtZW50cyBGaW5sYW5kIE95
LCBQb3Jra2FsYW5rYXR1IDIyLCAwMDE4MCBIZWxzaW5raS4gWS10dW5udXMvQnVzaW5lc3MgSUQ6
IDA2MTU1MjEtNC4gS290aXBhaWtrYS9Eb21pY2lsZTogSGVsc2lua2kKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QK
ZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9w
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
