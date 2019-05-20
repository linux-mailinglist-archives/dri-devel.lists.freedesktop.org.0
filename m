Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D9C592660A
	for <lists+dri-devel@lfdr.de>; Wed, 22 May 2019 16:39:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5173089BC2;
	Wed, 22 May 2019 14:36:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from vps.xff.cz (vps.xff.cz [195.181.215.36])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F2D698921C
 for <dri-devel@lists.freedesktop.org>; Mon, 20 May 2019 23:50:14 +0000 (UTC)
From: megous@megous.com
To: linux-sunxi@googlegroups.com, Maxime Ripard <maxime.ripard@bootlin.com>,
 Chen-Yu Tsai <wens@csie.org>, Rob Herring <robh+dt@kernel.org>
Subject: [PATCH v5 3/6] arm64: dts: allwinner: orange-pi-3: Enable ethernet
Date: Tue, 21 May 2019 01:50:06 +0200
Message-Id: <20190520235009.16734-4-megous@megous.com>
In-Reply-To: <20190520235009.16734-1-megous@megous.com>
References: <20190520235009.16734-1-megous@megous.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 22 May 2019 14:35:24 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=megous.com; s=mail; 
 t=1558396212; bh=nngIr0xvxUzPFucWAhkm6BkX4oH0a0zOi33I9wUZi5w=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=STZwqenh+hcS4VvkiPwY2gYZcgyNBXrh82fYCw72misXCUKrGohmgP9HydVdYYVIw
 9/4If2BSLtBWH3P1/OcmVr8K1ZWEYtQ14dve4djJ14iPSc/pA+cj++EdgdofDQ3Ke4
 xvaHOm7Xtw+YdxQYO71sxrUk/PA+mBXOTnWY5jog=
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
Cc: Ondrej Jirman <megous@megous.com>, Mark Rutland <mark.rutland@arm.com>,
 Alexandre Torgue <alexandre.torgue@st.com>, devicetree@vger.kernel.org,
 David Airlie <airlied@linux.ie>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-stm32@st-md-mailman.stormreply.com, Jose Abreu <joabreu@synopsys.com>,
 linux-arm-kernel@lists.infradead.org,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 "David S. Miller" <davem@davemloft.net>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogT25kcmVqIEppcm1hbiA8bWVnb3VzQG1lZ291cy5jb20+CgpPcmFuZ2UgUGkgMyBoYXMg
