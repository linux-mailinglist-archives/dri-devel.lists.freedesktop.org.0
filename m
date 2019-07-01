Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C6E614E11D
	for <lists+dri-devel@lfdr.de>; Fri, 21 Jun 2019 09:22:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D5E76E823;
	Fri, 21 Jun 2019 07:22:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from vps.xff.cz (vps.xff.cz [195.181.215.36])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C2F166E583
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Jun 2019 13:47:55 +0000 (UTC)
From: megous@megous.com
To: linux-sunxi@googlegroups.com, Maxime Ripard <maxime.ripard@bootlin.com>,
 Chen-Yu Tsai <wens@csie.org>, Rob Herring <robh+dt@kernel.org>,
 =?UTF-8?q?Jernej=20=C5=A0krabec?= <jernej.skrabec@gmail.com>
Subject: [PATCH v7 6/6] arm64: dts: allwinner: orange-pi-3: Enable HDMI output
Date: Thu, 20 Jun 2019 15:47:48 +0200
Message-Id: <20190620134748.17866-7-megous@megous.com>
In-Reply-To: <20190620134748.17866-1-megous@megous.com>
References: <20190620134748.17866-1-megous@megous.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 21 Jun 2019 07:22:42 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=megous.com; s=mail; 
 t=1561038474; bh=hF73OcLMSBQTt85tuavHzM/b80WjbO/5pa+6hf7Ij0Q=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=noEunnlcospPPWmjHUXPetOyu/+2FB8divTxcfSNffF1qXaNywuT6NPLqUPsNfP6Z
 XbVMwyrhk+LyQCakLpsHYj2kSgGbLG1LEnBphnhBSkeHiylA9WTIF4iTGv/aYEhyuA
 LQnygb9mxfx6WzZ+pRG0fRDQjcKaG9BMW7TKQ9NA=
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
YSBERENfQ0VDX0VOIHNpZ25hbCBjb25uZWN0ZWQgdG8gUEgyLCB0aGF0IGVuYWJsZXMgdGhlIERE
QwpJMkMgYnVzIHZvbHRhZ2Ugc2hpZnRlci4gQmVmb3JlIEVESUQgY2FuIGJlIHJlYWQsIHdlIG5l
ZWQgdG8gcHVsbCBQSDIgaGlnaC4KVGhpcyBpcyByZWFsaXplZCBieSB0aGUgZGRjLWVuLWdwaW9z
IHByb3BlcnR5LgoKU2lnbmVkLW9mZi1ieTogT25kcmVqIEppcm1hbiA8bWVnb3VzQG1lZ291cy5j
b20+Ci0tLQogLi4uL2R0cy9hbGx3aW5uZXIvc3VuNTBpLWg2LW9yYW5nZXBpLTMuZHRzICAgIHwg
MjYgKysrKysrKysrKysrKysrKysrKwogMSBmaWxlIGNoYW5nZWQsIDI2IGluc2VydGlvbnMoKykK
CmRpZmYgLS1naXQgYS9hcmNoL2FybTY0L2Jvb3QvZHRzL2FsbHdpbm5lci9zdW41MGktaDYtb3Jh
bmdlcGktMy5kdHMgYi9hcmNoL2FybTY0L2Jvb3QvZHRzL2FsbHdpbm5lci9zdW41MGktaDYtb3Jh
bmdlcGktMy5kdHMKaW5kZXggMmM2ODA3Yjc0ZmY2Li4wMWJiMWJhZmUyODQgMTAwNjQ0Ci0tLSBh
L2FyY2gvYXJtNjQvYm9vdC9kdHMvYWxsd2lubmVyL3N1bjUwaS1oNi1vcmFuZ2VwaS0zLmR0cwor
KysgYi9hcmNoL2FybTY0L2Jvb3QvZHRzL2FsbHdpbm5lci9zdW41MGktaDYtb3JhbmdlcGktMy5k
dHMKQEAgLTIyLDYgKzIyLDE4IEBACiAJCXN0ZG91dC1wYXRoID0gInNlcmlhbDA6MTE1MjAwbjgi
OwogCX07CiAKKwljb25uZWN0b3IgeworCQljb21wYXRpYmxlID0gImhkbWktY29ubmVjdG9yIjsK
KwkJZGRjLWVuLWdwaW9zID0gPCZwaW8gNyAyIEdQSU9fQUNUSVZFX0hJR0g+OyAvKiBQSDIgKi8K
KwkJdHlwZSA9ICJhIjsKKworCQlwb3J0IHsKKwkJCWhkbWlfY29uX2luOiBlbmRwb2ludCB7CisJ
CQkJcmVtb3RlLWVuZHBvaW50ID0gPCZoZG1pX291dF9jb24+OworCQkJfTsKKwkJfTsKKwl9Owor
CiAJbGVkcyB7CiAJCWNvbXBhdGlibGUgPSAiZ3Bpby1sZWRzIjsKIApAQCAtNzIsNiArODQsMTAg
QEAKIAljcHUtc3VwcGx5ID0gPCZyZWdfZGNkY2E+OwogfTsKIAorJmRlIHsKKwlzdGF0dXMgPSAi
b2theSI7Cit9OworCiAmZWhjaTAgewogCXN0YXR1cyA9ICJva2F5IjsKIH07CkBAIC05MSw2ICsx
MDcsMTYgQEAKIAlzdGF0dXMgPSAib2theSI7CiB9OwogCismaGRtaSB7CisJc3RhdHVzID0gIm9r
YXkiOworfTsKKworJmhkbWlfb3V0IHsKKwloZG1pX291dF9jb246IGVuZHBvaW50IHsKKwkJcmVt
b3RlLWVuZHBvaW50ID0gPCZoZG1pX2Nvbl9pbj47CisJfTsKK307CisKICZtZGlvIHsKIAlleHRf
cmdtaWlfcGh5OiBldGhlcm5ldC1waHlAMSB7CiAJCWNvbXBhdGlibGUgPSAiZXRoZXJuZXQtcGh5
LWllZWU4MDIuMy1jMjIiOwotLSAKMi4yMi4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0
cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9kcmktZGV2ZWw=
