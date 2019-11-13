Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A11BEFC125
	for <lists+dri-devel@lfdr.de>; Thu, 14 Nov 2019 09:08:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 320D56E2DD;
	Thu, 14 Nov 2019 08:07:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA46A6ECBC
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Nov 2019 10:04:15 +0000 (UTC)
X-Originating-IP: 93.34.114.233
Received: from uno.lan (93-34-114-233.ip49.fastwebnet.it [93.34.114.233])
 (Authenticated sender: jacopo@jmondi.org)
 by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id 0F130C0015;
 Wed, 13 Nov 2019 10:04:11 +0000 (UTC)
From: Jacopo Mondi <jacopo+renesas@jmondi.org>
To: laurent.pinchart@ideasonboard.com, kieran.bingham+renesas@ideasonboard.com,
 geert@linux-m68k.org, horms@verge.net.au, uli+renesas@fpond.eu
Subject: [PATCH v7 1/7] dt-bindings: display: renesas,
 cmm: Add R-Car CMM documentation
Date: Wed, 13 Nov 2019 11:05:50 +0100
Message-Id: <20191113100556.15616-2-jacopo+renesas@jmondi.org>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191113100556.15616-1-jacopo+renesas@jmondi.org>
References: <20191113100556.15616-1-jacopo+renesas@jmondi.org>
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 14 Nov 2019 08:07:50 +0000
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
Cc: airlied@linux.ie, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
 Jacopo Mondi <jacopo+renesas@jmondi.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QWRkIGRldmljZSB0cmVlIGJpbmRpbmdzIGRvY3VtZW50YXRpb24gZm9yIHRoZSBSZW5lc2FzIFIt
