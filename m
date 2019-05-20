Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B1882384D
	for <lists+dri-devel@lfdr.de>; Mon, 20 May 2019 15:38:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C547789296;
	Mon, 20 May 2019 13:38:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4963C8928D
 for <dri-devel@lists.freedesktop.org>; Mon, 20 May 2019 13:37:59 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id b18so14604153wrq.12
 for <dri-devel@lists.freedesktop.org>; Mon, 20 May 2019 06:37:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=3e74Rqo2cklBC/UlaNKx3JTEybiBIRYYjSOkJeHcPVk=;
 b=gKXQtLY995QKQkJfntd92+hlo3oI27pV/OXHdgCPYy3XCW3u8D2ZMbV+ZqcZrH23yw
 36iCKGMT2Np0W5S/Gl81uvNej4KJ/ddWf2R7Io+H+hPVrLOuCjxlGkSaacnRvgQbxJM+
 yHiUb8Y+OBsA95zP0BnSIIrDqx/1e9WdOBW5VEGp8sjZRsQ5ovTbvT4pgFX0tU4HUhzn
 8uc0Bj3c+2L3lcMxgGOCUhdngHTKSP6xXFcbFMdgcKxqSV8JeipQvCW3v1sXXFlLDidT
 0bqstMKVvKfvDze/ftEfWanpsGvN7LeGQYd434xoHmHbeuav40kjX/hxuktjb6knfmT9
 55fg==
X-Gm-Message-State: APjAAAW1VGTojaM/NAeeJsYEEpGP7UhNKxR4mIuLpkjkzDIdE5nqyhVz
 kwJPD1t1Rl5y/EBqB4mRoNp1Lg==
X-Google-Smtp-Source: APXvYqzgpOdOwP/k89kTM8MajUx9gbr5leJDAK8P0GnnsntE0Gkyw8ycffQn9JpPsd5utxc0Gc2bzw==
X-Received: by 2002:adf:dc09:: with SMTP id t9mr18108351wri.69.1558359477807; 
 Mon, 20 May 2019 06:37:57 -0700 (PDT)
Received: from bender.baylibre.local
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id t19sm12167059wmi.42.2019.05.20.06.37.56
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Mon, 20 May 2019 06:37:57 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: a.hajda@samsung.com,
	Laurent.pinchart@ideasonboard.com
Subject: [PATCH 1/5] drm/bridge: dw-hdmi: allow ycbcr420 modes for >= 0x200a
Date: Mon, 20 May 2019 15:37:49 +0200
Message-Id: <20190520133753.23871-2-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190520133753.23871-1-narmstrong@baylibre.com>
References: <20190520133753.23871-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=3e74Rqo2cklBC/UlaNKx3JTEybiBIRYYjSOkJeHcPVk=;
 b=qkqIZ4ym2VLSeHeslEAQCyUm6bVeVsFSUNQ2LvtHrY3C2fCv4b8b0jbIveo4LIdqiD
 6TkCPtclY3durJ4MYJ/XTFZYf0Ty2iOJgWlx0zP0jcAg10vChIwUxV8hw4fkasbGVUgo
 97ILwguLgX/uDsC16i4vczuxKAtB0eTL3uM5X6Y1CW6VW7A2UrjU7+PCoeOl9dio5YT8
 D0TqkTINRjw5Nbz40cuoU/Rx3qz2+qTRUGTKn3UMPqWa700L3ygRZ8FlBqRETtBouxAz
 YiBQ6yoLl0bIjHfo8np0hdwmc+Fk3NJnlGjEVUi2DxSmB+B4+4Ng9zgmORZo+HqIEaxM
 C4yQ==
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
Cc: jernej.skrabec@siol.net, Neil Armstrong <narmstrong@baylibre.com>,
 maxime.ripard@bootlin.com, jonas@kwiboo.se, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, hverkuil@xs4all.nl,
 linux-amlogic@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Tm93IHRoZSBEVy1IRE1JIENvbnRyb2xsZXIgc3VwcG9ydHMgdGhlIEhETUkyLjAgbW9kZXMsIGVu
