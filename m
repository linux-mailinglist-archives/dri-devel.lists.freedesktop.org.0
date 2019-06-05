Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CB13A36CC6
	for <lists+dri-devel@lfdr.de>; Thu,  6 Jun 2019 09:04:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3CAF8893EC;
	Thu,  6 Jun 2019 07:03:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from crapouillou.net (outils.crapouillou.net [89.234.176.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F02C8952F
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Jun 2019 22:22:59 +0000 (UTC)
From: Paul Cercueil <paul@crapouillou.net>
To: Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 Hans Verkuil <hans.verkuil@cisco.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: [PATCH v5 1/3] dt-bindings: display: Add GiantPlus GPM940B0 panel
 documentation
Date: Thu,  6 Jun 2019 00:22:45 +0200
Message-Id: <20190605222247.25657-1-paul@crapouillou.net>
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 06 Jun 2019 07:03:45 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=crapouillou.net; 
 s=mail; t=1559773376; h=from:from:sender:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-transfer-encoding:content-transfer-encoding:
 in-reply-to:references; bh=vYXmQr/7cLomc7L2vWT2Hwyls4I65jEhBN+6anSml8Y=;
 b=HCuTRIjJLOASltCPPWDDUfBs6u5KN0r6LpRVIpDZrmpc7y67UFCZdJMfm/g/txjZ/wEJmD
 T+we2elfGngzcsIuXNrr6ZPv2wCu0cObxse9WOrVFGLe5fRKHl4YEzQY4Bkh9Who3GA+q7
 fbnSSdD6qk9kS59V0xeRVdLScn175Nw=
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
 dri-devel@lists.freedesktop.org, Paul Cercueil <paul@crapouillou.net>,
 od@zcrc.me, linux-media@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhlIEdQTTk0MEIwIGlzIGEgMy4wIiAzMjB4MjQwIDI0LWJpdCBURlQgTENEIHBhbmVsLgoKU2ln
bmVkLW9mZi1ieTogUGF1bCBDZXJjdWVpbCA8cGF1bEBjcmFwb3VpbGxvdS5uZXQ+ClJldmlld2Vk
LWJ5OiBSb2IgSGVycmluZyA8cm9iaEBrZXJuZWwub3JnPgotLS0KCk5vdGVzOgogICAgdjI6IE5l
dyBwYXRjaAogICAgCiAgICB2MzogQWRkIFJvYidzIGFjawogICAgCiAgICB2NC12NTogTm8gY2hh
bmdlCgogLi4uL2JpbmRpbmdzL2Rpc3BsYXkvcGFuZWwvZ2lhbnRwbHVzLGdwbTk0MGIwLnR4dCAg
ICB8IDEyICsrKysrKysrKysrKwogMSBmaWxlIGNoYW5nZWQsIDEyIGluc2VydGlvbnMoKykKIGNy
ZWF0ZSBtb2RlIDEwMDY0NCBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxh
eS9wYW5lbC9naWFudHBsdXMsZ3BtOTQwYjAudHh0CgpkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlv
bi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvcGFuZWwvZ2lhbnRwbHVzLGdwbTk0MGIwLnR4
dCBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L3BhbmVsL2dpYW50
cGx1cyxncG05NDBiMC50eHQKbmV3IGZpbGUgbW9kZSAxMDA2NDQKaW5kZXggMDAwMDAwMDAwMDAw
Li4zZGFiNTJmOTJjMjYKLS0tIC9kZXYvbnVsbAorKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRy
ZWUvYmluZGluZ3MvZGlzcGxheS9wYW5lbC9naWFudHBsdXMsZ3BtOTQwYjAudHh0CkBAIC0wLDAg
KzEsMTIgQEAKK0dpYW50UGx1cyAzLjAiICgzMjB4MjQwIHBpeGVscykgMjQtYml0IFRGVCBMQ0Qg
cGFuZWwKKworUmVxdWlyZWQgcHJvcGVydGllczoKKy0gY29tcGF0aWJsZTogc2hvdWxkIGJlICJn
aWFudHBsdXMsZ3BtOTQwYjAiCistIHBvd2VyLXN1cHBseTogYXMgc3BlY2lmaWVkIGluIHRoZSBi
YXNlIGJpbmRpbmcKKworT3B0aW9uYWwgcHJvcGVydGllczoKKy0gYmFja2xpZ2h0OiBhcyBzcGVj
aWZpZWQgaW4gdGhlIGJhc2UgYmluZGluZworLSBlbmFibGUtZ3Bpb3M6IGFzIHNwZWNpZmllZCBp
biB0aGUgYmFzZSBiaW5kaW5nCisKK1RoaXMgYmluZGluZyBpcyBjb21wYXRpYmxlIHdpdGggdGhl
IHNpbXBsZS1wYW5lbCBiaW5kaW5nLCB3aGljaCBpcyBzcGVjaWZpZWQKK2luIHNpbXBsZS1wYW5l
bC50eHQgaW4gdGhpcyBkaXJlY3RvcnkuCi0tIAoyLjIxLjAuNTkzLmc1MTFlYzM0NWUxOAoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1h
aWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
