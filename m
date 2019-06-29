Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 60DEF5AB35
	for <lists+dri-devel@lfdr.de>; Sat, 29 Jun 2019 15:02:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F1296E9A6;
	Sat, 29 Jun 2019 13:02:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com
 [IPv6:2a00:1450:4864:20::141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB7FA6E9A2
 for <dri-devel@lists.freedesktop.org>; Sat, 29 Jun 2019 13:01:57 +0000 (UTC)
Received: by mail-lf1-x141.google.com with SMTP id u10so5716578lfm.12
 for <dri-devel@lists.freedesktop.org>; Sat, 29 Jun 2019 06:01:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=AJIo1pqQ+aFujHuHdql1oLAKsZ6dcOAKCD+S+KrStQg=;
 b=Y65VmWfARuXIOnUpDgM4ZIxlMFGgOxAh6VwRQ/ZzLlXVsB//KtPvnfYNDBdAWAdFom
 7G125RBnxYtiG7EPjoNFrUz5PYyIer+eiDgcwGEemfAp7UhtufJF1+7ogfTTjNZrNzOU
 83zXzmIbyHg8tv3/pwn5plYjpNQreOvN5nZFS6hupAG0F/KKJghy7qAwhZ65oL3dYepy
 CjOk+HDP61wVO5tvBVsWrc6jovYjHzX2alX+L9yJFzRqrQgNCYar6pdjd6vsRkU+l6L/
 PULv18GS9Av06k0h7idlFJboVzgcPoolcI6o+M3D3yWfiH6Lf0me0M+M2RtywpvvDvc9
 n6WQ==
X-Gm-Message-State: APjAAAXy7WZ4YFXJinA1aTU6BaVkbkEQZZF2IA1CcEd6vRJUeM9iOOuK
 LV/V58MIXBSQUITIGtqoIoNduJIVNCqudg==
X-Google-Smtp-Source: APXvYqxvXt6L2Ml1QCW1/zH7Sv4F1tQcoxTHgqupuETmPxNbTlWyt0OHygO+Xy9Hh1ch7/orM4lZPw==
X-Received: by 2002:ac2:4c29:: with SMTP id u9mr7457510lfq.100.1561813316205; 
 Sat, 29 Jun 2019 06:01:56 -0700 (PDT)
Received: from localhost.localdomain
 (c-22cd225c.014-348-6c756e10.bbcust.telenor.se. [92.34.205.34])
 by smtp.gmail.com with ESMTPSA id v2sm1354500lfi.52.2019.06.29.06.01.54
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Sat, 29 Jun 2019 06:01:55 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
To: dri-devel@lists.freedesktop.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <maxime.ripard@bootlin.com>, Sean Paul <sean@poorly.run>
Subject: [PATCH 2/7] drm/msm/dsi: Drop unused GPIO includes
Date: Sat, 29 Jun 2019 14:59:28 +0200
Message-Id: <20190629125933.679-2-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190629125933.679-1-linus.walleij@linaro.org>
References: <20190629125933.679-1-linus.walleij@linaro.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=AJIo1pqQ+aFujHuHdql1oLAKsZ6dcOAKCD+S+KrStQg=;
 b=zQR54iAbGadX7yH6kb/W+A9Ev+FFwoc/g484x0VCE13ChTt4OVnLxuK03gAMFIhnUl
 a2s9RA8N93ziUXqxC4ZQbtiqRFq5+YrhUohrwTtL4UjNSSpUwjpJVTsnP5ztF+7mGcoD
 MaLZSwY/+wrc+Mrx1HIJcScmiCGvWqe6rIh6byJLfnq4HXzuuJHQwbH2tIrOgDiQcz99
 WHgvK5QzlgPMcFkkbQyB3iRjkDA2stc0/LSp4lugHsNtNHuQ4txm7SxP3GBg7pAGpzfw
 p4YL7ENLxHbwJB3rq3EQNAMUYHxs7zQQYNqFGvNcxySTPkzYoXSaECdplNiqhLg377rK
 dzeg==
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

VGhpcyBEU0kgZHJpdmVyIHVzZXMgdGhlIG5ldyBkZXNjcmlwdG9yIEFQSSBzbyB0aGVzZSBvbGQK
R1BJTyBBUEkgaW5jbHVkZXMgYXJlIHN1cnBsdXMuCgpDYzogUm9iIENsYXJrIDxyb2JkY2xhcmtA
Z21haWwuY29tPgpDYzogU2VhbiBQYXVsIDxzZWFuQHBvb3JseS5ydW4+CkNjOiBsaW51eC1hcm0t
bXNtQHZnZXIua2VybmVsLm9yZwpDYzogZnJlZWRyZW5vQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpT
aWduZWQtb2ZmLWJ5OiBMaW51cyBXYWxsZWlqIDxsaW51cy53YWxsZWlqQGxpbmFyby5vcmc+Ci0t
LQogZHJpdmVycy9ncHUvZHJtL21zbS9kc2kvZHNpX2hvc3QuYyB8IDIgLS0KIDEgZmlsZSBjaGFu
Z2VkLCAyIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9tc20vZHNp
L2RzaV9ob3N0LmMgYi9kcml2ZXJzL2dwdS9kcm0vbXNtL2RzaS9kc2lfaG9zdC5jCmluZGV4IDYx
MDE4M2RiMWRhZi4uZDQ0YmFkMTNjYmFmIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vbXNt
L2RzaS9kc2lfaG9zdC5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9tc20vZHNpL2RzaV9ob3N0LmMK
QEAgLTE0LDExICsxNCw5IEBACiAjaW5jbHVkZSA8bGludXgvY2xrLmg+CiAjaW5jbHVkZSA8bGlu
dXgvZGVsYXkuaD4KICNpbmNsdWRlIDxsaW51eC9lcnIuaD4KLSNpbmNsdWRlIDxsaW51eC9ncGlv
Lmg+CiAjaW5jbHVkZSA8bGludXgvZ3Bpby9jb25zdW1lci5oPgogI2luY2x1ZGUgPGxpbnV4L2lu
dGVycnVwdC5oPgogI2luY2x1ZGUgPGxpbnV4L29mX2RldmljZS5oPgotI2luY2x1ZGUgPGxpbnV4
L29mX2dwaW8uaD4KICNpbmNsdWRlIDxsaW51eC9vZl9pcnEuaD4KICNpbmNsdWRlIDxsaW51eC9w
aW5jdHJsL2NvbnN1bWVyLmg+CiAjaW5jbHVkZSA8bGludXgvb2ZfZ3JhcGguaD4KLS0gCjIuMjAu
MQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRl
dmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8v
bGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
