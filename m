Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 57B2944B44
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jun 2019 20:54:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BFC6F898BE;
	Thu, 13 Jun 2019 18:54:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com
 [IPv6:2607:f8b0:4864:20::543])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 18765898BE
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jun 2019 18:54:25 +0000 (UTC)
Received: by mail-pg1-x543.google.com with SMTP id k187so50109pga.0
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jun 2019 11:54:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=T/4U16vvQGase4vs4TRs7L3uRB2ytO65pgimZPKYacA=;
 b=hT4B2A/PbmA1YuOGSrzHA9J4tzwq5RUk34A+ZT1Ca11/mNVKV+r9ufdqkZMORm2dV1
 LJqKHdX4dvAVOrOHlbtjEFFOAl+PGjzG1exkfl4ST3Ap9dVLOSBG9Gui7M8KTSdhoKyp
 3Oc8x4U9V1qmHByYonjoOgB0bN47d64WGBa5rn3YIGSxV2BGH7IYsYKRTJOBH6gEmm9o
 Iu7VWov2olIRhBAQpr4VcU99y3AzDMPHPbd93069qn898C1gLD0ElgrxBtfElK92gc47
 zQ/cHqTLBjUo11a2yKM6+3RotHmADgimEGUdEsufgAD78rSzdczSIFbxR5kJX+fCxiHz
 CMLA==
X-Gm-Message-State: APjAAAUQHmfLv7l9yzWa+iR903xz8x/limDD54owWUk5hoChLyVKibf1
 KHOdQr0tv24JLjInfYjCPUV5iA==
X-Google-Smtp-Source: APXvYqxT+brkKX51G25d0U8KdaLgp4yzQxdSegwAI+SiWhaPnsQQo4LdoqiNNX1Bt+Ys7OneEcILbw==
X-Received: by 2002:a63:4d63:: with SMTP id n35mr2616452pgl.43.1560452064500; 
 Thu, 13 Jun 2019 11:54:24 -0700 (PDT)
