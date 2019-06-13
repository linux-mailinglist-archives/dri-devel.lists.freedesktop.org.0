Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 41EE644B40
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jun 2019 20:54:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E57C38989A;
	Thu, 13 Jun 2019 18:54:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com
 [IPv6:2607:f8b0:4864:20::643])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6ECD78989A
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jun 2019 18:54:10 +0000 (UTC)
Received: by mail-pl1-x643.google.com with SMTP id i2so8522255plt.1
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jun 2019 11:54:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Q8S69BX3xpHZr2uy2odezTDXnVK0j/vxrp4XQpnzj94=;
 b=DoWHbC4jwhGkwf6G7WoAds20dYs0uEF9M2fGowbzTcWp0iQHgRLbY4c6MVxQmvhwhq
 VZmeaKbJxkNkQloY9DxeY0nX2pfGoUtPnpbb1dINEHgZ1Zyo225rV/9VP/RifSD+hWT5
 UCtyhE9gSRpwx3GEjoFdac3PNunoC/Cwuhqnz86J3AXnnm3aFMGOJFsZHL46iP/8nz+i
 TU1FIuphOn5/X/uYshuUBL3Ii1D4oMAkhCZCHU66ZVhaEhqV1EIGZ+u9iiZtvnY188MZ
 2Y8VeJeZdduX/69EcikQ+D7y8WL1lAN97XcQHnZN14sjUgh9Urnm0p+f/QczKvny/vks
 eJyA==
X-Gm-Message-State: APjAAAWDcfxiEm9+AUhpM72wSnfAEeh7QZ5591VF5e9Z9rKDESdf3pXh
 52gyydGVmrBesIypgw+DByDyYw==
X-Google-Smtp-Source: APXvYqxaaPemy8HlCqx44EJP2dYlb26OfNzzTdIleOfRx7U76bvedSxq5O2wJ0IWbVnEXm6M9wSwDQ==
X-Received: by 2002:a17:902:7793:: with SMTP id
 o19mr28815033pll.110.1560452049961; 
 Thu, 13 Jun 2019 11:54:09 -0700 (PDT)
Received: from localhost.localdomain ([115.97.180.18])
 by smtp.gmail.com with ESMTPSA id p43sm946314pjp.4.2019.06.13.11.54.06
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 13 Jun 2019 11:54:09 -0700 (PDT)
From: Jagan Teki <jagan@amarulasolutions.com>
To: Maxime Ripard <maxime.ripard@bootlin.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Chen-Yu Tsai <wens@csie.org>,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 Jernej Skrabec <jernej.skrabec@siol.net>
Subject: [PATCH 5/9] ARM: dts: sun8i: r40: Add TCON TOP LCD clocking
Date: Fri, 14 Jun 2019 00:22:37 +0530
Message-Id: <20190613185241.22800-6-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.18.0.321.gffc6fa0e3
In-Reply-To: <20190613185241.22800-1-jagan@amarulasolutions.com>
References: <20190613185241.22800-1-jagan@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Q8S69BX3xpHZr2uy2odezTDXnVK0j/vxrp4XQpnzj94=;
 b=X69ZulaE4ksswSOcisK935ppPOCimBaK9wKQzoWbdJx9hexnxFxppTxwlkfyDk335f
 zg+xx/max7Lj5RHHaALWr4GF2Rs4pIVNcW+EsctqJTj4kTJGRhw4jp4Qu94m+HyOzm5y
 brXa4+I9BLezFomx007mMIT0udlZ21rLXg6bs=
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

