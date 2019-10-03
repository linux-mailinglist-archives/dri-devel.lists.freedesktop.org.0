Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 875C9C9885
	for <lists+dri-devel@lfdr.de>; Thu,  3 Oct 2019 08:46:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 686616E245;
	Thu,  3 Oct 2019 06:46:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com
 [IPv6:2607:f8b0:4864:20::642])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CBDA06E245
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Oct 2019 06:46:28 +0000 (UTC)
Received: by mail-pl1-x642.google.com with SMTP id u12so1008338pls.12
 for <dri-devel@lists.freedesktop.org>; Wed, 02 Oct 2019 23:46:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=iobrvkxDT6nYXsPnTycSKoAi+/ZUGwRhXcWR3t2hhKA=;
 b=b9kAGih7tJytOoHVeuwjWOhkhGX2yRPFhBwf6zvrFrSCWuq5vH3wsPPS5o2lbBHtyR
 gvqU2lO1ui7dtagGopN4VDXDX6QgFP8hs0A93uSgWt5HtQB0qxwQQzr8b7++PKFLO+pO
 WJF+FQxhY5Key0Du6Vq03t5G4rhY7YOf+kUBk7KNPGEl40WFMjJuh/D33kuCpjES1T9Z
 h/Ddu4WnEA/7Bymk28FYX8n+1pVZkTDrGDKUGA3lUsk6YdXFX5yqZqk4fojQfJhrRFmM
 BxiRnLTak5x6BTIFljsUSC5xat9zP6xZ53lIp0qZ3fRKBdwbCsUdXr0YxYYP+3pfjvWV
 2wqA==
X-Gm-Message-State: APjAAAVPydbtGbem2DP5Pap5JLiSotwjyKRDK0063OKlVs5kbTyFDKlw
 6ntOUDVSn/o/GzvvvVBBNTK8ig==
X-Google-Smtp-Source: APXvYqwKEdQV435b9tSwO3qAvnE6681+TvxHs5yQQv8hXNnuD+sMc/trfjszHwABt44RSpWlAeprZg==
X-Received: by 2002:a17:902:8f88:: with SMTP id
 z8mr8195034plo.232.1570085188176; 
 Wed, 02 Oct 2019 23:46:28 -0700 (PDT)
Received: from localhost.localdomain ([49.206.203.121])
 by smtp.gmail.com with ESMTPSA id b18sm1423294pfi.157.2019.10.02.23.46.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Oct 2019 23:46:27 -0700 (PDT)
From: Jagan Teki <jagan@amarulasolutions.com>
To: Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH v11 7/7] ARM: dts: sun8i: bananapi-m2m: Enable Bananapi
 S070WV20-CT16 DSI panel
Date: Thu,  3 Oct 2019 12:15:27 +0530
Message-Id: <20191003064527.15128-8-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.18.0.321.gffc6fa0e3
In-Reply-To: <20191003064527.15128-1-jagan@amarulasolutions.com>
References: <20191003064527.15128-1-jagan@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=iobrvkxDT6nYXsPnTycSKoAi+/ZUGwRhXcWR3t2hhKA=;
 b=BbR+yL4/NsJS6oq8dISWlmaxqoJMqhGGQQrHj/DXx0JxzwaRpUMfB67TpNUdfMxSRQ
 Y5jAi2gX0HtVv2AzJ9/rhyF1R8Tg8UjZPUZVId+PWfKDV7x39UZd8tfqQ9jdB3f4ekFE
 1SWwRZxEpM2V8SKNccS20fxk03vYwq9NPBNnc=
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-sunxi <linux-sunxi@googlegroups.com>,
 Jagan Teki <jagan@amarulasolutions.com>, michael@amarulasolutions.com,
 linux-arm-kernel@lists.infradead.org, Icenowy Zheng <icenowy@aosc.io>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhpcyBwYXRjaCBhZGQgc3VwcG9ydCBmb3IgQmFuYW5hcGkgUzA3MFdWMjAtQ1QxNiBEU0kgcGFu
