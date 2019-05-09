Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E672185EC
	for <lists+dri-devel@lfdr.de>; Thu,  9 May 2019 09:18:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D5BFA8997E;
	Thu,  9 May 2019 07:18:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from onstation.org (onstation.org [52.200.56.107])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA422899DB;
 Thu,  9 May 2019 02:04:10 +0000 (UTC)
Received: from localhost.localdomain (c-98-239-145-235.hsd1.wv.comcast.net
 [98.239.145.235])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: masneyb)
 by onstation.org (Postfix) with ESMTPSA id CFFFD45026;
 Thu,  9 May 2019 02:04:09 +0000 (UTC)
From: Brian Masney <masneyb@onstation.org>
To: robdclark@gmail.com, sean@poorly.run, dri-devel@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 airlied@linux.ie, daniel@ffwll.ch, linux-kernel@vger.kernel.org,
 linus.walleij@linaro.org, jonathan@marek.ca, robh@kernel.org
Subject: [PATCH v2 5/6] ARM: dts: qcom: msm8974-hammerhead: add support for
 backlight
Date: Wed,  8 May 2019 22:03:51 -0400
Message-Id: <20190509020352.14282-6-masneyb@onstation.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190509020352.14282-1-masneyb@onstation.org>
References: <20190509020352.14282-1-masneyb@onstation.org>
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 09 May 2019 07:18:00 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=onstation.org; s=default; t=1557367450;
 bh=tN+WlNENxq3sFnnBtPcG6qkIFwJuLGxheJCgQUHqMEg=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=NUFXe+4N//SEeFq/vLgmUefhNFmb0b/FsteUCBRLkqbK4EkADQLZNNhD+YLAvcSRd
 5ETrtmHp8rhOvTWc2xEKZot9CyMgdl9iflZcda5XrUJ2A4uNq/Dqm4FlsSB9LcyYS9
 Jy8ax9lPqCMm42ZZe3buBNUbUDZyQXgSfCL5KA9I=
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QWRkIG5lY2Vzc2FyeSBkZXZpY2UgdHJlZSBub2RlcyBmb3IgdGhlIG1haW4gTENEIGJhY2tsaWdo
dC4KClNpZ25lZC1vZmYtYnk6IEJyaWFuIE1hc25leSA8bWFzbmV5YkBvbnN0YXRpb24ub3JnPgpS
ZXZpZXdlZC1ieTogTGludXMgV2FsbGVpaiA8bGludXMud2FsbGVpakBsaW5hcm8ub3JnPgotLS0K
VGhpcyByZXF1aXJlcyB0aGlzIHNlcmllcyB0aGF0IHNob3VsZCBiZSBtZXJnZWQgc29vbjoKaHR0
cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGttbC8yMDE5MDQyNDA5MjUwNS42NTc4LTEtbWFzbmV5YkBv
bnN0YXRpb24ub3JnLwpUaGUgZGV2aWNlIHRyZWUgYmluZGluZ3MgaGF2ZSBiZWVuIHJldmlld2Vk
LiBUaGUgZHJpdmVyIGNoYW5nZXMgaGF2ZQpyZWNlaXZlZCAzIHtSZXZpZXdlZCxBY2tlZH0tYnlz
LgoKQ2hhbmdlcyBzaW5jZSB2MToKLSBOb25lCgogLi4uL3Fjb20tbXNtODk3NC1sZ2UtbmV4dXM1
LWhhbW1lcmhlYWQuZHRzICAgIHwgMzQgKysrKysrKysrKysrKysrKysrKwogMSBmaWxlIGNoYW5n
ZWQsIDM0IGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9hcmNoL2FybS9ib290L2R0cy9xY29t
LW1zbTg5NzQtbGdlLW5leHVzNS1oYW1tZXJoZWFkLmR0cyBiL2FyY2gvYXJtL2Jvb3QvZHRzL3Fj
b20tbXNtODk3NC1sZ2UtbmV4dXM1LWhhbW1lcmhlYWQuZHRzCmluZGV4IGIzYjA0NzM2YTE1OS4u
YjdjZjRiMTAxOWU5IDEwMDY0NAotLS0gYS9hcmNoL2FybS9ib290L2R0cy9xY29tLW1zbTg5NzQt
bGdlLW5leHVzNS1oYW1tZXJoZWFkLmR0cworKysgYi9hcmNoL2FybS9ib290L2R0cy9xY29tLW1z
bTg5NzQtbGdlLW5leHVzNS1oYW1tZXJoZWFkLmR0cwpAQCAtMjg5LDYgKzI4OSwxNiBAQAogCQkJ
fTsKIAkJfTsKIAorCQlpMmMxMV9waW5zOiBpMmMxMSB7CisJCQltdXggeworCQkJCXBpbnMgPSAi
Z3BpbzgzIiwgImdwaW84NCI7CisJCQkJZnVuY3Rpb24gPSAiYmxzcF9pMmMxMSI7CisKKwkJCQlk
cml2ZS1zdHJlbmd0aCA9IDwyPjsKKwkJCQliaWFzLWRpc2FibGU7CisJCQl9OworCQl9OworCiAJ
CWkyYzEyX3BpbnM6IGkyYzEyIHsKIAkJCW11eCB7CiAJCQkJcGlucyA9ICJncGlvODciLCAiZ3Bp
bzg4IjsKQEAgLTM2OSw2ICszNzksMzAgQEAKIAkJfTsKIAl9OwogCisJaTJjQGY5OTY3MDAwIHsK
KwkJc3RhdHVzID0gIm9rIjsKKwkJcGluY3RybC1uYW1lcyA9ICJkZWZhdWx0IjsKKwkJcGluY3Ry
bC0wID0gPCZpMmMxMV9waW5zPjsKKwkJY2xvY2stZnJlcXVlbmN5ID0gPDM1NTAwMD47CisJCXFj
b20sc3JjLWZyZXEgPSA8NTAwMDAwMDA+OworCisJCWxlZC1jb250cm9sbGVyQDM4IHsKKwkJCWNv
bXBhdGlibGUgPSAidGksbG0zNjMwYSI7CisJCQlzdGF0dXMgPSAib2siOworCQkJcmVnID0gPDB4
Mzg+OworCisJCQkjYWRkcmVzcy1jZWxscyA9IDwxPjsKKwkJCSNzaXplLWNlbGxzID0gPDA+Owor
CisJCQlsZWRAMCB7CisJCQkJcmVnID0gPDA+OworCQkJCWxlZC1zb3VyY2VzID0gPDAgMT47CisJ
CQkJbGFiZWwgPSAibGNkLWJhY2tsaWdodCI7CisJCQkJZGVmYXVsdC1icmlnaHRuZXNzID0gPDIw
MD47CisJCQl9OworCQl9OworCX07CisKIAlpMmNAZjk5NjgwMDAgewogCQlzdGF0dXMgPSAib2si
OwogCQlwaW5jdHJsLW5hbWVzID0gImRlZmF1bHQiOwotLSAKMi4yMC4xCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0
CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3Rv
cC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
