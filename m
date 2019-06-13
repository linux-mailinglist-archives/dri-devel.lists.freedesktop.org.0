Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FB02435C7
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jun 2019 14:16:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A360E8989C;
	Thu, 13 Jun 2019 12:16:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from honk.sigxcpu.org (honk.sigxcpu.org [24.134.29.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A50728989C
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jun 2019 12:16:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by honk.sigxcpu.org (Postfix) with ESMTP id 2CFFFFB03;
 Thu, 13 Jun 2019 14:16:18 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at honk.sigxcpu.org
Received: from honk.sigxcpu.org ([127.0.0.1])
 by localhost (honk.sigxcpu.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 30MbtHMVLbqC; Thu, 13 Jun 2019 14:16:17 +0200 (CEST)
Received: by bogon.sigxcpu.org (Postfix, from userid 1000)
 id BDC8A445F2; Thu, 13 Jun 2019 14:16:16 +0200 (CEST)
Date: Thu, 13 Jun 2019 14:16:16 +0200
From: Guido =?iso-8859-1?Q?G=FCnther?= <agx@sigxcpu.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH] panel: rocktech: no need to check return value of
 debugfs_create functions
Message-ID: <20190613121616.GA5339@bogon.m.sigxcpu.org>
References: <20190613115717.GB26335@kroah.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190613115717.GB26335@kroah.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: David Airlie <airlied@linux.ie>, Thierry Reding <thierry.reding@gmail.com>,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGksCk9uIFRodSwgSnVuIDEzLCAyMDE5IGF0IDAxOjU3OjE3UE0gKzAyMDAsIEdyZWcgS3JvYWgt
SGFydG1hbiB3cm90ZToKPiBXaGVuIGNhbGxpbmcgZGVidWdmcyBmdW5jdGlvbnMsIHRoZXJlIGlz
IG5vIG5lZWQgdG8gZXZlciBjaGVjayB0aGUKPiByZXR1cm4gdmFsdWUuICBUaGUgZnVuY3Rpb24g
Y2FuIHdvcmsgb3Igbm90LCBidXQgdGhlIGNvZGUgbG9naWMgc2hvdWxkCj4gbmV2ZXIgZG8gc29t
ZXRoaW5nIGRpZmZlcmVudCBiYXNlZCBvbiB0aGlzLgo+IAo+IENjOiAiR3VpZG8gR8O8bnRoZXIi
IDxhZ3hAc2lneGNwdS5vcmc+Cj4gQ2M6IFRoaWVycnkgUmVkaW5nIDx0aGllcnJ5LnJlZGluZ0Bn
bWFpbC5jb20+Cj4gQ2M6IERhdmlkIEFpcmxpZSA8YWlybGllZEBsaW51eC5pZT4KPiBDYzogRGFu
aWVsIFZldHRlciA8ZGFuaWVsQGZmd2xsLmNoPgo+IENjOiBkcmktZGV2ZWxAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnCj4gU2lnbmVkLW9mZi1ieTogR3JlZyBLcm9haC1IYXJ0bWFuIDxncmVna2hAbGlu
dXhmb3VuZGF0aW9uLm9yZz4KPiAtLS0KPiAgZHJpdmVycy9ncHUvZHJtL3BhbmVsL3BhbmVsLXJv
Y2t0ZWNoLWpoMDU3bjAwOTAwLmMgfCAxNCArKystLS0tLS0tLS0tLQo+ICAxIGZpbGUgY2hhbmdl
ZCwgMyBpbnNlcnRpb25zKCspLCAxMSBkZWxldGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEvZHJp
dmVycy9ncHUvZHJtL3BhbmVsL3BhbmVsLXJvY2t0ZWNoLWpoMDU3bjAwOTAwLmMgYi9kcml2ZXJz
L2dwdS9kcm0vcGFuZWwvcGFuZWwtcm9ja3RlY2gtamgwNTduMDA5MDAuYwo+IGluZGV4IGQ4OGVh
OGRhMmVjMi4uNmRjYjY5MmM0NzAxIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9wYW5l
bC9wYW5lbC1yb2NrdGVjaC1qaDA1N24wMDkwMC5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3Bh
bmVsL3BhbmVsLXJvY2t0ZWNoLWpoMDU3bjAwOTAwLmMKPiBAQCAtMjU3LDIwICsyNTcsMTIgQEAg
c3RhdGljIGludCBhbGxwaXhlbHNvbl9zZXQodm9pZCAqZGF0YSwgdTY0IHZhbCkKPiAgREVGSU5F
X1NJTVBMRV9BVFRSSUJVVEUoYWxscGl4ZWxzb25fZm9wcywgTlVMTCwKPiAgCQkJYWxscGl4ZWxz
b25fc2V0LCAiJWxsdVxuIik7Cj4gIAo+IC1zdGF0aWMgaW50IGpoMDU3bl9kZWJ1Z2ZzX2luaXQo
c3RydWN0IGpoMDU3biAqY3R4KQo+ICtzdGF0aWMgdm9pZCBqaDA1N25fZGVidWdmc19pbml0KHN0
cnVjdCBqaDA1N24gKmN0eCkKPiAgewo+IC0Jc3RydWN0IGRlbnRyeSAqZjsKPiAtCj4gIAljdHgt
PmRlYnVnZnMgPSBkZWJ1Z2ZzX2NyZWF0ZV9kaXIoRFJWX05BTUUsIE5VTEwpOwo+IC0JaWYgKCFj
dHgtPmRlYnVnZnMpCj4gLQkJcmV0dXJuIC1FTk9NRU07Cj4gIAo+IC0JZiA9IGRlYnVnZnNfY3Jl
YXRlX2ZpbGUoImFsbHBpeGVsc29uIiwgMDYwMCwKPiAtCQkJCWN0eC0+ZGVidWdmcywgY3R4LCAm
YWxscGl4ZWxzb25fZm9wcyk7Cj4gLQlpZiAoIWYpCj4gLQkJcmV0dXJuIC1FTk9NRU07Cj4gLQo+
IC0JcmV0dXJuIDA7Cj4gKwlkZWJ1Z2ZzX2NyZWF0ZV9maWxlKCJhbGxwaXhlbHNvbiIsIDA2MDAs
IGN0eC0+ZGVidWdmcywgY3R4LAo+ICsJCQkgICAgJmFsbHBpeGVsc29uX2ZvcHMpOwo+ICB9Cj4g
IAo+ICBzdGF0aWMgdm9pZCBqaDA1N25fZGVidWdmc19yZW1vdmUoc3RydWN0IGpoMDU3biAqY3R4
KQoKUmV2aWV3ZWQtYnk6IEd1aWRvIEfDvG50aGVyIDxhZ3hAc2lneGNwdS5vcmc+CgpUaGFua3Ms
CiAtLSBHdWlkbwoKPiAtLSAKPiAyLjIyLjAKPiAKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4v
bGlzdGluZm8vZHJpLWRldmVs
