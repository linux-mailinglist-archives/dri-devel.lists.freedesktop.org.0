Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6ECC121BB6
	for <lists+dri-devel@lfdr.de>; Fri, 17 May 2019 18:37:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 164278987C;
	Fri, 17 May 2019 16:37:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.101.70])
 by gabe.freedesktop.org (Postfix) with ESMTP id 9D6368987C
 for <dri-devel@lists.freedesktop.org>; Fri, 17 May 2019 16:37:33 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 880921993;
 Fri, 17 May 2019 09:37:33 -0700 (PDT)
Received: from e110467-lin.cambridge.arm.com (e110467-lin.cambridge.arm.com
 [10.1.196.75])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id B61513F575;
 Fri, 17 May 2019 09:37:32 -0700 (PDT)
From: Robin Murphy <robin.murphy@arm.com>
To: liviu.dudau@arm.com
Subject: [PATCH 2/2] drm/arm/hdlcd: Allow a bit of clock tolerance
Date: Fri, 17 May 2019 17:37:22 +0100
Message-Id: <47fb141ddbf4cf256951758d2e7f90afb6507ded.1558111042.git.robin.murphy@arm.com>
X-Mailer: git-send-email 2.21.0.dirty
In-Reply-To: <9db0bac184d9fa69c4f65bf954ab59b53d431e15.1558111042.git.robin.murphy@arm.com>
References: <9db0bac184d9fa69c4f65bf954ab59b53d431e15.1558111042.git.robin.murphy@arm.com>
MIME-Version: 1.0
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gdGhlIEFybSBKdW5vIHBsYXRmb3JtLCB0aGUgSERMQ0QgcGl4ZWwgY2xvY2sgaXMgY29uc3Ry
YWluZWQgdG8gMjUwS0h6CnJlc29sdXRpb24gaW4gb3JkZXIgdG8gYXZvaWQgdGhlIHRpbnkgU3lz
dGVtIENvbnRyb2wgUHJvY2Vzc29yIHNwZW5kaW5nCmFlb25zIHRyeWluZyB0byBjYWxjdWxhdGUg
ZXhhY3QgUExMIGNvZWZmaWNpZW50cy4gVGhpcyBtZWFucyB0aGF0IG1vZGVzCmxpa2UgbXkgb2Rk
YmFsbCAxNjAweDEyMDAgd2l0aCAxMzAuODlNSHogY2xvY2sgZ2V0IHJlamVjdGVkIHNpbmNlIHRo
ZQpyYXRlIGNhbm5vdCBiZSBtYXRjaGVkIGV4YWN0bHkuIEluIHByYWN0aWNlLCB0aG91Z2gsIHRo
aXMgbW9kZSB3b3JrcwpxdWl0ZSBoYXBwaWx5IHdpdGggdGhlIGNsb2NrIGF0IDEzMU1Ieiwgc28g
bGV0J3MgcmVsYXggdGhlIGNoZWNrIHRvCmFsbG93IGEgbGl0dGxlIGJpdCBvZiBzbG9wLgoKU2ln
bmVkLW9mZi1ieTogUm9iaW4gTXVycGh5IDxyb2Jpbi5tdXJwaHlAYXJtLmNvbT4KLS0tCiBkcml2
ZXJzL2dwdS9kcm0vYXJtL2hkbGNkX2NydGMuYyB8IDMgKystCiAxIGZpbGUgY2hhbmdlZCwgMiBp
bnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJt
L2FybS9oZGxjZF9jcnRjLmMgYi9kcml2ZXJzL2dwdS9kcm0vYXJtL2hkbGNkX2NydGMuYwppbmRl
eCBlY2FjNmZlMGIyMTMuLmEzZWZhMjg0MzZlYSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJt
L2FybS9oZGxjZF9jcnRjLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FybS9oZGxjZF9jcnRjLmMK
QEAgLTE5Myw3ICsxOTMsOCBAQCBzdGF0aWMgZW51bSBkcm1fbW9kZV9zdGF0dXMgaGRsY2RfY3J0
Y19tb2RlX3ZhbGlkKHN0cnVjdCBkcm1fY3J0YyAqY3J0YywKIAlsb25nIHJhdGUsIGNsa19yYXRl
ID0gbW9kZS0+Y2xvY2sgKiAxMDAwOwogCiAJcmF0ZSA9IGNsa19yb3VuZF9yYXRlKGhkbGNkLT5j
bGssIGNsa19yYXRlKTsKLQlpZiAocmF0ZSAhPSBjbGtfcmF0ZSkgeworCS8qIDAuMSUgc2VlbXMg
YSBjbG9zZSBlbm91Z2ggdG9sZXJhbmNlIGZvciB0aGUgVERBMTk5ODggb24gSnVubyAqLworCWlm
IChhYnMocmF0ZSAtIGNsa19yYXRlKSAqIDEwMDAgPiBjbGtfcmF0ZSkgewogCQkvKiBjbG9jayBy
ZXF1aXJlZCBieSBtb2RlIG5vdCBzdXBwb3J0ZWQgYnkgaGFyZHdhcmUgKi8KIAkJcmV0dXJuIE1P
REVfTk9DTE9DSzsKIAl9Ci0tIAoyLjIxLjAuZGlydHkKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVs
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
