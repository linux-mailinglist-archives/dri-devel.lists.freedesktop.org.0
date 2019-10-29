Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 66066E97D2
	for <lists+dri-devel@lfdr.de>; Wed, 30 Oct 2019 09:14:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7AFDA6ECA2;
	Wed, 30 Oct 2019 08:14:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mxhk.zte.com.cn (mxhk.zte.com.cn [63.217.80.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D8686E820
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Oct 2019 01:55:01 +0000 (UTC)
Received: from mse-fl2.zte.com.cn (unknown [10.30.14.239])
 by Forcepoint Email with ESMTPS id 856F7CB7E9BC2DB3B145;
 Tue, 29 Oct 2019 09:54:58 +0800 (CST)
Received: from notes_smtp.zte.com.cn (notessmtp.zte.com.cn [10.30.1.239])
 by mse-fl2.zte.com.cn with ESMTP id x9T1sbGV017474;
 Tue, 29 Oct 2019 09:54:37 +0800 (GMT-8)
 (envelope-from wang.yi59@zte.com.cn)
Received: from fox-host8.localdomain ([10.74.120.8])
 by szsmtp06.zte.com.cn (Lotus Domino Release 8.5.3FP6)
 with ESMTP id 2019102909544831-171950 ;
 Tue, 29 Oct 2019 09:54:48 +0800 
From: Yi Wang <wang.yi59@zte.com.cn>
To: steven.price@arm.com, robh@kernel.org
Subject: [PATCH v4] drm/panfrost: fix -Wmissing-prototypes warnings
Date: Tue, 29 Oct 2019 09:57:30 +0800
Message-Id: <1572314250-6463-1-git-send-email-wang.yi59@zte.com.cn>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-MIMETrack: Itemize by SMTP Server on SZSMTP06/server/zte_ltd(Release
 8.5.3FP6|November 21, 2013) at 2019-10-29 09:54:48,
 Serialize by Router on notes_smtp/zte_ltd(Release 9.0.1FP7|August  17, 2016) at
 2019-10-29 09:54:39
X-MAIL: mse-fl2.zte.com.cn x9T1sbGV017474
X-Mailman-Approved-At: Wed, 30 Oct 2019 08:14:00 +0000
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
UmV2aWV3ZWQtYnk6IFN0ZXZlbiBQcmljZSA8c3RldmVuLnByaWNlQGFybS5jb20+Ci0tLQoKdjQ6
IG1ha2UgdGhlIHBhcmFtZXRlcnMgYWxpZ25lZC4KCnYzOiB1c2luZyB0YWIgc2l6ZSBvZiA4IG90
aGVyIHRoYW4gNC4KCnYyOiBhbGlnbiBwYXJhbWV0ZXIgbGluZSBhbmQgbW9kaWZ5IGNvbW1lbnQu
IFRoYW5rcyB0byBTdGV2ZS4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vcGFuZnJvc3QvcGFuZnJvc3Rf
bW11LmMgICAgIHwgOSArKysrKy0tLS0KIGRyaXZlcnMvZ3B1L2RybS9wYW5mcm9zdC9wYW5mcm9z
dF9wZXJmY250LmMgfCAxICsKIDIgZmlsZXMgY2hhbmdlZCwgNiBpbnNlcnRpb25zKCspLCA0IGRl
bGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9wYW5mcm9zdC9wYW5mcm9z
dF9tbXUuYyBiL2RyaXZlcnMvZ3B1L2RybS9wYW5mcm9zdC9wYW5mcm9zdF9tbXUuYwppbmRleCBi
ZGQ5OTA1Li44N2U3OTYzIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vcGFuZnJvc3QvcGFu
ZnJvc3RfbW11LmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL3BhbmZyb3N0L3BhbmZyb3N0X21tdS5j
CkBAIC0yMjQsOSArMjI0LDkgQEAgc3RhdGljIHNpemVfdCBnZXRfcGdzaXplKHU2NCBhZGRyLCBz
aXplX3Qgc2l6ZSkKIAlyZXR1cm4gU1pfMk07CiB9CiAKLXZvaWQgcGFuZnJvc3RfbW11X2ZsdXNo
X3JhbmdlKHN0cnVjdCBwYW5mcm9zdF9kZXZpY2UgKnBmZGV2LAotCQkJICAgICAgc3RydWN0IHBh
bmZyb3N0X21tdSAqbW11LAotCQkJICAgICAgdTY0IGlvdmEsIHNpemVfdCBzaXplKQorc3RhdGlj
IHZvaWQgcGFuZnJvc3RfbW11X2ZsdXNoX3JhbmdlKHN0cnVjdCBwYW5mcm9zdF9kZXZpY2UgKnBm
ZGV2LAorCQkJCSAgICAgc3RydWN0IHBhbmZyb3N0X21tdSAqbW11LAorCQkJCSAgICAgdTY0IGlv
dmEsIHNpemVfdCBzaXplKQogewogCWlmIChtbXUtPmFzIDwgMCkKIAkJcmV0dXJuOwpAQCAtNDMy
LDcgKzQzMiw4IEBAIHZvaWQgcGFuZnJvc3RfbW11X3BndGFibGVfZnJlZShzdHJ1Y3QgcGFuZnJv
c3RfZmlsZV9wcml2ICpwcml2KQogCiAjZGVmaW5lIE5VTV9GQVVMVF9QQUdFUyAoU1pfMk0gLyBQ
QUdFX1NJWkUpCiAKLWludCBwYW5mcm9zdF9tbXVfbWFwX2ZhdWx0X2FkZHIoc3RydWN0IHBhbmZy
b3N0X2RldmljZSAqcGZkZXYsIGludCBhcywgdTY0IGFkZHIpCitzdGF0aWMgaW50IHBhbmZyb3N0
X21tdV9tYXBfZmF1bHRfYWRkcihzdHJ1Y3QgcGFuZnJvc3RfZGV2aWNlICpwZmRldiwgaW50IGFz
LAorCQkJCSAgICAgICB1NjQgYWRkcikKIHsKIAlpbnQgcmV0LCBpOwogCXN0cnVjdCBwYW5mcm9z
dF9nZW1fb2JqZWN0ICpibzsKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9wYW5mcm9zdC9w
YW5mcm9zdF9wZXJmY250LmMgYi9kcml2ZXJzL2dwdS9kcm0vcGFuZnJvc3QvcGFuZnJvc3RfcGVy
ZmNudC5jCmluZGV4IDgzYzU3ZDMuLjJkYmExOTIgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2Ry
bS9wYW5mcm9zdC9wYW5mcm9zdF9wZXJmY250LmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL3BhbmZy
b3N0L3BhbmZyb3N0X3BlcmZjbnQuYwpAQCAtMTYsNiArMTYsNyBAQAogI2luY2x1ZGUgInBhbmZy
b3N0X2lzc3Vlcy5oIgogI2luY2x1ZGUgInBhbmZyb3N0X2pvYi5oIgogI2luY2x1ZGUgInBhbmZy
b3N0X21tdS5oIgorI2luY2x1ZGUgInBhbmZyb3N0X3BlcmZjbnQuaCIKICNpbmNsdWRlICJwYW5m
cm9zdF9yZWdzLmgiCiAKICNkZWZpbmUgQ09VTlRFUlNfUEVSX0JMT0NLCQk2NAotLSAKMS44LjMu
MQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRl
dmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8v
bGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
