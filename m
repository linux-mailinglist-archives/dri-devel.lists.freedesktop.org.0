Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F9F547506
	for <lists+dri-devel@lfdr.de>; Sun, 16 Jun 2019 16:03:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C64B89263;
	Sun, 16 Jun 2019 14:02:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from inva021.nxp.com (inva021.nxp.com [92.121.34.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E97D08936B
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jun 2019 11:57:57 +0000 (UTC)
Received: from inva021.nxp.com (localhost [127.0.0.1])
 by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id D6FDA200EA3;
 Fri, 14 Jun 2019 13:51:04 +0200 (CEST)
Received: from inva024.eu-rdc02.nxp.com (inva024.eu-rdc02.nxp.com
 [134.27.226.22])
 by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id C98EE200EA2;
 Fri, 14 Jun 2019 13:51:04 +0200 (CEST)
Received: from fsr-ub1664-046.ea.freescale.net
 (fsr-ub1664-046.ea.freescale.net [10.171.96.34])
 by inva024.eu-rdc02.nxp.com (Postfix) with ESMTP id B634C20606;
 Fri, 14 Jun 2019 13:51:04 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by fsr-ub1664-046.ea.freescale.net (Postfix) with ESMTP id 8EB9255AE;
 Fri, 14 Jun 2019 14:51:04 +0300 (EEST)
Received: from fsr-ub1664-046.ea.freescale.net ([127.0.0.1])
 by localhost (fsr-ub1664-046.ea.freescale.net [127.0.0.1]) (amavisd-new,
 port 10032)
 with ESMTP id 0h5MoUcoTq8V; Fri, 14 Jun 2019 14:51:04 +0300 (EEST)
Received: from localhost (localhost [127.0.0.1])
 by fsr-ub1664-046.ea.freescale.net (Postfix) with ESMTP id 1C6C155B0;
 Fri, 14 Jun 2019 14:51:04 +0300 (EEST)
X-Virus-Scanned: amavisd-new at ea.freescale.net
Received: from fsr-ub1664-046.ea.freescale.net ([127.0.0.1])
 by localhost (fsr-ub1664-046.ea.freescale.net [127.0.0.1]) (amavisd-new,
 port 10026)
 with ESMTP id q-SgHouCg23M; Fri, 14 Jun 2019 14:51:03 +0300 (EEST)
Received: from fsr-ub1664-120.ea.freescale.net
 (fsr-ub1664-120.ea.freescale.net [10.171.82.81])
 by fsr-ub1664-046.ea.freescale.net (Postfix) with ESMTP id DF85E55AD;
 Fri, 14 Jun 2019 14:51:03 +0300 (EEST)
From: Robert Chiras <robert.chiras@nxp.com>
To: Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Subject: [PATCH 1/2] dt-bindings: display: panel: Add support for Raydium
 RM67191 panel
Date: Fri, 14 Jun 2019 14:51:02 +0300
Message-Id: <1560513063-24995-2-git-send-email-robert.chiras@nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1560513063-24995-1-git-send-email-robert.chiras@nxp.com>
References: <1560513063-24995-1-git-send-email-robert.chiras@nxp.com>
MIME-Version: 1.0
X-Virus-Scanned: ClamAV using ClamSMTP
X-Mailman-Approved-At: Sun, 16 Jun 2019 14:01:48 +0000
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QWRkIGR0LWJpbmRpbmdzIGRvY3VtZW50YXRpb24gZm9yIFJheWRpdW0gUk02NzE5MSBEU0kgcGFu
ZWwuCgpTaWduZWQtb2ZmLWJ5OiBSb2JlcnQgQ2hpcmFzIDxyb2JlcnQuY2hpcmFzQG54cC5jb20+
Ci0tLQogLi4uL2JpbmRpbmdzL2Rpc3BsYXkvcGFuZWwvcmF5ZGl1bSxybTY3MTkxLnR4dCAgICAg
fCA0MiArKysrKysrKysrKysrKysrKysrKysrCiAxIGZpbGUgY2hhbmdlZCwgNDIgaW5zZXJ0aW9u
cygrKQogY3JlYXRlIG1vZGUgMTAwNjQ0IERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5n
cy9kaXNwbGF5L3BhbmVsL3JheWRpdW0scm02NzE5MS50eHQKCmRpZmYgLS1naXQgYS9Eb2N1bWVu
dGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9wYW5lbC9yYXlkaXVtLHJtNjcxOTEu
dHh0IGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvcGFuZWwvcmF5
ZGl1bSxybTY3MTkxLnR4dApuZXcgZmlsZSBtb2RlIDEwMDY0NAppbmRleCAwMDAwMDAwLi41YTYy
NjhkCi0tLSAvZGV2L251bGwKKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdz
L2Rpc3BsYXkvcGFuZWwvcmF5ZGl1bSxybTY3MTkxLnR4dApAQCAtMCwwICsxLDQyIEBACitSYXlk
aXVtIFJNNjcxNzEgT0xFRCBMQ0QgcGFuZWwgd2l0aCBNSVBJLURTSSBwcm90b2NvbAorCitSZXF1
aXJlZCBwcm9wZXJ0aWVzOgorLSBjb21wYXRpYmxlOiAJCSJyYXlkaXVtLHJtNjcxOTEiCistIHJl
ZzoJCQl2aXJ0dWFsIGNoYW5uZWwgZm9yIE1JUEktRFNJIHByb3RvY29sCisJCQltdXN0IGJlIDww
PgorLSBkc2ktbGFuZXM6CQludW1iZXIgb2YgRFNJIGxhbmVzIHRvIGJlIHVzZWQKKwkJCW11c3Qg
YmUgPDM+IG9yIDw0PgorLSBwb3J0OiAJCWlucHV0IHBvcnQgbm9kZSB3aXRoIGVuZHBvaW50IGRl
ZmluaXRpb24gYXMKKwkJCWRlZmluZWQgaW4gRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRp
bmdzL2dyYXBoLnR4dDsKKwkJCXRoZSBpbnB1dCBwb3J0IHNob3VsZCBiZSBjb25uZWN0ZWQgdG8g
YSBNSVBJLURTSSBkZXZpY2UKKwkJCWRyaXZlcgorCitPcHRpb25hbCBwcm9wZXJ0aWVzOgorLSBy
ZXNldC1ncGlvOgkJYSBHUElPIHNwZWMgZm9yIHRoZSBSU1RfQiBHUElPIHBpbgorLSBwaW5jdHJs
LTAJCXBoYW5kbGUgdG8gdGhlIHBpbiBzZXR0aW5ncyBmb3IgdGhlIHJlc2V0IHBpbgorLSB3aWR0
aC1tbToJCXBoeXNpY2FsIHBhbmVsIHdpZHRoIFttbV0KKy0gaGVpZ2h0LW1tOgkJcGh5c2ljYWwg
cGFuZWwgaGVpZ2h0IFttbV0KKy0gZGlzcGxheS10aW1pbmdzOgl0aW1pbmdzIGZvciB0aGUgY29u
bmVjdGVkIHBhbmVsIGFjY29yZGluZyB0byBbMV0KKy0gdmlkZW8tbW9kZToJCTAgLSBidXJzdC1t
b2RlCisJCQkxIC0gbm9uLWJ1cnN0IHdpdGggc3luYyBldmVudAorCQkJMiAtIG5vbi1idXJzdCB3
aXRoIHN5bmMgcHVsc2UKKworWzFdOiBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mv
ZGlzcGxheS9kaXNwbGF5LXRpbWluZy50eHQKKworRXhhbXBsZToKKworCXBhbmVsQDAgeworCQlj
b21wYXRpYmxlID0gInJheWRpdW0scm02NzE5MSI7CisJCXJlZyA9IDwwPjsKKwkJcGluY3RybC0w
ID0gPCZwaW5jdHJsX21pcGlfZHNpXzBfMV9lbj47CisJCXJlc2V0LWdwaW8gPSA8JmdwaW8xIDcg
R1BJT19BQ1RJVkVfSElHSD47CisJCWRzaS1sYW5lcyA9IDw0PjsKKwkJd2lkdGgtbW0gPSA8Njg+
OworCQloZWlnaHQtbW0gPSA8MTIxPjsKKworCQlwb3J0IHsKKwkJCXBhbmVsX2luOiBlbmRwb2lu
dCB7CisJCQkJcmVtb3RlLWVuZHBvaW50ID0gPCZtaXBpX291dD47CisJCQl9OworCQl9OworCX07
Ci0tIAoyLjcuNAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
Cmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
