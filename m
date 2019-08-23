Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A3FDA9A7CD
	for <lists+dri-devel@lfdr.de>; Fri, 23 Aug 2019 08:51:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6094C6E1CF;
	Fri, 23 Aug 2019 06:51:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from pio-pvt-msa2.bahnhof.se (pio-pvt-msa2.bahnhof.se [79.136.2.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6FE2D6E1CF
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Aug 2019 06:51:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by pio-pvt-msa2.bahnhof.se (Postfix) with ESMTP id B13C33F872;
 Fri, 23 Aug 2019 08:51:05 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bahnhof.se
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level: 
X-Spam-Status: No, score=-2.099 tagged_above=-999 required=6.31
 tests=[BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, URIBL_BLOCKED=0.001]
 autolearn=ham autolearn_force=no
Received: from pio-pvt-msa2.bahnhof.se ([127.0.0.1])
 by localhost (pio-pvt-msa2.bahnhof.se [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ifzguHz8Msh1; Fri, 23 Aug 2019 08:51:01 +0200 (CEST)
Received: from mail1.shipmail.org (h-205-35.A357.priv.bahnhof.se
 [155.4.205.35]) (Authenticated sender: mb878879)
 by pio-pvt-msa2.bahnhof.se (Postfix) with ESMTPA id E0C273F52C;
 Fri, 23 Aug 2019 08:51:00 +0200 (CEST)
Received: from localhost.localdomain.localdomain
 (h-205-35.A357.priv.bahnhof.se [155.4.205.35])
 by mail1.shipmail.org (Postfix) with ESMTPSA id 0B24E36005C;
 Fri, 23 Aug 2019 08:50:58 +0200 (CEST)
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m=20=28VMware=29?=
 <thomas_os@shipmail.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2] drm/ttm: Add a comment for the FAULT_FLAG_ALLOW_RETRY
 implementation
Date: Fri, 23 Aug 2019 08:50:49 +0200
Message-Id: <20190823065049.7823-1-thomas_os@shipmail.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=shipmail.org; s=mail; 
 t=1566543060; bh=y93L75hEIQwR2bvflla+EIu4YzJE6iaqSvKN//X+Hbo=;
 h=From:To:Cc:Subject:Date:From;
 b=pF1jw0pT8/bE1KkIVnzu0nINdKphKvuKMerrv5KpeNjBEPeJdBy55ESXFg1gtAPsp
 cXGO2jgo/O08v+67v0yJlnbV1+z1unc8VghOsZeHlFlCmFG4doqIV3EE4WGM8ICqfK
 38HGEiT5ax8MPq0d3qMPGZFc6YJkz0YZHkMR/1bw=
X-Mailman-Original-Authentication-Results: pio-pvt-msa2.bahnhof.se;
 dkim=pass (1024-bit key;
 unprotected) header.d=shipmail.org header.i=@shipmail.org header.b=pF1jw0pT; 
 dkim-atps=neutral
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
Cc: pv-drivers@vmware.com, Thomas Hellstrom <thellstrom@vmware.com>,
 linux-graphics-maintainer@vmware.com,
 Christian Koenig <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogVGhvbWFzIEhlbGxzdHJvbSA8dGhlbGxzdHJvbUB2bXdhcmUuY29tPgoKVGhlIEZBVUxU
X0ZMQUdfQUxMT1dfUkVUUlkgc2VtYW50aWNzIGlzIHRyaWNreSBhbmQgYXBwZWFycyBwb29ybHkK
ZG9jdW1lbnRlZC4gQWRkIGEgY29tbWVudCB0byB0aGUgVFRNIGZhdWx0KCkgaW1wbGVtZW50YXRp
b24gdG8gYXZvaWQKZnV0dXJlIGNvbmZ1c2lvbi4KCkNjOiBDaHJpc3RpYW4gS29lbmlnIDxjaHJp
c3RpYW4ua29lbmlnQGFtZC5jb20+ClNpZ25lZC1vZmYtYnk6IFRob21hcyBIZWxsc3Ryb20gPHRo
ZWxsc3Ryb21Adm13YXJlLmNvbT4KLS0tCnYyOiBJbmNvcnJlY3QgZW1haWwgdG8gQ2hyaXN0aWFu
IDopCi0tLQogZHJpdmVycy9ncHUvZHJtL3R0bS90dG1fYm9fdm0uYyB8IDExICsrKysrKysrKysr
CiAxIGZpbGUgY2hhbmdlZCwgMTEgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMv
Z3B1L2RybS90dG0vdHRtX2JvX3ZtLmMgYi9kcml2ZXJzL2dwdS9kcm0vdHRtL3R0bV9ib192bS5j
CmluZGV4IGE2MWEzNWU1N2QxYy4uZTkzYjFhZDc4MjhmIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dw
dS9kcm0vdHRtL3R0bV9ib192bS5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS90dG0vdHRtX2JvX3Zt
LmMKQEAgLTEyNSw2ICsxMjUsMTcgQEAgc3RhdGljIHZtX2ZhdWx0X3QgdHRtX2JvX3ZtX2ZhdWx0
KHN0cnVjdCB2bV9mYXVsdCAqdm1mKQogCQkmYmRldi0+bWFuW2JvLT5tZW0ubWVtX3R5cGVdOwog
CXN0cnVjdCB2bV9hcmVhX3N0cnVjdCBjdm1hOwogCisJLyoKKwkgKiBGQVVMVF9GTEFHX0FMTE9X
X1JFVFJZIGluZGljYXRlcyB0aGF0IHRoZSBjYWxsZXIgd291bGQgbGlrZSB0byBhdm9pZAorCSAq
IElPIHdhaXRzIHdpdGggdGhlIG1tYXBfc2VtIGhlbGQuIFdpdGggRkFVTFRfRkxBR19SRVRSWV9O
T1dBSVQsCisJICogdGhlIGNhbGxlciB3b3VsZCBsaWtlIGFuIGVhcmx5IHJldHVybiB3aXRoIFZN
X0ZBVUxUX1JFVFJZIGFuZCB0aGUKKwkgKiBtbWFwX3NlbSBoZWxkLgorCSAqIElmIEZBVUxUX0ZM
QUdfUkVUUllfTk9XQUlUIGlzIG5vdCBzZXQsIHRoZW4gd2Ugc2hvdWxkIGRyb3AgdGhlCisJICog
bW1hcF9zZW0sIHBlcmZvcm0gdGhlIHdhaXQgYW5kIHJldHVybiBWTV9GQVVMVF9SRVRSWSB3aXRo
b3V0CisJICogaG9sZGluZyBpdC4gV2UgaW1wbGVtZW50IHRoaXMgZm9yIHNsZWVwaW5nIGJvIHJl
c2VydmF0aW9ucworCSAqIHdoZXJlIHRoZSByZXNlcnZhdGlvbiBob2xkZXIgbWF5IGJlIHdhaXRp
bmcgZm9yIGZlbmNlcywgYW5kIGZvcgorCSAqIGZlbmNlIHdhaXRzLgorCSAqLwogCWlmICh1bmxp
a2VseSghZG1hX3Jlc3ZfdHJ5bG9jayhiby0+YmFzZS5yZXN2KSkpIHsKIAkJaWYgKHZtZi0+Zmxh
Z3MgJiBGQVVMVF9GTEFHX0FMTE9XX1JFVFJZKSB7CiAJCQlpZiAoISh2bWYtPmZsYWdzICYgRkFV
TFRfRkxBR19SRVRSWV9OT1dBSVQpKSB7Ci0tIAoyLjIwLjEKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRl
dmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
