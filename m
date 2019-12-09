Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B510116F00
	for <lists+dri-devel@lfdr.de>; Mon,  9 Dec 2019 15:32:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F0396E466;
	Mon,  9 Dec 2019 14:32:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 158D26E463
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Dec 2019 14:32:33 +0000 (UTC)
Received: from ip5f5a6266.dynamic.kabel-deutschland.de ([95.90.98.102]
 helo=phil.lan)
 by gloria.sntech.de with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.89) (envelope-from <heiko@sntech.de>)
 id 1ieK5B-0000zC-83; Mon, 09 Dec 2019 15:32:17 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: a.hajda@samsung.com
Subject: [PATCH v5 6/6] drm/rockchip: dsi: add px30 support
Date: Mon,  9 Dec 2019 15:31:30 +0100
Message-Id: <20191209143130.4553-7-heiko@sntech.de>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191209143130.4553-1-heiko@sntech.de>
References: <20191209143130.4553-1-heiko@sntech.de>
MIME-Version: 1.0
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
Cc: bivvy.bi@rock-chips.com, jernej.skrabec@siol.net, xzy.xu@rock-chips.com,
 kuninori.morimoto.gx@renesas.com, jonas@kwiboo.se, sean@poorly.run,
 narmstrong@baylibre.com, philippe.cornu@st.com,
 dri-devel@lists.freedesktop.org, hjc@rock-chips.com, yannick.fertre@st.com,
 linux-rockchip@lists.infradead.org, nickey.yang@rock-chips.com,
 eddie.cai@rock-chips.com, Laurent.pinchart@ideasonboard.com,
 Heiko Stuebner <heiko.stuebner@theobroma-systems.com>, sam@ravnborg.org,
 christoph.muellner@theobroma-systems.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogSGVpa28gU3R1ZWJuZXIgPGhlaWtvLnN0dWVibmVyQHRoZW9icm9tYS1zeXN0ZW1zLmNv
