Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F294358276
	for <lists+dri-devel@lfdr.de>; Thu, 27 Jun 2019 14:24:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 233486E188;
	Thu, 27 Jun 2019 12:24:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D4CBA6E161
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Jun 2019 12:24:02 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 6653230089B5;
 Thu, 27 Jun 2019 12:23:57 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-96.ams2.redhat.com
 [10.36.116.96])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 029B45D71C;
 Thu, 27 Jun 2019 12:23:55 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 5126916E36; Thu, 27 Jun 2019 14:23:49 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v3 4/5] drm/bochs: drop stride and bpp from struct bochs_device
Date: Thu, 27 Jun 2019 14:23:47 +0200
Message-Id: <20190627122348.5833-5-kraxel@redhat.com>
In-Reply-To: <20190627122348.5833-1-kraxel@redhat.com>
References: <20190627122348.5833-1-kraxel@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.46]); Thu, 27 Jun 2019 12:24:02 +0000 (UTC)
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
Cc: tzimmermann@suse.de, David Airlie <airlied@linux.ie>,
 open list <linux-kernel@vger.kernel.org>,
 "open list:DRM DRIVER FOR BOCHS VIRTUAL GPU"
 <virtualization@lists.linux-foundation.org>, Gerd Hoffmann <kraxel@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Tm8gbmVlZCB0byBzdG9yZSB0aGF0LCBzdHJ1Y3QgZHJtX2ZyYW1lYnVmZmVyIGhhcyBhbGwgd2Ug
