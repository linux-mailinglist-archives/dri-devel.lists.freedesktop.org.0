Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A06111363B
	for <lists+dri-devel@lfdr.de>; Wed,  4 Dec 2019 21:15:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8749D6E9E7;
	Wed,  4 Dec 2019 20:14:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk3.altibox.net (asavdk3.altibox.net [109.247.116.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 350176E9E7
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Dec 2019 20:14:58 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk3.altibox.net (Postfix) with ESMTPS id 572C120067;
 Wed,  4 Dec 2019 21:14:54 +0100 (CET)
Date: Wed, 4 Dec 2019 21:14:52 +0100
From: Sam Ravnborg <sam@ravnborg.org>
To: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH] dt-bindings: display: Convert a bunch of panels to DT
 schema
Message-ID: <20191204201452.GA30193@ravnborg.org>
References: <20191119231309.18295-1-robh@kernel.org>
 <20191130194337.GE24722@ravnborg.org>
 <CAL_Jsq+AsCOQh89t1foJjDFFoQzfx5NythgdcbQGYNxRHRjB2A@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAL_Jsq+AsCOQh89t1foJjDFFoQzfx5NythgdcbQGYNxRHRjB2A@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=eMA9ckh1 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10 a=7gkXJVJtAAAA:8
 a=VwQbUJbxAAAA:8 a=zu6OG0ZhAAAA:8 a=pGLkceISAAAA:8 a=ak7PtswyECe1Mw--VqQA:9
 a=CjuIK1q_8ugA:10 a=E9Po1WZjFZOl8hwRPBS3:22 a=AjGcO6oz07-iQ99wixmX:22
 a=pAN39diAhXWuPx0-Vjn3:22
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
Cc: devicetree@vger.kernel.org, Chen-Yu Tsai <wens@csie.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgUm9iLgoKT24gTW9uLCBEZWMgMDIsIDIwMTkgYXQgMDg6Mzg6MzlBTSAtMDYwMCwgUm9iIEhl
cnJpbmcgd3JvdGU6Cj4gT24gU2F0LCBOb3YgMzAsIDIwMTkgYXQgMTo0MyBQTSBTYW0gUmF2bmJv
cmcgPHNhbUByYXZuYm9yZy5vcmc+IHdyb3RlOgo+ID4KPiA+IEhpIFJvYi4KPiA+Cj4gPiBUaGFu
a3MgZm9yIGRvaW5nIHRoaXMgYm9yaW5nLCB0cml2aWFsIGFuZCB0aXJlc29tZSB0YXNrLgo+IAo+
IEl0IHdhcyBzb21ld2hhdCBzY3JpcHRlZCBhdCBsZWFzdC4uLgo+IAo+ID4gT24gVHVlLCBOb3Yg
MTksIDIwMTkgYXQgMDU6MTM6MDlQTSAtMDYwMCwgUm9iIEhlcnJpbmcgd3JvdGU6Cj4gPiA+IENv
bnZlcnQgYWxsIHRoZSAnc2ltcGxlJyBwYW5lbHMgd2hpY2ggZWl0aGVyIHVzZSB0aGUgc2luZ2xl
Cj4gPiA+ICdwb3dlci1zdXBwbHknIHByb3BlcnR5IG9yIGRvbid0IHNheSBhbmQganVzdCByZWZl
cmVuY2UKPiA+ID4gc2ltcGxlLXBhbmVsLnR4dC4gSW4gdGhlIGxhdGVyIGNhc2UsIGJpbmRpbmdz
IGFyZSBjbGVhciBhcyB0byB3aGljaAo+ID4gPiBwcm9wZXJ0aWVzIGFyZSByZXF1aXJlZCBvciB1
bnVzZWQuCj4gPiA+Cj4gPiA+IENjOiBNYXhpbWUgUmlwYXJkIDxtcmlwYXJkQGtlcm5lbC5vcmc+
Cj4gPiA+IENjOiBDaGVuLVl1IFRzYWkgPHdlbnNAY3NpZS5vcmc+Cj4gPiA+IENjOiBUaGllcnJ5
IFJlZGluZyA8dGhpZXJyeS5yZWRpbmdAZ21haWwuY29tPgo+ID4gPiBDYzogU2FtIFJhdm5ib3Jn
IDxzYW1AcmF2bmJvcmcub3JnPgo+ID4gPiBTaWduZWQtb2ZmLWJ5OiBSb2IgSGVycmluZyA8cm9i
aEBrZXJuZWwub3JnPgo+ID4KPiA+IFNvIFRoaWVycnkgYW5kIEkgZW5kZWQgdXAgYXMgTWFpbnRp
YW5lcyBmb3IgdGhlbSBhbGwuCj4gPiBJIGd1ZXMgdGhhdHMgT0sgYXMgd2UgbG9vayBhZnRlciB0
aGUgcGFuZWwgc3R1ZmYgYW55d2F5Lgo+ID4KPiA+ID4gLS0tCj4gPiA+IFdlIGNvdWxkIHBlcmhh
cHMgY29uc29saWRhdGUgYSBidW5jaCBvZiB0aGVzZSwgYnV0IEkgaGF2ZSBubyBpZGVhIGhvdwo+
ID4gPiBhY2N1cmF0ZSBzb21lIG9mIHRoZXNlIGFyZSBXUlQgd2hhdCdzIHJlcXVpcmVkIG9yIG5v
dC4gU2VlbXMgc3RyYW5nZQo+ID4gPiB0aGF0ICdiYWNrbGlnaHQnIGlzIG9wdGlvbmFsIHVubGVz
cyB0aGUgYmFja2xpZ2h0IGlzIHRpZWQgZnVsbCBvbiBmb3IKPiA+ID4gZXhhbXBsZS4gSWYgdGhh
dCdzIHRoZSBjYXNlLCB0aGVuIHNob3VsZCBiYWNrbGlnaHQgZXZlciBiZSByZXF1aXJlZD8KPiA+
IEkgZG8gbm90IHJlYWxseSBmb2xsb3cgeW91IGhlcmUuCj4gPiBMb29raW5nIHRocm91Z2ggdGhl
IHBhdGNoIHNldCB0aGluZ3MgbG9va3Mgbm9ybWFsIHRvIG1lLgo+ID4KPiA+IFdoYXQgZG8gSSBt
aXNzIGhlcmU/Cj4gCj4gSSdtIHNheWluZyBhIGJ1bmNoIG9mIHRoZXNlIGNvdWxkIGp1c3QgYmUg
YSBzaW5nbGUgc2NoZW1hIGRvYyB3aXRoIGEKPiBsb25nIGxpc3Qgb2YgY29tcGF0aWJsZXMuIFRo
ZSB2YXJpYXRpb24gaXMgaW4gd2hhdCBwcm9wZXJ0aWVzIGFyZQo+IHJlcXVpcmVkIG9yIG5vdC4K
Ckl0IHdvdWxkIGJlIGp1c3Qgd29uZGVyZnVsIGlmIHdlIGNvdWxkIGhhdmUgb25seSBhIGZldwpk
dC1iaW5kaW5ncyBmb3IgdGhlIHNpbXBsZSBwYW5lbHMuCkxpa2UgeW91IEkgY2Fubm90IHNlZSB3
aHkgZW5hYmxlLWdwaW9zIHNob3VsZCBiZSByZXF1aXJlZC4KCldlIGNvdWxkIGVuZCB1cCB3aXRo
IHNvbWV0aGluZyBsaWtlIHRocmVlIGNsYXNzZXMgb2YgYmluZGluZ3M6CgorcmVxdWlyZWQ6Cisg
IC0gY29tcGF0aWJsZQorICAtIHBvd2VyLXN1cHBseQoKK3JlcXVpcmVkOgorICAtIGNvbXBhdGli
bGUKKyAgLSBwb3J0CisgIC0gcG93ZXItc3VwcGx5CgorcmVxdWlyZWQ6CisgIC0gYmFja2xpZ2h0
CisgIC0gY29tcGF0aWJsZQorICAtIHBvcnQKKyAgLSBwb3dlci1zdXBwbHkKClRoZSBwb3J0IHBh
cnQgaXMgdG8gbXkgYmVzdCB1bmRlcnN0YW5kaW5nIGEgd2F5IHRvCmNvbm5lY3QgdGhlIHBhbmVs
IHRvIHRoZSBkaXNwbGF5IGRyaXZlci4KU28gaXQgc2hvdWxkIGJlIG1vcmUgaG93IHRoZSBjb25u
ZWN0IGluIHRoZSBiaW5kaW5nCnRoYXQgZGVjaWRlcyBpZiBwb3J0IGlzIHVzZWQgb3Igbm90LgpB
bmQgdGhlIHBhbmVsIHNob3VsZCBub3QgcmVxdWlyZSBpdC4KCkkgbWF5IHVzZSBpdCB3aXRoIGRp
c3BsYXkgZHJpdmVycyB0aGF0IGRvIG5vdCBzdXBwb3J0IGl0CmluIHRoZWlyIGJpbmRpbmcuCgpB
bmQgdGhlbiB3ZSBoYXZlIGJhY2tsaWdodCAtIHdoaWNoIGNhbiBoYXJkbHkgYmUgbWFuZGF0b3J5
LgpUaGUgcGFuZWwgY291bGQgaGFyZC13aXJlIGl0IHRvIHByb3ZpZGUgYmFja2xpZ3QgaWYgaXQg
d2FudGVkCmFuZCB0aGUgYmluZGluZyBzaG91bGQgY29udGludWUgdG8gd29yay4KSSB0aGluayB5
b3UgaGFkIHRoZSBzYW1lIGFyZ3VtZW50LgoKU28gd2UgYXJlIGRvd24gdG8gdHdvIHJlcXVpcmVk
IHByb3BlcnRpZXM6CityZXF1aXJlZDoKKyAgLSBjb21wYXRpYmxlCisgIC0gcG93ZXItc3VwcGx5
CgpDb3VsZCB3ZSBwdXQgYWxsIHNpbXBsZSBwYW5lbHMgaW4gb25lIGJpbmRpbmcgZmlsZQp3aXRo
IG9ubHkgdGhpcyAtIHRoYXQgd291bGQgYmUgZ3JlYXQuCkhvcGVmdWxseSBzY3JpcHRlZCBzb21l
aG93Li4uCgpUaGVuIGFkZGluZyBuZXcgc2ltcGxlIHBhbmVscyB3b3VsZCBiZSBhIG1hdHRlciBv
ZgphZGRpbmcgYSBuZXcgY29tcGF0aWJsZS4KQW5kIGlmIHRoZXkgYXJlIHNvcnRlZCB0aGlzIHNo
b3VsZCBub3QgY2F1c2UgbWFueSBtZXJnZSBpc3N1ZXMgZWl0aGVyLgoKSSBob3BlIEkgdW5kZXJz
dG9vZCB5b3UgY29ycmVjdC4KCglTYW0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGlu
Zm8vZHJpLWRldmVs
