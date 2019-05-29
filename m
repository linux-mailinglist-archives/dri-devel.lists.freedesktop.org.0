Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DB102DB2C
	for <lists+dri-devel@lfdr.de>; Wed, 29 May 2019 12:57:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 155396E2B4;
	Wed, 29 May 2019 10:57:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com
 [IPv6:2607:f8b0:4864:20::543])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 616256E2B4
 for <dri-devel@lists.freedesktop.org>; Wed, 29 May 2019 10:57:09 +0000 (UTC)
Received: by mail-pg1-x543.google.com with SMTP id n2so1140463pgp.11
 for <dri-devel@lists.freedesktop.org>; Wed, 29 May 2019 03:57:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Eyb7BIHD01D0smmXOe136462okq/ItEJbzuGD038kxU=;
 b=RCFcGenE414C37gjIZ2OuhriLt5wN0ZK8ZvI89z7VUg8Af0rBXmy1b8AcdXZg61t7s
 SI3wl6nRfGUhidQYeXqIcNVAv+qjRD3gNM7ud947NuIolhuINpxpfKg3Xj5YJXOQBFWQ
 mcpCmG3MAitcevwOFRTnorxl7FOWQeu88qn5xQVSium7nM3FflGvpxYGnioKdj8Go7dc
 349TmrQIN1YWF8CjE56hC9cQYRYjUueT+qSQ/NoX5Ed5+IsucUyVJmvpJR1wWTxh4V/F
 sp119FfMRTWdFA7hs22112HArQMcncs7dE0B3eiuLrzEKy9j8ie70xZJ5XSNGa5sDy/k
 vcVA==
X-Gm-Message-State: APjAAAXcyEyeSOMt5+ttslA5h2PolG/a4O8tZwlujJoKBy1azLDfPOKd
 dXSk89QAYpmH841GiPFCyAd6Mg==
X-Google-Smtp-Source: APXvYqysDuO1NSzDIF/g5QolZWZtMoiyhlFCesQaeB1NIziQuIwb/NkDrYa0ajLyvG4RW+9rEWIuPA==
X-Received: by 2002:a63:c20c:: with SMTP id b12mr1312582pgd.3.1559127428328;
 Wed, 29 May 2019 03:57:08 -0700 (PDT)
Received: from localhost.localdomain ([49.206.202.218])
 by smtp.gmail.com with ESMTPSA id 184sm18974479pfa.48.2019.05.29.03.57.04
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 29 May 2019 03:57:07 -0700 (PDT)
From: Jagan Teki <jagan@amarulasolutions.com>
To: Maxime Ripard <maxime.ripard@bootlin.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Chen-Yu Tsai <wens@csie.org>,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v9 6/9] arm64: dts: allwinner: a64-amarula-relic: Add Techstar
 TS8550B MIPI-DSI panel
Date: Wed, 29 May 2019 16:26:12 +0530
Message-Id: <20190529105615.14027-7-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.18.0.321.gffc6fa0e3
In-Reply-To: <20190529105615.14027-1-jagan@amarulasolutions.com>
References: <20190529105615.14027-1-jagan@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Eyb7BIHD01D0smmXOe136462okq/ItEJbzuGD038kxU=;
 b=FIQa332or/0Y1ihVrB9DQXuCYYKeiS+pyF7rdfe8C0OzeJp99VOjecrS9ERaWdyVXf
 7bK/db+J15eGqgaawGHN477aDbYL3WV8yTui0G9QwX/KRSwGN10+p4RYIesJdz97KHNS
 5f7DEignN1y0LolDRlIT9+q3S4g1+yyh2Z7bY=
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

