Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D151A132C
	for <lists+dri-devel@lfdr.de>; Thu, 29 Aug 2019 10:01:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D93C28924B;
	Thu, 29 Aug 2019 08:01:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF94689722;
 Wed, 28 Aug 2019 08:27:23 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 7D5FBACD8;
 Wed, 28 Aug 2019 08:27:22 +0000 (UTC)
Date: Wed, 28 Aug 2019 10:27:29 +0200
From: Jean Delvare <jdelvare@suse.de>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH] drm/amd/amdgpu: hide voltage and power sensors on SI and KV
 parts
Message-ID: <20190828102729.7435a532@endymion>
Organization: SUSE Linux
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 29 Aug 2019 08:01:00 +0000
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
Cc: Alex Deucher <alexander.deucher@amd.com>, Christian =?UTF-8?B?S8O2?=
 =?UTF-8?B?bmln?= <christian.koenig@amd.com>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhlIGRyaXZlciBkb2VzIG5vdCBzdXBwb3J0IHRoZXNlIHNlbnNvcnMgeWV0IGFuZCB0aGVyZSBp
cyBubyBwb2ludCBpbgpjcmVhdGluZyBzeXNmcyBhdHRyaWJ1dGVzIHdoaWNoIHdpbGwgYWx3YXlz
IHJldHVybiBhbiBlcnJvci4KClNpZ25lZC1vZmYtYnk6IEplYW4gRGVsdmFyZSA8amRlbHZhcmVA
c3VzZS5kZT4KQ2M6IEFsZXggRGV1Y2hlciA8YWxleGFuZGVyLmRldWNoZXJAYW1kLmNvbT4KQ2M6
ICJDaHJpc3RpYW4gS8O2bmlnIiA8Y2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29tPgpDYzogIkRhdmlk
IChDaHVuTWluZykgWmhvdSIgPERhdmlkMS5aaG91QGFtZC5jb20+Ci0tLQpUaGlzIHdvcmtzIGZv
ciBtZSBob3dldmVyIEkgY291bGRuJ3Qgc2VlbiBhbnkgb3RoZXIgcGxhY2UgaW4gdGhlIGRyaXZl
cgp3aGVyZSBhZGV2LT5mYW1pbHkgaXMgdGVzdGVkIGRpcmVjdGx5IGxpa2UgdGhhdCwgc28gSSdt
IG5vdCBzdXJlIGlmCnRoaXMgaXMgdGhlIHJpZ2h0IHdheSB0byBwZXJmb3JtIHRoZSB0ZXN0PwoK
IGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9wbS5jIHwgICAxMCArKysrKysrKyst
CiAxIGZpbGUgY2hhbmdlZCwgOSBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCgotLS0gbGlu
dXgtNS4yLm9yaWcvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3BtLmMJMjAxOS0w
OC0yOCAwOTozODoxMS4yNDUzNzY1MzkgKzAyMDAKKysrIGxpbnV4LTUuMi9kcml2ZXJzL2dwdS9k
cm0vYW1kL2FtZGdwdS9hbWRncHVfcG0uYwkyMDE5LTA4LTI4IDA5OjU4OjU5Ljg5NjMxNDk0OCAr
MDIwMApAQCAtMjE1MCw3ICsyMTUwLDkgQEAgc3RhdGljIHVtb2RlX3QgaHdtb25fYXR0cmlidXRl
c192aXNpYmxlKAogCQkJZWZmZWN0aXZlX21vZGUgJj0gflNfSVdVU1I7CiAJfQogCi0JaWYgKChh
ZGV2LT5mbGFncyAmIEFNRF9JU19BUFUpICYmCisJaWYgKCgoYWRldi0+ZmxhZ3MgJiBBTURfSVNf
QVBVKSB8fAorCSAgICAgYWRldi0+ZmFtaWx5ID09IEFNREdQVV9GQU1JTFlfU0kgfHwJLyogbm90
IGltcGxlbWVudGVkIHlldCAqLworCSAgICAgYWRldi0+ZmFtaWx5ID09IEFNREdQVV9GQU1JTFlf
S1YpICYmCS8qIG5vdCBpbXBsZW1lbnRlZCB5ZXQgKi8KIAkgICAgKGF0dHIgPT0gJnNlbnNvcl9k
ZXZfYXR0cl9wb3dlcjFfYXZlcmFnZS5kZXZfYXR0ci5hdHRyIHx8CiAJICAgICBhdHRyID09ICZz
ZW5zb3JfZGV2X2F0dHJfcG93ZXIxX2NhcF9tYXguZGV2X2F0dHIuYXR0ciB8fAogCSAgICAgYXR0
ciA9PSAmc2Vuc29yX2Rldl9hdHRyX3Bvd2VyMV9jYXBfbWluLmRldl9hdHRyLmF0dHJ8fApAQCAt
MjE3NCw2ICsyMTc2LDEyIEBAIHN0YXRpYyB1bW9kZV90IGh3bW9uX2F0dHJpYnV0ZXNfdmlzaWJs
ZSgKIAkJCXJldHVybiAwOwogCX0KIAorCWlmICgoYWRldi0+ZmFtaWx5ID09IEFNREdQVV9GQU1J
TFlfU0kgfHwJLyogbm90IGltcGxlbWVudGVkIHlldCAqLworCSAgICAgYWRldi0+ZmFtaWx5ID09
IEFNREdQVV9GQU1JTFlfS1YpICYmCS8qIG5vdCBpbXBsZW1lbnRlZCB5ZXQgKi8KKwkgICAgKGF0
dHIgPT0gJnNlbnNvcl9kZXZfYXR0cl9pbjBfaW5wdXQuZGV2X2F0dHIuYXR0ciB8fAorCSAgICAg
YXR0ciA9PSAmc2Vuc29yX2Rldl9hdHRyX2luMF9sYWJlbC5kZXZfYXR0ci5hdHRyKSkKKwkJcmV0
dXJuIDA7CisKIAkvKiBvbmx5IEFQVXMgaGF2ZSB2ZGRuYiAqLwogCWlmICghKGFkZXYtPmZsYWdz
ICYgQU1EX0lTX0FQVSkgJiYKIAkgICAgKGF0dHIgPT0gJnNlbnNvcl9kZXZfYXR0cl9pbjFfaW5w
dXQuZGV2X2F0dHIuYXR0ciB8fAoKCi0tIApKZWFuIERlbHZhcmUKU1VTRSBMMyBTdXBwb3J0Cl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBt
YWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3Rz
LmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
