Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 666AF455B7
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jun 2019 09:22:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 021E9894DD;
	Fri, 14 Jun 2019 07:21:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk
 [IPv6:2001:4d48:ad52:3201:214:fdff:fe10:1be6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C3D389AEE
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jun 2019 15:03:12 +0000 (UTC)
Received: from e0022681537dd.dyn.armlinux.org.uk
 ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:35414 helo=rmk-PC.armlinux.org.uk)
 by pandora.armlinux.org.uk with esmtpsa
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.90_1)
 (envelope-from <rmk@armlinux.org.uk>)
 id 1hbRFO-0003kM-Fn; Thu, 13 Jun 2019 16:02:38 +0100
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim
 4.82_1-5b7a7c0-XX) (envelope-from <rmk@armlinux.org.uk>)
 id 1hbRFJ-00007p-OS; Thu, 13 Jun 2019 16:02:33 +0100
In-Reply-To: <20190613150114.xqkyb7j7w4ve4yvr@shell.armlinux.org.uk>
References: <20190613150114.xqkyb7j7w4ve4yvr@shell.armlinux.org.uk>
From: Russell King <rmk+kernel@armlinux.org.uk>
To: dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH 10/18] drm/armada: add and use definitions for RDREG4F
MIME-Version: 1.0
Content-Disposition: inline
Message-Id: <E1hbRFJ-00007p-OS@rmk-PC.armlinux.org.uk>
Date: Thu, 13 Jun 2019 16:02:33 +0100
X-Mailman-Approved-At: Fri, 14 Jun 2019 07:21:24 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; 
 d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
 Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
 In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=YEzDgofyaqdLXecpl37pDtx+MZjCqpaPCpqCbfuc3zk=; b=sCXK7Brb+XITQW52K5FMHUzsHG
 kxCojciHM97n2OD6wkoY2OQjUNTr854E2Y4//436Mlltu0qBLMr7cndXXecpwhjidBjg2ByBFv3Cc
 UwRkg30EzloBVDYDXbg2pn/GBhIXU/H1WQQ0RJh7x6jNI47roMaNo2Vru5qE3TqOg1SejGteJ1rW9
 Z2CrRLNLowIVR6VrW8EAUBbKOff9YWCocrLlFFm5zvXqIn/yyVozOmBxl5MuOF7rmGmU94dEdiskd
 P2r9YHDtsOu0jAm92nY/3omGpMaXJ5HXfTJ+G6akYwnUWPUbFJMFcfTCbhj+R4BjGVrj3e7aQ3hri
 F4pr7fEw==;
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
Cc: David Airlie <airlied@linux.ie>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QWRkIGFuZCB1c2UgYml0IGRlZmluaXRpb25zIGZvciBSRFJFRzRGIG9uIERvdmUgQXJtYWRhIDUx
MC4KClNpZ25lZC1vZmYtYnk6IFJ1c3NlbGwgS2luZyA8cm1rK2tlcm5lbEBhcm1saW51eC5vcmcu
dWs+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2FybWFkYS9hcm1hZGFfNTEwLmMgfCAgOSArKysrKysr
LS0KIGRyaXZlcnMvZ3B1L2RybS9hcm1hZGEvYXJtYWRhX2h3LmggIHwgMTAgKysrKysrKysrKwog
MiBmaWxlcyBjaGFuZ2VkLCAxNyBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQoKZGlmZiAt
LWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hcm1hZGEvYXJtYWRhXzUxMC5jIGIvZHJpdmVycy9ncHUv
ZHJtL2FybWFkYS9hcm1hZGFfNTEwLmMKaW5kZXggMGU5MWQyNzkyMWJkLi4zNzBjNDIyZjY0ZTMg
MTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hcm1hZGEvYXJtYWRhXzUxMC5jCisrKyBiL2Ry
aXZlcnMvZ3B1L2RybS9hcm1hZGEvYXJtYWRhXzUxMC5jCkBAIC0yNCw4ICsyNCwxMyBAQCBzdGF0
aWMgaW50IGFybWFkYTUxMF9jcnRjX2luaXQoc3RydWN0IGFybWFkYV9jcnRjICpkY3J0Yywgc3Ry
dWN0IGRldmljZSAqZGV2KQogCiAJZGNydGMtPmV4dGNsa1swXSA9IGNsazsKIAotCS8qIExvd2Vy
IHRoZSB3YXRlcm1hcmsgc28gdG8gZWxpbWluYXRlIGppdHRlciBhdCBoaWdoZXIgYmFuZHdpZHRo
cyAqLwotCWFybWFkYV91cGRhdGVsKDB4MjAsICgxIDw8IDExKSB8IDB4ZmYsIGRjcnRjLT5iYXNl
ICsgTENEX0NGR19SRFJFRzRGKTsKKwkvKgorCSAqIExvd2VyIHRoZSB3YXRlcm1hcmsgc28gdG8g
ZWxpbWluYXRlIGppdHRlciBhdCBoaWdoZXIgYmFuZHdpZHRocy4KKwkgKiBEaXNhYmxlIFNSQU0g
cmVhZCB3YWl0IHN0YXRlIHRvIGF2b2lkIHN5c3RlbSBoYW5nIHdpdGggZXh0ZXJuYWwKKwkgKiBj
bG9jay4KKwkgKi8KKwlhcm1hZGFfdXBkYXRlbChDRkdfRE1BX1dNKDB4MjApLCBDRkdfU1JBTV9X
QUlUIHwgQ0ZHX0RNQV9XTV9NQVNLLAorCQkgICAgICAgZGNydGMtPmJhc2UgKyBMQ0RfQ0ZHX1JE
UkVHNEYpOwogCiAJLyogSW5pdGlhbGlzZSBTUFUgcmVnaXN0ZXIgKi8KIAl3cml0ZWxfcmVsYXhl
ZChBRFZfSFdDMzJFTkFCTEUgfCBBRFZfSFdDMzJBUkdCIHwgQURWX0hXQzMyQkxFTkQsCmRpZmYg
LS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYXJtYWRhL2FybWFkYV9ody5oIGIvZHJpdmVycy9ncHUv
ZHJtL2FybWFkYS9hcm1hZGFfaHcuaAppbmRleCBiYWJmY2E3MWM0ZGIuLjViMWFmMGNjOWY1MCAx
MDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FybWFkYS9hcm1hZGFfaHcuaAorKysgYi9kcml2
ZXJzL2dwdS9kcm0vYXJtYWRhL2FybWFkYV9ody5oCkBAIC04OCw2ICs4OCwxNiBAQCBlbnVtIHsK
IAlBRFZfVlNZTkNfSF9PRkYJPSAweGZmZiA8PCAwLAogfTsKIAorLyogTENEX0NGR19SRFJFRzRG
IC0gQXJtYWRhIDUxMCBvbmx5ICovCitlbnVtIHsKKwlDRkdfU1JBTV9XQUlUCT0gQklUKDExKSwK
KwlDRkdfU01QTl9GQVNUVFgJPSBCSVQoMTApLAorCUNGR19ETUFfQVJCCT0gQklUKDkpLAorCUNG
R19ETUFfV01fRU4JPSBCSVQoOCksCisJQ0ZHX0RNQV9XTV9NQVNLCT0gMHhmZiwKKyNkZWZpbmUg
Q0ZHX0RNQV9XTSh4KQkoKHgpICYgQ0ZHX0RNQV9XTV9NQVNLKQorfTsKKwogZW51bSB7CiAJQ0ZH
XzU2NQkJPSAwLAogCUNGR18xNTU1CT0gMSwKLS0gCjIuNy40CgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1k
ZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcv
bWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
