Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D9805D7E7D
	for <lists+dri-devel@lfdr.de>; Tue, 15 Oct 2019 20:09:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 61AF36E39B;
	Tue, 15 Oct 2019 18:09:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F27B6E39B
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Oct 2019 18:09:15 +0000 (UTC)
Received: from localhost (unknown [38.98.37.135])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id EB50520659;
 Tue, 15 Oct 2019 18:09:11 +0000 (UTC)
Date: Tue, 15 Oct 2019 20:05:03 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH v2 00/15] DRM fbconv helpers for converting fbdev drivers
Message-ID: <20191015180503.GA1082328@kroah.com>
References: <20191014140416.28517-1-tzimmermann@suse.de>
 <20191015143318.GP11828@phenom.ffwll.local>
 <5241e699-f66a-d212-03a5-bb736639e66b@suse.de>
 <CAKMK7uGTAxYNhS7TqEFVA+Gd+-4WOMq7JXPZRF8_a9EP69TkTQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAKMK7uGTAxYNhS7TqEFVA+Gd+-4WOMq7JXPZRF8_a9EP69TkTQ@mail.gmail.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1571162955;
 bh=pfUcHAJ+PNF6T1BeIRAUUlIhaxPXRX2OzwJOiZJxCiY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=iOC5Xt+rh/f4SvYnv84KHqDtWWXkZsJuTyPboILtGfFJ0uTH1WcfFa5wuzccHNWiz
 wYAnI2QI4pyuMtTiJNUgNn26QGP8B+seze9XXzur6GhDEVxkZumUVxjaJBlg3PJFPQ
 sUxgxzK/aDDOvqzita5ZbL9ZpnZYXloVwgxCv4i4=
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
Cc: Linux Fbdev development list <linux-fbdev@vger.kernel.org>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Dave Airlie <airlied@linux.ie>,
 Michel =?iso-8859-1?Q?D=E4nzer?= <michel@daenzer.net>,
 Jonathan Corbet <corbet@lwn.net>, Mathieu Malaterre <malat@debian.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBPY3QgMTUsIDIwMTkgYXQgMDc6NDg6MjlQTSArMDIwMCwgRGFuaWVsIFZldHRlciB3
