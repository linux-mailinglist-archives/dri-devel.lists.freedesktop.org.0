Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 401E842A22
	for <lists+dri-devel@lfdr.de>; Wed, 12 Jun 2019 17:00:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 152A3894E3;
	Wed, 12 Jun 2019 15:00:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x844.google.com (mail-qt1-x844.google.com
 [IPv6:2607:f8b0:4864:20::844])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 270B3894FE
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jun 2019 15:00:42 +0000 (UTC)
Received: by mail-qt1-x844.google.com with SMTP id x2so17949051qtr.0
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jun 2019 08:00:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ZBPf58QxPPuPYue1mt8WshrM290RBAIvY7SGkcWYYFM=;
 b=ow6b9akIt45sFkn0ONNDR8NZSR6C5/UTNuQ26Ro6onvzoyA4DhX0DXkAFd8L3Kb6fL
 P21k8FClRD2aov8pXQeEVv2tIj8AY5JjGASxwvwwA0pO2BqFeqij3P3QOgQp8dyHlrIx
 jJKgoStTjQA2LXQ0GM9phrFlL2GG4ux6TKGynVf5tzaeEOyqddlA7Zmqe5MYu74VnNRg
 dT66xV8L+/XJ2CPJe4QURFCcjUc6pz6cinFSHODr9NUKkjAmkuBajRXsniYRjht2TY+w
 BwIXoEEGgcBDZQV2NRJ3DElA99U+cpFK+aFE5OGSm4BfAjCArpLoXWgXZZbgsZnUg13t
 4GQA==
X-Gm-Message-State: APjAAAW+GGXuAQ5LAroq2daiY7PmfC+k4JDfx3ZunLZiUzCv/4adJimE
 ATIvkeRra8hCfksOSrWjpOef6ZICq3s=
X-Google-Smtp-Source: APXvYqy480RdEP2Sf0SBRIyVT6kktYt2G5K3x4S3ceJgIYKlWXbQ0F7CWrgPbAcOsOOSt1Fsog5hZQ==
X-Received: by 2002:ac8:6984:: with SMTP id o4mr70277955qtq.122.1560351640277; 
 Wed, 12 Jun 2019 08:00:40 -0700 (PDT)
Received: from rosewood.cam.corp.google.com
 ([2620:0:1013:11:89c6:2139:5435:371d])
 by smtp.gmail.com with ESMTPSA id b5sm4470831qkk.45.2019.06.12.08.00.39
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Wed, 12 Jun 2019 08:00:39 -0700 (PDT)
From: Sean Paul <sean@poorly.run>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm: Tweak drm_encoder_helper_funcs.enable kerneldoc
Date: Wed, 12 Jun 2019 11:00:34 -0400
Message-Id: <20190612150038.194843-1-sean@poorly.run>
X-Mailer: git-send-email 2.22.0.rc2.383.gf4fbbf30c2-goog
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=poorly.run; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ZBPf58QxPPuPYue1mt8WshrM290RBAIvY7SGkcWYYFM=;
 b=Kyb9IEtW/N4o8Q50tTNGdTDMa5Xke7ujpu/CNXfxjhA/HSczmo/PyukpYAn/kTWMx6
 lL04M2yNBY1vQjB+fPztsISqTdl5zcvQCm6BtiBW5/Ih6gUg+7DgBk1v1UXK5Kk7ZQx6
 Fb0+t6grzUjcBAXoXPC7fQzDzrGEW5R7+SEjHfcgiG1UNCGAnROsqK7hel4es8nqpFkG
 oMPYbmIwSo9rx4LzlVP1U69Jw5C3KnL5pRqucbyep1fb7EIvSTaEQ4Ba2nwSv53QIdqU
 zb4s5Ef7CY9WZX2MgI1X0QbsPLFGhaJUnDSRepPG/xOeu8gNfCMZAMk1ZsGIG9RQvBnq
 B9ew==
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
Cc: Maxime Ripard <maxime.ripard@bootlin.com>, Sean Paul <sean@poorly.run>,
 David Airlie <airlied@linux.ie>, Sean Paul <seanpaul@chromium.org>,
 Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogU2VhbiBQYXVsIDxzZWFucGF1bEBjaHJvbWl1bS5vcmc+CgpJIGNvcGllZCB0aGUga2Vy
