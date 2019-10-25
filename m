Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D6B7E4555
	for <lists+dri-devel@lfdr.de>; Fri, 25 Oct 2019 10:12:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DDE046E8EF;
	Fri, 25 Oct 2019 08:12:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mxhk.zte.com.cn (mxhk.zte.com.cn [63.217.80.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0982689119
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Oct 2019 01:29:12 +0000 (UTC)
Received: from mse-fl2.zte.com.cn (unknown [10.30.14.239])
 by Forcepoint Email with ESMTPS id B64D5B3BFB9EFD4D77AD;
 Fri, 25 Oct 2019 09:29:09 +0800 (CST)
Received: from notes_smtp.zte.com.cn (notessmtp.zte.com.cn [10.30.1.239])
 by mse-fl2.zte.com.cn with ESMTP id x9P1Stav098679;
 Fri, 25 Oct 2019 09:28:55 +0800 (GMT-8)
 (envelope-from wang.yi59@zte.com.cn)
Received: from fox-host8.localdomain ([10.74.120.8])
 by szsmtp06.zte.com.cn (Lotus Domino Release 8.5.3FP6)
 with ESMTP id 2019102509284555-119942 ;
 Fri, 25 Oct 2019 09:28:45 +0800 
From: Yi Wang <wang.yi59@zte.com.cn>
To: steven.price@arm.com, robh@kernel.org
Subject: [PATCH v3] drm/panfrost: fix -Wmissing-prototypes warnings
Date: Fri, 25 Oct 2019 09:30:15 +0800
Message-Id: <1571967015-42854-1-git-send-email-wang.yi59@zte.com.cn>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-MIMETrack: Itemize by SMTP Server on SZSMTP06/server/zte_ltd(Release
 8.5.3FP6|November 21, 2013) at 2019-10-25 09:28:45,
 Serialize by Router on notes_smtp/zte_ltd(Release 9.0.1FP7|August  17, 2016) at
 2019-10-25 09:29:00
X-MAIL: mse-fl2.zte.com.cn x9P1Stav098679
X-Mailman-Approved-At: Fri, 25 Oct 2019 08:11:50 +0000
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
aXMuCkZvciBmaWxlIHBhbmZyb3N0X3BlcmZjbnQuYywgaW5jbHVkZSBoZWFkZXIgZmlsZSBjYW4g
Zml4IHRoaXMuCgpTaWduZWQtb2ZmLWJ5OiBZaSBXYW5nIDx3YW5nLnlpNTlAenRlLmNvbS5jbj4K
UmV2aWV3ZWQtYnk6IFN0ZXZlbiBQcmljZSA8c3RldmVuLnByaWNlQGFybS5jb20+Ci0tLQoKdjM6
IHVzaW5nIHRhYiBzaXplIG9mIDggb3RoZXIgdGhhbiA0LgoKdjI6IGFsaWduIHBhcmFtZXRlciBs
aW5lIGFuZCBtb2RpZnkgY29tbWVudC4gVGhhbmtzIHRvIFN0ZXZlLgotLS0KIGRyaXZlcnMvZ3B1
L2RybS9wYW5mcm9zdC9wYW5mcm9zdF9tbXUuYyAgICAgfCA5ICsrKysrLS0tLQogZHJpdmVycy9n
cHUvZHJtL3BhbmZyb3N0L3BhbmZyb3N0X3BlcmZjbnQuYyB8IDEgKwogMiBmaWxlcyBjaGFuZ2Vk
LCA2IGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9n
cHUvZHJtL3BhbmZyb3N0L3BhbmZyb3N0X21tdS5jIGIvZHJpdmVycy9ncHUvZHJtL3BhbmZyb3N0
L3BhbmZyb3N0X21tdS5jCmluZGV4IGJkZDk5MDUuLjg3MTU3NGMgMTAwNjQ0Ci0tLSBhL2RyaXZl
cnMvZ3B1L2RybS9wYW5mcm9zdC9wYW5mcm9zdF9tbXUuYworKysgYi9kcml2ZXJzL2dwdS9kcm0v
cGFuZnJvc3QvcGFuZnJvc3RfbW11LmMKQEAgLTIyNCw5ICsyMjQsOSBAQCBzdGF0aWMgc2l6ZV90
IGdldF9wZ3NpemUodTY0IGFkZHIsIHNpemVfdCBzaXplKQogCXJldHVybiBTWl8yTTsKIH0KIAot
dm9pZCBwYW5mcm9zdF9tbXVfZmx1c2hfcmFuZ2Uoc3RydWN0IHBhbmZyb3N0X2RldmljZSAqcGZk
ZXYsCi0JCQkgICAgICBzdHJ1Y3QgcGFuZnJvc3RfbW11ICptbXUsCi0JCQkgICAgICB1NjQgaW92
YSwgc2l6ZV90IHNpemUpCitzdGF0aWMgdm9pZCBwYW5mcm9zdF9tbXVfZmx1c2hfcmFuZ2Uoc3Ry
dWN0IHBhbmZyb3N0X2RldmljZSAqcGZkZXYsCisJCQkJICAgIHN0cnVjdCBwYW5mcm9zdF9tbXUg
Km1tdSwKKwkJCQkgICAgdTY0IGlvdmEsIHNpemVfdCBzaXplKQogewogCWlmIChtbXUtPmFzIDwg
MCkKIAkJcmV0dXJuOwpAQCAtNDMyLDcgKzQzMiw4IEBAIHZvaWQgcGFuZnJvc3RfbW11X3BndGFi
bGVfZnJlZShzdHJ1Y3QgcGFuZnJvc3RfZmlsZV9wcml2ICpwcml2KQogCiAjZGVmaW5lIE5VTV9G
QVVMVF9QQUdFUyAoU1pfMk0gLyBQQUdFX1NJWkUpCiAKLWludCBwYW5mcm9zdF9tbXVfbWFwX2Zh
dWx0X2FkZHIoc3RydWN0IHBhbmZyb3N0X2RldmljZSAqcGZkZXYsIGludCBhcywgdTY0IGFkZHIp
CitzdGF0aWMgaW50IHBhbmZyb3N0X21tdV9tYXBfZmF1bHRfYWRkcihzdHJ1Y3QgcGFuZnJvc3Rf
ZGV2aWNlICpwZmRldiwgaW50IGFzLAorCQkJCQl1NjQgYWRkcikKIHsKIAlpbnQgcmV0LCBpOwog
CXN0cnVjdCBwYW5mcm9zdF9nZW1fb2JqZWN0ICpibzsKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1
L2RybS9wYW5mcm9zdC9wYW5mcm9zdF9wZXJmY250LmMgYi9kcml2ZXJzL2dwdS9kcm0vcGFuZnJv
c3QvcGFuZnJvc3RfcGVyZmNudC5jCmluZGV4IDgzYzU3ZDMuLjJkYmExOTIgMTAwNjQ0Ci0tLSBh
L2RyaXZlcnMvZ3B1L2RybS9wYW5mcm9zdC9wYW5mcm9zdF9wZXJmY250LmMKKysrIGIvZHJpdmVy
cy9ncHUvZHJtL3BhbmZyb3N0L3BhbmZyb3N0X3BlcmZjbnQuYwpAQCAtMTYsNiArMTYsNyBAQAog
I2luY2x1ZGUgInBhbmZyb3N0X2lzc3Vlcy5oIgogI2luY2x1ZGUgInBhbmZyb3N0X2pvYi5oIgog
I2luY2x1ZGUgInBhbmZyb3N0X21tdS5oIgorI2luY2x1ZGUgInBhbmZyb3N0X3BlcmZjbnQuaCIK
ICNpbmNsdWRlICJwYW5mcm9zdF9yZWdzLmgiCiAKICNkZWZpbmUgQ09VTlRFUlNfUEVSX0JMT0NL
CQk2NAotLSAKMS44LjMuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJp
LWRldmVs
