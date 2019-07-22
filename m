Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BD3171271
	for <lists+dri-devel@lfdr.de>; Tue, 23 Jul 2019 09:15:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9707C892EA;
	Tue, 23 Jul 2019 07:14:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A132589C9A
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Jul 2019 15:12:03 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2005)
 id 5506768B20; Mon, 22 Jul 2019 17:12:02 +0200 (CEST)
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
References: <<20190722150414.9F97668B20@verein.lst.de>>
Subject: [PATCH v3 6/7] dt-bindings: Add ANX6345 DP/eDP transmitter binding
Message-Id: <20190722151202.5506768B20@verein.lst.de>
Date: Mon, 22 Jul 2019 17:12:02 +0200 (CEST)
X-Mailman-Approved-At: Tue, 23 Jul 2019 07:14:10 +0000
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
eCAwMDAwMDAwMDAwMDAuLjBhZjA5MmQxMDFjNQotLS0gL2Rldi9udWxsCisrKyBiL0RvY3VtZW50
YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L2JyaWRnZS9hbng2MzQ1LnR4dApAQCAt
MCwwICsxLDU3IEBACitBbmFsb2dpeCBBTlg2MzQ1IGVEUCBUcmFuc21pdHRlcgorLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KKworVGhlIEFOWDYzNDUgaXMgYW4gdWx0cmEtbG93IHBv
d2VyIEZ1bGwtSEQgZURQIHRyYW5zbWl0dGVyIGRlc2lnbmVkIGZvcgorcG9ydGFibGUgZGV2aWNl
cy4KKworUmVxdWlyZWQgcHJvcGVydGllczoKKworIC0gY29tcGF0aWJsZQkJOiAiYW5hbG9naXgs
YW54NjM0NSIKKyAtIHJlZwkJCTogSTJDIGFkZHJlc3Mgb2YgdGhlIGRldmljZQorIC0gcmVzZXQt
Z3Bpb3MJCTogV2hpY2ggR1BJTyB0byB1c2UgZm9yIHJlc2V0IChhY3RpdmUgbG93KQorIC0gZHZk
ZDEyLXN1cHBseQk6IFJlZ3VsYXRvciBmb3IgMS4yViBkaWdpdGFsIGNvcmUgcG93ZXIuCisgLSBk
dmRkMjUtc3VwcGx5CTogUmVndWxhdG9yIGZvciAyLjVWIGRpZ2l0YWwgY29yZSBwb3dlci4KKyAt
IFZpZGVvIHBvcnQgMCBmb3IgTFZUVEwgaW5wdXQsIHVzaW5nIHRoZSBEVCBiaW5kaW5ncyBkZWZp
bmVkIGluIFsxXS4KKworT3B0aW9uYWwgcHJvcGVydGllczoKKworIC0gVmlkZW8gcG9ydCAxIGZv
ciBlRFAgb3V0cHV0IChwYW5lbCBvciBjb25uZWN0b3IpIHVzaW5nIHRoZSBEVCBiaW5kaW5ncwor
ICAgZGVmaW5lZCBpbiBbMV0uCisKK1sxXTogRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRp
bmdzL21lZGlhL3ZpZGVvLWludGVyZmFjZXMudHh0CisKK0V4YW1wbGU6CisKK2FueDYzNDU6IGFu
eDYzNDVAMzggeworCWNvbXBhdGlibGUgPSAiYW5hbG9naXgsYW54NjM0NSI7CisJcmVnID0gPDB4
Mzg+OworCXJlc2V0LWdwaW9zID0gPCZwaW8gMyAyNCBHUElPX0FDVElWRV9MT1c+OyAvKiBQRDI0
ICovCisJZHZkZDI1LXN1cHBseSA9IDwmcmVnX2RsZG8yPjsKKwlkdmRkMTItc3VwcGx5ID0gPCZy
ZWdfZmxkbzE+OworCisJcG9ydHMgeworCQkjYWRkcmVzcy1jZWxscyA9IDwxPjsKKwkJI3NpemUt
Y2VsbHMgPSA8MD47CisKKwkJYW54NjM0NV9pbjogcG9ydEAwIHsKKwkJCSNhZGRyZXNzLWNlbGxz
ID0gPDE+OworCQkJI3NpemUtY2VsbHMgPSA8MD47CisJCQlyZWcgPSA8MD47CisJCQlhbng2MzQ1
X2luX3Rjb24wOiBlbmRwb2ludEAwIHsKKwkJCQlyZWcgPSA8MD47CisJCQkJcmVtb3RlLWVuZHBv
aW50ID0gPCZ0Y29uMF9vdXRfYW54NjM0NT47CisJCQl9OworCQl9OworCisJCWFueDYzNDVfb3V0
OiBwb3J0QDEgeworCQkJI2FkZHJlc3MtY2VsbHMgPSA8MT47CisJCQkjc2l6ZS1jZWxscyA9IDww
PjsKKwkJCXJlZyA9IDwxPjsKKworCQkJYW54NjM0NV9vdXRfcGFuZWw6IGVuZHBvaW50QDAgewor
CQkJCXJlZyA9IDwwPjsKKwkJCQlyZW1vdGUtZW5kcG9pbnQgPSA8JnBhbmVsX2luX2VkcD47CisJ
CQl9OworCQl9OworCX07Cit9OwotLSAKMi4xNi40CgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBs
aXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1h
bi9saXN0aW5mby9kcmktZGV2ZWw=
