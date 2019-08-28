Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 10BC69FD10
	for <lists+dri-devel@lfdr.de>; Wed, 28 Aug 2019 10:30:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9DA748914C;
	Wed, 28 Aug 2019 08:30:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from shell.v3.sk (shell.v3.sk [90.176.6.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B9C7895B6
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Aug 2019 08:06:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by zimbra.v3.sk (Postfix) with ESMTP id 885A9D833B;
 Wed, 28 Aug 2019 09:59:59 +0200 (CEST)
Received: from shell.v3.sk ([127.0.0.1])
 by localhost (zimbra.v3.sk [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id r6NofhyOXIlp; Wed, 28 Aug 2019 09:59:45 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by zimbra.v3.sk (Postfix) with ESMTP id 3EC4BD8338;
 Wed, 28 Aug 2019 09:59:44 +0200 (CEST)
X-Virus-Scanned: amavisd-new at zimbra.v3.sk
Received: from shell.v3.sk ([127.0.0.1])
 by localhost (zimbra.v3.sk [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id Cpeb35XJblvd; Wed, 28 Aug 2019 09:59:41 +0200 (CEST)
Received: from belphegor.brq.redhat.com (nat-pool-brq-t.redhat.com
 [213.175.37.10])
 by zimbra.v3.sk (Postfix) with ESMTPSA id 50102D832C;
 Wed, 28 Aug 2019 09:59:41 +0200 (CEST)
From: Lubomir Rintel <lkundrak@v3.sk>
To: Russell King <linux@armlinux.org.uk>
Subject: [PATCH v4 1/5] dt-bindings: reserved-memory: Add binding for Armada
 framebuffer
Date: Wed, 28 Aug 2019 09:59:34 +0200
Message-Id: <20190828075938.318028-2-lkundrak@v3.sk>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190828075938.318028-1-lkundrak@v3.sk>
References: <20190828075938.318028-1-lkundrak@v3.sk>
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 28 Aug 2019 08:28:09 +0000
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Lubomir Rintel <lkundrak@v3.sk>, Rob Herring <robh+dt@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhpcyBpcyB0aGUgYmluZGluZyBmb3IgbWVtb3J5IHRoYXQgaXMgc2V0IGFzaWRlIGZvciBhbGxv
Y2F0aW9uIG9mIE1hcnZlbGwKQXJtYWRhIGZyYW1lYnVmZmVyIG9iamVjdHMuCgpTaWduZWQtb2Zm
LWJ5OiBMdWJvbWlyIFJpbnRlbCA8bGt1bmRyYWtAdjMuc2s+ClJldmlld2VkLWJ5OiBSb2IgSGVy
cmluZyA8cm9iaEBrZXJuZWwub3JnPgoKLS0tCkNoYW5nZXMgc2luY2UgdjI6Ci0gQ29sbGVjdGVk
IHRoZSBSZXZpZXdlZC1ieSB0YWcKCkNoYW5nZXMgc2luY2UgdjE6Ci0gTW92ZWQgZnJvbSBiaW5k
aW5ncy9kaXNwbGF5L2FybWFkYS8KLSBSZW1vdmVkIHRoZSBtYXJ2ZWxsLGRvdmUtZnJhbWVidWZm
ZXIgc3RyaW5nCi0gQWRkZWQgdG8gdGhlIE1BSU5UQUlORVJTIGVudHJ5CgogLi4uL21hcnZlbGws
YXJtYWRhLWZyYW1lYnVmZmVyLnR4dCAgICAgICAgICAgIHwgMjIgKysrKysrKysrKysrKysrKysr
KwogTUFJTlRBSU5FUlMgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgIDEgKwog
MiBmaWxlcyBjaGFuZ2VkLCAyMyBpbnNlcnRpb25zKCspCiBjcmVhdGUgbW9kZSAxMDA2NDQgRG9j
dW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3Jlc2VydmVkLW1lbW9yeS9tYXJ2ZWxsLGFy
bWFkYS1mcmFtZWJ1ZmZlci50eHQKCmRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRy
ZWUvYmluZGluZ3MvcmVzZXJ2ZWQtbWVtb3J5L21hcnZlbGwsYXJtYWRhLWZyYW1lYnVmZmVyLnR4
dCBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9yZXNlcnZlZC1tZW1vcnkvbWFy
dmVsbCxhcm1hZGEtZnJhbWVidWZmZXIudHh0Cm5ldyBmaWxlIG1vZGUgMTAwNjQ0CmluZGV4IDAw
MDAwMDAwMDAwMDAuLmFiMjQzZTJiYWQ0NTQKLS0tIC9kZXYvbnVsbAorKysgYi9Eb2N1bWVudGF0
aW9uL2RldmljZXRyZWUvYmluZGluZ3MvcmVzZXJ2ZWQtbWVtb3J5L21hcnZlbGwsYXJtYWRhLWZy
YW1lYnVmZmVyLnR4dApAQCAtMCwwICsxLDIyIEBACitNYXJ2ZWxsIEFybWFkYSBmcmFtZWJ1ZmZl
ciByZXNlcnZlZCBtZW1vcnkKKz09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PQorCitNZW1vcnkgc2V0IGFzaWRlIGZvciBhbGxvY2F0aW9uIG9mIE1hcnZlbGwgQXJtYWRh
IGZyYW1lYnVmZmVyIG9iamVjdHMuCisKK1JlcXVpcmVkIHByb3BlcnRpZXM6CisKKyAtIGNvbXBh
dGlibGU6IG11c3QgYmUgIm1hcnZlbGwsYXJtYWRhLWZyYW1lYnVmZmVyIgorCitQbGVhc2UgcmVm
ZXIgdG8gRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3Jlc2VydmVkLW1lbW9yeS9y
ZXNlcnZlZC1tZW1vcnkudHh0Citmb3IgY29tbW9uIHJlc2VydmVkIG1lbW9yeSBiaW5kaW5nIHVz
YWdlLgorCitFeGFtcGxlOgorCisJcmVzZXJ2ZWQtbWVtb3J5IHsKKwkJZGlzcGxheV9yZXNlcnZl
ZDogZnJhbWVidWZmZXIgeworCQkJY29tcGF0aWJsZSA9ICJtYXJ2ZWxsLGFybWFkYS1mcmFtZWJ1
ZmZlciI7CisJCQlzaXplID0gPDB4MDIwMDAwMDA+OworCQkJYWxpZ25tZW50ID0gPDB4MDIwMDAw
MDA+OworCQkJbm8tbWFwOworCQl9OworCX07CmRpZmYgLS1naXQgYS9NQUlOVEFJTkVSUyBiL01B
SU5UQUlORVJTCmluZGV4IDljYmNmMTY3YmRkMDguLjNkODI0ZWNmOTYyMjkgMTAwNjQ0Ci0tLSBh
L01BSU5UQUlORVJTCisrKyBiL01BSU5UQUlORVJTCkBAIC05NjIxLDYgKzk2MjEsNyBAQCBUOgln
aXQgZ2l0Oi8vZ2l0LmFybWxpbnV4Lm9yZy51ay9+cm1rL2xpbnV4LWFybS5naXQgZHJtLWFybWFk
YS1maXhlcwogRjoJZHJpdmVycy9ncHUvZHJtL2FybWFkYS8KIEY6CWluY2x1ZGUvdWFwaS9kcm0v
YXJtYWRhX2RybS5oCiBGOglEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxh
eS9hcm1hZGEvCitGOglEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvcmVzZXJ2ZWQt
bWVtb3J5L21hcnZlbGwsYXJtYWRhLWZyYW1lYnVmZmVyLnR4dAogCiBNQVJWRUxMIEFSTUFEQSAz
NzAwIFBIWSBEUklWRVJTCiBNOglNaXF1ZWwgUmF5bmFsIDxtaXF1ZWwucmF5bmFsQGJvb3RsaW4u
Y29tPgotLSAKMi4yMS4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3Rv
cC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmkt
ZGV2ZWw=
