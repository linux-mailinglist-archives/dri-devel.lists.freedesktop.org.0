Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A27C36FE02
	for <lists+dri-devel@lfdr.de>; Mon, 22 Jul 2019 12:43:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 930F689C14;
	Mon, 22 Jul 2019 10:43:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.domeneshop.no (smtp.domeneshop.no
 [IPv6:2a01:5b40:0:3005::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1035689BCD
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Jul 2019 10:43:27 +0000 (UTC)
Received: from 211.81-166-168.customer.lyse.net ([81.166.168.211]:55388
 helo=localhost.localdomain)
 by smtp.domeneshop.no with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_CBC_SHA1:128)
 (Exim 4.84_2) (envelope-from <noralf@tronnes.org>)
 id 1hpVmv-0001lD-Ak; Mon, 22 Jul 2019 12:43:25 +0200
From: =?UTF-8?q?Noralf=20Tr=C3=B8nnes?= <noralf@tronnes.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 5/9] drm/tinydrm/mipi-dbi: Remove CMA helper dependency
Date: Mon, 22 Jul 2019 12:43:08 +0200
Message-Id: <20190722104312.16184-6-noralf@tronnes.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190722104312.16184-1-noralf@tronnes.org>
References: <20190722104312.16184-1-noralf@tronnes.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; d=tronnes.org; s=ds201810; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From;
 bh=u3GkT1hSVcAAIegIRZpj+CUAFZC/g7X8qY/+K+kOBkk=; 
 b=iCZdfxMKJtgJWelbZIkcP2wShOHTpSliEvJNv7u5UM4ObbHlXOR/1ngeeFI+E4cOXmBh9MZRAnenpzsX+reu4J1hKCpNwj7ISaSKYJ7c9rhK/S8D+1FS2cGpe1kay9jm3VzshCv6aaK2Fghw5gTkIuSG0OvUbCdFPI2qbFmQCpaI2NTWICmqOaoaHa8EzUQp/3QX2PcKFeHmSPbTJSnIUKRYa9AChvbMFMpwZi92RYFTVLUIlYLBB72U5cjEn0eGlMZiuX06Vin49l/rw04FJko8Jpn5Pa8nBYHAf4ktpuCx2x2/FIaihWzqFiLmLdX7tX13wAnIXQxaoro0FrtIMg==;
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
Cc: sam@ravnborg.org, david@lechnology.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

