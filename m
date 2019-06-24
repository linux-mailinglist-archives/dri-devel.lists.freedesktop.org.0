Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 882D151F0C
	for <lists+dri-devel@lfdr.de>; Tue, 25 Jun 2019 01:20:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D51C789E35;
	Mon, 24 Jun 2019 23:20:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com
 [IPv6:2607:f8b0:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8CAA189E35
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jun 2019 23:20:31 +0000 (UTC)
Received: by mail-pf1-x442.google.com with SMTP id j2so8364601pfe.6
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jun 2019 16:20:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=CLMq9SkPZ0LrpMbu6uM6UrnywucO78/fC+4xJdWuUjU=;
 b=nO9P2kGNDWS/sj9vcAiplDJ4c05Ny44APrQ7CQaT579Z75FqPFuIOEPy2RHBrbFsNc
 YipCAxbAzUD2vi9A2K3TXq5sgcrM4mOoELUp5sENPj/SHM9nyNBf8z018A7A7Tu7hn32
 /J9YbktKr6c6xP+EUpJtEBW77+90Kxxxg6Uu2BnZy41h+AeBtz/lD2b995wyvKiw4/mC
 p6XmrHNvFMcWjKBxHbGBeAIBwRo9I6+a3bTLIfBgMIcb1BOBMs7dfdRasSkHQVSLEzKf
 SaVb9x2ZUvx88D5niFv3kCGMrKiNsDjEhqwtXcwVMIWCRXlEg3tMj6Tpiskyf3hKqGCS
 983Q==
X-Gm-Message-State: APjAAAXUd14qob64sKUW7eJit1E05qaQxXCYjPFwU2QH+1yBLljut5q2
 IpaEc7gFq/7CerIbuQCR4p/VnA==
X-Google-Smtp-Source: APXvYqw0AZKgg6EjKTiDXtbpUIU8qcxoTXpR5EwI5qJzAJRAtq9DzupQa5ZaWWS4hAxfXE0scVi4uw==
X-Received: by 2002:a63:c60:: with SMTP id 32mr13363428pgm.42.1561418431055;
 Mon, 24 Jun 2019 16:20:31 -0700 (PDT)
Received: from localhost ([2601:602:9200:a1a5:559b:6f10:667f:4354])
 by smtp.googlemail.com with ESMTPSA id m19sm1137712pjn.3.2019.06.24.16.20.30
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 24 Jun 2019 16:20:30 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: 86zhm782g5.fsf@baylibre.com, Neil Armstrong <narmstrong@baylibre.com>
Subject: Re: [PATCH 8/9] drm: meson: add macro used to enable HDMI PLL
In-Reply-To: <86o92n82e1.fsf@baylibre.com>
References: <86zhm782g5.fsf@baylibre.com> <86o92n82e1.fsf@baylibre.com>
Date: Mon, 24 Jun 2019 16:20:29 -0700
Message-ID: <7hwohawoxu.fsf@baylibre.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version;
 bh=CLMq9SkPZ0LrpMbu6uM6UrnywucO78/fC+4xJdWuUjU=;
 b=dLg/cSRkJPUZwFWpsP5zrU6X5hseY4oEeFd0LoCR7LGMnXqC0nzPoFAzqz9Y7u/41c
 PVqSleEbaPIgcPu0aCXcvA8ErwL0FqzRVDuGb0m2YwMJ9cLF7LbUaVxZP6q/2kesoXRK
 /jWxwhBmthWot8HMFhTMtiLMF/eWvtwCGW/6JkkiTuKr3iAewjAgK3i9kIFHThWf575k
 4wEOAr5iRNfUAvL3Xq4eB6rRA+mjQFjipz3E7czZd/g0cvHAaH3Btayr9Z60UV90p37m
 CkV51ozzeK7L+hUT1HzMKJCGHN2tVbrbHL8lyYsoK6oeRmrOC9eKXS9fiv1ZYUi9XD+Z
 9m5Q==
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
Cc: Julien Masson <jmasson@baylibre.com>, linux-amlogic@lists.infradead.org,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SnVsaWVuIE1hc3NvbiA8am1hc3NvbkBiYXlsaWJyZS5jb20+IHdyaXRlczoKCj4gVGhpcyBwYXRj
aCBhZGQgbmV3IG1hY3JvIEhISV9IRE1JX1BMTF9DTlRMX0VOIHdoaWNoIGlzIHVzZWQgdG8gZW5h
YmxlCj4gSERNSSBQTEwuCj4KPiBTaWduZWQtb2ZmLWJ5OiBKdWxpZW4gTWFzc29uIDxqbWFzc29u
QGJheWxpYnJlLmNvbT4KPiAtLS0KPiAgZHJpdmVycy9ncHUvZHJtL21lc29uL21lc29uX3ZjbGsu
YyB8IDMgKystCj4gIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24o
LSkKPgo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vbWVzb24vbWVzb25fdmNsay5jIGIv
ZHJpdmVycy9ncHUvZHJtL21lc29uL21lc29uX3ZjbGsuYwo+IGluZGV4IGU3YzJiNDM5ZDBmNy4u
YmU2ZTE1MmZjNzVhIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9tZXNvbi9tZXNvbl92
Y2xrLmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vbWVzb24vbWVzb25fdmNsay5jCj4gQEAgLTk2
LDYgKzk2LDcgQEAKPiAgI2RlZmluZSBISElfVkRBQ19DTlRMMQkJMHgyRjggLyogMHhiZSBvZmZz
ZXQgaW4gZGF0YSBzaGVldCAqLwo+ICAKPiAgI2RlZmluZSBISElfSERNSV9QTExfQ05UTAkweDMy
MCAvKiAweGM4IG9mZnNldCBpbiBkYXRhIHNoZWV0ICovCj4gKyNkZWZpbmUgSEhJX0hETUlfUExM
X0NOVExfRU4JQklUKDMwKQo+ICAjZGVmaW5lIEhISV9IRE1JX1BMTF9DTlRMMgkweDMyNCAvKiAw
eGM5IG9mZnNldCBpbiBkYXRhIHNoZWV0ICovCj4gICNkZWZpbmUgSEhJX0hETUlfUExMX0NOVEwz
CTB4MzI4IC8qIDB4Y2Egb2Zmc2V0IGluIGRhdGEgc2hlZXQgKi8KPiAgI2RlZmluZSBISElfSERN
SV9QTExfQ05UTDQJMHgzMkMgLyogMHhjYiBvZmZzZXQgaW4gZGF0YSBzaGVldCAqLwo+IEBAIC00
NjgsNyArNDY5LDcgQEAgdm9pZCBtZXNvbl9oZG1pX3BsbF9zZXRfcGFyYW1zKHN0cnVjdCBtZXNv
bl9kcm0gKnByaXYsIHVuc2lnbmVkIGludCBtLAo+ICAKPiAgCQkvKiBFbmFibGUgYW5kIHVucmVz
ZXQgKi8KPiAgCQlyZWdtYXBfdXBkYXRlX2JpdHMocHJpdi0+aGhpLCBISElfSERNSV9QTExfQ05U
TCwKPiAtCQkJCSAgIDB4NyA8PCAyOCwgMHg0IDw8IDI4KTsKPiArCQkJCSAgIDB4NyA8PCAyOCwg
SEhJX0hETUlfUExMX0NOVExfRU4pOwoKc3RpbGwgdXNpbmcgYSBtYWdpYyBjb25zdCBmb3IgdGhl
IG1hc2suICBDYW4gdXNlIEdFTk1BU0soKSBmb3IgdGhpcz8KCktldmluCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QK
ZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9w
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
