Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A0F317219F
	for <lists+dri-devel@lfdr.de>; Thu, 27 Feb 2020 15:53:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 858BB6ECCC;
	Thu, 27 Feb 2020 14:53:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 56DCA6ECCC
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Feb 2020 14:53:53 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0540B30E;
 Thu, 27 Feb 2020 06:53:53 -0800 (PST)
Received: from e110455-lin.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com
 [10.121.207.14])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id DADA53F7B4;
 Thu, 27 Feb 2020 06:53:52 -0800 (PST)
Received: by e110455-lin.cambridge.arm.com (Postfix, from userid 1000)
 id A8D62682F2C; Thu, 27 Feb 2020 14:53:51 +0000 (GMT)
Date: Thu, 27 Feb 2020 14:53:51 +0000
From: Liviu Dudau <liviu.dudau@arm.com>
To: Wambui Karuga <wambui.karugax@gmail.com>
Subject: Re: [PATCH 21/21] drm/arm: have malidp_debufs_init() return void
Message-ID: <20200227145351.GZ364558@e110455-lin.cambridge.arm.com>
References: <20200227120232.19413-1-wambui.karugax@gmail.com>
 <20200227120232.19413-22-wambui.karugax@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200227120232.19413-22-wambui.karugax@gmail.com>
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
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
Cc: airlied@linux.ie, gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBGZWIgMjcsIDIwMjAgYXQgMDM6MDI6MzJQTSArMDMwMCwgV2FtYnVpIEthcnVnYSB3
cm90ZToKPiBBcyB0aGVyZSdzIG5vIG5lZWQgZm9yIHRoZSByZXR1cm4gdmFsdWUgaW4gbWFsaWRw
X2RlYnVnZnNfaW5pdCgpIGFmdGVyCj4gdGhlIGNvbnZlcnNpb24gb2YgdGhlIGRybV9kcml2ZXIu
ZGVidWdmc19pbml0KCkgaG9vaywgKGRybTogY29udmVydCB0aGUKPiAuZGVidWdzX2luaXQoKSBo
b29rIHRvIHJldHVybiB2b2lkKSwgY29udmVydCB0aGUgbWFsaWRwX2RlYnVnZnNfaW5pdCgpCj4g
ZnVuY3Rpb24gdG8gcmV0dXJuIHZvaWQuCj4gCj4gU2lnbmVkLW9mZi1ieTogV2FtYnVpIEthcnVn
YSA8d2FtYnVpLmthcnVnYXhAZ21haWwuY29tPgoKQWNrZWQtYnk6IExpdml1IER1ZGF1IDxsaXZp
dS5kdWRhdUBhcm0uY29tPgoKVGhhbmtzIQpMaXZpdQoKPiAtLS0KPiAgZHJpdmVycy9ncHUvZHJt
L2FybS9tYWxpZHBfZHJ2LmMgfCAzICstLQo+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24o
KyksIDIgZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hcm0v
bWFsaWRwX2Rydi5jIGIvZHJpdmVycy9ncHUvZHJtL2FybS9tYWxpZHBfZHJ2LmMKPiBpbmRleCAz
N2Q5MmEwNjMxOGUuLmRlZjhjOWZmYWZjYSAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0v
YXJtL21hbGlkcF9kcnYuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hcm0vbWFsaWRwX2Rydi5j
Cj4gQEAgLTU0OCw3ICs1NDgsNyBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IGZpbGVfb3BlcmF0aW9u
cyBtYWxpZHBfZGVidWdmc19mb3BzID0gewo+ICAJLnJlbGVhc2UgPSBzaW5nbGVfcmVsZWFzZSwK
PiAgfTsKPiAgCj4gLXN0YXRpYyBpbnQgbWFsaWRwX2RlYnVnZnNfaW5pdChzdHJ1Y3QgZHJtX21p
bm9yICptaW5vcikKPiArc3RhdGljIHZvaWQgbWFsaWRwX2RlYnVnZnNfaW5pdChzdHJ1Y3QgZHJt
X21pbm9yICptaW5vcikKPiAgewo+ICAJc3RydWN0IG1hbGlkcF9kcm0gKm1hbGlkcCA9IG1pbm9y
LT5kZXYtPmRldl9wcml2YXRlOwo+ICAKPiBAQCAtNTU3LDcgKzU1Nyw2IEBAIHN0YXRpYyBpbnQg
bWFsaWRwX2RlYnVnZnNfaW5pdChzdHJ1Y3QgZHJtX21pbm9yICptaW5vcikKPiAgCXNwaW5fbG9j
a19pbml0KCZtYWxpZHAtPmVycm9yc19sb2NrKTsKPiAgCWRlYnVnZnNfY3JlYXRlX2ZpbGUoImRl
YnVnIiwgU19JUlVHTyB8IFNfSVdVU1IsIG1pbm9yLT5kZWJ1Z2ZzX3Jvb3QsCj4gIAkJCSAgICBt
aW5vci0+ZGV2LCAmbWFsaWRwX2RlYnVnZnNfZm9wcyk7Cj4gLQlyZXR1cm4gMDsKPiAgfQo+ICAK
PiAgI2VuZGlmIC8vQ09ORklHX0RFQlVHX0ZTCj4gLS0gCj4gMi4yNS4wCj4gCgotLSAKPT09PT09
PT09PT09PT09PT09PT0KfCBJIHdvdWxkIGxpa2UgdG8gfAp8IGZpeCB0aGUgd29ybGQsICB8Cnwg
YnV0IHRoZXkncmUgbm90IHwKfCBnaXZpbmcgbWUgdGhlICAgfAogXCBzb3VyY2UgY29kZSEgIC8K
ICAtLS0tLS0tLS0tLS0tLS0KICAgIMKvXF8o44OEKV8vwq8KX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2
ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21h
aWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