YWJsZSBzdXBwb3J0CmZvciB0aGVzZSBtb2RlcyBpbiB0aGUgY29ubmVjdG9yIGlmIHRoZSBwbGF0
Zm9ybSBzdXBwb3J0cyB0aGVtLgpXZSBsaW1pdCB0aGVzZSBtb2RlcyB0byBEVy1IRE1JIElQIHZl
cnNpb24gPj0gMHgyMDBhIHdoaWNoCmFyZSBkZXNpZ25lZCB0byBzdXBwb3J0IEhETUkyLjAgZGlz
cGxheSBtb2Rlcy4KClNpZ25lZC1vZmYtYnk6IE5laWwgQXJtc3Ryb25nIDxuYXJtc3Ryb25nQGJh
eWxpYnJlLmNvbT4KVGVzdGVkLWJ5OiBIZWlrbyBTdHVlYm5lciA8aGVpa29Ac250ZWNoLmRlPgot
LS0KIGRyaXZlcnMvZ3B1L2RybS9icmlkZ2Uvc3lub3BzeXMvZHctaGRtaS5jIHwgNiArKysrKysK
IGluY2x1ZGUvZHJtL2JyaWRnZS9kd19oZG1pLmggICAgICAgICAgICAgIHwgMSArCiAyIGZpbGVz
IGNoYW5nZWQsIDcgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9i
cmlkZ2Uvc3lub3BzeXMvZHctaGRtaS5jIGIvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9zeW5vcHN5
cy9kdy1oZG1pLmMKaW5kZXggYWI3OTY4YzhmNmEyLi5iNTBjNDljYWY3YWUgMTAwNjQ0Ci0tLSBh
L2RyaXZlcnMvZ3B1L2RybS9icmlkZ2Uvc3lub3BzeXMvZHctaGRtaS5jCisrKyBiL2RyaXZlcnMv
Z3B1L2RybS9icmlkZ2Uvc3lub3BzeXMvZHctaGRtaS5jCkBAIC0yNjI5LDYgKzI2MjksMTIgQEAg
X19kd19oZG1pX3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYsCiAJaWYgKGhkbWkt
PnBoeS5vcHMtPnNldHVwX2hwZCkKIAkJaGRtaS0+cGh5Lm9wcy0+c2V0dXBfaHBkKGhkbWksIGhk
bWktPnBoeS5kYXRhKTsKIAorCWlmIChoZG1pLT52ZXJzaW9uID49IDB4MjAwYSkKKwkJaGRtaS0+
Y29ubmVjdG9yLnljYmNyXzQyMF9hbGxvd2VkID0KKwkJCWhkbWktPnBsYXRfZGF0YS0+eWNiY3Jf
NDIwX2FsbG93ZWQ7CisJZWxzZQorCQloZG1pLT5jb25uZWN0b3IueWNiY3JfNDIwX2FsbG93ZWQg
PSBmYWxzZTsKKwogCW1lbXNldCgmcGRldmluZm8sIDAsIHNpemVvZihwZGV2aW5mbykpOwogCXBk
ZXZpbmZvLnBhcmVudCA9IGRldjsKIAlwZGV2aW5mby5pZCA9IFBMQVRGT1JNX0RFVklEX0FVVE87
CmRpZmYgLS1naXQgYS9pbmNsdWRlL2RybS9icmlkZ2UvZHdfaGRtaS5oIGIvaW5jbHVkZS9kcm0v
YnJpZGdlL2R3X2hkbWkuaAppbmRleCA2NmU3MDc3MGNjZTUuLjBmMGU4MjYzOGZiZSAxMDA2NDQK
LS0tIGEvaW5jbHVkZS9kcm0vYnJpZGdlL2R3X2hkbWkuaAorKysgYi9pbmNsdWRlL2RybS9icmlk
Z2UvZHdfaGRtaS5oCkBAIC0xMzAsNiArMTMwLDcgQEAgc3RydWN0IGR3X2hkbWlfcGxhdF9kYXRh
IHsKIAkJCQkJICAgY29uc3Qgc3RydWN0IGRybV9kaXNwbGF5X21vZGUgKm1vZGUpOwogCXVuc2ln
bmVkIGxvbmcgaW5wdXRfYnVzX2Zvcm1hdDsKIAl1bnNpZ25lZCBsb25nIGlucHV0X2J1c19lbmNv
ZGluZzsKKwlib29sIHljYmNyXzQyMF9hbGxvd2VkOwogCiAJLyogVmVuZG9yIFBIWSBzdXBwb3J0
ICovCiAJY29uc3Qgc3RydWN0IGR3X2hkbWlfcGh5X29wcyAqcGh5X29wczsKLS0gCjIuMjEuMAoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
