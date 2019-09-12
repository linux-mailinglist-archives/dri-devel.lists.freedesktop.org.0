Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EA505B07B1
	for <lists+dri-devel@lfdr.de>; Thu, 12 Sep 2019 06:15:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 27A8A6EC20;
	Thu, 12 Sep 2019 04:12:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from honk.sigxcpu.org (honk.sigxcpu.org [24.134.29.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7BAAA6E040;
 Thu, 12 Sep 2019 02:40:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by honk.sigxcpu.org (Postfix) with ESMTP id D8DCBFB02;
 Thu, 12 Sep 2019 04:40:40 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at honk.sigxcpu.org
Received: from honk.sigxcpu.org ([127.0.0.1])
 by localhost (honk.sigxcpu.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VqZf75Uf_RKR; Thu, 12 Sep 2019 04:40:38 +0200 (CEST)
Received: by bogon.sigxcpu.org (Postfix, from userid 1000)
 id 5495846CBF; Wed, 11 Sep 2019 19:40:36 -0700 (PDT)
From: =?UTF-8?q?Guido=20G=C3=BCnther?= <agx@sigxcpu.org>
To: "To : Lucas Stach" <l.stach@pengutronix.de>,
 Russell King <linux+etnaviv@armlinux.org.uk>,
 Christian Gmeiner <christian.gmeiner@gmail.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>,
 Abel Vesa <abel.vesa@nxp.com>, Anson Huang <Anson.Huang@nxp.com>,
 Carlo Caione <ccaione@baylibre.com>,
 =?UTF-8?q?Guido=20G=C3=BCnther?= <agx@sigxcpu.org>,
 Andrey Smirnov <andrew.smirnov@gmail.com>,
 "Angus Ainslie (Purism)" <angus@akkea.ca>, etnaviv@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2 1/2] dts: arm64: imx8mq: Enable gpu passive throttling
Date: Wed, 11 Sep 2019 19:40:35 -0700
Message-Id: <0ab2ee7de9c2e24f6de860ffcbcdfc25b72c2c61.1568255903.git.agx@sigxcpu.org>
X-Mailer: git-send-email 2.23.0.rc1
In-Reply-To: <cover.1568255903.git.agx@sigxcpu.org>
References: <cover.1568255903.git.agx@sigxcpu.org>
MIME-Version: 1.0
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

VGVtcGVyYXR1cmUgYW5kIGh5c3RlcmVzaXMgd2VyZSBwaWNrZWQgYWZ0ZXIgdGhlIENQVS4KClNp
Z25lZC1vZmYtYnk6IEd1aWRvIEfDvG50aGVyIDxhZ3hAc2lneGNwdS5vcmc+Ci0tLQogYXJjaC9h
cm02NC9ib290L2R0cy9mcmVlc2NhbGUvaW14OG1xLmR0c2kgfCAxNSArKysrKysrKysrKysrKysK
IDEgZmlsZSBjaGFuZ2VkLCAxNSBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvYXJjaC9hcm02
NC9ib290L2R0cy9mcmVlc2NhbGUvaW14OG1xLmR0c2kgYi9hcmNoL2FybTY0L2Jvb3QvZHRzL2Zy
ZWVzY2FsZS9pbXg4bXEuZHRzaQppbmRleCA0ZmRkNjBmMmM1MWUuLjUwMjNhMGU1MDY4ZCAxMDA2
NDQKLS0tIGEvYXJjaC9hcm02NC9ib290L2R0cy9mcmVlc2NhbGUvaW14OG1xLmR0c2kKKysrIGIv
YXJjaC9hcm02NC9ib290L2R0cy9mcmVlc2NhbGUvaW14OG1xLmR0c2kKQEAgLTIzNSwxMiArMjM1
LDI2IEBACiAJCQl0aGVybWFsLXNlbnNvcnMgPSA8JnRtdSAxPjsKIAogCQkJdHJpcHMgeworCQkJ
CWdwdV9hbGVydDogZ3B1LWFsZXJ0IHsKKwkJCQkJdGVtcGVyYXR1cmUgPSA8ODAwMDA+OworCQkJ
CQloeXN0ZXJlc2lzID0gPDIwMDA+OworCQkJCQl0eXBlID0gInBhc3NpdmUiOworCQkJCX07CisK
IAkJCQlncHUtY3JpdCB7CiAJCQkJCXRlbXBlcmF0dXJlID0gPDkwMDAwPjsKIAkJCQkJaHlzdGVy
ZXNpcyA9IDwyMDAwPjsKIAkJCQkJdHlwZSA9ICJjcml0aWNhbCI7CiAJCQkJfTsKIAkJCX07CisK
KwkJCWNvb2xpbmctbWFwcyB7CisJCQkJbWFwMCB7CisJCQkJCXRyaXAgPSA8JmdwdV9hbGVydD47
CisJCQkJCWNvb2xpbmctZGV2aWNlID0KKwkJCQkJCTwmZ3B1IFRIRVJNQUxfTk9fTElNSVQgVEhF
Uk1BTF9OT19MSU1JVD47CisJCQkJfTsKKwkJCX07CiAJCX07CiAKIAkJdnB1LXRoZXJtYWwgewpA
QCAtOTEyLDYgKzkyNiw3IEBACiAJCQkgICAgICAgICA8JmNsayBJTVg4TVFfQ0xLX0dQVV9BWEk+
LAogCQkJICAgICAgICAgPCZjbGsgSU1YOE1RX0NMS19HUFVfQUhCPjsKIAkJCWNsb2NrLW5hbWVz
ID0gImNvcmUiLCAic2hhZGVyIiwgImJ1cyIsICJyZWciOworCQkJI2Nvb2xpbmctY2VsbHMgPSA8
Mj47CiAJCQlhc3NpZ25lZC1jbG9ja3MgPSA8JmNsayBJTVg4TVFfQ0xLX0dQVV9DT1JFX1NSQz4s
CiAJCQkgICAgICAgICAgICAgICAgICA8JmNsayBJTVg4TVFfQ0xLX0dQVV9TSEFERVJfU1JDPiwK
IAkJCSAgICAgICAgICAgICAgICAgIDwmY2xrIElNWDhNUV9DTEtfR1BVX0FYST4sCi0tIAoyLjIz
LjAucmMxCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpk
cmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
