Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C34AB0938
	for <lists+dri-devel@lfdr.de>; Thu, 12 Sep 2019 09:08:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 40FAC6EBBC;
	Thu, 12 Sep 2019 07:08:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.andi.de1.cc (mail.andi.de1.cc
 [IPv6:2a01:238:4321:8900:456f:ecd6:43e:202c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E13B6E02C
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Sep 2019 20:25:25 +0000 (UTC)
Received: from p200300ccff0b59001a3da2fffebfd33a.dip0.t-ipconnect.de
 ([2003:cc:ff0b:5900:1a3d:a2ff:febf:d33a] helo=aktux)
 by mail.andi.de1.cc with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.89) (envelope-from <andreas@kemnade.info>)
 id 1i89Aw-0003L7-B7; Wed, 11 Sep 2019 22:25:14 +0200
Date: Wed, 11 Sep 2019 22:25:13 +0200
From: Andreas Kemnade <andreas@kemnade.info>
To: Dan Murphy <dmurphy@ti.com>
Subject: Re: [PATCH v2 2/2] backlight: lm3630a: add an enable gpio for the
 HWEN pin
Message-ID: <20190911222513.489b5235@aktux>
In-Reply-To: <a3f10318-11f4-3b78-47e5-d9add8a46791@ti.com>
References: <20190910212909.18095-1-andreas@kemnade.info>
 <20190910212909.18095-3-andreas@kemnade.info>
 <20190911102533.not4ta3xwgm6bhjo@holly.lan>
 <a3f10318-11f4-3b78-47e5-d9add8a46791@ti.com>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-Spam-Score: -1.0 (-)
X-Mailman-Approved-At: Thu, 12 Sep 2019 07:07:54 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; 
 d=kemnade.info; s=20180802; h=Content-Transfer-Encoding:Content-Type:
 MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Sender
 :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=KHbCcZ8BvWWbKPSh5z+H7SgPQzQ4ifBlCer1pX9BQL0=; b=hf05DHewho7GMIGCsH6/PGeoio
 TGv5pVTLJKtBGYQuR9O23JhXG5QQBFQf0V2+KLqVOFIomAerLdkInBvA12Nh22VovQPgot39NQJJF
 064uTu5vshQfNEAFAkSfKJs+GTMkN5eWl7TkiwuP9es2KdReiUOZjp8+XSaY1uEhNT6s=;
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
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org,
 Daniel Thompson <daniel.thompson@linaro.org>, b.zolnierkie@samsung.com,
 jingoohan1@gmail.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 robh+dt@kernel.org, jacek.anaszewski@gmail.com, pavel@ucw.cz,
 "H. Nikolaus Schaller" <hns@goldelico.com>, lee.jones@linaro.org,
 linux-leds@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCAxMSBTZXAgMjAxOSAxMzo0ODozNiAtMDUwMApEYW4gTXVycGh5IDxkbXVycGh5QHRp
LmNvbT4gd3JvdGU6CgoKPiA+PiBAQCAtNTM1LDYgKzUzOCwxMyBAQCBzdGF0aWMgaW50IGxtMzYz
MGFfcHJvYmUoc3RydWN0IGkyY19jbGllbnQgKmNsaWVudCwKPiA+PiAgIAl9Cj4gPj4gICAJcGNo
aXAtPnBkYXRhID0gcGRhdGE7Cj4gPj4gICAKPiA+PiArCXBjaGlwLT5lbmFibGVfZ3BpbyA9IGRl
dm1fZ3Bpb2RfZ2V0X29wdGlvbmFsKCZjbGllbnQtPmRldiwgImVuYWJsZSIsCj4gPj4gKwkJCQkJ
CUdQSU9EX09VVF9ISUdIKTsKPiA+PiArCWlmIChJU19FUlIocGNoaXAtPmVuYWJsZV9ncGlvKSkg
ewo+ID4+ICsJCXJ2YWwgPSBQVFJfRVJSKHBjaGlwLT5lbmFibGVfZ3Bpbyk7Cj4gPj4gKwkJcmV0
dXJuIHJ2YWw7ICAKPiAKPiB0aGUgZW5hYmxlIGdwaW8gaXMgb3B0aW9uYWwgc28gaWYgaXQgZmFp
bHMgeW91IGxvZyB0aGUgZXJyb3IgYW5kIG1vdmUgb24KPgp3ZWxsLCBpZiB0aGUgZ3BpbyBpcyBu
b3QgdGhlcmUsIHRoZW4gaXQgcmV0dXJucyBOVUxMLgpJdCBtaWdodCByZXR1cm4gZS5nLiAtRURF
RkVSLiBTbyBJIG5lZWQgdG8gY2hlY2sgZm9yIGVycm9ycyBoZXJlLgogCj4gQWxzbyBvbiBkcml2
ZXIgcmVtb3ZhbCBkaWQgeW91IHdhbnQgdG8gc2V0IHRoZSBHUElPIHRvIGxvdyB0byBkaXNhYmxl
IAo+IHRoZSBkZXZpY2UgdG8gc2F2ZSBwb3dlcj8KPiAKcGFnZSA1IG9mIHRoZSBkYXRhc2hlZXQg
c2F5czoKCklzaGRuID0gVHlwLiAxwrVBIG1heC4gNMK1QS4KRm9yIEhXRU49VmluLCBJMmMgc2h1
dGRvd24gIChJIGd1ZXNzIHRoaXMgbWVhbnMgb3V0cHV0cyBwb3dlcmVkIG9mZikKb25kIGZvciBI
V0VOPUdORC4KClNvIGFyZSB3ZSByZWFsbHkgc2F2aW5nIHNvbWV0aGluZyBoZXJlPwoKUmVnYXJk
cywKQW5kcmVhcwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcK
aHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
