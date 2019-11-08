Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E0C1DF41C8
	for <lists+dri-devel@lfdr.de>; Fri,  8 Nov 2019 09:13:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C8B66F882;
	Fri,  8 Nov 2019 08:12:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F1156F816
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Nov 2019 00:03:09 +0000 (UTC)
Received: from ip5f5a6266.dynamic.kabel-deutschland.de ([95.90.98.102]
 helo=phil.fritz.box)
 by gloria.sntech.de with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.89) (envelope-from <heiko.stuebner@theobroma-systems.com>)
 id 1iSrk2-00065H-PI; Fri, 08 Nov 2019 01:03:06 +0100
From: Heiko Stuebner <heiko.stuebner@theobroma-systems.com>
To: dri-devel@lists.freedesktop.org,
	a.hajda@samsung.com
Subject: [PATCH v2 5/5] drm/rockchip: dsi: add px30 support
Date: Fri,  8 Nov 2019 01:02:53 +0100
Message-Id: <20191108000253.8560-6-heiko.stuebner@theobroma-systems.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191108000253.8560-1-heiko.stuebner@theobroma-systems.com>
References: <20191108000253.8560-1-heiko.stuebner@theobroma-systems.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 08 Nov 2019 08:12:31 +0000
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
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, jernej.skrabec@siol.net,
 jonas@kwiboo.se, linux-kernel@vger.kernel.org, narmstrong@baylibre.com,
 philippe.cornu@st.com, yannick.fertre@st.com,
 linux-rockchip@lists.infradead.org, robh+dt@kernel.org,
 Laurent.pinchart@ideasonboard.com,
 Heiko Stuebner <heiko.stuebner@theobroma-systems.com>,
 linux-arm-kernel@lists.infradead.org, christoph.muellner@theobroma-systems.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QWRkIHRoZSBjb21wYXRpYmxlIGFuZCBHUkYgZGVmaW5pdGlvbnMgZm9yIHRoZSBQWDMwIHNvYy4K