dHdvIHJlZ3VsYXRvcnMgdGhhdCBwb3dlciB0aGUgUmVhbHRlayBSVEw4MjExRS4gQWNjb3JkaW5n
CnRvIHRoZSBwaHkgZGF0YXNoZWV0LCBib3RoIHJlZ3VsYXRvcnMgbmVlZCB0byBiZSBlbmFibGVk
IGF0IHRoZSBzYW1lIHRpbWUsCmJ1dCB3ZSBjYW4gb25seSBzcGVjaWZ5IGEgc2luZ2xlIHBoeS1z
dXBwbHkgaW4gdGhlIERULgoKVGhpcyBjYW4gYmUgYWNoaWV2ZWQgYnkgbWFraW5nIG9uZSByZWd1
bGF0b3IgZGVwZWRuaW5nIG9uIHRoZSBvdGhlciB2aWEKdmluLXN1cHBseS4gV2hpbGUgaXQncyBu
b3QgYSB0ZWNobmljYWxseSBjb3JyZWN0IGRlc2NyaXB0aW9uIG9mIHRoZQpoYXJkd2FyZSwgaXQg
YWNoaWV2ZXMgdGhlIHB1cnBvc2UuCgpBbGwgdmFsdWVzIG9mIFJYL1RYIGRlbGF5IHdlcmUgdGVz
dGVkIGV4aGF1c3RpdmVseSBhbmQgYSBtaWRkbGUgb25lIG9mIHRoZQp3b3JraW5nIHZhbHVlcyB3
YXMgY2hvc2VuLgoKU2lnbmVkLW9mZi1ieTogT25kcmVqIEppcm1hbiA8bWVnb3VzQG1lZ291cy5j
b20+Ci0tLQogLi4uL2R0cy9hbGx3aW5uZXIvc3VuNTBpLWg2LW9yYW5nZXBpLTMuZHRzICAgIHwg
NDQgKysrKysrKysrKysrKysrKysrKwogMSBmaWxlIGNoYW5nZWQsIDQ0IGluc2VydGlvbnMoKykK
CmRpZmYgLS1naXQgYS9hcmNoL2FybTY0L2Jvb3QvZHRzL2FsbHdpbm5lci9zdW41MGktaDYtb3Jh
bmdlcGktMy5kdHMgYi9hcmNoL2FybTY0L2Jvb3QvZHRzL2FsbHdpbm5lci9zdW41MGktaDYtb3Jh
bmdlcGktMy5kdHMKaW5kZXggMTdkNDk2OTkwMTA4Li4yYzY4MDdiNzRmZjYgMTAwNjQ0Ci0tLSBh
L2FyY2gvYXJtNjQvYm9vdC9kdHMvYWxsd2lubmVyL3N1bjUwaS1oNi1vcmFuZ2VwaS0zLmR0cwor
KysgYi9hcmNoL2FybTY0L2Jvb3QvZHRzL2FsbHdpbm5lci9zdW41MGktaDYtb3JhbmdlcGktMy5k
dHMKQEAgLTE1LDYgKzE1LDcgQEAKIAogCWFsaWFzZXMgewogCQlzZXJpYWwwID0gJnVhcnQwOwor
CQlldGhlcm5ldDAgPSAmZW1hYzsKIAl9OwogCiAJY2hvc2VuIHsKQEAgLTQ0LDYgKzQ1LDI3IEBA
CiAJCXJlZ3VsYXRvci1tYXgtbWljcm92b2x0ID0gPDUwMDAwMDA+OwogCQlyZWd1bGF0b3ItYWx3
YXlzLW9uOwogCX07CisKKwkvKgorCSAqIFRoZSBib2FyZCB1c2VzIDIuNVYgUkdNSUkgc2lnbmFs
bGluZy4gUG93ZXIgc2VxdWVuY2UgdG8gZW5hYmxlCisJICogdGhlIHBoeSBpcyB0byBlbmFibGUg
R01BQy0yVjUgYW5kIEdNQUMtM1YgKGFsZG8yKSBwb3dlciByYWlscworCSAqIGF0IHRoZSBzYW1l
IHRpbWUgYW5kIHRvIHdhaXQgMTAwbXMuCisJICovCisJcmVnX2dtYWNfMnY1OiBnbWFjLTJ2NSB7
CisJCWNvbXBhdGlibGUgPSAicmVndWxhdG9yLWZpeGVkIjsKKwkJcmVndWxhdG9yLW5hbWUgPSAi
Z21hYy0ydjUiOworCQlyZWd1bGF0b3ItbWluLW1pY3Jvdm9sdCA9IDwyNTAwMDAwPjsKKwkJcmVn
dWxhdG9yLW1heC1taWNyb3ZvbHQgPSA8MjUwMDAwMD47CisJCXN0YXJ0dXAtZGVsYXktdXMgPSA8
MTAwMDAwPjsKKwkJZW5hYmxlLWFjdGl2ZS1oaWdoOworCQlncGlvID0gPCZwaW8gMyA2IEdQSU9f
QUNUSVZFX0hJR0g+OyAvKiBQRDYgKi8KKworCQkvKiBUaGUgcmVhbCBwYXJlbnQgb2YgZ21hYy0y
djUgaXMgcmVnX3ZjYzV2LCBidXQgd2UgbmVlZCB0bworCQkgKiBlbmFibGUgdHdvIHJlZ3VsYXRv
cnMgdG8gcG93ZXIgdGhlIHBoeS4gVGhpcyBpcyBvbmUgd2F5CisJCSAqIHRvIGFjaGlldmUgdGhh
dC4KKwkJICovCisJCXZpbi1zdXBwbHkgPSA8JnJlZ19hbGRvMj47IC8qIEdNQUMtM1YgKi8KKwl9
OwogfTsKIAogJmNwdTAgewpAQCAtNTgsNiArODAsMjggQEAKIAlzdGF0dXMgPSAib2theSI7CiB9
OwogCismZW1hYyB7CisJcGluY3RybC1uYW1lcyA9ICJkZWZhdWx0IjsKKwlwaW5jdHJsLTAgPSA8
JmV4dF9yZ21paV9waW5zPjsKKwlwaHktbW9kZSA9ICJyZ21paSI7CisJcGh5LWhhbmRsZSA9IDwm
ZXh0X3JnbWlpX3BoeT47CisJcGh5LXN1cHBseSA9IDwmcmVnX2dtYWNfMnY1PjsKKwlhbGx3aW5u
ZXIscngtZGVsYXktcHMgPSA8MTUwMD47CisJYWxsd2lubmVyLHR4LWRlbGF5LXBzID0gPDcwMD47
CisJc3RhdHVzID0gIm9rYXkiOworfTsKKworJm1kaW8geworCWV4dF9yZ21paV9waHk6IGV0aGVy
bmV0LXBoeUAxIHsKKwkJY29tcGF0aWJsZSA9ICJldGhlcm5ldC1waHktaWVlZTgwMi4zLWMyMiI7
CisJCXJlZyA9IDwxPjsKKworCQlyZXNldC1ncGlvcyA9IDwmcGlvIDMgMTQgR1BJT19BQ1RJVkVf
TE9XPjsgLyogUEQxNCAqLworCQlyZXNldC1hc3NlcnQtdXMgPSA8MTUwMDA+OworCQlyZXNldC1k
ZWFzc2VydC11cyA9IDw0MDAwMD47CisJfTsKK307CisKICZtbWMwIHsKIAl2bW1jLXN1cHBseSA9
IDwmcmVnX2NsZG8xPjsKIAljZC1ncGlvcyA9IDwmcGlvIDUgNiBHUElPX0FDVElWRV9MT1c+OyAv
KiBQRjYgKi8KLS0gCjIuMjEuMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8v
ZHJpLWRldmVs
