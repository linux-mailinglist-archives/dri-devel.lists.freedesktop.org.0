Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 169E3AF64E
	for <lists+dri-devel@lfdr.de>; Wed, 11 Sep 2019 09:01:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2919F6EA25;
	Wed, 11 Sep 2019 07:01:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.andi.de1.cc (mail.andi.de1.cc
 [IPv6:2a01:238:4321:8900:456f:ecd6:43e:202c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EAD28899BE
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Sep 2019 21:29:40 +0000 (UTC)
Received: from p200300ccff17ef001a3da2fffebfd33a.dip0.t-ipconnect.de
 ([2003:cc:ff17:ef00:1a3d:a2ff:febf:d33a] helo=aktux)
 by mail.andi.de1.cc with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.89) (envelope-from <andreas@kemnade.info>)
 id 1i7nhf-0001id-DV; Tue, 10 Sep 2019 23:29:35 +0200
Received: from andi by aktux with local (Exim 4.92)
 (envelope-from <andreas@kemnade.info>)
 id 1i7nhe-0004ik-Th; Tue, 10 Sep 2019 23:29:34 +0200
From: Andreas Kemnade <andreas@kemnade.info>
To: lee.jones@linaro.org, daniel.thompson@linaro.org, jingoohan1@gmail.com,
 jacek.anaszewski@gmail.com, pavel@ucw.cz, dmurphy@ti.com,
 robh+dt@kernel.org, mark.rutland@arm.com, b.zolnierkie@samsung.com,
 dri-devel@lists.freedesktop.org, linux-leds@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-fbdev@vger.kernel.org, "H. Nikolaus Schaller" <hns@goldelico.com>
Subject: [PATCH v2 1/2] dt-bindings: backlight: lm3630a: add enable_gpios
Date: Tue, 10 Sep 2019 23:29:08 +0200
Message-Id: <20190910212909.18095-2-andreas@kemnade.info>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190910212909.18095-1-andreas@kemnade.info>
References: <20190910212909.18095-1-andreas@kemnade.info>
MIME-Version: 1.0
X-Spam-Score: -1.0 (-)
X-Mailman-Approved-At: Wed, 11 Sep 2019 07:01:13 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; 
 d=kemnade.info; s=20180802; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Dk2cypFp9qRpGk+x/WI3YUW36HoBZTZBqKH2frB5PD4=; b=Izn17ZFma0evvGmBQDZxmLni0R
 HXOg5DQ5qjJLlPOEUCKD26G+ZT1QiaWtj/6JESRhVjm8weV2TIhziqkxRY6AJNN8qz3A+zaffogdN
 otbKK1wAEO9mGfJzd2BkqWZ6GXIlNP9hwrtRgEsVtqkLwmxuzSvaM+yUUODtcWY439qA=;
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
cmVhcyBLZW1uYWRlIDxhbmRyZWFzQGtlbW5hZGUuaW5mbz4KLS0tCmNoYW5nZXMgaW4gdjI6IGFk
ZCBleGFtcGxlCiAuLi4vYmluZGluZ3MvbGVkcy9iYWNrbGlnaHQvbG0zNjMwYS1iYWNrbGlnaHQu
eWFtbCAgICAgICAgICAgfCA1ICsrKysrCiAxIGZpbGUgY2hhbmdlZCwgNSBpbnNlcnRpb25zKCsp
CgpkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2xlZHMvYmFj
a2xpZ2h0L2xtMzYzMGEtYmFja2xpZ2h0LnlhbWwgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUv
YmluZGluZ3MvbGVkcy9iYWNrbGlnaHQvbG0zNjMwYS1iYWNrbGlnaHQueWFtbAppbmRleCBkYzEy
OWQ5YTMyOWUuLjFmYTgzZmVmZmUxNiAxMDA2NDQKLS0tIGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0
cmVlL2JpbmRpbmdzL2xlZHMvYmFja2xpZ2h0L2xtMzYzMGEtYmFja2xpZ2h0LnlhbWwKKysrIGIv
RG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2xlZHMvYmFja2xpZ2h0L2xtMzYzMGEt
YmFja2xpZ2h0LnlhbWwKQEAgLTI5LDYgKzI5LDEwIEBAIHByb3BlcnRpZXM6CiAgICcjc2l6ZS1j
ZWxscyc6CiAgICAgY29uc3Q6IDAKIAorICBlbmFibGUtZ3Bpb3M6CisgICAgZGVzY3JpcHRpb246
IEdQSU8gdG8gdXNlIHRvIGVuYWJsZS9kaXNhYmxlIHRoZSBiYWNrbGlnaHQgKEhXRU4gcGluKS4K
KyAgICBtYXhJdGVtczogMQorCiByZXF1aXJlZDoKICAgLSBjb21wYXRpYmxlCiAgIC0gcmVnCkBA
IC05Miw2ICs5Niw3IEBAIGV4YW1wbGVzOgogICAgIGkyYyB7CiAgICAgICAgICNhZGRyZXNzLWNl
bGxzID0gPDE+OwogICAgICAgICAjc2l6ZS1jZWxscyA9IDwwPjsKKyAgICAgICAgZW5hYmxlLWdw
aW9zID0gPCZncGlvMiA1IEdQSU9fQUNUSVZFX0hJR0g+OwogCiAgICAgICAgIGxlZC1jb250cm9s
bGVyQDM4IHsKICAgICAgICAgICAgICAgICBjb21wYXRpYmxlID0gInRpLGxtMzYzMGEiOwotLSAK
Mi4yMC4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpk
cmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