cm90ZToKPiBPbiBUdWUsIE9jdCAxNSwgMjAxOSBhdCA3OjI4IFBNIFRob21hcyBaaW1tZXJtYW5u
IDx0emltbWVybWFubkBzdXNlLmRlPiB3cm90ZToKPiA+Cj4gPiBIaSBEYW5pZWwKPiA+Cj4gPiBB
bSAxNS4xMC4xOSB1bSAxNjozMyBzY2hyaWViIERhbmllbCBWZXR0ZXI6Cj4gPiA+IEhpIFRob21h
cywKPiA+ID4KPiA+ID4gT24gTW9uLCBPY3QgMTQsIDIwMTkgYXQgMDQ6MDQ6MDFQTSArMDIwMCwg
VGhvbWFzIFppbW1lcm1hbm4gd3JvdGU6Cj4gPiA+PiAod2FzOiBEUk0gZHJpdmVyIGZvciBmYmRl
diBkZXZpY2VzKQo+ID4gPj4KPiA+ID4+IFRoaXMgaXMgdmVyc2lvbiAyIG9mIHRoZSBmYmRldiBj
b252ZXJzaW9uIGhlbHBlcnMuIEl0J3MgbW9yZSBvciBsZXNzIGEKPiA+ID4+IHJld3JpdGUgb2Yg
dGhlIG9yaWdpbmFsIHBhdGNoc2V0Lgo+ID4gPj4KPiA+ID4+IFRoZSBmYmRldiBzdWJzeXN0ZW0g
aXMgY29uc2lkZXJlZCBsZWdhY3kgYW5kIHdpbGwgcHJvYmFibHkgYmUgcmVtb3ZlZCBhdAo+ID4g
Pj4gc29tZSBwb2ludC4gVGhpcyB3b3VsZCBtZWFuIHRoZSBsb3NzIG9mIGEgc2lnbmlmYW5jdCBu
dW1iZXIgb2YgZHJpdmVycy4KPiA+ID4+IFNvbWUgb2YgdGhlIGFmZmVjdGVkIGhhcmR3YXJlIGlz
IG5vdCBpbiB1c2UgYW55IGxvbmdlciwgYnV0IHNvbWUgaGFyZHdhcmUKPiA+ID4+IGlzIHN0aWxs
IGFyb3VuZCBhbmQgcHJvdmlkZXMgZ29vZCgtZW5vdWdoKSBmcmFtZWJ1ZmZlcnMuCj4gPiA+Pgo+
ID4gPj4gVGhlIGZiY29udiBoZWxwZXJzIGFsbG93IGZvciBydW5uaW5nIHRoZSBjdXJyZW50IERS
TSBzdGFjayBvbiB0b3Agb2YgZmJkZXYKPiA+ID4+IGRyaXZlcnMuIEl0J3MgYSBzZXQgb2YgZnVu
Y3Rpb25zIHRoYXQgY29udmVydCBiZXR3ZWVuIGZiZGV2IGludGVyZmFjZXMgYW5kCj4gPiA+PiBE
Uk0gaW50ZXJmYWNlcy4gQmFzZWQgb24gU0hNRU0gYW5kIHNpbXBsZSBLTVMgaGVscGVycywgaXQg
b25seSBvZmZlcnMgdGhlCj4gPiA+PiBiYXNpYyBmdW5jdGlvbmFsaXR5IG9mIGEgZnJhbWVidWZm
ZXIsIGJ1dCBzaG91bGQgYmUgY29tcGF0aWJsZSB3aXRoIG1vc3QKPiA+ID4+IGV4aXN0aW5nIGZi
ZGV2IGRyaXZlcnMuCj4gPiA+Pgo+ID4gPj4gQSBEUk0gZHJpdmVyIHVzaW5nIGZiY29udiBoZWxw
ZXJzIGNvbnNpc3RzIG9mCj4gPiA+Pgo+ID4gPj4gICAqIERSTSBzdHViIGNvZGUgdGhhdCBjYWxs
cyBpbnRvIGZiY29udiBoZWxwZXJzLCBhbmQKPiA+ID4+ICAgKiB0aGUgb3JpZ2luYWwgZmJkZXYg
ZHJpdmVyIGNvZGUuCj4gPiA+Pgo+ID4gPj4gVGhlIGZiZGV2IGRyaXZlciBjb2RlIGhhcyB0byBi
ZSBtb2RpZmllZCB0byByZWdpc3RlciBpdHNlbGYgd2l0aCB0aGUKPiA+ID4+IHN0dWIgZHJpdmVy
IGluc3RlYWQgb2YgdGhlIGZiZGV2IGNvcmUgZnJhbWV3b3JrLiBBIHR1dG9yaWFsIG9uIGhvdyB0
byB1c2UKPiA+ID4+IHRoZSBoZWxwZXJzIGlzIHBhcnQgb2YgdGhpcyBwYXRjaHNldC4gVGhlIHJl
c3VsdGluZyBkcml2ZXIgaHlicmlkIGNhbiBiZQo+ID4gPj4gcmVmYWN0b3JlZCBpbnRvIGEgZmly
c3QtY2xhc3MgRFJNIGRyaXZlci4gVGhlIGZiY29udiBoZWxwZXJzIGNvbnRhaW4gYQo+ID4gPj4g
bnVtYmVyIG9mIGNvbW1lbnRzLCBsYWJlbGVkICdEUk0gcG9ydGluZyBub3RlJywgd2hpY2ggZXhw
bGFpbiB0aGUgcmVxdWlyZWQKPiA+ID4+IHN0ZXBzLgo+ID4gPj4KPiA+ID4+IEkgdGVzdGVkIHRo
ZSBjdXJyZW50IHBhdGNoc2V0IHdpdGggdGhlIGZvbGxvd2luZyBkcml2ZXJzOiBhdHlmYiwgYXR5
MTI4ZmIsCj4gPiA+PiBtYXRyb3hmYiwgcG0yZmIsIHBtM2ZiLCByaXZhZmIsIHMzZmIsIHNhdmFn
ZWZiLCBzaXNmYiwgdGRmeGZiIGFuZCB0cmlkZW50ZmIuCj4gPiA+PiBXaXRoIGVhY2gsIEkgd2Fz
IGFibGUgdG8gc3VjY2Vzc2Z1bGx5IHN0YXJ0IHdpdGggZmJjb24gZW5hYmxlZCwgcnVuIHdlc3Rv
biBhbmQKPiA+ID4+IFgxMS4gVGhlIGRyaXZlcnMgYXJlIGF2YWlsYWJsZSBhdCBbMV0uIEZvciBy
ZWZlcmVuY2UsIHRoZSBwYXRjaHNldCBpbmNsdWRlcwo+ID4gPj4gdGhlIE1hdHJveCBzdHViIGRy
aXZlci4KPiA+ID4KPiA+ID4gU28gSSByZWFsbHkgZG9uJ3Qgd2FudCB0byByYWluIG9uIHRoZSBw
YXJhZGUgaGVyZSwgc2luY2UgaWYgeW91IHRoaW5rIHRoaXMKPiA+ID4gaXMgdXNlZnVsIHdoZW4g
Y29udmVydGluZyBmYmRldiBkcml2ZXJzIEknbGwgYnV5IHRoYXQsIGFuZCBJJ20gYWxsIGZvcgo+
ID4gPiBnZXR0aW5nIG1vcmUgbW9kZXJuIGRyaXZlcnMgaW50byBkcm0uCj4gPiA+Cj4gPiA+IEJ1
dCBJIGhhdmUgYSBidW5jaCBvZiBjb25jZXJucyB3aXRoIHRoZSBhcHByb2FjaCB5b3UncmUgcHJv
cG9zaW5nIGhlcmU6Cj4gPiA+Cj4gPiA+IC0gd2UndmUgdHJpZWQgc3RhZ2luZyBmb3IgZHJtIGRy
aXZlciByZWZhY3RvcmluZywgaXQgaHVydHMuIFNlcGFyYXRlIHRyZWUKPiA+ID4gICBwbHVzIHRo
ZSBxdWljayBwYWNlIGluIHJlZmFjdG9yaW5nIGNyZWF0ZSBsb3RzIG9mIHBhaW5zLiBBbmQgZm9y
IHNtYWxsCj4gPiA+ICAgZHJpdmVycyByZWZhY290b3JpbmcgYmVmb3JlIGl0J3Mgbm90IGJ1eWlu
ZyB5b3UgYW55dGhpbmcgYWJvdmUKPiA+ID4gICByZWZhY3RvcmluZyBpbiB5b3VyIG93biBwZXJz
b25hbCB0cmVlLiBBbmQgZm9yIGJpZyBkcml2ZXJzIHdlJ3JlIGZhaXJseQo+ID4gPiAgIGxlbmll
bnQgd2l0aCBtZXJnaW5nIGRyaXZlcnMgdGhhdCBhcmVuJ3QgZnVsbHkgcG9saXNoZWQgeWV0LCBp
ZiB0aGVyZSdzCj4gPiA+ICAgYSB0ZWFtIHNlcmlvdXMgZW5vdWdoIHdpdGggY2xlYW5pbmcgdXAg
dGhlIG1lc3MuIEkgdGhpbmsgZXZlbiBtZXJnaW5nCj4gPiA+ICAgcGFydGlhbCBkcml2ZXJzIGRp
cmVjdGx5IHVuZGVyIGRyaXZlcnMvZ3B1IChidXQgYmVoaW5kIENPTkZJR19CUk9LRU4pIGlzCj4g
PiA+ICAgYmV0dGVyIHRoYW4gc3RhZ2luZy4KPiA+Cj4gPiBJIG1vc3RseSBwdXQgdGhpcyBpbnRv
IHN0YWdpbmcsIGJlY2F1c2UgaXQncyB0aGUga2luZCBvZiBjb2RlIHlvdSdkCj4gPiBleHBlY3Qg
dGhlcmUuCj4gCj4gWWVhaCwgZXhjZXB0IHdlIHRyaWVkLCBpdCdzIGEgcmVhbCBwYWluLiBDb25j
bHVzaW9uIGJ5IGV2ZXJ5b25lCj4gaW52b2x2ZWQgaXMgdGhhdCBzdGFnaW5nIGRvZXNuJ3Qgd29y
ayBmb3IgdGhlIGRybSBzdWJzeXN0ZW0uCgpBcyB0aGUgc3RhZ2luZyBtYWludGFpbmVyLCBJIHRv
byBhZ3JlZSB3aXRoIHRoaXMuICBObyBkcm0gZHJpdmVycy9jb2RlCmluIHN0YWdpbmcgcGxlYXNl
LgoKdGhhbmtzLAoKZ3JlZyBrLWgKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8v
ZHJpLWRldmVs
