Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2939F4E136
	for <lists+dri-devel@lfdr.de>; Fri, 21 Jun 2019 09:23:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE61D6E84E;
	Fri, 21 Jun 2019 07:23:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from inva021.nxp.com (inva021.nxp.com [92.121.34.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D8706E57A
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Jun 2019 13:30:34 +0000 (UTC)
Received: from inva021.nxp.com (localhost [127.0.0.1])
 by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 652CD200F42;
 Thu, 20 Jun 2019 15:30:33 +0200 (CEST)
Received: from inva024.eu-rdc02.nxp.com (inva024.eu-rdc02.nxp.com
 [134.27.226.22])
 by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 58B7E200791;
 Thu, 20 Jun 2019 15:30:33 +0200 (CEST)
Received: from fsr-ub1664-120.ea.freescale.net
 (fsr-ub1664-120.ea.freescale.net [10.171.82.81])
 by inva024.eu-rdc02.nxp.com (Postfix) with ESMTP id D5FB820629;
 Thu, 20 Jun 2019 15:30:32 +0200 (CEST)
From: Robert Chiras <robert.chiras@nxp.com>
To: Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Subject: [PATCH v3 1/2] dt-bindings: display: panel: Add support for Raydium
 RM67191 panel
Date: Thu, 20 Jun 2019 16:30:27 +0300
Message-Id: <1561037428-13855-2-git-send-email-robert.chiras@nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1561037428-13855-1-git-send-email-robert.chiras@nxp.com>
References: <1561037428-13855-1-git-send-email-robert.chiras@nxp.com>
X-Virus-Scanned: ClamAV using ClamSMTP
X-Mailman-Approved-At: Fri, 21 Jun 2019 07:22:42 +0000
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
Cc: Robert Chiras <robert.chiras@nxp.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-imx@nxp.com
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QWRkIGR0LWJpbmRpbmdzIGRvY3VtZW50YXRpb24gZm9yIFJheWRpdW0gUk02NzE5MSBEU0kgcGFu
ZWwuCgpTaWduZWQtb2ZmLWJ5OiBSb2JlcnQgQ2hpcmFzIDxyb2JlcnQuY2hpcmFzQG54cC5jb20+
ClJldmlld2VkLWJ5OiBTYW0gUmF2bmJvcmcgPHNhbUByYXZuYm9yZy5vcmc+Ci0tLQogLi4uL2Jp
bmRpbmdzL2Rpc3BsYXkvcGFuZWwvcmF5ZGl1bSxybTY3MTkxLnR4dCAgICAgfCAzOSArKysrKysr
KysrKysrKysrKysrKysrCiAxIGZpbGUgY2hhbmdlZCwgMzkgaW5zZXJ0aW9ucygrKQogY3JlYXRl
IG1vZGUgMTAwNjQ0IERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L3Bh
bmVsL3JheWRpdW0scm02NzE5MS50eHQKCmRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2Rldmlj
ZXRyZWUvYmluZGluZ3MvZGlzcGxheS9wYW5lbC9yYXlkaXVtLHJtNjcxOTEudHh0IGIvRG9jdW1l
bnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvcGFuZWwvcmF5ZGl1bSxybTY3MTkx
LnR4dApuZXcgZmlsZSBtb2RlIDEwMDY0NAppbmRleCAwMDAwMDAwLi41MmFmMjcyCi0tLSAvZGV2
L251bGwKKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvcGFu
ZWwvcmF5ZGl1bSxybTY3MTkxLnR4dApAQCAtMCwwICsxLDM5IEBACitSYXlkaXVtIFJNNjcxNzEg
T0xFRCBMQ0QgcGFuZWwgd2l0aCBNSVBJLURTSSBwcm90b2NvbAorCitSZXF1aXJlZCBwcm9wZXJ0
aWVzOgorLSBjb21wYXRpYmxlOiAJCSJyYXlkaXVtLHJtNjcxOTEiCistIHJlZzoJCQl2aXJ0dWFs
IGNoYW5uZWwgZm9yIE1JUEktRFNJIHByb3RvY29sCisJCQltdXN0IGJlIDwwPgorLSBkc2ktbGFu
ZXM6CQludW1iZXIgb2YgRFNJIGxhbmVzIHRvIGJlIHVzZWQKKwkJCW11c3QgYmUgPDM+IG9yIDw0
PgorLSBwb3J0OiAJCWlucHV0IHBvcnQgbm9kZSB3aXRoIGVuZHBvaW50IGRlZmluaXRpb24gYXMK
KwkJCWRlZmluZWQgaW4gRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2dyYXBoLnR4
dDsKKwkJCXRoZSBpbnB1dCBwb3J0IHNob3VsZCBiZSBjb25uZWN0ZWQgdG8gYSBNSVBJLURTSSBk
ZXZpY2UKKwkJCWRyaXZlcgorCitPcHRpb25hbCBwcm9wZXJ0aWVzOgorLSByZXNldC1ncGlvczoJ
CWEgR1BJTyBzcGVjIGZvciB0aGUgUlNUX0IgR1BJTyBwaW4KKy0gd2lkdGgtbW06CQlzZWUgcGFu
ZWwtY29tbW9uLnR4dAorLSBoZWlnaHQtbW06CQlzZWUgcGFuZWwtY29tbW9uLnR4dAorLSB2aWRl
by1tb2RlOgkJMCAtIGJ1cnN0LW1vZGUKKwkJCTEgLSBub24tYnVyc3Qgd2l0aCBzeW5jIGV2ZW50
CisJCQkyIC0gbm9uLWJ1cnN0IHdpdGggc3luYyBwdWxzZQorCitFeGFtcGxlOgorCisJcGFuZWxA
MCB7CisJCWNvbXBhdGlibGUgPSAicmF5ZGl1bSxybTY3MTkxIjsKKwkJcmVnID0gPDA+OworCQlw
aW5jdHJsLTAgPSA8JnBpbmN0cmxfbWlwaV9kc2lfMF8xX2VuPjsKKwkJcGluY3RybC1uYW1lcyA9
ICJkZWZhdWx0IjsKKwkJcmVzZXQtZ3Bpb3MgPSA8JmdwaW8xIDcgR1BJT19BQ1RJVkVfTE9XPjsK
KwkJZHNpLWxhbmVzID0gPDQ+OworCQl3aWR0aC1tbSA9IDw2OD47CisJCWhlaWdodC1tbSA9IDwx
MjE+OworCisJCXBvcnQgeworCQkJcGFuZWxfaW46IGVuZHBvaW50IHsKKwkJCQlyZW1vdGUtZW5k
cG9pbnQgPSA8Jm1pcGlfb3V0PjsKKwkJCX07CisJCX07CisJfTsKLS0gCjIuNy40CgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGlu
ZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVl
ZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
