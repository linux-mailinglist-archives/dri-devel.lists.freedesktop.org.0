Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CE6CE464A7
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jun 2019 18:44:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C57C89B49;
	Fri, 14 Jun 2019 16:44:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com
 [IPv6:2607:f8b0:4864:20::641])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 48E1D89B3C
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jun 2019 16:44:14 +0000 (UTC)
Received: by mail-pl1-x641.google.com with SMTP id bh12so1246505plb.4
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jun 2019 09:44:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=aKv8CY3ZfTC87OfgidzsL+oxrJ/KYUyR5hJ1sg73Mj4=;
 b=cMnnKTwTaespZHJz30JIx32OeqnX1RwEZCAAlQNoBxV+2bY+3TrOCt5F3KfqEJqkhx
 FVC84jaLHXBM3s5Y/B6hZEWOYQAXz9dkptNb1hZKDPow19x51Bo/6ynHF2ve42FOZozH
 N+1Zl2BD+RW8gQ5y7ZoolsCG3iNHvtBt0VJyv4hYImh2oCegFdJVVos/deX1uZRBxAhe
 Kxd0hMevMJAj/s2kezxT+Kg5zd9GecYAyd7OI7emlLig6nolwIIRBvnwj7wL4Hq8ulFD
 t9I2vmdwM0YjF7tS0JMrHLFJtJNcjMdomaUlYeXk4vglG9UjUHDWSI8enMPjZaLPxHoQ
 riWg==
X-Gm-Message-State: APjAAAU3t+3k/gnRfXPAyqw1lxwo75NGYiqc9Fg9dAjMs+tfGygzRREX
 YP5s1Fu+2bHlwDXuJh2oXI+UxA==
X-Google-Smtp-Source: APXvYqxMiswcOeVpyj6jjn8GX8TtC9BLtw38K+dIqWFzUkLrUCWAVI2CE4J1QmRx2OADdXWb0ZNg+w==
X-Received: by 2002:a17:902:ac1:: with SMTP id
 59mr16384176plp.168.1560530653656; 
 Fri, 14 Jun 2019 09:44:13 -0700 (PDT)
Received: from localhost.localdomain ([115.97.180.18])
 by smtp.gmail.com with ESMTPSA id 85sm1639583pfv.130.2019.06.14.09.44.10
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 14 Jun 2019 09:44:13 -0700 (PDT)
From: Jagan Teki <jagan@amarulasolutions.com>
To: Maxime Ripard <maxime.ripard@bootlin.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Chen-Yu Tsai <wens@csie.org>,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 Jernej Skrabec <jernej.skrabec@siol.net>
Subject: [PATCH v2 8/9] ARM: dts: sun8i: r40: Add MIPI DSI pipeline
Date: Fri, 14 Jun 2019 22:13:23 +0530
Message-Id: <20190614164324.9427-9-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.18.0.321.gffc6fa0e3
In-Reply-To: <20190614164324.9427-1-jagan@amarulasolutions.com>
References: <20190614164324.9427-1-jagan@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=aKv8CY3ZfTC87OfgidzsL+oxrJ/KYUyR5hJ1sg73Mj4=;
 b=NxRS0jSVSMU9QoyAVgh1BVsCGJofm5X4ZtviIzOFd68haxBmO9IG1AsOz1N5feSORY
 i+tcwa3vVkGsoDIMkTvG0L84o/R4WE3qfnWtL53buXPBMM6UJcoU3K8bhunfzCsBWVAm
 ot7YEz/Kc+CgmTNQYUMdBtJDxOVKmHYufJMgM=
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