bT4KCkFkZCB0aGUgY29tcGF0aWJsZSBhbmQgR1JGIGRlZmluaXRpb25zIGZvciB0aGUgUFgzMCBz
b2MuCgpjaGFuZ2VzIGluIHY1OgotIHJlYmFzZWQgb24gdG9wIG9mIDUuNS1yYzEKLSBtZXJnZWQg
d2l0aCBkc2kgdGltaW5nIGNoYW5nZSB0byBwcmV2ZW50IG9yZGVyaW5nIGNvbmZsaWN0cwoKU2ln
bmVkLW9mZi1ieTogSGVpa28gU3R1ZWJuZXIgPGhlaWtvLnN0dWVibmVyQHRoZW9icm9tYS1zeXN0
ZW1zLmNvbT4KLS0tCiAuLi4vZ3B1L2RybS9yb2NrY2hpcC9kdy1taXBpLWRzaS1yb2NrY2hpcC5j
ICAgfCAyNyArKysrKysrKysrKysrKysrKysrCiAxIGZpbGUgY2hhbmdlZCwgMjcgaW5zZXJ0aW9u
cygrKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9yb2NrY2hpcC9kdy1taXBpLWRzaS1y
b2NrY2hpcC5jIGIvZHJpdmVycy9ncHUvZHJtL3JvY2tjaGlwL2R3LW1pcGktZHNpLXJvY2tjaGlw
LmMKaW5kZXggZjE2YmQxZTliNjMzLi5mMDRiNTA2NDk3NGQgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMv
Z3B1L2RybS9yb2NrY2hpcC9kdy1taXBpLWRzaS1yb2NrY2hpcC5jCisrKyBiL2RyaXZlcnMvZ3B1
L2RybS9yb2NrY2hpcC9kdy1taXBpLWRzaS1yb2NrY2hpcC5jCkBAIC0xNDAsNiArMTQwLDEyIEBA
CiAjZGVmaW5lIERXX01JUElfTkVFRFNfUEhZX0NGR19DTEsJQklUKDApCiAjZGVmaW5lIERXX01J
UElfTkVFRFNfR1JGX0NMSwkJQklUKDEpCiAKKyNkZWZpbmUgUFgzMF9HUkZfUERfVk9fQ09OMQkJ
MHgwNDM4CisjZGVmaW5lIFBYMzBfRFNJX0ZPUkNFVFhTVE9QTU9ERQkoMHhmIDw8IDcpCisjZGVm
aW5lIFBYMzBfRFNJX0ZPUkNFUlhNT0RFCQlCSVQoNikKKyNkZWZpbmUgUFgzMF9EU0lfVFVSTkRJ
U0FCTEUJCUJJVCg1KQorI2RlZmluZSBQWDMwX0RTSV9MQ0RDX1NFTAkJQklUKDApCisKICNkZWZp
bmUgUkszMjg4X0dSRl9TT0NfQ09ONgkJMHgwMjVjCiAjZGVmaW5lIFJLMzI4OF9EU0kwX0xDRENf
U0VMCQlCSVQoNikKICNkZWZpbmUgUkszMjg4X0RTSTFfTENEQ19TRUwJCUJJVCg5KQpAQCAtMTEy
Nyw2ICsxMTMzLDI0IEBAIHN0YXRpYyBpbnQgZHdfbWlwaV9kc2lfcm9ja2NoaXBfcmVtb3ZlKHN0
cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCiAJcmV0dXJuIDA7CiB9CiAKK3N0YXRpYyBjb25z
dCBzdHJ1Y3Qgcm9ja2NoaXBfZHdfZHNpX2NoaXBfZGF0YSBweDMwX2NoaXBfZGF0YVtdID0gewor
CXsKKwkJLnJlZyA9IDB4ZmY0NTAwMDAsCisJCS5sY2RzZWxfZ3JmX3JlZyA9IFBYMzBfR1JGX1BE
X1ZPX0NPTjEsCisJCS5sY2RzZWxfYmlnID0gSElXT1JEX1VQREFURSgwLCBQWDMwX0RTSV9MQ0RD
X1NFTCksCisJCS5sY2RzZWxfbGl0ID0gSElXT1JEX1VQREFURShQWDMwX0RTSV9MQ0RDX1NFTCwK
KwkJCQkJICAgIFBYMzBfRFNJX0xDRENfU0VMKSwKKworCQkubGFuZWNmZzFfZ3JmX3JlZyA9IFBY
MzBfR1JGX1BEX1ZPX0NPTjEsCisJCS5sYW5lY2ZnMSA9IEhJV09SRF9VUERBVEUoMCwgUFgzMF9E
U0lfVFVSTkRJU0FCTEUgfAorCQkJCQkgICAgIFBYMzBfRFNJX0ZPUkNFUlhNT0RFIHwKKwkJCQkJ
ICAgICBQWDMwX0RTSV9GT1JDRVRYU1RPUE1PREUpLAorCisJCS5tYXhfZGF0YV9sYW5lcyA9IDQs
CisJfSwKKwl7IC8qIHNlbnRpbmVsICovIH0KK307CisKIHN0YXRpYyBjb25zdCBzdHJ1Y3Qgcm9j
a2NoaXBfZHdfZHNpX2NoaXBfZGF0YSByazMyODhfY2hpcF9kYXRhW10gPSB7CiAJewogCQkucmVn
ID0gMHhmZjk2MDAwMCwKQEAgLTExOTUsNiArMTIxOSw5IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3Qg
cm9ja2NoaXBfZHdfZHNpX2NoaXBfZGF0YSByazMzOTlfY2hpcF9kYXRhW10gPSB7CiAKIHN0YXRp
YyBjb25zdCBzdHJ1Y3Qgb2ZfZGV2aWNlX2lkIGR3X21pcGlfZHNpX3JvY2tjaGlwX2R0X2lkc1td
ID0gewogCXsKKwkgLmNvbXBhdGlibGUgPSAicm9ja2NoaXAscHgzMC1taXBpLWRzaSIsCisJIC5k
YXRhID0gJnB4MzBfY2hpcF9kYXRhLAorCX0sIHsKIAkgLmNvbXBhdGlibGUgPSAicm9ja2NoaXAs
cmszMjg4LW1pcGktZHNpIiwKIAkgLmRhdGEgPSAmcmszMjg4X2NoaXBfZGF0YSwKIAl9LCB7Ci0t
IAoyLjI0LjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpo
dHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
