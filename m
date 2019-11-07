Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E8149F41B8
	for <lists+dri-devel@lfdr.de>; Fri,  8 Nov 2019 09:13:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 09E636F86A;
	Fri,  8 Nov 2019 08:12:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mo6-p04-ob.smtp.rzone.de (mo6-p04-ob.smtp.rzone.de
 [IPv6:2a01:238:20a:202:5304::2])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F2A46E424
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Nov 2019 11:06:23 +0000 (UTC)
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMhflhwDubTJ9o1OAA2UNf2M7PR5/L9P0"
X-RZG-CLASS-ID: mo00
Received: from iMac.fritz.box by smtp.strato.de (RZmta 44.29.0 DYNA|AUTH)
 with ESMTPSA id L09db3vA7B6Fdgy
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (curve secp521r1 with
 521 ECDH bits, eq. 15360 bits RSA))
 (Client did not present a certificate);
 Thu, 7 Nov 2019 12:06:15 +0100 (CET)
From: "H. Nikolaus Schaller" <hns@goldelico.com>
To: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 =?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>,
 Tony Lindgren <tony@atomide.com>, Paul Cercueil <paul@crapouillou.net>,
 Ralf Baechle <ralf@linux-mips.org>, Paul Burton <paulburton@kernel.org>,
 James Hogan <jhogan@kernel.org>
Subject: [PATCH v2 4/8] ARM: DTS: omap3: add sgx gpu child node
Date: Thu,  7 Nov 2019 12:06:07 +0100
Message-Id: <78e6f575e25cd4cfec40a5d735303b8ac61521b9.1573124770.git.hns@goldelico.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <cover.1573124770.git.hns@goldelico.com>
References: <cover.1573124770.git.hns@goldelico.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 08 Nov 2019 08:12:31 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 t=1573124782; 
 s=strato-dkim-0002; d=goldelico.com;
 h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
 X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
 bh=y3zYbwzLGCQd958Btkq+b622MLFLPWeGrOh+oKuq+CI=;
 b=Gzi40TOrMj2jNFA/PJ18+61w7HeouMQ4sc3r2z0eLmgpwAV3um/vKbHBmlqjxQH6vh
 c7hUaKxEhUw3Jiw0f5mXM7DP1xYA4mi0HMxI3wgYnCccL6N4RN+jHvne0Q9QwzaZOAag
 EJPGut7JisAiXESozbKpgDOhTQkcGLRyGeWrp/65xEN7YQLGu1T+qDRP/hX5jlq7N9O0
 mUZgHKPIyVk3ETiTfWjrfFdlS2r2XB2K/8xf9aVeFtP5aSzMBo4V57v6JPG6xx1UclVr
 TBW/Ql2wnU3qwNbisml4iljfsglQIG1FS5kZ5rCYlRykSV+l434KGit7W5e1sBwg1dXg
 wmOA==
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

YW5kIGFkZCBpbnRlcnJ1cHQKClRlc3RlZCBvbiBPcGVuUGFuZG9yYSA2MDAgTUh6LgoKU2lnbmVk
LW9mZi1ieTogSC4gTmlrb2xhdXMgU2NoYWxsZXIgPGhuc0Bnb2xkZWxpY28uY29tPgotLS0KIGFy
Y2gvYXJtL2Jvb3QvZHRzL29tYXAzNHh4LmR0c2kgfCAxMSArKysrKystLS0tLQogMSBmaWxlIGNo
YW5nZWQsIDYgaW5zZXJ0aW9ucygrKSwgNSBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9hcmNo
L2FybS9ib290L2R0cy9vbWFwMzR4eC5kdHNpIGIvYXJjaC9hcm0vYm9vdC9kdHMvb21hcDM0eHgu
ZHRzaQppbmRleCA3YjA5Y2JlZThiYjguLjliMDUwZDcxODQ5YiAxMDA2NDQKLS0tIGEvYXJjaC9h
cm0vYm9vdC9kdHMvb21hcDM0eHguZHRzaQorKysgYi9hcmNoL2FybS9ib290L2R0cy9vbWFwMzR4
eC5kdHNpCkBAIC0xMTEsNyArMTExLDcgQEAKIAkJICogYXJlIGFsc28gZGlmZmVyZW50IGNsb2Nr
cywgYnV0IHdlIGRvIG5vdCBoYXZlIGFueSBkdHMgdXNlcnMKIAkJICogZm9yIGl0LgogCQkgKi8K
LQkJc2d4X21vZHVsZTogdGFyZ2V0LW1vZHVsZUA1MDAwMDAwMCB7CisJCXRhcmdldC1tb2R1bGVA
NTAwMDAwMDAgewogCQkJY29tcGF0aWJsZSA9ICJ0aSxzeXNjLW9tYXAyIiwgInRpLHN5c2MiOwog
CQkJcmVnID0gPDB4NTAwMDAwMTQgMHg0PjsKIAkJCXJlZy1uYW1lcyA9ICJyZXYiOwpAQCAtMTIx
LDEwICsxMjEsMTEgQEAKIAkJCSNzaXplLWNlbGxzID0gPDE+OwogCQkJcmFuZ2VzID0gPDAgMHg1
MDAwMDAwMCAweDQwMDA+OwogCi0JCQkvKgotCQkJICogQ2xvc2VkIHNvdXJjZSBQb3dlclZSIGRy
aXZlciwgbm8gY2hpbGQgZGV2aWNlCi0JCQkgKiBiaW5kaW5nIG9yIGRyaXZlciBpbiBtYWlubGlu
ZQotCQkJICovCisJCQlzZ3g6IGdwdUAwIHsKKwkJCQljb21wYXRpYmxlID0gInRpLG9tYXAzLXNn
eDUzMC0xMjEiLCAiaW1nLHNneDUzMC0xMjEiLCAiaW1nLHNneDUzMCI7CisJCQkJcmVnID0gPDB4
MCAweDQwMDA+OwkvKiA2NGtCICovCisJCQkJaW50ZXJydXB0cyA9IDwyMT47CisJCQl9OwogCQl9
OwogCX07CiAKLS0gCjIuMjMuMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8v
ZHJpLWRldmVs
