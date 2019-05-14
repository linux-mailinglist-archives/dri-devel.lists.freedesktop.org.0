Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 079B61E8E8
	for <lists+dri-devel@lfdr.de>; Wed, 15 May 2019 09:22:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E46E89617;
	Wed, 15 May 2019 07:21:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from newverein.lst.de (verein.lst.de [213.95.11.211])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A14389291
 for <dri-devel@lists.freedesktop.org>; Tue, 14 May 2019 16:11:17 +0000 (UTC)
Received: by newverein.lst.de (Postfix, from userid 2005)
 id 7787D68C65; Tue, 14 May 2019 18:02:36 +0200 (CEST)
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
Subject: [PATCH 3/4] arm64: DTS: allwinner: a64: Enable audio on Teres-I
References: <20190514155911.6C0AC68B05@newverein.lst.de>
Message-Id: <20190514160236.7787D68C65@newverein.lst.de>
Date: Tue, 14 May 2019 18:02:36 +0200 (CEST)
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

RnJvbTogSGFyYWxkIEdleWVyIDxoYXJhbGRAY2NiaWIub3JnPgoKVGhlIFRFUkVTLUkgaGFzIGlu
dGVybmFsIHNwZWFrZXJzIChsZWZ0LCByaWdodCksIGludGVybmFsIG1pY3JvcGhvbmUKYW5kIGEg
aGVhZHNldCBjb21ibyBqYWNrIChoZWFkcGhvbmVzICsgbWljKS4KClRoZSBoZWFkcGhvbmUgbGlu
ZXMgYXJlIG11bHRpcGxleGVkIHdpdGggdGhlIGRlYnVnIGNvbnNvbGUuClRoZSBoZWFkcGhvbmUg
YW5kIG1pYyBkZXRlY3QgbGluZXMgb2YgdGhlIEE2NCBhcmUgY29ubmVjdGVkIHByb3Blcmx5LApi
dXQgQUZBSUsgY3VycmVudGx5IHVuc3VwcG9ydGVkIGJ5IHRoZSBkcml2ZXIuCgpTaWduZWQtb2Zm
LWJ5OiBIYXJhbGQgR2V5ZXIgPGhhcmFsZEBjY2JpYi5vcmc+ClNpZ25lZC1vZmYtYnk6IFRvcnN0
ZW4gRHV3ZSA8ZHV3ZUBzdXNlLmRlPgotLS0KCm9yaWdpbmFsbHk6IHBhdGNod29yay5rZXJuZWwu
b3JnL3BhdGNoLzEwNzkyNTg5CgpSZW1vdmVkIHRoZSBxdWVzdGlvbmFibGUgaXNzdWVzLCBsZWF2
aW5nIHRoZSB1bmNoYWxsZW5nZWQgcGFydHMuCgotLS0KIC4uLi9ib290L2R0cy9hbGx3aW5uZXIv
c3VuNTBpLWE2NC10ZXJlcy1pLmR0cyB8IDUzICsrKysrKysrKysrKysrKysrKysKIDEgZmlsZSBj
aGFuZ2VkLCA1MyBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvYXJjaC9hcm02NC9ib290L2R0
cy9hbGx3aW5uZXIvc3VuNTBpLWE2NC10ZXJlcy1pLmR0cyBiL2FyY2gvYXJtNjQvYm9vdC9kdHMv
YWxsd2lubmVyL3N1bjUwaS1hNjQtdGVyZXMtaS5kdHMKaW5kZXggZjllZWRlMGE4YmQzLi5kNTcw
NDlmYmRhY2EgMTAwNjQ0Ci0tLSBhL2FyY2gvYXJtNjQvYm9vdC9kdHMvYWxsd2lubmVyL3N1bjUw
aS1hNjQtdGVyZXMtaS5kdHMKKysrIGIvYXJjaC9hcm02NC9ib290L2R0cy9hbGx3aW5uZXIvc3Vu
NTBpLWE2NC10ZXJlcy1pLmR0cwpAQCAtNzAsNiArNzAsMjUgQEAKIAkJY29tcGF0aWJsZSA9ICJt
bWMtcHdyc2VxLXNpbXBsZSI7CiAJCXJlc2V0LWdwaW9zID0gPCZyX3BpbyAwIDIgR1BJT19BQ1RJ
VkVfTE9XPjsgLyogUEwyICovCiAJfTsKKworCXNwZWFrZXJfYW1wOiBhdWRpby1hbXBsaWZpZXIg
eworCQljb21wYXRpYmxlID0gInNpbXBsZS1hdWRpby1hbXBsaWZpZXIiOworCQllbmFibGUtZ3Bp
b3MgPSA8JnJfcGlvIDAgMTIgR1BJT19BQ1RJVkVfSElHSD47IC8qIFBMMTIgKi8KKwkJc291bmQt
bmFtZS1wcmVmaXggPSAiU3BlYWtlciBBbXAiOworCX07Cit9OworCismY29kZWMgeworCXN0YXR1
cyA9ICJva2F5IjsKK307CisKKyZjb2RlY19hbmFsb2cgeworCWNwdmRkLXN1cHBseSA9IDwmcmVn
X2VsZG8xPjsKKwlzdGF0dXMgPSAib2theSI7Cit9OworCismZGFpIHsKKwlzdGF0dXMgPSAib2th
eSI7CiB9OwogCiAmZWhjaTEgewpAQCAtMjU4LDYgKzI4NiwyOSBAQAogCXZjYy1oZG1pLXN1cHBs
eSA9IDwmcmVnX2RsZG8xPjsKIH07CiAKKyZzb3VuZCB7CisJc2ltcGxlLWF1ZGlvLWNhcmQsYXV4
LWRldnMgPSA8JmNvZGVjX2FuYWxvZz4sIDwmc3BlYWtlcl9hbXA+OworCXNpbXBsZS1hdWRpby1j
YXJkLHdpZGdldHMgPSAiSGVhZHBob25lIiwgIkhlYWRwaG9uZSBKYWNrIiwKKwkJCQkgICAgIk1p
Y3JvcGhvbmUiLCAiSGVhZHNldCBNaWNyb3Bob25lIiwKKwkJCQkgICAgIk1pY3JvcGhvbmUiLCAi
SW50ZXJuYWwgTWljcm9waG9uZSIsCisJCQkJICAgICJTcGVha2VyIiwgIkludGVybmFsIFNwZWFr
ZXIiOworCXNpbXBsZS1hdWRpby1jYXJkLHJvdXRpbmcgPQorCQkJIkxlZnQgREFDIiwgIkFJRjEg
U2xvdCAwIExlZnQiLAorCQkJIlJpZ2h0IERBQyIsICJBSUYxIFNsb3QgMCBSaWdodCIsCisJCQki
QUlGMSBTbG90IDAgTGVmdCBBREMiLCAiTGVmdCBBREMiLAorCQkJIkFJRjEgU2xvdCAwIFJpZ2h0
IEFEQyIsICJSaWdodCBBREMiLAorCQkJIkhlYWRwaG9uZSBKYWNrIiwgIkhQIiwKKwkJCSJTcGVh
a2VyIEFtcCBJTkwiLCAiTElORU9VVCIsCisJCQkiU3BlYWtlciBBbXAgSU5SIiwgIkxJTkVPVVQi
LAorCQkJIkludGVybmFsIFNwZWFrZXIiLCAiU3BlYWtlciBBbXAgT1VUTCIsCisJCQkiSW50ZXJu
YWwgU3BlYWtlciIsICJTcGVha2VyIEFtcCBPVVRSIiwKKwkJCSJJbnRlcm5hbCBNaWNyb3Bob25l
IiwgIk1CSUFTIiwKKwkJCSJNSUMxIiwgIkludGVybmFsIE1pY3JvcGhvbmUiLAorCQkJIkhlYWRz
ZXQgTWljcm9waG9uZSIsICJIQklBUyIsCisJCQkiTUlDMiIsICJIZWFkc2V0IE1pY3JvcGhvbmUi
OworCXN0YXR1cyA9ICJva2F5IjsKK307CisKICZ1YXJ0MCB7CiAJcGluY3RybC1uYW1lcyA9ICJk
ZWZhdWx0IjsKIAlwaW5jdHJsLTAgPSA8JnVhcnQwX3BiX3BpbnM+OwpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRy
aS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5v
cmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
