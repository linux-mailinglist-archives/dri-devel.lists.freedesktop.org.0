Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B9119104CFA
	for <lists+dri-devel@lfdr.de>; Thu, 21 Nov 2019 08:59:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8EFB56EB5F;
	Thu, 21 Nov 2019 07:59:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from crapouillou.net (outils.crapouillou.net [89.234.176.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC16D6E610
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Nov 2019 17:10:51 +0000 (UTC)
From: Paul Cercueil <paul@crapouillou.net>
To: Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Subject: [PATCH 3/3] drm/panel: simple: Add support for the Frida FRD350H54004
 panel
Date: Wed, 20 Nov 2019 18:10:27 +0100
Message-Id: <20191120171027.1102250-3-paul@crapouillou.net>
In-Reply-To: <20191120171027.1102250-1-paul@crapouillou.net>
References: <20191120171027.1102250-1-paul@crapouillou.net>
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 21 Nov 2019 07:59:20 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=crapouillou.net; 
 s=mail; t=1574269837; h=from:from:sender:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Q7XM9VKEul3WoIle4adCI8wIKzVFhhXtSEViQ1Z4XrQ=;
 b=TdN7U5ylrFeveewEL9FpwmfbR1Pp9uHzNKPAoE4pE6mNPqn6fvXCceCHOCCVe+Ms3wNTKZ
 2PuV+gO+0cZ/CmM5M2b7m+fn/DPmp3qmqer1HSe6uc24+Rp9lUSgVSCOiKrrbb4UErusdG
 mscwdhuIDkoTz/ytUkAJbxseUOfBpRs=
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
Cc: Paul Cercueil <paul@crapouillou.net>, devicetree@vger.kernel.org,
 od@zcrc.me, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhlIEZSRDM1MEg1NDAwNCBpcyBhIHNpbXBsZSAzLjUiIDMyMHgyNDAgMjQtYml0IFRGVCBwYW5l
bCwgZm91bmQgZm9yCmluc3RhbmNlIGluc2lkZSB0aGUgQW5iZXJuaWMgUkctMzUwIGhhbmRoZWxk
IGdhbWluZyBjb25zb2xlLgoKU2lnbmVkLW9mZi1ieTogUGF1bCBDZXJjdWVpbCA8cGF1bEBjcmFw
b3VpbGxvdS5uZXQ+Ci0tLQogZHJpdmVycy9ncHUvZHJtL3BhbmVsL3BhbmVsLXNpbXBsZS5jIHwg
MjkgKysrKysrKysrKysrKysrKysrKysrKysrKysrKwogMSBmaWxlIGNoYW5nZWQsIDI5IGluc2Vy
dGlvbnMoKykKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vcGFuZWwvcGFuZWwtc2ltcGxl
LmMgYi9kcml2ZXJzL2dwdS9kcm0vcGFuZWwvcGFuZWwtc2ltcGxlLmMKaW5kZXggMjhmYTZiYTdi
NzY3Li44YzAzZjdmZTQ2MWMgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9wYW5lbC9wYW5l
bC1zaW1wbGUuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vcGFuZWwvcGFuZWwtc2ltcGxlLmMKQEAg
LTEzNzgsNiArMTM3OCwzMiBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IHBhbmVsX2Rlc2MgZXZlcnZp
c2lvbl92Z2c4MDQ4MjEgPSB7CiAJLmJ1c19mbGFncyA9IERSTV9CVVNfRkxBR19ERV9ISUdIIHwg
RFJNX0JVU19GTEFHX1BJWERBVEFfTkVHRURHRSwKIH07CiAKK3N0YXRpYyBjb25zdCBzdHJ1Y3Qg
ZHJtX2Rpc3BsYXlfbW9kZSBmcmlkYV9mcmQzNTBoNTQwMDRfbW9kZSA9IHsKKwkuY2xvY2sgPSA2
Nzc3LAorCS5oZGlzcGxheSA9IDMyMCwKKwkuaHN5bmNfc3RhcnQgPSAzMjAgKyA3MCwKKwkuaHN5
bmNfZW5kID0gMzIwICsgNzAgKyA1MCwKKwkuaHRvdGFsID0gMzIwICsgNzAgKyA1MCArIDEwLAor
CS52ZGlzcGxheSA9IDI0MCwKKwkudnN5bmNfc3RhcnQgPSAyNDAgKyA1LAorCS52c3luY19lbmQg
PSAyNDAgKyA1ICsgMSwKKwkudnRvdGFsID0gMjQwICsgNSArIDEgKyA1LAorCS52cmVmcmVzaCA9
IDYwLAorCS5mbGFncyA9IERSTV9NT0RFX0ZMQUdfUEhTWU5DIHwgRFJNX01PREVfRkxBR19QVlNZ
TkMsCit9OworCitzdGF0aWMgY29uc3Qgc3RydWN0IHBhbmVsX2Rlc2MgZnJpZGFfZnJkMzUwaDU0
MDA0ID0geworCS5tb2RlcyA9ICZmcmlkYV9mcmQzNTBoNTQwMDRfbW9kZSwKKwkubnVtX21vZGVz
ID0gMSwKKwkuYnBjID0gOCwKKwkuc2l6ZSA9IHsKKwkJLndpZHRoID0gNzcsCisJCS5oZWlnaHQg
PSA2NCwKKwl9LAorCS5idXNfZm9ybWF0ID0gTUVESUFfQlVTX0ZNVF9SR0I4ODhfMVgyNCwKKwku
YnVzX2ZsYWdzID0gRFJNX0JVU19GTEFHX0RFX0hJR0ggfCBEUk1fQlVTX0ZMQUdfUElYREFUQV9Q
T1NFREdFLAorfTsKKwogc3RhdGljIGNvbnN0IHN0cnVjdCBkcm1fZGlzcGxheV9tb2RlIGZveGxp
bmtfZmw1MDB3dnIwMF9hMHRfbW9kZSA9IHsKIAkuY2xvY2sgPSAzMjI2MCwKIAkuaGRpc3BsYXkg
PSA4MDAsCkBAIC0zMTg2LDYgKzMyMTIsOSBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IG9mX2Rldmlj
ZV9pZCBwbGF0Zm9ybV9vZl9tYXRjaFtdID0gewogCX0sIHsKIAkJLmNvbXBhdGlibGUgPSAiZXZl
cnZpc2lvbix2Z2c4MDQ4MjEiLAogCQkuZGF0YSA9ICZldmVydmlzaW9uX3ZnZzgwNDgyMSwKKwl9
LCB7CisJCS5jb21wYXRpYmxlID0gImZyaWRhLGZyZDM1MGg1NDAwNCIsCisJCS5kYXRhID0gJmZy
aWRhX2ZyZDM1MGg1NDAwNCwKIAl9LCB7CiAJCS5jb21wYXRpYmxlID0gImZveGxpbmssZmw1MDB3
dnIwMC1hMHQiLAogCQkuZGF0YSA9ICZmb3hsaW5rX2ZsNTAwd3ZyMDBfYTB0LAotLSAKMi4yNC4w
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2
ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9s
aXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
