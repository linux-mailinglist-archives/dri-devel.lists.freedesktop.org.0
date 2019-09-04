Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 941E0A7C71
	for <lists+dri-devel@lfdr.de>; Wed,  4 Sep 2019 09:15:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 685AA89306;
	Wed,  4 Sep 2019 07:14:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 31DDF89686
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Sep 2019 06:49:17 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 8D457B062;
 Wed,  4 Sep 2019 06:49:15 +0000 (UTC)
Date: Tue, 3 Sep 2019 23:49:07 -0700
From: Davidlohr Bueso <dave@stgolabs.net>
To: tzimmermann@suse.de
Subject: potential regression in drm/mgag200
Message-ID: <20190904064907.fxzpknmqhfozkkwj@linux-r8p5>
MIME-Version: 1.0
Content-Disposition: inline
User-Agent: NeoMutt/20180323
X-Mailman-Approved-At: Wed, 04 Sep 2019 07:14:38 +0000
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
Cc: airlied@redhat.com, dri-devel@lists.freedesktop.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGksCgpXaGlsZSBkb2luZyBzb21lIGNoYW5nZXMgdG8geDg2J3MgcGF0IGNvZGUgYW5kIHRodXMg
aGF2aW5nICdkZWJ1Z3BhdCcsIEkgbm90aWNlZApzb21lIHdlaXJkIGJlaGF2aW9yIGluIGEgc2Vy
dmVyIHJ1bm5pbmcgbGludXgtbmV4dCBhcyBvZiAtLSB5ZXMsIHJldmVydGluZyBkb2VzICdmaXgn
CnRoZSBpc3N1ZToKCjkwZjQ3OWFlNTFhIChkcm0vbWdhZzIwMDogUmVwbGFjZSBzdHJ1Y3QgbWdh
X2ZiZGV2IHdpdGggZ2VuZXJpYyBmcmFtZWJ1ZmZlciBlbXVsYXRpb24pCgpXaGVyZSB0aGUgZm9s
bG93aW5nIHNwbGF0IGlzIHNlZW4gb3ZlciBhbmQgb3ZlciBlbmRsZXNzbHkgZm9yIHRoZSBzYW1l
IHJhbmdlOgoKeDg2L1BBVDogT3ZlcmxhcCBhdCAweGQwMDAwMDAwLTB4ZDEwMDAwMDAKeDg2L1BB
VDogcmVzZXJ2ZV9tZW10eXBlIGFkZGVkIFttZW0gMHhkMDAwMDAwMC0weGQwMmZmZmZmXSwgdHJh
Y2sgd3JpdGUtY29tYmluaW5nLCByZXEgd3JpdGUtY29tYmluaW5nLCByZXQgd3JpdGUtY29tYmlu
aW5nCng4Ni9QQVQ6IGZyZWVfbWVtdHlwZSByZXF1ZXN0IFttZW0gMHhkMDAwMDAwMC0weGQwMmZm
ZmZmXQoKQW5kIGFsbCB0aGVzZSBhcmUgZG9pbmcgaW9yZW1hcCBmcm9tIGRybV9mYl9oZWxwZXJf
ZGlydHlfd29yaygpOgoKWyAgMTE0LjMzMDgyNV0gIHJlc2VydmVfbWVtdHlwZSsweDFiMC8weDQx
MApbICAxMTQuMzMwODI5XSAgPyB0dG1fYm9fa21hcCsweDFkNy8weDI3MCBbdHRtXQpbICAxMTQu
MzMwODMwXSAgX19pb3JlbWFwX2NhbGxlci5jb25zdHByb3AuMTQrMHhmNi8weDMwMApbICAxMTQu
MzMwODMyXSAgPyBzb2Z0X2N1cnNvcisweDFmOS8weDIyMApbICAxMTQuMzMwODM1XSAgdHRtX2Jv
X2ttYXArMHgxZDcvMHgyNzAgW3R0bV0KWyAgMTE0LjMzMDgzOF0gID8gdHRtX2JvX2RlbF9zdWJf
ZnJvbV9scnUrMHgyOS8weDQwIFt0dG1dClsgIDExNC4zMzA4NDFdICBkcm1fZ2VtX3ZyYW1fa21h
cCsweDU0LzB4NzAgW2RybV92cmFtX2hlbHBlcl0KWyAgMTE0LjMzMDg0Ml0gIGRybV9nZW1fdnJh
bV9vYmplY3Rfdm1hcCsweDIzLzB4NDAgW2RybV92cmFtX2hlbHBlcl0KWyAgMTE0LjMzMDg1M10g
IGRybV9nZW1fdm1hcCsweDFmLzB4NjAgW2RybV0KWyAgMTE0LjQ3NzY5N10gIGRybV9jbGllbnRf
YnVmZmVyX3ZtYXArMHgxZC8weDMwIFtkcm1dClsgIDExNC40Nzc3MDNdICBkcm1fZmJfaGVscGVy
X2RpcnR5X3dvcmsrMHg5Mi8weDE4MCBbZHJtX2ttc19oZWxwZXJdClsgIDExNC40Nzc3MDZdICBw
cm9jZXNzX29uZV93b3JrKzB4MWY0LzB4M2UwClsgIDExNC40Nzc3MDddICB3b3JrZXJfdGhyZWFk
KzB4MmQvMHgzZTAKCkJlZm9yZSwgdGhlIHNhbWUgcmFuZ2Ugd2FzIGFsc28gYWRkZWQsIGJ1dCBv
bmx5IG9uY2UsIGFuZCBmd2l3IGl0IHdhcyB0aGUgc2FtZSBlaXRoZXIKd2l0aCAyNCBvciAzMiBi
cHAuCgpBbnkgdGhvdWdodHM/CgpUaGFua3MsCkRhdmlkbG9ocgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1k
ZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcv
bWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
