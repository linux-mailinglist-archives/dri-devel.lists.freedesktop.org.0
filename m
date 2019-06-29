Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 381AE5AB2D
	for <lists+dri-devel@lfdr.de>; Sat, 29 Jun 2019 15:01:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA2F16E9A1;
	Sat, 29 Jun 2019 13:01:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com
 [IPv6:2a00:1450:4864:20::141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE8346E9A1
 for <dri-devel@lists.freedesktop.org>; Sat, 29 Jun 2019 13:01:54 +0000 (UTC)
Received: by mail-lf1-x141.google.com with SMTP id u10so5716517lfm.12
 for <dri-devel@lists.freedesktop.org>; Sat, 29 Jun 2019 06:01:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=DbpuIcCBG2OY5e1NmpBE7wz6kAerHOIPdrXSJOYlBOk=;
 b=r/TqHfbZnp/QIa9RowfMVnpynUk+dJtvYOnRWr8w+15wzHuYqzIeD3dBFDeaATccJJ
 eAbPSnaHN2j5RZT/VOZENU9kYktHhkuVsNpwCwQqNCWv258l3Dfp7i7jyfjPKSf/pYJe
 MtXfU3Azwb1dKEgYaPNuCzAVpCU0oZNCHvYRWweQuSRIj6jLNgqCruX2foZI0f84LMpM
 0UcJRU1pniI7G3XMPVACA2g9Vz5D3S+2u/jq5QJnLTV0vSKC2BYPclNeuPodz4EtBE08
 mcI0U3jM4mJ+tZXWPBstH9k1o8NuWLD5kL0xUJJnDPh3RMh6GEluY3RBnn3DPM/hp0lQ
 z8+A==
X-Gm-Message-State: APjAAAWQuTi5i6H34p628Id8jE15xmtiXm9D9Ivv2ocbUWdqMTPB+i9J
 NDFf6LKtcg+iU2RgSwSFDa1W0fs2DEDHTw==
X-Google-Smtp-Source: APXvYqwOS0pDKXe1RTOO0fPQa8iQngPginDmqxsbSy4gahwb7Y9qnEGHUp2+11mR/5U04XqewQh3gw==
X-Received: by 2002:ac2:5636:: with SMTP id b22mr4172787lff.2.1561813313145;
 Sat, 29 Jun 2019 06:01:53 -0700 (PDT)
Received: from localhost.localdomain
 (c-22cd225c.014-348-6c756e10.bbcust.telenor.se. [92.34.205.34])
 by smtp.gmail.com with ESMTPSA id v2sm1354500lfi.52.2019.06.29.06.01.51
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Sat, 29 Jun 2019 06:01:51 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
To: dri-devel@lists.freedesktop.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <maxime.ripard@bootlin.com>, Sean Paul <sean@poorly.run>
Subject: [PATCH 1/7] drm/msm/mdp4: Drop unused GPIO include
Date: Sat, 29 Jun 2019 14:59:27 +0200
Message-Id: <20190629125933.679-1-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=DbpuIcCBG2OY5e1NmpBE7wz6kAerHOIPdrXSJOYlBOk=;
 b=efVnvG6gsnh3l0XcsGPL7A1HnlxKgumwKIBMGtiqOMwHhdusEpWZaOWf+MqEF7BL5W
 WqbtG12LDpX6unXqMqDWTdVfM4zRrQmh4gqLzTx89lJEYR79woEb8W89uVlvW7MlFHEL
 Zp08PLKv6Na6vEgUdeNTUl5SJw8p7T4ZPUq94KcIME4V87xJpVQbKIHwoCK6jGRKWDu3
 Ngbb1bNlSk8+QAUVLVkhjTR0J8X3cz7gs99b/MC0wyJ4D28Wm9EDPnT2vEzHjH3XqEc/
 mhWNLYEUuhbeHtzFK/maFVDyz7mEP4hs1UZ+jfHb6VE7oiGbwu1a/LhUoF08NL8U/zFo
 qWJA==
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
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhpcyBmaWxlIGlzIG5vdCB1c2luZyBhbnkgc3ltYm9scyBmcm9tIDxsaW51eC9ncGlvLmg+IHNv
IGp1c3QKZHJvcCB0aGlzIGluY2x1ZGUuCgpDYzogUm9iIENsYXJrIDxyb2JkY2xhcmtAZ21haWwu
Y29tPgpDYzogU2VhbiBQYXVsIDxzZWFuQHBvb3JseS5ydW4+CkNjOiBsaW51eC1hcm0tbXNtQHZn
ZXIua2VybmVsLm9yZwpDYzogZnJlZWRyZW5vQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpTaWduZWQt
b2ZmLWJ5OiBMaW51cyBXYWxsZWlqIDxsaW51cy53YWxsZWlqQGxpbmFyby5vcmc+Ci0tLQogZHJp
dmVycy9ncHUvZHJtL21zbS9kaXNwL21kcDQvbWRwNF9sdmRzX2Nvbm5lY3Rvci5jIHwgMiAtLQog
MSBmaWxlIGNoYW5nZWQsIDIgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUv
ZHJtL21zbS9kaXNwL21kcDQvbWRwNF9sdmRzX2Nvbm5lY3Rvci5jIGIvZHJpdmVycy9ncHUvZHJt
L21zbS9kaXNwL21kcDQvbWRwNF9sdmRzX2Nvbm5lY3Rvci5jCmluZGV4IDUzNjhlNjIxOTk5Yy4u
NzUzNTc5OTE0ZDBjIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vbXNtL2Rpc3AvbWRwNC9t
ZHA0X2x2ZHNfY29ubmVjdG9yLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL21zbS9kaXNwL21kcDQv
bWRwNF9sdmRzX2Nvbm5lY3Rvci5jCkBAIC0xNiw4ICsxNiw2IEBACiAgKiB0aGlzIHByb2dyYW0u
ICBJZiBub3QsIHNlZSA8aHR0cDovL3d3dy5nbnUub3JnL2xpY2Vuc2VzLz4uCiAgKi8KIAotI2lu
Y2x1ZGUgPGxpbnV4L2dwaW8uaD4KLQogI2luY2x1ZGUgIm1kcDRfa21zLmgiCiAKIHN0cnVjdCBt
ZHA0X2x2ZHNfY29ubmVjdG9yIHsKLS0gCjIuMjAuMQoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxt
YW4vbGlzdGluZm8vZHJpLWRldmVs
