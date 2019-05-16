Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A739214E9
	for <lists+dri-devel@lfdr.de>; Fri, 17 May 2019 09:55:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A007898CC;
	Fri, 17 May 2019 07:54:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from newverein.lst.de (verein.lst.de [213.95.11.211])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC53E8977A
 for <dri-devel@lists.freedesktop.org>; Thu, 16 May 2019 16:01:21 +0000 (UTC)
Received: by newverein.lst.de (Postfix, from userid 2005)
 id 36B8468BFE; Thu, 16 May 2019 17:51:35 +0200 (CEST)
From: Torsten Duwe <duwe@lst.de>
To: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Maxime Ripard <maxime.ripard@bootlin.com>, Chen-Yu Tsai <wens@csie.org>,
 Archit Taneja <architt@codeaurora.org>,
 Andrzej Hajda <a.hajda@samsung.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Icenowy Zheng <icenowy@aosc.io>, Sean Paul <seanpaul@chromium.org>,
 Vasily Khoruzhick <anarsoul@gmail.com>, Harald Geyer <harald@ccbib.org>
Subject: [PATCH v2 2/4] dt-bindings: Add ANX6345 DP/eDP transmitter binding
References: <20190516154943.239E668B05@newverein.lst.de>
Message-Id: <20190516155135.36B8468BFE@newverein.lst.de>
Date: Thu, 16 May 2019 17:51:35 +0200 (CEST)
X-Mailman-Approved-At: Fri, 17 May 2019 07:54:52 +0000
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

RnJvbTogSWNlbm93eSBaaGVuZyA8aWNlbm93eUBhb3NjLmlvPgoKVGhlIEFOWDYzNDUgaXMgYW4g
dWx0cmEtbG93IHBvd2VyIERpc3BsYXlQb3J0L2VEUCB0cmFuc21pdHRlciBkZXNpZ25lZApmb3Ig
cG9ydGFibGUgZGV2aWNlcy4KCkFkZCBhIGJpbmRpbmcgZG9jdW1lbnQgZm9yIGl0LgoKU2lnbmVk
LW9mZi1ieTogSWNlbm93eSBaaGVuZyA8aWNlbm93eUBhb3NjLmlvPgpTaWduZWQtb2ZmLWJ5OiBW
YXNpbHkgS2hvcnV6aGljayA8YW5hcnNvdWxAZ21haWwuY29tPgpSZXZpZXdlZC1ieTogUm9iIEhl
cnJpbmcgPHJvYmhAa2VybmVsLm9yZz4KU2lnbmVkLW9mZi1ieTogVG9yc3RlbiBEdXdlIDxkdXdl
QHN1c2UuZGU+Ci0tLQogLi4uL2JpbmRpbmdzL2Rpc3BsYXkvYnJpZGdlL2FueDYzNDUudHh0ICAg
ICAgIHwgNTYgKysrKysrKysrKysrKysrKysrKwogMSBmaWxlIGNoYW5nZWQsIDU2IGluc2VydGlv
bnMoKykKIGNyZWF0ZSBtb2RlIDEwMDY0NCBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGlu
Z3MvZGlzcGxheS9icmlkZ2UvYW54NjM0NS50eHQKCmRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9u
L2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9icmlkZ2UvYW54NjM0NS50eHQgYi9Eb2N1bWVu
dGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9icmlkZ2UvYW54NjM0NS50eHQKbmV3
IGZpbGUgbW9kZSAxMDA2NDQKaW5kZXggMDAwMDAwMDAwMDAwLi5lNzlhMTEzNDhkMTEKLS0tIC9k
ZXYvbnVsbAorKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9i
cmlkZ2UvYW54NjM0NS50eHQKQEAgLTAsMCArMSw1NiBAQAorQW5hbG9naXggQU5YNjM0NSBlRFAg
VHJhbnNtaXR0ZXIKKy0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCisKK1RoZSBBTlg2
MzQ1IGlzIGFuIHVsdHJhLWxvdyBwb3dlciBGdWxsLUhEIGVEUCB0cmFuc21pdHRlciBkZXNpZ25l
ZCBmb3IKK3BvcnRhYmxlIGRldmljZXMuCisKK1JlcXVpcmVkIHByb3BlcnRpZXM6CisKKyAtIGNv
bXBhdGlibGUJCTogImFuYWxvZ2l4LGFueDYzNDUiCisgLSByZWcJCQk6IEkyQyBhZGRyZXNzIG9m
IHRoZSBkZXZpY2UKKyAtIHJlc2V0LWdwaW9zCQk6IFdoaWNoIEdQSU8gdG8gdXNlIGZvciByZXNl
dAorIC0gZHZkZDEyLXN1cHBseQk6IFJlZ3VsYXRvciBmb3IgMS4yViBkaWdpdGFsIGNvcmUgcG93
ZXIuCisgLSBkdmRkMjUtc3VwcGx5CTogUmVndWxhdG9yIGZvciAyLjVWIGRpZ2l0YWwgY29yZSBw
b3dlci4KKworT3B0aW9uYWwgcHJvcGVydGllczoKKworIC0gVmlkZW8gcG9ydHMgZm9yIFJHQiBp
bnB1dCBhbmQgZURQIG91dHB1dCB1c2luZyB0aGUgRFQgYmluZGluZ3MKKyAgIGRlZmluZWQgaW4g
WzFdCisKK1sxXTogRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL21lZGlhL3ZpZGVv
LWludGVyZmFjZXMudHh0CisKK0V4YW1wbGU6CisKK2FueDYzNDU6IGFueDYzNDVAMzggeworCWNv
bXBhdGlibGUgPSAiYW5hbG9naXgsYW54NjM0NSI7CisJcmVnID0gPDB4Mzg+OworCXJlc2V0LWdw
aW9zID0gPCZwaW8gMyAyNCBHUElPX0FDVElWRV9MT1c+OyAvKiBQRDI0ICovCisJZHZkZDI1LXN1
cHBseSA9IDwmcmVnX2RsZG8yPjsKKwlkdmRkMTItc3VwcGx5ID0gPCZyZWdfZmxkbzE+OworCisJ
cG9ydHMgeworCQkjYWRkcmVzcy1jZWxscyA9IDwxPjsKKwkJI3NpemUtY2VsbHMgPSA8MD47CisK
KwkJYW54NjM0NV9pbjogcG9ydEAwIHsKKwkJCSNhZGRyZXNzLWNlbGxzID0gPDE+OworCQkJI3Np
emUtY2VsbHMgPSA8MD47CisJCQlyZWcgPSA8MD47CisJCQlhbng2MzQ1X2luX3Rjb24wOiBlbmRw
b2ludEAwIHsKKwkJCQlyZWcgPSA8MD47CisJCQkJcmVtb3RlLWVuZHBvaW50ID0gPCZ0Y29uMF9v
dXRfYW54NjM0NT47CisJCQl9OworCQl9OworCisJCWFueDYzNDVfb3V0OiBwb3J0QDEgeworCQkJ
I2FkZHJlc3MtY2VsbHMgPSA8MT47CisJCQkjc2l6ZS1jZWxscyA9IDwwPjsKKwkJCXJlZyA9IDwx
PjsKKworCQkJYW54NjM0NV9vdXRfcGFuZWw6IGVuZHBvaW50QDAgeworCQkJCXJlZyA9IDwwPjsK
KwkJCQlyZW1vdGUtZW5kcG9pbnQgPSA8JnBhbmVsX2luX2VkcD47CisJCQl9OworCQl9OworCX07
Cit9OwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmkt
ZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6
Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
