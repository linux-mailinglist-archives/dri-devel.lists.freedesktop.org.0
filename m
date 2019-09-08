Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AD1B4AD3B7
	for <lists+dri-devel@lfdr.de>; Mon,  9 Sep 2019 09:23:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 95C0E89875;
	Mon,  9 Sep 2019 07:23:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.andi.de1.cc (mail.andi.de1.cc
 [IPv6:2a01:238:4321:8900:456f:ecd6:43e:202c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 85F8989789
 for <dri-devel@lists.freedesktop.org>; Sun,  8 Sep 2019 21:17:39 +0000 (UTC)
Received: from p200300ccff4729001a3da2fffebfd33a.dip0.t-ipconnect.de
 ([2003:cc:ff47:2900:1a3d:a2ff:febf:d33a] helo=aktux)
 by mail.andi.de1.cc with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.89) (envelope-from <andreas@kemnade.info>)
 id 1i73vq-0000wT-5M; Sun, 08 Sep 2019 22:37:10 +0200
Received: from andi by aktux with local (Exim 4.92)
 (envelope-from <andreas@kemnade.info>)
 id 1i73vp-0007rT-Sv; Sun, 08 Sep 2019 22:37:09 +0200
From: Andreas Kemnade <andreas@kemnade.info>
To: lee.jones@linaro.org, daniel.thompson@linaro.org, jingoohan1@gmail.com,
 jacek.anaszewski@gmail.com, pavel@ucw.cz, dmurphy@ti.com,
 robh+dt@kernel.org, mark.rutland@arm.com, b.zolnierkie@samsung.com,
 dri-devel@lists.freedesktop.org, linux-leds@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-fbdev@vger.kernel.org, "H. Nikolaus Schaller" <hns@goldelico.com>
Subject: [PATCH 2/2] dt-bindings: backlight: lm3630a: add enable_gpios
Date: Sun,  8 Sep 2019 22:37:04 +0200
Message-Id: <20190908203704.30147-3-andreas@kemnade.info>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190908203704.30147-1-andreas@kemnade.info>
References: <20190908203704.30147-1-andreas@kemnade.info>
MIME-Version: 1.0
X-Spam-Score: -1.0 (-)
X-Mailman-Approved-At: Mon, 09 Sep 2019 07:23:02 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; 
 d=kemnade.info; s=20180802; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=kpo4GcGSp/p9xK4M107Cs6yDAMCz9KA0m/IM/ACOm4E=; b=DU6vwmH4jkv/uSyC72u75opOru
 tJiAe0zAqAhQf8OWs+pSXGzo6uHU3Ab+7u5Byz3emvyTlLRzJuasaqMGR+n/1e6R0V/r6fL69nCRd
 TdEg4gpjSwZR97wFCRmmK5S6+FYXuE2J8xM3wGCEM0/TNagoJCLVOXbKseWO14fHBaAc=;
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
cmVhcyBLZW1uYWRlIDxhbmRyZWFzQGtlbW5hZGUuaW5mbz4KLS0tCiAuLi4vZGV2aWNldHJlZS9i
aW5kaW5ncy9sZWRzL2JhY2tsaWdodC9sbTM2MzBhLWJhY2tsaWdodC55YW1sIHwgNCArKysrCiAx
IGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlv
bi9kZXZpY2V0cmVlL2JpbmRpbmdzL2xlZHMvYmFja2xpZ2h0L2xtMzYzMGEtYmFja2xpZ2h0Lnlh
bWwgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbGVkcy9iYWNrbGlnaHQvbG0z
NjMwYS1iYWNrbGlnaHQueWFtbAppbmRleCBkYzEyOWQ5YTMyOWUuLmE5NjU2ZDcyYjY2OCAxMDA2
NDQKLS0tIGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2xlZHMvYmFja2xpZ2h0
L2xtMzYzMGEtYmFja2xpZ2h0LnlhbWwKKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2Jp
bmRpbmdzL2xlZHMvYmFja2xpZ2h0L2xtMzYzMGEtYmFja2xpZ2h0LnlhbWwKQEAgLTI5LDYgKzI5
LDEwIEBAIHByb3BlcnRpZXM6CiAgICcjc2l6ZS1jZWxscyc6CiAgICAgY29uc3Q6IDAKIAorICBl
bmFibGUtZ3Bpb3M6CisgICAgZGVzY3JpcHRpb246IEdQSU8gdG8gdXNlIHRvIGVuYWJsZS9kaXNh
YmxlIHRoZSBiYWNrbGlnaHQgKEhXRU4gcGluKS4KKyAgICBtYXhJdGVtczogMQorCiByZXF1aXJl
ZDoKICAgLSBjb21wYXRpYmxlCiAgIC0gcmVnCi0tIAoyLjIwLjEKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJp
LWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
