Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AD9B141CB0
	for <lists+dri-devel@lfdr.de>; Wed, 12 Jun 2019 08:53:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD2AC89228;
	Wed, 12 Jun 2019 06:53:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from imap1.codethink.co.uk (imap1.codethink.co.uk [176.9.8.82])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E539890DB
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Jun 2019 14:24:05 +0000 (UTC)
Received: from [167.98.27.226] (helo=happy.office.codethink.co.uk)
 by imap1.codethink.co.uk with esmtpsa (Exim 4.84_2 #1 (Debian))
 id 1hahOV-0003vU-Ml; Tue, 11 Jun 2019 15:04:59 +0100
From: Michael Drake <michael.drake@codethink.co.uk>
To: Andrzej Hajda <a.hajda@samsung.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Michael Drake <michael.drake@codethink.co.uk>
Subject: [PATCH v1 10/11] dt-bindings: display/bridge: Add config property for
 ti949
Date: Tue, 11 Jun 2019 15:04:11 +0100
Message-Id: <20190611140412.32151-11-michael.drake@codethink.co.uk>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190611140412.32151-1-michael.drake@codethink.co.uk>
References: <20190611140412.32151-1-michael.drake@codethink.co.uk>
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 12 Jun 2019 06:53:42 +0000
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
bmdzL2Rpc3BsYXkvYnJpZGdlL3RpLGRzOTB1Yjk0OS50eHQgICAgICAgIHwgMTMgKysrKysrKysr
KysrKwogMSBmaWxlIGNoYW5nZWQsIDEzIGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9Eb2N1
bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9icmlkZ2UvdGksZHM5MHViOTQ5
LnR4dCBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L2JyaWRnZS90
aSxkczkwdWI5NDkudHh0CmluZGV4IDNiYTM4OTdkNWU4MS4uYjFlMzhkNzMyZjE3IDEwMDY0NAot
LS0gYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9icmlkZ2UvdGks
ZHM5MHViOTQ5LnR4dAorKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlz
cGxheS9icmlkZ2UvdGksZHM5MHViOTQ5LnR4dApAQCAtMTIsNiArMTIsOCBAQCBSZXF1aXJlZCBw
cm9wZXJ0aWVzOgogT3B0aW9uYWwgcHJvcGVydGllczoKIAogLSByZWd1bGF0b3JzOiBMaXN0IG9m
IHJlZ3VsYXRvciBuYW1lIHN0cmluZ3MgdG8gZW5hYmxlIGZvciBvcGVyYXRpb24gb2YgZGV2aWNl
LgorLSBjb25maWc6IExpc3Qgb2YgPHJlZ2lzdGVyIGFkZHJlc3M+LDx2YWx1ZT4gcGFpcnMgdG8g
YmUgc2V0IHRvIGNvbmZpZ3VyZQorICBkZXZpY2Ugb24gcG93ZXJ1cC4gIFRoZSByZWdpc3RlciBh
ZGRyZXNzZXMgYW5kIHZhbHVlcyBhcmUgOGJpdC4KIAogRXhhbXBsZQogLS0tLS0tLQpAQCAtMjEs
NCArMjMsMTUgQEAgdGk5NDk6IGRzOTB1Yjk0OUAwIHsKIAogCXJlZ3VsYXRvcnM6ICJ2Y2MiLAog
CSAgICAgICAgICAgICJ2Y2NfaGRtaSI7CisJY29uZmlnOgorCSAgICAgICAgLyogR1BJTzAgaXMg
YW4gb3V0cHV0IHdpdGggcmVtb3RlIHZhbHVlICovCisJICAgICAgICA8MHgwRD4sIDwweDI1PiwK
KwkgICAgICAgIC8qIEdQSU8zIGlzIGFuIGlucHV0IGZvciBYUkVTICovCisJICAgICAgICA8MHgw
Rj4sIDwweDAzPiwKKwkgICAgICAgIC8qIEdQSU8yIGlzIGFuIGlucHV0IGZvciBiYWNrbGlnaHQg
UFdNICovCisJICAgICAgICA8MHgwRT4sIDwweDMwPiwKKwkgICAgICAgIC8qIEVuYWJsZXMgZm9y
d2FyZCBjaGFubmVsIEkyQyBwYXNzIHRocm91Z2ggKi8KKwkgICAgICAgIDwweDE3PiwgPDB4OWU+
LAorCSAgICAgICAgLyogRW5hYmxlcyBQT1JUMSByZWdpc3RlcnMgSTJDIGFjY2VzcyAqLworCSAg
ICAgICAgPDB4MUU+LCA8MHgwND47CiB9OwotLSAKMi4yMC4xCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1k
ZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcv
bWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
