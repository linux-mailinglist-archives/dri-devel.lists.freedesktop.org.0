Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 40F543857E
	for <lists+dri-devel@lfdr.de>; Fri,  7 Jun 2019 09:45:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 956CC89AE6;
	Fri,  7 Jun 2019 07:44:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 649FC89349
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Jun 2019 14:21:38 +0000 (UTC)
X-Originating-IP: 2.224.242.101
Received: from uno.lan (2-224-242-101.ip172.fastwebnet.it [2.224.242.101])
 (Authenticated sender: jacopo@jmondi.org)
 by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id B7C682000E;
 Thu,  6 Jun 2019 14:21:34 +0000 (UTC)
From: Jacopo Mondi <jacopo+renesas@jmondi.org>
To: laurent.pinchart@ideasonboard.com, kieran.bingham+renesas@ideasonboard.com,
 airlied@linux.ie, daniel@ffwll.ch
Subject: [PATCH 01/20] dt-bindings: display: renesas,
 cmm: Add R-Car CMM documentation
Date: Thu,  6 Jun 2019 16:22:01 +0200
Message-Id: <20190606142220.1392-2-jacopo+renesas@jmondi.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190606142220.1392-1-jacopo+renesas@jmondi.org>
References: <20190606142220.1392-1-jacopo+renesas@jmondi.org>
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 07 Jun 2019 07:43:41 +0000
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
Cc: muroya@ksk.co.jp, koji.matsuoka.xm@renesas.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, VenkataRajesh.Kalakodima@in.bosch.com,
 Jacopo Mondi <jacopo+renesas@jmondi.org>,
 Harsha.ManjulaMallikarjun@in.bosch.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QWRkIGRldmljZSB0cmVlIGJpbmRpbmdzIGRvY3VtZW50YXRpb24gZm9yIHRoZSBSZW5lc2FzIFIt
Q2FyIERpc3BsYXkKVW5pdCBDb2xvciBNYW5hZ2VtZW50IE1vZHVsZS4KCkNNTSBpcyB0aGUgaW1h
Z2UgZW5oYW5jZW1lbnQgbW9kdWxlIGF2YWlsYWJsZSBvbiBlYWNoIFItQ2FyIERVIHZpZGVvCmNo
YW5uZWwgb24gR2VuMiBhbmQgR2VuMyBTb0NzIChWM0ggYW5kIFYzTSBleGNsdWRlZCkuCgpTaWdu
ZWQtb2ZmLWJ5OiBKYWNvcG8gTW9uZGkgPGphY29wbytyZW5lc2FzQGptb25kaS5vcmc+Ci0tLQog
Li4uL2JpbmRpbmdzL2Rpc3BsYXkvcmVuZXNhcyxjbW0udHh0ICAgICAgICAgIHwgMjUgKysrKysr
KysrKysrKysrKysrKwogMSBmaWxlIGNoYW5nZWQsIDI1IGluc2VydGlvbnMoKykKIGNyZWF0ZSBt
b2RlIDEwMDY0NCBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9yZW5l
c2FzLGNtbS50eHQKCmRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGlu
Z3MvZGlzcGxheS9yZW5lc2FzLGNtbS50eHQgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmlu
ZGluZ3MvZGlzcGxheS9yZW5lc2FzLGNtbS50eHQKbmV3IGZpbGUgbW9kZSAxMDA2NDQKaW5kZXgg
MDAwMDAwMDAwMDAwLi5kOGQzY2Y5Y2UyY2UKLS0tIC9kZXYvbnVsbAorKysgYi9Eb2N1bWVudGF0
aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9yZW5lc2FzLGNtbS50eHQKQEAgLTAsMCAr
MSwyNSBAQAorKiBSZW5lc2FzIFItQ2FyIENvbG9yIE1hbmFnZW1lbnQgTW9kdWxlIChDTU0pCisK
K1JlbmVzYXMgUi1DYXIgaW1hZ2UgZW5oYW5jZW1lbnQgbW9kdWxlIGNvbm5lY3RlZCB0byBSLUNh
ciBEVSB2aWRlbyBjaGFubmVscy4KKworUmVxdWlyZWQgcHJvcGVydGllczoKKyAtIGNvbXBhdGli
bGU6IHNoYWxsIGJlIG9uZSBvZjoKKyAgIC0gInJlbmVzYXMsY21tLWdlbjMiCisgICAtICJyZW5l
c2FzLGNtbS1nZW4yIgorCisgLSByZWc6IHRoZSBhZGRyZXNzIGJhc2UgYW5kIGxlbmd0aCBvZiB0
aGUgbWVtb3J5IGFyZWEgd2hlcmUgQ01NIGNvbnRyb2wKKyAgIHJlZ2lzdGVycyBhcmUgbWFwcGVk
IHRvLgorCisgLSBjbG9ja3M6IHBoYW5kbGUgYW5kIGNsb2NrLXNwZWNpZmllciBwYWlyIHRvIHRo
ZSBDTU0gZnVuY3Rpb25hbCBjbG9jaworICAgc3VwcGxpZXIuCisKK0V4YW1wbGU6CistLS0tLS0t
LQorCisJY21tMDogY21tQGZlYTQwMDAwIHsKKwkJY29tcGF0aWJsZSA9ICJyZW5lc2FzLGNtbSI7
CisJCXJlZyA9IDwwIDB4ZmVhNDAwMDAgMCAweDEwMDA+OworCQlwb3dlci1kb21haW5zID0gPCZz
eXNjIFI4QTc3OTZfUERfQUxXQVlTX09OPjsKKwkJY2xvY2tzID0gPCZjcGcgQ1BHX01PRCA3MTE+
OworCQlyZXNldHMgPSA8JmNwZyA3MTE+OworCX07Ci0tIAoyLjIxLjAKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QK
ZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9w
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
