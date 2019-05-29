Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CD5352DB32
	for <lists+dri-devel@lfdr.de>; Wed, 29 May 2019 12:57:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F15B6E2B6;
	Wed, 29 May 2019 10:57:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com
 [IPv6:2607:f8b0:4864:20::642])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C6BA6E2B6
 for <dri-devel@lists.freedesktop.org>; Wed, 29 May 2019 10:57:13 +0000 (UTC)
Received: by mail-pl1-x642.google.com with SMTP id gn7so901139plb.10
 for <dri-devel@lists.freedesktop.org>; Wed, 29 May 2019 03:57:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=2ZQ8G0W1S9OmrPavif11lWWMbohgMuBG92FhjQ0hCpY=;
 b=nrsBMllZ8jnr7Rf3VH2Ntd9VEuGGBB5aY48i8ELhuoUGkZP2fT3bTBdHiSbYu86JRT
 ZLXj/RYLFSi4opuCpUM9onvt+oUYatlMomXnsUmqf8YeFgjqRbC+qD+fBwiPMugAGbqF
 m+ACuIzy7jG4NMhLpK5UklHLS9hM0D21Yb8dJbf5MlNFi6bHGOpdeZ6H2Zz47RiZcp5W
 KR+4LCuIJSZYtf4NGLY0pLxpMKGCmqWblHXqf5alEu2xx6hTvkxilxhs5Le5J7ZkVI47
 2yqAlrYAfvWELrb0Jweb0367YLsyyWIxy3+SLwXajIfkln+Aso6MjqBOEpS2iUmaFceG
 UNxA==
X-Gm-Message-State: APjAAAVJ5vCylgcQBix1puFsVpoBgNXpmEuV+JFRiUuOpcpVQPYyj7/V
 vdo5ZOXUQLMvSdHl8hC4Dwv6Qg==
X-Google-Smtp-Source: APXvYqxJAVroZSxkWNSASs009+W1R6iWdZWK44wcz1sc8TL7INu/U1qlJ65ThlWxirmvQ5tEXda/FA==
X-Received: by 2002:a17:902:a982:: with SMTP id
 bh2mr35644829plb.224.1559127432704; 
 Wed, 29 May 2019 03:57:12 -0700 (PDT)
Received: from localhost.localdomain ([49.206.202.218])
 by smtp.gmail.com with ESMTPSA id 184sm18974479pfa.48.2019.05.29.03.57.08
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 29 May 2019 03:57:12 -0700 (PDT)
From: Jagan Teki <jagan@amarulasolutions.com>
To: Maxime Ripard <maxime.ripard@bootlin.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Chen-Yu Tsai <wens@csie.org>,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [DO NOT MERGE] [PATCH v9 7/9] arm64: dts: allwinner: bananapi-m64:
 Enable Bananapi S070WV20-CT16 DSI panel
Date: Wed, 29 May 2019 16:26:13 +0530
Message-Id: <20190529105615.14027-8-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.18.0.321.gffc6fa0e3
In-Reply-To: <20190529105615.14027-1-jagan@amarulasolutions.com>
References: <20190529105615.14027-1-jagan@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=2ZQ8G0W1S9OmrPavif11lWWMbohgMuBG92FhjQ0hCpY=;
 b=gdGxlLlLsfXGohWiydB6LjurSsdfuFwPeks8QxffA0jURX8ULCrSOR2YiO7hgtpsji
 pRmU5gTaS68DtWTDZ+9jgfF86+uStkqc1uiYAY/md8Bxjem8cy01t+D3dbrvS2sRyZYA
 bx3Xe8a04d+GpRGxmn/E53y2kaBxnnVJcM0zs=
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
Cc: devicetree@vger.kernel.org, Ryan Pannell <ryan@osukl.com>,
 bshah@mykolab.com, linux-sunxi@googlegroups.com,
 Jagan Teki <jagan@amarulasolutions.com>,
 Michael Trimarchi <michael@amarulasolutions.com>,
 linux-amarula@amarulasolutions.com, Sergey Suloev <ssuloev@orpaltech.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhpcyBwYXRjaCBhZGQgc3VwcG9ydCBmb3IgQmFuYW5hcGkgUzA3MFdWMjAtQ1QxNiBEU0kgcGFu
