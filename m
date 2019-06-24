Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B81A51C52
	for <lists+dri-devel@lfdr.de>; Mon, 24 Jun 2019 22:31:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A2BED89CF3;
	Mon, 24 Jun 2019 20:31:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com
 [IPv6:2607:f8b0:4864:20::642])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B2DF489CF3
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jun 2019 20:31:20 +0000 (UTC)
Received: by mail-pl1-x642.google.com with SMTP id ay6so7506193plb.9
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jun 2019 13:31:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=p8eKR4sWGzU8LALqN+Rywpmmy+C9BMm/CB6qnIMC0UI=;
 b=SSfOKe5RrTkxJBnUc9jKBE1cU0ccfA6WxFFtsho12Lm0XG0aPipmY88kYrrIcENzG3
 L5kn1UDOiWXPH581wzFUGn2XjnBItzUmxNvDwfiCnSp0ICKovoYLHz6WneEK1kfJ7Vhp
 /zxtULaXQ1c4sW+S2vS53MA9ao9Ae0v0VVRvK1XD44M0qNpQjwds1yQoaGQv2kN3FGjY
 kJ05dyjGiKp2hpLEYQwNu135I9QLkK+uiVhVwvhSKJpDlYUTtewjU/Pu3+UBIegrajTL
 8a3zidZzRS1coiuCgHhHdsYEt9oAvVciOTLsxy8jjd6be+csxI8gcPZvmGH8tChmDDji
 AxgA==
X-Gm-Message-State: APjAAAV62l9kh4blPPStmVBRw6FYqdz9yKUsd69nP4P5Lltsar9o9vbd
 tjVw+wphsWc8yYoC9VffqQY07w==
X-Google-Smtp-Source: APXvYqzBKihWAttr4Rykcb5BT7S4M6tWgTs4LN43nmmOkYIKYPwMKpzMISvKirmoiIp5hny8kMFQzQ==
X-Received: by 2002:a17:902:d916:: with SMTP id
 c22mr20031582plz.195.1561408280395; 
 Mon, 24 Jun 2019 13:31:20 -0700 (PDT)
Received: from localhost ([2620:15c:202:1:75a:3f6e:21d:9374])
 by smtp.gmail.com with ESMTPSA id u128sm15650127pfu.26.2019.06.24.13.31.19
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 24 Jun 2019 13:31:19 -0700 (PDT)
From: Matthias Kaehlcke <mka@chromium.org>
To: Thierry Reding <thierry.reding@gmail.com>,
 Lee Jones <lee.jones@linaro.org>,
 Daniel Thompson <daniel.thompson@linaro.org>,
 Jingoo Han <jingoohan1@gmail.com>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Subject: [PATCH v2 0/4] backlight: Expose brightness curve type through sysfs
Date: Mon, 24 Jun 2019 13:31:09 -0700
Message-Id: <20190624203114.93277-1-mka@chromium.org>
X-Mailer: git-send-email 2.22.0.410.gd8fdbe21b5-goog
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=p8eKR4sWGzU8LALqN+Rywpmmy+C9BMm/CB6qnIMC0UI=;
 b=OerfV0snZfWTKFe6g+LZSlNlk+hlaRZTYdkXi6xFzubIfsuYRqrR478es590r/uipG
 Za9cOfVOlS/Tx8biMdxBPavuRBtuFpD5DqsfSl4Frr5uGAgXHd9EfJPHv7PHPKGz5ykf
 Ha81o5GREDJwrbSfWGjsmCtO9Dqm7iWDvuM8g=
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
Cc: linux-pwm@vger.kernel.org, linux-fbdev@vger.kernel.org,
 Brian Norris <briannorris@chromium.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Douglas Anderson <dianders@chromium.org>,
 Matthias Kaehlcke <mka@chromium.org>,
 Jacek Anaszewski <jacek.anaszewski@gmail.com>, Pavel Machek <pavel@ucw.cz>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QmFja2xpZ2h0IGJyaWdodG5lc3MgY3VydmVzIGNhbiBoYXZlIGRpZmZlcmVudCBzaGFwZXMuIFRo
