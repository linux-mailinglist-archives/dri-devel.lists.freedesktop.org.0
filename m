Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EB9CC44B37
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jun 2019 20:54:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4051C89870;
	Thu, 13 Jun 2019 18:54:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com
 [IPv6:2607:f8b0:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F31F89870
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jun 2019 18:54:02 +0000 (UTC)
Received: by mail-pf1-x441.google.com with SMTP id j2so12388652pfe.6
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jun 2019 11:54:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=MxUBHxdyKSzAEkz8czOIEFewVHEPOOsCs5aBdAtPCog=;
 b=AANv3ap/3KhoARqzLYJAAloplZkYRImCg/MKky7chak08bxYlOIheSDUmvsaSgCT5L
 wdD19hHEN0Qw8A3TM7lWXeBGJPPKa0Gl61ULGUnA2KHe0z99ne4EKFSNjO/P9cpj7yEg
 1+beqIa4DT0oxGGaZqN8sd1ZgmjAiGshiQizBnvHX01i+MnWhLeNF6CqLMz3zhLukO0n
 trqTdcMgB3wyWKl1Ld7PlpJ1r+SXmuzz2thxpOlwIJ5yCGA40ENPDMh1bpGUcr+RgEco
 TKSdb9Vb6gm9A2w98yIniMaC1kpBG9vrvBTcHk4O6r9LnfMtmZrXb0Rf2596sPOMnaZ5
 gqVw==
X-Gm-Message-State: APjAAAXcocrK+6ai/kgOJ4HduBdWYa3o7YOsgZr22kzpWNglDCJbzBih
 +j2pPlGVNQGdK6lyDAMyzjVwKQ==
X-Google-Smtp-Source: APXvYqwk7NSKhbPrQsFpyhC5tg7Fy+h3BJ/6OroJFVaqFFLZ0+/oLQ3lZQhgppFUTYV9k17o5ZQ2qQ==
X-Received: by 2002:a63:9142:: with SMTP id l63mr14357491pge.185.1560452041895; 
 Thu, 13 Jun 2019 11:54:01 -0700 (PDT)
Received: from localhost.localdomain ([115.97.180.18])
 by smtp.gmail.com with ESMTPSA id p43sm946314pjp.4.2019.06.13.11.53.57
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 13 Jun 2019 11:54:01 -0700 (PDT)
From: Jagan Teki <jagan@amarulasolutions.com>
To: Maxime Ripard <maxime.ripard@bootlin.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Chen-Yu Tsai <wens@csie.org>,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 Jernej Skrabec <jernej.skrabec@siol.net>
Subject: [PATCH 3/9] ARM: dts: sun8i: r40: Use tcon top clock index macros
Date: Fri, 14 Jun 2019 00:22:35 +0530
Message-Id: <20190613185241.22800-4-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.18.0.321.gffc6fa0e3
In-Reply-To: <20190613185241.22800-1-jagan@amarulasolutions.com>
References: <20190613185241.22800-1-jagan@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=MxUBHxdyKSzAEkz8czOIEFewVHEPOOsCs5aBdAtPCog=;
 b=Kume8Qo4DTG31GVT3HwqbSf3jX8+J5mtu6SNBDXX4prsKonHXwtLuXX1DCWbwlHeOw
 RHJzfX2ocMubC3vE5FSZ9hKhNTLlI9eva7D8JP29vVUiTPla+FjmevRgyG2Mf2GisNf0
 ujNCTpb7ZdioL8SUWW0FMmy5symxIEKBW2XOM=
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
Cc: linux-sunxi@googlegroups.com,
 Michael Trimarchi <michael@amarulasolutions.com>,
 linux-amarula@amarulasolutions.com, Jagan Teki <jagan@amarulasolutions.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

dGNvbl90djAsIHRjb25fdHYxIG5vZGVzIGhhdmUgYSBjbG9jayBuYW1lcyBvZiB0Y29uLWNoMCwK
dGNvbi1jaDEgd2hpY2ggYXJlIHJlZmVycmluZyB0Y29uX3RvcCBjbG9ja3MgdmlhIGluZGV4Cm51
bWJlcnMgbGlrZSAwLCAxIHdpdGggQ0xLX1RDT05fVFYwIGFuZCBDTEtfVENPTl9UVjEKcmVzcGVj
dGl2ZWx5LgoKVXNlIHRoZSBtYWNybyBpbiBwbGFjZSBvZiBpbmRleCBudW1iZXJzLCBmb3IgbW9y
ZSBjb2RlCnJlYWRhYmlsaXR5LgoKU2lnbmVkLW9mZi1ieTogSmFnYW4gVGVraSA8amFnYW5AYW1h
cnVsYXNvbHV0aW9ucy5jb20+Ci0tLQogYXJjaC9hcm0vYm9vdC9kdHMvc3VuOGktcjQwLmR0c2kg
fCA1ICsrKy0tCiAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygt
KQoKZGlmZiAtLWdpdCBhL2FyY2gvYXJtL2Jvb3QvZHRzL3N1bjhpLXI0MC5kdHNpIGIvYXJjaC9h
cm0vYm9vdC9kdHMvc3VuOGktcjQwLmR0c2kKaW5kZXggYmI4NTZlNTNiODA2Li4yMTlkMmRjYTE2
YjMgMTAwNjQ0Ci0tLSBhL2FyY2gvYXJtL2Jvb3QvZHRzL3N1bjhpLXI0MC5kdHNpCisrKyBiL2Fy
Y2gvYXJtL2Jvb3QvZHRzL3N1bjhpLXI0MC5kdHNpCkBAIC00NCw2ICs0NCw3IEBACiAjaW5jbHVk
ZSA8ZHQtYmluZGluZ3MvaW50ZXJydXB0LWNvbnRyb2xsZXIvYXJtLWdpYy5oPgogI2luY2x1ZGUg
PGR0LWJpbmRpbmdzL2Nsb2NrL3N1bjhpLWRlMi5oPgogI2luY2x1ZGUgPGR0LWJpbmRpbmdzL2Ns
b2NrL3N1bjhpLXI0MC1jY3UuaD4KKyNpbmNsdWRlIDxkdC1iaW5kaW5ncy9jbG9jay9zdW44aS10
Y29uLXRvcC5oPgogI2luY2x1ZGUgPGR0LWJpbmRpbmdzL3Jlc2V0L3N1bjhpLXI0MC1jY3UuaD4K
ICNpbmNsdWRlIDxkdC1iaW5kaW5ncy9yZXNldC9zdW44aS1kZTIuaD4KIApAQCAtNzA0LDcgKzcw
NSw3IEBACiAJCQljb21wYXRpYmxlID0gImFsbHdpbm5lcixzdW44aS1yNDAtdGNvbi10diI7CiAJ
CQlyZWcgPSA8MHgwMWM3MzAwMCAweDEwMDA+OwogCQkJaW50ZXJydXB0cyA9IDxHSUNfU1BJIDUx
IElSUV9UWVBFX0xFVkVMX0hJR0g+OwotCQkJY2xvY2tzID0gPCZjY3UgQ0xLX0JVU19UQ09OX1RW
MD4sIDwmdGNvbl90b3AgMD47CisJCQljbG9ja3MgPSA8JmNjdSBDTEtfQlVTX1RDT05fVFYwPiwg
PCZ0Y29uX3RvcCBDTEtfVENPTl9UT1BfVFYwPjsKIAkJCWNsb2NrLW5hbWVzID0gImFoYiIsICJ0
Y29uLWNoMSI7CiAJCQlyZXNldHMgPSA8JmNjdSBSU1RfQlVTX1RDT05fVFYwPjsKIAkJCXJlc2V0
LW5hbWVzID0gImxjZCI7CkBAIC03NDcsNyArNzQ4LDcgQEAKIAkJCWNvbXBhdGlibGUgPSAiYWxs
d2lubmVyLHN1bjhpLXI0MC10Y29uLXR2IjsKIAkJCXJlZyA9IDwweDAxYzc0MDAwIDB4MTAwMD47
CiAJCQlpbnRlcnJ1cHRzID0gPEdJQ19TUEkgNTIgSVJRX1RZUEVfTEVWRUxfSElHSD47Ci0JCQlj
bG9ja3MgPSA8JmNjdSBDTEtfQlVTX1RDT05fVFYxPiwgPCZ0Y29uX3RvcCAxPjsKKwkJCWNsb2Nr
cyA9IDwmY2N1IENMS19CVVNfVENPTl9UVjE+LCA8JnRjb25fdG9wIENMS19UQ09OX1RPUF9UVjE+
OwogCQkJY2xvY2stbmFtZXMgPSAiYWhiIiwgInRjb24tY2gxIjsKIAkJCXJlc2V0cyA9IDwmY2N1
IFJTVF9CVVNfVENPTl9UVjE+OwogCQkJcmVzZXQtbmFtZXMgPSAibGNkIjsKLS0gCjIuMTguMC4z
MjEuZ2ZmYzZmYTBlMwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRl
dmVs
