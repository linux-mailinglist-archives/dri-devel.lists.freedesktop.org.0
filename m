Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9052846497
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jun 2019 18:44:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7188889AFF;
	Fri, 14 Jun 2019 16:43:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com
 [IPv6:2607:f8b0:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E7E289ADC
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jun 2019 16:43:53 +0000 (UTC)
Received: by mail-pf1-x441.google.com with SMTP id d126so1800174pfd.2
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jun 2019 09:43:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=848PkAQSuqGBV9d1ZE22q9YEz/y0k4xnXoRXzpZqX+0=;
 b=tLzn0n6hMFoO6Z0HvfNjY1sha5rt4RPC50PLKywc2rfiCIMsruCoEyAIkfC1tIPc5d
 mZHVZQxKqJ/JIv7iqjun1SUJLYFe68TtcSqaBXN8iMlS8zCUITfUg6HUHeJ2KhsKlZCI
 ehYWonZY/FV2n3FuYCIxFqCJLkgTSIr/4fJwVHVNHe5EWxU6ImMjfrl24F+VRMToGPcr
 86tzpmVeXn8O8UhaJx5fWwC3BJaxk4YiGNkD7xbKtDHtItzPKOpf5eI/0yTf59lT6M/Y
 dWyIYW5RJBp59VfspbzoJjPNMaIUnKl+vLiulmnu5onvIUhbSYtm6fQIXsY9xyYOJFuo
 mUBw==
X-Gm-Message-State: APjAAAUPueTvX58dpbAX9ILH342PWuFps1Lg5KJUpSmTvK+CPg79PqD2
 +51CVbwo6C1cKy18sv3Ep+EphA==
X-Google-Smtp-Source: APXvYqwUHYYxZ/0pN9i06WfooF6JJ94tywE4LYJ0JGGICFTLtuW3GCdvLxxtuIbnkkx9sC5rpEpZNA==
X-Received: by 2002:a63:2349:: with SMTP id u9mr10900061pgm.410.1560530633068; 
 Fri, 14 Jun 2019 09:43:53 -0700 (PDT)
Received: from localhost.localdomain ([115.97.180.18])
 by smtp.gmail.com with ESMTPSA id 85sm1639583pfv.130.2019.06.14.09.43.49
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 14 Jun 2019 09:43:52 -0700 (PDT)
From: Jagan Teki <jagan@amarulasolutions.com>
To: Maxime Ripard <maxime.ripard@bootlin.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Chen-Yu Tsai <wens@csie.org>,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 Jernej Skrabec <jernej.skrabec@siol.net>
Subject: [PATCH v2 3/9] ARM: dts: sun8i: r40: Use tcon top clock index macros
Date: Fri, 14 Jun 2019 22:13:18 +0530
Message-Id: <20190614164324.9427-4-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.18.0.321.gffc6fa0e3
In-Reply-To: <20190614164324.9427-1-jagan@amarulasolutions.com>
References: <20190614164324.9427-1-jagan@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=848PkAQSuqGBV9d1ZE22q9YEz/y0k4xnXoRXzpZqX+0=;
 b=dZXH9NvKdmO0bTsLkbJzcgWsuOWrWooI8HoZvgEnDZAITMfdSO31becAdutXgCndye
 MHderODMAFVl3kDDQUpeEvuaZoNXhqkGysP/vFvCfDg3SYV3HcMKFSS9NMVFDDhAaFDG
 eJI66CGb5Ses9xXU+ojj0rPo/6FtA8Nuaz1Pk=
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
cnVsYXNvbHV0aW9ucy5jb20+ClJldmlld2VkLWJ5OiBDaGVuLVl1IFRzYWkgPHdlbnNAY3NpZS5v
cmc+Ci0tLQogYXJjaC9hcm0vYm9vdC9kdHMvc3VuOGktcjQwLmR0c2kgfCA1ICsrKy0tCiAxIGZp
bGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBh
L2FyY2gvYXJtL2Jvb3QvZHRzL3N1bjhpLXI0MC5kdHNpIGIvYXJjaC9hcm0vYm9vdC9kdHMvc3Vu
OGktcjQwLmR0c2kKaW5kZXggYmI4NTZlNTNiODA2Li4yMTlkMmRjYTE2YjMgMTAwNjQ0Ci0tLSBh
L2FyY2gvYXJtL2Jvb3QvZHRzL3N1bjhpLXI0MC5kdHNpCisrKyBiL2FyY2gvYXJtL2Jvb3QvZHRz
L3N1bjhpLXI0MC5kdHNpCkBAIC00NCw2ICs0NCw3IEBACiAjaW5jbHVkZSA8ZHQtYmluZGluZ3Mv
aW50ZXJydXB0LWNvbnRyb2xsZXIvYXJtLWdpYy5oPgogI2luY2x1ZGUgPGR0LWJpbmRpbmdzL2Ns
b2NrL3N1bjhpLWRlMi5oPgogI2luY2x1ZGUgPGR0LWJpbmRpbmdzL2Nsb2NrL3N1bjhpLXI0MC1j
Y3UuaD4KKyNpbmNsdWRlIDxkdC1iaW5kaW5ncy9jbG9jay9zdW44aS10Y29uLXRvcC5oPgogI2lu
Y2x1ZGUgPGR0LWJpbmRpbmdzL3Jlc2V0L3N1bjhpLXI0MC1jY3UuaD4KICNpbmNsdWRlIDxkdC1i
aW5kaW5ncy9yZXNldC9zdW44aS1kZTIuaD4KIApAQCAtNzA0LDcgKzcwNSw3IEBACiAJCQljb21w
YXRpYmxlID0gImFsbHdpbm5lcixzdW44aS1yNDAtdGNvbi10diI7CiAJCQlyZWcgPSA8MHgwMWM3
MzAwMCAweDEwMDA+OwogCQkJaW50ZXJydXB0cyA9IDxHSUNfU1BJIDUxIElSUV9UWVBFX0xFVkVM
X0hJR0g+OwotCQkJY2xvY2tzID0gPCZjY3UgQ0xLX0JVU19UQ09OX1RWMD4sIDwmdGNvbl90b3Ag
MD47CisJCQljbG9ja3MgPSA8JmNjdSBDTEtfQlVTX1RDT05fVFYwPiwgPCZ0Y29uX3RvcCBDTEtf
VENPTl9UT1BfVFYwPjsKIAkJCWNsb2NrLW5hbWVzID0gImFoYiIsICJ0Y29uLWNoMSI7CiAJCQly
ZXNldHMgPSA8JmNjdSBSU1RfQlVTX1RDT05fVFYwPjsKIAkJCXJlc2V0LW5hbWVzID0gImxjZCI7
CkBAIC03NDcsNyArNzQ4LDcgQEAKIAkJCWNvbXBhdGlibGUgPSAiYWxsd2lubmVyLHN1bjhpLXI0
MC10Y29uLXR2IjsKIAkJCXJlZyA9IDwweDAxYzc0MDAwIDB4MTAwMD47CiAJCQlpbnRlcnJ1cHRz
ID0gPEdJQ19TUEkgNTIgSVJRX1RZUEVfTEVWRUxfSElHSD47Ci0JCQljbG9ja3MgPSA8JmNjdSBD
TEtfQlVTX1RDT05fVFYxPiwgPCZ0Y29uX3RvcCAxPjsKKwkJCWNsb2NrcyA9IDwmY2N1IENMS19C
VVNfVENPTl9UVjE+LCA8JnRjb25fdG9wIENMS19UQ09OX1RPUF9UVjE+OwogCQkJY2xvY2stbmFt
ZXMgPSAiYWhiIiwgInRjb24tY2gxIjsKIAkJCXJlc2V0cyA9IDwmY2N1IFJTVF9CVVNfVENPTl9U
VjE+OwogCQkJcmVzZXQtbmFtZXMgPSAibGNkIjsKLS0gCjIuMTguMC4zMjEuZ2ZmYzZmYTBlMwoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