Received: from localhost.localdomain ([115.97.180.18])
 by smtp.gmail.com with ESMTPSA id p43sm946314pjp.4.2019.06.13.11.54.20
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 13 Jun 2019 11:54:24 -0700 (PDT)
From: Jagan Teki <jagan@amarulasolutions.com>
To: Maxime Ripard <maxime.ripard@bootlin.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Chen-Yu Tsai <wens@csie.org>,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 Jernej Skrabec <jernej.skrabec@siol.net>
Subject: [PATCH 8/9] ARM: dts: sun8i: r40: Add MIPI DSI pipeline
Date: Fri, 14 Jun 2019 00:22:40 +0530
Message-Id: <20190613185241.22800-9-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.18.0.321.gffc6fa0e3
In-Reply-To: <20190613185241.22800-1-jagan@amarulasolutions.com>
References: <20190613185241.22800-1-jagan@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=T/4U16vvQGase4vs4TRs7L3uRB2ytO65pgimZPKYacA=;
 b=KbHFlaqMD2kqOC6eLMSZ/P/yNXg/rG2kkuDRU+E2oafp+sX5bCe/oyFFZWkokEFdpe
 KxLjoFo/XZKKnGHd8TH/oXi57kQ8/LCJ5yGIfggd39uHXR5u6PdisOd4M8IFVVS0QZfU
 0OVEi5vRXM7yY32N6shvO8wFE7A+MLq8ZD3PM=
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
b3QvZHRzL3N1bjhpLXI0MC5kdHNpCmluZGV4IDEyNTc2NTM2ZGY0YS4uM2VhMjQ1MTE1MWZmIDEw
MDY0NAotLS0gYS9hcmNoL2FybS9ib290L2R0cy9zdW44aS1yNDAuZHRzaQorKysgYi9hcmNoL2Fy
bS9ib290L2R0cy9zdW44aS1yNDAuZHRzaQpAQCAtNjIzLDYgKzYyMyw3IEBACiAKIAkJCQkJdGNv
bl90b3BfbWl4ZXIwX291dF90Y29uX2xjZDA6IGVuZHBvaW50QDAgewogCQkJCQkJcmVnID0gPDA+
OworCQkJCQkJcmVtb3RlLWVuZHBvaW50ID0gPCZ0Y29uX2xjZDBfaW5fdGNvbl90b3BfbWl4ZXIw
PjsKIAkJCQkJfTsKIAogCQkJCQl0Y29uX3RvcF9taXhlcjBfb3V0X3Rjb25fbGNkMTogZW5kcG9p
bnRAMSB7CkBAIC03MDEsNiArNzAyLDQ1IEBACiAJCQl9OwogCQl9OwogCisJCXRjb25fbGNkMDog
bGNkLWNvbnRyb2xsZXJAMWM3MTAwMCB7CisJCQljb21wYXRpYmxlID0gImFsbHdpbm5lcixzdW44
aS1yNDAtdGNvbi1sY2QiOworCQkJcmVnID0gPDB4MDFjNzEwMDAgMHgxMDAwPjsKKwkJCWludGVy
cnVwdHMgPSA8R0lDX1NQSSA0NCBJUlFfVFlQRV9MRVZFTF9ISUdIPjsKKwkJCWNsb2NrcyA9IDwm
Y2N1IENMS19CVVNfVENPTl9MQ0QwPiwgPCZ0Y29uX3RvcCBDTEtfVENPTl9UT1BfTENEMD47CisJ
CQljbG9jay1uYW1lcyA9ICJhaGIiLCAidGNvbi1jaDAiOworCQkJY2xvY2stb3V0cHV0LW5hbWVz
ID0gInRjb24tcGl4ZWwtY2xvY2siOworCQkJcmVzZXRzID0gPCZjY3UgUlNUX0JVU19UQ09OX0xD
RDA+LCA8JmNjdSBSU1RfQlVTX0xWRFM+OworCQkJcmVzZXQtbmFtZXMgPSAibGNkIiwgImx2ZHMi
OworCQkJc3RhdHVzID0gImRpc2FibGVkIjsKKworCQkJcG9ydHMgeworCQkJCSNhZGRyZXNzLWNl
bGxzID0gPDE+OworCQkJCSNzaXplLWNlbGxzID0gPDA+OworCisJCQkJdGNvbl9sY2QwX2luOiBw
b3J0QDAgeworCQkJCQkjYWRkcmVzcy1jZWxscyA9IDwxPjsKKwkJCQkJI3NpemUtY2VsbHMgPSA8
MD47CisJCQkJCXJlZyA9IDwwPjsKKworCQkJCQl0Y29uX2xjZDBfaW5fdGNvbl90b3BfbWl4ZXIw
OiBlbmRwb2ludEAwIHsKKwkJCQkJCXJlZyA9IDwwPjsKKwkJCQkJCXJlbW90ZS1lbmRwb2ludCA9
IDwmdGNvbl90b3BfbWl4ZXIwX291dF90Y29uX2xjZDA+OworCQkJCQl9OworCQkJCX07CisKKwkJ
CQl0Y29uX2xjZDBfb3V0OiBwb3J0QDEgeworCQkJCQkjYWRkcmVzcy1jZWxscyA9IDwxPjsKKwkJ
CQkJI3NpemUtY2VsbHMgPSA8MD47CisJCQkJCXJlZyA9IDwxPjsKKworCQkJCQl0Y29uX2xjZDBf
b3V0X2RzaV9vdXQ6IGVuZHBvaW50QDEgeworCQkJCQkJcmVnID0gPDE+OworCQkJCQkJcmVtb3Rl
LWVuZHBvaW50ID0gPCZkc2lfaW5fdGNvbl9sY2QwX291dD47CisJCQkJCX07CisJCQkJfTsKKwkJ
CX07CisJCX07CisKIAkJdGNvbl90djA6IGxjZC1jb250cm9sbGVyQDFjNzMwMDAgewogCQkJY29t
cGF0aWJsZSA9ICJhbGx3aW5uZXIsc3VuOGktcjQwLXRjb24tdHYiOwogCQkJcmVnID0gPDB4MDFj
NzMwMDAgMHgxMDAwPjsKQEAgLTc5OCw2ICs4MzgsMzkgQEAKIAkJCWludGVycnVwdHMgPSA8R0lD
X1BQSSA5IChHSUNfQ1BVX01BU0tfU0lNUExFKDQpIHwgSVJRX1RZUEVfTEVWRUxfSElHSCk+Owog
CQl9OwogCisJCWRzaTogZHNpQDFjYTAwMDAgeworCQkJY29tcGF0aWJsZSA9ICJhbGx3aW5uZXIs
c3VuOGktcjQwLW1pcGktZHNpIiwKKwkJCQkgICAgICJhbGx3aW5uZXIsc3VuNTBpLWE2NC1taXBp
LWRzaSI7CisJCQlyZWcgPSA8MHgwMWNhMDAwMCAweDEwMDA+OworCQkJaW50ZXJydXB0cyA9IDxH
SUNfU1BJIDU3IElSUV9UWVBFX0xFVkVMX0hJR0g+OworCQkJY2xvY2tzID0gPCZjY3UgQ0xLX0JV
U19NSVBJX0RTST47CisJCQljbG9jay1uYW1lcyA9ICJidXMiOworCQkJcmVzZXRzID0gPCZjY3Ug
UlNUX0JVU19NSVBJX0RTST47CisJCQlwaHlzID0gPCZkcGh5PjsKKwkJCXBoeS1uYW1lcyA9ICJk
cGh5IjsKKwkJCXN0YXR1cyA9ICJkaXNhYmxlZCI7CisJCQkjYWRkcmVzcy1jZWxscyA9IDwxPjsK
KwkJCSNzaXplLWNlbGxzID0gPDA+OworCisJCQlwb3J0IHsKKwkJCQlkc2lfaW5fdGNvbl9sY2Qw
X291dDogZW5kcG9pbnQgeworCQkJCQlyZW1vdGUtZW5kcG9pbnQgPSA8JnRjb25fbGNkMF9vdXRf
ZHNpX291dD47CisJCQkJfTsKKwkJCX07CisJCX07CisKKwkJZHBoeTogZC1waHlAMWNhMTAwMCB7
CisJCQljb21wYXRpYmxlID0gImFsbHdpbm5lcixzdW44aS1yNDAtbWlwaS1kcGh5IiwKKwkJCQkg
ICAgICJhbGx3aW5uZXIsc3VuNmktYTMxLW1pcGktZHBoeSI7CisJCQlyZWcgPSA8MHgwMWNhMTAw
MCAweDEwMDA+OworCQkJY2xvY2tzID0gPCZjY3UgQ0xLX0JVU19NSVBJX0RTST4sCisJCQkJIDwm
Y2N1IENMS19EU0lfRFBIWT47CisJCQljbG9jay1uYW1lcyA9ICJidXMiLCAibW9kIjsKKwkJCXJl
c2V0cyA9IDwmY2N1IFJTVF9CVVNfTUlQSV9EU0k+OworCQkJc3RhdHVzID0gImRpc2FibGVkIjsK
KwkJCSNwaHktY2VsbHMgPSA8MD47CisJCX07CisKIAkJaGRtaTogaGRtaUAxZWUwMDAwIHsKIAkJ
CWNvbXBhdGlibGUgPSAiYWxsd2lubmVyLHN1bjhpLXI0MC1kdy1oZG1pIiwKIAkJCQkgICAgICJh
bGx3aW5uZXIsc3VuOGktYTgzdC1kdy1oZG1pIjsKLS0gCjIuMTguMC4zMjEuZ2ZmYzZmYTBlMwoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
