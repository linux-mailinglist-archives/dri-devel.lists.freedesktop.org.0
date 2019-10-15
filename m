Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E2624D70F3
	for <lists+dri-devel@lfdr.de>; Tue, 15 Oct 2019 10:28:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B1676E637;
	Tue, 15 Oct 2019 08:28:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com
 [IPv6:2a00:1450:4864:20::241])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 01E416E63B
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Oct 2019 08:28:20 +0000 (UTC)
Received: by mail-lj1-x241.google.com with SMTP id d1so19241315ljl.13
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Oct 2019 01:28:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ojxDAKRAwmMHLlwEWcHkwv5aBgxTmWdQ8UAjvDvF2+E=;
 b=cmb0XdFTgPMD9c5HoJDK/43ymzhjXQefu1l3nreGTR5U7SbFaUczN+OUmrgbHVz727
 M822Z5nogJdtdFScqoK+JGokX9Rh7rXu006pUZW7JnzdpdAHPrLoxr8rSc8rAYl3kbuW
 Xvhgu0t4riZTXxNGVN05l5mks/crxtAlIl9holEEGXW1rSdekamyHq/1ZH9SyC53ifd9
 eEb+OxUYb3snJbx/zw49s1ei7duvNTEc6Etk2aPkRPUHjYcudjtkkY0MxnVhGj9OTxkC
 sHwF9C5bg+c1puYf44PWAKkerYRtm9QpXqBEoxIq2FjuITq8EkAFF2Mmmre8XXFt73B8
 SpkQ==
X-Gm-Message-State: APjAAAWVku4pwpxWhbb5FYRCp/3Fxj3Jsp4+FtkHppuUYl9iIrrWymc7
 M8uUaxd9ZlpaZVlc7aF/7iLg4w==
X-Google-Smtp-Source: APXvYqzDkQgGT1n6ThwoF7yrpLrPAh0E0UZJfbX1JMKM7bjfcjUYM9NPCKUXvhni2IG27r5c5Qxoiw==
X-Received: by 2002:a2e:81cf:: with SMTP id s15mr1954918ljg.99.1571128098821; 
 Tue, 15 Oct 2019 01:28:18 -0700 (PDT)
Received: from genomnajs.ideon.se ([85.235.10.227])
 by smtp.gmail.com with ESMTPSA id y3sm4795141lji.53.2019.10.15.01.28.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Oct 2019 01:28:17 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
