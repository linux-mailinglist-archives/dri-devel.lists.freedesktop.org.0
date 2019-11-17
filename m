Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E5FAFF8F9
	for <lists+dri-devel@lfdr.de>; Sun, 17 Nov 2019 12:44:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ACDAB6E2BC;
	Sun, 17 Nov 2019 11:44:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1CF816E279
 for <dri-devel@lists.freedesktop.org>; Sun, 17 Nov 2019 07:11:04 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) (Authenticated sender: sre)
 with ESMTPSA id 6D10528FCB2
Received: by earth.universe (Postfix, from userid 1000)
 id 001333C0CA0; Sun, 17 Nov 2019 03:41:39 +0100 (CET)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
To: Sebastian Reichel <sre@kernel.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Tomi Valkeinen <tomi.valkeinen@ti.com>
Subject: [RFCv1 20/42] drm/omap: dsi: drop useless sync()
Date: Sun, 17 Nov 2019 03:40:06 +0100
Message-Id: <20191117024028.2233-21-sebastian.reichel@collabora.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191117024028.2233-1-sebastian.reichel@collabora.com>
References: <20191117024028.2233-1-sebastian.reichel@collabora.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Sun, 17 Nov 2019 11:44:18 +0000
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
Cc: kernel@collabora.com, Tony Lindgren <tony@atomide.com>,
 "H. Nikolaus Schaller" <hns@goldelico.com>, Merlijn Wajer <merlijn@wizzup.org>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 dri-devel@lists.freedesktop.org, linux-omap@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhlIERTSSBzeW5jKCkgZnVuY3Rpb24gb25seSBsb2NrcyB0aGUgYnVzIGFuZCB0aGVuIHJlbGVh