ZSB0d28gbWFpbgp0eXBlcyBhcmUgbGluZWFyIGFuZCBub24tbGluZWFyIGN1cnZlcy4gVGhlIGh1
bWFuIGV5ZSBkb2Vzbid0CnBlcmNlaXZlIGxpbmVhcmx5IGluY3JlYXNpbmcvZGVjcmVhc2luZyBi
cmlnaHRuZXNzIGFzIGxpbmVhciAoc2VlCmFsc28gODhiYTk1YmVkYjc5ICJiYWNrbGlnaHQ6IHB3
bV9ibDogQ29tcHV0ZSBicmlnaHRuZXNzIG9mIExFRApsaW5lYXJseSB0byBodW1hbiBleWUiKSwg
aGVuY2UgbWFueSBiYWNrbGlnaHRzIHVzZSBub24tbGluZWFyIChvZnRlbgpsb2dhcml0aG1pYykg
YnJpZ2h0bmVzcyBjdXJ2ZXMuIFRoZSB0eXBlIG9mIGN1cnZlIGlzIGN1cnJlbnRseSBvcGFxdWUK
dG8gdXNlcnNwYWNlLCBzbyB1c2Vyc3BhY2Ugb2Z0ZW4gcmVsaWVzIG9uIG1vcmUgb3IgbGVzcyBy
ZWxpYWJsZQpoZXVyaXN0aWNzIChsaWtlIHRoZSBudW1iZXIgb2YgYnJpZ2h0bmVzcyBsZXZlbHMp
IHRvIGRlY2lkZSB3aGV0aGVyCnRvIHRyZWF0IGEgYmFja2xpZ2h0IGRldmljZSBhcyBsaW5lYXIg
b3Igbm9uLWxpbmVhci4KCkV4cG9ydCB0aGUgdHlwZSBvZiB0aGUgYnJpZ2h0bmVzcyBjdXJ2ZSB2
aWEgYSBuZXcgc3lzZnMgYXR0cmlidXRlLgoKTWF0dGhpYXMgS2FlaGxja2UgKDQpOgogIE1BSU5U
QUlORVJTOiBBZGQgZW50cnkgZm9yIHN0YWJsZSBiYWNrbGlnaHQgc3lzZnMgQUJJIGRvY3VtZW50
YXRpb24KICBiYWNrbGlnaHQ6IEV4cG9zZSBicmlnaHRuZXNzIGN1cnZlIHR5cGUgdGhyb3VnaCBz
eXNmcwogIGJhY2tsaWdodDogcHdtX2JsOiBTZXQgc2NhbGUgdHlwZSBmb3IgQ0lFIDE5MzEgY3Vy
dmVzCiAgYmFja2xpZ2h0OiBwd21fYmw6IFNldCBzY2FsZSB0eXBlIGZvciBicmlnaHRuZXNzIGN1
cnZlcyBzcGVjaWZpZWQgaW4KICAgIHRoZSBEVAoKIC4uLi9BQkkvdGVzdGluZy9zeXNmcy1jbGFz
cy1iYWNrbGlnaHQgICAgICAgICB8IDMyICsrKysrKysrKysrKysrKysrCiBNQUlOVEFJTkVSUyAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAgMiArKwogZHJpdmVycy92aWRlby9i
YWNrbGlnaHQvYmFja2xpZ2h0LmMgICAgICAgICAgIHwgMjEgKysrKysrKysrKysKIGRyaXZlcnMv
dmlkZW8vYmFja2xpZ2h0L3B3bV9ibC5jICAgICAgICAgICAgICB8IDM1ICsrKysrKysrKysrKysr
KysrKy0KIGluY2x1ZGUvbGludXgvYmFja2xpZ2h0LmggICAgICAgICAgICAgICAgICAgICB8IDEw
ICsrKysrKwogNSBmaWxlcyBjaGFuZ2VkLCA5OSBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0p
CiBjcmVhdGUgbW9kZSAxMDA2NDQgRG9jdW1lbnRhdGlvbi9BQkkvdGVzdGluZy9zeXNmcy1jbGFz
cy1iYWNrbGlnaHQKCi0tIAoyLjIyLjAuNDEwLmdkOGZkYmUyMWI1LWdvb2cKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxp
c3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNr
dG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
