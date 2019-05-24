Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 845F52966D
	for <lists+dri-devel@lfdr.de>; Fri, 24 May 2019 12:54:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 33AAF6E0FA;
	Fri, 24 May 2019 10:54:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com
 [IPv6:2607:f8b0:4864:20::541])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 29B406E0FA
 for <dri-devel@lists.freedesktop.org>; Fri, 24 May 2019 10:54:31 +0000 (UTC)
Received: by mail-pg1-x541.google.com with SMTP id d30so4870347pgm.7
 for <dri-devel@lists.freedesktop.org>; Fri, 24 May 2019 03:54:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=I2TZuRmi80hep26TN0kzkhgc7I9J5j9G8LP4vdObAKA=;
 b=DjCbPbjFD1+T106dENTdEc0zQUUnqGyNDkdM+U825N27q4F2FVAy/vxj1KLixUMQt5
 ecowGBDHurKPxDtcGPobeKGCwqY5+SVnl9IKovbbl61+u8M/W4jB/aJo4zkqZnPV69KA
 Y913HVACO/yejN2J8mlsOo8hI7l/T6xh/v5nrPQ6n4mEExPhhSyT5DYrB34uL69UWzPe
 maOjpNFRLRfEbecVR1xn2VfTLnghW4un+bs629G51vQlRyoinYB1AP8Uo0Q6kh4CRQ9J
 HUgVH+unEoL6r0IajSW7GEeVegV5ZNUZHJSr8WpfBBd6gRKdZ/aTBRDtXQ1rIKrMgl6R
 i7uw==
X-Gm-Message-State: APjAAAWvCnz/EzFvwYM89a+7v7YF3OCAsm8FrnPBvlAFKzf6E8K2Dm8q
 SSj7jFPv7/jwwCQ20ss0x3Wqmw==
X-Google-Smtp-Source: APXvYqxLSs8iO1m115oUyVnrdwFq0cnEzH565uo/USlTwFKMKyOMBAIiY/kx7gcZIlu2j9RZRIsZCw==
X-Received: by 2002:a62:582:: with SMTP id 124mr112332112pff.209.1558694656864; 
 Fri, 24 May 2019 03:44:16 -0700 (PDT)
Received: from localhost.localdomain ([183.82.227.60])
 by smtp.gmail.com with ESMTPSA id h11sm2303416pfn.170.2019.05.24.03.44.11
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 24 May 2019 03:44:16 -0700 (PDT)
From: Jagan Teki <jagan@amarulasolutions.com>
To: Andrzej Hajda <a.hajda@samsung.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Chen-Yu Tsai <wens@csie.org>, Maxime Ripard <maxime.ripard@bootlin.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Subject: [DO NOT MERGE] [PATCH v2 6/6] ARM: dts: sun8i: bananapi-m2m: Enable
 Bananapi S070WV20-CT16 DSI panel
Date: Fri, 24 May 2019 16:13:17 +0530
Message-Id: <20190524104317.20287-4-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.18.0.321.gffc6fa0e3
In-Reply-To: <20190524104317.20287-1-jagan@amarulasolutions.com>
References: <20190524104317.20287-1-jagan@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=I2TZuRmi80hep26TN0kzkhgc7I9J5j9G8LP4vdObAKA=;
 b=Y6/TPr4dAmAWl0yxUzh38/rCmUtxW/omfCTV8dq+RbcPTsSd1HVRkatTyfzFAii57t
 BfV8WUcypTvaCp1oLLG4kiNKbi+JR8xOtbHkYZcjheeMGA/rjVkHysCYMbacTc90AFcy
 Acb53tu8z0vw5pIclEFWVobYO75ZD5L0bTcFc=
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
 dri-devel@lists.freedesktop.org, linux-sunxi@googlegroups.com,
 Jagan Teki <jagan@amarulasolutions.com>,
 Michael Trimarchi <michael@amarulasolutions.com>,
 linux-amarula@amarulasolutions.com, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhpcyBwYXRjaCBhZGQgc3VwcG9ydCBmb3IgQmFuYW5hcGkgUzA3MFdWMjAtQ1QxNiBEU0kgcGFu
