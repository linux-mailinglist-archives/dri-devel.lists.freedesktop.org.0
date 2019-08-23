Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 020279A7C4
	for <lists+dri-devel@lfdr.de>; Fri, 23 Aug 2019 08:46:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D6E36E03B;
	Fri, 23 Aug 2019 06:46:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ste-pvt-msa2.bahnhof.se (ste-pvt-msa2.bahnhof.se
 [213.80.101.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 23C536E03B
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Aug 2019 06:46:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by ste-pvt-msa2.bahnhof.se (Postfix) with ESMTP id 9D4473F65E;
 Fri, 23 Aug 2019 08:46:51 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bahnhof.se
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level: 
X-Spam-Status: No, score=-2.099 tagged_above=-999 required=6.31
 tests=[BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, URIBL_BLOCKED=0.001]
 autolearn=ham autolearn_force=no
Received: from ste-pvt-msa2.bahnhof.se ([127.0.0.1])
 by localhost (ste-ftg-msa2.bahnhof.se [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5LEMPqdPMdzx; Fri, 23 Aug 2019 08:46:50 +0200 (CEST)
Received: from mail1.shipmail.org (h-205-35.A357.priv.bahnhof.se
 [155.4.205.35]) (Authenticated sender: mb878879)
 by ste-pvt-msa2.bahnhof.se (Postfix) with ESMTPA id 213783F218;
 Fri, 23 Aug 2019 08:46:49 +0200 (CEST)
Received: from localhost.localdomain.localdomain
 (h-205-35.A357.priv.bahnhof.se [155.4.205.35])
 by mail1.shipmail.org (Postfix) with ESMTPSA id B1BAB36005C;
 Fri, 23 Aug 2019 08:46:47 +0200 (CEST)
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m=20=28VMware=29?=
 <thomas_os@shipmail.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/ttm: Add a comment for the FAULT_FLAG_ALLOW_RETRY
 implementation
Date: Fri, 23 Aug 2019 08:46:36 +0200
Message-Id: <20190823064636.7656-1-thomas_os@shipmail.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=shipmail.org; s=mail; 
 t=1566542809; bh=f94HPcy1vKRDe9GTVsLbobn+yR0i5YhkblX4Svja2sk=;
 h=From:To:Cc:Subject:Date:From;
 b=SKk5Htqu/6iPtnpJyzsLvkp/YJmRaFemZIMFkI0ZiUL3IQjYrxKLYIe8Yz2dFAfiX
 WonMpZdkGfkLK8zjPw/ftjY8jjpCYDweFqkudwubDMhHj9l1Cc4xQQZqC5SdvG/FYN
 /7fYeHlL/QZvo/pvIdBbfNavnJHsEHnKs/IWTNcQ=
X-Mailman-Original-Authentication-Results: ste-pvt-msa2.bahnhof.se;
 dkim=pass (1024-bit key;
 unprotected) header.d=shipmail.org header.i=@shipmail.org header.b=SKk5Htqu; 
 dkim-atps=neutral
X-Mailman-Original-Authentication-Results: ste-ftg-msa2.bahnhof.se
 (amavisd-new); 
 dkim=pass (1024-bit key) header.d=shipmail.org
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
Cc: pv-drivers@vmware.com, Christian Koenig <christian.koenig@vmware.com>,
 Thomas Hellstrom <thellstrom@vmware.com>, linux-graphics-maintainer@vmware.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogVGhvbWFzIEhlbGxzdHJvbSA8dGhlbGxzdHJvbUB2bXdhcmUuY29tPgoKVGhlIEZBVUxU
X0ZMQUdfQUxMT1dfUkVUUlkgc2VtYW50aWNzIGlzIHRyaWNreSBhbmQgYXBwZWFycyBwb29ybHkK
ZG9jdW1lbnRlZC4gQWRkIGEgY29tbWVudCB0byB0aGUgVFRNIGZhdWx0KCkgaW1wbGVtZW50YXRp
b24gdG8gYXZvaWQKZnV0dXJlIGNvbmZ1c2lvbi4KCkNjOiBDaHJpc3RpYW4gS29lbmlnIDxjaHJp
c3RpYW4ua29lbmlnQHZtd2FyZS5jb20+ClNpZ25lZC1vZmYtYnk6IFRob21hcyBIZWxsc3Ryb20g
PHRoZWxsc3Ryb21Adm13YXJlLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vdHRtL3R0bV9ib192
bS5jIHwgMTEgKysrKysrKysrKysKIDEgZmlsZSBjaGFuZ2VkLCAxMSBpbnNlcnRpb25zKCspCgpk
aWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3R0bS90dG1fYm9fdm0uYyBiL2RyaXZlcnMvZ3B1
L2RybS90dG0vdHRtX2JvX3ZtLmMKaW5kZXggYTYxYTM1ZTU3ZDFjLi5lOTNiMWFkNzgyOGYgMTAw
NjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS90dG0vdHRtX2JvX3ZtLmMKKysrIGIvZHJpdmVycy9n
cHUvZHJtL3R0bS90dG1fYm9fdm0uYwpAQCAtMTI1LDYgKzEyNSwxNyBAQCBzdGF0aWMgdm1fZmF1
bHRfdCB0dG1fYm9fdm1fZmF1bHQoc3RydWN0IHZtX2ZhdWx0ICp2bWYpCiAJCSZiZGV2LT5tYW5b
Ym8tPm1lbS5tZW1fdHlwZV07CiAJc3RydWN0IHZtX2FyZWFfc3RydWN0IGN2bWE7CiAKKwkvKgor
CSAqIEZBVUxUX0ZMQUdfQUxMT1dfUkVUUlkgaW5kaWNhdGVzIHRoYXQgdGhlIGNhbGxlciB3b3Vs
ZCBsaWtlIHRvIGF2b2lkCisJICogSU8gd2FpdHMgd2l0aCB0aGUgbW1hcF9zZW0gaGVsZC4gV2l0
aCBGQVVMVF9GTEFHX1JFVFJZX05PV0FJVCwKKwkgKiB0aGUgY2FsbGVyIHdvdWxkIGxpa2UgYW4g
ZWFybHkgcmV0dXJuIHdpdGggVk1fRkFVTFRfUkVUUlkgYW5kIHRoZQorCSAqIG1tYXBfc2VtIGhl
bGQuCisJICogSWYgRkFVTFRfRkxBR19SRVRSWV9OT1dBSVQgaXMgbm90IHNldCwgdGhlbiB3ZSBz
aG91bGQgZHJvcCB0aGUKKwkgKiBtbWFwX3NlbSwgcGVyZm9ybSB0aGUgd2FpdCBhbmQgcmV0dXJu
IFZNX0ZBVUxUX1JFVFJZIHdpdGhvdXQKKwkgKiBob2xkaW5nIGl0LiBXZSBpbXBsZW1lbnQgdGhp
cyBmb3Igc2xlZXBpbmcgYm8gcmVzZXJ2YXRpb25zCisJICogd2hlcmUgdGhlIHJlc2VydmF0aW9u
IGhvbGRlciBtYXkgYmUgd2FpdGluZyBmb3IgZmVuY2VzLCBhbmQgZm9yCisJICogZmVuY2Ugd2Fp
dHMuCisJICovCiAJaWYgKHVubGlrZWx5KCFkbWFfcmVzdl90cnlsb2NrKGJvLT5iYXNlLnJlc3Yp
KSkgewogCQlpZiAodm1mLT5mbGFncyAmIEZBVUxUX0ZMQUdfQUxMT1dfUkVUUlkpIHsKIAkJCWlm
ICghKHZtZi0+ZmxhZ3MgJiBGQVVMVF9GTEFHX1JFVFJZX05PV0FJVCkpIHsKLS0gCjIuMjAuMQoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
