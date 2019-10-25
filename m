Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C9ADFE52B6
	for <lists+dri-devel@lfdr.de>; Fri, 25 Oct 2019 19:57:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B27D6EB34;
	Fri, 25 Oct 2019 17:57:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com
 [IPv6:2607:f8b0:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 72A2A6EB34
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Oct 2019 17:57:26 +0000 (UTC)
Received: by mail-pf1-x442.google.com with SMTP id c7so882631pfo.12
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Oct 2019 10:57:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=mkXpYcbeC0bnNO0q+6BYbbUdKRmj3eZu6k2PkyZZ+20=;
 b=DGx6Lr184pe9xhlFXyPc7S11NVCPkNq/TLNkiqhCecaRIwcnPQs2BiMVlTkRJ7Mt6M
 46WHUW2kBCodoRx85G+Da7yc3QRWv4sAybqJ5soBzN6JjqYnk2BznpnwAASWqMA7TDfx
 YKiOMbmsT6p/pfmZxN/EBl78B6SZthdrZiL+QOmjMZm/lh3fe72d6SgJeAQWhHMm4ftO
 SvWCGaMIJRMU97bMcnGAxK6+X6c5osV4aFhoYHYa13N78cMx6K1JONZONjwSQZ9COs4y
 ep/1DlVQ7bks0Lv84hsHZsWmmtxoQYCMhj5PAbFVxoG3x1sPrvUcZr12hlqBkdUU0pR+
 Rq5w==
X-Gm-Message-State: APjAAAV47zP5+/aJU6v944MN8kvf4Z+FhXeQYyY3EeQmS1zJtEqzW76H
 qvUvmFhpaZVn3tJg76lSXHK9Uw==
X-Google-Smtp-Source: APXvYqx2uyOKUk+oTvl6DvVjGmAyDd5BEOKB1viyY3Vajn7osDQWzKuwH/NW4wm5BvjAo8gfJW6sbA==
X-Received: by 2002:a63:9d47:: with SMTP id i68mr5939677pgd.28.1572026245814; 
 Fri, 25 Oct 2019 10:57:25 -0700 (PDT)
Received: from localhost.localdomain ([115.97.180.31])
 by smtp.gmail.com with ESMTPSA id n15sm2926580pfq.146.2019.10.25.10.57.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Oct 2019 10:57:25 -0700 (PDT)
From: Jagan Teki <jagan@amarulasolutions.com>
To: Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Subject: [DO NOT MERGE] [PATCH v11 7/7] arm64: dts: allwinner: bananapi-m64:
 Enable Bananapi S070WV20-CT16 DSI panel
Date: Fri, 25 Oct 2019 23:26:25 +0530
Message-Id: <20191025175625.8011-8-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.18.0.321.gffc6fa0e3
In-Reply-To: <20191025175625.8011-1-jagan@amarulasolutions.com>
References: <20191025175625.8011-1-jagan@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=mkXpYcbeC0bnNO0q+6BYbbUdKRmj3eZu6k2PkyZZ+20=;
 b=gweTI0LyTm7cD/yzlGtFTcEQkNduCRGR/hsVSxp3d/3Bz/NOBN5dWTQ+7F8e86XZUu
 Axq2I9BqIbKsiri/bWKbxYzUJKo/wDj+EinhAbxo3XDQc2Xs8g/CDg1d0UsbHDfU4+z3
 us9wdEU2FiSvwu6V/ZuM+AEQ4agT3RhBsGZJk=
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
 linux-amarula@amarulasolutions.com, linux-arm-kernel@lists.infradead.org,
 Icenowy Zheng <icenowy@aosc.io>
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
