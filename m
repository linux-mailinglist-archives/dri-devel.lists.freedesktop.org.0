Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A2CE743665
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jun 2019 15:23:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A28DD899F2;
	Thu, 13 Jun 2019 13:23:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F80F899E8
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jun 2019 13:23:09 +0000 (UTC)
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl
 [83.86.89.107])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id B45782147A;
 Thu, 13 Jun 2019 13:23:08 +0000 (UTC)
Date: Thu, 13 Jun 2019 15:23:06 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH] panel: rocktech: no need to check return value of
 debugfs_create functions
Message-ID: <20190613132306.GA3903@kroah.com>
References: <20190613115717.GB26335@kroah.com>
 <20190613121616.GA5339@bogon.m.sigxcpu.org>
 <20190613130953.GN23020@phenom.ffwll.local>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190613130953.GN23020@phenom.ffwll.local>
User-Agent: Mutt/1.12.0 (2019-05-25)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1560432189;
 bh=al/cWFT4LdOFLQRt5vujPTahHoxd2xbB+Viw4DRXT8c=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=mhyK12BxdpTlyhK8l1EyjH12RA5R9W8EZozXEWcRuZRty6WdCHmzfH9Pto4d74M86
 1xmCKD/n71IMhgDZGnSV2iHh+F9z6tyfRsc91+O9rXD7AwX11EzJbLllKMdfyEPTO4
 pvOVuBmNo/Yuz4w17TkBPylAWFpRhH2G3yXxORJQ=
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
Cc: David Airlie <airlied@linux.ie>,
 Guido =?iso-8859-1?Q?G=FCnther?= <agx@sigxcpu.org>,
 Thierry Reding <thierry.reding@gmail.com>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBKdW4gMTMsIDIwMTkgYXQgMDM6MDk6NTNQTSArMDIwMCwgRGFuaWVsIFZldHRlciB3
