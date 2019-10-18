Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 78F8ADCDE8
	for <lists+dri-devel@lfdr.de>; Fri, 18 Oct 2019 20:25:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 874046EB84;
	Fri, 18 Oct 2019 18:25:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com
 [IPv6:2a00:1450:4864:20::243])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BAC9E6EB85
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Oct 2019 18:24:59 +0000 (UTC)
Received: by mail-lj1-x243.google.com with SMTP id m7so7186776lji.2
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Oct 2019 11:24:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=YYQD8ZjjV8FYWgYSkKKTS/qtO4T+D7cqMY9D6mPQHr8=;
 b=K67Q7k8BknAYbYoTQxfVerEQfcfVn2I/HlhbWIvTuLWnGvUgLwl2FJsvsyHMtszi0K
 0U5cXaeFtIwHY4DcQ8x+zCbywxlHZTkEn4EV7h/1/XCSq7WW1nDe6YKv48A9gq2pjl+h
 M0sl9E6+Yrk68DY8q/FQO9z1iUMYMEZ8dKP+2hYj3eUlFQzok1GBkOU7+jD9MxhnkGCu
 vqPC/6zTNFdHuddYRrVQd0Ay+31sW3ae/lOaUzM0TgrvvUWlaiO4bMWTeG45lxD4V0oL
 P1ytC0FGUEptwSLOa9Er5AgkIIrL11h3tOqLELruRXrk8H9blsEMPGlwTqM3z4eEcndZ
 XYLw==
X-Gm-Message-State: APjAAAWvax1/702cxVLH1LyA2aZ1nOzcujp9ZSr+liODlDcH+s2t+Sw7
 D8L8bmQWo5j5h9UbyaWAuAWnYA==
X-Google-Smtp-Source: APXvYqxtc8ZUeBcK8hiA5gxckfrSmYQjAwIJX8pQ/ZT8e1aLDLHCnL2gVSUTTfHtu03NaTJV1SDldQ==
X-Received: by 2002:a2e:29dd:: with SMTP id p90mr7174062ljp.26.1571423098036; 
 Fri, 18 Oct 2019 11:24:58 -0700 (PDT)
Received: from genomnajs.ideon.se ([85.235.10.227])
 by smtp.gmail.com with ESMTPSA id g26sm3020617lje.80.2019.10.18.11.24.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Oct 2019 11:24:56 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
