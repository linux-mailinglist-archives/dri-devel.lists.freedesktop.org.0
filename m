Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 24791DDB92
	for <lists+dri-devel@lfdr.de>; Sun, 20 Oct 2019 02:06:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AEB5689C29;
	Sun, 20 Oct 2019 00:06:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 911 seconds by postgrey-1.36 at gabe;
 Sat, 19 Oct 2019 07:41:19 UTC
Received: from mxhk.zte.com.cn (mxhk.zte.com.cn [63.217.80.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 196CE89DC5
 for <dri-devel@lists.freedesktop.org>; Sat, 19 Oct 2019 07:41:19 +0000 (UTC)
Received: from mse-fl1.zte.com.cn (unknown [10.30.14.238])
 by Forcepoint Email with ESMTPS id B03D8734A3179D6AD7A2;
 Sat, 19 Oct 2019 15:26:04 +0800 (CST)
Received: from notes_smtp.zte.com.cn (notessmtp.zte.com.cn [10.30.1.239])
 by mse-fl1.zte.com.cn with ESMTP id x9J7Pkjr067896;
 Sat, 19 Oct 2019 15:25:46 +0800 (GMT-8)
 (envelope-from wang.yi59@zte.com.cn)
Received: from fox-host8.localdomain ([10.74.120.8])
 by szsmtp06.zte.com.cn (Lotus Domino Release 8.5.3FP6)
 with ESMTP id 2019101915260155-30950 ;
 Sat, 19 Oct 2019 15:26:01 +0800 
From: Yi Wang <wang.yi59@zte.com.cn>
To: robh@kernel.org
Subject: [PATCH] drm/panfrost: fix -Wmissing-prototypes warnings
Date: Sat, 19 Oct 2019 15:28:14 +0800
Message-Id: <1571470094-39589-1-git-send-email-wang.yi59@zte.com.cn>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-MIMETrack: Itemize by SMTP Server on SZSMTP06/server/zte_ltd(Release
 8.5.3FP6|November 21, 2013) at 2019-10-19 15:26:01,
 Serialize by Router on notes_smtp/zte_ltd(Release 9.0.1FP7|August  17, 2016) at
 2019-10-19 15:25:53
X-MAIL: mse-fl1.zte.com.cn x9J7Pkjr067896
X-Mailman-Approved-At: Sun, 20 Oct 2019 00:06:45 +0000
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
Cc: wang.yi59@zte.com.cn, tomeu.vizoso@collabora.com, airlied@linux.ie,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 wang.liang82@zte.com.cn, xue.zhihong@zte.com.cn, up2wing@gmail.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

V2UgZ2V0IHRoZXNlIHdhcm5pbmdzIHdoZW4gYnVpbGQga2VybmVsIFc9MToKZHJpdmVycy9ncHUv
ZHJtL3BhbmZyb3N0L3BhbmZyb3N0X3BlcmZjbnQuYzozNTo2OiB3YXJuaW5nOiBubyBwcmV2aW91
cyBwcm90b3R5cGUgZm9yIOKAmHBhbmZyb3N0X3BlcmZjbnRfY2xlYW5fY2FjaGVfZG9uZeKAmSBb
LVdtaXNzaW5nLXByb3RvdHlwZXNdCmRyaXZlcnMvZ3B1L2RybS9wYW5mcm9zdC9wYW5mcm9zdF9w
ZXJmY250LmM6NDA6Njogd2FybmluZzogbm8gcHJldmlvdXMgcHJvdG90eXBlIGZvciDigJhwYW5m
cm9zdF9wZXJmY250X3NhbXBsZV9kb25l4oCZIFstV21pc3NpbmctcHJvdG90eXBlc10KZHJpdmVy
cy9ncHUvZHJtL3BhbmZyb3N0L3BhbmZyb3N0X3BlcmZjbnQuYzoxOTA6NTogd2FybmluZzogbm8g
cHJldmlvdXMgcHJvdG90eXBlIGZvciDigJhwYW5mcm9zdF9pb2N0bF9wZXJmY250X2VuYWJsZeKA
mSBbLVdtaXNzaW5nLXByb3RvdHlwZXNdCmRyaXZlcnMvZ3B1L2RybS9wYW5mcm9zdC9wYW5mcm9z
dF9wZXJmY250LmM6MjE4OjU6IHdhcm5pbmc6IG5vIHByZXZpb3VzIHByb3RvdHlwZSBmb3Ig4oCY
cGFuZnJvc3RfaW9jdGxfcGVyZmNudF9kdW1w4oCZIFstV21pc3NpbmctcHJvdG90eXBlc10KZHJp
dmVycy9ncHUvZHJtL3BhbmZyb3N0L3BhbmZyb3N0X3BlcmZjbnQuYzoyNTA6Njogd2FybmluZzog
bm8gcHJldmlvdXMgcHJvdG90eXBlIGZvciDigJhwYW5mcm9zdF9wZXJmY250X2Nsb3Nl4oCZIFst
V21pc3NpbmctcHJvdG90eXBlc10KZHJpdmVycy9ncHUvZHJtL3BhbmZyb3N0L3BhbmZyb3N0X3Bl
cmZjbnQuYzoyNjQ6NTogd2FybmluZzogbm8gcHJldmlvdXMgcHJvdG90eXBlIGZvciDigJhwYW5m
cm9zdF9wZXJmY250X2luaXTigJkgWy1XbWlzc2luZy1wcm90b3R5cGVzXQpkcml2ZXJzL2dwdS9k
cm0vcGFuZnJvc3QvcGFuZnJvc3RfcGVyZmNudC5jOjMyMDo2OiB3YXJuaW5nOiBubyBwcmV2aW91
cyBwcm90b3R5cGUgZm9yIOKAmHBhbmZyb3N0X3BlcmZjbnRfZmluaeKAmSBbLVdtaXNzaW5nLXBy
b3RvdHlwZXNdCmRyaXZlcnMvZ3B1L2RybS9wYW5mcm9zdC9wYW5mcm9zdF9tbXUuYzoyMjc6Njog
d2FybmluZzogbm8gcHJldmlvdXMgcHJvdG90eXBlIGZvciDigJhwYW5mcm9zdF9tbXVfZmx1c2hf
cmFuZ2XigJkgWy1XbWlzc2luZy1wcm90b3R5cGVzXQpkcml2ZXJzL2dwdS9kcm0vcGFuZnJvc3Qv
cGFuZnJvc3RfbW11LmM6NDM1OjU6IHdhcm5pbmc6IG5vIHByZXZpb3VzIHByb3RvdHlwZSBmb3Ig
4oCYcGFuZnJvc3RfbW11X21hcF9mYXVsdF9hZGRy4oCZIFstV21pc3NpbmctcHJvdG90eXBlc10K
CkZvciBmaWxlIHBhbmZyb3N0X21tdS5jLCBtYWtlIGZ1bmN0aW9ucyBzdGF0aWMgdG8gZml4IHRo
aXMuCkZvciBmaWxlIHBhbmZyb3N0X3BlcmZjbnQuYywgaW5jbHVkZSBoZWFkIGZpbGUgY2FuIGZp
eCB0aGlzLgoKU2lnbmVkLW9mZi1ieTogWWkgV2FuZyA8d2FuZy55aTU5QHp0ZS5jb20uY24+Ci0t
LQogZHJpdmVycy9ncHUvZHJtL3BhbmZyb3N0L3BhbmZyb3N0X21tdS5jICAgICB8IDUgKysrLS0K
IGRyaXZlcnMvZ3B1L2RybS9wYW5mcm9zdC9wYW5mcm9zdF9wZXJmY250LmMgfCAxICsKIDIgZmls
ZXMgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBh
L2RyaXZlcnMvZ3B1L2RybS9wYW5mcm9zdC9wYW5mcm9zdF9tbXUuYyBiL2RyaXZlcnMvZ3B1L2Ry
bS9wYW5mcm9zdC9wYW5mcm9zdF9tbXUuYwppbmRleCBiZGQ5OTA1Li5kMDQ1OGE1IDEwMDY0NAot
LS0gYS9kcml2ZXJzL2dwdS9kcm0vcGFuZnJvc3QvcGFuZnJvc3RfbW11LmMKKysrIGIvZHJpdmVy
cy9ncHUvZHJtL3BhbmZyb3N0L3BhbmZyb3N0X21tdS5jCkBAIC0yMjQsNyArMjI0LDcgQEAgc3Rh
dGljIHNpemVfdCBnZXRfcGdzaXplKHU2NCBhZGRyLCBzaXplX3Qgc2l6ZSkKIAlyZXR1cm4gU1pf
Mk07CiB9CiAKLXZvaWQgcGFuZnJvc3RfbW11X2ZsdXNoX3JhbmdlKHN0cnVjdCBwYW5mcm9zdF9k
ZXZpY2UgKnBmZGV2LAorc3RhdGljIHZvaWQgcGFuZnJvc3RfbW11X2ZsdXNoX3JhbmdlKHN0cnVj
dCBwYW5mcm9zdF9kZXZpY2UgKnBmZGV2LAogCQkJICAgICAgc3RydWN0IHBhbmZyb3N0X21tdSAq
bW11LAogCQkJICAgICAgdTY0IGlvdmEsIHNpemVfdCBzaXplKQogewpAQCAtNDMyLDcgKzQzMiw4
IEBAIHZvaWQgcGFuZnJvc3RfbW11X3BndGFibGVfZnJlZShzdHJ1Y3QgcGFuZnJvc3RfZmlsZV9w
cml2ICpwcml2KQogCiAjZGVmaW5lIE5VTV9GQVVMVF9QQUdFUyAoU1pfMk0gLyBQQUdFX1NJWkUp
CiAKLWludCBwYW5mcm9zdF9tbXVfbWFwX2ZhdWx0X2FkZHIoc3RydWN0IHBhbmZyb3N0X2Rldmlj
ZSAqcGZkZXYsIGludCBhcywgdTY0IGFkZHIpCitzdGF0aWMgaW50IHBhbmZyb3N0X21tdV9tYXBf
ZmF1bHRfYWRkcihzdHJ1Y3QgcGFuZnJvc3RfZGV2aWNlICpwZmRldiwgaW50IGFzLAorCQl1NjQg
YWRkcikKIHsKIAlpbnQgcmV0LCBpOwogCXN0cnVjdCBwYW5mcm9zdF9nZW1fb2JqZWN0ICpibzsK
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9wYW5mcm9zdC9wYW5mcm9zdF9wZXJmY250LmMg
Yi9kcml2ZXJzL2dwdS9kcm0vcGFuZnJvc3QvcGFuZnJvc3RfcGVyZmNudC5jCmluZGV4IDgzYzU3
ZDMuLjc0OTNkYzAgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9wYW5mcm9zdC9wYW5mcm9z
dF9wZXJmY250LmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL3BhbmZyb3N0L3BhbmZyb3N0X3BlcmZj
bnQuYwpAQCAtMTcsNiArMTcsNyBAQAogI2luY2x1ZGUgInBhbmZyb3N0X2pvYi5oIgogI2luY2x1
ZGUgInBhbmZyb3N0X21tdS5oIgogI2luY2x1ZGUgInBhbmZyb3N0X3JlZ3MuaCIKKyNpbmNsdWRl
ICJwYW5mcm9zdF9wZXJmY250LmgiCiAKICNkZWZpbmUgQ09VTlRFUlNfUEVSX0JMT0NLCQk2NAog
I2RlZmluZSBCWVRFU19QRVJfQ09VTlRFUgkJNAotLSAKMS44LjMuMQoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApk
cmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Au
b3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
