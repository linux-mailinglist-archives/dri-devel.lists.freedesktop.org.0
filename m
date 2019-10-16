Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 48E72D8D63
	for <lists+dri-devel@lfdr.de>; Wed, 16 Oct 2019 12:11:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7DE2D6E919;
	Wed, 16 Oct 2019 10:11:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net [217.70.178.230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E2AF6E904
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Oct 2019 08:54:58 +0000 (UTC)
Received: from uno.localdomain (2-224-242-101.ip172.fastwebnet.it
 [2.224.242.101]) (Authenticated sender: jacopo@jmondi.org)
 by relay10.mail.gandi.net (Postfix) with ESMTPSA id 553CC24000C;
 Wed, 16 Oct 2019 08:54:53 +0000 (UTC)
From: Jacopo Mondi <jacopo+renesas@jmondi.org>
To: laurent.pinchart@ideasonboard.com, kieran.bingham+renesas@ideasonboard.com,
 geert@linux-m68k.org, horms@verge.net.au, uli+renesas@fpond.eu
Subject: [PATCH v6 1/8] dt-bindings: display: renesas,
 cmm: Add R-Car CMM documentation
Date: Wed, 16 Oct 2019 10:55:41 +0200
Message-Id: <20191016085548.105703-2-jacopo+renesas@jmondi.org>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191016085548.105703-1-jacopo+renesas@jmondi.org>
References: <20191016085548.105703-1-jacopo+renesas@jmondi.org>
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 16 Oct 2019 10:11:37 +0000
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
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, airlied@linux.ie,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-renesas-soc@vger.kernel.org, robh+dt@kernel.org,
 Jacopo Mondi <jacopo+renesas@jmondi.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QWRkIGRldmljZSB0cmVlIGJpbmRpbmdzIGRvY3VtZW50YXRpb24gZm9yIHRoZSBSZW5lc2FzIFIt
Q2FyIERpc3BsYXkKVW5pdCBDb2xvciBNYW5hZ2VtZW50IE1vZHVsZS4KCkNNTSBpcyB0aGUgaW1h
Z2UgZW5oYW5jZW1lbnQgbW9kdWxlIGF2YWlsYWJsZSBvbiBlYWNoIFItQ2FyIERVIHZpZGVvCmNo
YW5uZWwgb24gUi1DYXIgR2VuMiBhbmQgR2VuMyBTb0NzIChWM0ggYW5kIFYzTSBleGNsdWRlZCku
CgpSZXZpZXdlZC1ieTogS2llcmFuIEJpbmdoYW0gPGtpZXJhbi5iaW5naGFtK3JlbmVzYXNAaWRl
YXNvbmJvYXJkLmNvbT4KUmV2aWV3ZWQtYnk6IExhdXJlbnQgUGluY2hhcnQgPGxhdXJlbnQucGlu
Y2hhcnRAaWRlYXNvbmJvYXJkLmNvbT4KU2lnbmVkLW9mZi1ieTogSmFjb3BvIE1vbmRpIDxqYWNv
cG8rcmVuZXNhc0BqbW9uZGkub3JnPgotLS0KIC4uLi9iaW5kaW5ncy9kaXNwbGF5L3JlbmVzYXMs
Y21tLnlhbWwgICAgICAgICB8IDY3ICsrKysrKysrKysrKysrKysrKysKIDEgZmlsZSBjaGFuZ2Vk
LCA2NyBpbnNlcnRpb25zKCspCiBjcmVhdGUgbW9kZSAxMDA2NDQgRG9jdW1lbnRhdGlvbi9kZXZp
Y2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvcmVuZXNhcyxjbW0ueWFtbAoKZGlmZiAtLWdpdCBhL0Rv
Y3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L3JlbmVzYXMsY21tLnlhbWwg
Yi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9yZW5lc2FzLGNtbS55
YW1sCm5ldyBmaWxlIG1vZGUgMTAwNjQ0CmluZGV4IDAwMDAwMDAwMDAwMC4uYTU3MDM3YjllOWJh
Ci0tLSAvZGV2L251bGwKKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rp
c3BsYXkvcmVuZXNhcyxjbW0ueWFtbApAQCAtMCwwICsxLDY3IEBACisjIFNQRFgtTGljZW5zZS1J
ZGVudGlmaWVyOiBHUEwtMi4wLW9ubHkKKyVZQU1MIDEuMgorLS0tCiskaWQ6IGh0dHA6Ly9kZXZp
Y2V0cmVlLm9yZy9zY2hlbWFzL2Rpc3BsYXkvcmVuZXNhcyxjbW0ueWFtbCMKKyRzY2hlbWE6IGh0
dHA6Ly9kZXZpY2V0cmVlLm9yZy9tZXRhLXNjaGVtYXMvY29yZS55YW1sIworCit0aXRsZTogUmVu
ZXNhcyBSLUNhciBDb2xvciBNYW5hZ2VtZW50IE1vZHVsZSAoQ01NKQorCittYWludGFpbmVyczoK
KyAgLSBMYXVyZW50IFBpbmNoYXJ0IDxsYXVyZW50LnBpbmNoYXJ0QGlkZWFzb25ib2FyZC5jb20+
CisgIC0gS2llcmFuIEJpbmdoYW0gPGtpZXJhbi5iaW5naGFtK3JlbmVzYXNAaWRlYXNvbmJvYXJk
LmNvbT4KKyAgLSBKYWNvcG8gTW9uZGkgPGphY29wbytyZW5lc2FzQGptb25kaS5vcmc+CisKK2Rl
c2NyaXB0aW9uOiB8KworICBSZW5lc2FzIFItQ2FyIGNvbG9yIG1hbmFnZW1lbnQgbW9kdWxlIGNv
bm5lY3RlZCB0byBSLUNhciBEVSB2aWRlbyBjaGFubmVscy4KKyAgSXQgcHJvdmlkZXMgaW1hZ2Ug
ZW5oYW5jZW1lbnQgZnVuY3Rpb25zIHN1Y2ggYXMgMS1EIGxvb2stdXAgdGFibGVzIChMVVQpLAor
ICAzLUQgbG9vay11cCB0YWJsZXMgKENMVSksIDFELWhpc3RvZ3JhbSBnZW5lcmF0aW9uIChIR08p
LCBhbmQgY29sb3IKKyAgc3BhY2UgY29udmVyc2lvbiAoQ1NDKS4KKworcHJvcGVydGllczoKKyAg
Y29tcGF0aWJsZToKKyAgICBvbmVPZjoKKyAgICAgIC0gaXRlbXM6CisgICAgICAgIC0gZW51bToK
KyAgICAgICAgICAtIHJlbmVzYXMscjhhNzc5NS1jbW0KKyAgICAgICAgICAtIHJlbmVzYXMscjhh
Nzc5Ni1jbW0KKyAgICAgICAgICAtIHJlbmVzYXMscjhhNzc5NjUtY21tCisgICAgICAgICAgLSBy
ZW5lc2FzLHI4YTc3OTkwLWNtbQorICAgICAgICAgIC0gcmVuZXNhcyxyOGE3Nzk5NS1jbW0KKyAg
ICAgICAgLSBjb25zdDogcmVuZXNhcyxyY2FyLWdlbjMtY21tCisgICAgICAtIGl0ZW1zOgorICAg
ICAgICAtIGNvbnN0OiByZW5lc2FzLHJjYXItZ2VuMi1jbW0KKworICByZWc6CisgICAgbWF4SXRl
bXM6IDEKKworICBjbG9ja3M6CisgICAgbWF4SXRlbXM6IDEKKworICByZXNldHM6CisgICAgbWF4
SXRlbXM6IDEKKworICBwb3dlci1kb21haW5zOgorICAgIG1heEl0ZW1zOiAxCisKK3JlcXVpcmVk
OgorICAtIGNvbXBhdGlibGUKKyAgLSByZWcKKyAgLSBjbG9ja3MKKyAgLSByZXNldHMKKyAgLSBw
b3dlci1kb21haW5zCisKK2FkZGl0aW9uYWxQcm9wZXJ0aWVzOiBmYWxzZQorCitleGFtcGxlczoK
KyAgLSB8CisgICAgI2luY2x1ZGUgPGR0LWJpbmRpbmdzL2Nsb2NrL3I4YTc3OTYtY3BnLW1zc3Iu
aD4KKyAgICAjaW5jbHVkZSA8ZHQtYmluZGluZ3MvcG93ZXIvcjhhNzc5Ni1zeXNjLmg+CisKKyAg
ICBjbW0wOiBjbW1AZmVhNDAwMDAgeworICAgICAgICAgY29tcGF0aWJsZSA9ICJyZW5lc2FzLHI4
YTc3OTYtY21tIiwKKyAgICAgICAgICAgICAgICAgICAgICAicmVuZXNhcyxyY2FyLWdlbjMtY21t
IjsKKyAgICAgICAgIHJlZyA9IDwwIDB4ZmVhNDAwMDAgMCAweDEwMDA+OworICAgICAgICAgcG93
ZXItZG9tYWlucyA9IDwmc3lzYyBSOEE3Nzk2X1BEX0FMV0FZU19PTj47CisgICAgICAgICBjbG9j
a3MgPSA8JmNwZyBDUEdfTU9EIDcxMT47CisgICAgICAgICByZXNldHMgPSA8JmNwZyA3MTE+Owor
ICAgIH07Ci0tCjIuMjMuMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJp
LWRldmVs
