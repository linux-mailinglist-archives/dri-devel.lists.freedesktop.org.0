Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 144051E8DF
	for <lists+dri-devel@lfdr.de>; Wed, 15 May 2019 09:22:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D27189568;
	Wed, 15 May 2019 07:21:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from newverein.lst.de (verein.lst.de [213.95.11.211])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A265892AC
 for <dri-devel@lists.freedesktop.org>; Tue, 14 May 2019 16:11:17 +0000 (UTC)
Received: by newverein.lst.de (Postfix, from userid 2005)
 id CD70468BFE; Tue, 14 May 2019 18:02:30 +0200 (CEST)
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
Subject: [PATCH 2/4] dt-bindings: Add ANX6345 DP/eDP transmitter binding
References: <20190514155911.6C0AC68B05@newverein.lst.de>
Message-Id: <20190514160230.CD70468BFE@newverein.lst.de>
Date: Tue, 14 May 2019 18:02:30 +0200 (CEST)
X-Mailman-Approved-At: Wed, 15 May 2019 07:21:53 +0000
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
QHN1c2UuZGU+Ci0tLQoKb3JpZ2luYWxseTogcGF0Y2h3b3JrLmtlcm5lbC5vcmcvcGF0Y2gvMTA4
MTQxNzcKCkFsbCBJIGRpZCBpcyBjaGFuZ2UgdGhlIHJlc2V0IHBvbGFyaXR5LCB3aGljaCBpcyBl
dmlkZW50bHkgYWN0aXZlIGxvdzsKYWNjb3JkaW5nIHRvIHRoZSAodGVyc2UpIGRhdGFzaGVldC4g
SXQgbWF0Y2hlcyB0aGUgcG9sYXJpdHkgaW4gdGhlIGxhc3QKcGF0Y2guCgotLS0KIC4uLi9iaW5k
aW5ncy9kaXNwbGF5L2JyaWRnZS9hbng2MzQ1LnR4dCAgICAgICB8IDU2ICsrKysrKysrKysrKysr
KysrKysKIDEgZmlsZSBjaGFuZ2VkLCA1NiBpbnNlcnRpb25zKCspCiBjcmVhdGUgbW9kZSAxMDA2
NDQgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvYnJpZGdlL2FueDYz
NDUudHh0CgpkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rp
c3BsYXkvYnJpZGdlL2FueDYzNDUudHh0IGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRp
bmdzL2Rpc3BsYXkvYnJpZGdlL2FueDYzNDUudHh0Cm5ldyBmaWxlIG1vZGUgMTAwNjQ0CmluZGV4
IDAwMDAwMDAwMDAwMC4uZTc5YTExMzQ4ZDExCi0tLSAvZGV2L251bGwKKysrIGIvRG9jdW1lbnRh
dGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvYnJpZGdlL2FueDYzNDUudHh0CkBAIC0w
LDAgKzEsNTYgQEAKK0FuYWxvZ2l4IEFOWDYzNDUgZURQIFRyYW5zbWl0dGVyCistLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLQorCitUaGUgQU5YNjM0NSBpcyBhbiB1bHRyYS1sb3cgcG93
ZXIgRnVsbC1IRCBlRFAgdHJhbnNtaXR0ZXIgZGVzaWduZWQgZm9yCitwb3J0YWJsZSBkZXZpY2Vz
LgorCitSZXF1aXJlZCBwcm9wZXJ0aWVzOgorCisgLSBjb21wYXRpYmxlCQk6ICJhbmFsb2dpeCxh
bng2MzQ1IgorIC0gcmVnCQkJOiBJMkMgYWRkcmVzcyBvZiB0aGUgZGV2aWNlCisgLSByZXNldC1n
cGlvcwkJOiBXaGljaCBHUElPIHRvIHVzZSBmb3IgcmVzZXQKKworT3B0aW9uYWwgcHJvcGVydGll
czoKKworIC0gZHZkZDEyLXN1cHBseQk6IFJlZ3VsYXRvciBmb3IgMS4yViBkaWdpdGFsIGNvcmUg
cG93ZXIuCisgLSBkdmRkMjUtc3VwcGx5CTogUmVndWxhdG9yIGZvciAyLjVWIGRpZ2l0YWwgY29y
ZSBwb3dlci4KKyAtIFZpZGVvIHBvcnRzIGZvciBSR0IgaW5wdXQgYW5kIGVEUCBvdXRwdXQgdXNp
bmcgdGhlIERUIGJpbmRpbmdzCisgICBkZWZpbmVkIGluIFsxXQorCitbMV06IERvY3VtZW50YXRp
b24vZGV2aWNldHJlZS9iaW5kaW5ncy9tZWRpYS92aWRlby1pbnRlcmZhY2VzLnR4dAorCitFeGFt
cGxlOgorCithbng2MzQ1OiBhbng2MzQ1QDM4IHsKKwljb21wYXRpYmxlID0gImFuYWxvZ2l4LGFu
eDYzNDUiOworCXJlZyA9IDwweDM4PjsKKwlyZXNldC1ncGlvcyA9IDwmcGlvIDMgMjQgR1BJT19B
Q1RJVkVfTE9XPjsgLyogUEQyNCAqLworCWR2ZGQyNS1zdXBwbHkgPSA8JnJlZ19kbGRvMj47CisJ
ZHZkZDEyLXN1cHBseSA9IDwmcmVnX2ZsZG8xPjsKKworCXBvcnRzIHsKKwkJI2FkZHJlc3MtY2Vs
bHMgPSA8MT47CisJCSNzaXplLWNlbGxzID0gPDA+OworCisJCWFueDYzNDVfaW46IHBvcnRAMCB7
CisJCQkjYWRkcmVzcy1jZWxscyA9IDwxPjsKKwkJCSNzaXplLWNlbGxzID0gPDA+OworCQkJcmVn
ID0gPDA+OworCQkJYW54NjM0NV9pbl90Y29uMDogZW5kcG9pbnRAMCB7CisJCQkJcmVnID0gPDA+
OworCQkJCXJlbW90ZS1lbmRwb2ludCA9IDwmdGNvbjBfb3V0X2FueDYzNDU+OworCQkJfTsKKwkJ
fTsKKworCQlhbng2MzQ1X291dDogcG9ydEAxIHsKKwkJCSNhZGRyZXNzLWNlbGxzID0gPDE+Owor
CQkJI3NpemUtY2VsbHMgPSA8MD47CisJCQlyZWcgPSA8MT47CisKKwkJCWFueDYzNDVfb3V0X3Bh
bmVsOiBlbmRwb2ludEAwIHsKKwkJCQlyZWcgPSA8MD47CisJCQkJcmVtb3RlLWVuZHBvaW50ID0g
PCZwYW5lbF9pbl9lZHA+OworCQkJfTsKKwkJfTsKKwl9OworfTsKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmkt
ZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
L21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