QW1hcnVsYSBBNjQtUmVsaWMgYm9hcmQgYnkgZGVmYXVsdCBib3VuZCB3aXRoIFRlY2hzdGFyIFRT
ODU1MEIKTUlQSS1EU0kgcGFuZWwsIGFkZCBzdXBwb3J0IGZvciBpdC4KCkRTSSBwYW5lbCBjb25u
ZWN0ZWQgdmlhIGJvYXJkIERTSSBwb3J0IHdpdGgsCi0gRExETzEgYXMgVkNDLURTSSBzdXBwbHkK
LSBETERPMiBhcyBWQ0Mgc3VwcGx5Ci0gRExETzIgYXMgSU9WQ0Mgc3VwcGx5Ci0gUEQyNCBncGlv
IGZvciByZXNldCBwaW4KLSBQRDIzIGdwaW8gZm9yIGJhY2tsaWdodCBlbmFibGUgcGluCgpTaWdu
ZWQtb2ZmLWJ5OiBKYWdhbiBUZWtpIDxqYWdhbkBhbWFydWxhc29sdXRpb25zLmNvbT4KLS0tCiAu
Li4vYWxsd2lubmVyL3N1bjUwaS1hNjQtYW1hcnVsYS1yZWxpYy5kdHMgICAgfCAzNSArKysrKysr
KysrKysrKysrKysrCiAxIGZpbGUgY2hhbmdlZCwgMzUgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdp
dCBhL2FyY2gvYXJtNjQvYm9vdC9kdHMvYWxsd2lubmVyL3N1bjUwaS1hNjQtYW1hcnVsYS1yZWxp
Yy5kdHMgYi9hcmNoL2FybTY0L2Jvb3QvZHRzL2FsbHdpbm5lci9zdW41MGktYTY0LWFtYXJ1bGEt
cmVsaWMuZHRzCmluZGV4IDU2MzQyNDVkMTFkYi4uNTEwOWMzMjU4YTJmIDEwMDY0NAotLS0gYS9h
cmNoL2FybTY0L2Jvb3QvZHRzL2FsbHdpbm5lci9zdW41MGktYTY0LWFtYXJ1bGEtcmVsaWMuZHRz
CisrKyBiL2FyY2gvYXJtNjQvYm9vdC9kdHMvYWxsd2lubmVyL3N1bjUwaS1hNjQtYW1hcnVsYS1y
ZWxpYy5kdHMKQEAgLTksNiArOSw3IEBACiAjaW5jbHVkZSAic3VuNTBpLWE2NC5kdHNpIgogCiAj
aW5jbHVkZSA8ZHQtYmluZGluZ3MvZ3Bpby9ncGlvLmg+CisjaW5jbHVkZSA8ZHQtYmluZGluZ3Mv
cHdtL3B3bS5oPgogCiAvIHsKIAltb2RlbCA9ICJBbWFydWxhIEE2NC1SZWxpYyI7CkBAIC0xOCw2
ICsxOSwxNCBAQAogCQlzZXJpYWwwID0gJnVhcnQwOwogCX07CiAKKwliYWNrbGlnaHQ6IGJhY2ts
aWdodCB7CisJCWNvbXBhdGlibGUgPSAicHdtLWJhY2tsaWdodCI7CisJCXB3bXMgPSA8JnB3bSAw
IDUwMDAwIFBXTV9QT0xBUklUWV9JTlZFUlRFRD47CisJCWJyaWdodG5lc3MtbGV2ZWxzID0gPDEg
MiA0IDggMTYgMzIgNjQgMTI4IDI1NT47CisJCWRlZmF1bHQtYnJpZ2h0bmVzcy1sZXZlbCA9IDwy
PjsKKwkJZW5hYmxlLWdwaW9zID0gPCZwaW8gMyAyMyBHUElPX0FDVElWRV9ISUdIPjsgLyogTENE
LUJMLUVOOiBQRDIzICovCisJfTsKKwogCWNob3NlbiB7CiAJCXN0ZG91dC1wYXRoID0gInNlcmlh
bDA6MTE1MjAwbjgiOwogCX07CkBAIC04MCw2ICs4OSwyOCBAQAogCX07CiB9OwogCismZGUgewor
CXN0YXR1cyA9ICJva2F5IjsKK307CisKKyZkcGh5IHsKKwlzdGF0dXMgPSAib2theSI7Cit9Owor
CismZHNpIHsKKwl2Y2MtZHNpLXN1cHBseSA9IDwmcmVnX2RsZG8xPjsJCS8qIFZDQy1EU0kgKi8K
KwlzdGF0dXMgPSAib2theSI7CisKKwlwYW5lbEAwIHsKKwkJY29tcGF0aWJsZSA9ICJ0ZWNoc3Rh
cix0czg1NTBiIiwgInNpdHJvbml4LHN0NzcwMSI7CisJCXJlZyA9IDwwPjsKKwkJVkNDLXN1cHBs
eSA9IDwmcmVnX2RsZG8yPjsJLyogVkNDLU1JUEkgKi8KKwkJSU9WQ0Mtc3VwcGx5ID0gPCZyZWdf
ZGxkbzI+OwkvKiBWQ0MtTUlQSSAqLworCQlyZXNldC1ncGlvcyA9IDwmcGlvIDMgMjQgR1BJT19B
Q1RJVkVfSElHSD47IC8qIExDRC1SU1Q6IFBEMjQgKi8KKwkJYmFja2xpZ2h0ID0gPCZiYWNrbGln
aHQ+OworCX07Cit9OworCiAmZWhjaTAgewogCXN0YXR1cyA9ICJva2F5IjsKIH07CkBAIC0xNTEs
NiArMTgyLDEwIEBACiAJc3RhdHVzID0gIm9rYXkiOwogfTsKIAorJnB3bSB7CisJc3RhdHVzID0g
Im9rYXkiOworfTsKKwogJnJfcnNiIHsKIAlzdGF0dXMgPSAib2theSI7CiAKLS0gCjIuMTguMC4z
MjEuZ2ZmYzZmYTBlMwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRl
dmVs