ZWwgdG8KQlBJLU0yTSBib2FyZC4KCkRTSSBwYW5lbCBjb25uZWN0ZWQgdmlhIGJvYXJkIERTSSBw
b3J0IHdpdGgsCi0gRENEQzEgYXMgVkNDLURTSSBzdXBwbHkKLSBETERPMSBhcyBWREQgc3VwcGx5
Ci0gUEw1IGdwaW8gZm9yIGxjZCByZXNldCBncGlvIHBpbgotIFBCNyBncGlvIGZvciBsY2QgZW5h
YmxlIGdwaW8gcGluCi0gUEw0IGdwaW8gZm9yIGJhY2tsaWdodCBlbmFibGUgcGluCgpTaWduZWQt
b2ZmLWJ5OiBKYWdhbiBUZWtpIDxqYWdhbkBhbWFydWxhc29sdXRpb25zLmNvbT4KLS0tCiBhcmNo
L2FybS9ib290L2R0cy9zdW44aS1yMTYtYmFuYW5hcGktbTJtLmR0cyB8IDQwICsrKysrKysrKysr
KysrKysrKysrCiAxIGZpbGUgY2hhbmdlZCwgNDAgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBh
L2FyY2gvYXJtL2Jvb3QvZHRzL3N1bjhpLXIxNi1iYW5hbmFwaS1tMm0uZHRzIGIvYXJjaC9hcm0v
Ym9vdC9kdHMvc3VuOGktcjE2LWJhbmFuYXBpLW0ybS5kdHMKaW5kZXggZTFjNzVmN2ZhM2NhLi40
ZTcxZTgxZDJiYWQgMTAwNjQ0Ci0tLSBhL2FyY2gvYXJtL2Jvb3QvZHRzL3N1bjhpLXIxNi1iYW5h
bmFwaS1tMm0uZHRzCisrKyBiL2FyY2gvYXJtL2Jvb3QvZHRzL3N1bjhpLXIxNi1iYW5hbmFwaS1t
Mm0uZHRzCkBAIC00NCw2ICs0NCw3IEBACiAjaW5jbHVkZSAic3VuOGktYTMzLmR0c2kiCiAKICNp
bmNsdWRlIDxkdC1iaW5kaW5ncy9ncGlvL2dwaW8uaD4KKyNpbmNsdWRlIDxkdC1iaW5kaW5ncy9w
d20vcHdtLmg+CiAKIC8gewogCW1vZGVsID0gIkJhbmFuYVBpIE0yIE1hZ2ljIjsKQEAgLTYxLDYg
KzYyLDE0IEBACiAJCXN0ZG91dC1wYXRoID0gInNlcmlhbDA6MTE1MjAwbjgiOwogCX07CiAKKwli
YWNrbGlnaHQ6IGJhY2tsaWdodCB7CisJCWNvbXBhdGlibGUgPSAicHdtLWJhY2tsaWdodCI7CisJ
CXB3bXMgPSA8JnB3bSAwIDUwMDAwIFBXTV9QT0xBUklUWV9JTlZFUlRFRD47CisJCWJyaWdodG5l
c3MtbGV2ZWxzID0gPDEgMiA0IDggMTYgMzIgNjQgMTI4IDI1NT47CisJCWRlZmF1bHQtYnJpZ2h0
bmVzcy1sZXZlbCA9IDw4PjsKKwkJZW5hYmxlLWdwaW9zID0gPCZyX3BpbyAwIDQgR1BJT19BQ1RJ
VkVfSElHSD47IC8qIExDRC1CTC1FTjogUEw0ICovCisJfTsKKwogCWxlZHMgewogCQljb21wYXRp
YmxlID0gImdwaW8tbGVkcyI7CiAKQEAgLTEyMiw2ICsxMzEsMjcgQEAKIAlzdGF0dXMgPSAib2th
eSI7CiB9OwogCismZGUgeworCXN0YXR1cyA9ICJva2F5IjsKK307CisKKyZkcGh5IHsKKwlzdGF0
dXMgPSAib2theSI7Cit9OworCismZHNpIHsKKwl2Y2MtZHNpLXN1cHBseSA9IDwmcmVnX2RjZGMx
PjsJCS8qIFZDQzNWMy1EU0kgKi8KKwlzdGF0dXMgPSAib2theSI7CisKKwlwYW5lbEAwIHsKKwkJ
Y29tcGF0aWJsZSA9ICJiYW5hbmFwaSxzMDcwd3YyMC1jdDE2LWljbjYyMTEiOworCQlyZWcgPSA8
MD47CisJCWVuYWJsZS1ncGlvcyA9IDwmcGlvIDEgNyBHUElPX0FDVElWRV9ISUdIPjsgLyogTENE
LVBXUi1FTjogUEI3ICovCisJCXJlc2V0LWdwaW9zID0gPCZyX3BpbyAwIDUgR1BJT19BQ1RJVkVf
SElHSD47IC8qIExDRC1SU1Q6IFBMNSAqLworCQliYWNrbGlnaHQgPSA8JmJhY2tsaWdodD47CisJ
fTsKK307CisKICZlaGNpMCB7CiAJc3RhdHVzID0gIm9rYXkiOwogfTsKQEAgLTE1Nyw2ICsxODcs
MTIgQEAKIAlzdGF0dXMgPSAib2theSI7CiB9OwogCismcHdtIHsKKwlwaW5jdHJsLW5hbWVzID0g
ImRlZmF1bHQiOworCXBpbmN0cmwtMCA9IDwmcHdtMF9waW4+OworCXN0YXR1cyA9ICJva2F5IjsK
K307CisKICZyX3JzYiB7CiAJc3RhdHVzID0gIm9rYXkiOwogCkBAIC0yNjksNiArMzA1LDEwIEBA
CiAJc3RhdHVzID0gIm9rYXkiOwogfTsKIAorJnRjb24wIHsKKwlzdGF0dXMgPSAib2theSI7Cit9
OworCiAmdWFydDAgewogCXBpbmN0cmwtbmFtZXMgPSAiZGVmYXVsdCI7CiAJcGluY3RybC0wID0g
PCZ1YXJ0MF9wYl9waW5zPjsKLS0gCjIuMTguMC4zMjEuZ2ZmYzZmYTBlMwoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlz
dApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0
b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
