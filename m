Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0055A51E7F
	for <lists+dri-devel@lfdr.de>; Tue, 25 Jun 2019 00:44:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA65E89DFC;
	Mon, 24 Jun 2019 22:44:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C392289DFC
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jun 2019 22:44:46 +0000 (UTC)
Received: from 1.general.cking.uk.vpn ([10.172.193.212] helo=localhost)
 by youngberry.canonical.com with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.76) (envelope-from <colin.king@canonical.com>)
 id 1hfXhc-0001qM-Gx; Mon, 24 Jun 2019 22:44:44 +0000
From: Colin King <colin.king@canonical.com>
To: VMware Graphics <linux-graphics-maintainer@vmware.com>,
 Thomas Hellstrom <thellstrom@vmware.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org
Subject: [PATCH][next] drm/vmwgfx: remove redundant assignment to sub_res
Date: Mon, 24 Jun 2019 23:44:44 +0100
Message-Id: <20190624224444.14099-1-colin.king@canonical.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
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
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogQ29saW4gSWFuIEtpbmcgPGNvbGluLmtpbmdAY2Fub25pY2FsLmNvbT4KClZhcmlhYmxl
IHN1Yl9yZXMgaXMgaW5pdGlhbGl6ZWQgdG8gYSB2YWx1ZSB0aGF0IGlzIG5ldmVyIHJlYWQgYW5k
IGl0CmlzIHJlLWFzc2lnbmVkIGxhdGVyIGluIGEgZm9yLWxvb3AuICBUaGUgaW5pdGlhbGl6YXRp
b24gaXMgcmVkdW5kYW50CmFuZCBjYW4gYmUgcmVtb3ZlZC4KCkFkZHJlc3Nlcy1Db3Zlcml0eTog
KCJVbnVzZWQgdmFsdWUiKQpTaWduZWQtb2ZmLWJ5OiBDb2xpbiBJYW4gS2luZyA8Y29saW4ua2lu
Z0BjYW5vbmljYWwuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS92bXdnZngvdm13Z2Z4X3N1cmZh
Y2UuYyB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigt
KQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS92bXdnZngvdm13Z2Z4X3N1cmZhY2UuYyBi
L2RyaXZlcnMvZ3B1L2RybS92bXdnZngvdm13Z2Z4X3N1cmZhY2UuYwppbmRleCA4NjJjYTQ0Njgw
Y2EuLjMyNTdiYTY4OWQ5MyAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL3Ztd2dmeC92bXdn
Znhfc3VyZmFjZS5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS92bXdnZngvdm13Z2Z4X3N1cmZhY2Uu
YwpAQCAtMTkxNCw3ICsxOTE0LDcgQEAgc3RhdGljIHZvaWQgdm13X3N1cmZhY2VfdGV4X2RpcnR5
X3JhbmdlX2FkZChzdHJ1Y3Qgdm13X3Jlc291cmNlICpyZXMsCiAJfSBlbHNlIHsKIAkJLyogRGly
dHkgcmFuZ2UgY292ZXJzIG11bHRpcGxlIHN1Yi1yZXNvdXJjZXMgKi8KIAkJc3RydWN0IHN2Z2Ez
ZHN1cmZhY2VfbG9jIGxvY19taW4sIGxvY19tYXg7Ci0JCXUzMiBzdWJfcmVzID0gbG9jMS5zdWJf
cmVzb3VyY2U7CisJCXUzMiBzdWJfcmVzOwogCiAJCXN2Z2EzZHN1cmZhY2VfbWF4X2xvYyhjYWNo
ZSwgbG9jMS5zdWJfcmVzb3VyY2UsICZsb2NfbWF4KTsKIAkJdm13X3N1YnJlc19kaXJ0eV9hZGQo
ZGlydHksICZsb2MxLCAmbG9jX21heCk7Ci0tIAoyLjIwLjEKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRl
dmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
