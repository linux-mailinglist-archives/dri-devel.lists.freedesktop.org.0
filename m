Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A4B743D542
	for <lists+dri-devel@lfdr.de>; Tue, 11 Jun 2019 20:12:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 060EF89198;
	Tue, 11 Jun 2019 18:12:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 437F089198
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Jun 2019 18:12:01 +0000 (UTC)
Received: from pendragon.ideasonboard.com
 (dfj612yhrgyx302h3jwwy-3.rev.dnainternet.fi
 [IPv6:2001:14ba:21f5:5b00:ce28:277f:58d7:3ca4])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id D91041031;
 Tue, 11 Jun 2019 20:11:59 +0200 (CEST)
Date: Tue, 11 Jun 2019 21:11:44 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Michael Drake <michael.drake@codethink.co.uk>
Subject: Re: [PATCH v1 07/11] ti948: Add sysfs node for alive attribute
Message-ID: <20190611181144.GV5016@pendragon.ideasonboard.com>
References: <20190611140412.32151-1-michael.drake@codethink.co.uk>
 <20190611140412.32151-8-michael.drake@codethink.co.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190611140412.32151-8-michael.drake@codethink.co.uk>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=ideasonboard.com; s=mail; t=1560276720;
 bh=3URVGJMkojHdz0AK8/MsWlGeE84oCMlsn1bjeK37hp0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=BGo5QaYfk/rE48eqvrFabjZ+rp8Vh2vmiTd2/+OaRiPdLF23veCE7jvUgtW6GBBGb
 xwH0L5OAn3w8ITiNa4Xzt9R+ZfvdxIfR8fmGnHuE0nYwDHdhfxz2qV22esm8gm88aT
 Ola/4bgITvHPvGgbN0TpuVKIsGIudAXpM5MtRW+8=
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Nate Case <ncase@tesla.com>,
 Rob Herring <robh+dt@kernel.org>, linux-kernel@lists.codethink.co.uk,
 Patrick Glaser <pglaser@tesla.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgTWljaGFlbCwKClRoYW5rIHlvdSBmb3IgdGhlIHBhdGNoLgoKT24gVHVlLCBKdW4gMTEsIDIw
