Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EA3F3BFE4
	for <lists+dri-devel@lfdr.de>; Tue, 11 Jun 2019 01:37:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B99B2890B4;
	Mon, 10 Jun 2019 23:37:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com
 [IPv6:2607:f8b0:4864:20::642])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7ED17890B4
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Jun 2019 23:37:44 +0000 (UTC)
Received: by mail-pl1-x642.google.com with SMTP id go2so4247370plb.9
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Jun 2019 16:37:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=PwvhwkI8F4zvLVsJwAGnKk3UZTvA+WVT+qCBY1uqWqg=;
 b=hfUUEcyYAyLHNny/TCD9vJA1mfdnwx0nvvuDjmlgsGlM72BE2GOUzV+Uaf280XT2lI
 Mw0/Jt30PNDjKTskX6UiA7drmXnpt6n7h82Ia+wJRZHXzoEJiBTycIXIigE6IuwToUP8
 AMNxtLUbtOLZJcLy4igdoRjp8mDPOSFo0YC1j4t85Z6NHb2xKTRotpcHEJ/7ldjq4mYS
 hdPWbPVcame6k7jG603I8Y/1BiadO4xBxgPvhkqLe5ciESGUouoGMWBieuW5HSydavIE
 rJMnguH2NmCgVMWd3yVQtpjHaUh0xTY6S3QegyonqVUck1KP170iYBndj0zg/W8j1GlJ
 4YiA==
X-Gm-Message-State: APjAAAUfMmX5H3G9TtWB6YDs4k7r1Lg8vxzIHjLCzxN0fqmO0s9l9LG/
 nUXJvKASLFzOF0D0Je7iCQ5ndg==
X-Google-Smtp-Source: APXvYqxzuWk+HHUFs0uzAZUj3UB9CiltN6z/LVO8neBboHeE9VutR2V17/0JmmVYiipinsqCD9j37w==
X-Received: by 2002:a17:902:7581:: with SMTP id
 j1mr72670630pll.23.1560209864163; 
 Mon, 10 Jun 2019 16:37:44 -0700 (PDT)
Received: from localhost ([2620:15c:202:1:75a:3f6e:21d:9374])
 by smtp.gmail.com with ESMTPSA id q144sm8898518pfc.103.2019.06.10.16.37.43
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 10 Jun 2019 16:37:43 -0700 (PDT)
From: Matthias Kaehlcke <mka@chromium.org>
To: Lee Jones <lee.jones@linaro.org>,
 Daniel Thompson <daniel.thompson@linaro.org>,
 Jingoo Han <jingoohan1@gmail.com>,
 Jacek Anaszewski <jacek.anaszewski@gmail.com>, Pavel Machek <pavel@ucw.cz>,
 Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>
Subject: [PATCH 1/2] dt-bindings: pwm-backlight: Add 'max-brightness' property
Date: Mon, 10 Jun 2019 16:37:38 -0700
Message-Id: <20190610233739.29477-1-mka@chromium.org>
X-Mailer: git-send-email 2.22.0.rc2.383.gf4fbbf30c2-goog
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=PwvhwkI8F4zvLVsJwAGnKk3UZTvA+WVT+qCBY1uqWqg=;
 b=hijO8nHj6AanoC+to/aLESdGAjYajAq/Wwo6ROP8Jh065ysj+O/VWUY+CjGk1QGNLO
 Nzjj4CGR7IV5n0DZhEvJ8T9VttRm3HNbJ8f655p8CVolKCbEHYeRHF0Q7pT55hBt7oMM
 UA5ufOa5wv1gkQHsFvqsinxJo7kP1Tysa/l1g=
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
Cc: devicetree@vger.kernel.org, linux-fbdev@vger.kernel.org,
 linux-pwm@vger.kernel.org, Brian Norris <briannorris@chromium.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Douglas Anderson <dianders@chromium.org>, Matthias Kaehlcke <mka@chromium.org>,
 linux-leds@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QWRkIGFuIG9wdGlvbmFsICdtYXgtYnJpZ2h0bmVzcycgcHJvcGVydHksIHdoaWNoIGlzIHVzZWQg
dG8gc3BlY2lmeQp0aGUgbnVtYmVyIG9mIGJyaWdodG5lc3MgbGV2ZWxzIChtYXgtYnJpZ2h0bmVz
cyArIDEpIHdoZW4gdGhlIG5vZGUKaGFzIG5vICdicmlnaHRuZXNzLWxldmVscycgdGFibGUuCgpT
aWduZWQtb2ZmLWJ5OiBNYXR0aGlhcyBLYWVobGNrZSA8bWthQGNocm9taXVtLm9yZz4KLS0tCiAu
Li4vZGV2aWNldHJlZS9iaW5kaW5ncy9sZWRzL2JhY2tsaWdodC9wd20tYmFja2xpZ2h0LnR4dCAg
ICAgICB8IDMgKysrCiAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0
IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2xlZHMvYmFja2xpZ2h0L3B3bS1i
YWNrbGlnaHQudHh0IGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2xlZHMvYmFj
a2xpZ2h0L3B3bS1iYWNrbGlnaHQudHh0CmluZGV4IDY0ZmEyZmJkOThjOS4uOThmNGJhNjI2MDU0
IDEwMDY0NAotLS0gYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbGVkcy9iYWNr
bGlnaHQvcHdtLWJhY2tsaWdodC50eHQKKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2Jp
bmRpbmdzL2xlZHMvYmFja2xpZ2h0L3B3bS1iYWNrbGlnaHQudHh0CkBAIC0yNyw2ICsyNyw5IEBA
IE9wdGlvbmFsIHByb3BlcnRpZXM6CiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgcmVzb2x1
dGlvbiBwd20gZHV0eSBjeWNsZSBjYW4gYmUgdXNlZCB3aXRob3V0CiAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgaGF2aW5nIHRvIGxpc3Qgb3V0IGV2ZXJ5IHBvc3NpYmxlIHZhbHVlIGluIHRo
ZQogICAgICAgICAgICAgICAgICAgICAgICAgICAgIGJyaWdodG5lc3MtbGV2ZWwgYXJyYXkuCisg
IC0gbWF4LWJyaWdodG5lc3M6IE1heGltdW0gYnJpZ2h0bmVzcyB2YWx1ZS4gVXNlZCB0byBzcGVj
aWZ5IHRoZSBudW1iZXIgb2YKKyAgICAgICAgICAgICAgICAgICAgYnJpZ2h0bmVzcyBsZXZlbHMg
KG1heC1icmlnaHRuZXNzICsgMSkgd2hlbiB0aGUgbm9kZQorICAgICAgICAgICAgICAgICAgICBo
YXMgbm8gJ2JyaWdodG5lc3MtbGV2ZWxzJyB0YWJsZS4KIAogWzBdOiBEb2N1bWVudGF0aW9uL2Rl
dmljZXRyZWUvYmluZGluZ3MvcHdtL3B3bS50eHQKIFsxXTogRG9jdW1lbnRhdGlvbi9kZXZpY2V0
cmVlL2JpbmRpbmdzL2dwaW8vZ3Bpby50eHQKLS0gCjIuMjIuMC5yYzIuMzgzLmdmNGZiYmYzMGMy
LWdvb2cKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRy
aS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRw
czovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
