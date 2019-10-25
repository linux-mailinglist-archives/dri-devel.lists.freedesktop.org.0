Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C541CE52B2
	for <lists+dri-devel@lfdr.de>; Fri, 25 Oct 2019 19:57:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D60B6EB33;
	Fri, 25 Oct 2019 17:57:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com
 [IPv6:2607:f8b0:4864:20::541])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 93E276EB33
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Oct 2019 17:57:20 +0000 (UTC)
Received: by mail-pg1-x541.google.com with SMTP id 15so2010552pgt.7
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Oct 2019 10:57:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=hB0pIIBATDj7XQ4Wbz8E3uJD/S6VmCRjrZ4dOAWqf50=;
 b=P0jRQ1JtpdrNo4+rk3eUu/bA09GpEx3W+5h/jaCZfTclvrk783fjeCTZ+2zfjevvlh
 ENCQ7eUGqRgvXb5kyZ1KZH7xN9EOwbCo2ROsHbcDm4Lbn6T6cVIm9sPM2ewYKcaY3KRJ
 VdKtAvNscOIA6MlbTJtrVvI0ssrlF8klYT/vNgtVoyYCGOMzSqQbfQCVyre+EK+mS4U4
 KyopaTdaWdEJImBUZzFAIzzksytPKXZjweUXH1yAPVE5+DfISMvN1ANYGkW3YZVotf88
 QYBPaxsffxe+FmRAJh4jyJ/BO3l604DkFbpMkAmsi51mzG6HmjCuehRT/6gvkj4x+U86
 qO7Q==
X-Gm-Message-State: APjAAAWVdDMr5OEm6OJPqGuglN4CjaEcy/LePUBBBI0TMX9VlbPigEgg
 KDqJK8jfQtpKyGPMVJ4GzsSTTQ==
X-Google-Smtp-Source: APXvYqwdTJlUGTm+q1YNKr1WJaGf+nuFBu7RLYAgAbmjqIUdbjCZk1Dq6OuM4dn4dfQhV5DB7NIKOA==
X-Received: by 2002:a63:5949:: with SMTP id j9mr5883267pgm.371.1572026240010; 
 Fri, 25 Oct 2019 10:57:20 -0700 (PDT)
Received: from localhost.localdomain ([115.97.180.31])
 by smtp.gmail.com with ESMTPSA id n15sm2926580pfq.146.2019.10.25.10.57.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Oct 2019 10:57:19 -0700 (PDT)
From: Jagan Teki <jagan@amarulasolutions.com>
To: Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Subject: [PATCH v11 6/7] arm64: dts: allwinner: a64: Add MIPI DSI pipeline
Date: Fri, 25 Oct 2019 23:26:24 +0530
Message-Id: <20191025175625.8011-7-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.18.0.321.gffc6fa0e3
In-Reply-To: <20191025175625.8011-1-jagan@amarulasolutions.com>
References: <20191025175625.8011-1-jagan@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=hB0pIIBATDj7XQ4Wbz8E3uJD/S6VmCRjrZ4dOAWqf50=;
 b=SkOqSdCSPwXVo+8qdnvvqQ/eR8joWBQ7R/hkeU1jJh6Su00UdT34oEa4pXkqCwoSYq
 9HH2cMeJ6Hnb1nKXhGJddZqFkm6mIhaVR/ns24QaXViklZ1EyzUjUD4slpI+UVxsUl2X
 xQYMYFF31vAm/WVlAOSddJYOkLq0p9ec3aOcM=
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

