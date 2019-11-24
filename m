Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 98A021089CA
	for <lists+dri-devel@lfdr.de>; Mon, 25 Nov 2019 09:08:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 33B6489FC0;
	Mon, 25 Nov 2019 08:08:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mo6-p03-ob.smtp.rzone.de (mo6-p03-ob.smtp.rzone.de
 [IPv6:2a01:238:20a:202:5303::7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7031C6E103
 for <dri-devel@lists.freedesktop.org>; Sun, 24 Nov 2019 11:40:49 +0000 (UTC)
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMhflhwDubTJ9o1mfYzBGHXH4HEaKeuIV"
X-RZG-CLASS-ID: mo00
Received: from iMac.fritz.box by smtp.strato.de (RZmta 44.29.0 DYNA|AUTH)
 with ESMTPSA id L09db3vAOBeUwET
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (curve secp521r1 with
 521 ECDH bits, eq. 15360 bits RSA))
 (Client did not present a certificate);
 Sun, 24 Nov 2019 12:40:30 +0100 (CET)
From: "H. Nikolaus Schaller" <hns@goldelico.com>
To: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 =?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>,
 Tony Lindgren <tony@atomide.com>, Paul Cercueil <paul@crapouillou.net>,
 Ralf Baechle <ralf@linux-mips.org>, Paul Burton <paulburton@kernel.org>,
 James Hogan <jhogan@kernel.org>
Subject: [PATCH v3 3/8] ARM: DTS: am3517: add sgx gpu child node
Date: Sun, 24 Nov 2019 12:40:23 +0100
Message-Id: <47b2286c1b267102dbb2cb2313d858dc5f4e47d7.1574595627.git.hns@goldelico.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <cover.1574595627.git.hns@goldelico.com>
References: <cover.1574595627.git.hns@goldelico.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 25 Nov 2019 08:07:41 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 t=1574595648; 
 s=strato-dkim-0002; d=goldelico.com;
 h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
 X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
 bh=NjEWunQz10C58eQ0gQdyDLr+7iljKIOVsgB4xAjyIIk=;
 b=EDyFcrplodRMq5BVmYiRvJ8R8ow2ji9w6hUIfSO9qgGvLmdyfrV9O+H1LL4FAMiWY0
 y1dh+h0eKC+C1ambMfkTbBwk+ShiokskEKD3+hT9AqLSlQCmHrqKRr4ReGw8TA66Rbxv
 64ZLPFxWVFh2o8t5B7dFKF8tQgnZ6W79ghgGBXmXRvzpM4hLHk0wg5pXym4u2XQ+Fwxl
 6SWdFtOvr6HKfDZSB7eQzyHfoyBSmzY4kIcxEiMAqFoqcpeNCeJJRhybNgOS5PdpfDHE
 Urvs+KI8Ee/7rYA6+mAKbrod7GPs3SxMFsueJS5gejbZE3X9z2Hl+vL/tRyIkMhdZRYo
 bFsQ==
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
 "H. Nikolaus Schaller" <hns@goldelico.com>, openpvrsgx-devgroup@letux.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-mips@vger.kernel.org, kernel@pyra-handheld.com,
 letux-kernel@openphoenux.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

YW5kIGFkZCBpbnRlcnJ1cHQuCgpTaWduZWQtb2ZmLWJ5OiBILiBOaWtvbGF1cyBTY2hhbGxlciA8
aG5zQGdvbGRlbGljby5jb20+Ci0tLQogYXJjaC9hcm0vYm9vdC9kdHMvYW0zNTE3LmR0c2kgfCAx
MSArKysrKystLS0tLQogMSBmaWxlIGNoYW5nZWQsIDYgaW5zZXJ0aW9ucygrKSwgNSBkZWxldGlv
bnMoLSkKCmRpZmYgLS1naXQgYS9hcmNoL2FybS9ib290L2R0cy9hbTM1MTcuZHRzaSBiL2FyY2gv
YXJtL2Jvb3QvZHRzL2FtMzUxNy5kdHNpCmluZGV4IGJmMzAwMjAwOWIwMC4uNDhkNWEyNTBmZDQw
IDEwMDY0NAotLS0gYS9hcmNoL2FybS9ib290L2R0cy9hbTM1MTcuZHRzaQorKysgYi9hcmNoL2Fy
bS9ib290L2R0cy9hbTM1MTcuZHRzaQpAQCAtOTcsNyArOTcsNyBAQAogCQkgKiByZXZpc2lvbiBy
ZWdpc3RlciBpbnN0ZWFkIG9mIHRoZSB1bnJlYWRhYmxlIE9DUCByZXZpc2lvbgogCQkgKiByZWdp
c3Rlci4KIAkJICovCi0JCXNneF9tb2R1bGU6IHRhcmdldC1tb2R1bGVANTAwMDAwMDAgeworCQl0
YXJnZXQtbW9kdWxlQDUwMDAwMDAwIHsKIAkJCWNvbXBhdGlibGUgPSAidGksc3lzYy1vbWFwMiIs
ICJ0aSxzeXNjIjsKIAkJCXJlZyA9IDwweDUwMDAwMDE0IDB4ND47CiAJCQlyZWctbmFtZXMgPSAi
cmV2IjsKQEAgLTEwNywxMCArMTA3LDExIEBACiAJCQkjc2l6ZS1jZWxscyA9IDwxPjsKIAkJCXJh
bmdlcyA9IDwwIDB4NTAwMDAwMDAgMHg0MDAwPjsKIAotCQkJLyoKLQkJCSAqIENsb3NlZCBzb3Vy
Y2UgUG93ZXJWUiBkcml2ZXIsIG5vIGNoaWxkIGRldmljZQotCQkJICogYmluZGluZyBvciBkcml2
ZXIgaW4gbWFpbmxpbmUKLQkJCSAqLworCQkJc2d4OiBncHVAMCB7CisJCQkJY29tcGF0aWJsZSA9
ICJ0aSxhbTM1MTctc2d4NTMwLTEyNSIsICJpbWcsc2d4NTMwLTEyNSIsICJpbWcsc2d4NTMwIjsK
KwkJCQlyZWcgPSA8MHgwIDB4NDAwMD47CisJCQkJaW50ZXJydXB0cyA9IDwyMT47CisJCQl9Owog
CQl9OwogCX07CiB9OwotLSAKMi4yMy4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5m
cmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0
aW5mby9kcmktZGV2ZWw=