To: Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 dri-devel@lists.freedesktop.org
Subject: [PATCH 2/3 v2] drm/panel: Add DT bindings for Sony ACX424AKP
Date: Tue, 15 Oct 2019 10:28:10 +0200
Message-Id: <20191015082811.29497-2-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191015082811.29497-1-linus.walleij@linaro.org>
References: <20191015082811.29497-1-linus.walleij@linaro.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ojxDAKRAwmMHLlwEWcHkwv5aBgxTmWdQ8UAjvDvF2+E=;
 b=Gucr4GXfE5GksBaj71VaqL02FNvfq8GV9MZqWq1LQ+47lkJrmOaL9yIlB2gNTmg/RH
 A9BcR/eSA7g95P/LmFhnWRVK0e0CiAsXdusG1bjZRPq/znw4CLeCLe/PUXfSx2QtK8/7
 hf7C2ukdXYrVbb1DCwDtUWximRzWiTuepJ9hwLfHTe44cZ8Bqt/IJgzMZVSdQbgew3mE
 xp++urW+WtYSWs21i1X8H135FP9ueyv9ftdj1hJPXzE5CFI8TzjPKlR8PZG2TK4w/fLA
 7WBQGSPDqoKuFTgFOlbpA3JiRi6Dqo0FEvh9VSZAdM3QOdBD0Rox9RZRLJuBeqrFuBNb
 27ew==
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
Cc: devicetree@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhpcyBhZGRzIGRldmljZSB0cmVlIGJpbmRpbmdzIGZvciB0aGUgU29ueSBBQ1g0MjRBS1AgcGFu
ZWwuCkxldCdzIHVzZSBZQU1MLgoKQ2M6IGRldmljZXRyZWVAdmdlci5rZXJuZWwub3JnClNpZ25l
ZC1vZmYtYnk6IExpbnVzIFdhbGxlaWogPGxpbnVzLndhbGxlaWpAbGluYXJvLm9yZz4KLS0tCkNo
YW5nZUxvZyB2MS0+djI6Ci0gU3VnZ2VzdCBhIHN0YW5kLWFsb25lIFlBTUwgYmluZGluZ3MgZmls
ZSBmb3IgRFNJIHBhbmVscyBpbgogIGEgc2VwYXJhdGUgcGF0Y2gsIGFuZCB1c2UgdGhhdCB0byBy
ZWZlcmVuY2UgdGhlCiAgYm9vbGVhbiAiZW5mb3JjZS12aWRlby1tb2RlIiBhdHRyaWJ1dGUgZm9y
IERTSSBwYW5lbHMKLS0tCiAuLi4vZGlzcGxheS9wYW5lbC9zb255LGFjeDQyNGFrcC55YW1sICAg
ICAgICAgfCA1MCArKysrKysrKysrKysrKysrKysrCiAxIGZpbGUgY2hhbmdlZCwgNTAgaW5zZXJ0
aW9ucygrKQogY3JlYXRlIG1vZGUgMTAwNjQ0IERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5k
aW5ncy9kaXNwbGF5L3BhbmVsL3NvbnksYWN4NDI0YWtwLnlhbWwKCmRpZmYgLS1naXQgYS9Eb2N1
bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9wYW5lbC9zb255LGFjeDQyNGFr
cC55YW1sIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvcGFuZWwv
c29ueSxhY3g0MjRha3AueWFtbApuZXcgZmlsZSBtb2RlIDEwMDY0NAppbmRleCAwMDAwMDAwMDAw
MDAuLjg0NDY2NWIwYzk1MwotLS0gL2Rldi9udWxsCisrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNl
dHJlZS9iaW5kaW5ncy9kaXNwbGF5L3BhbmVsL3NvbnksYWN4NDI0YWtwLnlhbWwKQEAgLTAsMCAr
MSw1MCBAQAorIyBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogKEdQTC0yLjAtb25seSBPUiBCU0Qt
Mi1DbGF1c2UpCislWUFNTCAxLjIKKy0tLQorJGlkOiBodHRwOi8vZGV2aWNldHJlZS5vcmcvc2No
ZW1hcy9kaXNwbGF5L3BhbmVsL3NvbnksYWN4NDI0YWtwLnlhbWwjCiskc2NoZW1hOiBodHRwOi8v
ZGV2aWNldHJlZS5vcmcvbWV0YS1zY2hlbWFzL2NvcmUueWFtbCMKKwordGl0bGU6IFNvbnkgQUNY
NDI0QUtQIDQiIDQ4MHg4NjQgQU1PTEVEIHBhbmVsCisKK21haW50YWluZXJzOgorICAtIExpbnVz
IFdhbGxlaWogPGxpbnVzLndhbGxlaWpAbGluYXJvLm9yZz4KKworYWxsT2Y6CisgIC0gJHJlZjog
cGFuZWwtY29tbW9uLnlhbWwjCisgIC0gJHJlZjogcGFuZWwtZHNpLWNvbW1vbi55YW1sIworCitw
cm9wZXJ0aWVzOgorICBjb21wYXRpYmxlOgorICAgIGNvbnN0OiBzb255LGFjeDQyNGFrcAorICBy
ZWc6IHRydWUKKyAgcG9ydDogdHJ1ZQorICByZXNldC1ncGlvczogdHJ1ZQorICB2ZGRpLXN1cHBs
eToKKyAgICAgZGVzY3JpcHRpb246IHJlZ3VsYXRvciB0aGF0IHN1cHBsaWVzIHRoZSB2ZGRpIHZv
bHRhZ2UKKyAgZW5mb3JjZS12aWRlby1tb2RlOiB0cnVlCisKK3JlcXVpcmVkOgorICAtIGNvbXBh
dGlibGUKKyAgLSByZWcKKyAgLSBwb3J0CisgIC0gcmVzZXQtZ3Bpb3MKKyAgLSBwb3dlci1zdXBw
bHkKKworYWRkaXRpb25hbFByb3BlcnRpZXM6IGZhbHNlCisKK2V4YW1wbGVzOgorICAtIHwKKyAg
ICBwYW5lbEAwIHsKKyAgICAgICAgY29tcGF0aWJsZSA9ICJzb255LGFjeDQyNGFrcCI7CisgICAg
ICAgIHJlZyA9IDwwPjsKKyAgICAgICAgdmRkaS1zdXBwbHkgPSA8JmZvbz47CisgICAgICAgIHJl
c2V0LWdwaW9zID0gPCZmb29fZ3BpbyAwIEdQSU9fQUNUSVZFX0xPVz47CisKKyAgICAgICAgcG9y
dCB7CisgICAgICAgICAgICBwYW5lbF9pbjogZW5kcG9pbnQgeworICAgICAgICAgICAgICAgIHJl
bW90ZS1lbmRwb2ludCA9IDwmZHNpX291dD47CisgICAgICAgICAgICB9OworICAgICAgICB9Owor
ICAgIH07CisKKy4uLgpcIE5vIG5ld2xpbmUgYXQgZW5kIG9mIGZpbGUKLS0gCjIuMjEuMAoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1h
aWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
