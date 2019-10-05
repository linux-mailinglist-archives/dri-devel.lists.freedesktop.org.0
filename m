Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EE15CCCA65
	for <lists+dri-devel@lfdr.de>; Sat,  5 Oct 2019 16:20:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9FDA06E388;
	Sat,  5 Oct 2019 14:20:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com
 [IPv6:2607:f8b0:4864:20::644])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E29C26E388
 for <dri-devel@lists.freedesktop.org>; Sat,  5 Oct 2019 14:19:49 +0000 (UTC)
Received: by mail-pl1-x644.google.com with SMTP id t10so4531413plr.8
 for <dri-devel@lists.freedesktop.org>; Sat, 05 Oct 2019 07:19:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=mkXpYcbeC0bnNO0q+6BYbbUdKRmj3eZu6k2PkyZZ+20=;
 b=i0rLXWYQ6bigsBQ7ExrWw6vFY47jGiwOCbvoFLA2EH6lV8+gV9ovzjNAYw2LtWHs+E
 qpk9HKGbN3mzCrKg91BQ7DsRxg4d5xhO0oBgmLcRoyG1IWLgJdSz/wASahveR/V4/yZp
 61Gz4OCMPx/g1C2OEsbYjCxffYvZ20jaEi8CBjytSBAUDKCtqkrzyJQlhUB/SHYJcvgq
 cn7wIT5KFYKVILBboiBjhWxghhoSvhvcIQkK2ERg4OLd5GnIrInrxBHSbgK+yoFzL5Yh
 3qi/PaiHauU+rjTYLfxzAylHmkux9llIlrF7tc7GqQeNAdaTfWeSj8sFbptoG4BXzxcG
 P1VA==
X-Gm-Message-State: APjAAAUTnqcLkhEUgc34U/BC9gUKm3xPpM42ELie4VreoTNu0DZl7akW
 3jMUVI+yO4wP+I/yNLf7jZokUw==
X-Google-Smtp-Source: APXvYqzPnYTsblSf60TZovxlUVlvSuc+XFLl1zKjvdo1Yvwqtsr2H7uR3x61W/FY7WkWYe/J6M0wOQ==
X-Received: by 2002:a17:902:684a:: with SMTP id
 f10mr9295764pln.91.1570285189302; 
 Sat, 05 Oct 2019 07:19:49 -0700 (PDT)
Received: from localhost.localdomain ([115.97.180.31])
 by smtp.gmail.com with ESMTPSA id y138sm8977604pfb.174.2019.10.05.07.19.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 05 Oct 2019 07:19:48 -0700 (PDT)
From: Jagan Teki <jagan@amarulasolutions.com>
To: Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Subject: [DO NOT MERGE] [PATCH v10 6/6] arm64: dts: allwinner: bananapi-m64:
 Enable Bananapi S070WV20-CT16 DSI panel
Date: Sat,  5 Oct 2019 19:49:13 +0530
Message-Id: <20191005141913.22020-7-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.18.0.321.gffc6fa0e3
In-Reply-To: <20191005141913.22020-1-jagan@amarulasolutions.com>
References: <20191005141913.22020-1-jagan@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=mkXpYcbeC0bnNO0q+6BYbbUdKRmj3eZu6k2PkyZZ+20=;
 b=JrWVESZBcJgWFEPXetGcmowjNz2MF3jNDBTKbFar5RnY+PKgHXH8eVvgNRCq9tlvfO
 sKG5H5kI7PcBS7Gls0j4X8ssaVUr5p59L464hKLCuEhhbwBeITGMto8GYRngMviExJ/G
 p/oUnL8vpohQ+vwmALgGFNaH661mTU6zP/cUY=
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
ZWwgdG8KQlBJLU02NCBib2FyZC4KCkRTSSBwYW5lbCBjb25uZWN0ZWQgdmlhIGJvYXJkIERTSSBw
b3J0IHdpdGgsCi0gRExETzEgYXMgVkNDLURTSSBzdXBwbHkKLSBEQ0RDMSBhcyBWREQgc3VwcGx5
Ci0gUEQ3IGdwaW8gZm9yIGxjZCBlbmFibGUgcGluCi0gUEQ2IGdwaW8gZm9yIGxjZCByZXNldCBw
aW4KLSBQRDUgZ3BpbyBmb3IgYmFja2xpZ2h0IGVuYWJsZSBwaW4KClNpZ25lZC1vZmYtYnk6IEph
Z2FuIFRla2kgPGphZ2FuQGFtYXJ1bGFzb2x1dGlvbnMuY29tPgotLS0KIC4uLi9kdHMvYWxsd2lu
bmVyL3N1bjUwaS1hNjQtYmFuYW5hcGktbTY0LmR0cyB8IDMxICsrKysrKysrKysrKysrKysrKysK
IDEgZmlsZSBjaGFuZ2VkLCAzMSBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvYXJjaC9hcm02
NC9ib290L2R0cy9hbGx3aW5uZXIvc3VuNTBpLWE2NC1iYW5hbmFwaS1tNjQuZHRzIGIvYXJjaC9h
cm02NC9ib290L2R0cy9hbGx3aW5uZXIvc3VuNTBpLWE2NC1iYW5hbmFwaS1tNjQuZHRzCmluZGV4
IDIwODM3M2VmZWU0OS4uNmJlYWVjZGQ4MDJhIDEwMDY0NAotLS0gYS9hcmNoL2FybTY0L2Jvb3Qv
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
