Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DDAAFAF64C
	for <lists+dri-devel@lfdr.de>; Wed, 11 Sep 2019 09:01:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF9906EA22;
	Wed, 11 Sep 2019 07:01:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.andi.de1.cc (mail.andi.de1.cc
 [IPv6:2a01:238:4321:8900:456f:ecd6:43e:202c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D3EA66E9BE
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Sep 2019 21:29:23 +0000 (UTC)
Received: from p200300ccff17ef001a3da2fffebfd33a.dip0.t-ipconnect.de
 ([2003:cc:ff17:ef00:1a3d:a2ff:febf:d33a] helo=aktux)
 by mail.andi.de1.cc with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.89) (envelope-from <andreas@kemnade.info>)
 id 1i7nhJ-0001iA-QI; Tue, 10 Sep 2019 23:29:14 +0200
Received: from andi by aktux with local (Exim 4.92)
 (envelope-from <andreas@kemnade.info>)
 id 1i7nhJ-0004ig-C2; Tue, 10 Sep 2019 23:29:13 +0200
From: Andreas Kemnade <andreas@kemnade.info>
To: lee.jones@linaro.org, daniel.thompson@linaro.org, jingoohan1@gmail.com,
 jacek.anaszewski@gmail.com, pavel@ucw.cz, dmurphy@ti.com,
 robh+dt@kernel.org, mark.rutland@arm.com, b.zolnierkie@samsung.com,
 dri-devel@lists.freedesktop.org, linux-leds@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-fbdev@vger.kernel.org, "H. Nikolaus Schaller" <hns@goldelico.com>
Subject: [PATCH v2 0/2] backlight_lm3630a: add enable_gpios property
Date: Tue, 10 Sep 2019 23:29:07 +0200
Message-Id: <20190910212909.18095-1-andreas@kemnade.info>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Spam-Score: -1.0 (-)
X-Mailman-Approved-At: Wed, 11 Sep 2019 07:01:13 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; 
 d=kemnade.info; s=20180802; h=Content-Transfer-Encoding:MIME-Version:
 Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=xcg8PAW6M2blaLHjGv+8B+4Y3q8SjsFw7wRNh6L6zik=; b=UoVv0ryYF7R4K8jEIuCSAsrqXH
 Iju2/vSh7ahNGK2uVpKYuL5s/mmoQ2O3WHtAEEDCcQ5OwHJ24ox3iae2CGYB6IA8WabONRdHXI144
 zuWwVVFdD7CjZmByfnj5Ii0iO0ItMMwLuNFnbt9ZW1hmy5ivzkJiCov/5fNQC07tRlaY=;
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

VG8gYmUgYWJsZSB0byBoYW5kbGUgdGhlIEhXRU4gcGluIG9mIHRoZSBsbTM2MzBhLCBhZGQKYW4g
ZW5hYmxlIGdwaW8gdG8gdGhlIGRyaXZlciBhbmQgYSBwcm9wZXJ0eS4KClRlc3RlZCBvbiBLb2Jv
IENsYXJhIEhELgoKQ2hhbmdlcyBpbiB2MjoKc2ltcGxpZmljYXRpb24gYW5kIHJlb3JkZXJpbmcK
CkFuZHJlYXMgS2VtbmFkZSAoMik6CiAgZHQtYmluZGluZ3M6IGJhY2tsaWdodDogbG0zNjMwYTog
YWRkIGVuYWJsZV9ncGlvcwogIGJhY2tsaWdodDogbG0zNjMwYTogYWRkIGFuIGVuYWJsZSBncGlv
IGZvciB0aGUgSFdFTiBwaW4KCiAuLi4vYmluZGluZ3MvbGVkcy9iYWNrbGlnaHQvbG0zNjMwYS1i
YWNrbGlnaHQueWFtbCAgICAgfCAgNSArKysrKwogZHJpdmVycy92aWRlby9iYWNrbGlnaHQvbG0z
NjMwYV9ibC5jICAgICAgICAgICAgICAgICAgIHwgMTAgKysrKysrKysrKwogMiBmaWxlcyBjaGFu
Z2VkLCAxNSBpbnNlcnRpb25zKCspCgotLSAKMi4yMC4xCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZl
bEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFp
bG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