bmVlZC4KCkFsc28gdXBkYXRlIFZCRV9ESVNQSV9JTkRFWF9WSVJUX1dJRFRIIHJlZ2lzdGVyLCBv
dGhlcndpc2Ugd2UnbGwKaGF2ZSBhIGZpeGVzIGJyb2tlbiBkaXNwbGF5IGluIGNhc2UgcGl0Y2gg
IT0gd2lkdGggKiBjcHAuCgpTaWduZWQtb2ZmLWJ5OiBHZXJkIEhvZmZtYW5uIDxrcmF4ZWxAcmVk
aGF0LmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vYm9jaHMvYm9jaHMuaCAgICAgfCAgMiAtLQog
ZHJpdmVycy9ncHUvZHJtL2JvY2hzL2JvY2hzX2h3LmMgIHwgMTggKysrKysrKysrLS0tLS0tLS0t
CiBkcml2ZXJzL2dwdS9kcm0vYm9jaHMvYm9jaHNfa21zLmMgfCAgMiArLQogMyBmaWxlcyBjaGFu
Z2VkLCAxMCBpbnNlcnRpb25zKCspLCAxMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2
ZXJzL2dwdS9kcm0vYm9jaHMvYm9jaHMuaCBiL2RyaXZlcnMvZ3B1L2RybS9ib2Nocy9ib2Nocy5o
CmluZGV4IDVjOTBiNzY3MDhlZi4uNDA4MWIzYWJhMjhkIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dw
dS9kcm0vYm9jaHMvYm9jaHMuaAorKysgYi9kcml2ZXJzL2dwdS9kcm0vYm9jaHMvYm9jaHMuaApA
QCAtNjQsOCArNjQsNiBAQCBzdHJ1Y3QgYm9jaHNfZGV2aWNlIHsKIAkvKiBtb2RlICovCiAJdTE2
IHhyZXM7CiAJdTE2IHlyZXM7Ci0JdTMyIHN0cmlkZTsKLQl1MzIgYnBwOwogCXN0cnVjdCBlZGlk
ICplZGlkOwogCiAJLyogZHJtICovCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYm9jaHMv
Ym9jaHNfaHcuYyBiL2RyaXZlcnMvZ3B1L2RybS9ib2Nocy9ib2Noc19ody5jCmluZGV4IDlhYjZl
YzI2OWVmOS4uMTc4NzE1YzY3NTVkIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYm9jaHMv
Ym9jaHNfaHcuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYm9jaHMvYm9jaHNfaHcuYwpAQCAtMjA1
LDE2ICsyMDUsMTQgQEAgdm9pZCBib2Noc19od19zZXRtb2RlKHN0cnVjdCBib2Noc19kZXZpY2Ug
KmJvY2hzLAogewogCWJvY2hzLT54cmVzID0gbW9kZS0+aGRpc3BsYXk7CiAJYm9jaHMtPnlyZXMg
PSBtb2RlLT52ZGlzcGxheTsKLQlib2Nocy0+YnBwID0gMzI7Ci0JYm9jaHMtPnN0cmlkZSA9IG1v
ZGUtPmhkaXNwbGF5ICogKGJvY2hzLT5icHAgLyA4KTsKIAotCURSTV9ERUJVR19EUklWRVIoIiVk
eCVkIEAgJWQgYnBwXG4iLAotCQkJIGJvY2hzLT54cmVzLCBib2Nocy0+eXJlcywgYm9jaHMtPmJw
cCk7CisJRFJNX0RFQlVHX0RSSVZFUigiJWR4JWRcbiIsCisJCQkgYm9jaHMtPnhyZXMsIGJvY2hz
LT55cmVzKTsKIAogCWJvY2hzX3ZnYV93cml0ZWIoYm9jaHMsIDB4M2MwLCAweDIwKTsgLyogdW5i
bGFuayAqLwogCiAJYm9jaHNfZGlzcGlfd3JpdGUoYm9jaHMsIFZCRV9ESVNQSV9JTkRFWF9FTkFC
TEUsICAgICAgMCk7Ci0JYm9jaHNfZGlzcGlfd3JpdGUoYm9jaHMsIFZCRV9ESVNQSV9JTkRFWF9C
UFAsICAgICAgICAgYm9jaHMtPmJwcCk7CisJYm9jaHNfZGlzcGlfd3JpdGUoYm9jaHMsIFZCRV9E
SVNQSV9JTkRFWF9CUFAsICAgICAgICAgMzIpOwogCWJvY2hzX2Rpc3BpX3dyaXRlKGJvY2hzLCBW
QkVfRElTUElfSU5ERVhfWFJFUywgICAgICAgIGJvY2hzLT54cmVzKTsKIAlib2Noc19kaXNwaV93
cml0ZShib2NocywgVkJFX0RJU1BJX0lOREVYX1lSRVMsICAgICAgICBib2Nocy0+eXJlcyk7CiAJ
Ym9jaHNfZGlzcGlfd3JpdGUoYm9jaHMsIFZCRV9ESVNQSV9JTkRFWF9CQU5LLCAgICAgICAgMCk7
CkBAIC0yNTYsMTEgKzI1NCwxMyBAQCB2b2lkIGJvY2hzX2h3X3NldGZiKHN0cnVjdCBib2Noc19k
ZXZpY2UgKmJvY2hzLAogewogCXN0cnVjdCBkcm1fZ2VtX3ZyYW1fb2JqZWN0ICpibyA9IGRybV9n
ZW1fdnJhbV9vZl9nZW0oZmItPm9ialswXSk7CiAJdW5zaWduZWQgbG9uZyBvZmZzZXQgPSBiby0+
Ym8ub2Zmc2V0ICsKLQkJeSAqIGJvY2hzLT5zdHJpZGUgKwotCQl4ICogKGJvY2hzLT5icHAgLyA4
KTsKLQlpbnQgdnkgPSBvZmZzZXQgLyBib2Nocy0+c3RyaWRlOwotCWludCB2eCA9IChvZmZzZXQg
JSBib2Nocy0+c3RyaWRlKSAqIDggLyBib2Nocy0+YnBwOworCQl5ICogZmItPnBpdGNoZXNbMF0g
KworCQl4ICogZmItPmZvcm1hdC0+Y3BwWzBdOworCWludCB2eSA9IG9mZnNldCAvIGZiLT5waXRj
aGVzWzBdOworCWludCB2eCA9IChvZmZzZXQgJSBmYi0+cGl0Y2hlc1swXSkgLyBmYi0+Zm9ybWF0
LT5jcHBbMF07CisJaW50IHZ3ID0gZmItPnBpdGNoZXNbMF0gLyBmYi0+Zm9ybWF0LT5jcHBbMF07
CiAKKwlib2Noc19kaXNwaV93cml0ZShib2NocywgVkJFX0RJU1BJX0lOREVYX1ZJUlRfV0lEVEgs
IHZ3KTsKIAlib2Noc19kaXNwaV93cml0ZShib2NocywgVkJFX0RJU1BJX0lOREVYX1hfT0ZGU0VU
LCB2eCk7CiAJYm9jaHNfZGlzcGlfd3JpdGUoYm9jaHMsIFZCRV9ESVNQSV9JTkRFWF9ZX09GRlNF
VCwgdnkpOwogfQpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2JvY2hzL2JvY2hzX2ttcy5j
IGIvZHJpdmVycy9ncHUvZHJtL2JvY2hzL2JvY2hzX2ttcy5jCmluZGV4IGRkYmYwODAyMTM4ZC4u
MjhlZGZiMjc3MmZmIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYm9jaHMvYm9jaHNfa21z
LmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2JvY2hzL2JvY2hzX2ttcy5jCkBAIC0yNyw3ICsyNyw3
IEBAIHN0YXRpYyBjb25zdCB1aW50MzJfdCBib2Noc19mb3JtYXRzW10gPSB7CiBzdGF0aWMgdm9p
ZCBib2Noc19wbGFuZV91cGRhdGUoc3RydWN0IGJvY2hzX2RldmljZSAqYm9jaHMsCiAJCQkgICAg
ICAgc3RydWN0IGRybV9wbGFuZV9zdGF0ZSAqc3RhdGUpCiB7Ci0JaWYgKCFzdGF0ZS0+ZmIgfHwg
IWJvY2hzLT5zdHJpZGUpCisJaWYgKCFzdGF0ZS0+ZmIpCiAJCXJldHVybjsKIAogCWJvY2hzX2h3
X3NldGZiKGJvY2hzLCBzdGF0ZS0+ZmIsCi0tIAoyLjE4LjEKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRl
dmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
