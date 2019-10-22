Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 825D0DFE3F
	for <lists+dri-devel@lfdr.de>; Tue, 22 Oct 2019 09:27:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 36F056E3F9;
	Tue, 22 Oct 2019 07:27:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mxhk.zte.com.cn (mxhk.zte.com.cn [63.217.80.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 76B7E6E133
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Oct 2019 03:01:17 +0000 (UTC)
Received: from mse-fl2.zte.com.cn (unknown [10.30.14.239])
 by Forcepoint Email with ESMTPS id AFD2CCB836AC15CE2B92;
 Tue, 22 Oct 2019 11:01:15 +0800 (CST)
Received: from notes_smtp.zte.com.cn (notes_smtp.zte.com.cn [10.30.1.239])
 by mse-fl2.zte.com.cn with ESMTP id x9M30NfR040299;
 Tue, 22 Oct 2019 11:00:23 +0800 (GMT-8)
 (envelope-from wang.yi59@zte.com.cn)
Received: from fox-host8.localdomain ([10.74.120.8])
 by szsmtp06.zte.com.cn (Lotus Domino Release 8.5.3FP6)
 with ESMTP id 2019102211002498-67328 ;
 Tue, 22 Oct 2019 11:00:24 +0800 
From: Yi Wang <wang.yi59@zte.com.cn>
To: steven.price@arm.com, robh@kernel.org
Subject: [PATCH v2] drm/panfrost: fix -Wmissing-prototypes warnings
Date: Tue, 22 Oct 2019 11:02:35 +0800
Message-Id: <1571713355-11927-1-git-send-email-wang.yi59@zte.com.cn>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-MIMETrack: Itemize by SMTP Server on SZSMTP06/server/zte_ltd(Release
 8.5.3FP6|November 21, 2013) at 2019-10-22 11:00:25,
 Serialize by Router on notes_smtp/zte_ltd(Release 9.0.1FP7|August  17, 2016) at
 2019-10-22 11:00:25
X-MAIL: mse-fl2.zte.com.cn x9M30NfR040299
X-Mailman-Approved-At: Tue, 22 Oct 2019 07:27:15 +0000
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
UmV2aWV3ZWQtYnk6IFN0ZXZlbiBQcmljZSA8c3RldmVuLnByaWNlQGFybS5jb20+Ci0tLQoKdjI6
IGFsaWduIHBhcmFtZXRlciBsaW5lLCBtb2RpZnkgY29tbWVudCBhbmQgc29ydCBoZWFkZXIKICAg
IGluY2x1ZGVzIGFscGhhYmV0aWNhbGx5LiBUaGFua3MgdG8gU3RldmUuCi0tLQogZHJpdmVycy9n
cHUvZHJtL3BhbmZyb3N0L3BhbmZyb3N0X21tdS5jICAgICB8IDkgKysrKystLS0tCiBkcml2ZXJz
L2dwdS9kcm0vcGFuZnJvc3QvcGFuZnJvc3RfcGVyZmNudC5jIHwgMSArCiAyIGZpbGVzIGNoYW5n
ZWQsIDYgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJz
L2dwdS9kcm0vcGFuZnJvc3QvcGFuZnJvc3RfbW11LmMgYi9kcml2ZXJzL2dwdS9kcm0vcGFuZnJv
c3QvcGFuZnJvc3RfbW11LmMKaW5kZXggYmRkOTkwNS4uMWY2Y2M3ZCAxMDA2NDQKLS0tIGEvZHJp
dmVycy9ncHUvZHJtL3BhbmZyb3N0L3BhbmZyb3N0X21tdS5jCisrKyBiL2RyaXZlcnMvZ3B1L2Ry
bS9wYW5mcm9zdC9wYW5mcm9zdF9tbXUuYwpAQCAtMjI0LDkgKzIyNCw5IEBAIHN0YXRpYyBzaXpl
X3QgZ2V0X3Bnc2l6ZSh1NjQgYWRkciwgc2l6ZV90IHNpemUpCiAJcmV0dXJuIFNaXzJNOwogfQog
Ci12b2lkIHBhbmZyb3N0X21tdV9mbHVzaF9yYW5nZShzdHJ1Y3QgcGFuZnJvc3RfZGV2aWNlICpw
ZmRldiwKLQkJCSAgICAgIHN0cnVjdCBwYW5mcm9zdF9tbXUgKm1tdSwKLQkJCSAgICAgIHU2NCBp
b3ZhLCBzaXplX3Qgc2l6ZSkKK3N0YXRpYyB2b2lkIHBhbmZyb3N0X21tdV9mbHVzaF9yYW5nZShz
dHJ1Y3QgcGFuZnJvc3RfZGV2aWNlICpwZmRldiwKKwkJCQkJCQkJCSBzdHJ1Y3QgcGFuZnJvc3Rf
bW11ICptbXUsCisJCQkJCQkJCQkgdTY0IGlvdmEsIHNpemVfdCBzaXplKQogewogCWlmIChtbXUt
PmFzIDwgMCkKIAkJcmV0dXJuOwpAQCAtNDMyLDcgKzQzMiw4IEBAIHZvaWQgcGFuZnJvc3RfbW11
X3BndGFibGVfZnJlZShzdHJ1Y3QgcGFuZnJvc3RfZmlsZV9wcml2ICpwcml2KQogCiAjZGVmaW5l
IE5VTV9GQVVMVF9QQUdFUyAoU1pfMk0gLyBQQUdFX1NJWkUpCiAKLWludCBwYW5mcm9zdF9tbXVf
bWFwX2ZhdWx0X2FkZHIoc3RydWN0IHBhbmZyb3N0X2RldmljZSAqcGZkZXYsIGludCBhcywgdTY0
IGFkZHIpCitzdGF0aWMgaW50IHBhbmZyb3N0X21tdV9tYXBfZmF1bHRfYWRkcihzdHJ1Y3QgcGFu
ZnJvc3RfZGV2aWNlICpwZmRldiwgaW50IGFzLAorCQkJCQkJCQkJICAgdTY0IGFkZHIpCiB7CiAJ
aW50IHJldCwgaTsKIAlzdHJ1Y3QgcGFuZnJvc3RfZ2VtX29iamVjdCAqYm87CmRpZmYgLS1naXQg
YS9kcml2ZXJzL2dwdS9kcm0vcGFuZnJvc3QvcGFuZnJvc3RfcGVyZmNudC5jIGIvZHJpdmVycy9n
cHUvZHJtL3BhbmZyb3N0L3BhbmZyb3N0X3BlcmZjbnQuYwppbmRleCA4M2M1N2QzLi4yZGJhMTky
IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vcGFuZnJvc3QvcGFuZnJvc3RfcGVyZmNudC5j
CisrKyBiL2RyaXZlcnMvZ3B1L2RybS9wYW5mcm9zdC9wYW5mcm9zdF9wZXJmY250LmMKQEAgLTE2
LDYgKzE2LDcgQEAKICNpbmNsdWRlICJwYW5mcm9zdF9pc3N1ZXMuaCIKICNpbmNsdWRlICJwYW5m
cm9zdF9qb2IuaCIKICNpbmNsdWRlICJwYW5mcm9zdF9tbXUuaCIKKyNpbmNsdWRlICJwYW5mcm9z
dF9wZXJmY250LmgiCiAjaW5jbHVkZSAicGFuZnJvc3RfcmVncy5oIgogCiAjZGVmaW5lIENPVU5U
RVJTX1BFUl9CTE9DSwkJNjQKLS0gCjEuOC4zLjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxp
c3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2RyaS1kZXZlbA==
