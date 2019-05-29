Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FB552DB28
	for <lists+dri-devel@lfdr.de>; Wed, 29 May 2019 12:57:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E3A16E2A9;
	Wed, 29 May 2019 10:57:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com
 [IPv6:2607:f8b0:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3BE5A6E2A9
 for <dri-devel@lists.freedesktop.org>; Wed, 29 May 2019 10:57:04 +0000 (UTC)
Received: by mail-pf1-x442.google.com with SMTP id j2so1389990pfe.6
 for <dri-devel@lists.freedesktop.org>; Wed, 29 May 2019 03:57:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=IKHbkwp0tH0KLf+f56uwsCmAY1kuILa8NoPqQgZh2PQ=;
 b=Z1UjeS43iTIDg4J5pV6jV39gVyEUQQQve5is7hjFMFmUwDEqKYNjbEuotBxHeStuWa
 muaP9K31pzo8lm8mltf5NsdjSFas4eRQi5yqbTh4DGDk9MR1vkCGzSLEdi7srW2+TIcW
 c7EB3X46xFbeAMoB83HZF3NsopdC/TU0qjEp5JybClp7vFuHlygxVl+kBaJaTEUxA/zL
 /cZ0IemZIWcWloQxOtK/OK6ZsDhkZ9ulYCG5DgaWDutKBrJn09zBpLTtargAxkHvMt8C
 n9UwFatmrzhODUe7I2X+TriRbH/Z4sG0gH+jXKk35v68PkKxByW7lc6O3oqXlgdR65nP
 zUiA==
X-Gm-Message-State: APjAAAXpVdGKznNrYX4vPACr6H9rNBzwsgFWiReKJHmks7VHnk9j5d4r
 71juVvwF8sINI9/KbeNL3+QA/g==
X-Google-Smtp-Source: APXvYqxjPNrPdD2m/BZ2CUM9C2X2IqkehigITMfSOTVpr9OktUCY92tODMEwEqCZx/NEktAqBCX2aw==
X-Received: by 2002:a63:d014:: with SMTP id
 z20mr131060453pgf.227.1559127423790; 
 Wed, 29 May 2019 03:57:03 -0700 (PDT)
Received: from localhost.localdomain ([49.206.202.218])
 by smtp.gmail.com with ESMTPSA id 184sm18974479pfa.48.2019.05.29.03.56.59
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 29 May 2019 03:57:03 -0700 (PDT)
From: Jagan Teki <jagan@amarulasolutions.com>
To: Maxime Ripard <maxime.ripard@bootlin.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Chen-Yu Tsai <wens@csie.org>,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v9 5/9] arm64: dts: allwinner: a64: Add MIPI DSI pipeline
Date: Wed, 29 May 2019 16:26:11 +0530
Message-Id: <20190529105615.14027-6-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.18.0.321.gffc6fa0e3
In-Reply-To: <20190529105615.14027-1-jagan@amarulasolutions.com>
References: <20190529105615.14027-1-jagan@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=IKHbkwp0tH0KLf+f56uwsCmAY1kuILa8NoPqQgZh2PQ=;
 b=GSAv18sBWAsz8YQuoNO/1lpeipPjg1J2Fa0U0jPgNa05sDr21vIDWTvRUnnqx7VvkU
 IXsuxZfeXOdVCzR1B36mNH3Fa+NvmT+6gMD9vl8dXUq5bzJ+JXt+UnjbHK5bGmiwUUNq
 qIER4dq4n4aRkLFBSOEGAJDdlBmtwYTIdNnXw=
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

