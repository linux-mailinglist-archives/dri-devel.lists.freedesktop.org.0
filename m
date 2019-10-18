Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C1866DDBA3
	for <lists+dri-devel@lfdr.de>; Sun, 20 Oct 2019 02:07:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BBD1389CD7;
	Sun, 20 Oct 2019 00:07:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mo6-p02-ob.smtp.rzone.de (mo6-p02-ob.smtp.rzone.de
 [IPv6:2a01:238:20a:202:5302::4])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BCE866EBC3
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Oct 2019 18:46:47 +0000 (UTC)
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMhflhwDubTJ9o1mfYzBGHXH6F3CFF60="
X-RZG-CLASS-ID: mo00
Received: from iMac.fritz.box by smtp.strato.de (RZmta 44.28.1 DYNA|AUTH)
 with ESMTPSA id R0b2a8v9IIkXDLE
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (curve secp521r1 with
 521 ECDH bits, eq. 15360 bits RSA))
 (Client did not present a certificate);
 Fri, 18 Oct 2019 20:46:33 +0200 (CEST)
From: "H. Nikolaus Schaller" <hns@goldelico.com>
To: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 =?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>,
 Tony Lindgren <tony@atomide.com>
Subject: [PATCH 3/7] ARM: DTS: am3517: add sgx gpu child node
Date: Fri, 18 Oct 2019 20:46:26 +0200
Message-Id: <8102dc33bcf21d653539cb43fb41ce600c1f9e74.1571424390.git.hns@goldelico.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <cover.1571424390.git.hns@goldelico.com>
References: <cover.1571424390.git.hns@goldelico.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Sun, 20 Oct 2019 00:06:45 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 t=1571424405; 
 s=strato-dkim-0002; d=goldelico.com;
 h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
 X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
 bh=gtyubCOUKX62yjckzgCBhxqFuJTOFG0uFwZSKZS4Ls4=;
 b=O+iX+e4z2UDRQMWcYTq8uTXLWWzdt3ucIhSjUQkEgOPwsH5kIyCO6fhEVVHwcqYfes
 k7qJiZX/p0geGzLl8l/vZLkVlIeu2hcNMP5auiGH+1zrpiclO2yTT4Xp1rACdyiQW7Cz
 44pbgqf3W0TP22qpnXN3VpnCM8iwtf1HG/9qpDI1QU3Za5XVAA3I4uI8sQW7vbF0YW6K
 wlufrKa3kkUl8jg9UTNnW17jaqhS23tYtyr7sQRSChib1XLbXlXkh1UhL9XUkF2NOs/j
 Of8nLqcLOUahIT4WqkM4RI+Bul0VPwnfe71zaygUC8i7uXF2wFHDyljCSbLgcqOYGhqB
 XxfA==
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
Cc: devicetree@vger.kernel.org, linux-omap@vger.kernel.org,
 "H. Nikolaus Schaller" <hns@goldelico.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, kernel@pyra-handheld.com,
 letux-kernel@openphoenux.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

YW5kIGFkZCB0aW1lciBhbmQgaW50ZXJydXB0LgoKU2lnbmVkLW9mZi1ieTogSC4gTmlrb2xhdXMg
U2NoYWxsZXIgPGhuc0Bnb2xkZWxpY28uY29tPgotLS0KIGFyY2gvYXJtL2Jvb3QvZHRzL2FtMzUx
Ny5kdHNpIHwgMTMgKysrKysrKystLS0tLQogMSBmaWxlIGNoYW5nZWQsIDggaW5zZXJ0aW9ucygr
KSwgNSBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9hcmNoL2FybS9ib290L2R0cy9hbTM1MTcu
ZHRzaSBiL2FyY2gvYXJtL2Jvb3QvZHRzL2FtMzUxNy5kdHNpCmluZGV4IGJmMzAwMjAwOWIwMC4u
NTcxNmJiMzNkN2ZlIDEwMDY0NAotLS0gYS9hcmNoL2FybS9ib290L2R0cy9hbTM1MTcuZHRzaQor
KysgYi9hcmNoL2FybS9ib290L2R0cy9hbTM1MTcuZHRzaQpAQCAtOTcsNyArOTcsNyBAQAogCQkg
KiByZXZpc2lvbiByZWdpc3RlciBpbnN0ZWFkIG9mIHRoZSB1bnJlYWRhYmxlIE9DUCByZXZpc2lv
bgogCQkgKiByZWdpc3Rlci4KIAkJICovCi0JCXNneF9tb2R1bGU6IHRhcmdldC1tb2R1bGVANTAw
MDAwMDAgeworCQl0YXJnZXQtbW9kdWxlQDUwMDAwMDAwIHsKIAkJCWNvbXBhdGlibGUgPSAidGks
c3lzYy1vbWFwMiIsICJ0aSxzeXNjIjsKIAkJCXJlZyA9IDwweDUwMDAwMDE0IDB4ND47CiAJCQly
ZWctbmFtZXMgPSAicmV2IjsKQEAgLTEwNywxMCArMTA3LDEzIEBACiAJCQkjc2l6ZS1jZWxscyA9
IDwxPjsKIAkJCXJhbmdlcyA9IDwwIDB4NTAwMDAwMDAgMHg0MDAwPjsKIAotCQkJLyoKLQkJCSAq
IENsb3NlZCBzb3VyY2UgUG93ZXJWUiBkcml2ZXIsIG5vIGNoaWxkIGRldmljZQotCQkJICogYmlu
ZGluZyBvciBkcml2ZXIgaW4gbWFpbmxpbmUKLQkJCSAqLworCQkJc2d4OiBzZ3hAMCB7CisJCQkJ
Y29tcGF0aWJsZSA9ICJpbWcsc2d4NTMwLTEyNSIsICJpbWcsc2d4NTMwIiwgInRpLG9tYXAtYW0z
NTE3LXNneDUzMC0xMjUiOworCQkJCXJlZyA9IDwweDAgMHg0MDAwPjsKKwkJCQlyZWctbmFtZXMg
PSAic2d4IjsKKwkJCQlpbnRlcnJ1cHRzID0gPDIxPjsKKwkJCQl0aW1lciA9IDwmdGltZXIxMT47
CisJCQl9OwogCQl9OwogCX07CiB9OwotLSAKMi4xOS4xCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZl
bEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFp
bG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
