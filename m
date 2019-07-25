Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C225474C31
	for <lists+dri-devel@lfdr.de>; Thu, 25 Jul 2019 12:51:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A52F6E6F1;
	Thu, 25 Jul 2019 10:51:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.domeneshop.no (smtp.domeneshop.no
 [IPv6:2a01:5b40:0:3005::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 272F66E6EC
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Jul 2019 10:51:43 +0000 (UTC)
Received: from 211.81-166-168.customer.lyse.net ([81.166.168.211]:13951
 helo=localhost.localdomain)
 by smtp.domeneshop.no with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_CBC_SHA1:128)
 (Exim 4.84_2) (envelope-from <noralf@tronnes.org>)
 id 1hqbLZ-0002ww-4l; Thu, 25 Jul 2019 12:51:41 +0200
From: =?UTF-8?q?Noralf=20Tr=C3=B8nnes?= <noralf@tronnes.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 0/3] drm/tinydrm: Rename to drm/tiny
Date: Thu, 25 Jul 2019 12:51:29 +0200
Message-Id: <20190725105132.22545-1-noralf@tronnes.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; d=tronnes.org; s=ds201810; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:Cc:To:From;
 bh=WodV9GdOjmpaCmfxUO5mfQytbbEIeIMTTFbFbLFgbu0=; 
 b=Cr026y7pnJImmIOZTLjxhhmm+wkL5Fp/46+hH5AWYbazdQfMm1FOc+4r7RbXGjw5owWnWRWm/XSUyvG4eBPgpqk2DzE8mC10hQLmwooDce5jVguMOOML1iuAhRp8CyDOY9Vk9kljoqcd/nG7QdWY1ZXhXMwHoXgnYfo1ZRmhgszLyND01+MuR/ENKsO51jB9dnZDFxqyYQv4fgQWTmnRDFle0RO/TFZZ3X6XgvlVUD99hNwycqkXxTPw59cazPRLV1VrAxPFJxL+ZKlANwbRCfp7SMcT288bm/ARGFPh+09VEGrQ5QAQqwbaeIGpdvUjxZs/n+gMKdVjdrc7t0wFTw==;
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
Cc: daniel.vetter@ffwll.ch, sam@ravnborg.org, hdegoede@redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhpcyBpcyB0aGUgZmluYWwgcG9saXNoIG9uIHRpbnlkcm0gdHVybmluZyBpdCBpbnRvIF90aGVf
IHBsYWNlIGZvciB0aW55CkRSTSBkcml2ZXJzLgoKTm9yYWxmLgoKTm9yYWxmIFRyw7hubmVzICgz
KToKICBkcm0vdGlueWRybS9LY29uZmlnOiBSZW1vdmUgbWVudWNvbmZpZyBEUk1fVElOWURSTQog
IGRybS90aW55ZHJtOiBSZW5hbWUgZm9sZGVyIHRvIHRpbnkKICBkcm0vZ20xMnUzMjA6IE1vdmUg
ZHJpdmVyIHRvIGRybS90aW55CgogTUFJTlRBSU5FUlMgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIHwgMTQgKysrLS0tLQogZHJpdmVycy9ncHUvZHJtL0tjb25maWcgICAgICAgICAg
ICAgICAgICAgICAgIHwgIDQgKy0KIGRyaXZlcnMvZ3B1L2RybS9NYWtlZmlsZSAgICAgICAgICAg
ICAgICAgICAgICB8ICAzICstCiBkcml2ZXJzL2dwdS9kcm0vZ20xMnUzMjAvS2NvbmZpZyAgICAg
ICAgICAgICAgfCAgOSAtLS0tCiBkcml2ZXJzL2dwdS9kcm0vZ20xMnUzMjAvTWFrZWZpbGUgICAg
ICAgICAgICAgfCAgMiAtCiBkcml2ZXJzL2dwdS9kcm0ve3Rpbnlkcm0gPT4gdGlueX0vS2NvbmZp
ZyAgICAgfCA0MSArKysrKysrKysrKysrLS0tLS0tCiBkcml2ZXJzL2dwdS9kcm0ve3Rpbnlkcm0g
PT4gdGlueX0vTWFrZWZpbGUgICAgfCAgMSArCiBkcml2ZXJzL2dwdS9kcm0ve2dtMTJ1MzIwID0+
IHRpbnl9L2dtMTJ1MzIwLmMgfCAgMAogZHJpdmVycy9ncHUvZHJtL3t0aW55ZHJtID0+IHRpbnl9
L2h4ODM1N2QuYyAgIHwgIDAKIGRyaXZlcnMvZ3B1L2RybS97dGlueWRybSA9PiB0aW55fS9pbGk5
MjI1LmMgICB8ICAwCiBkcml2ZXJzL2dwdS9kcm0ve3Rpbnlkcm0gPT4gdGlueX0vaWxpOTM0MS5j
ICAgfCAgMAogZHJpdmVycy9ncHUvZHJtL3t0aW55ZHJtID0+IHRpbnl9L21pMDI4M3F0LmMgIHwg
IDAKIGRyaXZlcnMvZ3B1L2RybS97dGlueWRybSA9PiB0aW55fS9yZXBhcGVyLmMgICB8ICAwCiBk
cml2ZXJzL2dwdS9kcm0ve3Rpbnlkcm0gPT4gdGlueX0vc3Q3NTg2LmMgICAgfCAgMAogZHJpdmVy
cy9ncHUvZHJtL3t0aW55ZHJtID0+IHRpbnl9L3N0NzczNXIuYyAgIHwgIDAKIDE1IGZpbGVzIGNo
YW5nZWQsIDM4IGluc2VydGlvbnMoKyksIDM2IGRlbGV0aW9ucygtKQogZGVsZXRlIG1vZGUgMTAw
NjQ0IGRyaXZlcnMvZ3B1L2RybS9nbTEydTMyMC9LY29uZmlnCiBkZWxldGUgbW9kZSAxMDA2NDQg
ZHJpdmVycy9ncHUvZHJtL2dtMTJ1MzIwL01ha2VmaWxlCiByZW5hbWUgZHJpdmVycy9ncHUvZHJt
L3t0aW55ZHJtID0+IHRpbnl9L0tjb25maWcgKDczJSkKIHJlbmFtZSBkcml2ZXJzL2dwdS9kcm0v
e3Rpbnlkcm0gPT4gdGlueX0vTWFrZWZpbGUgKDg5JSkKIHJlbmFtZSBkcml2ZXJzL2dwdS9kcm0v
e2dtMTJ1MzIwID0+IHRpbnl9L2dtMTJ1MzIwLmMgKDEwMCUpCiByZW5hbWUgZHJpdmVycy9ncHUv
ZHJtL3t0aW55ZHJtID0+IHRpbnl9L2h4ODM1N2QuYyAoMTAwJSkKIHJlbmFtZSBkcml2ZXJzL2dw
dS9kcm0ve3Rpbnlkcm0gPT4gdGlueX0vaWxpOTIyNS5jICgxMDAlKQogcmVuYW1lIGRyaXZlcnMv
Z3B1L2RybS97dGlueWRybSA9PiB0aW55fS9pbGk5MzQxLmMgKDEwMCUpCiByZW5hbWUgZHJpdmVy
cy9ncHUvZHJtL3t0aW55ZHJtID0+IHRpbnl9L21pMDI4M3F0LmMgKDEwMCUpCiByZW5hbWUgZHJp
dmVycy9ncHUvZHJtL3t0aW55ZHJtID0+IHRpbnl9L3JlcGFwZXIuYyAoMTAwJSkKIHJlbmFtZSBk
cml2ZXJzL2dwdS9kcm0ve3Rpbnlkcm0gPT4gdGlueX0vc3Q3NTg2LmMgKDEwMCUpCiByZW5hbWUg
ZHJpdmVycy9ncHUvZHJtL3t0aW55ZHJtID0+IHRpbnl9L3N0NzczNXIuYyAoMTAwJSkKCi0tIAoy
LjIwLjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRy
aS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRw
czovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