bmVsZG9jIGZvciBlbmNvZGVyX2Z1bmNzLmF0b21pY19lbmFibGUgZnJvbSBlbmNvZGVyX2Z1bmNz
LmVuYWJsZQppbiBhIHJlY2VudCBwYXRjaCBbMV0uIFNhbSByaWdodGx5IHBvaW50ZWQgb3V0IGlu
IHRoZSByZXZpZXcgdGhhdCAiZm9yIHN5bW1ldHJ5CndpdGgiIHRleHQgaXMgYXdrd2FyZCBbMl0u
IFNvIGhlcmUncyBhIHBhdGNoIHRvIGZpeCB1cCB0aGUgc291cmNlIG9mIHRoZSBhd2t3YXJkCmxh
bmd1YWdlLgoKWzFdIGh0dHBzOi8vcGF0Y2h3b3JrLmZyZWVkZXNrdG9wLm9yZy9wYXRjaC9tc2dp
ZC8yMDE5MDYxMTE2MDg0NC4yNTc0OTgtMi1zZWFuQHBvb3JseS5ydW4KWzJdIGh0dHBzOi8vcGF0
Y2h3b3JrLmZyZWVkZXNrdG9wLm9yZy9wYXRjaC9tc2dpZC8yMDE5MDYxMTE4NTM1Mi5HQTE2MzA1
QHJhdm5ib3JnLm9yZwoKU3VnZ2VzdGVkLWJ5OiBTYW0gUmF2bmJvcmcgPHNhbUByYXZuYm9yZy5v
cmc+ClNpZ25lZC1vZmYtYnk6IFNlYW4gUGF1bCA8c2VhbnBhdWxAY2hyb21pdW0ub3JnPgotLS0K
IGluY2x1ZGUvZHJtL2RybV9tb2Rlc2V0X2hlbHBlcl92dGFibGVzLmggfCAxMCArKysrKy0tLS0t
CiAxIGZpbGUgY2hhbmdlZCwgNSBpbnNlcnRpb25zKCspLCA1IGRlbGV0aW9ucygtKQoKZGlmZiAt
LWdpdCBhL2luY2x1ZGUvZHJtL2RybV9tb2Rlc2V0X2hlbHBlcl92dGFibGVzLmggYi9pbmNsdWRl
L2RybS9kcm1fbW9kZXNldF9oZWxwZXJfdnRhYmxlcy5oCmluZGV4IGY5Yzk0YzJhMTM2NDYuLmRm
ODAxMzFiYjEwZmMgMTAwNjQ0Ci0tLSBhL2luY2x1ZGUvZHJtL2RybV9tb2Rlc2V0X2hlbHBlcl92
dGFibGVzLmgKKysrIGIvaW5jbHVkZS9kcm0vZHJtX21vZGVzZXRfaGVscGVyX3Z0YWJsZXMuaApA
QCAtNzE5LDExICs3MTksMTEgQEAgc3RydWN0IGRybV9lbmNvZGVyX2hlbHBlcl9mdW5jcyB7CiAJ
ICogaG9va3MgYW5kIGNhbGwgdGhlbSBmcm9tIENSVEMncyBjYWxsYmFjayBieSBsb29waW5nIG92
ZXIgYWxsIGVuY29kZXJzCiAJICogY29ubmVjdGVkIHRvIGl0IHVzaW5nIGZvcl9lYWNoX2VuY29k
ZXJfb25fY3J0YygpLgogCSAqCi0JICogVGhpcyBob29rIGlzIHVzZWQgb25seSBieSBhdG9taWMg
aGVscGVycywgZm9yIHN5bW1ldHJ5IHdpdGggQGRpc2FibGUuCi0JICogQXRvbWljIGRyaXZlcnMg
ZG9uJ3QgbmVlZCB0byBpbXBsZW1lbnQgaXQgaWYgdGhlcmUncyBubyBuZWVkIHRvCi0JICogZW5h
YmxlIGFueXRoaW5nIGF0IHRoZSBlbmNvZGVyIGxldmVsLiBUbyBlbnN1cmUgdGhhdCBydW50aW1l
IFBNIGhhbmRsaW5nCi0JICogKHVzaW5nIGVpdGhlciBEUE1TIG9yIHRoZSBuZXcgIkFDVElWRSIg
cHJvcGVydHkpIHdvcmtzCi0JICogQGVuYWJsZSBtdXN0IGJlIHRoZSBpbnZlcnNlIG9mIEBkaXNh
YmxlIGZvciBhdG9taWMgZHJpdmVycy4KKwkgKiBUaGlzIGhvb2sgaXMgb25seSB1c2VkIGJ5IGF0
b21pYyBoZWxwZXJzLCBpdCBpcyB0aGUgb3Bwb3NpdGUgb2YKKwkgKiBAZGlzYWJsZS4gQXRvbWlj
IGRyaXZlcnMgZG9uJ3QgbmVlZCB0byBpbXBsZW1lbnQgaXQgaWYgdGhlcmUncyBubworCSAqIG5l
ZWQgdG8gZW5hYmxlIGFueXRoaW5nIGF0IHRoZSBlbmNvZGVyIGxldmVsLiBUbyBlbnN1cmUgdGhh
dAorCSAqIHJ1bnRpbWUgUE0gaGFuZGxpbmcgKHVzaW5nIGVpdGhlciBEUE1TIG9yIHRoZSBuZXcg
IkFDVElWRSIgcHJvcGVydHkpCisJICogd29ya3MgQGVuYWJsZSBtdXN0IGJlIHRoZSBpbnZlcnNl
IG9mIEBkaXNhYmxlIGZvciBhdG9taWMgZHJpdmVycy4KIAkgKi8KIAl2b2lkICgqZW5hYmxlKShz
dHJ1Y3QgZHJtX2VuY29kZXIgKmVuY29kZXIpOwogCi0tIApTZWFuIFBhdWwsIFNvZnR3YXJlIEVu
Z2luZWVyLCBHb29nbGUgLyBDaHJvbWl1bSBPUwoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4v
bGlzdGluZm8vZHJpLWRldmVs
