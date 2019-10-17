Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 73145DCE52
	for <lists+dri-devel@lfdr.de>; Fri, 18 Oct 2019 20:39:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 82AC86EB95;
	Fri, 18 Oct 2019 18:39:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from imap1.codethink.co.uk (imap1.codethink.co.uk [176.9.8.82])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B70CF6EA57
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Oct 2019 11:18:02 +0000 (UTC)
Received: from [167.98.27.226] (helo=rainbowdash.codethink.co.uk)
 by imap1.codethink.co.uk with esmtpsa (Exim 4.84_2 #1 (Debian))
 id 1iL3n3-0002yw-Kr; Thu, 17 Oct 2019 12:17:57 +0100
Received: from ben by rainbowdash.codethink.co.uk with local (Exim 4.92.2)
 (envelope-from <ben@rainbowdash.codethink.co.uk>)
 id 1iL3n2-0003MI-WD; Thu, 17 Oct 2019 12:17:57 +0100
From: "Ben Dooks (Codethink)" <ben.dooks@codethink.co.uk>
To: linux-kernel@lists.codethink.co.uk
Subject: [PATCH] drm/arm: make undeclared items static
Date: Thu, 17 Oct 2019 12:17:55 +0100
Message-Id: <20191017111756.12861-1-ben.dooks@codethink.co.uk>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 18 Oct 2019 18:37:46 +0000
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
Cc: David Airlie <airlied@linux.ie>, Liviu Dudau <liviu.dudau@arm.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 "Ben Dooks \(Codethink\)" <ben.dooks@codethink.co.uk>, malidp@foss.arm.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

TWFrZSB0aGUgZm9sbG93aW5nIGl0ZW1zIHN0YXRpYyB0byBhdm9pZCBjbGFzaGVzIHdpdGgKb3Ro
ZXIgcGFydHMgb2YgdGhlIGtlcm5lbCAoZGV2X2F0dHJfY29yZV9pZCkgb3IganVzdApzaWxlbmNl
IHRoZSBmb2xsb3dpbmcgc3BhcnNlIHdhcm5pbmc6Cgpkcml2ZXJzL2dwdS9kcm0vYXJtL21hbGlk
cF9kcnYuYzozNzE6MjQ6IHdhcm5pbmc6IHN5bWJvbCAnbWFsaWRwX2ZiX2NyZWF0ZScgd2FzIG5v
dCBkZWNsYXJlZC4gU2hvdWxkIGl0IGJlIHN0YXRpYz8KZHJpdmVycy9ncHUvZHJtL2FybS9tYWxp
ZHBfZHJ2LmM6NDk0OjY6IHdhcm5pbmc6IHN5bWJvbCAnbWFsaWRwX2Vycm9yX3N0YXRzX2R1bXAn
IHdhcyBub3QgZGVjbGFyZWQuIFNob3VsZCBpdCBiZSBzdGF0aWM/CmRyaXZlcnMvZ3B1L2RybS9h
cm0vbWFsaWRwX2Rydi5jOjY2ODoxOiB3YXJuaW5nOiBzeW1ib2wgJ2Rldl9hdHRyX2NvcmVfaWQn
IHdhcyBub3QgZGVjbGFyZWQuIFNob3VsZCBpdCBiZSBzdGF0aWM/CgpTaWduZWQtb2ZmLWJ5OiBC
ZW4gRG9va3MgPGJlbi5kb29rc0Bjb2RldGhpbmsuY28udWs+Ci0tLQpDYzogTGl2aXUgRHVkYXUg
PGxpdml1LmR1ZGF1QGFybS5jb20+CkNjOiBCcmlhbiBTdGFya2V5IDxicmlhbi5zdGFya2V5QGFy
bS5jb20+CkNjOiBEYXZpZCBBaXJsaWUgPGFpcmxpZWRAbGludXguaWU+CkNjOiBEYW5pZWwgVmV0
dGVyIDxkYW5pZWxAZmZ3bGwuY2g+CkNjOiBtYWxpZHBAZm9zcy5hcm0uY29tCkNjOiBkcmktZGV2
ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCkNjOiBsaW51eC1rZXJuZWxAdmdlci5rZXJuZWwub3Jn
Ci4uIChvcGVuIGxpc3QpCi0tLQogZHJpdmVycy9ncHUvZHJtL2FybS9tYWxpZHBfZHJ2LmMgfCAx
MCArKysrKy0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgNSBpbnNlcnRpb25zKCspLCA1IGRlbGV0aW9u
cygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hcm0vbWFsaWRwX2Rydi5jIGIvZHJp
dmVycy9ncHUvZHJtL2FybS9tYWxpZHBfZHJ2LmMKaW5kZXggMzMzYjg4YTVlZmIwLi4xOGNhNDNj
OWNlZjQgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hcm0vbWFsaWRwX2Rydi5jCisrKyBi
L2RyaXZlcnMvZ3B1L2RybS9hcm0vbWFsaWRwX2Rydi5jCkBAIC0zNjgsNyArMzY4LDcgQEAgbWFs
aWRwX3ZlcmlmeV9hZmJjX2ZyYW1lYnVmZmVyKHN0cnVjdCBkcm1fZGV2aWNlICpkZXYsIHN0cnVj
dCBkcm1fZmlsZSAqZmlsZSwKIAlyZXR1cm4gZmFsc2U7CiB9CiAKLXN0cnVjdCBkcm1fZnJhbWVi
dWZmZXIgKgorc3RhdGljIHN0cnVjdCBkcm1fZnJhbWVidWZmZXIgKgogbWFsaWRwX2ZiX2NyZWF0
ZShzdHJ1Y3QgZHJtX2RldmljZSAqZGV2LCBzdHJ1Y3QgZHJtX2ZpbGUgKmZpbGUsCiAJCSBjb25z
dCBzdHJ1Y3QgZHJtX21vZGVfZmJfY21kMiAqbW9kZV9jbWQpCiB7CkBAIC00OTEsOSArNDkxLDkg
QEAgdm9pZCBtYWxpZHBfZXJyb3Ioc3RydWN0IG1hbGlkcF9kcm0gKm1hbGlkcCwKIAlzcGluX3Vu
bG9ja19pcnFyZXN0b3JlKCZtYWxpZHAtPmVycm9yc19sb2NrLCBpcnFmbGFncyk7CiB9CiAKLXZv
aWQgbWFsaWRwX2Vycm9yX3N0YXRzX2R1bXAoY29uc3QgY2hhciAqcHJlZml4LAotCQkJICAgICBz
dHJ1Y3QgbWFsaWRwX2Vycm9yX3N0YXRzIGVycm9yX3N0YXRzLAotCQkJICAgICBzdHJ1Y3Qgc2Vx
X2ZpbGUgKm0pCitzdGF0aWMgdm9pZCBtYWxpZHBfZXJyb3Jfc3RhdHNfZHVtcChjb25zdCBjaGFy
ICpwcmVmaXgsCisJCQkJICAgIHN0cnVjdCBtYWxpZHBfZXJyb3Jfc3RhdHMgZXJyb3Jfc3RhdHMs
CisJCQkJICAgIHN0cnVjdCBzZXFfZmlsZSAqbSkKIHsKIAlzZXFfcHJpbnRmKG0sICJbJXNdIG51
bV9lcnJvcnMgOiAlZFxuIiwgcHJlZml4LAogCQkgICBlcnJvcl9zdGF0cy5udW1fZXJyb3JzKTsK
QEAgLTY2NSw3ICs2NjUsNyBAQCBzdGF0aWMgc3NpemVfdCBjb3JlX2lkX3Nob3coc3RydWN0IGRl
dmljZSAqZGV2LCBzdHJ1Y3QgZGV2aWNlX2F0dHJpYnV0ZSAqYXR0ciwKIAlyZXR1cm4gc25wcmlu
dGYoYnVmLCBQQUdFX1NJWkUsICIlMDh4XG4iLCBtYWxpZHAtPmNvcmVfaWQpOwogfQogCi1ERVZJ
Q0VfQVRUUl9STyhjb3JlX2lkKTsKK3N0YXRpYyBERVZJQ0VfQVRUUl9STyhjb3JlX2lkKTsKIAog
c3RhdGljIGludCBtYWxpZHBfaW5pdF9zeXNmcyhzdHJ1Y3QgZGV2aWNlICpkZXYpCiB7Ci0tIAoy
LjIzLjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRy
aS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRw
czovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