c2VzCml0IGFnYWluLiBDdXJyZW50bHkgdGhlIG9ubHkgaW52b2NhdGlvbiBpcyBkaXJlY3RseSBi
ZWZvcmUKdXBkYXRlKCksIHdoaWNoIGxvY2tzIHRoZSBidXMgYW55d2F5cy4KClNpZ25lZC1vZmYt
Ynk6IFNlYmFzdGlhbiBSZWljaGVsIDxzZWJhc3RpYW4ucmVpY2hlbEBjb2xsYWJvcmEuY29tPgot
LS0KIC4uLi9ncHUvZHJtL29tYXBkcm0vZGlzcGxheXMvcGFuZWwtZHNpLWNtLmMgICAgfCAxOCAt
LS0tLS0tLS0tLS0tLS0tLS0KIGRyaXZlcnMvZ3B1L2RybS9vbWFwZHJtL2Rzcy9vbWFwZHNzLmgg
ICAgICAgICAgfCAgMSAtCiBkcml2ZXJzL2dwdS9kcm0vb21hcGRybS9vbWFwX2NydGMuYyAgICAg
ICAgICAgIHwgIDMgLS0tCiAzIGZpbGVzIGNoYW5nZWQsIDIyIGRlbGV0aW9ucygtKQoKZGlmZiAt
LWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9vbWFwZHJtL2Rpc3BsYXlzL3BhbmVsLWRzaS1jbS5jIGIv
ZHJpdmVycy9ncHUvZHJtL29tYXBkcm0vZGlzcGxheXMvcGFuZWwtZHNpLWNtLmMKaW5kZXggMTY0
ZjNhMzBkN2YyLi45OTQ4ODAwMjJkMGMgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9vbWFw
ZHJtL2Rpc3BsYXlzL3BhbmVsLWRzaS1jbS5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9vbWFwZHJt
L2Rpc3BsYXlzL3BhbmVsLWRzaS1jbS5jCkBAIC04NDUsMjMgKzg0NSw2IEBAIHN0YXRpYyBpbnQg
ZHNpY21fdXBkYXRlKHN0cnVjdCBvbWFwX2Rzc19kZXZpY2UgKmRzc2RldiwKIAlyZXR1cm4gcjsK
IH0KIAotc3RhdGljIGludCBkc2ljbV9zeW5jKHN0cnVjdCBvbWFwX2Rzc19kZXZpY2UgKmRzc2Rl
dikKLXsKLQlzdHJ1Y3QgcGFuZWxfZHJ2X2RhdGEgKmRkYXRhID0gdG9fcGFuZWxfZGF0YShkc3Nk
ZXYpOwotCXN0cnVjdCBvbWFwX2Rzc19kZXZpY2UgKnNyYyA9IGRkYXRhLT5zcmM7Ci0KLQlkZXZf
ZGJnKCZkZGF0YS0+ZHNpLT5kZXYsICJzeW5jXG4iKTsKLQotCW11dGV4X2xvY2soJmRkYXRhLT5s
b2NrKTsKLQlzcmMtPm9wcy0+ZHNpLmJ1c19sb2NrKHNyYyk7Ci0Jc3JjLT5vcHMtPmRzaS5idXNf
dW5sb2NrKHNyYyk7Ci0JbXV0ZXhfdW5sb2NrKCZkZGF0YS0+bG9jayk7Ci0KLQlkZXZfZGJnKCZk
ZGF0YS0+ZHNpLT5kZXYsICJzeW5jIGRvbmVcbiIpOwotCi0JcmV0dXJuIDA7Ci19Ci0KIHN0YXRp
YyBpbnQgX2RzaWNtX2VuYWJsZV90ZShzdHJ1Y3QgcGFuZWxfZHJ2X2RhdGEgKmRkYXRhLCBib29s
IGVuYWJsZSkKIHsKIAlzdHJ1Y3Qgb21hcF9kc3NfZGV2aWNlICpzcmMgPSBkZGF0YS0+c3JjOwpA
QCAtOTUwLDcgKzkzMyw2IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3Qgb21hcF9kc3NfZGV2aWNlX29w
cyBkc2ljbV9vcHMgPSB7CiAKIHN0YXRpYyBjb25zdCBzdHJ1Y3Qgb21hcF9kc3NfZHJpdmVyIGRz
aWNtX2Rzc19kcml2ZXIgPSB7CiAJLnVwZGF0ZQkJPSBkc2ljbV91cGRhdGUsCi0JLnN5bmMJCT0g
ZHNpY21fc3luYywKIH07CiAKIHN0YXRpYyBpbnQgZHNpY21fcHJvYmVfb2Yoc3RydWN0IG1pcGlf
ZHNpX2RldmljZSAqZHNpKQpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL29tYXBkcm0vZHNz
L29tYXBkc3MuaCBiL2RyaXZlcnMvZ3B1L2RybS9vbWFwZHJtL2Rzcy9vbWFwZHNzLmgKaW5kZXgg
YmM1ODMzNDZhZjRkLi5jZDk3Njk3MTFiNTggMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9v
bWFwZHJtL2Rzcy9vbWFwZHNzLmgKKysrIGIvZHJpdmVycy9ncHUvZHJtL29tYXBkcm0vZHNzL29t
YXBkc3MuaApAQCAtNDA5LDcgKzQwOSw2IEBAIHN0cnVjdCBvbWFwX2Rzc19kZXZpY2Ugewogc3Ry
dWN0IG9tYXBfZHNzX2RyaXZlciB7CiAJaW50ICgqdXBkYXRlKShzdHJ1Y3Qgb21hcF9kc3NfZGV2
aWNlICpkc3NkZXYsCiAJCQkgICAgICAgdTE2IHgsIHUxNiB5LCB1MTYgdywgdTE2IGgpOwotCWlu
dCAoKnN5bmMpKHN0cnVjdCBvbWFwX2Rzc19kZXZpY2UgKmRzc2Rldik7CiB9OwogCiBzdHJ1Y3Qg
ZHNzX2RldmljZSAqb21hcGRzc19nZXRfZHNzKHZvaWQpOwpkaWZmIC0tZ2l0IGEvZHJpdmVycy9n
cHUvZHJtL29tYXBkcm0vb21hcF9jcnRjLmMgYi9kcml2ZXJzL2dwdS9kcm0vb21hcGRybS9vbWFw
X2NydGMuYwppbmRleCAzYzVkZGJmMzBlOTcuLjhiNDY5ZWFhNTAwNSAxMDA2NDQKLS0tIGEvZHJp
dmVycy9ncHUvZHJtL29tYXBkcm0vb21hcF9jcnRjLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL29t
YXBkcm0vb21hcF9jcnRjLmMKQEAgLTM3OSw5ICszNzksNiBAQCBzdGF0aWMgdm9pZCBvbWFwX2Ny
dGNfbWFudWFsX2Rpc3BsYXlfdXBkYXRlKHN0cnVjdCB3b3JrX3N0cnVjdCAqZGF0YSkKIAkJcmV0
dXJuOwogCX0KIAotCWlmIChkc3NkcnYtPnN5bmMpCi0JCWRzc2Rydi0+c3luYyhkc3NkZXYpOwot
CiAJcmV0ID0gZHNzZHJ2LT51cGRhdGUoZHNzZGV2LCAwLCAwLCBtb2RlLT5oZGlzcGxheSwgbW9k
ZS0+dmRpc3BsYXkpOwogCWlmIChyZXQgPCAwKSB7CiAJCXNwaW5fbG9ja19pcnEoJmRldi0+ZXZl
bnRfbG9jayk7Ci0tIAoyLjI0LjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2RyaS1kZXZlbA==
