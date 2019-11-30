Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CD84E10DDFC
	for <lists+dri-devel@lfdr.de>; Sat, 30 Nov 2019 16:10:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 442E66E14A;
	Sat, 30 Nov 2019 15:10:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E60B06E14A
 for <dri-devel@lists.freedesktop.org>; Sat, 30 Nov 2019 15:10:00 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2005)
 id 5AE2668BE1; Sat, 30 Nov 2019 16:09:58 +0100 (CET)
From: Torsten Duwe <duwe@lst.de>
To: Andrzej Hajda <a.hajda@samsung.com>,
 Neil Armstrong <narmstrong@baylibre.com>, 
 Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH] drm/bridge: analogix-anx6345: Avoid duplicate -supply suffix
Message-Id: <20191130150958.5AE2668BE1@verein.lst.de>
Date: Sat, 30 Nov 2019 16:09:58 +0100 (CET)
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
Cc: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 dri-devel@lists.freedesktop.org
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

b2ZfZ2V0X3JlZ3VsYXRvcigpIHdpbGwgdW5jb25kaXRpb25hbGx5IGFkZCAiLXN1cHBseSIgdG8g
Zm9ybSB0aGUKcHJvcGVydHkgbmFtZS4gVGhpcyBpcyBkb2N1bWVudGVkIGluIGNvbW1pdCA2OTUx
MWE0NTJlNmRjICgibWFwIGNvbnN1bWVyCnJlZ3VsYXRvciBiYXNlZCBvbiBkZXZpY2UgdHJlZSIp
LgoKU2lnbmVkLW9mZi1ieTogVG9yc3RlbiBEdXdlIDxkdXdlQHN1c2UuZGU+Ci0tLQpJTUhPIHRo
YXQgY29tbWl0IG1lc3NhZ2Ugc2hvdWxkIGhhdmUgZW5kZWQgdXAgc29tZXdoZXJlIHVuZGVyIERv
Y3VtZW50YXRpb24vLgoKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9hbmFsb2dpeC9hbmFs
b2dpeC1hbng2MzQ1LmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9hbmFsb2dpeC9hbmFs
b2dpeC1hbng2MzQ1LmMKQEAgLTcxMiwxNCArNzA5LDE0IEBAIHN0YXRpYyBpbnQgYW54NjM0NV9p
MmNfcHJvYmUoc3RydWN0IGkyY19jbGllbnQgKmNsaWVudCwKIAkJRFJNX0RFQlVHKCJObyBwYW5l
bCBmb3VuZFxuIik7CiAKIAkvKiAxLjJWIGRpZ2l0YWwgY29yZSBwb3dlciByZWd1bGF0b3IgICov
Ci0JYW54NjM0NS0+ZHZkZDEyID0gZGV2bV9yZWd1bGF0b3JfZ2V0KGRldiwgImR2ZGQxMi1zdXBw
bHkiKTsKKwlhbng2MzQ1LT5kdmRkMTIgPSBkZXZtX3JlZ3VsYXRvcl9nZXQoZGV2LCAiZHZkZDEy
Iik7CiAJaWYgKElTX0VSUihhbng2MzQ1LT5kdmRkMTIpKSB7CiAJCURSTV9FUlJPUigiZHZkZDEy
LXN1cHBseSBub3QgZm91bmRcbiIpOwogCQlyZXR1cm4gUFRSX0VSUihhbng2MzQ1LT5kdmRkMTIp
OwogCX0KIAogCS8qIDIuNVYgZGlnaXRhbCBjb3JlIHBvd2VyIHJlZ3VsYXRvciAgKi8KLQlhbng2
MzQ1LT5kdmRkMjUgPSBkZXZtX3JlZ3VsYXRvcl9nZXQoZGV2LCAiZHZkZDI1LXN1cHBseSIpOwor
CWFueDYzNDUtPmR2ZGQyNSA9IGRldm1fcmVndWxhdG9yX2dldChkZXYsICJkdmRkMjUiKTsKIAlp
ZiAoSVNfRVJSKGFueDYzNDUtPmR2ZGQyNSkpIHsKIAkJRFJNX0VSUk9SKCJkdmRkMjUtc3VwcGx5
IG5vdCBmb3VuZFxuIik7CiAJCXJldHVybiBQVFJfRVJSKGFueDYzNDUtPmR2ZGQyNSk7Cl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWls
aW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
