Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AD4B31D4E98
	for <lists+dri-devel@lfdr.de>; Fri, 15 May 2020 15:12:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D52E6EC9B;
	Fri, 15 May 2020 13:12:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from honk.sigxcpu.org (honk.sigxcpu.org [24.134.29.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC9C66EC2D
 for <dri-devel@lists.freedesktop.org>; Fri, 15 May 2020 13:12:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by honk.sigxcpu.org (Postfix) with ESMTP id 34B2AFB06;
 Fri, 15 May 2020 15:12:25 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at honk.sigxcpu.org
Received: from honk.sigxcpu.org ([127.0.0.1])
 by localhost (honk.sigxcpu.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0-lLz--REorz; Fri, 15 May 2020 15:12:23 +0200 (CEST)
Received: by bogon.sigxcpu.org (Postfix, from userid 1000)
 id 8E898445A9; Fri, 15 May 2020 15:12:15 +0200 (CEST)
From: =?UTF-8?q?Guido=20G=C3=BCnther?= <agx@sigxcpu.org>
To: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>,
 Andrzej Hajda <a.hajda@samsung.com>, Sam Ravnborg <sam@ravnborg.org>,
 Anson Huang <Anson.Huang@nxp.com>,
 Leonard Crestez <leonard.crestez@nxp.com>,
 Lucas Stach <l.stach@pengutronix.de>, Peng Fan <peng.fan@nxp.com>,
 Robert Chiras <robert.chiras@nxp.com>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Subject: [RFC PATCH 5/6] arm64: dts: imx8mq: Add NWL dsi controller
Date: Fri, 15 May 2020 15:12:14 +0200
Message-Id: <6f915d10ead271a1c155628efbc909d5eb9f4102.1589548223.git.agx@sigxcpu.org>
X-Mailer: git-send-email 2.26.1
In-Reply-To: <cover.1589548223.git.agx@sigxcpu.org>
References: <cover.1589548223.git.agx@sigxcpu.org>
MIME-Version: 1.0
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
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

QWRkIGEgbm9kZSBmb3IgdGhlIE5vcnRod2VzdGxvZ2ljIE1JUEkgRFNJIElQIGNvcmUsICJkaXNh
YmxlZCIgYnkKZGVmYXVsdC4KClNpZ25lZC1vZmYtYnk6IEd1aWRvIEfDvG50aGVyIDxhZ3hAc2ln
eGNwdS5vcmc+Ci0tLQogYXJjaC9hcm02NC9ib290L2R0cy9mcmVlc2NhbGUvaW14OG1xLmR0c2kg
fCAzMSArKysrKysrKysrKysrKysrKysrKysrKwogMSBmaWxlIGNoYW5nZWQsIDMxIGluc2VydGlv
bnMoKykKCmRpZmYgLS1naXQgYS9hcmNoL2FybTY0L2Jvb3QvZHRzL2ZyZWVzY2FsZS9pbXg4bXEu
ZHRzaSBiL2FyY2gvYXJtNjQvYm9vdC9kdHMvZnJlZXNjYWxlL2lteDhtcS5kdHNpCmluZGV4IDAx
NDJmMDZlYWQxMi4uNmJiYmY0NGU2YmUwIDEwMDY0NAotLS0gYS9hcmNoL2FybTY0L2Jvb3QvZHRz
L2ZyZWVzY2FsZS9pbXg4bXEuZHRzaQorKysgYi9hcmNoL2FybTY0L2Jvb3QvZHRzL2ZyZWVzY2Fs
ZS9pbXg4bXEuZHRzaQpAQCAtODg5LDYgKzg4OSwzNyBAQCBzZWNfanIyOiBqckAzMDAwIHsKIAkJ
CQl9OwogCQkJfTsKIAorCQkJbWlwaV9kc2k6IG1pcGktZHNpQDMwYTAwMDAwIHsKKwkJCQkjYWRk
cmVzcy1jZWxscyA9IDwxPjsKKwkJCQkjc2l6ZS1jZWxscyA9IDwwPjsKKwkJCQljb21wYXRpYmxl
ID0gImZzbCxpbXg4bXEtbndsLWRzaSI7CisJCQkJcmVnID0gPDB4MzBhMDAwMDAgMHgzMDA+Owor
CQkJCWNsb2NrcyA9IDwmY2xrIElNWDhNUV9DTEtfRFNJX0NPUkU+LAorCQkJCQkgPCZjbGsgSU1Y
OE1RX0NMS19EU0lfQUhCPiwKKwkJCQkJIDwmY2xrIElNWDhNUV9DTEtfRFNJX0lQR19ESVY+LAor
CQkJCQkgPCZjbGsgSU1YOE1RX0NMS19EU0lfUEhZX1JFRj4sCisJCQkJCSA8JmNsayBJTVg4TVFf
Q0xLX0xDRElGX1BJWEVMPjsKKwkJCQljbG9jay1uYW1lcyA9ICJjb3JlIiwgInJ4X2VzYyIsICJ0
eF9lc2MiLCAicGh5X3JlZiIsICJsY2RpZiI7CisJCQkJYXNzaWduZWQtY2xvY2tzID0gPCZjbGsg
SU1YOE1RX0NMS19EU0lfQUhCPiwKKwkJCQkJCSAgPCZjbGsgSU1YOE1RX0NMS19EU0lfQ09SRT4s
CisJCQkJCQkgIDwmY2xrIElNWDhNUV9DTEtfRFNJX0lQR19ESVY+OworCQkJCWFzc2lnbmVkLWNs
b2NrLXBhcmVudHMgPSA8JmNsayBJTVg4TVFfU1lTMV9QTExfODBNPiwKKwkJCQkJCQkgPCZjbGsg
SU1YOE1RX1NZUzFfUExMXzI2Nk0+OworCQkJCWFzc2lnbmVkLWNsb2NrLXJhdGVzID0gPDgwMDAw
MDAwPiwKKwkJCQkJCSAgICAgICA8MjY2MDAwMDAwPiwKKwkJCQkJCSAgICAgICA8MjAwMDAwMDA+
OworCQkJCWludGVycnVwdHMgPSA8R0lDX1NQSSAzNCBJUlFfVFlQRV9MRVZFTF9ISUdIPjsKKwkJ
CQlyZXNldHMgPSA8JnNyYyBJTVg4TVFfUkVTRVRfTUlQSV9EU0lfUkVTRVRfQllURV9OPiwKKwkJ
CQkJIDwmc3JjIElNWDhNUV9SRVNFVF9NSVBJX0RTSV9EUElfUkVTRVRfTj4sCisJCQkJCSA8JnNy
YyBJTVg4TVFfUkVTRVRfTUlQSV9EU0lfRVNDX1JFU0VUX04+LAorCQkJCQkgPCZzcmMgSU1YOE1R
X1JFU0VUX01JUElfRFNJX1BDTEtfUkVTRVRfTj47CisJCQkJcmVzZXQtbmFtZXMgPSAiYnl0ZSIs
ICJkcGkiLCAiZXNjIiwgInBjbGsiOworCQkJCXBoeXMgPSA8JmRwaHk+OworCQkJCXBoeS1uYW1l
cyA9ICJkcGh5IjsKKwkJCQlwb3dlci1kb21haW5zID0gPCZwZ2NfbWlwaT47CisJCQkJc3RhdHVz
ID0gImRpc2FibGVkIjsKKwkJCSB9OworCiAJCQlkcGh5OiBkcGh5QDMwYTAwMzAwIHsKIAkJCQlj
b21wYXRpYmxlID0gImZzbCxpbXg4bXEtbWlwaS1kcGh5IjsKIAkJCQlyZWcgPSA8MHgzMGEwMDMw
MCAweDEwMD47Ci0tIAoyLjI2LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2RyaS1kZXZlbAo=
