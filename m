Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E04A22FC5
	for <lists+dri-devel@lfdr.de>; Mon, 20 May 2019 11:08:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 44AFF892F8;
	Mon, 20 May 2019 09:08:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com
 [IPv6:2607:f8b0:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7DB58892F8
 for <dri-devel@lists.freedesktop.org>; Mon, 20 May 2019 09:08:10 +0000 (UTC)
Received: by mail-pf1-x443.google.com with SMTP id z26so6908330pfg.6
 for <dri-devel@lists.freedesktop.org>; Mon, 20 May 2019 02:08:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=iobrvkxDT6nYXsPnTycSKoAi+/ZUGwRhXcWR3t2hhKA=;
 b=N/4V/BahrHtnw0R7t2eGXDVrAK5iIepbYlBtGilJuvzEKGLtnJMUP3bCbaXDIfrWk5
 x162Hc5ATf5yTzSaxriJDx/v0mJ0Dn1WLr5WTp4I1yE7BXKwqmDlFtLPmSRJG8vhMjxq
 nw1EcsFpJWnKnzyV4dLn1vfX5FGIdsDN6lv0k/6QTwC75WEetu8Fw/YFFZAFTiDeW7x/
 ThvwXiemlSsametPjhJc2WKqcSQdvH+fS5APhaqvcwP84xzkOdrJLOn+4Ypi1vw3np8w
 bRIXi4yGkNXQKPqgc/oMVipZpE+0mlW+5fy0PPClAFr//C81le9GXkRgGdTXE01aMDzk
 fr+w==
X-Gm-Message-State: APjAAAW23V/mDyOc76jxfvL3WYiAwmPUJKsygi3IcP/aam5IgKXqFZ5Q
 kfQCXTC6tGz3c1SxoUkTMbkGtg==
X-Google-Smtp-Source: APXvYqzDwmf2r63M8wJFjDamN8uTWypMZ/YvvCw1Tdx3AB1+JxAKjRinOny5iplJXhONAKLzQyVDGQ==
X-Received: by 2002:a65:42cd:: with SMTP id l13mr21087709pgp.72.1558343289969; 
 Mon, 20 May 2019 02:08:09 -0700 (PDT)
Received: from localhost.localdomain ([183.82.227.193])
 by smtp.gmail.com with ESMTPSA id d15sm51671614pfm.186.2019.05.20.02.08.04
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 20 May 2019 02:08:09 -0700 (PDT)
From: Jagan Teki <jagan@amarulasolutions.com>
To: Maxime Ripard <maxime.ripard@bootlin.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Chen-Yu Tsai <wens@csie.org>,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [DO NOT MERGE] [PATCH v10 11/11] ARM: dts: sun8i: bananapi-m2m:
 Enable Bananapi S070WV20-CT16 DSI panel
Date: Mon, 20 May 2019 14:33:18 +0530
Message-Id: <20190520090318.27570-12-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.18.0.321.gffc6fa0e3
In-Reply-To: <20190520090318.27570-1-jagan@amarulasolutions.com>
References: <20190520090318.27570-1-jagan@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=iobrvkxDT6nYXsPnTycSKoAi+/ZUGwRhXcWR3t2hhKA=;
 b=YGMFMvzmnYk0vgW+1qinWeqho4ZrFohDa91VmDHH0o1w7TGJiw9k3Uv7vQnjo6c6DE
 +wAEgQCxg7/pT/3sX2p1y70F3SiL/Vb6nWGWHQTB1tfe3v0almhqdNOHCpJOEbIT5Dm8
 Rm/nJSjTvc09FlYZ/xB3j0Fci3TvQU+Lwjnd0=
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
Cc: bshah@mykolab.com, powerpan@qq.com, Vasily Khoruzhick <anarsoul@gmail.com>,
 linux-sunxi@googlegroups.com, Jagan Teki <jagan@amarulasolutions.com>,
 michael@amarulasolutions.com, linux-amarula@amarulasolutions.com
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
