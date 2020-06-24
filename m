Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 45C99207901
	for <lists+dri-devel@lfdr.de>; Wed, 24 Jun 2020 18:24:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 785836E0A2;
	Wed, 24 Jun 2020 16:24:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk4.altibox.net (asavdk4.altibox.net [109.247.116.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 068A26E0A2
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Jun 2020 16:24:50 +0000 (UTC)
Received: from ravnborg.org (unknown [188.228.123.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk4.altibox.net (Postfix) with ESMTPS id E18FD806BA;
 Wed, 24 Jun 2020 18:24:47 +0200 (CEST)
Date: Wed, 24 Jun 2020 18:24:46 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH 0/8] Fix a bunch of W=1 warnings in Backlight
Message-ID: <20200624162446.GA1815586@ravnborg.org>
References: <20200624145721.2590327-1-lee.jones@linaro.org>
 <20200624153216.GA1814806@ravnborg.org>
 <20200624154321.GH954398@dell>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200624154321.GH954398@dell>
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=G88y7es5 c=1 sm=1 tr=0
 a=S6zTFyMACwkrwXSdXUNehg==:117 a=S6zTFyMACwkrwXSdXUNehg==:17
 a=IkcTkHD0fZMA:10 a=7gkXJVJtAAAA:8 a=KKAkSRfTAAAA:8
 a=9V60zPr9lzPatE790UIA:9 a=QEXdDO2ut3YA:10 a=E9Po1WZjFZOl8hwRPBS3:22
 a=cvBusfyB2V15izCimMoJ:22
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
Cc: daniel.thompson@linaro.org, jingoohan1@gmail.com,
 linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgTGVlLgoKT24gV2VkLCBKdW4gMjQsIDIwMjAgYXQgMDQ6NDM6MjFQTSArMDEwMCwgTGVlIEpv
bmVzIHdyb3RlOgo+IE9uIFdlZCwgMjQgSnVuIDIwMjAsIFNhbSBSYXZuYm9yZyB3cm90ZToKPiAK
PiA+IEhpIExlZS4KPiA+IAo+ID4gT24gV2VkLCBKdW4gMjQsIDIwMjAgYXQgMDM6NTc6MTNQTSAr
MDEwMCwgTGVlIEpvbmVzIHdyb3RlOgo+ID4gPiBBdHRlbXB0aW5nIHRvIGNsZWFuLXVwIFc9MSBr
ZXJuZWwgYnVpbGRzLCB3aGljaCBhcmUgY3VycmVudGx5Cj4gPiA+IG92ZXJ3aGVsbWluZ2x5IHJp
ZGRsZWQgd2l0aCBuaWdnbHkgbGl0dGxlIHdhcm5pbmdzLgo+ID4gPiAKPiA+ID4gTGVlIEpvbmVz
ICg4KToKPiA+ID4gICBiYWNrbGlnaHQ6IGxtczUwMWtmMDM6IFJlbW92ZSB1bnVzZWQgY29uc3Qg
dmFyaWFibGVzCj4gPiA+ICAgYmFja2xpZ2h0OiBsY2Q6IEFkZCBtaXNzaW5nIGtlcm5lbGRvYyBl
bnRyeSBmb3IgJ3N0cnVjdCBkZXZpY2UgcGFyZW50Jwo+ID4gCj4gPiAKPiA+ID4gICBiYWNrbGln
aHQ6IGlsaTkyMng6IEFkZCBtaXNzaW5nIGtlcm5lbGRvYyBkZXNjcmlwdGlvbnMgZm9yCj4gPiA+
ICAgICBDSEVDS19GUkVRX1JFRygpIGFyZ3MKPiA+ID4gICBiYWNrbGlnaHQ6IGlsaTkyMng6IFJl
bW92ZSBpbnZhbGlkIHVzZSBvZiBrZXJuZWxkb2Mgc3ludGF4Cj4gPiA+ICAgYmFja2xpZ2h0OiBp
bGk5MjJ4OiBBZGQgbWlzc2luZyBrZXJuZWxkb2MgZGVzY3JpcHRpb24gZm9yCj4gPiA+ICAgICBp
bGk5MjJ4X3JlZ19kdW1wKCkncyBhcmcKPiA+IEkgd29uZGVyIHdoeSB0aGVzZSB3YXJuaW5ncyBz
aG93IHVwIGFzIG5vdGhpbmcgcHVsbHMgaW4gdGhpcyAuYyBmaWxlLgo+ID4gQW55d2F5IEkgd291
bGQgc3VnZ2VzdCB0byBkcm9wIHVzaW5nIGtlcm5lbGRvYyBzeW50YXggZm9yIHNpbmdsZSBkcml2
ZXJzCj4gPiBsaWtlIHRoaXMgLSBhbmQgdGhlIGJlbmVmaXQgaGVyZSBpcyBsb3cuCj4gPiBOb3cg
dGhleSBhcmUgdHlwZWQsIG90aGVyd2lzZSB0aGlzIGFoZCBiZWVuIGZpbmUgaW4gYSBzaW5nbGUg
cGF0Y2guCj4gCj4gV2hhdCBkbyB5b3UgbWVhbiBieSAnbm90aGluZyBwdWxscyBpdCBpbic/ClRo
ZXJlIGFyZSBubyAucnN0IGZpbGVzIHRoYXQgaW5jbHVkZXMgYW55OgouLiBrZXJuZWwtZG9jOjog
ZHJpdmVycy92aWRlby9iYWNrbGlnaHQvaWxpOTIyeC5jCgpzbyBJIGRvIG5vdCBzZWUgaG93IHRo
ZSBrZXJuZWwtZG9jIGNvbW1lbnRzIHdpbGwgYmUgdXNlZCBieSBhbnkKb2YgdGhlIGdlbmVyYXRl
ZCBrZXJuZWwtZG9jcy4KCglTYW0KCj4gCj4gPiA+ICAgYmFja2xpZ2h0OiBiYWNrbGlnaHQ6IFN1
cHBseSBkZXNjcmlwdGlvbiBmb3IgZnVuY3Rpb24gYXJncyBpbiBleGlzdGluZwo+ID4gPiAgICAg
S2VybmVsZG9jcwo+ID4gPiAgIGJhY2tsaWdodDogbG0zNjMwYV9ibDogUmVtb3ZlIGludmFsaWQg
Y2hlY2tzIGZvciB1bnNpZ25lZCBpbnQgPCAwCj4gPiA+ICAgYmFja2xpZ2h0OiBxY29tLXdsZWQ6
IFJlbW92ZSB1bnVzZWQgY29uZmlncyBmb3IgTEVEMyBhbmQgTEVENAo+ID4gCj4gPiBUaGUgb3Ro
ZXIgZml4ZXMgbG9va3MgZ29vZC4KPiA+IFRoZXkgYXJlIGFsbDoKPiA+IEFja2VkLWJ5OiBTYW0g
UmF2bmJvcmcgPHNhbUByYXZuYm9yZy5vcmc+Cj4gCj4gVGhhbmtzIChhbHRob3VnaCB0aGlzIHNo
b3VsZCBiZSBSZXZpZXdlZC1ieSkuCj4gCj4gPiA+ICBkcml2ZXJzL3ZpZGVvL2JhY2tsaWdodC9i
YWNrbGlnaHQuYyAgfCAyICsrCj4gPiA+ICBkcml2ZXJzL3ZpZGVvL2JhY2tsaWdodC9pbGk5MjJ4
LmMgICAgfCA4ICsrKysrKy0tCj4gPiA+ICBkcml2ZXJzL3ZpZGVvL2JhY2tsaWdodC9sY2QuYyAg
ICAgICAgfCAxICsKPiA+ID4gIGRyaXZlcnMvdmlkZW8vYmFja2xpZ2h0L2xtMzYzMGFfYmwuYyB8
IDQgKystLQo+ID4gPiAgZHJpdmVycy92aWRlby9iYWNrbGlnaHQvbG1zNTAxa2YwMy5jIHwgOCAt
LS0tLS0tLQo+ID4gPiAgZHJpdmVycy92aWRlby9iYWNrbGlnaHQvcWNvbS13bGVkLmMgIHwgOCAt
LS0tLS0tLQo+ID4gPiAgNiBmaWxlcyBjaGFuZ2VkLCAxMSBpbnNlcnRpb25zKCspLCAyMCBkZWxl
dGlvbnMoLSkKPiA+ID4gCj4gCj4gLS0gCj4gTGVlIEpvbmVzIFvmnY7nkLzmlq9dCj4gU2VuaW9y
IFRlY2huaWNhbCBMZWFkIC0gRGV2ZWxvcGVyIFNlcnZpY2VzCj4gTGluYXJvLm9yZyDilIIgT3Bl
biBzb3VyY2Ugc29mdHdhcmUgZm9yIEFybSBTb0NzCj4gRm9sbG93IExpbmFybzogRmFjZWJvb2sg
fCBUd2l0dGVyIHwgQmxvZwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3Rv
cC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmkt
ZGV2ZWwK
