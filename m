Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EB93EFC13B
	for <lists+dri-devel@lfdr.de>; Thu, 14 Nov 2019 09:09:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5197F6E32C;
	Thu, 14 Nov 2019 08:08:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DCAB96ECC3
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Nov 2019 10:04:30 +0000 (UTC)
X-Originating-IP: 93.34.114.233
Received: from uno.lan (93-34-114-233.ip49.fastwebnet.it [93.34.114.233])
 (Authenticated sender: jacopo@jmondi.org)
 by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id 41675C0002;
 Wed, 13 Nov 2019 10:04:27 +0000 (UTC)
From: Jacopo Mondi <jacopo+renesas@jmondi.org>
To: laurent.pinchart@ideasonboard.com, kieran.bingham+renesas@ideasonboard.com,
 geert@linux-m68k.org, horms@verge.net.au, uli+renesas@fpond.eu
Subject: [PATCH v7 7/7] drm: rcar-du: kms: Expand comment in vsps parsing
 routine
Date: Wed, 13 Nov 2019 11:05:56 +0100
Message-Id: <20191113100556.15616-8-jacopo+renesas@jmondi.org>
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

RXhwYW5kIGNvbW1lbnQgaW4gdGhlICd2c3BzJyBwYXJzaW5nIHJvdXRpbmUgdG8gc3BlY2lmeSB0
aGUgTElGCmNoYW5uZWwgaW5kZXggZGVmYXVsdHMgdG8gMCBpbiBjYXNlIHRoZSBzZWNvbmQgY2Vs
bCBvZiB0aGUgcHJvcGVydHkKaXMgbm90IHNwZWNpZmllZCB0byByZW1haW4gY29tcGF0aWJsZSB3
aXRoIG9sZGVyIERUIGJpbmRpbmdzLgoKUmV2aWV3ZWQtYnk6IEtpZXJhbiBCaW5naGFtIDxraWVy
YW4uYmluZ2hhbStyZW5lc2FzQGlkZWFzb25ib2FyZC5jb20+ClJldmlld2VkLWJ5OiBMYXVyZW50
IFBpbmNoYXJ0IDxsYXVyZW50LnBpbmNoYXJ0QGlkZWFzb25ib2FyZC5jb20+ClNpZ25lZC1vZmYt
Ynk6IEphY29wbyBNb25kaSA8amFjb3BvK3JlbmVzYXNAam1vbmRpLm9yZz4KLS0tCiBkcml2ZXJz
L2dwdS9kcm0vcmNhci1kdS9yY2FyX2R1X2ttcy5jIHwgNiArKysrKy0KIDEgZmlsZSBjaGFuZ2Vk
LCA1IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dw
dS9kcm0vcmNhci1kdS9yY2FyX2R1X2ttcy5jIGIvZHJpdmVycy9ncHUvZHJtL3JjYXItZHUvcmNh
cl9kdV9rbXMuYwppbmRleCA3YzlmYjU4NjBlNTQuLjE4NjQyMmFjNTUyYiAxMDA2NDQKLS0tIGEv
ZHJpdmVycy9ncHUvZHJtL3JjYXItZHUvcmNhcl9kdV9rbXMuYworKysgYi9kcml2ZXJzL2dwdS9k
cm0vcmNhci1kdS9yY2FyX2R1X2ttcy5jCkBAIC01ODcsNyArNTg3LDExIEBAIHN0YXRpYyBpbnQg
cmNhcl9kdV92c3BzX2luaXQoc3RydWN0IHJjYXJfZHVfZGV2aWNlICpyY2R1KQogCiAJCXZzcHNb
al0uY3J0Y3NfbWFzayB8PSBCSVQoaSk7CiAKLQkJLyogU3RvcmUgdGhlIFZTUCBwb2ludGVyIGFu
ZCBwaXBlIGluZGV4IGluIHRoZSBDUlRDLiAqLworCQkvKgorCQkgKiBTdG9yZSB0aGUgVlNQIHBv
aW50ZXIgYW5kIHBpcGUgaW5kZXggaW4gdGhlIENSVEMuIElmIHRoZQorCQkgKiBzZWNvbmQgY2Vs
bCBvZiB0aGUgJ3ZzcHMnIHNwZWNpZmllciBpc24ndCBwcmVzZW50LCBkZWZhdWx0CisJCSAqIHRv
IDAgdG8gcmVtYWluIGNvbXBhdGlibGUgd2l0aCBvbGRlciBEVCBiaW5kaW5ncy4KKwkJICovCiAJ
CXJjZHUtPmNydGNzW2ldLnZzcCA9ICZyY2R1LT52c3BzW2pdOwogCQlyY2R1LT5jcnRjc1tpXS52
c3BfcGlwZSA9IGNlbGxzID49IDEgPyBhcmdzLmFyZ3NbMF0gOiAwOwogCX0KLS0gCjIuMjMuMAoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
