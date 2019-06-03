Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A3B0633FBC
	for <lists+dri-devel@lfdr.de>; Tue,  4 Jun 2019 09:15:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9EB54896A3;
	Tue,  4 Jun 2019 07:14:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from crapouillou.net (outils.crapouillou.net [89.234.176.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC25589248
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Jun 2019 15:41:21 +0000 (UTC)
From: Paul Cercueil <paul@crapouillou.net>
To: Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
 Hans Verkuil <hansverk@cisco.com>
Subject: [PATCH v4 1/3] dt-bindings: display: Add GiantPlus GPM940B0 panel
 documentation
Date: Mon,  3 Jun 2019 17:35:09 +0200
Message-Id: <20190603153511.24384-1-paul@crapouillou.net>
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 04 Jun 2019 07:14:23 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=crapouillou.net; 
 s=mail; t=1559576118; h=from:from:sender:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-transfer-encoding:content-transfer-encoding:
 in-reply-to:references; bh=auqQoAWu6HJcQ9dAYh3x5JeoeNLaZ4+0Q+ur1G1yukU=;
 b=Xtv5XN9Vkv9B9Pb+eYYLPZ+956M049bKb78736GBz+ijiKqW29jCgbXNJbzjySfl9Yjnmg
 kcoFkjzSGBtA4f2qqagR4TAczQq9gJYzv77J/TYUcIdSqZmQ1yWexvSIMQ1vQtfzA9MDTB
 pFJgCyGSeOMR14zWntENnYodNq7z3UA=
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
dyBwYXRjaAogICAgCiAgICB2MzogQWRkIFJvYidzIGFjawogICAgCiAgICB2NDogTm8gY2hhbmdl
CgogLi4uL2JpbmRpbmdzL2Rpc3BsYXkvcGFuZWwvZ2lhbnRwbHVzLGdwbTk0MGIwLnR4dCAgICB8
IDEyICsrKysrKysrKysrKwogMSBmaWxlIGNoYW5nZWQsIDEyIGluc2VydGlvbnMoKykKIGNyZWF0
ZSBtb2RlIDEwMDY0NCBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9w
YW5lbC9naWFudHBsdXMsZ3BtOTQwYjAudHh0CgpkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9k
ZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvcGFuZWwvZ2lhbnRwbHVzLGdwbTk0MGIwLnR4dCBi
L0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L3BhbmVsL2dpYW50cGx1
cyxncG05NDBiMC50eHQKbmV3IGZpbGUgbW9kZSAxMDA2NDQKaW5kZXggMDAwMDAwMDAwMDAwLi4z
ZGFiNTJmOTJjMjYKLS0tIC9kZXYvbnVsbAorKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUv
YmluZGluZ3MvZGlzcGxheS9wYW5lbC9naWFudHBsdXMsZ3BtOTQwYjAudHh0CkBAIC0wLDAgKzEs
MTIgQEAKK0dpYW50UGx1cyAzLjAiICgzMjB4MjQwIHBpeGVscykgMjQtYml0IFRGVCBMQ0QgcGFu
ZWwKKworUmVxdWlyZWQgcHJvcGVydGllczoKKy0gY29tcGF0aWJsZTogc2hvdWxkIGJlICJnaWFu
dHBsdXMsZ3BtOTQwYjAiCistIHBvd2VyLXN1cHBseTogYXMgc3BlY2lmaWVkIGluIHRoZSBiYXNl
IGJpbmRpbmcKKworT3B0aW9uYWwgcHJvcGVydGllczoKKy0gYmFja2xpZ2h0OiBhcyBzcGVjaWZp
ZWQgaW4gdGhlIGJhc2UgYmluZGluZworLSBlbmFibGUtZ3Bpb3M6IGFzIHNwZWNpZmllZCBpbiB0
aGUgYmFzZSBiaW5kaW5nCisKK1RoaXMgYmluZGluZyBpcyBjb21wYXRpYmxlIHdpdGggdGhlIHNp
bXBsZS1wYW5lbCBiaW5kaW5nLCB3aGljaCBpcyBzcGVjaWZpZWQKK2luIHNpbXBsZS1wYW5lbC50
eHQgaW4gdGhpcyBkaXJlY3RvcnkuCi0tIAoyLjIxLjAuNTkzLmc1MTFlYzM0NWUxOAoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxp
bmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
