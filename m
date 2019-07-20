Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D35F76EF84
	for <lists+dri-devel@lfdr.de>; Sat, 20 Jul 2019 15:47:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 006F56E8B9;
	Sat, 20 Jul 2019 13:47:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.domeneshop.no (smtp.domeneshop.no
 [IPv6:2a01:5b40:0:3005::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A5D1E6E8B5
 for <dri-devel@lists.freedesktop.org>; Sat, 20 Jul 2019 13:47:18 +0000 (UTC)
Received: from 211.81-166-168.customer.lyse.net ([81.166.168.211]:56672
 helo=localhost.localdomain)
 by smtp.domeneshop.no with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_CBC_SHA1:128)
 (Exim 4.84_2) (envelope-from <noralf@tronnes.org>)
 id 1hophk-0003FR-GB; Sat, 20 Jul 2019 15:47:16 +0200
From: =?UTF-8?q?Noralf=20Tr=C3=B8nnes?= <noralf@tronnes.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 0/6] drm/tinydrm: Move mipi_dbi
Date: Sat, 20 Jul 2019 15:47:03 +0200
Message-Id: <20190720134709.15186-1-noralf@tronnes.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; d=tronnes.org; s=ds201810; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:Cc:To:From;
 bh=qk5AdmkJzqFz+nXlNfPafoypde1nIF+kSwENjAxiD1A=; 
 b=jPNv8pR87avKPtDmxLcLUDoZcXVENS1V/DdfThr7H4FTPTYkFDgEffxkJH61AyZctp7cIrGVi6TRHy1mO2tsPa0Oy5yMw/MZMAci8IuVnu8qcvILnwAgv9EskBnAMyO8syOvXXERHydwiEuftCWTrnpKpsTv5Hpt9ZmjF/uTkFo8vCNIMjUhEiriqBt/dEMeWRtwTWwSbhDLItR0Mz7tgMCIUqM07bHqGEf+uIarUnglpq8mvPYr9Y0Yx08lVi/8cbkndX9boKDwHzG8B+MOvr2mu0hM8Gs2U0Yl4tNGUblbqGR0cJA1RpsOkb3SQ4am2nEPuFn92z+VNA4wKa7asQ==;
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
Cc: david@lechnology.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhpcyBzZXJpZXMgdGlja3Mgb2ZmIHRoZSBsYXN0IHRpbnlkcm0gdG9kbyBlbnRyeSBhbmQgbW92
ZXMgb3V0IG1pcGlfZGJpCnRvIGJlIGEgY29yZSBoZWxwZXIuCgpJdCBzcGxpdHMgc3RydWN0IG1p
cGlfZGJpIGludG8gYW4gaW50ZXJmYWNlIHBhcnQgYW5kIGEgZGlzcGxheSBwaXBlbGluZQpwYXJ0
ICh1cGxvYWQgZnJhbWVidWZmZXIgb3ZlciBTUEkpLiBJIGFsc28gdG9vayB0aGUgb3Bwb3J0dW5p
dHkgdG8KcmVuYW1lIHRoZSBhbWJpZ3VvdXMgJ21pcGknIHZhcmlhYmxlIG5hbWUgdG8gJ2RiaScu
IFRoaXMgbGluZXMgdXAgd2l0aAp0aGUgdXNlIG9mIHRoZSAnZHNpJyB2YXJpYWJsZSBuYW1lIGlu
IHRoZSBNSVBJIERTSSBoZWxwZXIuCgpOb3RlOgpUaGlzIGRlcGVuZHMgb24gc2VyaWVzOiBkcm0v
dGlueWRybTogUmVtb3ZlIHRpbnlkcm0ua28KClNlcmllcyBpcyBhbHNvIGF2YWlsYWJsZSBoZXJl
OgpodHRwczovL2dpdGh1Yi5jb20vbm90cm8vbGludXgvdHJlZS9tb3ZlX21pcGlfZGJpCgpOb3Jh
bGYuCgpOb3JhbGYgVHLDuG5uZXMgKDYpOgogIGRybS90aW55ZHJtL21pcGktZGJpOiBNb3ZlIGNt
ZGxvY2sgbXV0ZXggaW5pdAogIGRybS90aW55ZHJtOiBSZW5hbWUgdmFyaWFibGUgbWlwaSAtPiBk
YmkKICBkcm0vdGlueWRybTogUmVuYW1lIHJlbWFpbmluZyB2YXJpYWJsZSBtaXBpIC0+IGRiaWRl
dgogIGRybS90aW55ZHJtOiBTcGxpdCBzdHJ1Y3QgbWlwaV9kYmkgaW4gdHdvCiAgZHJtL3Rpbnlk
cm06IE1vdmUgbWlwaS1kYmkKICBNQUlOVEFJTkVSUzogUmVtb3ZlIHRpbnlkcm0gZW50cnkKCiBE
b2N1bWVudGF0aW9uL2dwdS9kcml2ZXJzLnJzdCAgICAgICAgICAgICAgICAgfCAgIDEgLQogRG9j
dW1lbnRhdGlvbi9ncHUvZHJtLWttcy1oZWxwZXJzLnJzdCAgICAgICAgIHwgIDEyICsKIERvY3Vt
ZW50YXRpb24vZ3B1L3Rpbnlkcm0ucnN0ICAgICAgICAgICAgICAgICB8ICAxOCAtCiBEb2N1bWVu
dGF0aW9uL2dwdS90b2RvLnJzdCAgICAgICAgICAgICAgICAgICAgfCAgMTMgLQogTUFJTlRBSU5F
UlMgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgIDEzICstCiBkcml2ZXJzL2dw
dS9kcm0vS2NvbmZpZyAgICAgICAgICAgICAgICAgICAgICAgfCAgIDQgKwogZHJpdmVycy9ncHUv
ZHJtL01ha2VmaWxlICAgICAgICAgICAgICAgICAgICAgIHwgICAxICsKIC4uLi97dGlueWRybS9t
aXBpLWRiaS5jID0+IGRybV9taXBpX2RiaS5jfSAgICB8IDMyNCArKysrKysrKystLS0tLS0tLS0K
IGRyaXZlcnMvZ3B1L2RybS90aW55ZHJtL0tjb25maWcgICAgICAgICAgICAgICB8ICAxNSArLQog
ZHJpdmVycy9ncHUvZHJtL3Rpbnlkcm0vTWFrZWZpbGUgICAgICAgICAgICAgIHwgICA0IC0KIGRy
aXZlcnMvZ3B1L2RybS90aW55ZHJtL2h4ODM1N2QuYyAgICAgICAgICAgICB8ICA2MSArKy0tCiBk
cml2ZXJzL2dwdS9kcm0vdGlueWRybS9pbGk5MjI1LmMgICAgICAgICAgICAgfCAxNzEgKysrKy0t
LS0tCiBkcml2ZXJzL2dwdS9kcm0vdGlueWRybS9pbGk5MzQxLmMgICAgICAgICAgICAgfCAgODMg
KystLS0KIGRyaXZlcnMvZ3B1L2RybS90aW55ZHJtL21pMDI4M3F0LmMgICAgICAgICAgICB8ICA4
OSArKy0tLQogZHJpdmVycy9ncHUvZHJtL3Rpbnlkcm0vc3Q3NTg2LmMgICAgICAgICAgICAgIHwg
MTA0ICsrKy0tLQogZHJpdmVycy9ncHUvZHJtL3Rpbnlkcm0vc3Q3NzM1ci5jICAgICAgICAgICAg
IHwgIDc3ICsrKy0tCiBpbmNsdWRlL2RybS9kcm1fbWlwaV9kYmkuaCAgICAgICAgICAgICAgICAg
ICAgfCAxODggKysrKysrKysrKwogaW5jbHVkZS9kcm0vdGlueWRybS9taXBpLWRiaS5oICAgICAg
ICAgICAgICAgIHwgMTM1IC0tLS0tLS0tCiAxOCBmaWxlcyBjaGFuZ2VkLCA2ODIgaW5zZXJ0aW9u
cygrKSwgNjMxIGRlbGV0aW9ucygtKQogZGVsZXRlIG1vZGUgMTAwNjQ0IERvY3VtZW50YXRpb24v
Z3B1L3Rpbnlkcm0ucnN0CiByZW5hbWUgZHJpdmVycy9ncHUvZHJtL3t0aW55ZHJtL21pcGktZGJp
LmMgPT4gZHJtX21pcGlfZGJpLmN9ICg3OCUpCiBjcmVhdGUgbW9kZSAxMDA2NDQgaW5jbHVkZS9k
cm0vZHJtX21pcGlfZGJpLmgKIGRlbGV0ZSBtb2RlIDEwMDY0NCBpbmNsdWRlL2RybS90aW55ZHJt
L21pcGktZGJpLmgKCi0tIAoyLjIwLjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2RyaS1kZXZlbA==
