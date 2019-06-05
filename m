Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D35A357D3
	for <lists+dri-devel@lfdr.de>; Wed,  5 Jun 2019 09:33:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4CB31895CA;
	Wed,  5 Jun 2019 07:33:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mo6-p02-ob.smtp.rzone.de (mo6-p02-ob.smtp.rzone.de
 [IPv6:2a01:238:20a:202:5302::12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A723989458
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Jun 2019 05:07:17 +0000 (UTC)
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMhflhwDubTJ9o1OAA2UNf2MzN9Qq6uM="
X-RZG-CLASS-ID: mo00
Received: from iMac.fritz.box by smtp.strato.de (RZmta 44.22 DYNA|AUTH)
 with ESMTPSA id i01b98v55575A1C
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (curve secp521r1 with
 521 ECDH bits, eq. 15360 bits RSA))
 (Client did not present a certificate);
 Wed, 5 Jun 2019 07:07:05 +0200 (CEST)
From: "H. Nikolaus Schaller" <hns@goldelico.com>
To: Thierry Reding <thierry.reding@gmail.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, tomi.valkeinen@ti.com,
 imirkin@alum.mit.edu, marek.belisko@gmail.com
Subject: [PATCH v2 2/2] drm/panel: simple: Add Ortustech COM37H3M panel support
Date: Wed,  5 Jun 2019 07:07:03 +0200
Message-Id: <43b47034b618cff26cea0484591c6deafb7f0685.1559711222.git.hns@goldelico.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <cover.1559711222.git.hns@goldelico.com>
References: <cover.1559711222.git.hns@goldelico.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 05 Jun 2019 07:33:22 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 t=1559711235; 
 s=strato-dkim-0002; d=goldelico.com;
 h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
 X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
 bh=Vi8XPkzvs3rsYu99yfQYh/pogLXeP+Q04MJbkT2ESyM=;
 b=UUj0smQ7jsW4tNehht6OzXA5c/jPcZJCgc5Xt7fW8YugHLAOJsGXpzsjRb7k5nsvYO
 HNt93+s11iDRi4mFPVNgkbG0ohIRKaSo3QY44B1sOIFvheZV23+NSGKBdKDMNS7blkP9
 CTgqe7xmtmv06rFP22GeNSK5x7gdyTx4xc3ICsSuu0fTW+cU+s+t3rMZbchwGW+Cq0QY
 VJwRCS/xdzZfdOK6ZeTLny9atHwEFNaZyFkrijvPilZW0HEjhIxq4v/QWMqbMgnK1Dp8
 bwHnmFWgkd77VK2VZxpaXI5Sz901YiR2aQ5WzMCS1HBqfD1kOTP/sQdH6t9dCqTsKj8z
 88hw==
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
Cc: "H. Nikolaus Schaller" <hns@goldelico.com>, letux-kernel@openphoenux.org,
 linux-omap@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhlIGNoYW5nZSBhZGRzIHN1cHBvcnQgZm9yIHRoZSBPcnR1c3RlY2ggQ09NMzdIM00wNURUQy85
OURUQyAzLjciIFRGVCBMQ0QgcGFuZWwuCgpUZXN0ZWQgb24gTGV0dXgzNzA0LgoKU2lnbmVkLW9m
Zi1ieTogSC4gTmlrb2xhdXMgU2NoYWxsZXIgPGhuc0Bnb2xkZWxpY28uY29tPgotLS0KIGRyaXZl
cnMvZ3B1L2RybS9wYW5lbC9wYW5lbC1zaW1wbGUuYyB8IDMzICsrKysrKysrKysrKysrKysrKysr
KysrKysrKysKIDEgZmlsZSBjaGFuZ2VkLCAzMyBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9ncHUvZHJtL3BhbmVsL3BhbmVsLXNpbXBsZS5jIGIvZHJpdmVycy9ncHUvZHJtL3Bh
bmVsL3BhbmVsLXNpbXBsZS5jCmluZGV4IDViMjc4MjljNWE3OC4uMWZiNzQ5MDhhMjY5IDEwMDY0
NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vcGFuZWwvcGFuZWwtc2ltcGxlLmMKKysrIGIvZHJpdmVy
cy9ncHUvZHJtL3BhbmVsL3BhbmVsLXNpbXBsZS5jCkBAIC0yMDA3LDYgKzIwMDcsMzMgQEAgc3Rh
dGljIGNvbnN0IHN0cnVjdCBwYW5lbF9kZXNjIG9udGF0X3l4NzAwd3YwMyA9IHsKIAkuYnVzX2Zv
cm1hdCA9IE1FRElBX0JVU19GTVRfUkdCNjY2XzFYMTgsCiB9OwogCitzdGF0aWMgY29uc3Qgc3Ry
dWN0IGRybV9kaXNwbGF5X21vZGUgb3J0dXN0ZWNoX2NvbTM3aDNtX21vZGUgID0geworCS5jbG9j
ayA9IDIyMTUzLAorCS5oZGlzcGxheSA9IDQ4MCwKKwkuaHN5bmNfc3RhcnQgPSA0ODAgKyA4LAor
CS5oc3luY19lbmQgPSA0ODAgKyA4ICsgMTAsCisJLmh0b3RhbCA9IDQ4MCArIDggKyAxMCArIDEw
LAorCS52ZGlzcGxheSA9IDY0MCwKKwkudnN5bmNfc3RhcnQgPSA2NDAgKyA0LAorCS52c3luY19l
bmQgPSA2NDAgKyA0ICsgMywKKwkudnRvdGFsID0gNjQwICsgNCArIDMgKyA0LAorCS52cmVmcmVz
aCA9IDYwLAorCS5mbGFncyA9IERSTV9NT0RFX0ZMQUdfTlZTWU5DIHwgRFJNX01PREVfRkxBR19O
SFNZTkMsCit9OworCitzdGF0aWMgY29uc3Qgc3RydWN0IHBhbmVsX2Rlc2Mgb3J0dXN0ZWNoX2Nv
bTM3aDNtID0geworCS5tb2RlcyA9ICZvcnR1c3RlY2hfY29tMzdoM21fbW9kZSwKKwkubnVtX21v
ZGVzID0gMSwKKwkuYnBjID0gOCwKKwkuc2l6ZSA9IHsKKwkJLndpZHRoID0gNTYsCS8qIDU2LjE2
bW0gKi8KKwkJLmhlaWdodCA9IDc1LAkvKiA3NC44OG1tICovCisJfSwKKwkuYnVzX2Zvcm1hdCA9
IE1FRElBX0JVU19GTVRfUkdCODg4XzFYMjQsCisJLmJ1c19mbGFncyA9IERSTV9CVVNfRkxBR19E
RV9ISUdIIHwgRFJNX0JVU19GTEFHX1BJWERBVEFfUE9TRURHRSB8CisJCSAgICAgRFJNX0JVU19G
TEFHX1NZTkNfRFJJVkVfUE9TRURHRSwKK307CisKIHN0YXRpYyBjb25zdCBzdHJ1Y3QgZHJtX2Rp
c3BsYXlfbW9kZSBvcnR1c3RlY2hfY29tNDNoNG04NXVsY19tb2RlICA9IHsKIAkuY2xvY2sgPSAy
NTAwMCwKIAkuaGRpc3BsYXkgPSA0ODAsCkBAIC0yNzg2LDYgKzI4MTMsMTIgQEAgc3RhdGljIGNv
bnN0IHN0cnVjdCBvZl9kZXZpY2VfaWQgcGxhdGZvcm1fb2ZfbWF0Y2hbXSA9IHsKIAl9LCB7CiAJ
CS5jb21wYXRpYmxlID0gIm9udGF0LHl4NzAwd3YwMyIsCiAJCS5kYXRhID0gJm9udGF0X3l4NzAw
d3YwMywKKwl9LCB7CisJCS5jb21wYXRpYmxlID0gIm9ydHVzdGVjaCxjb20zN2gzbTA1ZHRjIiwK
KwkJLmRhdGEgPSAmb3J0dXN0ZWNoX2NvbTM3aDNtLAorCX0sIHsKKwkJLmNvbXBhdGlibGUgPSAi
b3J0dXN0ZWNoLGNvbTM3aDNtOTlkdGMiLAorCQkuZGF0YSA9ICZvcnR1c3RlY2hfY29tMzdoM20s
CiAJfSwgewogCQkuY29tcGF0aWJsZSA9ICJvcnR1c3RlY2gsY29tNDNoNG04NXVsYyIsCiAJCS5k
YXRhID0gJm9ydHVzdGVjaF9jb200M2g0bTg1dWxjLAotLSAKMi4xOS4xCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0
CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3Rv
cC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
