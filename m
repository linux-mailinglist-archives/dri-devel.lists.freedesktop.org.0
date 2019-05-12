Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FE7C1ABD6
	for <lists+dri-devel@lfdr.de>; Sun, 12 May 2019 12:49:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B36389A4B;
	Sun, 12 May 2019 10:48:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from honk.sigxcpu.org (honk.sigxcpu.org [24.134.29.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF3DB89A14
 for <dri-devel@lists.freedesktop.org>; Sun, 12 May 2019 10:48:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by honk.sigxcpu.org (Postfix) with ESMTP id D13C2FB05;
 Sun, 12 May 2019 12:48:54 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at honk.sigxcpu.org
Received: from honk.sigxcpu.org ([127.0.0.1])
 by localhost (honk.sigxcpu.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id exSV5RRusFEc; Sun, 12 May 2019 12:48:52 +0200 (CEST)
Received: by bogon.sigxcpu.org (Postfix, from userid 1000)
 id 8DB6547B79; Sun, 12 May 2019 12:48:51 +0200 (CEST)
From: =?UTF-8?q?Guido=20G=C3=BCnther?= <agx@sigxcpu.org>
To: Kishon Vijay Abraham I <kishon@ti.com>, Rob Herring <robh+dt@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>,
 Thierry Reding <treding@nvidia.com>,
 =?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Heiko Stuebner <heiko@sntech.de>, Johan Hovold <johan@kernel.org>,
 Lucas Stach <l.stach@pengutronix.de>, Abel Vesa <abel.vesa@nxp.com>,
 Li Jun <jun.li@nxp.com>, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 dri-devel@lists.freedesktop.org, Robert Chiras <robert.chiras@nxp.com>,
 Sam Ravnborg <sam@ravnborg.org>, Maxime Ripard <maxime.ripard@bootlin.com>
Subject: [PATCH v11 1/2] dt-bindings: phy: Add documentation for mixel dphy
Date: Sun, 12 May 2019 12:48:50 +0200
Message-Id: <b3f171fdbed948074fecb619c242ba427285d98e.1557657814.git.agx@sigxcpu.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1557657814.git.agx@sigxcpu.org>
References: <cover.1557657814.git.agx@sigxcpu.org>
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

QWRkIHN1cHBvcnQgZm9yIHRoZSBNSVhFTCBEUEhZIElQIGFzIGZvdW5kIG9uIE5YUCdzIGkuTVg4
TVEgU29Dcy4KClNpZ25lZC1vZmYtYnk6IEd1aWRvIEfDvG50aGVyIDxhZ3hAc2lneGNwdS5vcmc+
ClJldmlld2VkLWJ5OiBTYW0gUmF2bmJvcmcgPHNhbUByYXZuYm9yZy5vcmc+ClJldmlld2VkLWJ5
OiBSb2IgSGVycmluZyA8cm9iaEBrZXJuZWwub3JnPgpSZXZpZXdlZC1ieTogRmFiaW8gRXN0ZXZh
bSA8ZmVzdGV2YW1AZ21haWwuY29tPgotLS0KIC4uLi9iaW5kaW5ncy9waHkvbWl4ZWwsbWlwaS1k
c2ktcGh5LnR4dCAgICAgICB8IDI5ICsrKysrKysrKysrKysrKysrKysKIDEgZmlsZSBjaGFuZ2Vk
LCAyOSBpbnNlcnRpb25zKCspCiBjcmVhdGUgbW9kZSAxMDA2NDQgRG9jdW1lbnRhdGlvbi9kZXZp
Y2V0cmVlL2JpbmRpbmdzL3BoeS9taXhlbCxtaXBpLWRzaS1waHkudHh0CgpkaWZmIC0tZ2l0IGEv
RG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3BoeS9taXhlbCxtaXBpLWRzaS1waHku
dHh0IGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3BoeS9taXhlbCxtaXBpLWRz
aS1waHkudHh0Cm5ldyBmaWxlIG1vZGUgMTAwNjQ0CmluZGV4IDAwMDAwMDAwMDAwMC4uOWIyMzQw
NzIzM2MwCi0tLSAvZGV2L251bGwKKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRp
bmdzL3BoeS9taXhlbCxtaXBpLWRzaS1waHkudHh0CkBAIC0wLDAgKzEsMjkgQEAKK01peGVsIERT
SSBQSFkgZm9yIGkuTVg4CisKK1RoZSBNaXhlbCBNSVBJLURTSSBQSFkgSVAgYmxvY2sgaXMgZS5n
LiBmb3VuZCBvbiBpLk1YOCBwbGF0Zm9ybXMgKGFsb25nIHRoZQorTUlQSS1EU0kgSVAgZnJvbSBO
b3J0aHdlc3QgTG9naWMpLiBJdCByZXByZXNlbnRzIHRoZSBwaHlzaWNhbCBsYXllciBmb3IgdGhl
CitlbGVjdHJpY2FsIHNpZ25hbHMgZm9yIERTSS4KKworUmVxdWlyZWQgcHJvcGVydGllczoKKy0g
Y29tcGF0aWJsZTogTXVzdCBiZToKKyAgLSAiZnNsLGlteDhtcS1taXBpLWRwaHkiCistIGNsb2Nr
czogTXVzdCBjb250YWluIGFuIGVudHJ5IGZvciBlYWNoIGVudHJ5IGluIGNsb2NrLW5hbWVzLgor
LSBjbG9jay1uYW1lczogTXVzdCBjb250YWluIHRoZSBmb2xsb3dpbmcgZW50cmllczoKKyAgLSAi
cGh5X3JlZiI6IHBoYW5kbGUgYW5kIHNwZWNpZmllciByZWZlcnJpbmcgdG8gdGhlIERQSFkgcmVm
IGNsb2NrCistIHJlZzogdGhlIHJlZ2lzdGVyIHJhbmdlIG9mIHRoZSBQSFkgY29udHJvbGxlcgor
LSAjcGh5LWNlbGxzOiBudW1iZXIgb2YgY2VsbHMgaW4gUEhZLCBhcyBkZWZpbmVkIGluCisgIERv
Y3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9waHkvcGh5LWJpbmRpbmdzLnR4dAorICB0
aGlzIG11c3QgYmUgPDA+CisKK09wdGlvbmFsIHByb3BlcnRpZXM6CistIHBvd2VyLWRvbWFpbnM6
IHBoYW5kbGUgdG8gcG93ZXIgZG9tYWluCisKK0V4YW1wbGU6CisJZHBoeTogZHBoeUAzMGEwMDMw
IHsKKwkJY29tcGF0aWJsZSA9ICJmc2wsaW14OG1xLW1pcGktZHBoeSI7CisJCWNsb2NrcyA9IDwm
Y2xrIElNWDhNUV9DTEtfRFNJX1BIWV9SRUY+OworCQljbG9jay1uYW1lcyA9ICJwaHlfcmVmIjsK
KwkJcmVnID0gPDB4MzBhMDAzMDAgMHgxMDA+OworCQlwb3dlci1kb21haW5zID0gPCZwZF9taXBp
MD47CisJCSNwaHktY2VsbHMgPSA8MD47CisgICAgICAgIH07Ci0tIAoyLjIwLjEKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5n
IGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVk
ZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
