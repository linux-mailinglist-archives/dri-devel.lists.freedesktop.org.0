Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1ABEB8E689
	for <lists+dri-devel@lfdr.de>; Thu, 15 Aug 2019 10:35:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 27E8A6E8D9;
	Thu, 15 Aug 2019 08:34:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7176A6E4FE
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Aug 2019 12:07:32 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id q12so14072939wrj.12
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Aug 2019 05:07:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ceoz58HJhiw+4Z6q1/xd/gAe7VVmzCvD6fU8sO+lm5o=;
 b=BGedHpev5dI3eB4DuMfcgXGZxsm/gOsaaLiNsya6TaGTFLnr0qXCMtr4l9ey4dU7b9
 B39jzRSAwQt6wt0dLffA7W5wYYPniRtXbAZ2HMViADnFwumka4sDY7x3M1On4Sz9RhW/
 r9VuVx2wmlB10sAscsn/+Uk5rWdMla8hrLvDF6NEMxk1XDRacTDuzFpH8a9hQGPegwYN
 +OGLkWcHLyZp41CdyrOhbXOdE1r6YJudNdmNnPbf6bbissxeC8dCF7NbTAYXJ0GQt5Fy
 6swWt3C95pNz0SF1P6Wfew82fzpMAAQ2b7sW7O2eZ0capmISxbuG7cPRdPu5+ShC15Oh
 pz7Q==
X-Gm-Message-State: APjAAAVHOdTq41a3EroOpS3IDpe9m35/X4iFtDerNF7nNqUGrRJYkL1m
 u1g660v1m406McPWApzH1qZjVA==
X-Google-Smtp-Source: APXvYqy32yxW6ITSLrDXLyZ6668kqusWzhq85fvzCQmJeabhxKDQLSSVz4Wz9i/mCgPzAFNi0NpyqA==
X-Received: by 2002:adf:f705:: with SMTP id r5mr16743424wrp.342.1565611650885; 
 Mon, 12 Aug 2019 05:07:30 -0700 (PDT)
Received: from starbuck.baylibre.local
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.googlemail.com with ESMTPSA id j9sm1883415wrx.66.2019.08.12.05.07.29
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 12 Aug 2019 05:07:30 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Andrzej Hajda <a.hajda@samsung.com>,
 Neil Armstrong <narmstrong@baylibre.com>