ClNpZ25lZC1vZmYtYnk6IEhlaWtvIFN0dWVibmVyIDxoZWlrby5zdHVlYm5lckB0aGVvYnJvbWEt
c3lzdGVtcy5jb20+Ci0tLQogLi4uL2dwdS9kcm0vcm9ja2NoaXAvZHctbWlwaS1kc2ktcm9ja2No
aXAuYyAgIHwgMjcgKysrKysrKysrKysrKysrKysrKwogMSBmaWxlIGNoYW5nZWQsIDI3IGluc2Vy
dGlvbnMoKykKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vcm9ja2NoaXAvZHctbWlwaS1k
c2ktcm9ja2NoaXAuYyBiL2RyaXZlcnMvZ3B1L2RybS9yb2NrY2hpcC9kdy1taXBpLWRzaS1yb2Nr
Y2hpcC5jCmluZGV4IDFlNjU3OGY5MTFhMC4uMTM4NThmMzc3YTBjIDEwMDY0NAotLS0gYS9kcml2
ZXJzL2dwdS9kcm0vcm9ja2NoaXAvZHctbWlwaS1kc2ktcm9ja2NoaXAuYworKysgYi9kcml2ZXJz
L2dwdS9kcm0vcm9ja2NoaXAvZHctbWlwaS1kc2ktcm9ja2NoaXAuYwpAQCAtMTQwLDYgKzE0MCwx
MiBAQAogI2RlZmluZSBEV19NSVBJX05FRURTX1BIWV9DRkdfQ0xLCUJJVCgwKQogI2RlZmluZSBE
V19NSVBJX05FRURTX0dSRl9DTEsJCUJJVCgxKQogCisjZGVmaW5lIFBYMzBfR1JGX1BEX1ZPX0NP
TjEJCTB4MDQzOAorI2RlZmluZSBQWDMwX0RTSV9GT1JDRVRYU1RPUE1PREUJKDB4ZiA8PCA3KQor
I2RlZmluZSBQWDMwX0RTSV9GT1JDRVJYTU9ERQkJQklUKDYpCisjZGVmaW5lIFBYMzBfRFNJX1RV
Uk5ESVNBQkxFCQlCSVQoNSkKKyNkZWZpbmUgUFgzMF9EU0lfTENEQ19TRUwJCUJJVCgwKQorCiAj
ZGVmaW5lIFJLMzI4OF9HUkZfU09DX0NPTjYJCTB4MDI1YwogI2RlZmluZSBSSzMyODhfRFNJMF9M
Q0RDX1NFTAkJQklUKDYpCiAjZGVmaW5lIFJLMzI4OF9EU0kxX0xDRENfU0VMCQlCSVQoOSkKQEAg
LTEwNDksNiArMTA1NSwyNCBAQCBzdGF0aWMgaW50IGR3X21pcGlfZHNpX3JvY2tjaGlwX3JlbW92
ZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQogCXJldHVybiAwOwogfQogCitzdGF0aWMg
Y29uc3Qgc3RydWN0IHJvY2tjaGlwX2R3X2RzaV9jaGlwX2RhdGEgcHgzMF9jaGlwX2RhdGFbXSA9
IHsKKwl7CisJCS5yZWcgPSAweGZmNDUwMDAwLAorCQkubGNkc2VsX2dyZl9yZWcgPSBQWDMwX0dS
Rl9QRF9WT19DT04xLAorCQkubGNkc2VsX2JpZyA9IEhJV09SRF9VUERBVEUoMCwgUFgzMF9EU0lf
TENEQ19TRUwpLAorCQkubGNkc2VsX2xpdCA9IEhJV09SRF9VUERBVEUoUFgzMF9EU0lfTENEQ19T
RUwsCisJCQkJCSAgICBQWDMwX0RTSV9MQ0RDX1NFTCksCisKKwkJLmxhbmVjZmcxX2dyZl9yZWcg
PSBQWDMwX0dSRl9QRF9WT19DT04xLAorCQkubGFuZWNmZzEgPSBISVdPUkRfVVBEQVRFKDAsIFBY
MzBfRFNJX1RVUk5ESVNBQkxFIHwKKwkJCQkJICAgICBQWDMwX0RTSV9GT1JDRVJYTU9ERSB8CisJ
CQkJCSAgICAgUFgzMF9EU0lfRk9SQ0VUWFNUT1BNT0RFKSwKKworCQkubWF4X2RhdGFfbGFuZXMg
PSA0LAorCX0sCisJeyAvKiBzZW50aW5lbCAqLyB9Cit9OworCiBzdGF0aWMgY29uc3Qgc3RydWN0
IHJvY2tjaGlwX2R3X2RzaV9jaGlwX2RhdGEgcmszMjg4X2NoaXBfZGF0YVtdID0gewogCXsKIAkJ
LnJlZyA9IDB4ZmY5NjAwMDAsCkBAIC0xMTE3LDYgKzExNDEsOSBAQCBzdGF0aWMgY29uc3Qgc3Ry
dWN0IHJvY2tjaGlwX2R3X2RzaV9jaGlwX2RhdGEgcmszMzk5X2NoaXBfZGF0YVtdID0gewogCiBz
dGF0aWMgY29uc3Qgc3RydWN0IG9mX2RldmljZV9pZCBkd19taXBpX2RzaV9yb2NrY2hpcF9kdF9p
ZHNbXSA9IHsKIAl7CisJIC5jb21wYXRpYmxlID0gInJvY2tjaGlwLHB4MzAtbWlwaS1kc2kiLAor
CSAuZGF0YSA9ICZweDMwX2NoaXBfZGF0YSwKKwl9LCB7CiAJIC5jb21wYXRpYmxlID0gInJvY2tj
aGlwLHJrMzI4OC1taXBpLWRzaSIsCiAJIC5kYXRhID0gJnJrMzI4OF9jaGlwX2RhdGEsCiAJfSwg
ewotLSAKMi4yMy4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5v
cmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2
ZWw=
