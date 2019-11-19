Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 29E6010302F
	for <lists+dri-devel@lfdr.de>; Wed, 20 Nov 2019 00:28:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC27B6EA02;
	Tue, 19 Nov 2019 23:28:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from crapouillou.net (outils.crapouillou.net [89.234.176.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 546866E060
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Nov 2019 14:28:27 +0000 (UTC)
From: Paul Cercueil <paul@crapouillou.net>
To: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Subject: [PATCH 4/6] gpu/drm: ingenic: Set max FB height to 4095
Date: Tue, 19 Nov 2019 15:17:34 +0100
Message-Id: <20191119141736.74607-4-paul@crapouillou.net>
In-Reply-To: <20191119141736.74607-1-paul@crapouillou.net>
References: <20191119141736.74607-1-paul@crapouillou.net>
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 19 Nov 2019 23:28:08 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=crapouillou.net; 
 s=mail; t=1574173068; h=from:from:sender:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lS0qFBgl79iuxPDFWYwXScfrOwedGbj4vsV2qHZDSxg=;
 b=Z1zI9pb0KDCuJybGPqtTCq80m+qXo8wLSfwdOkPL7on/ytgELUjeAMf3Yej7Q5PJztwb9B
 4IkL+G00Y/MMz4lzi58qo72J8XKvVc/+tqY4RUeXj9U1ZvQwcbWbkrFkbMphS6FwRZiFHX
 4C5cAxoSUc7xgsVEAdrh1KvOpvjSFes=
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
Cc: Paul Cercueil <paul@crapouillou.net>, devicetree@vger.kernel.org,
 od@zcrc.me, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

V2hpbGUgdGhlIExDRCBjb250cm9sbGVyIGNhbiBlZmZlY3RpdmVseSBvbmx5IHN1cHBvcnQgYSBt
YXhpbXVtCnJlc29sdXRpb24gb2YgODAweDYwMCwgdGhlIGZyYW1lYnVmZmVyJ3MgaGVpZ2h0IGNh
biBiZSBtdWNoIGhpZ2hlciwKc2luY2Ugd2UgY2FuIGNoYW5nZSB0aGUgWSBzdGFydCBvZmZzZXQu
CgpTaWduZWQtb2ZmLWJ5OiBQYXVsIENlcmN1ZWlsIDxwYXVsQGNyYXBvdWlsbG91Lm5ldD4KLS0t
CiBkcml2ZXJzL2dwdS9kcm0vaW5nZW5pYy9pbmdlbmljLWRybS5jIHwgMiArLQogMSBmaWxlIGNo
YW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVy
cy9ncHUvZHJtL2luZ2VuaWMvaW5nZW5pYy1kcm0uYyBiL2RyaXZlcnMvZ3B1L2RybS9pbmdlbmlj
L2luZ2VuaWMtZHJtLmMKaW5kZXggN2ExNzIyNzFiZDYzLi40NTM4YjA4MWIwYzUgMTAwNjQ0Ci0t
LSBhL2RyaXZlcnMvZ3B1L2RybS9pbmdlbmljL2luZ2VuaWMtZHJtLmMKKysrIGIvZHJpdmVycy9n
cHUvZHJtL2luZ2VuaWMvaW5nZW5pYy1kcm0uYwpAQCAtNjM1LDcgKzYzNSw3IEBAIHN0YXRpYyBp
bnQgaW5nZW5pY19kcm1fcHJvYmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikKIAlkcm0t
Pm1vZGVfY29uZmlnLm1pbl93aWR0aCA9IDA7CiAJZHJtLT5tb2RlX2NvbmZpZy5taW5faGVpZ2h0
ID0gMDsKIAlkcm0tPm1vZGVfY29uZmlnLm1heF93aWR0aCA9IDgwMDsKLQlkcm0tPm1vZGVfY29u
ZmlnLm1heF9oZWlnaHQgPSA2MDA7CisJZHJtLT5tb2RlX2NvbmZpZy5tYXhfaGVpZ2h0ID0gNDA5
NTsKIAlkcm0tPm1vZGVfY29uZmlnLmZ1bmNzID0gJmluZ2VuaWNfZHJtX21vZGVfY29uZmlnX2Z1
bmNzOwogCiAJYmFzZSA9IGRldm1fcGxhdGZvcm1faW9yZW1hcF9yZXNvdXJjZShwZGV2LCAwKTsK
LS0gCjIuMjQuMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
Cmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