MTkgYXQgMDM6MDQ6MDhQTSArMDEwMCwgTWljaGFlbCBEcmFrZSB3cm90ZToKPiBUaGlzIG1heSBi
ZSB1c2VkIGJ5IHVzZXJzcGFjZSB0byBkZXRlcm1pbmUgdGhlIHN0YXRlCj4gb2YgdGhlIGRldmlj
ZS4KCldoeSBpcyB0aGlzIG5lZWRlZCA/IFVzZXJzcGFjZSBzaG91bGRuJ3QgZXZlbiBiZSBhd2Fy
ZSB0aGF0IHRoaXMgZGV2aWNlCmV4aXN0cy4KCj4gU2lnbmVkLW9mZi1ieTogTWljaGFlbCBEcmFr
ZSA8bWljaGFlbC5kcmFrZUBjb2RldGhpbmsuY28udWs+Cj4gQ2M6IFBhdHJpY2sgR2xhc2VyIDxw
Z2xhc2VyQHRlc2xhLmNvbT4KPiBDYzogTmF0ZSBDYXNlIDxuY2FzZUB0ZXNsYS5jb20+Cj4gLS0t
Cj4gIGRyaXZlcnMvZ3B1L2RybS9icmlkZ2UvdGk5NDguYyB8IDI4ICsrKysrKysrKysrKysrKysr
KysrKysrKysrLS0KPiAgMSBmaWxlIGNoYW5nZWQsIDI2IGluc2VydGlvbnMoKyksIDIgZGVsZXRp
b25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2UvdGk5NDguYyBi
L2RyaXZlcnMvZ3B1L2RybS9icmlkZ2UvdGk5NDguYwo+IGluZGV4IGI1Yzc2NjcxMWM0Yi4uYjYy
NGVhZWFiYjQzIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2UvdGk5NDguYwo+
ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2UvdGk5NDguYwo+IEBAIC00MTIsNiArNDEyLDE2
IEBAIHN0YXRpYyB2b2lkIHRpOTQ4X2FsaXZlX2NoZWNrKHN0cnVjdCB3b3JrX3N0cnVjdCAqd29y
aykKPiAgCXNjaGVkdWxlX2RlbGF5ZWRfd29yaygmdGk5NDgtPmFsaXZlX2NoZWNrLCBUSTk0OF9B
TElWRV9DSEVDS19ERUxBWSk7Cj4gIH0KPiAgCj4gK3N0YXRpYyBzc2l6ZV90IGFsaXZlX3Nob3co
c3RydWN0IGRldmljZSAqZGV2LAo+ICsJCXN0cnVjdCBkZXZpY2VfYXR0cmlidXRlICphdHRyLCBj
aGFyICpidWYpCj4gK3sKPiArCXN0cnVjdCB0aTk0OF9jdHggKnRpOTQ4ID0gdGk5NDhfY3R4X2Zy
b21fZGV2KGRldik7Cj4gKwo+ICsJcmV0dXJuIHNjbnByaW50ZihidWYsIFBBR0VfU0laRSwgIiV1
XG4iLCAodW5zaWduZWQgaW50KXRpOTQ4LT5hbGl2ZSk7Cj4gK30KPiArCj4gK3N0YXRpYyBERVZJ
Q0VfQVRUUl9STyhhbGl2ZSk7Cj4gKwo+ICBzdGF0aWMgaW50IHRpOTQ4X3BtX3Jlc3VtZShzdHJ1
Y3QgZGV2aWNlICpkZXYpCj4gIHsKPiAgCXN0cnVjdCB0aTk0OF9jdHggKnRpOTQ4ID0gdGk5NDhf
Y3R4X2Zyb21fZGV2KGRldik7Cj4gQEAgLTYxNCwxNyArNjI0LDMxIEBAIHN0YXRpYyBpbnQgdGk5
NDhfcHJvYmUoc3RydWN0IGkyY19jbGllbnQgKmNsaWVudCwKPiAgCj4gIAlpMmNfc2V0X2NsaWVu
dGRhdGEoY2xpZW50LCB0aTk0OCk7Cj4gIAo+ICsJcmV0ID0gZGV2aWNlX2NyZWF0ZV9maWxlKCZj
bGllbnQtPmRldiwgJmRldl9hdHRyX2FsaXZlKTsKPiArCWlmIChyZXQpIHsKPiArCQlkZXZfZXJy
KCZjbGllbnQtPmRldiwgIkNvdWxkIG5vdCBjcmVhdGUgYWxpdmUgYXR0clxuIik7Cj4gKwkJcmV0
dXJuIHJldDsKPiArCX0KPiArCj4gIAlyZXQgPSB0aTk0OF9wbV9yZXN1bWUoJmNsaWVudC0+ZGV2
KTsKPiAtCWlmIChyZXQgIT0gMCkKPiAtCQlyZXR1cm4gLUVQUk9CRV9ERUZFUjsKPiArCWlmIChy
ZXQgIT0gMCkgewo+ICsJCXJldCA9IC1FUFJPQkVfREVGRVI7Cj4gKwkJZ290byBlcnJvcjsKPiAr
CX0KPiAgCj4gIAlkZXZfaW5mbygmdGk5NDgtPmkyYy0+ZGV2LCAiRW5kIHByb2JlIChhZGRyOiAl
eClcbiIsIHRpOTQ4LT5pMmMtPmFkZHIpOwo+ICAKPiAgCXJldHVybiAwOwo+ICsKPiArZXJyb3I6
Cj4gKwlkZXZpY2VfcmVtb3ZlX2ZpbGUoJmNsaWVudC0+ZGV2LCAmZGV2X2F0dHJfYWxpdmUpOwo+
ICsJcmV0dXJuIHJldDsKPiAgfQo+ICAKPiAgc3RhdGljIGludCB0aTk0OF9yZW1vdmUoc3RydWN0
IGkyY19jbGllbnQgKmNsaWVudCkKPiAgewo+ICsJZGV2aWNlX3JlbW92ZV9maWxlKCZjbGllbnQt
PmRldiwgJmRldl9hdHRyX2FsaXZlKTsKPiArCj4gIAlyZXR1cm4gdGk5NDhfcG1fc3VzcGVuZCgm
Y2xpZW50LT5kZXYpOwo+ICB9Cj4gIAoKLS0gClJlZ2FyZHMsCgpMYXVyZW50IFBpbmNoYXJ0Cl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBt
YWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3Rz
LmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