ZWwgdG8KQlBJLU0yTSBib2FyZC4KCkJhbmFuYXBpIFMwNzBXVjIwLUNUMTYgaXMgYSBwdXJlIFJH
QiBvdXRwdXQgcGFuZWwgd2l0aCBJQ042MjExIERTSS9SR0IKY29udmVydG9yIGJyaWRnZSwgc28g
ZW5hYmxlIGJyaWRnZSBhbG9uZyB3aXRoIGFzc29jaWF0ZWQgcGFuZWwuCgpEU0kgcGFuZWwgY29u
bmVjdGVkIHZpYSBib2FyZCBEU0kgcG9ydCB3aXRoLAotIERDREMxIGFzIFZDQy1EU0kgc3VwcGx5
Ci0gUEw1IGdwaW8gZm9yIGJyaWRnZSByZXNldCBncGlvIHBpbgotIFBCNyBncGlvIGZvciBsY2Qg
ZW5hYmxlIGdwaW8gcGluCi0gUEw0IGdwaW8gZm9yIGJhY2tsaWdodCBlbmFibGUgcGluCgpTaWdu
ZWQtb2ZmLWJ5OiBKYWdhbiBUZWtpIDxqYWdhbkBhbWFydWxhc29sdXRpb25zLmNvbT4KLS0tCiBh
cmNoL2FybS9ib290L2R0cy9zdW44aS1yMTYtYmFuYW5hcGktbTJtLmR0cyB8IDg2ICsrKysrKysr
KysrKysrKysrKysrCiAxIGZpbGUgY2hhbmdlZCwgODYgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdp
dCBhL2FyY2gvYXJtL2Jvb3QvZHRzL3N1bjhpLXIxNi1iYW5hbmFwaS1tMm0uZHRzIGIvYXJjaC9h
cm0vYm9vdC9kdHMvc3VuOGktcjE2LWJhbmFuYXBpLW0ybS5kdHMKaW5kZXggZTFjNzVmN2ZhM2Nh
Li41ZjNmOTUyM2EwM2UgMTAwNjQ0Ci0tLSBhL2FyY2gvYXJtL2Jvb3QvZHRzL3N1bjhpLXIxNi1i
YW5hbmFwaS1tMm0uZHRzCisrKyBiL2FyY2gvYXJtL2Jvb3QvZHRzL3N1bjhpLXIxNi1iYW5hbmFw
aS1tMm0uZHRzCkBAIC00NCw2ICs0NCw3IEBACiAjaW5jbHVkZSAic3VuOGktYTMzLmR0c2kiCiAK
ICNpbmNsdWRlIDxkdC1iaW5kaW5ncy9ncGlvL2dwaW8uaD4KKyNpbmNsdWRlIDxkdC1iaW5kaW5n
cy9wd20vcHdtLmg+CiAKIC8gewogCW1vZGVsID0gIkJhbmFuYVBpIE0yIE1hZ2ljIjsKQEAgLTYx
LDYgKzYyLDE0IEBACiAJCXN0ZG91dC1wYXRoID0gInNlcmlhbDA6MTE1MjAwbjgiOwogCX07CiAK
KwliYWNrbGlnaHQ6IGJhY2tsaWdodCB7CisJCWNvbXBhdGlibGUgPSAicHdtLWJhY2tsaWdodCI7
CisJCXB3bXMgPSA8JnB3bSAwIDUwMDAwIFBXTV9QT0xBUklUWV9JTlZFUlRFRD47CisJCWJyaWdo
dG5lc3MtbGV2ZWxzID0gPDEgMiA0IDggMTYgMzIgNjQgMTI4IDI1NT47CisJCWRlZmF1bHQtYnJp
Z2h0bmVzcy1sZXZlbCA9IDw4PjsKKwkJZW5hYmxlLWdwaW9zID0gPCZyX3BpbyAwIDQgR1BJT19B
Q1RJVkVfSElHSD47IC8qIExDRC1CTC1FTjogUEw0ICovCisJfTsKKwogCWxlZHMgewogCQljb21w
YXRpYmxlID0gImdwaW8tbGVkcyI7CiAKQEAgLTgxLDYgKzkwLDE4IEBACiAJCX07CiAJfTsKIAor
CXBhbmVsIHsKKwkJY29tcGF0aWJsZSA9ICJiYW5hbmFwaSxzMDcwd3YyMC1jdDE2IiwgInNpbXBs
ZS1wYW5lbCI7CisJCWVuYWJsZS1ncGlvcyA9IDwmcGlvIDEgNyBHUElPX0FDVElWRV9ISUdIPjsg
LyogTENELVBXUi1FTjogUEI3ICovCisJCWJhY2tsaWdodCA9IDwmYmFja2xpZ2h0PjsKKworCQlw
b3J0IHsKKwkJCXBhbmVsX291dF9icmlkZ2U6IGVuZHBvaW50IHsKKwkJCQlyZW1vdGUtZW5kcG9p
bnQgPSA8JmJyaWRnZV9vdXRfcGFuZWw+OworCQkJfTsKKwkJfTsKKwl9OworCiAJcmVnX3ZjYzV2
MDogdmNjNXYwIHsKIAkJY29tcGF0aWJsZSA9ICJyZWd1bGF0b3ItZml4ZWQiOwogCQlyZWd1bGF0
b3ItbmFtZSA9ICJ2Y2M1djAiOwpAQCAtMTIyLDYgKzE0Myw2MSBAQAogCXN0YXR1cyA9ICJva2F5
IjsKIH07CiAKKyZkZSB7CisJc3RhdHVzID0gIm9rYXkiOworfTsKKworJmRwaHkgeworCXN0YXR1
cyA9ICJva2F5IjsKK307CisKKyZkc2kgeworCXZjYy1kc2ktc3VwcGx5ID0gPCZyZWdfZGNkYzE+
OwkJLyogVkNDLURTSSAqLworCXN0YXR1cyA9ICJva2F5IjsKKworCXBvcnRzIHsKKwkJI2FkZHJl
c3MtY2VsbHMgPSA8MT47CisJCSNzaXplLWNlbGxzID0gPDA+OworCisJCWRzaV9vdXQ6IHBvcnRA
MCB7CisJCQlyZWcgPSA8MD47CisKKwkJCWRzaV9vdXRfYnJpZGdlOiBlbmRwb2ludCB7CisJCQkJ
cmVtb3RlLWVuZHBvaW50ID0gPCZicmlkZ2Vfb3V0X2RzaT47CisJCQl9OworCQl9OworCX07CisK
KwlicmlkZ2VAMCB7CisJCWNvbXBhdGlibGUgPSAiY2hpcG9uZSxpY242MjExIjsKKwkJcmVnID0g
PDA+OworCQlyZXNldC1ncGlvcyA9IDwmcl9waW8gMCA1IEdQSU9fQUNUSVZFX0hJR0g+OyAvKiBM
Q0QtUlNUOiBQTDUgKi8KKwkJI2FkZHJlc3MtY2VsbHMgPSA8MT47CisJCSNzaXplLWNlbGxzID0g
PDA+OworCisJCXBvcnRzIHsKKwkJCSNhZGRyZXNzLWNlbGxzID0gPDE+OworCQkJI3NpemUtY2Vs
bHMgPSA8MD47CisKKwkJCWJyaWRnZV9pbjogcG9ydEAwIHsKKwkJCQlyZWcgPSA8MD47CisKKwkJ
CQlicmlkZ2Vfb3V0X2RzaTogZW5kcG9pbnQgeworCQkJCQlyZW1vdGUtZW5kcG9pbnQgPSA8JmRz
aV9vdXRfYnJpZGdlPjsKKwkJCQl9OworCQkJfTsKKworCQkJYnJpZGdlX291dDogcG9ydEAxIHsK
KwkJCQlyZWcgPSA8MT47CisKKwkJCQlicmlkZ2Vfb3V0X3BhbmVsOiBlbmRwb2ludCB7CisJCQkJ
CXJlbW90ZS1lbmRwb2ludCA9IDwmcGFuZWxfb3V0X2JyaWRnZT47CisJCQkJfTsKKwkJCX07CisJ
CX07CisJfTsKK307CisKICZlaGNpMCB7CiAJc3RhdHVzID0gIm9rYXkiOwogfTsKQEAgLTE1Nyw2
ICsyMzMsMTIgQEAKIAlzdGF0dXMgPSAib2theSI7CiB9OwogCismcHdtIHsKKwlwaW5jdHJsLW5h
bWVzID0gImRlZmF1bHQiOworCXBpbmN0cmwtMCA9IDwmcHdtMF9waW4+OworCXN0YXR1cyA9ICJv
a2F5IjsKK307CisKICZyX3JzYiB7CiAJc3RhdHVzID0gIm9rYXkiOwogCkBAIC0yNjksNiArMzUx
LDEwIEBACiAJc3RhdHVzID0gIm9rYXkiOwogfTsKIAorJnRjb24wIHsKKwlzdGF0dXMgPSAib2th
eSI7Cit9OworCiAmdWFydDAgewogCXBpbmN0cmwtbmFtZXMgPSAiZGVmYXVsdCI7CiAJcGluY3Ry
bC0wID0gPCZ1YXJ0MF9wYl9waW5zPjsKLS0gCjIuMTguMC4zMjEuZ2ZmYzZmYTBlMwoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxp
bmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
