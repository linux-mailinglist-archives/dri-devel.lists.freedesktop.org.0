Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EDC25DD23
	for <lists+dri-devel@lfdr.de>; Mon, 29 Apr 2019 09:52:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0EB4489209;
	Mon, 29 Apr 2019 07:52:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 13FC989216
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Apr 2019 07:52:42 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id 4so12616498wmf.1
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Apr 2019 00:52:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=/+GdzCUbXbc9TnjbK+IzgC3Rn7LJK/U+L3O1XBIq//I=;
 b=iNK0Y9Zp4eG9CyDT6HuDK3td/wU3NLbPXZclWpQ/7DBkA6LGcZpZGYaxn/Jl5tVNXv
 jhxwFUAWwsVypHPonjdeZoQq7YtsSb09aXpdLth4LsU4WvSnWslj97TCN0o1qqdRzSN8
 JadRUMzDOtLdfn7Do8wr6STl2d77tsyW1DYSGqLCemFJrHBQbfuGE7zR9i08d3aqkPsU
 H+20QB+aLCtOV3J8K2l6MiCF0RiYDKZaIw4sLQ//bm2/NACyb+0gqwp5FzFdFpM1ICOp
 JWvMwZZct/oG6/dswLcS8gbCTzhUSIUO+4croDF7mfD0jP9IhuScIZQFrE1KNjVkpCZS
 VC8Q==
X-Gm-Message-State: APjAAAVJHu8N354vdiIf/B7OniCHumOAlO6AY9XsJOD4DVGGewLjt74t
 QhFjmHrRDcKG03NZI59ds+1stL1OyETF+w==
X-Google-Smtp-Source: APXvYqyrm9gcWdptLmdNHOe30KFoldLfiJoNxGhNez9U3SHQHqIDbxiDVW0eb3kiP7omvUckOLprWA==
X-Received: by 2002:a1c:495:: with SMTP id 143mr8270669wme.109.1556524360393; 
 Mon, 29 Apr 2019 00:52:40 -0700 (PDT)
