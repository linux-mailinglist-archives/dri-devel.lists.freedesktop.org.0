Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BCA317413
	for <lists+dri-devel@lfdr.de>; Wed,  8 May 2019 10:41:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 720A6897F5;
	Wed,  8 May 2019 08:41:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 362 seconds by postgrey-1.36 at gabe;
 Tue, 07 May 2019 15:33:25 UTC
Received: from 7.mo2.mail-out.ovh.net (7.mo2.mail-out.ovh.net [188.165.48.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 05F4F6E7E9
 for <dri-devel@lists.freedesktop.org>; Tue,  7 May 2019 15:33:25 +0000 (UTC)
Received: from player697.ha.ovh.net (unknown [10.109.160.5])
 by mo2.mail-out.ovh.net (Postfix) with ESMTP id 9F1E51920CC
 for <dri-devel@lists.freedesktop.org>; Tue,  7 May 2019 17:27:20 +0200 (CEST)
Received: from armadeus.com (lfbn-1-7591-179.w90-126.abo.wanadoo.fr
 [90.126.248.179])
 (Authenticated sender: sebastien.szymanski@armadeus.com)
 by player697.ha.ovh.net (Postfix) with ESMTPSA id 274FD5875A38;
 Tue,  7 May 2019 15:27:00 +0000 (UTC)
From: =?UTF-8?q?S=C3=A9bastien=20Szymanski?= <sebastien.szymanski@armadeus.com>
To: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 NXP Linux Team <linux-imx@nxp.com>
Subject: [PATCH RE-RESEND 1/2] drm/panel: Add support for Armadeus ST0700 Adapt
Date: Tue,  7 May 2019 17:27:12 +0200
Message-Id: <20190507152713.27494-1-sebastien.szymanski@armadeus.com>
X-Mailer: git-send-email 2.19.2
MIME-Version: 1.0
X-Ovh-Tracer-Id: 11806186423600239639
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduuddrkedtgdelgecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
X-Mailman-Approved-At: Wed, 08 May 2019 08:41:38 +0000
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
Cc: Mark Rutland <mark.rutland@arm.com>, David Airlie <airlied@linux.ie>,
 stable@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 =?UTF-8?q?S=C3=A9bastien=20Szymanski?= <sebastien.szymanski@armadeus.com>,
 Shawn Guo <shawnguo@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhpcyBwYXRjaCBhZGRzIHN1cHBvcnQgZm9yIHRoZSBBcm1hZGV1cyBTVDA3MDAgQWRhcHQuIEl0
IGNvbWVzIHdpdGggYQpTYW50ZWsgU1QwNzAwSTVZLVJCU0xXIDcuMCIgV1ZHQSAoODAweDQ4MCkg
VEZUIGFuZCBhbiBhZGFwdGVyIGJvYXJkIHNvCnRoYXQgaXQgY2FuIGJlIGNvbm5lY3RlZCBvbiB0
aGUgVEZUIGhlYWRlciBvZiBBcm1hZGV1cyBEZXYgYm9hcmRzLgoKQ2M6IHN0YWJsZUB2Z2VyLmtl
cm5lbC5vcmcgIyB2NC4xOQpSZXZpZXdlZC1ieTogUm9iIEhlcnJpbmcgPHJvYmhAa2VybmVsLm9y
Zz4KU2lnbmVkLW9mZi1ieTogU8OpYmFzdGllbiBTenltYW5za2kgPHNlYmFzdGllbi5zenltYW5z
a2lAYXJtYWRldXMuY29tPgotLS0KIC4uLi9kaXNwbGF5L3BhbmVsL2FybWFkZXVzLHN0MDcwMC1h
ZGFwdC50eHQgICB8ICA5ICsrKysrKwogZHJpdmVycy9ncHUvZHJtL3BhbmVsL3BhbmVsLXNpbXBs
ZS5jICAgICAgICAgIHwgMjkgKysrKysrKysrKysrKysrKysrKwogMiBmaWxlcyBjaGFuZ2VkLCAz
OCBpbnNlcnRpb25zKCspCiBjcmVhdGUgbW9kZSAxMDA2NDQgRG9jdW1lbnRhdGlvbi9kZXZpY2V0
cmVlL2JpbmRpbmdzL2Rpc3BsYXkvcGFuZWwvYXJtYWRldXMsc3QwNzAwLWFkYXB0LnR4dAoKZGlm
ZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L3BhbmVs
L2FybWFkZXVzLHN0MDcwMC1hZGFwdC50eHQgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmlu
ZGluZ3MvZGlzcGxheS9wYW5lbC9hcm1hZGV1cyxzdDA3MDAtYWRhcHQudHh0Cm5ldyBmaWxlIG1v
ZGUgMTAwNjQ0CmluZGV4IDAwMDAwMDAwMDAwMC4uYTMwZDYzZGIzYzhmCi0tLSAvZGV2L251bGwK
KysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvcGFuZWwvYXJt
YWRldXMsc3QwNzAwLWFkYXB0LnR4dApAQCAtMCwwICsxLDkgQEAKK0FybWFkZXVzIFNUMDcwMCBB
ZGFwdC4gQSBTYW50ZWsgU1QwNzAwSTVZLVJCU0xXIDcuMCIgV1ZHQSAoODAweDQ4MCkgVEZUIHdp
dGgKK2FuIGFkYXB0ZXIgYm9hcmQuCisKK1JlcXVpcmVkIHByb3BlcnRpZXM6CistIGNvbXBhdGli
bGU6ICJhcm1hZGV1cyxzdDA3MDAtYWRhcHQiCistIHBvd2VyLXN1cHBseTogc2VlIHBhbmVsLWNv
bW1vbi50eHQKKworT3B0aW9uYWwgcHJvcGVydGllczoKKy0gYmFja2xpZ2h0OiBzZWUgcGFuZWwt
Y29tbW9uLnR4dApkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3BhbmVsL3BhbmVsLXNpbXBs
ZS5jIGIvZHJpdmVycy9ncHUvZHJtL3BhbmVsL3BhbmVsLXNpbXBsZS5jCmluZGV4IDllODIxOGY2
YTNmMi4uNDVjYThkMTBiNjZmIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vcGFuZWwvcGFu
ZWwtc2ltcGxlLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL3BhbmVsL3BhbmVsLXNpbXBsZS5jCkBA
IC00NDYsNiArNDQ2LDMyIEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3QgcGFuZWxfZGVzYyBhbXBpcmVf
YW04MDA0ODByM3RtcXdhMWggPSB7CiAJLmJ1c19mb3JtYXQgPSBNRURJQV9CVVNfRk1UX1JHQjY2
Nl8xWDE4LAogfTsKIAorc3RhdGljIGNvbnN0IHN0cnVjdCBkaXNwbGF5X3RpbWluZyBzYW50ZWtf
c3QwNzAwaTV5X3Jic2x3X2ZfdGltaW5nID0geworCS5waXhlbGNsb2NrID0geyAyNjQwMDAwMCwg
MzMzMDAwMDAsIDQ2ODAwMDAwIH0sCisJLmhhY3RpdmUgPSB7IDgwMCwgODAwLCA4MDAgfSwKKwku
aGZyb250X3BvcmNoID0geyAxNiwgMjEwLCAzNTQgfSwKKwkuaGJhY2tfcG9yY2ggPSB7IDQ1LCAz
NiwgNiB9LAorCS5oc3luY19sZW4gPSB7IDEsIDEwLCA0MCB9LAorCS52YWN0aXZlID0geyA0ODAs
IDQ4MCwgNDgwIH0sCisJLnZmcm9udF9wb3JjaCA9IHsgNywgMjIsIDE0NyB9LAorCS52YmFja19w
b3JjaCA9IHsgMjIsIDEzLCAzIH0sCisJLnZzeW5jX2xlbiA9IHsgMSwgMTAsIDIwIH0sCisJLmZs
YWdzID0gRElTUExBWV9GTEFHU19IU1lOQ19MT1cgfCBESVNQTEFZX0ZMQUdTX1ZTWU5DX0xPVyB8
CisJCURJU1BMQVlfRkxBR1NfREVfSElHSCB8IERJU1BMQVlfRkxBR1NfUElYREFUQV9QT1NFREdF
Cit9OworCitzdGF0aWMgY29uc3Qgc3RydWN0IHBhbmVsX2Rlc2MgYXJtYWRldXNfc3QwNzAwX2Fk
YXB0ID0geworCS50aW1pbmdzID0gJnNhbnRla19zdDA3MDBpNXlfcmJzbHdfZl90aW1pbmcsCisJ
Lm51bV90aW1pbmdzID0gMSwKKwkuYnBjID0gNiwKKwkuc2l6ZSA9IHsKKwkJLndpZHRoID0gMTU0
LAorCQkuaGVpZ2h0ID0gODYsCisJfSwKKwkuYnVzX2Zvcm1hdCA9IE1FRElBX0JVU19GTVRfUkdC
NjY2XzFYMTgsCisJLmJ1c19mbGFncyA9IERSTV9CVVNfRkxBR19ERV9ISUdIIHwgRFJNX0JVU19G
TEFHX1BJWERBVEFfUE9TRURHRSwKK307CisKIHN0YXRpYyBjb25zdCBzdHJ1Y3QgZHJtX2Rpc3Bs
YXlfbW9kZSBhdW9fYjEwMWF3MDNfbW9kZSA9IHsKIAkuY2xvY2sgPSA1MTQ1MCwKIAkuaGRpc3Bs
YXkgPSAxMDI0LApAQCAtMjU0NCw2ICsyNTcwLDkgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBvZl9k
ZXZpY2VfaWQgcGxhdGZvcm1fb2ZfbWF0Y2hbXSA9IHsKIAl9LCB7CiAJCS5jb21wYXRpYmxlID0g
ImFybSxydHNtLWRpc3BsYXkiLAogCQkuZGF0YSA9ICZhcm1fcnRzbSwKKwl9LCB7CisJCS5jb21w
YXRpYmxlID0gImFybWFkZXVzLHN0MDcwMC1hZGFwdCIsCisJCS5kYXRhID0gJmFybWFkZXVzX3N0
MDcwMF9hZGFwdCwKIAl9LCB7CiAJCS5jb21wYXRpYmxlID0gImF1byxiMTAxYXcwMyIsCiAJCS5k
YXRhID0gJmF1b19iMTAxYXcwMywKLS0gCjIuMTkuMgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxt
YW4vbGlzdGluZm8vZHJpLWRldmVs