QWNjb3JkaW5nIHRvIEZpZyA3LTIuIFRDT04gVG9wIEJsb2NrIERpYWdyYW0gaW4gVXNlciBtYW51
YWwuCgpUQ09OIFRPUCBjYW4gaGF2ZSBhbiBoaWVyYXJjaHkgZm9yIFRDT05fTENEMCwgTENEMSBs
aWtlClRDT05fVFYwLCBUVjEgc28sIHRoZSB0Y29uIHRvcCB3b3VsZCBoYW5kbGUgdGhlIGNsb2Nr
cyBvZgpUQ09OX0xDRDAsIExDRDEgc2ltaWxhciBsaWtlIFRWMCwgVFYxLgoKQnV0LCB0aGUgY3Vy
cmVudCB0Y29uX3RvcCBub2RlIGlzIHVzaW5nIGRzaSBjbG9jayBuYW1lIHdpdGgKQ0xLX0RTSV9E
UEhZIHdoaWNoIGlzIGlkZWFsbHkgaGFuZGxlIHZpYSBkcGh5IHdoaWNoIGluZGVlZAphIHNlcGFy
YXRlIGludGVyZmFjZSBibG9jay4KClNvLCB1c2UgdGNvbi1sY2QwIGluc3RlYWQgb2YgZHNpIHdo
aWNoIHdvdWxkIHJlZmVyIHRoZQpDTEtfVENPTl9MQ0QwIHNpbWlsYXIgbGlrZSBDTEtfVENPTl9U
VjAgd2l0aCB0Y29uLXR2MC4KClRoaXMgd2F5IHdlIGNhbiByZWZlciBDTEtfVENPTl9MQ0QwIGZy
b20gdGNvbl90b3AgY2xvY2sgaW4KdGNvbl9sY2QwIG5vZGUgYW5kIHRoZSBhY3R1YWwgRFNJX0RQ
SFkgY2xvY2sgbm9kZSB3b3VsZApyZWZlciBpbiBkcGh5IG5vZGUuCgpTaWduZWQtb2ZmLWJ5OiBK
YWdhbiBUZWtpIDxqYWdhbkBhbWFydWxhc29sdXRpb25zLmNvbT4KLS0tCiBhcmNoL2FybS9ib290
L2R0cy9zdW44aS1yNDAuZHRzaSAgICAgICAgICAgfCA2ICsrKy0tLQogZHJpdmVycy9ncHUvZHJt
L3N1bjRpL3N1bjhpX3Rjb25fdG9wLmMgICAgIHwgNiArKystLS0KIGluY2x1ZGUvZHQtYmluZGlu
Z3MvY2xvY2svc3VuOGktdGNvbi10b3AuaCB8IDIgKy0KIDMgZmlsZXMgY2hhbmdlZCwgNyBpbnNl
cnRpb25zKCspLCA3IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2FyY2gvYXJtL2Jvb3QvZHRz
L3N1bjhpLXI0MC5kdHNpIGIvYXJjaC9hcm0vYm9vdC9kdHMvc3VuOGktcjQwLmR0c2kKaW5kZXgg
MjE5ZDJkY2ExNmIzLi4xMjU3NjUzNmRmNGEgMTAwNjQ0Ci0tLSBhL2FyY2gvYXJtL2Jvb3QvZHRz
L3N1bjhpLXI0MC5kdHNpCisrKyBiL2FyY2gvYXJtL2Jvb3QvZHRzL3N1bjhpLXI0MC5kdHNpCkBA
IC01OTEsMTYgKzU5MSwxNiBAQAogCQkJCSA8JmNjdSBDTEtfVFZFMD4sCiAJCQkJIDwmY2N1IENM
S19UQ09OX1RWMT4sCiAJCQkJIDwmY2N1IENMS19UVkUxPiwKLQkJCQkgPCZjY3UgQ0xLX0RTSV9E
UEhZPjsKKwkJCQkgPCZjY3UgQ0xLX1RDT05fTENEMD47CiAJCQljbG9jay1uYW1lcyA9ICJidXMi
LAogCQkJCSAgICAgICJ0Y29uLXR2MCIsCiAJCQkJICAgICAgInR2ZTAiLAogCQkJCSAgICAgICJ0
Y29uLXR2MSIsCiAJCQkJICAgICAgInR2ZTEiLAotCQkJCSAgICAgICJkc2kiOworCQkJCSAgICAg
ICJ0Y29uLWxjZDAiOwogCQkJY2xvY2stb3V0cHV0LW5hbWVzID0gInRjb24tdG9wLXR2MCIsCiAJ
CQkJCSAgICAgInRjb24tdG9wLXR2MSIsCi0JCQkJCSAgICAgInRjb24tdG9wLWRzaSI7CisJCQkJ
CSAgICAgInRjb24tdG9wLWxjZDAiOwogCQkJcmVzZXRzID0gPCZjY3UgUlNUX0JVU19UQ09OX1RP
UD47CiAJCQkjY2xvY2stY2VsbHMgPSA8MT47CiAKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2Ry
bS9zdW40aS9zdW44aV90Y29uX3RvcC5jIGIvZHJpdmVycy9ncHUvZHJtL3N1bjRpL3N1bjhpX3Rj
b25fdG9wLmMKaW5kZXggNDY1ZTliMGNkZmVlLi5lMjNjMTlmMTg5ODYgMTAwNjQ0Ci0tLSBhL2Ry
aXZlcnMvZ3B1L2RybS9zdW40aS9zdW44aV90Y29uX3RvcC5jCisrKyBiL2RyaXZlcnMvZ3B1L2Ry
bS9zdW40aS9zdW44aV90Y29uX3RvcC5jCkBAIC0yMDUsMTEgKzIwNSwxMSBAQCBzdGF0aWMgaW50
IHN1bjhpX3Rjb25fdG9wX2JpbmQoc3RydWN0IGRldmljZSAqZGV2LCBzdHJ1Y3QgZGV2aWNlICpt
YXN0ZXIsCiAJCQkJCQkgICAgIENMS19UQ09OX1RPUF9UVjEpOwogCiAJaWYgKHF1aXJrcy0+aGFz
X2RzaSkKLQkJY2xrX2RhdGEtPmh3c1tDTEtfVENPTl9UT1BfRFNJXSA9Ci0JCQlzdW44aV90Y29u
X3RvcF9yZWdpc3Rlcl9nYXRlKGRldiwgImRzaSIsIHJlZ3MsCisJCWNsa19kYXRhLT5od3NbQ0xL
X1RDT05fVE9QX0xDRDBdID0KKwkJCXN1bjhpX3Rjb25fdG9wX3JlZ2lzdGVyX2dhdGUoZGV2LCAi
dGNvbi1sY2QwIiwgcmVncywKIAkJCQkJCSAgICAgJnRjb25fdG9wLT5yZWdfbG9jaywKIAkJCQkJ
CSAgICAgVENPTl9UT1BfVENPTl9EU0lfR0FURSwKLQkJCQkJCSAgICAgQ0xLX1RDT05fVE9QX0RT
SSk7CisJCQkJCQkgICAgIENMS19UQ09OX1RPUF9MQ0QwKTsKIAogCWZvciAoaSA9IDA7IGkgPCBD
TEtfTlVNOyBpKyspCiAJCWlmIChJU19FUlIoY2xrX2RhdGEtPmh3c1tpXSkpIHsKZGlmZiAtLWdp
dCBhL2luY2x1ZGUvZHQtYmluZGluZ3MvY2xvY2svc3VuOGktdGNvbi10b3AuaCBiL2luY2x1ZGUv
ZHQtYmluZGluZ3MvY2xvY2svc3VuOGktdGNvbi10b3AuaAppbmRleCAyNTE2NGQ3Njc4MzUuLjg4
ZGUzZjJiYTMzNSAxMDA2NDQKLS0tIGEvaW5jbHVkZS9kdC1iaW5kaW5ncy9jbG9jay9zdW44aS10
Y29uLXRvcC5oCisrKyBiL2luY2x1ZGUvZHQtYmluZGluZ3MvY2xvY2svc3VuOGktdGNvbi10b3Au
aApAQCAtNiw2ICs2LDYgQEAKIAogI2RlZmluZSBDTEtfVENPTl9UT1BfVFYwCTAKICNkZWZpbmUg
Q0xLX1RDT05fVE9QX1RWMQkxCi0jZGVmaW5lIENMS19UQ09OX1RPUF9EU0kJMgorI2RlZmluZSBD
TEtfVENPTl9UT1BfTENEMAkyCiAKICNlbmRpZiAvKiBfRFRfQklORElOR1NfQ0xPQ0tfU1VOOElf
VENPTl9UT1BfSF8gKi8KLS0gCjIuMTguMC4zMjEuZ2ZmYzZmYTBlMwoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApk
cmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Au
b3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
