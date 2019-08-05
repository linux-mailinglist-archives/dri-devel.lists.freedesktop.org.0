Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2ED6182C9C
	for <lists+dri-devel@lfdr.de>; Tue,  6 Aug 2019 09:25:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0AF7989F97;
	Tue,  6 Aug 2019 07:24:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 913516E43A
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Aug 2019 13:41:08 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id p13so9901206wru.10
 for <dri-devel@lists.freedesktop.org>; Mon, 05 Aug 2019 06:41:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=u7zeWErMdF5cDye5AhvTdnoHNJxxvxbr+2y5SRXygFM=;
 b=ovzCafj8ozuqkSizUdrpJUiCFepkpAkTSwSZFroW0k0PRA7okLwmQM/r7yr5U3ouLE
 tbHZ4hcBRP8BoYXknRFZymwprsh/Ugvu7C6FTHSm2CLk/FWtxUXlWR9a7Vpn2/Tduouh
 t9ksyOCcIwuvnariTfZ79SQHCzZAqHT5HZKpXDB/QKHyhc7tZKcbJvpKBDJ/wsFSA/0m
 yHi/PcHf/tu7z+Fgol2dxg6llw4LhXuta3IGZ1zuV+sHI8uGiUmZB0NCm7PDcJEKX4S2
 y84DlEfVwirBep5OYZrt+jmI4OLiX2zcGv73IY/4us7bR3SWqGmE1fTJj05vp2H87Euf
 hg6w==
X-Gm-Message-State: APjAAAXs5hCsK3AN7Af2UAOkPoFvUd4BH1T63CLhOfV4RQogV6Ckb3Xs
 zwF9WfxpU7VA4RhU/3BgPsipWg==
X-Google-Smtp-Source: APXvYqxG5de8oOGia6/RKX4BDBfFqrUciyIWbE/cUEFUzhPAcqXB/v97uk9srpVF1S7gz9QbWrzicA==
X-Received: by 2002:adf:e84a:: with SMTP id d10mr25698441wrn.316.1565012467143; 
 Mon, 05 Aug 2019 06:41:07 -0700 (PDT)
Received: from starbuck.baylibre.local
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.googlemail.com with ESMTPSA id w7sm99040534wrn.11.2019.08.05.06.41.06
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 05 Aug 2019 06:41:06 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Andrzej Hajda <a.hajda@samsung.com>,
 Neil Armstrong <narmstrong@baylibre.com>