QWRkIE1JUEkgRFNJIHBpcGVsaW5lIGZvciBBbGx3aW5uZXIgQTY0LgoKLSBkc2kgbm9kZSwgd2l0
aCBBNjQgY29tcGF0aWJsZSBzaW5jZSBpdCBkb2Vzbid0IHN1cHBvcnQKICBEU0lfU0NMSyBnYXRp
bmcgdW5saWtlIEEzMwotIGRwaHkgbm9kZSwgd2l0aCBBNjQgY29tcGF0aWJsZSB3aXRoIEEzMyBm
YWxsYmFjayBzaW5jZQogIERQSFkgb24gQTY0IGFuZCBBMzMgaXMgc2ltaWxhcgotIGZpbmFsbHks
IGF0dGFjaCB0aGUgZHNpX2luIHRvIHRjb24wIGZvciBjb21wbGV0ZSBNSVBJIERTSQoKU2lnbmVk
LW9mZi1ieTogSmFnYW4gVGVraSA8amFnYW5AYW1hcnVsYXNvbHV0aW9ucy5jb20+ClRlc3RlZC1i
eTogTWVybGlqbiBXYWplciA8bWVybGlqbkB3aXp6dXAub3JnPgotLS0KIGFyY2gvYXJtNjQvYm9v
dC9kdHMvYWxsd2lubmVyL3N1bjUwaS1hNjQuZHRzaSB8IDM4ICsrKysrKysrKysrKysrKysrKysK
IDEgZmlsZSBjaGFuZ2VkLCAzOCBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvYXJjaC9hcm02
NC9ib290L2R0cy9hbGx3aW5uZXIvc3VuNTBpLWE2NC5kdHNpIGIvYXJjaC9hcm02NC9ib290L2R0
cy9hbGx3aW5uZXIvc3VuNTBpLWE2NC5kdHNpCmluZGV4IGIyNzVjNmQzNTQyMC4uNDRjMWMxMWRi
NDIzIDEwMDY0NAotLS0gYS9hcmNoL2FybTY0L2Jvb3QvZHRzL2FsbHdpbm5lci9zdW41MGktYTY0
LmR0c2kKKysrIGIvYXJjaC9hcm02NC9ib290L2R0cy9hbGx3aW5uZXIvc3VuNTBpLWE2NC5kdHNp
CkBAIC0zODIsNiArMzgyLDEyIEBACiAJCQkJCSNhZGRyZXNzLWNlbGxzID0gPDE+OwogCQkJCQkj
c2l6ZS1jZWxscyA9IDwwPjsKIAkJCQkJcmVnID0gPDE+OworCisJCQkJCXRjb24wX291dF9kc2k6
IGVuZHBvaW50QDEgeworCQkJCQkJcmVnID0gPDE+OworCQkJCQkJcmVtb3RlLWVuZHBvaW50ID0g
PCZkc2lfaW5fdGNvbjA+OworCQkJCQkJYWxsd2lubmVyLHRjb24tY2hhbm5lbCA9IDwxPjsKKwkJ
CQkJfTsKIAkJCQl9OwogCQkJfTsKIAkJfTsKQEAgLTk4NSw2ICs5OTEsMzggQEAKIAkJCXN0YXR1
cyA9ICJkaXNhYmxlZCI7CiAJCX07CiAKKwkJZHNpOiBkc2lAMWNhMDAwMCB7CisJCQljb21wYXRp
YmxlID0gImFsbHdpbm5lcixzdW41MGktYTY0LW1pcGktZHNpIjsKKwkJCXJlZyA9IDwweDAxY2Ew
MDAwIDB4MTAwMD47CisJCQlpbnRlcnJ1cHRzID0gPEdJQ19TUEkgODkgSVJRX1RZUEVfTEVWRUxf
SElHSD47CisJCQljbG9ja3MgPSA8JmNjdSBDTEtfQlVTX01JUElfRFNJPjsKKwkJCWNsb2NrLW5h
bWVzID0gImJ1cyI7CisJCQlyZXNldHMgPSA8JmNjdSBSU1RfQlVTX01JUElfRFNJPjsKKwkJCXBo
eXMgPSA8JmRwaHk+OworCQkJcGh5LW5hbWVzID0gImRwaHkiOworCQkJc3RhdHVzID0gImRpc2Fi
bGVkIjsKKwkJCSNhZGRyZXNzLWNlbGxzID0gPDE+OworCQkJI3NpemUtY2VsbHMgPSA8MD47CisK
KwkJCXBvcnQgeworCQkJCWRzaV9pbl90Y29uMDogZW5kcG9pbnQgeworCQkJCQlyZW1vdGUtZW5k
cG9pbnQgPSA8JnRjb24wX291dF9kc2k+OworCQkJCX07CisJCQl9OworCQl9OworCisJCWRwaHk6
IGQtcGh5QDFjYTEwMDAgeworCQkJY29tcGF0aWJsZSA9ICJhbGx3aW5uZXIsc3VuNTBpLWE2NC1t
aXBpLWRwaHkiLAorCQkJCSAgICAgImFsbHdpbm5lcixzdW42aS1hMzEtbWlwaS1kcGh5IjsKKwkJ
CXJlZyA9IDwweDAxY2ExMDAwIDB4MTAwMD47CisJCQljbG9ja3MgPSA8JmNjdSBDTEtfQlVTX01J
UElfRFNJPiwKKwkJCQkgPCZjY3UgQ0xLX0RTSV9EUEhZPjsKKwkJCWNsb2NrLW5hbWVzID0gImJ1
cyIsICJtb2QiOworCQkJcmVzZXRzID0gPCZjY3UgUlNUX0JVU19NSVBJX0RTST47CisJCQlzdGF0
dXMgPSAiZGlzYWJsZWQiOworCQkJI3BoeS1jZWxscyA9IDwwPjsKKwkJfTsKKwogCQloZG1pOiBo
ZG1pQDFlZTAwMDAgewogCQkJY29tcGF0aWJsZSA9ICJhbGx3aW5uZXIsc3VuNTBpLWE2NC1kdy1o
ZG1pIiwKIAkJCQkgICAgICJhbGx3aW5uZXIsc3VuOGktYTgzdC1kdy1oZG1pIjsKLS0gCjIuMTgu
MC4zMjEuZ2ZmYzZmYTBlMwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJp
LWRldmVs
