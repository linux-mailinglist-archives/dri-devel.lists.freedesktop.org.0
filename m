Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C9A9634A58
	for <lists+dri-devel@lfdr.de>; Tue,  4 Jun 2019 16:26:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F10BD899E7;
	Tue,  4 Jun 2019 14:26:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from newverein.lst.de (verein.lst.de [213.95.11.211])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 78DFC897F5
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Jun 2019 12:23:30 +0000 (UTC)
Received: by newverein.lst.de (Postfix, from userid 2005)
 id 07B9068B05; Tue,  4 Jun 2019 14:23:04 +0200 (CEST)
From: Torsten Duwe <duwe@lst.de>
To: Maxime Ripard <maxime.ripard@bootlin.com>, Chen-Yu Tsai <wens@csie.org>,
 Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Andrzej Hajda <a.hajda@samsung.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Icenowy Zheng <icenowy@aosc.io>, Sean Paul <seanpaul@chromium.org>,
 Vasily Khoruzhick <anarsoul@gmail.com>, Harald Geyer <harald@ccbib.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Thomas Gleixner <tglx@linutronix.de>
Subject: [PATCH v2 6/7] dt-bindings: Add ANX6345 DP/eDP transmitter binding
References: <20190604122150.29D6468B05@newverein.lst.de>
Message-Id: <20190604122305.07B9068B05@newverein.lst.de>
Date: Tue,  4 Jun 2019 14:23:04 +0200 (CEST)
X-Mailman-Approved-At: Tue, 04 Jun 2019 14:26:35 +0000
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
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhlIGFueDYzNDUgaXMgYW4gdWx0cmEtbG93IHBvd2VyIERpc3BsYXlQb3J0L2VEUCB0cmFuc21p
dHRlciBkZXNpZ25lZApmb3IgcG9ydGFibGUgZGV2aWNlcy4KCkFkZCBhIGJpbmRpbmcgZG9jdW1l
bnQgZm9yIGl0LgoKU2lnbmVkLW9mZi1ieTogSWNlbm93eSBaaGVuZyA8aWNlbm93eUBhb3NjLmlv
PgpTaWduZWQtb2ZmLWJ5OiBWYXNpbHkgS2hvcnV6aGljayA8YW5hcnNvdWxAZ21haWwuY29tPgpS
ZXZpZXdlZC1ieTogUm9iIEhlcnJpbmcgPHJvYmhAa2VybmVsLm9yZz4KU2lnbmVkLW9mZi1ieTog
VG9yc3RlbiBEdXdlIDxkdXdlQHN1c2UuZGU+ClJldmlld2VkLWJ5OiBMYXVyZW50IFBpbmNoYXJ0
IDxsYXVyZW50LnBpbmNoYXJ0QGlkZWFzb25ib2FyZC5jb20+Ci0tLQogLi4uL2RldmljZXRyZWUv
YmluZGluZ3MvZGlzcGxheS9icmlkZ2UvYW54NjM0NS50eHQgfCA1NyArKysrKysrKysrKysrKysr
KysrKysrCiAxIGZpbGUgY2hhbmdlZCwgNTcgaW5zZXJ0aW9ucygrKQogY3JlYXRlIG1vZGUgMTAw
NjQ0IERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L2JyaWRnZS9hbng2
MzQ1LnR4dAoKZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9k
aXNwbGF5L2JyaWRnZS9hbng2MzQ1LnR4dCBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5k
aW5ncy9kaXNwbGF5L2JyaWRnZS9hbng2MzQ1LnR4dApuZXcgZmlsZSBtb2RlIDEwMDY0NAppbmRl
eCAwMDAwMDAwMDAwMDAuLmJkNjNmNmFjMTA3ZQotLS0gL2Rldi9udWxsCisrKyBiL0RvY3VtZW50
YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L2JyaWRnZS9hbng2MzQ1LnR4dApAQCAt
MCwwICsxLDU3IEBACitBbmFsb2dpeCBBTlg2MzQ1IGVEUCBUcmFuc21pdHRlcgorLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KKworVGhlIEFOWDYzNDUgaXMgYW4gdWx0cmEtbG93IHBv
d2VyIEZ1bGwtSEQgZURQIHRyYW5zbWl0dGVyIGRlc2lnbmVkIGZvcgorcG9ydGFibGUgZGV2aWNl
cy4KKworUmVxdWlyZWQgcHJvcGVydGllczoKKworIC0gY29tcGF0aWJsZQkJOiAiYW5hbG9naXgs
YW54NjM0NSIKKyAtIHJlZwkJCTogSTJDIGFkZHJlc3Mgb2YgdGhlIGRldmljZQorIC0gcmVzZXQt
Z3Bpb3MJCTogV2hpY2ggR1BJTyB0byB1c2UgZm9yIHJlc2V0CisgLSBkdmRkMTItc3VwcGx5CTog
UmVndWxhdG9yIGZvciAxLjJWIGRpZ2l0YWwgY29yZSBwb3dlci4KKyAtIGR2ZGQyNS1zdXBwbHkJ
OiBSZWd1bGF0b3IgZm9yIDIuNVYgZGlnaXRhbCBjb3JlIHBvd2VyLgorIC0gVmlkZW8gcG9ydCBm
b3IgTFZUVEwgaW5wdXQsIHVzaW5nIHRoZSBEVCBiaW5kaW5ncyBkZWZpbmVkIGluIFsxXS4KKwor
T3B0aW9uYWwgcHJvcGVydGllczoKKworIC0gVmlkZW8gcG9ydCBmb3IgZURQIG91dHB1dCAocGFu
ZWwgb3IgY29ubmVjdG9yKSB1c2luZyB0aGUgRFQgYmluZGluZ3MKKyAgIGRlZmluZWQgaW4gWzFd
LgorCitbMV06IERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tZWRpYS92aWRlby1p
bnRlcmZhY2VzLnR4dAorCitFeGFtcGxlOgorCithbng2MzQ1OiBhbng2MzQ1QDM4IHsKKwljb21w
YXRpYmxlID0gImFuYWxvZ2l4LGFueDYzNDUiOworCXJlZyA9IDwweDM4PjsKKwlyZXNldC1ncGlv
cyA9IDwmcGlvIDMgMjQgR1BJT19BQ1RJVkVfTE9XPjsgLyogUEQyNCAqLworCWR2ZGQyNS1zdXBw
bHkgPSA8JnJlZ19kbGRvMj47CisJZHZkZDEyLXN1cHBseSA9IDwmcmVnX2ZsZG8xPjsKKworCXBv
cnRzIHsKKwkJI2FkZHJlc3MtY2VsbHMgPSA8MT47CisJCSNzaXplLWNlbGxzID0gPDA+OworCisJ
CWFueDYzNDVfaW46IHBvcnRAMCB7CisJCQkjYWRkcmVzcy1jZWxscyA9IDwxPjsKKwkJCSNzaXpl
LWNlbGxzID0gPDA+OworCQkJcmVnID0gPDA+OworCQkJYW54NjM0NV9pbl90Y29uMDogZW5kcG9p
bnRAMCB7CisJCQkJcmVnID0gPDA+OworCQkJCXJlbW90ZS1lbmRwb2ludCA9IDwmdGNvbjBfb3V0
X2FueDYzNDU+OworCQkJfTsKKwkJfTsKKworCQlhbng2MzQ1X291dDogcG9ydEAxIHsKKwkJCSNh
ZGRyZXNzLWNlbGxzID0gPDE+OworCQkJI3NpemUtY2VsbHMgPSA8MD47CisJCQlyZWcgPSA8MT47
CisKKwkJCWFueDYzNDVfb3V0X3BhbmVsOiBlbmRwb2ludEAwIHsKKwkJCQlyZWcgPSA8MD47CisJ
CQkJcmVtb3RlLWVuZHBvaW50ID0gPCZwYW5lbF9pbl9lZHA+OworCQkJfTsKKwkJfTsKKwl9Owor
fTsKLS0gCjIuMTYuNAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRl
dmVs