cm90ZToKPiBPbiBUaHUsIEp1biAxMywgMjAxOSBhdCAwMjoxNjoxNlBNICswMjAwLCBHdWlkbyBH
w7xudGhlciB3cm90ZToKPiA+IEhpLAo+ID4gT24gVGh1LCBKdW4gMTMsIDIwMTkgYXQgMDE6NTc6
MTdQTSArMDIwMCwgR3JlZyBLcm9haC1IYXJ0bWFuIHdyb3RlOgo+ID4gPiBXaGVuIGNhbGxpbmcg
ZGVidWdmcyBmdW5jdGlvbnMsIHRoZXJlIGlzIG5vIG5lZWQgdG8gZXZlciBjaGVjayB0aGUKPiA+
ID4gcmV0dXJuIHZhbHVlLiAgVGhlIGZ1bmN0aW9uIGNhbiB3b3JrIG9yIG5vdCwgYnV0IHRoZSBj
b2RlIGxvZ2ljIHNob3VsZAo+ID4gPiBuZXZlciBkbyBzb21ldGhpbmcgZGlmZmVyZW50IGJhc2Vk
IG9uIHRoaXMuCj4gPiA+IAo+ID4gPiBDYzogIkd1aWRvIEfDvG50aGVyIiA8YWd4QHNpZ3hjcHUu
b3JnPgo+ID4gPiBDYzogVGhpZXJyeSBSZWRpbmcgPHRoaWVycnkucmVkaW5nQGdtYWlsLmNvbT4K
PiA+ID4gQ2M6IERhdmlkIEFpcmxpZSA8YWlybGllZEBsaW51eC5pZT4KPiA+ID4gQ2M6IERhbmll
bCBWZXR0ZXIgPGRhbmllbEBmZndsbC5jaD4KPiA+ID4gQ2M6IGRyaS1kZXZlbEBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcKPiA+ID4gU2lnbmVkLW9mZi1ieTogR3JlZyBLcm9haC1IYXJ0bWFuIDxncmVn
a2hAbGludXhmb3VuZGF0aW9uLm9yZz4KPiA+ID4gLS0tCj4gPiA+ICBkcml2ZXJzL2dwdS9kcm0v
cGFuZWwvcGFuZWwtcm9ja3RlY2gtamgwNTduMDA5MDAuYyB8IDE0ICsrKy0tLS0tLS0tLS0tCj4g
PiA+ICAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCAxMSBkZWxldGlvbnMoLSkKPiA+
ID4gCj4gPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vcGFuZWwvcGFuZWwtcm9ja3Rl
Y2gtamgwNTduMDA5MDAuYyBiL2RyaXZlcnMvZ3B1L2RybS9wYW5lbC9wYW5lbC1yb2NrdGVjaC1q
aDA1N24wMDkwMC5jCj4gPiA+IGluZGV4IGQ4OGVhOGRhMmVjMi4uNmRjYjY5MmM0NzAxIDEwMDY0
NAo+ID4gPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vcGFuZWwvcGFuZWwtcm9ja3RlY2gtamgwNTdu
MDA5MDAuYwo+ID4gPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vcGFuZWwvcGFuZWwtcm9ja3RlY2gt
amgwNTduMDA5MDAuYwo+ID4gPiBAQCAtMjU3LDIwICsyNTcsMTIgQEAgc3RhdGljIGludCBhbGxw
aXhlbHNvbl9zZXQodm9pZCAqZGF0YSwgdTY0IHZhbCkKPiA+ID4gIERFRklORV9TSU1QTEVfQVRU
UklCVVRFKGFsbHBpeGVsc29uX2ZvcHMsIE5VTEwsCj4gPiA+ICAJCQlhbGxwaXhlbHNvbl9zZXQs
ICIlbGx1XG4iKTsKPiA+ID4gIAo+ID4gPiAtc3RhdGljIGludCBqaDA1N25fZGVidWdmc19pbml0
KHN0cnVjdCBqaDA1N24gKmN0eCkKPiA+ID4gK3N0YXRpYyB2b2lkIGpoMDU3bl9kZWJ1Z2ZzX2lu
aXQoc3RydWN0IGpoMDU3biAqY3R4KQo+ID4gPiAgewo+ID4gPiAtCXN0cnVjdCBkZW50cnkgKmY7
Cj4gPiA+IC0KPiA+ID4gIAljdHgtPmRlYnVnZnMgPSBkZWJ1Z2ZzX2NyZWF0ZV9kaXIoRFJWX05B
TUUsIE5VTEwpOwo+ID4gPiAtCWlmICghY3R4LT5kZWJ1Z2ZzKQo+ID4gPiAtCQlyZXR1cm4gLUVO
T01FTTsKPiA+ID4gIAo+ID4gPiAtCWYgPSBkZWJ1Z2ZzX2NyZWF0ZV9maWxlKCJhbGxwaXhlbHNv
biIsIDA2MDAsCj4gPiA+IC0JCQkJY3R4LT5kZWJ1Z2ZzLCBjdHgsICZhbGxwaXhlbHNvbl9mb3Bz
KTsKPiA+ID4gLQlpZiAoIWYpCj4gPiA+IC0JCXJldHVybiAtRU5PTUVNOwo+ID4gPiAtCj4gPiA+
IC0JcmV0dXJuIDA7Cj4gPiA+ICsJZGVidWdmc19jcmVhdGVfZmlsZSgiYWxscGl4ZWxzb24iLCAw
NjAwLCBjdHgtPmRlYnVnZnMsIGN0eCwKPiA+ID4gKwkJCSAgICAmYWxscGl4ZWxzb25fZm9wcyk7
Cj4gPiA+ICB9Cj4gPiA+ICAKPiA+ID4gIHN0YXRpYyB2b2lkIGpoMDU3bl9kZWJ1Z2ZzX3JlbW92
ZShzdHJ1Y3QgamgwNTduICpjdHgpCj4gPiAKPiA+IFJldmlld2VkLWJ5OiBHdWlkbyBHw7xudGhl
ciA8YWd4QHNpZ3hjcHUub3JnPgo+IAo+IEFwcGxpZWQgdG8gZHJtLW1pc2MtbmV4dCwgdGhhbmtz
Lgo+IAo+IEZvciB0aGUgb3RoZXJzIEknbGwgYXNzdW1lIGRyaXZlcnMgbWFpbnRhaW5lcnMgd2ls
bCBwaWNrIHRoZW0gdXAuIElmIG5vdAo+IHBscyBwaW5nL3Jlc2VuZCBhbmQgSSdsbCBzdHVmZiBh
bGwgdGhlIHJlbWFpbmluZyBvbmVzIGludG8gZHJtLW1pc2MtbmV4dC4KClRoYW5rcywgd2lsbCBk
by4KCmdyZWcgay1oCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9y
ZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZl
bA==
