Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D0331169EF
	for <lists+dri-devel@lfdr.de>; Mon,  9 Dec 2019 10:47:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E8F16E34A;
	Mon,  9 Dec 2019 09:46:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com
 [210.160.252.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 859D66FA59
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Dec 2019 16:33:38 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.69,285,1571670000"; d="scan'208";a="33477374"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
 by relmlie6.idc.renesas.com with ESMTP; 07 Dec 2019 01:33:37 +0900
Received: from fabrizio-dev.ree.adwin.renesas.com (unknown [10.226.36.196])
 by relmlir5.idc.renesas.com (Postfix) with ESMTP id 729F7400D0EC;
 Sat,  7 Dec 2019 01:33:32 +0900 (JST)
From: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
To: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Sean Paul <sean@poorly.run>,
 Andrzej Hajda <a.hajda@samsung.com>
Subject: [PATCH v4 6/7] dt-bindings: display: Add idk-2121wr binding
Date: Fri,  6 Dec 2019 16:32:53 +0000
Message-Id: <1575649974-31472-7-git-send-email-fabrizio.castro@bp.renesas.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1575649974-31472-1-git-send-email-fabrizio.castro@bp.renesas.com>
References: <1575649974-31472-1-git-send-email-fabrizio.castro@bp.renesas.com>
X-Mailman-Approved-At: Mon, 09 Dec 2019 09:46:36 +0000
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
Cc: Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
 devicetree@vger.kernel.org, Chris Paterson <Chris.Paterson2@renesas.com>,
 ebiharaml@si-linux.co.jp,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Magnus Damm <magnus.damm@gmail.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Biju Das <biju.das@bp.renesas.com>,
 linux-renesas-soc@vger.kernel.org, Simon Horman <horms@verge.net.au>,
 Jacopo Mondi <jacopo+renesas@jmondi.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Sam Ravnborg <sam@ravnborg.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QWRkIGJpbmRpbmcgZm9yIHRoZSBpZGstMjEyMXdyIExWRFMgcGFuZWwgZnJvbSBBZHZhbnRlY2gu
CgpTb21lIHBhbmVsLXNwZWNpZmljIGRvY3VtZW50YXRpb24gY2FuIGJlIGZvdW5kIGhlcmU6Cmh0
dHBzOi8vYnV5LmFkdmFudGVjaC5ldS9EaXNwbGF5cy9FbWJlZGRlZC1MQ0QtS2l0cy1IaWdoLUJy
aWdodG5lc3MvbW9kZWwtSURLLTIxMjFXUi1LMkZIQTJFLmh0bQoKU2lnbmVkLW9mZi1ieTogRmFi
cml6aW8gQ2FzdHJvIDxmYWJyaXppby5jYXN0cm9AYnAucmVuZXNhcy5jb20+CgotLS0KdjMtPnY0
OgoqIEFic29yYmVkIHBhdGNoICJkdC1iaW5kaW5nczogZGlzcGxheTogQWRkIGJpbmRpbmdzIGZv
ciBMVkRTCiAgYnVzLXRpbWluZ3MiCiogQmlnIHJlc3RydWN0dXJpbmcgYWZ0ZXIgUm9iJ3MgYW5k
IExhdXJlbnQncyBjb21tZW50cwoKdjItPnYzOgoqIG5ldyBwYXRjaAotLS0KIC4uLi9kaXNwbGF5
L3BhbmVsL2FkdmFudGVjaCxpZGstMjEyMXdyLnlhbWwgICAgICAgIHwgMTI4ICsrKysrKysrKysr
KysrKysrKysrKwogMSBmaWxlIGNoYW5nZWQsIDEyOCBpbnNlcnRpb25zKCspCiBjcmVhdGUgbW9k
ZSAxMDA2NDQgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvcGFuZWwv
YWR2YW50ZWNoLGlkay0yMTIxd3IueWFtbAoKZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2
aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L3BhbmVsL2FkdmFudGVjaCxpZGstMjEyMXdyLnlhbWwg
Yi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9wYW5lbC9hZHZhbnRl
Y2gsaWRrLTIxMjF3ci55YW1sCm5ldyBmaWxlIG1vZGUgMTAwNjQ0CmluZGV4IDAwMDAwMDAuLjI0
Y2QzOGIKLS0tIC9kZXYvbnVsbAorKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGlu
Z3MvZGlzcGxheS9wYW5lbC9hZHZhbnRlY2gsaWRrLTIxMjF3ci55YW1sCkBAIC0wLDAgKzEsMTI4
IEBACisjIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBHUEwtMi4wCislWUFNTCAxLjIKKy0tLQor
JGlkOiBodHRwOi8vZGV2aWNldHJlZS5vcmcvc2NoZW1hcy9kaXNwbGF5L3BhbmVsL2FkdmFudGVj
aCxpZGstMjEyMXdyLnlhbWwjCiskc2NoZW1hOiBodHRwOi8vZGV2aWNldHJlZS5vcmcvbWV0YS1z
Y2hlbWFzL2NvcmUueWFtbCMKKwordGl0bGU6IEFkdmFudGVjaCBJREstMjEyMVdSIDIxLjUiIEZ1
bGwtSEQgZHVhbC1MVkRTIHBhbmVsCisKK21haW50YWluZXJzOgorICAtIEZhYnJpemlvIENhc3Ry
byA8ZmFicml6aW8uY2FzdHJvQGJwLnJlbmVzYXMuY29tPgorICAtIFRoaWVycnkgUmVkaW5nIDx0
aGllcnJ5LnJlZGluZ0BnbWFpbC5jb20+CisKK2Rlc2NyaXB0aW9uOiB8CisgIFRoZSBJREstMjEy
MVdSIGZyb20gQWR2YW50ZWNoIGlzIGEgRnVsbC1IRCBkdWFsLUxWRFMgcGFuZWwuCisgIEEgZHVh
bC1MVkRTIGludGVyZmFjZSBpcyBhIGR1YWwtbGluayBjb25uZWN0aW9uIHdpdGggZXZlbiBwaXhl
bHMgdHJhdmVsaW5nCisgIG9uIG9uZSBsaW5rLCBhbmQgd2l0aCBvZGQgcGl4ZWxzIHRyYXZlbGlu
ZyBvbiB0aGUgb3RoZXIgbGluay4KKworICBUaGUgcGFuZWwgZXhwZWN0cyBvZGQgcGl4ZWxzIG9u
IHRoZSBmaXJzdCBwb3J0LCBhbmQgZXZlbiBwaXhlbHMgb24gdGhlCisgIHNlY29uZCBwb3J0LCB0
aGVyZWZvcmUgdGhlIHBvcnRzIG11c3QgYmUgbWFya2VkIGFjY29yZGluZ2x5ICh3aXRoIGVpdGhl
cgorICBkdWFsLWx2ZHMtb2RkLXBpeGVscyBvciBkdWFsLWx2ZHMtZXZlbi1waXhlbHMpLgorCitw
cm9wZXJ0aWVzOgorICBjb21wYXRpYmxlOgorICAgIGl0ZW1zOgorICAgICAgLSBjb25zdDogYWR2
YW50ZWNoLGlkay0yMTIxd3IKKyAgICAgIC0ge30gIyBwYW5lbC1sdmRzLCBidXQgbm90IGxpc3Rl
ZCBoZXJlIHRvIGF2b2lkIGZhbHNlIHNlbGVjdAorCisgIHdpZHRoLW1tOgorICAgIGNvbnN0OiA0
NzYKKworICBoZWlnaHQtbW06CisgICAgY29uc3Q6IDI2OAorCisgIGRhdGEtbWFwcGluZzoKKyAg
ICBjb25zdDogdmVzYS0yNAorCisgIHBvcnRzOgorICAgIHR5cGU6IG9iamVjdAorICAgIHByb3Bl
cnRpZXM6CisgICAgICAiI2FkZHJlc3MtY2VsbHMiOgorICAgICAgICBjb25zdDogMQorCisgICAg
ICAiI3NpemUtY2VsbHMiOgorICAgICAgICBjb25zdDogMAorCisgICAgICBwb3J0QDA6CisgICAg
ICAgIHR5cGU6IG9iamVjdAorICAgICAgICBkZXNjcmlwdGlvbjogVGhlIHNpbmsgZm9yIG9kZCBw
aXhlbHMuCisgICAgICAgIHByb3BlcnRpZXM6CisgICAgICAgICAgcmVnOgorICAgICAgICAgICAg
Y29uc3Q6IDAKKworICAgICAgICAgIGR1YWwtbHZkcy1vZGQtcGl4ZWxzOiB0cnVlCisKKyAgICAg
ICAgcmVxdWlyZWQ6CisgICAgICAgICAgLSByZWcKKyAgICAgICAgICAtIGR1YWwtbHZkcy1vZGQt
cGl4ZWxzCisKKyAgICAgIHBvcnRAMToKKyAgICAgICAgdHlwZTogb2JqZWN0CisgICAgICAgIGRl
c2NyaXB0aW9uOiBUaGUgc2luayBmb3IgZXZlbiBwaXhlbHMuCisgICAgICAgIHByb3BlcnRpZXM6
CisgICAgICAgICAgcmVnOgorICAgICAgICAgICAgY29uc3Q6IDEKKworICAgICAgICAgIGR1YWwt
bHZkcy1ldmVuLXBpeGVsczogdHJ1ZQorCisgICAgICAgIHJlcXVpcmVkOgorICAgICAgICAgIC0g
cmVnCisgICAgICAgICAgLSBkdWFsLWx2ZHMtZXZlbi1waXhlbHMKKworICBwYW5lbC10aW1pbmc6
IHRydWUKKworYWRkaXRpb25hbFByb3BlcnRpZXM6IGZhbHNlCisKK3JlcXVpcmVkOgorICAtIGNv
bXBhdGlibGUKKyAgLSB3aWR0aC1tbQorICAtIGhlaWdodC1tbQorICAtIGRhdGEtbWFwcGluZwor
ICAtIHBhbmVsLXRpbWluZworICAtIHBvcnRzCisKK2V4YW1wbGVzOgorICAtIHwrCisgICAgcGFu
ZWwtbHZkcyB7CisgICAgICBjb21wYXRpYmxlID0gImFkdmFudGVjaCxpZGstMjEyMXdyIiwgInBh
bmVsLWx2ZHMiOworCisgICAgICB3aWR0aC1tbSA9IDw0NzY+OworICAgICAgaGVpZ2h0LW1tID0g
PDI2OD47CisKKyAgICAgIGRhdGEtbWFwcGluZyA9ICJ2ZXNhLTI0IjsKKworICAgICAgcGFuZWwt
dGltaW5nIHsKKyAgICAgICAgY2xvY2stZnJlcXVlbmN5ID0gPDE0ODUwMDAwMD47CisgICAgICAg
IGhhY3RpdmUgPSA8MTkyMD47CisgICAgICAgIHZhY3RpdmUgPSA8MTA4MD47CisgICAgICAgIGhz
eW5jLWxlbiA9IDw0ND47CisgICAgICAgIGhmcm9udC1wb3JjaCA9IDw4OD47CisgICAgICAgIGhi
YWNrLXBvcmNoID0gPDE0OD47CisgICAgICAgIHZmcm9udC1wb3JjaCA9IDw0PjsKKyAgICAgICAg
dmJhY2stcG9yY2ggPSA8MzY+OworICAgICAgICB2c3luYy1sZW4gPSA8NT47CisgICAgICB9Owor
CisgICAgICBwb3J0cyB7CisgICAgICAgICNhZGRyZXNzLWNlbGxzID0gPDE+OworICAgICAgICAj
c2l6ZS1jZWxscyA9IDwwPjsKKworICAgICAgICBwb3J0QDAgeworICAgICAgICAgIHJlZyA9IDww
PjsKKyAgICAgICAgICBkdWFsLWx2ZHMtb2RkLXBpeGVsczsKKyAgICAgICAgICBwYW5lbF9pbjA6
IGVuZHBvaW50IHsKKyAgICAgICAgICAgIHJlbW90ZS1lbmRwb2ludCA9IDwmbHZkczBfb3V0PjsK
KyAgICAgICAgICB9OworICAgICAgICB9OworCisgICAgICAgIHBvcnRAMSB7CisgICAgICAgICAg
cmVnID0gPDE+OworICAgICAgICAgIGR1YWwtbHZkcy1ldmVuLXBpeGVsczsKKyAgICAgICAgICBw
YW5lbF9pbjE6IGVuZHBvaW50IHsKKyAgICAgICAgICAgIHJlbW90ZS1lbmRwb2ludCA9IDwmbHZk
czFfb3V0PjsKKyAgICAgICAgICB9OworICAgICAgICB9OworICAgICAgfTsKKyAgICB9OworCisu
Li4KLS0gCjIuNy40CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5v
cmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2
ZWw=