Subject: [PATCH v2 1/8] drm/bridge: dw-hdmi-i2s: support more i2s format
Date: Mon, 12 Aug 2019 14:07:19 +0200
Message-Id: <20190812120726.1528-2-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190812120726.1528-1-jbrunet@baylibre.com>
References: <20190812120726.1528-1-jbrunet@baylibre.com>
MIME-Version: 1.0
X-Patchwork-Bot: notify
X-Mailman-Approved-At: Thu, 15 Aug 2019 08:34:55 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ceoz58HJhiw+4Z6q1/xd/gAe7VVmzCvD6fU8sO+lm5o=;
 b=Or3uQR6QO71RP1JieY4+QIypkqR1ZLSwxIsThtNzg2pwMJw3ABCgPudYblpSyj9V9U
 Ur910YS8Rv83kYjvTFn8d8JSeGMX0uL0dP2qioI7DJ2HB81GTaYS0I7ia+Pm4V0WNunt
 9Cep9ntP0tfqwN+EqG8JABr2Up4KQM/Fb2AsNgOkuPhktdjG+hCt6PJSr98UMiBlKvy5
 3ibft6dtlkFlG2OgeL12AMKbPtVlpitDZfN0XFZIOZlkjRLFplktrwwat9WpWDFv4tqp
 s0pWWckNeTbPaB2h0XABYkbZFQhwX2jPQI5Hcv34lLxlKWju91BJM3kA19oGZXZImzxQ
 Nd1A==
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
Cc: Jonas Karlman <jonas@kwiboo.se>, Kevin Hilman <khilman@baylibre.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-amlogic@lists.infradead.org, Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhlIGR3LWhkbWktaTJzIHN1cHBvcnRzIG1vcmUgZm9ybWF0cyB0aGFuIGp1c3QgcmVndWxhciBp
MnMuCkFkZCBzdXBwb3J0IGZvciBsZWZ0IGp1c3RpZmllZCwgcmlnaHQganVzdGlmaWVkIGFuZCBk
c3AgbW9kZXMKQSBhbmQgQi4KClJldmlld2VkLWJ5OiBKb25hcyBLYXJsbWFuIDxqb25hc0Brd2li
b28uc2U+ClNpZ25lZC1vZmYtYnk6IEplcm9tZSBCcnVuZXQgPGpicnVuZXRAYmF5bGlicmUuY29t
PgotLS0KIC4uLi9kcm0vYnJpZGdlL3N5bm9wc3lzL2R3LWhkbWktaTJzLWF1ZGlvLmMgICB8IDI2
ICsrKysrKysrKysrKysrKystLS0KIGRyaXZlcnMvZ3B1L2RybS9icmlkZ2Uvc3lub3BzeXMvZHct
aGRtaS5oICAgICB8ICA2ICsrKy0tCiAyIGZpbGVzIGNoYW5nZWQsIDI3IGluc2VydGlvbnMoKyks
IDUgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9zeW5v
cHN5cy9kdy1oZG1pLWkycy1hdWRpby5jIGIvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9zeW5vcHN5
cy9kdy1oZG1pLWkycy1hdWRpby5jCmluZGV4IDVjYmI3MWE4NjZkNS4uMmI2MjRjZmY1NDFkIDEw
MDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL3N5bm9wc3lzL2R3LWhkbWktaTJzLWF1
ZGlvLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9zeW5vcHN5cy9kdy1oZG1pLWkycy1h
dWRpby5jCkBAIC00NCw5ICs0NCw4IEBAIHN0YXRpYyBpbnQgZHdfaGRtaV9pMnNfaHdfcGFyYW1z
KHN0cnVjdCBkZXZpY2UgKmRldiwgdm9pZCAqZGF0YSwKIAl1OCBpbnB1dGNsa2ZzID0gMDsKIAog
CS8qIGl0IGNhcmVzIEkyUyBvbmx5ICovCi0JaWYgKChmbXQtPmZtdCAhPSBIRE1JX0kyUykgfHwK
LQkgICAgKGZtdC0+Yml0X2Nsa19tYXN0ZXIgfCBmbXQtPmZyYW1lX2Nsa19tYXN0ZXIpKSB7Ci0J
CWRldl9lcnIoZGV2LCAidW5zdXBwb3J0ZWQgZm9ybWF0L3NldHRpbmdzXG4iKTsKKwlpZiAoZm10
LT5iaXRfY2xrX21hc3RlciB8IGZtdC0+ZnJhbWVfY2xrX21hc3RlcikgeworCQlkZXZfZXJyKGRl
diwgInVuc3VwcG9ydGVkIGNsb2NrIHNldHRpbmdzXG4iKTsKIAkJcmV0dXJuIC1FSU5WQUw7CiAJ
fQogCkBAIC02Myw2ICs2MiwyNyBAQCBzdGF0aWMgaW50IGR3X2hkbWlfaTJzX2h3X3BhcmFtcyhz
dHJ1Y3QgZGV2aWNlICpkZXYsIHZvaWQgKmRhdGEsCiAJCWJyZWFrOwogCX0KIAorCXN3aXRjaCAo
Zm10LT5mbXQpIHsKKwljYXNlIEhETUlfSTJTOgorCQljb25mMSB8PSBIRE1JX0FVRF9DT05GMV9N
T0RFX0kyUzsKKwkJYnJlYWs7CisJY2FzZSBIRE1JX1JJR0hUX0o6CisJCWNvbmYxIHw9IEhETUlf
QVVEX0NPTkYxX01PREVfUklHSFRfSjsKKwkJYnJlYWs7CisJY2FzZSBIRE1JX0xFRlRfSjoKKwkJ
Y29uZjEgfD0gSERNSV9BVURfQ09ORjFfTU9ERV9MRUZUX0o7CisJCWJyZWFrOworCWNhc2UgSERN
SV9EU1BfQToKKwkJY29uZjEgfD0gSERNSV9BVURfQ09ORjFfTU9ERV9CVVJTVF8xOworCQlicmVh
azsKKwljYXNlIEhETUlfRFNQX0I6CisJCWNvbmYxIHw9IEhETUlfQVVEX0NPTkYxX01PREVfQlVS
U1RfMjsKKwkJYnJlYWs7CisJZGVmYXVsdDoKKwkJZGV2X2VycihkZXYsICJ1bnN1cHBvcnRlZCBm
b3JtYXRcbiIpOworCQlyZXR1cm4gLUVJTlZBTDsKKwl9CisKIAlkd19oZG1pX3NldF9zYW1wbGVf
cmF0ZShoZG1pLCBocGFybXMtPnNhbXBsZV9yYXRlKTsKIAogCWhkbWlfd3JpdGUoYXVkaW8sIGlu
cHV0Y2xrZnMsIEhETUlfQVVEX0lOUFVUQ0xLRlMpOwpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUv
ZHJtL2JyaWRnZS9zeW5vcHN5cy9kdy1oZG1pLmggYi9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL3N5
bm9wc3lzL2R3LWhkbWkuaAppbmRleCA0ZTNlYzA5ZDNjYTQuLjA5MWQ3YzI4YWExNyAxMDA2NDQK
LS0tIGEvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9zeW5vcHN5cy9kdy1oZG1pLmgKKysrIGIvZHJp
dmVycy9ncHUvZHJtL2JyaWRnZS9zeW5vcHN5cy9kdy1oZG1pLmgKQEAgLTg2OSw4ICs4NjksMTAg
QEAgZW51bSB7CiAKIC8qIEFVRF9DT05GMSBmaWVsZCB2YWx1ZXMgKi8KIAlIRE1JX0FVRF9DT05G
MV9NT0RFX0kyUyA9IDB4MDAsCi0JSERNSV9BVURfQ09ORjFfTU9ERV9SSUdIVF9KID0gMHgwMiwK
LQlIRE1JX0FVRF9DT05GMV9NT0RFX0xFRlRfSiA9IDB4MDQsCisJSERNSV9BVURfQ09ORjFfTU9E
RV9SSUdIVF9KID0gMHgyMCwKKwlIRE1JX0FVRF9DT05GMV9NT0RFX0xFRlRfSiA9IDB4NDAsCisJ
SERNSV9BVURfQ09ORjFfTU9ERV9CVVJTVF8xID0gMHg2MCwKKwlIRE1JX0FVRF9DT05GMV9NT0RF
X0JVUlNUXzIgPSAweDgwLAogCUhETUlfQVVEX0NPTkYxX1dJRFRIXzE2ID0gMHgxMCwKIAlIRE1J
X0FVRF9DT05GMV9XSURUSF8yNCA9IDB4MTgsCiAKLS0gCjIuMjEuMAoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApk
cmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Au
b3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