Subject: [PATCH 1/8] drm/bridge: dw-hdmi-i2s: support more i2s format
Date: Mon,  5 Aug 2019 15:40:55 +0200
Message-Id: <20190805134102.24173-2-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190805134102.24173-1-jbrunet@baylibre.com>
References: <20190805134102.24173-1-jbrunet@baylibre.com>
MIME-Version: 1.0
X-Patchwork-Bot: notify
X-Mailman-Approved-At: Tue, 06 Aug 2019 07:24:35 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=u7zeWErMdF5cDye5AhvTdnoHNJxxvxbr+2y5SRXygFM=;
 b=MHoStDToM0MdRmsreIsrkeHnl7ndApf5lYedJ3xZjob55uO1i43CLbVtuy8Iw08zxr
 EknOi1kG8YM26xXqhhZoANy1raTNxAnyNlz3ph0LLBGST5tWhZunQGwVh2P7PEUEwrB4
 w0HpoRCOV9knHIeJE35dlTeS72WUbACmEmW2Rc/cs7t9/KJscpct8svpiL6Uu8zjY9qj
 aNo+XFlfYl74BGc7P0mqMgdWhE2TkAOHZkBh9Xd/zwll8OyAFl28UrV3+9YKjeLObjGE
 l/3pkF5SHP6NCe4NG7CA54wAyMhjYmd/PhifrTXP54ETaQZaqnah1YmO6Ji4J+lCSe7T
 qn5A==
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
c3AgbW9kZXMKQSBhbmQgQi4KClNpZ25lZC1vZmYtYnk6IEplcm9tZSBCcnVuZXQgPGpicnVuZXRA
YmF5bGlicmUuY29tPgotLS0KIC4uLi9kcm0vYnJpZGdlL3N5bm9wc3lzL2R3LWhkbWktaTJzLWF1
ZGlvLmMgICB8IDI2ICsrKysrKysrKysrKysrKystLS0KIGRyaXZlcnMvZ3B1L2RybS9icmlkZ2Uv
c3lub3BzeXMvZHctaGRtaS5oICAgICB8ICA2ICsrKy0tCiAyIGZpbGVzIGNoYW5nZWQsIDI3IGlu
c2VydGlvbnMoKyksIDUgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJt
L2JyaWRnZS9zeW5vcHN5cy9kdy1oZG1pLWkycy1hdWRpby5jIGIvZHJpdmVycy9ncHUvZHJtL2Jy
aWRnZS9zeW5vcHN5cy9kdy1oZG1pLWkycy1hdWRpby5jCmluZGV4IDVjYmI3MWE4NjZkNS4uMmI2
MjRjZmY1NDFkIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL3N5bm9wc3lzL2R3
LWhkbWktaTJzLWF1ZGlvLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9zeW5vcHN5cy9k
dy1oZG1pLWkycy1hdWRpby5jCkBAIC00NCw5ICs0NCw4IEBAIHN0YXRpYyBpbnQgZHdfaGRtaV9p
MnNfaHdfcGFyYW1zKHN0cnVjdCBkZXZpY2UgKmRldiwgdm9pZCAqZGF0YSwKIAl1OCBpbnB1dGNs
a2ZzID0gMDsKIAogCS8qIGl0IGNhcmVzIEkyUyBvbmx5ICovCi0JaWYgKChmbXQtPmZtdCAhPSBI
RE1JX0kyUykgfHwKLQkgICAgKGZtdC0+Yml0X2Nsa19tYXN0ZXIgfCBmbXQtPmZyYW1lX2Nsa19t
YXN0ZXIpKSB7Ci0JCWRldl9lcnIoZGV2LCAidW5zdXBwb3J0ZWQgZm9ybWF0L3NldHRpbmdzXG4i
KTsKKwlpZiAoZm10LT5iaXRfY2xrX21hc3RlciB8IGZtdC0+ZnJhbWVfY2xrX21hc3Rlcikgewor
CQlkZXZfZXJyKGRldiwgInVuc3VwcG9ydGVkIGNsb2NrIHNldHRpbmdzXG4iKTsKIAkJcmV0dXJu
IC1FSU5WQUw7CiAJfQogCkBAIC02Myw2ICs2MiwyNyBAQCBzdGF0aWMgaW50IGR3X2hkbWlfaTJz
X2h3X3BhcmFtcyhzdHJ1Y3QgZGV2aWNlICpkZXYsIHZvaWQgKmRhdGEsCiAJCWJyZWFrOwogCX0K
IAorCXN3aXRjaCAoZm10LT5mbXQpIHsKKwljYXNlIEhETUlfSTJTOgorCQljb25mMSB8PSBIRE1J
X0FVRF9DT05GMV9NT0RFX0kyUzsKKwkJYnJlYWs7CisJY2FzZSBIRE1JX1JJR0hUX0o6CisJCWNv
bmYxIHw9IEhETUlfQVVEX0NPTkYxX01PREVfUklHSFRfSjsKKwkJYnJlYWs7CisJY2FzZSBIRE1J
X0xFRlRfSjoKKwkJY29uZjEgfD0gSERNSV9BVURfQ09ORjFfTU9ERV9MRUZUX0o7CisJCWJyZWFr
OworCWNhc2UgSERNSV9EU1BfQToKKwkJY29uZjEgfD0gSERNSV9BVURfQ09ORjFfTU9ERV9CVVJT
VF8xOworCQlicmVhazsKKwljYXNlIEhETUlfRFNQX0I6CisJCWNvbmYxIHw9IEhETUlfQVVEX0NP
TkYxX01PREVfQlVSU1RfMjsKKwkJYnJlYWs7CisJZGVmYXVsdDoKKwkJZGV2X2VycihkZXYsICJ1
bnN1cHBvcnRlZCBmb3JtYXRcbiIpOworCQlyZXR1cm4gLUVJTlZBTDsKKwl9CisKIAlkd19oZG1p
X3NldF9zYW1wbGVfcmF0ZShoZG1pLCBocGFybXMtPnNhbXBsZV9yYXRlKTsKIAogCWhkbWlfd3Jp
dGUoYXVkaW8sIGlucHV0Y2xrZnMsIEhETUlfQVVEX0lOUFVUQ0xLRlMpOwpkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9zeW5vcHN5cy9kdy1oZG1pLmggYi9kcml2ZXJzL2dwdS9k
cm0vYnJpZGdlL3N5bm9wc3lzL2R3LWhkbWkuaAppbmRleCA0ZTNlYzA5ZDNjYTQuLjA5MWQ3YzI4
YWExNyAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9zeW5vcHN5cy9kdy1oZG1p
LmgKKysrIGIvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9zeW5vcHN5cy9kdy1oZG1pLmgKQEAgLTg2
OSw4ICs4NjksMTAgQEAgZW51bSB7CiAKIC8qIEFVRF9DT05GMSBmaWVsZCB2YWx1ZXMgKi8KIAlI
RE1JX0FVRF9DT05GMV9NT0RFX0kyUyA9IDB4MDAsCi0JSERNSV9BVURfQ09ORjFfTU9ERV9SSUdI
VF9KID0gMHgwMiwKLQlIRE1JX0FVRF9DT05GMV9NT0RFX0xFRlRfSiA9IDB4MDQsCisJSERNSV9B
VURfQ09ORjFfTU9ERV9SSUdIVF9KID0gMHgyMCwKKwlIRE1JX0FVRF9DT05GMV9NT0RFX0xFRlRf
SiA9IDB4NDAsCisJSERNSV9BVURfQ09ORjFfTU9ERV9CVVJTVF8xID0gMHg2MCwKKwlIRE1JX0FV
RF9DT05GMV9NT0RFX0JVUlNUXzIgPSAweDgwLAogCUhETUlfQVVEX0NPTkYxX1dJRFRIXzE2ID0g
MHgxMCwKIAlIRE1JX0FVRF9DT05GMV9XSURUSF8yNCA9IDB4MTgsCiAKLS0gCjIuMjEuMAoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1h
aWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
