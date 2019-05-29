Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 172552DB35
	for <lists+dri-devel@lfdr.de>; Wed, 29 May 2019 12:57:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D9A086E2BA;
	Wed, 29 May 2019 10:57:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com
 [IPv6:2607:f8b0:4864:20::644])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 16E5D6E2BA
 for <dri-devel@lists.freedesktop.org>; Wed, 29 May 2019 10:57:22 +0000 (UTC)
Received: by mail-pl1-x644.google.com with SMTP id w7so918674plz.1
 for <dri-devel@lists.freedesktop.org>; Wed, 29 May 2019 03:57:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=lMfuNcsK6tuVz7vC7aYS5UVf9NSaVZRFtcoyHVQ3R8M=;
 b=G3ou8jZgx326kpUAyRVSS9xoq1T0DuG2Pu4DriJHhUpofNeZuOo1DwHH7M5R/eVxt6
 PkH6PiS5CFaRtaAGG5qkh+WjTizFa4vYBhmqK8cnOFsEDQb+240q6j8+bA0QV15gttMf
 vp3QHmjPcbp1mbTPk7FF7LP5f3cyAaVAn1LzflI8NqNU5EDmFtIQz/wYV7FqJD+F43Zc
 bMJ+f2Q0O9n8aW69s1Q2q7zOfUIoMD580jzLfJi6dAvXtoEJrReVfxbgyk+jPY6zX2tb
 Dd1jWiBG0T+IHM+fqOhydQqHSfTfoRoXotTHynmLcjil1oyIg4mnzHWHHQCqsTj7M9JY
 d1Eg==
X-Gm-Message-State: APjAAAVTBhzymRkRksyV/TVat9Hgz26yZ4bojqQ4UXoOQyxXVRB1eY3w
 K/SUp/M0IY6tZNOnkP8a7NgB9w==
X-Google-Smtp-Source: APXvYqwXHj5uVm2t/AeGvWcmeixCbqNTC6/9vS/5OT5LWc4yeua8wWhsULIPjXFvzVGVBE3iOaNS5Q==
X-Received: by 2002:a17:902:b713:: with SMTP id
 d19mr79658807pls.123.1559127441569; 
 Wed, 29 May 2019 03:57:21 -0700 (PDT)
Received: from localhost.localdomain ([49.206.202.218])
 by smtp.gmail.com with ESMTPSA id 184sm18974479pfa.48.2019.05.29.03.57.17
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 29 May 2019 03:57:21 -0700 (PDT)
From: Jagan Teki <jagan@amarulasolutions.com>
To: Maxime Ripard <maxime.ripard@bootlin.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Chen-Yu Tsai <wens@csie.org>,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [DO NOT MERGE] [PATCH v9 9/9] arm64: dts: allwinner:
 oceanic-5205-5inmfd: Enable Microtech MTF050FHDI-03 panel
Date: Wed, 29 May 2019 16:26:15 +0530
Message-Id: <20190529105615.14027-10-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.18.0.321.gffc6fa0e3
In-Reply-To: <20190529105615.14027-1-jagan@amarulasolutions.com>
References: <20190529105615.14027-1-jagan@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=lMfuNcsK6tuVz7vC7aYS5UVf9NSaVZRFtcoyHVQ3R8M=;
 b=KwCs5fOwghwsU5zqVfivfYLGzuV2zoFcgXvqpGrFf4v+qrweHmIqI0lJmPNL4epz5f
 bMMAXr+tuk70/z4UYM5UxW/zi770+a2NqzhFNfecL2Sa4PWCiHz5H6EUHkB0fy4ge9Bq
 8jK10Q21ii1l1Z/AYeX41oTpqgi372oJT7KSA=
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