Q2FyIERpc3BsYXkKVW5pdCBDb2xvciBNYW5hZ2VtZW50IE1vZHVsZS4KCkNNTSBpcyB0aGUgaW1h
Z2UgZW5oYW5jZW1lbnQgbW9kdWxlIGF2YWlsYWJsZSBvbiBlYWNoIFItQ2FyIERVIHZpZGVvCmNo
YW5uZWwgb24gUi1DYXIgR2VuMiBhbmQgR2VuMyBTb0NzIChWM0ggYW5kIFYzTSBleGNsdWRlZCku
CgpSZXZpZXdlZC1ieTogUm9iIEhlcnJpbmcgPHJvYmhAa2VybmVsLm9yZz4KUmV2aWV3ZWQtYnk6
IEtpZXJhbiBCaW5naGFtIDxraWVyYW4uYmluZ2hhbStyZW5lc2FzQGlkZWFzb25ib2FyZC5jb20+
ClJldmlld2VkLWJ5OiBMYXVyZW50IFBpbmNoYXJ0IDxsYXVyZW50LnBpbmNoYXJ0QGlkZWFzb25i
b2FyZC5jb20+ClNpZ25lZC1vZmYtYnk6IEphY29wbyBNb25kaSA8amFjb3BvK3JlbmVzYXNAam1v
bmRpLm9yZz4KLS0tCiAuLi4vYmluZGluZ3MvZGlzcGxheS9yZW5lc2FzLGNtbS55YW1sICAgICAg
ICAgfCA2NyArKysrKysrKysrKysrKysrKysrCiAxIGZpbGUgY2hhbmdlZCwgNjcgaW5zZXJ0aW9u
cygrKQogY3JlYXRlIG1vZGUgMTAwNjQ0IERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5n
cy9kaXNwbGF5L3JlbmVzYXMsY21tLnlhbWwKCmRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2Rl
dmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9yZW5lc2FzLGNtbS55YW1sIGIvRG9jdW1lbnRhdGlv
bi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvcmVuZXNhcyxjbW0ueWFtbApuZXcgZmlsZSBt
b2RlIDEwMDY0NAppbmRleCAwMDAwMDAwMDAwMDAuLmE1NzAzN2I5ZTliYQotLS0gL2Rldi9udWxs
CisrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L3JlbmVzYXMs
Y21tLnlhbWwKQEAgLTAsMCArMSw2NyBAQAorIyBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogR1BM
LTIuMC1vbmx5CislWUFNTCAxLjIKKy0tLQorJGlkOiBodHRwOi8vZGV2aWNldHJlZS5vcmcvc2No
ZW1hcy9kaXNwbGF5L3JlbmVzYXMsY21tLnlhbWwjCiskc2NoZW1hOiBodHRwOi8vZGV2aWNldHJl
ZS5vcmcvbWV0YS1zY2hlbWFzL2NvcmUueWFtbCMKKwordGl0bGU6IFJlbmVzYXMgUi1DYXIgQ29s
b3IgTWFuYWdlbWVudCBNb2R1bGUgKENNTSkKKworbWFpbnRhaW5lcnM6CisgIC0gTGF1cmVudCBQ
aW5jaGFydCA8bGF1cmVudC5waW5jaGFydEBpZGVhc29uYm9hcmQuY29tPgorICAtIEtpZXJhbiBC
aW5naGFtIDxraWVyYW4uYmluZ2hhbStyZW5lc2FzQGlkZWFzb25ib2FyZC5jb20+CisgIC0gSmFj
b3BvIE1vbmRpIDxqYWNvcG8rcmVuZXNhc0BqbW9uZGkub3JnPgorCitkZXNjcmlwdGlvbjogfCsK
KyAgUmVuZXNhcyBSLUNhciBjb2xvciBtYW5hZ2VtZW50IG1vZHVsZSBjb25uZWN0ZWQgdG8gUi1D
YXIgRFUgdmlkZW8gY2hhbm5lbHMuCisgIEl0IHByb3ZpZGVzIGltYWdlIGVuaGFuY2VtZW50IGZ1
bmN0aW9ucyBzdWNoIGFzIDEtRCBsb29rLXVwIHRhYmxlcyAoTFVUKSwKKyAgMy1EIGxvb2stdXAg
dGFibGVzIChDTFUpLCAxRC1oaXN0b2dyYW0gZ2VuZXJhdGlvbiAoSEdPKSwgYW5kIGNvbG9yCisg
IHNwYWNlIGNvbnZlcnNpb24gKENTQykuCisKK3Byb3BlcnRpZXM6CisgIGNvbXBhdGlibGU6Cisg
ICAgb25lT2Y6CisgICAgICAtIGl0ZW1zOgorICAgICAgICAtIGVudW06CisgICAgICAgICAgLSBy
ZW5lc2FzLHI4YTc3OTUtY21tCisgICAgICAgICAgLSByZW5lc2FzLHI4YTc3OTYtY21tCisgICAg
ICAgICAgLSByZW5lc2FzLHI4YTc3OTY1LWNtbQorICAgICAgICAgIC0gcmVuZXNhcyxyOGE3Nzk5
MC1jbW0KKyAgICAgICAgICAtIHJlbmVzYXMscjhhNzc5OTUtY21tCisgICAgICAgIC0gY29uc3Q6
IHJlbmVzYXMscmNhci1nZW4zLWNtbQorICAgICAgLSBpdGVtczoKKyAgICAgICAgLSBjb25zdDog
cmVuZXNhcyxyY2FyLWdlbjItY21tCisKKyAgcmVnOgorICAgIG1heEl0ZW1zOiAxCisKKyAgY2xv
Y2tzOgorICAgIG1heEl0ZW1zOiAxCisKKyAgcmVzZXRzOgorICAgIG1heEl0ZW1zOiAxCisKKyAg
cG93ZXItZG9tYWluczoKKyAgICBtYXhJdGVtczogMQorCityZXF1aXJlZDoKKyAgLSBjb21wYXRp
YmxlCisgIC0gcmVnCisgIC0gY2xvY2tzCisgIC0gcmVzZXRzCisgIC0gcG93ZXItZG9tYWlucwor
CithZGRpdGlvbmFsUHJvcGVydGllczogZmFsc2UKKworZXhhbXBsZXM6CisgIC0gfAorICAgICNp
bmNsdWRlIDxkdC1iaW5kaW5ncy9jbG9jay9yOGE3Nzk2LWNwZy1tc3NyLmg+CisgICAgI2luY2x1
ZGUgPGR0LWJpbmRpbmdzL3Bvd2VyL3I4YTc3OTYtc3lzYy5oPgorCisgICAgY21tMDogY21tQGZl
YTQwMDAwIHsKKyAgICAgICAgIGNvbXBhdGlibGUgPSAicmVuZXNhcyxyOGE3Nzk2LWNtbSIsCisg
ICAgICAgICAgICAgICAgICAgICAgInJlbmVzYXMscmNhci1nZW4zLWNtbSI7CisgICAgICAgICBy
ZWcgPSA8MCAweGZlYTQwMDAwIDAgMHgxMDAwPjsKKyAgICAgICAgIHBvd2VyLWRvbWFpbnMgPSA8
JnN5c2MgUjhBNzc5Nl9QRF9BTFdBWVNfT04+OworICAgICAgICAgY2xvY2tzID0gPCZjcGcgQ1BH
X01PRCA3MTE+OworICAgICAgICAgcmVzZXRzID0gPCZjcGcgNzExPjsKKyAgICB9OwotLSAKMi4y
My4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmkt
ZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6
Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