QWRkIE1JUEkgRFNJIHBpcGVsaW5lIGZvciBBbGx3aW5uZXIgUjQwLgoKVW5saWtlIGNvbnZlbnRp
b25hbCBEaXNwbGF5IHBpcGVsaW5lIGluIGFsbHdpbm5lciwgUjQwIGhhdmUKVENPTiBUQ09QIHdo
aWNoIHdvdWxkIGludGVyYWN0IHZhcmlvdXMgYmxvY2sgbGlrZSBtdXhlcywKdGNvbiBsY2QsIHRj
b25fdHYgZm9yIGJldHRlciBwaXBlbGluZSBmaXR0aW5nLgoKRm9yIE1JUEkgRFNJIHBpcGVsaW5l
LCB3ZSBoYXZlIHRvIGNvbmZpZ3VyZSB0aGUgdGNvbl9sY2QwCmJsb2NrIHdoaWNoIHdvdWxkIGlu
dGVyYWN0IHdpdGggdGNvbl90b3AgZm9yIHVwcGVyIHBpcGVsaW5lCmNvbm5lY3Rpb25zIGFuZCBk
c2kgYmxvY2sgZm9yIGxvd2VyIHBpcGVsaW5lIGNvbm5lY3Rpb25zLgoKU28sIHRoaXMgcGF0Y2gg
Y3JlYXRlZCB0aGF0IHBpcGVsaW5lIGJ5IGFkZGluZyBuZXcgbm9kZXMKZm9yIHRjb25fbGNkMCwg
ZHNpLCBkcGh5IGFuZCBjb25uZXQgdGhlbSB0byBtYWtlIHByb3BlcgpwaXBlbGluZSBmaXR0aW5n
LgoKU2lnbmVkLW9mZi1ieTogSmFnYW4gVGVraSA8amFnYW5AYW1hcnVsYXNvbHV0aW9ucy5jb20+
Ci0tLQogYXJjaC9hcm0vYm9vdC9kdHMvc3VuOGktcjQwLmR0c2kgfCA3MyArKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKwogMSBmaWxlIGNoYW5nZWQsIDczIGluc2VydGlvbnMoKykKCmRp
ZmYgLS1naXQgYS9hcmNoL2FybS9ib290L2R0cy9zdW44aS1yNDAuZHRzaSBiL2FyY2gvYXJtL2Jv
b3QvZHRzL3N1bjhpLXI0MC5kdHNpCmluZGV4IDIxOWQyZGNhMTZiMy4uZWI2YjI5NjBjNzAwIDEw
MDY0NAotLS0gYS9hcmNoL2FybS9ib290L2R0cy9zdW44aS1yNDAuZHRzaQorKysgYi9hcmNoL2Fy
bS9ib290L2R0cy9zdW44aS1yNDAuZHRzaQpAQCAtNjIzLDYgKzYyMyw3IEBACiAKIAkJCQkJdGNv
bl90b3BfbWl4ZXIwX291dF90Y29uX2xjZDA6IGVuZHBvaW50QDAgewogCQkJCQkJcmVnID0gPDA+
OworCQkJCQkJcmVtb3RlLWVuZHBvaW50ID0gPCZ0Y29uX2xjZDBfaW5fdGNvbl90b3BfbWl4ZXIw
PjsKIAkJCQkJfTsKIAogCQkJCQl0Y29uX3RvcF9taXhlcjBfb3V0X3Rjb25fbGNkMTogZW5kcG9p
bnRAMSB7CkBAIC03MDEsNiArNzAyLDQ1IEBACiAJCQl9OwogCQl9OwogCisJCXRjb25fbGNkMDog
bGNkLWNvbnRyb2xsZXJAMWM3MTAwMCB7CisJCQljb21wYXRpYmxlID0gImFsbHdpbm5lcixzdW44
aS1yNDAtdGNvbi1sY2QiOworCQkJcmVnID0gPDB4MDFjNzEwMDAgMHgxMDAwPjsKKwkJCWludGVy
cnVwdHMgPSA8R0lDX1NQSSA0NCBJUlFfVFlQRV9MRVZFTF9ISUdIPjsKKwkJCWNsb2NrcyA9IDwm
Y2N1IENMS19CVVNfVENPTl9MQ0QwPiwgPCZjY3UgQ0xLX1RDT05fTENEMD47CisJCQljbG9jay1u
YW1lcyA9ICJhaGIiLCAidGNvbi1jaDAiOworCQkJY2xvY2stb3V0cHV0LW5hbWVzID0gInRjb24t
cGl4ZWwtY2xvY2siOworCQkJcmVzZXRzID0gPCZjY3UgUlNUX0JVU19UQ09OX0xDRDA+LCA8JmNj
dSBSU1RfQlVTX0xWRFM+OworCQkJcmVzZXQtbmFtZXMgPSAibGNkIiwgImx2ZHMiOworCQkJc3Rh
dHVzID0gImRpc2FibGVkIjsKKworCQkJcG9ydHMgeworCQkJCSNhZGRyZXNzLWNlbGxzID0gPDE+
OworCQkJCSNzaXplLWNlbGxzID0gPDA+OworCisJCQkJdGNvbl9sY2QwX2luOiBwb3J0QDAgewor
CQkJCQkjYWRkcmVzcy1jZWxscyA9IDwxPjsKKwkJCQkJI3NpemUtY2VsbHMgPSA8MD47CisJCQkJ
CXJlZyA9IDwwPjsKKworCQkJCQl0Y29uX2xjZDBfaW5fdGNvbl90b3BfbWl4ZXIwOiBlbmRwb2lu
dEAwIHsKKwkJCQkJCXJlZyA9IDwwPjsKKwkJCQkJCXJlbW90ZS1lbmRwb2ludCA9IDwmdGNvbl90
b3BfbWl4ZXIwX291dF90Y29uX2xjZDA+OworCQkJCQl9OworCQkJCX07CisKKwkJCQl0Y29uX2xj
ZDBfb3V0OiBwb3J0QDEgeworCQkJCQkjYWRkcmVzcy1jZWxscyA9IDwxPjsKKwkJCQkJI3NpemUt
Y2VsbHMgPSA8MD47CisJCQkJCXJlZyA9IDwxPjsKKworCQkJCQl0Y29uX2xjZDBfb3V0X2RzaV9v
dXQ6IGVuZHBvaW50QDEgeworCQkJCQkJcmVnID0gPDE+OworCQkJCQkJcmVtb3RlLWVuZHBvaW50
ID0gPCZkc2lfaW5fdGNvbl9sY2QwX291dD47CisJCQkJCX07CisJCQkJfTsKKwkJCX07CisJCX07
CisKIAkJdGNvbl90djA6IGxjZC1jb250cm9sbGVyQDFjNzMwMDAgewogCQkJY29tcGF0aWJsZSA9
ICJhbGx3aW5uZXIsc3VuOGktcjQwLXRjb24tdHYiOwogCQkJcmVnID0gPDB4MDFjNzMwMDAgMHgx
MDAwPjsKQEAgLTc5OCw2ICs4MzgsMzkgQEAKIAkJCWludGVycnVwdHMgPSA8R0lDX1BQSSA5IChH
SUNfQ1BVX01BU0tfU0lNUExFKDQpIHwgSVJRX1RZUEVfTEVWRUxfSElHSCk+OwogCQl9OwogCisJ
CWRzaTogZHNpQDFjYTAwMDAgeworCQkJY29tcGF0aWJsZSA9ICJhbGx3aW5uZXIsc3VuOGktcjQw
LW1pcGktZHNpIiwKKwkJCQkgICAgICJhbGx3aW5uZXIsc3VuNTBpLWE2NC1taXBpLWRzaSI7CisJ
CQlyZWcgPSA8MHgwMWNhMDAwMCAweDEwMDA+OworCQkJaW50ZXJydXB0cyA9IDxHSUNfU1BJIDU3
IElSUV9UWVBFX0xFVkVMX0hJR0g+OworCQkJY2xvY2tzID0gPCZjY3UgQ0xLX0JVU19NSVBJX0RT
ST47CisJCQljbG9jay1uYW1lcyA9ICJidXMiOworCQkJcmVzZXRzID0gPCZjY3UgUlNUX0JVU19N
SVBJX0RTST47CisJCQlwaHlzID0gPCZkcGh5PjsKKwkJCXBoeS1uYW1lcyA9ICJkcGh5IjsKKwkJ
CXN0YXR1cyA9ICJkaXNhYmxlZCI7CisJCQkjYWRkcmVzcy1jZWxscyA9IDwxPjsKKwkJCSNzaXpl
LWNlbGxzID0gPDA+OworCisJCQlwb3J0IHsKKwkJCQlkc2lfaW5fdGNvbl9sY2QwX291dDogZW5k
cG9pbnQgeworCQkJCQlyZW1vdGUtZW5kcG9pbnQgPSA8JnRjb25fbGNkMF9vdXRfZHNpX291dD47
CisJCQkJfTsKKwkJCX07CisJCX07CisKKwkJZHBoeTogZC1waHlAMWNhMTAwMCB7CisJCQljb21w
YXRpYmxlID0gImFsbHdpbm5lcixzdW44aS1yNDAtbWlwaS1kcGh5IiwKKwkJCQkgICAgICJhbGx3
aW5uZXIsc3VuNmktYTMxLW1pcGktZHBoeSI7CisJCQlyZWcgPSA8MHgwMWNhMTAwMCAweDEwMDA+
OworCQkJY2xvY2tzID0gPCZjY3UgQ0xLX0JVU19NSVBJX0RTST4sCisJCQkJIDwmdGNvbl90b3Ag
Q0xLX1RDT05fVE9QX0RTST47CisJCQljbG9jay1uYW1lcyA9ICJidXMiLCAibW9kIjsKKwkJCXJl
c2V0cyA9IDwmY2N1IFJTVF9CVVNfTUlQSV9EU0k+OworCQkJc3RhdHVzID0gImRpc2FibGVkIjsK
KwkJCSNwaHktY2VsbHMgPSA8MD47CisJCX07CisKIAkJaGRtaTogaGRtaUAxZWUwMDAwIHsKIAkJ
CWNvbXBhdGlibGUgPSAiYWxsd2lubmVyLHN1bjhpLXI0MC1kdy1oZG1pIiwKIAkJCQkgICAgICJh
bGx3aW5uZXIsc3VuOGktYTgzdC1kdy1oZG1pIjsKLS0gCjIuMTguMC4zMjEuZ2ZmYzZmYTBlMwoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