To: Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 dri-devel@lists.freedesktop.org, Andrzej Hajda <a.hajda@samsung.com>
Subject: [PATCH 2/3 v3] drm/panel: Add DT bindings for Sony ACX424AKP
Date: Fri, 18 Oct 2019 20:24:45 +0200
Message-Id: <20191018182446.26131-2-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191018182446.26131-1-linus.walleij@linaro.org>
References: <20191018182446.26131-1-linus.walleij@linaro.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=YYQD8ZjjV8FYWgYSkKKTS/qtO4T+D7cqMY9D6mPQHr8=;
 b=kimc05Do/CaE/fiIUHNko2Lc742S8/237oDRPUfI3GEx6oAx9L9lJDf1iB9ZVBvgqr
 QHI9LXd7JPvAcIL8zQeohj8pqSIe4nKSyTNiX153O98ykn+pcc0mC6UD7j89U/P6K654
 wXdH5XPyh2zGfOJ3JCCvTD4hpxDtVNzNYM4mpoG7KN810cJKVnXxZud/XLtcFFIeY0wW
 /iVfomwNt/Sd+lhGoDLSXOItmjkDyAIakZzaekbf2DwspANM3ihx4jgKH8wazzadgrPt
 PClTRmbx3FQyecschVXDPaHtu5piX9TuDiRTHMHviHbZNAsG9BB+i38YhGgM58jkjt8k
 rLgw==
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
YW5nZUxvZyB2Mi0+djM6Ci0gUHV0IHRoZSBleGFtcGxlIGluc2lkZSBhIGRzaS1jb250cm9sbGVy
IHNvIHdlIGhhdmUgYSBjb21wbGV0ZQogIGV4YW1wbGUgdGhhdCB2ZXJpZmllcyB0byB0aGUgRFNJ
IHBhbmVsIGdlbmVyaWMgYmluZGluZy4KQ2hhbmdlTG9nIHYxLT52MjoKLSBTdWdnZXN0IGEgc3Rh
bmQtYWxvbmUgWUFNTCBiaW5kaW5ncyBmaWxlIGZvciBEU0kgcGFuZWxzIGluCiAgYSBzZXBhcmF0
ZSBwYXRjaCwgYW5kIHVzZSB0aGF0IHRvIHJlZmVyZW5jZSB0aGUKICBib29sZWFuICJlbmZvcmNl
LXZpZGVvLW1vZGUiIGF0dHJpYnV0ZSBmb3IgRFNJIHBhbmVscwotLS0KIC4uLi9kaXNwbGF5L3Bh
bmVsL3NvbnksYWN4NDI0YWtwLnlhbWwgICAgICAgICB8IDQ5ICsrKysrKysrKysrKysrKysrKysK
IDEgZmlsZSBjaGFuZ2VkLCA0OSBpbnNlcnRpb25zKCspCiBjcmVhdGUgbW9kZSAxMDA2NDQgRG9j
dW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvcGFuZWwvc29ueSxhY3g0MjRh
a3AueWFtbAoKZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9k
aXNwbGF5L3BhbmVsL3NvbnksYWN4NDI0YWtwLnlhbWwgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRy
ZWUvYmluZGluZ3MvZGlzcGxheS9wYW5lbC9zb255LGFjeDQyNGFrcC55YW1sCm5ldyBmaWxlIG1v
ZGUgMTAwNjQ0CmluZGV4IDAwMDAwMDAwMDAwMC4uYzAxZWVhMTdiMDhmCi0tLSAvZGV2L251bGwK
KysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvcGFuZWwvc29u
eSxhY3g0MjRha3AueWFtbApAQCAtMCwwICsxLDQ5IEBACisjIFNQRFgtTGljZW5zZS1JZGVudGlm
aWVyOiAoR1BMLTIuMC1vbmx5IE9SIEJTRC0yLUNsYXVzZSkKKyVZQU1MIDEuMgorLS0tCiskaWQ6
IGh0dHA6Ly9kZXZpY2V0cmVlLm9yZy9zY2hlbWFzL2Rpc3BsYXkvcGFuZWwvc29ueSxhY3g0MjRh
a3AueWFtbCMKKyRzY2hlbWE6IGh0dHA6Ly9kZXZpY2V0cmVlLm9yZy9tZXRhLXNjaGVtYXMvY29y
ZS55YW1sIworCit0aXRsZTogU29ueSBBQ1g0MjRBS1AgNCIgNDgweDg2NCBBTU9MRUQgcGFuZWwK
KworbWFpbnRhaW5lcnM6CisgIC0gTGludXMgV2FsbGVpaiA8bGludXMud2FsbGVpakBsaW5hcm8u
b3JnPgorCithbGxPZjoKKyAgLSAkcmVmOiBwYW5lbC1jb21tb24ueWFtbCMKKyAgLSAkcmVmOiBw
YW5lbC1kc2ktY29tbW9uLnlhbWwjCisKK3Byb3BlcnRpZXM6CisgIGNvbXBhdGlibGU6CisgICAg
Y29uc3Q6IHNvbnksYWN4NDI0YWtwCisgIHJlZzogdHJ1ZQorICBwb3J0OiB0cnVlCisgIHJlc2V0
LWdwaW9zOiB0cnVlCisgIHZkZGktc3VwcGx5OgorICAgICBkZXNjcmlwdGlvbjogcmVndWxhdG9y
IHRoYXQgc3VwcGxpZXMgdGhlIHZkZGkgdm9sdGFnZQorICBlbmZvcmNlLXZpZGVvLW1vZGU6IHRy
dWUKKworcmVxdWlyZWQ6CisgIC0gY29tcGF0aWJsZQorICAtIHJlZworICAtIHBvcnQKKyAgLSBy
ZXNldC1ncGlvcworICAtIHBvd2VyLXN1cHBseQorCithZGRpdGlvbmFsUHJvcGVydGllczogZmFs
c2UKKworZXhhbXBsZXM6CisgIC0gfAorICAgIGRzaS1jb250cm9sbGVyQDAgeworICAgICAgICBj
b21wYXRpYmxlID0gImZvbyI7CisgICAgICAgICNhZGRyZXNzLWNlbGxzID0gPDE+OworICAgICAg
ICAjc2l6ZS1jZWxscyA9IDwwPjsKKyAgICAgICAgcGFuZWwgeworICAgICAgICAgICAgY29tcGF0
aWJsZSA9ICJzb255LGFjeDQyNGFrcCI7CisgICAgICAgICAgICByZWcgPSA8MD47CisgICAgICAg
ICAgICB2ZGRpLXN1cHBseSA9IDwmZm9vPjsKKyAgICAgICAgICAgIHJlc2V0LWdwaW9zID0gPCZm
b29fZ3BpbyAwIEdQSU9fQUNUSVZFX0xPVz47CisgICAgICAgIH07CisgICAgfTsKKworLi4uClwg
Tm8gbmV3bGluZSBhdCBlbmQgb2YgZmlsZQotLSAKMi4yMS4wCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1k
ZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcv
bWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