QWRkIE1JUEkgRFNJIHBpcGVsaW5lIGZvciBBbGx3aW5uZXIgQTY0LgoKLSBkc2kgbm9kZSwgd2l0
aCBBNjQgY29tcGF0aWJsZSBzaW5jZSBpdCBkb2Vzbid0IHN1cHBvcnQKICBEU0lfU0NMSyBnYXRp
bmcgdW5saWtlIEEzMwotIGRwaHkgbm9kZSwgd2l0aCBBNjQgY29tcGF0aWJsZSB3aXRoIEEzMyBm
YWxsYmFjayBzaW5jZQogIERQSFkgb24gQTY0IGFuZCBBMzMgaXMgc2ltaWxhcgotIGZpbmFsbHks
IGF0dGFjaCB0aGUgZHNpX2luIHRvIHRjb24wIGZvciBjb21wbGV0ZSBNSVBJIERTSQoKU2lnbmVk
LW9mZi1ieTogSmFnYW4gVGVraSA8amFnYW5AYW1hcnVsYXNvbHV0aW9ucy5jb20+ClRlc3RlZC1i
eTogTWVybGlqbiBXYWplciA8bWVybGlqbkB3aXp6dXAub3JnPgotLS0KIGFyY2gvYXJtNjQvYm9v
dC9kdHMvYWxsd2lubmVyL3N1bjUwaS1hNjQuZHRzaSB8IDM3ICsrKysrKysrKysrKysrKysrKysK
IDEgZmlsZSBjaGFuZ2VkLCAzNyBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvYXJjaC9hcm02
NC9ib290L2R0cy9hbGx3aW5uZXIvc3VuNTBpLWE2NC5kdHNpIGIvYXJjaC9hcm02NC9ib290L2R0
cy9hbGx3aW5uZXIvc3VuNTBpLWE2NC5kdHNpCmluZGV4IDY5MTI4YTZkZmM0Ni4uYTUyZGZhOThh
YzVlIDEwMDY0NAotLS0gYS9hcmNoL2FybTY0L2Jvb3QvZHRzL2FsbHdpbm5lci9zdW41MGktYTY0
LmR0c2kKKysrIGIvYXJjaC9hcm02NC9ib290L2R0cy9hbGx3aW5uZXIvc3VuNTBpLWE2NC5kdHNp
CkBAIC0zODIsNiArMzgyLDEyIEBACiAJCQkJCSNhZGRyZXNzLWNlbGxzID0gPDE+OwogCQkJCQkj
c2l6ZS1jZWxscyA9IDwwPjsKIAkJCQkJcmVnID0gPDE+OworCisJCQkJCXRjb24wX291dF9kc2k6
IGVuZHBvaW50QDEgeworCQkJCQkJcmVnID0gPDE+OworCQkJCQkJcmVtb3RlLWVuZHBvaW50ID0g
PCZkc2lfaW5fdGNvbjA+OworCQkJCQkJYWxsd2lubmVyLHRjb24tY2hhbm5lbCA9IDwxPjsKKwkJ
CQkJfTsKIAkJCQl9OwogCQkJfTsKIAkJfTsKQEAgLTEwMDMsNiArMTAwOSwzNyBAQAogCQkJc3Rh
dHVzID0gImRpc2FibGVkIjsKIAkJfTsKIAorCQlkc2k6IGRzaUAxY2EwMDAwIHsKKwkJCWNvbXBh
dGlibGUgPSAiYWxsd2lubmVyLHN1bjUwaS1hNjQtbWlwaS1kc2kiOworCQkJcmVnID0gPDB4MDFj
YTAwMDAgMHgxMDAwPjsKKwkJCWludGVycnVwdHMgPSA8R0lDX1NQSSA4OSBJUlFfVFlQRV9MRVZF
TF9ISUdIPjsKKwkJCWNsb2NrcyA9IDwmY2N1IENMS19CVVNfTUlQSV9EU0k+OworCQkJcmVzZXRz
ID0gPCZjY3UgUlNUX0JVU19NSVBJX0RTST47CisJCQlwaHlzID0gPCZkcGh5PjsKKwkJCXBoeS1u
YW1lcyA9ICJkcGh5IjsKKwkJCXN0YXR1cyA9ICJkaXNhYmxlZCI7CisJCQkjYWRkcmVzcy1jZWxs
cyA9IDwxPjsKKwkJCSNzaXplLWNlbGxzID0gPDA+OworCisJCQlwb3J0IHsKKwkJCQlkc2lfaW5f
dGNvbjA6IGVuZHBvaW50IHsKKwkJCQkJcmVtb3RlLWVuZHBvaW50ID0gPCZ0Y29uMF9vdXRfZHNp
PjsKKwkJCQl9OworCQkJfTsKKwkJfTsKKworCQlkcGh5OiBkLXBoeUAxY2ExMDAwIHsKKwkJCWNv
bXBhdGlibGUgPSAiYWxsd2lubmVyLHN1bjUwaS1hNjQtbWlwaS1kcGh5IiwKKwkJCQkgICAgICJh
bGx3aW5uZXIsc3VuNmktYTMxLW1pcGktZHBoeSI7CisJCQlyZWcgPSA8MHgwMWNhMTAwMCAweDEw
MDA+OworCQkJY2xvY2tzID0gPCZjY3UgQ0xLX0JVU19NSVBJX0RTST4sCisJCQkJIDwmY2N1IENM
S19EU0lfRFBIWT47CisJCQljbG9jay1uYW1lcyA9ICJidXMiLCAibW9kIjsKKwkJCXJlc2V0cyA9
IDwmY2N1IFJTVF9CVVNfTUlQSV9EU0k+OworCQkJc3RhdHVzID0gImRpc2FibGVkIjsKKwkJCSNw
aHktY2VsbHMgPSA8MD47CisJCX07CisKIAkJaGRtaTogaGRtaUAxZWUwMDAwIHsKIAkJCWNvbXBh
dGlibGUgPSAiYWxsd2lubmVyLHN1bjUwaS1hNjQtZHctaGRtaSIsCiAJCQkJICAgICAiYWxsd2lu
bmVyLHN1bjhpLWE4M3QtZHctaGRtaSI7Ci0tIAoyLjE4LjAuMzIxLmdmZmM2ZmEwZTMKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWls
aW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
