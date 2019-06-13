Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 109EC435A5
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jun 2019 13:45:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B8C0F898F3;
	Thu, 13 Jun 2019 11:45:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5581A898F3
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jun 2019 11:45:51 +0000 (UTC)
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl
 [83.86.89.107])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id AFF6C21743;
 Thu, 13 Jun 2019 11:45:50 +0000 (UTC)
Date: Thu, 13 Jun 2019 13:45:48 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Eric Anholt <eric@anholt.net>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH] vc4: no need to check return value of debugfs_create functions
Message-ID: <20190613114548.GC13119@kroah.com>
MIME-Version: 1.0
Content-Disposition: inline
User-Agent: Mutt/1.12.0 (2019-05-25)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1560426351;
 bh=bJj5TbmhC39rlbi0BMLD2Xac1J2uJRKRW9IBJJ2pdbY=;
 h=Date:From:To:Cc:Subject:From;
 b=2c1HFqHReKK21fTTKC9C+5V+8UiFy8GRLSLVey7PB/6GPHw2TS3PZ/LKF63eEerQ7
 zsKUYTBoI+R7rBp+rME/KZn8u+rGpFd9Ikgicc4oRAOypWTbbBaXcYBbrl++aQwmZH
 FkZ7docM0qiSpD6j9iLEFbU3XCb2vWvx791zcWlQ=
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
Cc: dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

V2hlbiBjYWxsaW5nIGRlYnVnZnMgZnVuY3Rpb25zLCB0aGVyZSBpcyBubyBuZWVkIHRvIGV2ZXIg
Y2hlY2sgdGhlCnJldHVybiB2YWx1ZS4gIFRoZSBmdW5jdGlvbiBjYW4gd29yayBvciBub3QsIGJ1
dCB0aGUgY29kZSBsb2dpYyBzaG91bGQKbmV2ZXIgZG8gc29tZXRoaW5nIGRpZmZlcmVudCBiYXNl
ZCBvbiB0aGlzLgoKQ2M6IEVyaWMgQW5ob2x0IDxlcmljQGFuaG9sdC5uZXQ+CkNjOiBEYXZpZCBB
aXJsaWUgPGFpcmxpZWRAbGludXguaWU+CkNjOiBEYW5pZWwgVmV0dGVyIDxkYW5pZWxAZmZ3bGwu
Y2g+CkNjOiBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnClNpZ25lZC1vZmYtYnk6IEdy
ZWcgS3JvYWgtSGFydG1hbiA8Z3JlZ2toQGxpbnV4Zm91bmRhdGlvbi5vcmc+Ci0tLQogZHJpdmVy
cy9ncHUvZHJtL3ZjNC92YzRfZGVidWdmcy5jIHwgOCArKy0tLS0tLQogMSBmaWxlIGNoYW5nZWQs
IDIgaW5zZXJ0aW9ucygrKSwgNiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dw
dS9kcm0vdmM0L3ZjNF9kZWJ1Z2ZzLmMgYi9kcml2ZXJzL2dwdS9kcm0vdmM0L3ZjNF9kZWJ1Z2Zz
LmMKaW5kZXggZjlkZWMwODI2N2RjLi5mOWI0NjkxMWZhNTAgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMv
Z3B1L2RybS92YzQvdmM0X2RlYnVnZnMuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vdmM0L3ZjNF9k
ZWJ1Z2ZzLmMKQEAgLTI5LDEzICsyOSw5IEBAIHZjNF9kZWJ1Z2ZzX2luaXQoc3RydWN0IGRybV9t
aW5vciAqbWlub3IpCiB7CiAJc3RydWN0IHZjNF9kZXYgKnZjNCA9IHRvX3ZjNF9kZXYobWlub3It
PmRldik7CiAJc3RydWN0IHZjNF9kZWJ1Z2ZzX2luZm9fZW50cnkgKmVudHJ5OwotCXN0cnVjdCBk
ZW50cnkgKmRlbnRyeTsKIAotCWRlbnRyeSA9IGRlYnVnZnNfY3JlYXRlX2Jvb2woImh2c19sb2Fk
X3RyYWNrZXIiLCBTX0lSVUdPIHwgU19JV1VTUiwKLQkJCQkgICAgIG1pbm9yLT5kZWJ1Z2ZzX3Jv
b3QsCi0JCQkJICAgICAmdmM0LT5sb2FkX3RyYWNrZXJfZW5hYmxlZCk7Ci0JaWYgKCFkZW50cnkp
Ci0JCXJldHVybiAtRU5PTUVNOworCWRlYnVnZnNfY3JlYXRlX2Jvb2woImh2c19sb2FkX3RyYWNr
ZXIiLCBTX0lSVUdPIHwgU19JV1VTUiwKKwkJCSAgICBtaW5vci0+ZGVidWdmc19yb290LCAmdmM0
LT5sb2FkX3RyYWNrZXJfZW5hYmxlZCk7CiAKIAlsaXN0X2Zvcl9lYWNoX2VudHJ5KGVudHJ5LCAm
dmM0LT5kZWJ1Z2ZzX2xpc3QsIGxpbmspIHsKIAkJaW50IHJldCA9IGRybV9kZWJ1Z2ZzX2NyZWF0
ZV9maWxlcygmZW50cnktPmluZm8sIDEsCi0tIAoyLjIyLjAKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRl
dmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
