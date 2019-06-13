Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 648D2435B5
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jun 2019 13:57:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 36E0C89948;
	Thu, 13 Jun 2019 11:57:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E3F9889948
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jun 2019 11:57:20 +0000 (UTC)
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl
 [83.86.89.107])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 1F29520B7C;
 Thu, 13 Jun 2019 11:57:19 +0000 (UTC)
Date: Thu, 13 Jun 2019 13:57:17 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Guido =?iso-8859-1?Q?G=FCnther?= <agx@sigxcpu.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH] panel: rocktech: no need to check return value of
 debugfs_create functions
Message-ID: <20190613115717.GB26335@kroah.com>
MIME-Version: 1.0
Content-Disposition: inline
User-Agent: Mutt/1.12.0 (2019-05-25)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1560427040;
 bh=RYMLI/GRMDQpkxofcUstHAKbEUsRroxDvV+9fwcculU=;
 h=Date:From:To:Cc:Subject:From;
 b=RTafJ8XYnJ1y7+IcGYTHcZ/JCfdyjNbBnngLSU86RFqRZtJNndXropO4aeTzkL9eA
 hl0pbIyrpAd80pfUAA+okrhpfzcRBATGIPOFzLrNoLsbV6qpgWpOAzRggJFCmxTEE/
 mbm1AnOioj+kCXL0dXVFC5F8AP+a1GTpgdnNZN6w=
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
ZCBvbiB0aGlzLgoKQ2M6ICJHdWlkbyBHw7xudGhlciIgPGFneEBzaWd4Y3B1Lm9yZz4KQ2M6IFRo
aWVycnkgUmVkaW5nIDx0aGllcnJ5LnJlZGluZ0BnbWFpbC5jb20+CkNjOiBEYXZpZCBBaXJsaWUg
PGFpcmxpZWRAbGludXguaWU+CkNjOiBEYW5pZWwgVmV0dGVyIDxkYW5pZWxAZmZ3bGwuY2g+CkNj
OiBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnClNpZ25lZC1vZmYtYnk6IEdyZWcgS3Jv
YWgtSGFydG1hbiA8Z3JlZ2toQGxpbnV4Zm91bmRhdGlvbi5vcmc+Ci0tLQogZHJpdmVycy9ncHUv
ZHJtL3BhbmVsL3BhbmVsLXJvY2t0ZWNoLWpoMDU3bjAwOTAwLmMgfCAxNCArKystLS0tLS0tLS0t
LQogMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgMTEgZGVsZXRpb25zKC0pCgpkaWZm
IC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3BhbmVsL3BhbmVsLXJvY2t0ZWNoLWpoMDU3bjAwOTAw
LmMgYi9kcml2ZXJzL2dwdS9kcm0vcGFuZWwvcGFuZWwtcm9ja3RlY2gtamgwNTduMDA5MDAuYwpp
bmRleCBkODhlYThkYTJlYzIuLjZkY2I2OTJjNDcwMSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUv
ZHJtL3BhbmVsL3BhbmVsLXJvY2t0ZWNoLWpoMDU3bjAwOTAwLmMKKysrIGIvZHJpdmVycy9ncHUv
ZHJtL3BhbmVsL3BhbmVsLXJvY2t0ZWNoLWpoMDU3bjAwOTAwLmMKQEAgLTI1NywyMCArMjU3LDEy
IEBAIHN0YXRpYyBpbnQgYWxscGl4ZWxzb25fc2V0KHZvaWQgKmRhdGEsIHU2NCB2YWwpCiBERUZJ
TkVfU0lNUExFX0FUVFJJQlVURShhbGxwaXhlbHNvbl9mb3BzLCBOVUxMLAogCQkJYWxscGl4ZWxz
b25fc2V0LCAiJWxsdVxuIik7CiAKLXN0YXRpYyBpbnQgamgwNTduX2RlYnVnZnNfaW5pdChzdHJ1
Y3QgamgwNTduICpjdHgpCitzdGF0aWMgdm9pZCBqaDA1N25fZGVidWdmc19pbml0KHN0cnVjdCBq
aDA1N24gKmN0eCkKIHsKLQlzdHJ1Y3QgZGVudHJ5ICpmOwotCiAJY3R4LT5kZWJ1Z2ZzID0gZGVi
dWdmc19jcmVhdGVfZGlyKERSVl9OQU1FLCBOVUxMKTsKLQlpZiAoIWN0eC0+ZGVidWdmcykKLQkJ
cmV0dXJuIC1FTk9NRU07CiAKLQlmID0gZGVidWdmc19jcmVhdGVfZmlsZSgiYWxscGl4ZWxzb24i
LCAwNjAwLAotCQkJCWN0eC0+ZGVidWdmcywgY3R4LCAmYWxscGl4ZWxzb25fZm9wcyk7Ci0JaWYg
KCFmKQotCQlyZXR1cm4gLUVOT01FTTsKLQotCXJldHVybiAwOworCWRlYnVnZnNfY3JlYXRlX2Zp
bGUoImFsbHBpeGVsc29uIiwgMDYwMCwgY3R4LT5kZWJ1Z2ZzLCBjdHgsCisJCQkgICAgJmFsbHBp
eGVsc29uX2ZvcHMpOwogfQogCiBzdGF0aWMgdm9pZCBqaDA1N25fZGVidWdmc19yZW1vdmUoc3Ry
dWN0IGpoMDU3biAqY3R4KQotLSAKMi4yMi4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0
cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9kcmktZGV2ZWw=
