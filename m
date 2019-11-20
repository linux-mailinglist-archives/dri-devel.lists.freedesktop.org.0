Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 90120104CF8
	for <lists+dri-devel@lfdr.de>; Thu, 21 Nov 2019 08:59:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 256546EB53;
	Thu, 21 Nov 2019 07:59:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4AD196E174
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Nov 2019 09:57:21 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 20 Nov 2019 01:57:20 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,221,1571727600"; d="scan'208";a="209693593"
Received: from black.fi.intel.com ([10.237.72.28])
 by orsmga006.jf.intel.com with ESMTP; 20 Nov 2019 01:57:18 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
 id A4F4F236; Wed, 20 Nov 2019 11:57:17 +0200 (EET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 dri-devel@lists.freedesktop.org,
 =?UTF-8?q?Noralf=20Tr=C3=B8nnes?= <noralf@tronnes.org>,
 linux-fbdev@vger.kernel.org, Nishad Kamdar <nishadkamdar@gmail.com>,
 devel@driverdev.osuosl.org
Subject: [PATCH v1 5/5] fbtft: Drop OF dependency
Date: Wed, 20 Nov 2019 11:57:16 +0200
Message-Id: <20191120095716.26628-5-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191120095716.26628-1-andriy.shevchenko@linux.intel.com>
References: <20191120095716.26628-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 21 Nov 2019 07:59:20 +0000
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
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Tm93LCBzaW5jZSBkcml2ZXIgYmVjYW1lIE9GIGluZGVwZW5kZW50LCBubyBuZWVkIHRvIGtlZXAg
T0YgZGVwZW5kZW5jeS4KClNpZ25lZC1vZmYtYnk6IEFuZHkgU2hldmNoZW5rbyA8YW5kcml5LnNo
ZXZjaGVua29AbGludXguaW50ZWwuY29tPgotLS0KIGRyaXZlcnMvc3RhZ2luZy9mYnRmdC9LY29u
ZmlnIHwgMiArLQogZHJpdmVycy9zdGFnaW5nL2ZidGZ0L2ZidGZ0LmggfCA0ICsrLS0KIDIgZmls
ZXMgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBh
L2RyaXZlcnMvc3RhZ2luZy9mYnRmdC9LY29uZmlnIGIvZHJpdmVycy9zdGFnaW5nL2ZidGZ0L0tj
b25maWcKaW5kZXggY2I2MWMyYTc3MmJkLi41NDc1MWQ5ZmMwZmYgMTAwNjQ0Ci0tLSBhL2RyaXZl
cnMvc3RhZ2luZy9mYnRmdC9LY29uZmlnCisrKyBiL2RyaXZlcnMvc3RhZ2luZy9mYnRmdC9LY29u
ZmlnCkBAIC0xLDcgKzEsNyBAQAogIyBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogR1BMLTIuMAog
bWVudWNvbmZpZyBGQl9URlQKIAl0cmlzdGF0ZSAiU3VwcG9ydCBmb3Igc21hbGwgVEZUIExDRCBk
aXNwbGF5IG1vZHVsZXMiCi0JZGVwZW5kcyBvbiBGQiAmJiBTUEkgJiYgT0YKKwlkZXBlbmRzIG9u
IEZCICYmIFNQSQogCWRlcGVuZHMgb24gR1BJT0xJQiB8fCBDT01QSUxFX1RFU1QKIAlzZWxlY3Qg
RkJfU1lTX0ZJTExSRUNUCiAJc2VsZWN0IEZCX1NZU19DT1BZQVJFQQpkaWZmIC0tZ2l0IGEvZHJp
dmVycy9zdGFnaW5nL2ZidGZ0L2ZidGZ0LmggYi9kcml2ZXJzL3N0YWdpbmcvZmJ0ZnQvZmJ0ZnQu
aAppbmRleCA5YjZiZGI2MjA5M2QuLjVmNzgyZGE1MTk1OSAxMDA2NDQKLS0tIGEvZHJpdmVycy9z
dGFnaW5nL2ZidGZ0L2ZidGZ0LmgKKysrIGIvZHJpdmVycy9zdGFnaW5nL2ZidGZ0L2ZidGZ0LmgK
QEAgLTMwOSw3ICszMDksNyBAQCBNT0RVTEVfREVWSUNFX1RBQkxFKG9mLCBkdF9pZHMpOyAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBcCiBzdGF0aWMgc3RydWN0IHNw
aV9kcml2ZXIgZmJ0ZnRfZHJpdmVyX3NwaV9kcml2ZXIgPSB7ICAgICAgICAgICAgICAgICAgICAg
ICBcCiAJLmRyaXZlciA9IHsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIFwKIAkJLm5hbWUgICA9IF9uYW1lLCAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICBcCi0JCS5vZl9tYXRjaF90YWJsZSA9IG9mX21hdGNoX3B0
cihkdF9pZHMpLCAgICAgICAgICAgICAgICAgICAgXAorCQkub2ZfbWF0Y2hfdGFibGUgPSBkdF9p
ZHMsICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFwKIAl9LCAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXAogCS5w
cm9iZSAgPSBmYnRmdF9kcml2ZXJfcHJvYmVfc3BpLCAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICBcCiAJLnJlbW92ZSA9IGZidGZ0X2RyaXZlcl9yZW1vdmVfc3BpLCAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIFwKQEAgLTMxOSw3ICszMTksNyBAQCBzdGF0aWMgc3RydWN0
IHBsYXRmb3JtX2RyaXZlciBmYnRmdF9kcml2ZXJfcGxhdGZvcm1fZHJpdmVyID0geyAgICAgICAg
ICAgICBcCiAJLmRyaXZlciA9IHsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIFwKIAkJLm5hbWUgICA9IF9uYW1lLCAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICBcCiAJCS5vd25lciAgPSBUSElTX01PRFVMRSwgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXAotCQkub2ZfbWF0Y2hfdGFibGUgPSBv
Zl9tYXRjaF9wdHIoZHRfaWRzKSwgICAgICAgICAgICAgICAgICAgIFwKKwkJLm9mX21hdGNoX3Rh
YmxlID0gZHRfaWRzLCAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBcCiAJfSwgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIFwKIAkucHJvYmUgID0gZmJ0ZnRfZHJpdmVyX3Byb2JlX3BkZXYsICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgXAogCS5yZW1vdmUgPSBmYnRmdF9kcml2ZXJfcmVtb3ZlX3BkZXYs
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBcCi0tIAoyLjI0LjAKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxp
c3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNr
dG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