bWlwaS1kYmkgZGVwZW5kcyBvbiB0aGUgQ01BIGhlbHBlciB0aHJvdWdoIGl0J3MgdXNlIG9mCmRy
bV9mYl9jbWFfZ2V0X2dlbV9vYmooKS4gVGhpcyBpcyBhbiB1bm5lY2Vzc2FyeSBkZXBlbmRlbmN5
IHRvIGRyYWcgaW4gZm9yCmRyaXZlcnMgdGhhdCBvbmx5IHdhbnQgdG8gdXNlIHRoZSBNSVBJIERC
SSBpbnRlcmZhY2UgcGFydC4KQXZvaWQgdGhpcyBieSBvcGVuIGNvZGluZyB0aGUgZnVuY3Rpb24u
CgpTaWduZWQtb2ZmLWJ5OiBOb3JhbGYgVHLDuG5uZXMgPG5vcmFsZkB0cm9ubmVzLm9yZz4KLS0t
CiBkcml2ZXJzL2dwdS9kcm0vdGlueWRybS9taXBpLWRiaS5jIHwgOSArKysrKy0tLS0KIDEgZmls
ZSBjaGFuZ2VkLCA1IGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9ncHUvZHJtL3Rpbnlkcm0vbWlwaS1kYmkuYyBiL2RyaXZlcnMvZ3B1L2RybS90aW55
ZHJtL21pcGktZGJpLmMKaW5kZXggMTYxNzc4NGZlZjA5Li5kNmYzNDA2YTQwNzUgMTAwNjQ0Ci0t
LSBhL2RyaXZlcnMvZ3B1L2RybS90aW55ZHJtL21pcGktZGJpLmMKKysrIGIvZHJpdmVycy9ncHUv
ZHJtL3Rpbnlkcm0vbWlwaS1kYmkuYwpAQCAtMTYsNyArMTYsNiBAQAogI2luY2x1ZGUgPGRybS9k
cm1fY29ubmVjdG9yLmg+CiAjaW5jbHVkZSA8ZHJtL2RybV9kYW1hZ2VfaGVscGVyLmg+CiAjaW5j
bHVkZSA8ZHJtL2RybV9kcnYuaD4KLSNpbmNsdWRlIDxkcm0vZHJtX2ZiX2NtYV9oZWxwZXIuaD4K
ICNpbmNsdWRlIDxkcm0vZHJtX2dlbV9jbWFfaGVscGVyLmg+CiAjaW5jbHVkZSA8ZHJtL2RybV9m
b3JtYXRfaGVscGVyLmg+CiAjaW5jbHVkZSA8ZHJtL2RybV9mb3VyY2MuaD4KQEAgLTIwMSw4ICsy
MDAsOSBAQCBFWFBPUlRfU1lNQk9MKG1pcGlfZGJpX2NvbW1hbmRfc3RhY2tidWYpOwogaW50IG1p
cGlfZGJpX2J1Zl9jb3B5KHZvaWQgKmRzdCwgc3RydWN0IGRybV9mcmFtZWJ1ZmZlciAqZmIsCiAJ
CSAgICAgIHN0cnVjdCBkcm1fcmVjdCAqY2xpcCwgYm9vbCBzd2FwKQogewotCXN0cnVjdCBkcm1f
Z2VtX2NtYV9vYmplY3QgKmNtYV9vYmogPSBkcm1fZmJfY21hX2dldF9nZW1fb2JqKGZiLCAwKTsK
LQlzdHJ1Y3QgZG1hX2J1Zl9hdHRhY2htZW50ICppbXBvcnRfYXR0YWNoID0gY21hX29iai0+YmFz
ZS5pbXBvcnRfYXR0YWNoOworCXN0cnVjdCBkcm1fZ2VtX29iamVjdCAqZ2VtID0gZHJtX2dlbV9m
Yl9nZXRfb2JqKGZiLCAwKTsKKwlzdHJ1Y3QgZHJtX2dlbV9jbWFfb2JqZWN0ICpjbWFfb2JqID0g
dG9fZHJtX2dlbV9jbWFfb2JqKGdlbSk7CisJc3RydWN0IGRtYV9idWZfYXR0YWNobWVudCAqaW1w
b3J0X2F0dGFjaCA9IGdlbS0+aW1wb3J0X2F0dGFjaDsKIAlzdHJ1Y3QgZHJtX2Zvcm1hdF9uYW1l
X2J1ZiBmb3JtYXRfbmFtZTsKIAl2b2lkICpzcmMgPSBjbWFfb2JqLT52YWRkcjsKIAlpbnQgcmV0
ID0gMDsKQEAgLTI0MCw3ICsyNDAsOCBAQCBFWFBPUlRfU1lNQk9MKG1pcGlfZGJpX2J1Zl9jb3B5
KTsKIAogc3RhdGljIHZvaWQgbWlwaV9kYmlfZmJfZGlydHkoc3RydWN0IGRybV9mcmFtZWJ1ZmZl
ciAqZmIsIHN0cnVjdCBkcm1fcmVjdCAqcmVjdCkKIHsKLQlzdHJ1Y3QgZHJtX2dlbV9jbWFfb2Jq
ZWN0ICpjbWFfb2JqID0gZHJtX2ZiX2NtYV9nZXRfZ2VtX29iaihmYiwgMCk7CisJc3RydWN0IGRy
bV9nZW1fb2JqZWN0ICpnZW0gPSBkcm1fZ2VtX2ZiX2dldF9vYmooZmIsIDApOworCXN0cnVjdCBk
cm1fZ2VtX2NtYV9vYmplY3QgKmNtYV9vYmogPSB0b19kcm1fZ2VtX2NtYV9vYmooZ2VtKTsKIAlz
dHJ1Y3QgbWlwaV9kYmlfZGV2ICpkYmlkZXYgPSBkcm1fdG9fbWlwaV9kYmlfZGV2KGZiLT5kZXYp
OwogCXVuc2lnbmVkIGludCBoZWlnaHQgPSByZWN0LT55MiAtIHJlY3QtPnkxOwogCXVuc2lnbmVk
IGludCB3aWR0aCA9IHJlY3QtPngyIC0gcmVjdC0+eDE7Ci0tIAoyLjIwLjEKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxp
c3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNr
dG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