ZWwgdG8KQlBJLU02NCBib2FyZC4KCkRTSSBwYW5lbCBjb25uZWN0ZWQgdmlhIGJvYXJkIERTSSBw
b3J0IHdpdGgsCi0gRExETzEgYXMgVkNDLURTSSBzdXBwbHkKLSBEQ0RDMSBhcyBWREQgc3VwcGx5
Ci0gUEQ3IGdwaW8gZm9yIGxjZCBlbmFibGUgcGluCi0gUEQ2IGdwaW8gZm9yIGxjZCByZXNldCBw
aW4KLSBQRDUgZ3BpbyBmb3IgYmFja2xpZ2h0IGVuYWJsZSBwaW4KClNpZ25lZC1vZmYtYnk6IEph
Z2FuIFRla2kgPGphZ2FuQGFtYXJ1bGFzb2x1dGlvbnMuY29tPgotLS0KIC4uLi9kdHMvYWxsd2lu
bmVyL3N1bjUwaS1hNjQtYmFuYW5hcGktbTY0LmR0cyB8IDMxICsrKysrKysrKysrKysrKysrKysK
IDEgZmlsZSBjaGFuZ2VkLCAzMSBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvYXJjaC9hcm02
NC9ib290L2R0cy9hbGx3aW5uZXIvc3VuNTBpLWE2NC1iYW5hbmFwaS1tNjQuZHRzIGIvYXJjaC9h
cm02NC9ib290L2R0cy9hbGx3aW5uZXIvc3VuNTBpLWE2NC1iYW5hbmFwaS1tNjQuZHRzCmluZGV4
IGMyYTZiNzNiMTdjZi4uMTY2Yjk3NjFjYTgzIDEwMDY0NAotLS0gYS9hcmNoL2FybTY0L2Jvb3Qv
ZHRzL2FsbHdpbm5lci9zdW41MGktYTY0LWJhbmFuYXBpLW02NC5kdHMKKysrIGIvYXJjaC9hcm02
NC9ib290L2R0cy9hbGx3aW5uZXIvc3VuNTBpLWE2NC1iYW5hbmFwaS1tNjQuZHRzCkBAIC00NSw2
ICs0NSw3IEBACiAjaW5jbHVkZSAic3VuNTBpLWE2NC5kdHNpIgogCiAjaW5jbHVkZSA8ZHQtYmlu
ZGluZ3MvZ3Bpby9ncGlvLmg+CisjaW5jbHVkZSA8ZHQtYmluZGluZ3MvcHdtL3B3bS5oPgogCiAv
IHsKIAltb2RlbCA9ICJCYW5hbmFQaS1NNjQiOwpAQCAtNTYsNiArNTcsMTQgQEAKIAkJc2VyaWFs
MSA9ICZ1YXJ0MTsKIAl9OwogCisJYmFja2xpZ2h0OiBiYWNrbGlnaHQgeworCQljb21wYXRpYmxl
ID0gInB3bS1iYWNrbGlnaHQiOworCQlwd21zID0gPCZyX3B3bSAwIDUwMDAwIFBXTV9QT0xBUklU
WV9JTlZFUlRFRD47CisJCWJyaWdodG5lc3MtbGV2ZWxzID0gPDEgMiA0IDggMTYgMzIgNjQgMTI4
IDI1NT47CisJCWRlZmF1bHQtYnJpZ2h0bmVzcy1sZXZlbCA9IDwyPjsKKwkJZW5hYmxlLWdwaW9z
ID0gPCZwaW8gMyA1IEdQSU9fQUNUSVZFX0hJR0g+OyAvKiBMQ0QtQkwtRU46IFBENSAqLworCX07
CisKIAljaG9zZW4gewogCQlzdGRvdXQtcGF0aCA9ICJzZXJpYWwwOjExNTIwMG44IjsKIAl9OwpA
QCAtMTE2LDYgKzEyNSwyNCBAQAogCXN0YXR1cyA9ICJva2F5IjsKIH07CiAKKyZkcGh5IHsKKwlz
dGF0dXMgPSAib2theSI7Cit9OworCismZHNpIHsKKwl2Y2MtZHNpLXN1cHBseSA9IDwmcmVnX2Rs
ZG8xPjsJCS8qIFZDQzNWMy1EU0kgKi8KKwlzdGF0dXMgPSAib2theSI7CisKKwlwYW5lbEAwIHsK
KwkJY29tcGF0aWJsZSA9ICJiYW5hbmFwaSxzMDcwd3YyMC1jdDE2LWljbjYyMTEiOworCQlyZWcg
PSA8MD47CisJCWVuYWJsZS1ncGlvcyA9IDwmcGlvIDMgNyBHUElPX0FDVElWRV9ISUdIPjsgLyog
TENELVBXUi1FTjogUEQ3ICovCisJCXJlc2V0LWdwaW9zID0gPCZwaW8gMyA2IEdQSU9fQUNUSVZF
X0hJR0g+OyAvKiBMQ0QtUlNUOiBQRDYgKi8KKwkJdmRkLXN1cHBseSA9IDwmcmVnX2RjZGMxPjsK
KwkJYmFja2xpZ2h0ID0gPCZiYWNrbGlnaHQ+OworCX07Cit9OworCiAmZWhjaTAgewogCXN0YXR1
cyA9ICJva2F5IjsKIH07CkBAIC0yMDYsNiArMjMzLDEwIEBACiAJc3RhdHVzID0gIm9rYXkiOwog
fTsKIAorJnJfcHdtIHsKKwlzdGF0dXMgPSAib2theSI7Cit9OworCiAmcl9yc2IgewogCXN0YXR1
cyA9ICJva2F5IjsKIAotLSAKMi4xOC4wLjMyMS5nZmZjNmZhMGUzCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRy
aS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5v
cmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
