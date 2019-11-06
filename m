Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BEAF7F1BEF
	for <lists+dri-devel@lfdr.de>; Wed,  6 Nov 2019 18:01:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 187426EDEE;
	Wed,  6 Nov 2019 17:01:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mo6-p01-ob.smtp.rzone.de (mo6-p01-ob.smtp.rzone.de
 [IPv6:2a01:238:20a:202:5301::9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B1D86E277
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Nov 2019 17:01:09 +0000 (UTC)
X-RZG-AUTH: ":P3gBZUipdd93FF5ZZvYFPugejmSTVR2nRPhVORvLd4SsytBXQrEOHTIXs8PvtBNfIQ=="
X-RZG-CLASS-ID: mo00
Received: from localhost.localdomain by smtp.strato.de (RZmta 44.29.0 AUTH)
 with ESMTPSA id e07688vA6H14hLt
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (curve secp521r1 with
 521 ECDH bits, eq. 15360 bits RSA))
 (Client did not present a certificate);
 Wed, 6 Nov 2019 18:01:04 +0100 (CET)
From: Stephan Gerhold <stephan@gerhold.net>
To: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH 3/7] drm/mcde: dsi: Make video mode errors more verbose
Date: Wed,  6 Nov 2019 17:58:31 +0100
Message-Id: <20191106165835.2863-4-stephan@gerhold.net>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191106165835.2863-1-stephan@gerhold.net>
References: <20191106165835.2863-1-stephan@gerhold.net>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 t=1573059667; 
 s=strato-dkim-0002; d=gerhold.net;
 h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
 X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
 bh=ZF9PBe9PbqZZmxK16qT8PcTXHq8abB445im8/YC08sA=;
 b=ssVTvE6GtVl9LTjQre8f9cV82McHD7bH1Y+/oG9acYmkrBf+bXk1CAHXvzX/p4d4Tq
 FAYKmShih0Dx/C6QVOKpQ1wYnvr/4uWUHW1CE+RrhpfVC5cw6/Yi4tCVNqI5LMgH3ygd
 BQHhxATAxM91tlFkCCN5OB+brJfBg8mItXD0fV/gBuDIuWJvtCCmZPShSTPVcadJ6vvh
 k+fuxY6BWJty1KxRSwzs/z/WvKTNKhGg8osD0564+6Be6GP+iLFQ/1xw6j4GmLgjr/oV
 UDN7G9NdUtfeGntfqjUkiL4d7AaPb4RNvt9ADn+RN32N41VbwJ68oPXCO3m3JTtop4PB
 mjkg==
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
Cc: David Airlie <airlied@linux.ie>, Stephan Gerhold <stephan@gerhold.net>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VHJpZ2dlcmluZyBhbiBlcnJvciBjb25kaXRpb25zIGluIERTSSB2aWRlbyBtb2RlIG9ubHkgcmVz
dWx0cyBpbgphIHZlcnkgZ2VuZXJpYyAic29tZSB2aWRlbyBtb2RlIGVycm9yIHN0YXR1cyIgZXJy
b3IgbWVzc2FnZQphdCB0aGUgbW9tZW50LgoKTWFrZSB0aGlzIG1vcmUgY2xlYXIgYnkgYWRkaW5n
IHNlcGFyYXRlIGVycm9yIG1lc3NhZ2VzIGZvciBlYWNoIGJpdC4KClNpZ25lZC1vZmYtYnk6IFN0
ZXBoYW4gR2VyaG9sZCA8c3RlcGhhbkBnZXJob2xkLm5ldD4KLS0tCiBkcml2ZXJzL2dwdS9kcm0v
bWNkZS9tY2RlX2RzaS5jICAgICAgfCAyMiArKysrKysrKysrKysrKysrKysrKystCiBkcml2ZXJz
L2dwdS9kcm0vbWNkZS9tY2RlX2RzaV9yZWdzLmggfCAxMCArKysrKysrKysrCiAyIGZpbGVzIGNo
YW5nZWQsIDMxIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9kcml2
ZXJzL2dwdS9kcm0vbWNkZS9tY2RlX2RzaS5jIGIvZHJpdmVycy9ncHUvZHJtL21jZGUvbWNkZV9k
c2kuYwppbmRleCBmZmQyZTBiNjQ2MjguLmM3OTU2YzkyYjUxYiAxMDA2NDQKLS0tIGEvZHJpdmVy
cy9ncHUvZHJtL21jZGUvbWNkZV9kc2kuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vbWNkZS9tY2Rl
X2RzaS5jCkBAIC0xMjQsNyArMTI0LDI3IEBAIGJvb2wgbWNkZV9kc2lfaXJxKHN0cnVjdCBtaXBp
X2RzaV9kZXZpY2UgKm1kc2kpCiAKIAl2YWwgPSByZWFkbChkLT5yZWdzICsgRFNJX1ZJRF9NT0RF
X1NUU19GTEFHKTsKIAlpZiAodmFsKQotCQlkZXZfZXJyKGQtPmRldiwgInNvbWUgdmlkZW8gbW9k
ZSBlcnJvciBzdGF0dXNcbiIpOworCQlkZXZfZGJnKGQtPmRldiwgIkRTSV9WSURfTU9ERV9TVFNf
RkxBRyA9ICUwOHhcbiIsIHZhbCk7CisJaWYgKHZhbCAmIERTSV9WSURfTU9ERV9TVFNfVlNHX1JV
Tk5JTkcpCisJCWRldl9kYmcoZC0+ZGV2LCAiVklEIG1vZGUgVlNHIHJ1bm5pbmdcbiIpOworCWlm
ICh2YWwgJiBEU0lfVklEX01PREVfU1RTX0VSUl9NSVNTSU5HX0RBVEEpCisJCWRldl9lcnIoZC0+
ZGV2LCAiVklEIG1vZGUgbWlzc2luZyBkYXRhXG4iKTsKKwlpZiAodmFsICYgRFNJX1ZJRF9NT0RF
X1NUU19FUlJfTUlTU0lOR19IU1lOQykKKwkJZGV2X2VycihkLT5kZXYsICJWSUQgbW9kZSBtaXNz
aW5nIEhTWU5DXG4iKTsKKwlpZiAodmFsICYgRFNJX1ZJRF9NT0RFX1NUU19FUlJfTUlTU0lOR19W
U1lOQykKKwkJZGV2X2VycihkLT5kZXYsICJWSUQgbW9kZSBtaXNzaW5nIFZTWU5DXG4iKTsKKwlp
ZiAodmFsICYgRFNJX1ZJRF9NT0RFX1NUU19SRUdfRVJSX1NNQUxMX0xFTkdUSCkKKwkJZGV2X2Vy
cihkLT5kZXYsICJWSUQgbW9kZSBsZXNzIGJ5dGVzIHRoYW4gZXhwZWN0ZWQgYmV0d2VlbiB0d28g
SFNZTkNcbiIpOworCWlmICh2YWwgJiBEU0lfVklEX01PREVfU1RTX1JFR19FUlJfU01BTExfSEVJ
R0hUKQorCQlkZXZfZXJyKGQtPmRldiwgIlZJRCBtb2RlIGxlc3MgbGluZXMgdGhhbiBleHBlY3Rl
ZCBiZXR3ZWVuIHR3byBWU1lOQ1xuIik7CisJaWYgKHZhbCAmIChEU0lfVklEX01PREVfU1RTX0VS
Ul9CVVJTVFdSSVRFIHwKKwkJICAgRFNJX1ZJRF9NT0RFX1NUU19FUlJfTElORVdSSVRFIHwKKwkJ
ICAgRFNJX1ZJRF9NT0RFX1NUU19FUlJfTE9OR1JFQUQpKQorCQlkZXZfZXJyKGQtPmRldiwgIlZJ
RCBtb2RlIHJlYWQvd3JpdGUgZXJyb3JcbiIpOworCWlmICh2YWwgJiBEU0lfVklEX01PREVfU1RT
X0VSUl9WUlNfV1JPTkdfTEVOR1RIKQorCQlkZXZfZXJyKGQtPmRldiwgIlZJRCBtb2RlIHJlY2Vp
dmVkIHBhY2tldHMgZGlmZmVyIGZyb20gZXhwZWN0ZWQgc2l6ZVxuIik7CisJaWYgKHZhbCAmIERT
SV9WSURfTU9ERV9TVFNfVlNHX1JFQ09WRVJZKQorCQlkZXZfZXJyKGQtPmRldiwgIlZJRCBtb2Rl
IFZTRyBpbiByZWNvdmVyeSBtb2RlXG4iKTsKIAl3cml0ZWwodmFsLCBkLT5yZWdzICsgRFNJX1ZJ
RF9NT0RFX1NUU19DTFIpOwogCiAJcmV0dXJuIHRlX3JlY2VpdmVkOwpkaWZmIC0tZ2l0IGEvZHJp
dmVycy9ncHUvZHJtL21jZGUvbWNkZV9kc2lfcmVncy5oIGIvZHJpdmVycy9ncHUvZHJtL21jZGUv
bWNkZV9kc2lfcmVncy5oCmluZGV4IGM5MjUzMzIxYTNiZS4uYjAzYTMzNmMyMzVmIDEwMDY0NAot
LS0gYS9kcml2ZXJzL2dwdS9kcm0vbWNkZS9tY2RlX2RzaV9yZWdzLmgKKysrIGIvZHJpdmVycy9n
cHUvZHJtL21jZGUvbWNkZV9kc2lfcmVncy5oCkBAIC0yNDgsNiArMjQ4LDE2IEBACiAKICNkZWZp
bmUgRFNJX1ZJRF9NT0RFX1NUUyAweDAwMDAwMEJDCiAjZGVmaW5lIERTSV9WSURfTU9ERV9TVFNf
VlNHX1JVTk5JTkcgQklUKDApCisjZGVmaW5lIERTSV9WSURfTU9ERV9TVFNfRVJSX01JU1NJTkdf
REFUQSBCSVQoMSkKKyNkZWZpbmUgRFNJX1ZJRF9NT0RFX1NUU19FUlJfTUlTU0lOR19IU1lOQyBC
SVQoMikKKyNkZWZpbmUgRFNJX1ZJRF9NT0RFX1NUU19FUlJfTUlTU0lOR19WU1lOQyBCSVQoMykK
KyNkZWZpbmUgRFNJX1ZJRF9NT0RFX1NUU19SRUdfRVJSX1NNQUxMX0xFTkdUSCBCSVQoNCkKKyNk
ZWZpbmUgRFNJX1ZJRF9NT0RFX1NUU19SRUdfRVJSX1NNQUxMX0hFSUdIVCBCSVQoNSkKKyNkZWZp
bmUgRFNJX1ZJRF9NT0RFX1NUU19FUlJfQlVSU1RXUklURSBCSVQoNikKKyNkZWZpbmUgRFNJX1ZJ
RF9NT0RFX1NUU19FUlJfTElORVdSSVRFIEJJVCg3KQorI2RlZmluZSBEU0lfVklEX01PREVfU1RT
X0VSUl9MT05HUkVBRCBCSVQoOCkKKyNkZWZpbmUgRFNJX1ZJRF9NT0RFX1NUU19FUlJfVlJTX1dS
T05HX0xFTkdUSCBCSVQoOSkKKyNkZWZpbmUgRFNJX1ZJRF9NT0RFX1NUU19WU0dfUkVDT1ZFUlkg
QklUKDEwKQogCiAjZGVmaW5lIERTSV9WSURfVkNBX1NFVFRJTkcxIDB4MDAwMDAwQzAKICNkZWZp
bmUgRFNJX1ZJRF9WQ0FfU0VUVElORzFfTUFYX0JVUlNUX0xJTUlUX1NISUZUIDAKLS0gCjIuMjMu
MAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRl
dmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8v
bGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
