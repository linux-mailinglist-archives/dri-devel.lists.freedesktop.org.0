Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E914B0934
	for <lists+dri-devel@lfdr.de>; Thu, 12 Sep 2019 09:08:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB87B6EBAF;
	Thu, 12 Sep 2019 07:07:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.andi.de1.cc (mail.andi.de1.cc
 [IPv6:2a01:238:4321:8900:456f:ecd6:43e:202c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 242DE6E0E8
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Sep 2019 17:21:33 +0000 (UTC)
Received: from p200300ccff0b59001a3da2fffebfd33a.dip0.t-ipconnect.de
 ([2003:cc:ff0b:5900:1a3d:a2ff:febf:d33a] helo=aktux)
 by mail.andi.de1.cc with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.89) (envelope-from <andreas@kemnade.info>)
 id 1i86J4-0006kb-1A; Wed, 11 Sep 2019 19:21:26 +0200
Received: from andi by aktux with local (Exim 4.92)
 (envelope-from <andreas@kemnade.info>)
 id 1i86J3-0003M2-Oi; Wed, 11 Sep 2019 19:21:25 +0200
From: Andreas Kemnade <andreas@kemnade.info>
To: lee.jones@linaro.org, daniel.thompson@linaro.org, jingoohan1@gmail.com,
 jacek.anaszewski@gmail.com, pavel@ucw.cz, dmurphy@ti.com,
 robh+dt@kernel.org, mark.rutland@arm.com, b.zolnierkie@samsung.com,
 dri-devel@lists.freedesktop.org, linux-leds@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-fbdev@vger.kernel.org, "H. Nikolaus Schaller" <hns@goldelico.com>
Subject: [PATCH v3 1/2] dt-bindings: backlight: lm3630a: add enable_gpios
Date: Wed, 11 Sep 2019 19:21:05 +0200
Message-Id: <20190911172106.12843-2-andreas@kemnade.info>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190911172106.12843-1-andreas@kemnade.info>
References: <20190911172106.12843-1-andreas@kemnade.info>
MIME-Version: 1.0
X-Spam-Score: -1.0 (-)
X-Mailman-Approved-At: Thu, 12 Sep 2019 07:07:54 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; 
 d=kemnade.info; s=20180802; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=kjjUCqREd24BL7yzqZIG7ugFF4ygEUT5uM43q+3udrs=; b=GDJ6+n3GGRLWyDKAcc3TbP18HA
 LKjqSUnPBuuMSA2td6QiBl6mkODnsW8Zbo3tQHJ3B7BUaFLJHDwG8zLBKMpdvSMXPsrUTb7o7pquF
 1zrgvhvwVDPLL+PeQCi19KfIc9fm8lMQYgWIXEpFRcXZdL2kHySdWZS2oA6G2QSr0nj0=;
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
Cc: Andreas Kemnade <andreas@kemnade.info>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

YWRkIGVuYWJsZS1ncGlvcyB0byBkZXNjcmliZSBIV0VOIHBpbgoKU2lnbmVkLW9mZi1ieTogQW5k
cmVhcyBLZW1uYWRlIDxhbmRyZWFzQGtlbW5hZGUuaW5mbz4KQWNrZWQtYnk6IERhbmllbCBUaG9t
cHNvbiA8ZGFuaWVsLnRob21wc29uQGxpbmFyby5vcmc+Ci0tLQpjaGFuZ2VzIGluIHYyOiBhZGRl
ZCBleGFtcGxlCmNoYW5nZXMgaW4gdjM6IGFkZGVkIEFja2VkLWJ5CiAuLi4vYmluZGluZ3MvbGVk
cy9iYWNrbGlnaHQvbG0zNjMwYS1iYWNrbGlnaHQueWFtbCAgICAgICAgICAgfCA1ICsrKysrCiAx
IGZpbGUgY2hhbmdlZCwgNSBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlv
bi9kZXZpY2V0cmVlL2JpbmRpbmdzL2xlZHMvYmFja2xpZ2h0L2xtMzYzMGEtYmFja2xpZ2h0Lnlh
bWwgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbGVkcy9iYWNrbGlnaHQvbG0z
NjMwYS1iYWNrbGlnaHQueWFtbAppbmRleCBkYzEyOWQ5YTMyOWUuLjFmYTgzZmVmZmUxNiAxMDA2
NDQKLS0tIGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2xlZHMvYmFja2xpZ2h0
L2xtMzYzMGEtYmFja2xpZ2h0LnlhbWwKKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2Jp
bmRpbmdzL2xlZHMvYmFja2xpZ2h0L2xtMzYzMGEtYmFja2xpZ2h0LnlhbWwKQEAgLTI5LDYgKzI5
LDEwIEBAIHByb3BlcnRpZXM6CiAgICcjc2l6ZS1jZWxscyc6CiAgICAgY29uc3Q6IDAKIAorICBl
bmFibGUtZ3Bpb3M6CisgICAgZGVzY3JpcHRpb246IEdQSU8gdG8gdXNlIHRvIGVuYWJsZS9kaXNh
YmxlIHRoZSBiYWNrbGlnaHQgKEhXRU4gcGluKS4KKyAgICBtYXhJdGVtczogMQorCiByZXF1aXJl
ZDoKICAgLSBjb21wYXRpYmxlCiAgIC0gcmVnCkBAIC05Miw2ICs5Niw3IEBAIGV4YW1wbGVzOgog
ICAgIGkyYyB7CiAgICAgICAgICNhZGRyZXNzLWNlbGxzID0gPDE+OwogICAgICAgICAjc2l6ZS1j
ZWxscyA9IDwwPjsKKyAgICAgICAgZW5hYmxlLWdwaW9zID0gPCZncGlvMiA1IEdQSU9fQUNUSVZF
X0hJR0g+OwogCiAgICAgICAgIGxlZC1jb250cm9sbGVyQDM4IHsKICAgICAgICAgICAgICAgICBj
b21wYXRpYmxlID0gInRpLGxtMzYzMGEiOwotLSAKMi4yMC4xCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1k
ZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcv
bWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