Received: from bender.baylibre.local
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id q4sm5118457wrg.24.2019.04.29.00.52.39
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Mon, 29 Apr 2019 00:52:39 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/meson: Add support for XBGR8888 & ABGR8888 formats
Date: Mon, 29 Apr 2019 09:52:38 +0200
Message-Id: <20190429075238.7884-1-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=/+GdzCUbXbc9TnjbK+IzgC3Rn7LJK/U+L3O1XBIq//I=;
 b=E8jD+2dgpZNlzi2mli6iSqHgtX8ej4k2fD+p50X7E9LOuOgNBJ8gjAiK/IBRlJ+3OM
 /ezhla4lzKCiT7PZUIbPtAXYRSXzCpZOCkroWKcKrh8BWQv4R5GbvbhvcB1fx7/d8FSy
 G4CAF6FAJedyge2rIG6AwicnNEPM8G73yQvzHGrBoS+jwiRcXIKSh6VbwpVAZ0l4VTNI
 wok7bVcf5eQrVfmQTxDMGjxS30rWsNi12GwMpYTMAgbocRh2CqzeZWkF+rgUFVyywy24
 Im77RGr1kKsu0YTlS+T2nujXKe01K7Q05lij2Nt6vydzWaZfM69r7GVKjGUj5UymDHbh
 +GdQ==
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
Cc: linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Neil Armstrong <narmstrong@baylibre.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QWRkIG1pc3NpbmcgWEJHUjg4ODggJiBBQkdSODg4OCBmb3JtYXRzIHZhcmlhbnRzIGZyb20gdGhl
IHByaW1hcnkgcGxhbmUuCgpGaXhlczogYmJiZTc3NWVjNWI1ICgiZHJtOiBBZGQgc3VwcG9ydCBm
b3IgQW1sb2dpYyBNZXNvbiBHcmFwaGljIENvbnRyb2xsZXIiKQpTaWduZWQtb2ZmLWJ5OiBOZWls
IEFybXN0cm9uZyA8bmFybXN0cm9uZ0BiYXlsaWJyZS5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJt
L21lc29uL21lc29uX3BsYW5lLmMgfCAxNiArKysrKysrKysrKysrKysrCiAxIGZpbGUgY2hhbmdl
ZCwgMTYgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9tZXNvbi9t
ZXNvbl9wbGFuZS5jIGIvZHJpdmVycy9ncHUvZHJtL21lc29uL21lc29uX3BsYW5lLmMKaW5kZXgg
YmY4ZjFmYWI2M2FhLi5iOGY2YjA4YTg5YTYgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9t
ZXNvbi9tZXNvbl9wbGFuZS5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9tZXNvbi9tZXNvbl9wbGFu
ZS5jCkBAIC0xNjUsNiArMTY1LDEzIEBAIHN0YXRpYyB2b2lkIG1lc29uX3BsYW5lX2F0b21pY191
cGRhdGUoc3RydWN0IGRybV9wbGFuZSAqcGxhbmUsCiAJCXByaXYtPnZpdS5vc2QxX2JsazBfY2Zn
WzBdIHw9IE9TRF9CTEtfTU9ERV8zMiB8CiAJCQkJCSAgICAgIE9TRF9DT0xPUl9NQVRSSVhfMzJf
QVJHQjsKIAkJYnJlYWs7CisJY2FzZSBEUk1fRk9STUFUX1hCR1I4ODg4OgorCQkvKiBGb3IgWFJH
QiwgcmVwbGFjZSB0aGUgcGl4ZWwncyBhbHBoYSBieSAweEZGICovCisJCXdyaXRlbF9iaXRzX3Jl
bGF4ZWQoT1NEX1JFUExBQ0VfRU4sIE9TRF9SRVBMQUNFX0VOLAorCQkJCSAgICBwcml2LT5pb19i
YXNlICsgX1JFRyhWSVVfT1NEMV9DVFJMX1NUQVQyKSk7CisJCXByaXYtPnZpdS5vc2QxX2JsazBf
Y2ZnWzBdIHw9IE9TRF9CTEtfTU9ERV8zMiB8CisJCQkJCSAgICAgIE9TRF9DT0xPUl9NQVRSSVhf
MzJfQUJHUjsKKwkJYnJlYWs7CiAJY2FzZSBEUk1fRk9STUFUX0FSR0I4ODg4OgogCQkvKiBGb3Ig
QVJHQiwgdXNlIHRoZSBwaXhlbCdzIGFscGhhICovCiAJCXdyaXRlbF9iaXRzX3JlbGF4ZWQoT1NE
X1JFUExBQ0VfRU4sIDAsCkBAIC0xNzIsNiArMTc5LDEzIEBAIHN0YXRpYyB2b2lkIG1lc29uX3Bs
YW5lX2F0b21pY191cGRhdGUoc3RydWN0IGRybV9wbGFuZSAqcGxhbmUsCiAJCXByaXYtPnZpdS5v
c2QxX2JsazBfY2ZnWzBdIHw9IE9TRF9CTEtfTU9ERV8zMiB8CiAJCQkJCSAgICAgIE9TRF9DT0xP
Ul9NQVRSSVhfMzJfQVJHQjsKIAkJYnJlYWs7CisJY2FzZSBEUk1fRk9STUFUX0FCR1I4ODg4Ogor
CQkvKiBGb3IgQVJHQiwgdXNlIHRoZSBwaXhlbCdzIGFscGhhICovCisJCXdyaXRlbF9iaXRzX3Jl
bGF4ZWQoT1NEX1JFUExBQ0VfRU4sIDAsCisJCQkJICAgIHByaXYtPmlvX2Jhc2UgKyBfUkVHKFZJ
VV9PU0QxX0NUUkxfU1RBVDIpKTsKKwkJcHJpdi0+dml1Lm9zZDFfYmxrMF9jZmdbMF0gfD0gT1NE
X0JMS19NT0RFXzMyIHwKKwkJCQkJICAgICAgT1NEX0NPTE9SX01BVFJJWF8zMl9BQkdSOworCQli
cmVhazsKIAljYXNlIERSTV9GT1JNQVRfUkdCODg4OgogCQlwcml2LT52aXUub3NkMV9ibGswX2Nm
Z1swXSB8PSBPU0RfQkxLX01PREVfMjQgfAogCQkJCQkgICAgICBPU0RfQ09MT1JfTUFUUklYXzI0
X1JHQjsKQEAgLTM1Niw3ICszNzAsOSBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IGRybV9wbGFuZV9m
dW5jcyBtZXNvbl9wbGFuZV9mdW5jcyA9IHsKIAogc3RhdGljIGNvbnN0IHVpbnQzMl90IHN1cHBv
cnRlZF9kcm1fZm9ybWF0c1tdID0gewogCURSTV9GT1JNQVRfQVJHQjg4ODgsCisJRFJNX0ZPUk1B
VF9BQkdSODg4OCwKIAlEUk1fRk9STUFUX1hSR0I4ODg4LAorCURSTV9GT1JNQVRfWEJHUjg4ODgs
CiAJRFJNX0ZPUk1BVF9SR0I4ODgsCiAJRFJNX0ZPUk1BVF9SR0I1NjUsCiB9OwotLSAKMi4yMS4w
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2
ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9s
aXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
