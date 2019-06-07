Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 108633A59B
	for <lists+dri-devel@lfdr.de>; Sun,  9 Jun 2019 14:54:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 344F289276;
	Sun,  9 Jun 2019 12:54:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mo6-p02-ob.smtp.rzone.de (mo6-p02-ob.smtp.rzone.de
 [IPv6:2a01:238:20a:202:5302::2])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C813D89D4D
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Jun 2019 11:11:28 +0000 (UTC)
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMhflhwDubTJ9o12DNOsPj0pAwkq13LM="
X-RZG-CLASS-ID: mo00
Received: from iMac.fritz.box by smtp.strato.de (RZmta 44.22 DYNA|AUTH)
 with ESMTPSA id i01b98v57BBEPaS
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (curve secp521r1 with
 521 ECDH bits, eq. 15360 bits RSA))
 (Client did not present a certificate);
 Fri, 7 Jun 2019 13:11:14 +0200 (CEST)
From: "H. Nikolaus Schaller" <hns@goldelico.com>
To: Thierry Reding <thierry.reding@gmail.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, tomi.valkeinen@ti.com,
 imirkin@alum.mit.edu, marek.belisko@gmail.com,
 Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Subject: [PATCH v3 4/5] dt-bindings: drm/panel: simple: add ortustech,
 com37h3m99dtc panel
Date: Fri,  7 Jun 2019 13:11:10 +0200
Message-Id: <3e0720fbddfd7b35ad8551440544411485d8ad9f.1559905870.git.hns@goldelico.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <cover.1559905870.git.hns@goldelico.com>
References: <cover.1559905870.git.hns@goldelico.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Sun, 09 Jun 2019 12:54:16 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 t=1559905886; 
 s=strato-dkim-0002; d=goldelico.com;
 h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
 X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
 bh=Cxs1oKAktwTpHgDSYgztm2PF82fkAQ8JedBNamziUPE=;
 b=dYs7alpr4ksAdDdREAh11KBvGUMwvmPO/yry5w5PyCFYSblL46PgFV91wqvy5/Mzf0
 SfWuEqmX7riecJT+jb4zd/7/gw/PQG1WLu30t3GTeKmpbIXosDovXDr19D4ybs1YKWQQ
 3/ft82f7klyO48Qa8JQsYRKebXxTXUaf9N3HkpsU8//8cDgPH2MkutnRCTguqsCw58Al
 j7Mv3AV5Rd+DMUVBJhbjyBj4eYn6DMFXdUq8tGAeU+Ornu7rFArLQ4f3UzMunDIiTJ8V
 R4QDoS6X6L7weAjSAY9S6lz2mLbfPIptE1T4/JUo5VJJibMpvY6KXSUn1kuUTl9EYJ7S
 Ur4A==
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
Cc: devicetree@vger.kernel.org, linux-omap@vger.kernel.org,
 "H. Nikolaus Schaller" <hns@goldelico.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, letux-kernel@openphoenux.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

U2lnbmVkLW9mZi1ieTogSC4gTmlrb2xhdXMgU2NoYWxsZXIgPGhuc0Bnb2xkZWxpY28uY29tPgot
LS0KIC4uLi9kaXNwbGF5L3BhbmVsL29ydHVzdGVjaCxjb20zN2gzbTk5ZHRjLnR4dCAgICAgICAg
fCAxMiArKysrKysrKysrKysKIDEgZmlsZSBjaGFuZ2VkLCAxMiBpbnNlcnRpb25zKCspCiBjcmVh
dGUgbW9kZSAxMDA2NDQgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkv
cGFuZWwvb3J0dXN0ZWNoLGNvbTM3aDNtOTlkdGMudHh0CgpkaWZmIC0tZ2l0IGEvRG9jdW1lbnRh
dGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvcGFuZWwvb3J0dXN0ZWNoLGNvbTM3aDNt
OTlkdGMudHh0IGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvcGFu
ZWwvb3J0dXN0ZWNoLGNvbTM3aDNtOTlkdGMudHh0Cm5ldyBmaWxlIG1vZGUgMTAwNjQ0CmluZGV4
IDAwMDAwMDAwMDAwMC4uMDZhNzNjM2Y0NmI1Ci0tLSAvZGV2L251bGwKKysrIGIvRG9jdW1lbnRh
dGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvcGFuZWwvb3J0dXN0ZWNoLGNvbTM3aDNt
OTlkdGMudHh0CkBAIC0wLDAgKzEsMTIgQEAKK09ydHVzVGVjaCBDT00zN0gzTTk5RFRDIEJsYW52
aWV3IDMuNyIgVkdBIHBvcnRyYWl0IFRGVC1MQ0QgcGFuZWwKKworUmVxdWlyZWQgcHJvcGVydGll
czoKKy0gY29tcGF0aWJsZTogc2hvdWxkIGJlICJvcnR1c3RlY2gsY29tMzdoM205OWR0YyIKKwor
T3B0aW9uYWwgcHJvcGVydGllczoKKy0gZW5hYmxlLWdwaW9zOiBHUElPIHBpbiB0byBlbmFibGUg
b3IgZGlzYWJsZSB0aGUgcGFuZWwKKy0gYmFja2xpZ2h0OiBwaGFuZGxlIG9mIHRoZSBiYWNrbGln
aHQgZGV2aWNlIGF0dGFjaGVkIHRvIHRoZSBwYW5lbAorLSBwb3dlci1zdXBwbHk6IHBoYW5kbGUg
b2YgdGhlIHJlZ3VsYXRvciB0aGF0IHByb3ZpZGVzIHRoZSBzdXBwbHkgdm9sdGFnZQorCitUaGlz
IGJpbmRpbmcgaXMgY29tcGF0aWJsZSB3aXRoIHRoZSBzaW1wbGUtcGFuZWwgYmluZGluZywgd2hp
Y2ggaXMgc3BlY2lmaWVkCitpbiBzaW1wbGUtcGFuZWwudHh0IGluIHRoaXMgZGlyZWN0b3J5Lgot
LSAKMi4xOS4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcK
aHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
