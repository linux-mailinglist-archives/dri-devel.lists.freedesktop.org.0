Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CECCB41CC2
	for <lists+dri-devel@lfdr.de>; Wed, 12 Jun 2019 08:54:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8868289263;
	Wed, 12 Jun 2019 06:53:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from imap1.codethink.co.uk (imap1.codethink.co.uk [176.9.8.82])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7942389160
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Jun 2019 14:24:16 +0000 (UTC)
Received: from [167.98.27.226] (helo=happy.office.codethink.co.uk)
 by imap1.codethink.co.uk with esmtpsa (Exim 4.84_2 #1 (Debian))
 id 1hahOS-0003vU-3u; Tue, 11 Jun 2019 15:04:56 +0100
From: Michael Drake <michael.drake@codethink.co.uk>
To: Andrzej Hajda <a.hajda@samsung.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Michael Drake <michael.drake@codethink.co.uk>
Subject: [PATCH v1 03/11] dt-bindings: display/bridge: Add config property for
 ti948
Date: Tue, 11 Jun 2019 15:04:04 +0100
Message-Id: <20190611140412.32151-4-michael.drake@codethink.co.uk>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190611140412.32151-1-michael.drake@codethink.co.uk>
References: <20190611140412.32151-1-michael.drake@codethink.co.uk>
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 12 Jun 2019 06:53:41 +0000
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
Cc: Mark Rutland <mark.rutland@arm.com>, linux-kernel@lists.codethink.co.uk,
 David Airlie <airlied@linux.ie>, Nate Case <ncase@tesla.com>,
 Rob Herring <robh+dt@kernel.org>, Patrick Glaser <pglaser@tesla.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhlIGNvbmZpZyBwcm9wZXJ0eSBjYW4gYmUgdXNlZCB0byBwcm92aWRlIGFuIGFycmF5IG9mCnJl
Z2lzdGVyIGFkZHJlc3NlcyBhbmQgdmFsdWVzIHRvIGJlIHdyaXR0ZW4gdG8gY29uZmlndXJlCnRo
ZSBkZXZpY2UgZm9yIHRoZSBib2FyZC4KClNpZ25lZC1vZmYtYnk6IE1pY2hhZWwgRHJha2UgPG1p
Y2hhZWwuZHJha2VAY29kZXRoaW5rLmNvLnVrPgpDYzogUGF0cmljayBHbGFzZXIgPHBnbGFzZXJA
dGVzbGEuY29tPgpDYzogTmF0ZSBDYXNlIDxuY2FzZUB0ZXNsYS5jb20+Ci0tLQogLi4uL2JpbmRp
bmdzL2Rpc3BsYXkvYnJpZGdlL3RpLGRzOTB1Yjk0OC50eHQgIHwgMjEgKysrKysrKysrKysrKysr
KysrKwogMSBmaWxlIGNoYW5nZWQsIDIxIGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9Eb2N1
bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9icmlkZ2UvdGksZHM5MHViOTQ4
LnR4dCBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L2JyaWRnZS90
aSxkczkwdWI5NDgudHh0CmluZGV4IGY5ZTg2Y2IyMjkwMC4uMWU3MDMzYjBmM2I3IDEwMDY0NAot
LS0gYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9icmlkZ2UvdGks
ZHM5MHViOTQ4LnR4dAorKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlz
cGxheS9icmlkZ2UvdGksZHM5MHViOTQ4LnR4dApAQCAtMTIsNiArMTIsOCBAQCBSZXF1aXJlZCBw
cm9wZXJ0aWVzOgogT3B0aW9uYWwgcHJvcGVydGllczoKIAogLSByZWd1bGF0b3JzOiBMaXN0IG9m
IHJlZ3VsYXRvciBuYW1lIHN0cmluZ3MgdG8gZW5hYmxlIGZvciBvcGVyYXRpb24gb2YgZGV2aWNl
LgorLSBjb25maWc6IExpc3Qgb2YgPHJlZ2lzdGVyIGFkZHJlc3M+LDx2YWx1ZT4gcGFpcnMgdG8g
YmUgc2V0IHRvIGNvbmZpZ3VyZQorICBkZXZpY2Ugb24gcG93ZXJ1cC4gIFRoZSByZWdpc3RlciBh
ZGRyZXNzZXMgYW5kIHZhbHVlcyBhcmUgOGJpdC4KIAogRXhhbXBsZQogLS0tLS0tLQpAQCAtMjEs
NCArMjMsMjMgQEAgdGk5NDg6IGRzOTB1Yjk0OEAwIHsKIAogCXJlZ3VsYXRvcnM6ICJ2Y2MiLAog
CSAgICAgICAgICAgICJ2Y2NfZGlzcCI7CisJY29uZmlnOgorCSAgICAgICAgLyogc2V0IGVycm9y
IGNvdW50IHRvIG1heCAqLworCSAgICAgICAgPDB4NDE+LCA8MHgxZj4sCisJICAgICAgICAvKiBz
ZXRzIG91dHB1dCBtb2RlLCBubyBjaGFuZ2Ugbm90aWNlZCAqLworCSAgICAgICAgPDB4NDk+LCA8
MHhlMD4sCisJICAgICAgICAvKiBzcGVlZCB1cCBJMkMsIDB4RSBpcyBhcm91bmQgNDgwS0h6ICov
CisJICAgICAgICA8MHgyNj4sIDwweDBlPiwKKwkgICAgICAgIC8qIHNwZWVkIHVwIEkyQywgMHhF
IGlzIGFyb3VuZCA0ODBLSHogKi8KKwkgICAgICAgIDwweDI3PiwgPDB4MGU+LAorCSAgICAgICAg
Lyogc2V0cyBHUElPMCBhcyBhbiBpbnB1dCAqLworCSAgICAgICAgPDB4MUQ+LCA8MHgxMz4sCisJ
ICAgICAgICAvKiBzZXQgR1BJTzIgaGlnaCwgYmFja2xpZ2h0IFBXTSAoc2V0IHRvIDB4NTAgZm9y
IG5vcm1hbCB1c2UpICovCisJICAgICAgICA8MHgxRT4sIDwweDUwPiwKKwkgICAgICAgIC8qIHNl
dHMgR1BJTzMgYXMgYW4gb3V0cHV0IHdpdGggcmVtb3RlIGNvbnRyb2wgZm9yIHRvdWNoIFhSRVMg
Ki8KKwkgICAgICAgIDwweDFGPiwgPDB4MDU+LAorCSAgICAgICAgLyogc2V0IEdQSU81IGhpZ2gs
IGJhY2tsaWdodCBlbmFibGUgb24gbmV3IGRpc3BsYXkgKi8KKwkgICAgICAgIDwweDIwPiwgPDB4
MDk+LAorCSAgICAgICAgLyogc2V0IEdQSU83IGFuZCBHUElPOCBoaWdoIHRvIGVuYWJsZSB0b3Vj
aCBwb3dlciBhbmQgcHJveCBzZW5zZSAqLworCSAgICAgICAgPDB4MjE+LCA8MHg5MT47CiB9Owot
LSAKMi4yMC4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcK
aHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