TWljcm90ZWNoIE1URjA1MEZIREktMDMgaXMgMTA4MHgxOTIwLCA0LWxhbmUgTUlQSSBEU0kgTENE
IHBhbmVsIHdoaWNoCmhhcyBpbmJ1aWx0IE5UMzU1OTYgSUMgY2hpcC4KCkRTSSBwYW5lbCBjb25u
ZWN0ZWQgdG8gYm9hcmQgdmlhIDM5LXBpbiBGUEMgcG9ydCB3aXRoLAotIERMRE8xIGFzIFZDQy1E
U0kgc3VwcGx5Ci0gRExETzIgYXMgRFZERCBzdXBwbHkKLSBEQzFTVyBhcyBBVkREIHN1cHBseQot
IERDMVNXIGFzIEFWRUUgc3VwcGx5Ci0gUEQyNCBncGlvIGZvciByZXNldCBwaW4KLSBQSDEwIGdw
aW8gZm9yIGJhY2tsaWdodCBlbmFibGUgcGluCgpUZXN0ZWQtYnk6IFRhbWFzIFBhcHAgPHRhbWFz
QG9zdWtsLmNvbT4KU2lnbmVkLW9mZi1ieTogUnlhbiBQYW5uZWxsIDxyeWFuQG9zdWtsLmNvbT4K
U2lnbmVkLW9mZi1ieTogTWljaGFlbCBUcmltYXJjaGkgPG1pY2hhZWxAYW1hcnVsYXNvbHV0aW9u
cy5jb20+ClNpZ25lZC1vZmYtYnk6IEphZ2FuIFRla2kgPGphZ2FuQGFtYXJ1bGFzb2x1dGlvbnMu
Y29tPgotLS0KIC4uLi9zdW41MGktYTY0LW9jZWFuaWMtNTIwNS01aW5tZmQuZHRzICAgICAgICB8
IDQ5ICsrKysrKysrKysrKysrKysrKysKIDEgZmlsZSBjaGFuZ2VkLCA0OSBpbnNlcnRpb25zKCsp
CgpkaWZmIC0tZ2l0IGEvYXJjaC9hcm02NC9ib290L2R0cy9hbGx3aW5uZXIvc3VuNTBpLWE2NC1v
Y2VhbmljLTUyMDUtNWlubWZkLmR0cyBiL2FyY2gvYXJtNjQvYm9vdC9kdHMvYWxsd2lubmVyL3N1
bjUwaS1hNjQtb2NlYW5pYy01MjA1LTVpbm1mZC5kdHMKaW5kZXggYTRkZGMwYjk2NjRjLi5hYjll
ZTEwYmE2YTIgMTAwNjQ0Ci0tLSBhL2FyY2gvYXJtNjQvYm9vdC9kdHMvYWxsd2lubmVyL3N1bjUw
aS1hNjQtb2NlYW5pYy01MjA1LTVpbm1mZC5kdHMKKysrIGIvYXJjaC9hcm02NC9ib290L2R0cy9h
bGx3aW5uZXIvc3VuNTBpLWE2NC1vY2VhbmljLTUyMDUtNWlubWZkLmR0cwpAQCAtOCw2ICs4LDcg
QEAKIC9kdHMtdjEvOwogCiAjaW5jbHVkZSAic3VuNTBpLWE2NC1zb3BpbmUuZHRzaSIKKyNpbmNs
dWRlIDxkdC1iaW5kaW5ncy9wd20vcHdtLmg+CiAKIC8gewogCW1vZGVsID0gIk9jZWFuaWMgNTIw
NSA1aW5NRkQiOwpAQCAtMjIsNiArMjMsMTUgQEAKIAkJc3Rkb3V0LXBhdGggPSAic2VyaWFsMDox
MTUyMDBuOCI7CiAJfTsKIAorCWJhY2tsaWdodDogYmFja2xpZ2h0IHsKKwkJY29tcGF0aWJsZSA9
ICJwd20tYmFja2xpZ2h0IjsKKwkJcHdtcyA9IDwmcl9wd20gMCA1MDAwMCBQV01fUE9MQVJJVFlf
SU5WRVJURUQ+OworCQlicmlnaHRuZXNzLWxldmVscyA9IDw0MTIgNTEyPjsKKwkJbnVtLWludGVy
cG9sYXRlZC1zdGVwcyA9IDwxMDA+OworCQlkZWZhdWx0LWJyaWdodG5lc3MtbGV2ZWwgPSA8MTAw
PjsKKwkJZW5hYmxlLWdwaW9zID0gPCZwaW8gNyAxMCBHUElPX0FDVElWRV9ISUdIPjsgLyogTENE
LUJMLUVOOiBQSDEwICovCisJfTsKKwogCWNhbl9vc2M6IGNhbi1vc2MgewogCQljb21wYXRpYmxl
ID0gImZpeGVkLWNsb2NrIjsKIAkJI2Nsb2NrLWNlbGxzID0gPDA+OwpAQCAtNDAsNiArNTAsMjkg
QEAKIAl9OwogfTsKIAorJmRlIHsKKwlzdGF0dXMgPSAib2theSI7Cit9OworCismZHBoeSB7CisJ
c3RhdHVzID0gIm9rYXkiOworfTsKKworJmRzaSB7CisJdmNjLWRzaS1zdXBwbHkgPSA8JnJlZ19k
bGRvMT47CQkvKiBWQ0MtRFNJICovCisJc3RhdHVzID0gIm9rYXkiOworCisJcGFuZWxAMCB7CisJ
CWNvbXBhdGlibGUgPSAibWljcm90ZWNoLG10ZjA1MGZoZGktMDMiLCAibm92YXRlayxudDM1NTk2
IjsKKwkJcmVnID0gPDA+OworCQlkdmRkLXN1cHBseSA9IDwmcmVnX2RsZG8yPjsJCQkvKiBWQ0Mt
TUlQSSAqLworCQlhdmRkLXN1cHBseSA9IDwmcmVnX2RjMXN3PjsJCQkvKiBBVkREXzVWMCAqLwor
CQlhdmVlLXN1cHBseSA9IDwmcmVnX2RjMXN3PjsJCQkvKiBBVkVFXzVWICovCisJCXJlc2V0LWdw
aW9zID0gPCZwaW8gMyAyNCBHUElPX0FDVElWRV9ISUdIPjsJLyogTENELVJTVDogUEQyNCAqLwor
CQliYWNrbGlnaHQgPSA8JmJhY2tsaWdodD47CisJfTsKK307CisKICZlaGNpMCB7CiAJc3RhdHVz
ID0gIm9rYXkiOwogfTsKQEAgLTgxLDEwICsxMTQsMjYgQEAKIAlzdGF0dXMgPSAib2theSI7CiB9
OwogCismcl9wd20geworCXN0YXR1cyA9ICJva2F5IjsKK307CisKICZyZWdfZGMxc3cgewogCXJl
Z3VsYXRvci1uYW1lID0gInZjYy1waHkiOwogfTsKIAorJnJlZ19kbGRvMSB7CisJcmVndWxhdG9y
LW1pbi1taWNyb3ZvbHQgPSA8MzMwMDAwMD47CisJcmVndWxhdG9yLW1heC1taWNyb3ZvbHQgPSA8
MzMwMDAwMD47CisJcmVndWxhdG9yLW5hbWUgPSAidmNjLWRzaSI7Cit9OworCismcmVnX2RsZG8y
IHsKKwlyZWd1bGF0b3ItbWluLW1pY3Jvdm9sdCA9IDwxODAwMDAwPjsKKwlyZWd1bGF0b3ItbWF4
LW1pY3Jvdm9sdCA9IDwxODAwMDAwPjsKKwlyZWd1bGF0b3ItbmFtZSA9ICJ2Y2MtbWlwaSI7Cit9
OworCiAmcmVnX2xkb19pbzAgewogCXJlZ3VsYXRvci1taW4tbWljcm92b2x0ID0gPDI4MDAwMDA+
OwogCXJlZ3VsYXRvci1tYXgtbWljcm92b2x0ID0gPDI4MDAwMDA+OwotLSAKMi4xOC4wLjMyMS5n
ZmZjNmZhMGUzCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcK
aHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
